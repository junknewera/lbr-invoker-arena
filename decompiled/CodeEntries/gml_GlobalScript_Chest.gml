function Chest(arg0) : Collectable_Usable_Object(arg0) constructor
{
    button_use_width = gui_col_x(3);
    button_use_width_multi = button_use_width;
    multiple_use = true;
    section = global.dialog_sections.chests.general;
    
    activate = function(arg0 = 1, arg1 = true, arg2 = get_empty_result_struct())
    {
        if (arg0 == 0)
        {
            exit;
        }
        var loop_count = 10;
        var count_per_loop = floor((arg0 - 1) / loop_count);
        var current_chest_count = min(self.data.count, arg0);
        var use_seed = false;
        if (mp_is_season() && is_numeric(global.current_challenge.challenge_seed))
        {
            use_seed = true;
            random_set_seed(o_game.data.stats.chests_opened);
        }
        if (arg0 > 1 && count_per_loop >= 1)
        {
            repeat (loop_count)
            {
                self.get_reward(arg2, count_per_loop);
                current_chest_count -= count_per_loop;
            }
            var chest_count_loop = current_chest_count - (count_per_loop * loop_count);
            if (chest_count_loop > 0)
            {
                self.get_reward(arg2, chest_count_loop);
            }
        }
        else
        {
            self.get_reward(arg2, arg0);
        }
        o_game.data.stats.chests_opened += arg0;
        if (use_seed)
        {
            random_set_seed(global.current_challenge.challenge_seed);
        }
        if (!arg1)
        {
            exit;
        }
        add_result(arg2, "", 
        {
            title: self.name
        }, !get_option(global.options.show_reward_dialogs), true);
        if (!get_option(global.options.show_reward_dialogs))
        {
            notify(__s("%s %s opened.", arg0, pluralize(arg0, __("item"), __("items"))));
        }
    };
    
    can_activate = function()
    {
        return true;
    };
    
    get_reward = function(arg0 = get_empty_result_struct(), arg1 = 1)
    {
        var v = 2;
        var available_chest_leaves = get_available_chest_leaves();
        var available_seeds_keys = get_available_seed_keys();
        var offline_seed_count = get_upgrade_attribute_value(global.upgrade_attributes.offline_seeds);
        var __array = self.reward;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            repeat (mitem.count)
            {
                if (mitem.type == "resources_leaves")
                {
                    if (v == 1)
                    {
                        var offline_rewards = get_offline_rewards(random_range(60 * mitem.offline_count, 60 * mitem.offline_count * 2) * arg1, false, true, false, true);
                        var res_key = struct_random_key(offline_rewards.resources);
                        if (is_undefined(res_key))
                        {
                            continue;
                        }
                        add_to_struct_value(arg0.resources, res_key, variable_struct_get(offline_rewards.resources, res_key));
                    }
                    else
                    {
                        var resource = array_random_item(available_chest_leaves);
                        var value = round(get_leaf_reward_offline_value(resource, random_range(60 * mitem.offline_count, 60 * mitem.offline_count * 2) * arg1));
                        if (is_struct(variable_struct_get(available_seeds_keys, resource.key)))
                        {
                            var offline_seed_amount = round(floor((mitem.offline_count / 60) * offline_seed_count));
                            var seed_value = get_seed_value(resource, offline_seed_amount);
                            value += seed_value;
                        }
                        add_to_struct_value(arg0.resources, resource.key, value);
                    }
                }
                else if (mitem.type == "resources_gem_leaves")
                {
                    var unlocked_gem_leaves = global.resources_gem_leaves;
                    if (array_length(unlocked_gem_leaves) > 0)
                    {
                        var gem_leaf_res = array_random_item(unlocked_gem_leaves);
                        var count = power(10, mitem.offline_count) * arg1;
                        add_to_struct_value(arg0.resources, gem_leaf_res.key, count);
                    }
                }
                else if (mitem.type == "resources_misc")
                {
                    var safety_index = 0;
                    var resource_misc;
                    do
                    {
                        resource_misc = array_random_item(mitem.collection);
                        safety_index++;
                    }
                    until (is_undefined(variable_struct_get(arg0.resources, resource_misc.key)) || safety_index >= 100);
                    var value_min, value_max;
                    if (!is_undefined(variable_struct_get(resource_misc.chest_values, self.key)))
                    {
                        value_min = variable_struct_get(resource_misc.chest_values, self.key).min;
                        value_max = variable_struct_get(resource_misc.chest_values, self.key).max;
                    }
                    else if (resource_misc.chest_value_base != 0)
                    {
                        var progressive_value = get_progressive_value(self.rarity_index - 1, resource_misc.chest_value_base, resource_misc.chest_value_minmax_multiplier, resource_misc.chest_value_rarity_multiplier);
                        value_min = progressive_value.min;
                        value_max = progressive_value.max;
                    }
                    else
                    {
                        value_min = 1000 * resource_misc.print_value_multiplier;
                        value_max = 5000 * resource_misc.print_value_multiplier;
                    }
                    var value = ceil(random_range(value_min, value_max)) * arg1;
                    add_to_struct_value(arg0.resources, resource_misc.key, value);
                }
                else if (mitem.type == "other")
                {
                    var other_res_array = array_random_item(mitem.collection);
                    var other_filtered_items = array_filter_custom(other_res_array, "check_max_count");
                    var res_item = array_random_item(other_filtered_items);
                    if (!is_struct(res_item))
                    {
                        continue;
                    }
                    switch (res_item.game_item_type)
                    {
                        case UnknownEnum.Value_1:
                            add_to_struct_value(arg0.artifacts, res_item.key, arg1);
                            break;
                        case UnknownEnum.Value_3:
                            variable_struct_set(arg0.community_leaves, res_item.key, 1);
                            break;
                        case UnknownEnum.Value_5:
                            add_to_struct_value(arg0.equipment, res_item.key, arg1);
                            break;
                        case UnknownEnum.Value_12:
                            add_to_struct_value(arg0.scrolls, res_item.key, arg1);
                            break;
                    }
                }
                else if (mitem.type == "materials")
                {
                    var material = array_random_item(mitem.collection);
                    add_to_struct_value(arg0.materials, material.key, 1);
                }
            }
        }
        return arg0;
    };
    
    get_name = function()
    {
        if (!self.data.unlocked)
        {
            return "?";
        }
        var name = sprintf("%s [%s]", get_value_ext(self, self.name, false), number_format(self.data.count));
        return name;
    };
    
    get_description = function()
    {
        if (!self.data.unlocked)
        {
            return "?";
        }
        var desc = get_value_ext(self, self.description, false);
        return desc;
    };
    
    set_local_vars(arg0);
    set_sprite_data(self);
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_3 = 3,
    Value_5 = 5,
    Value_12 = 12
}
