function Borbventure(arg0 = undefined) constructor
{
    name = "Borbventure";
    description = "";
    sprite = spr_borb;
    borbs = [];
    rarity = undefined;
    refresh_cost = {};
    reward_cache = undefined;
    start_res_cache = undefined;
    type = undefined;
    data = 
    {
        ascend_level: 0,
        borb_ids: [],
        chance: 0,
        chance_final: 0,
        exclusive_classes: [],
        finish_time: 0,
        id: -1,
        level: 1,
        locked: false,
        rarity_key: undefined,
        reward: undefined,
        seed: random(100000),
        start_res: undefined,
        started: false,
        success: undefined,
        success_set: false,
        type_key: undefined
    };
    
    init = function()
    {
        var borbventure_borbs_size = self.get_participants_count();
        self.borbs = [];
        repeat (borbventure_borbs_size)
        {
            array_push(self.borbs, undefined);
        }
        var __array = self.data.borb_ids;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            array_set(self.borbs, __i, get_array_item_by_id(global.borbventures.items.borbs, mitem));
        }
        self.refresh_cost.borb_juice = 10 + power(self.data.level * 5, 1.25);
        self.set_type();
        self.set_reward();
    };
    
    auto_fill = function()
    {
        var part_count = self.get_participants_count();
        var exclude_borbs = [];
        for (var i = 0; i < part_count; i++)
        {
            if (is_struct(self.borbs[i]))
            {
                continue;
            }
            var borb = global.borbventures.get_next_available_borb(undefined, undefined, undefined, exclude_borbs);
            if (!is_struct(borb))
            {
                continue;
            }
            self.change_borb(borb, i);
            array_push(exclude_borbs, borb);
        }
    };
    
    create = function()
    {
        self.data.level = global.borbventures.get_random_borbventure_level();
        var raw_level = self.data.level;
        if (self.data.level > global.game_settings.borbventure_max_borbventure_level)
        {
            self.data.ascend_level = floor(self.data.level / global.game_settings.borbventure_max_borbventure_level);
            self.data.level -= self.data.ascend_level * 60;
        }
        var rarity_level = global.borbventures.get_rarity_level(self.data.level);
        var rarity = global.borbventures.get_borbventure_rarity(rarity_level);
        var type = global.borbventures.get_random_type(rarity_level);
        var max_rarity = get_default_struct_value(type, "max_rarity", global.borbventures.borb_levels.legendary);
        if (rarity_level > max_rarity.level)
        {
            rarity = max_rarity;
            rarity_level = max_rarity.level;
        }
        self.data.rarity_key = rarity.key;
        self.data.type_key = type.key;
        self.data.id = o_game.data.borbventure_id_counter;
        o_game.data.borbventure_id_counter++;
        var exclusive_chance = 0.01;
        if (percent_chance(exclusive_chance))
        {
            var random_class = array_random_item(global.borbventures.borb_types_array);
        }
        self.set_type();
        self.data.start_res = self.get_start_resources();
        self.data.reward = self.type.reward(raw_level, self.rarity, self.data.ascend_level);
        var min_chance = 10;
        var max_chance = 60;
        self.data.chance = 50;
        self.init();
        if (!is_undefined(struct_get_from_hash(self.type, variable_get_hash("after_generate"))))
        {
            self.type.after_generate(self);
        }
    };
    
    can_add_item_reward = function()
    {
        var existing_item = global.borbventures.find_item(self.data.type_key, self.data.rarity_key);
        if (is_struct(existing_item))
        {
            return true;
        }
        else if (!global.borbventures.has_free_inventory_space())
        {
            return false;
        }
        return true;
    };
    
    can_cancel = function()
    {
        if (!self.is_started())
        {
            return false;
        }
        return true;
    };
    
    can_finish = function()
    {
        if (!self.is_started())
        {
            return false;
        }
        if (self.has_item_reward() && !self.can_add_item_reward())
        {
            return false;
        }
        return o_game.data.stats.time_elapsed >= self.data.finish_time;
    };
    
    can_refresh = function()
    {
        if (self.is_started())
        {
            return false;
        }
        return has_enough_resources(self.refresh_cost);
    };
    
    can_start = function()
    {
        if (self.is_started())
        {
            return false;
        }
        if (!self.has_available_borbs())
        {
            return false;
        }
        if (!has_enough_resources(self.start_res_cache))
        {
            return false;
        }
        if (array_length(self.data.exclusive_classes) > 0)
        {
            var __array = self.borbs;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                if (!in_array(mitem.type.key, self.data.exclusive_classes))
                {
                    return false;
                }
            }
        }
        return true;
    };
    
    cancel = function()
    {
        var __array = self.borbs;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (is_undefined(mitem))
            {
                continue;
            }
            mitem.finish(false, self);
        }
        remove_item_from_array_by_id(global.borbventures.items.borbventures, self.data.id);
    };
    
    change_borb = function(arg0, arg1)
    {
        self.borbs[arg1] = arg0;
        self.set_reward();
    };
    
    check = function()
    {
        if (!self.data.started)
        {
            var can_auto_start = has_bought_shop_item_safe(global.shops.gems.borbventure_auto_start);
            if (!can_auto_start || !get_option(global.options.borbventures_auto_start))
            {
                exit;
            }
            self.auto_fill();
            var chance = self.get_success_chance();
            if (chance < get_option(global.options.borbventures_auto_start_min_chance))
            {
                self.clear_selection();
                exit;
            }
            if (self.has_borbs() && self.can_start())
            {
                self.start();
            }
            exit;
        }
        else
        {
            var can_auto_finish = has_bought_shop_item_safe(global.shops.gems.borbventure_auto_finish);
            if (can_auto_finish && get_option(global.options.borbventures_auto_finish))
            {
                if (self.can_finish())
                {
                    self.finish();
                }
                else if (o_game.data.stats.time_elapsed >= self.data.finish_time && self.has_item_reward() && get_option(global.options.borbventures_auto_salvage))
                {
                    self.finish();
                }
            }
        }
        if (o_game.data.stats.time_elapsed < self.data.finish_time)
        {
            exit;
        }
    };
    
    clear_selection = function()
    {
        var __array = self.borbs;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            self.borbs[__i] = undefined;
        }
    };
    
    finish = function()
    {
        var __array = self.borbs;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (is_undefined(mitem))
            {
                continue;
            }
            mitem.finish(self.data.success, self);
        }
        var success_text = self.data.success ? __("succeeded") : __("failed");
        if (self.data.success)
        {
            success_text += ("\n" + add_result(self.data.reward, undefined, undefined, true));
        }
        o_game.data.stats.borbventures_finished++;
        if (get_option(global.options.enable_borbventure_notifications))
        {
            notify(__s("Borbventure level %s %s.", self.data.level, success_text));
        }
        remove_item_from_array_by_id(global.borbventures.items.borbventures, self.data.id);
    };
    
    get_duration = function()
    {
        if (!self.has_borbs())
        {
            return 0;
        }
        if (global.debug)
        {
            return sec(0.5);
        }
        var duration = global.game_settings.borbventure_duration + sec(self.data.level * 5) + sec(((self.data.level - 1) / 10) * 30);
        var multiplier = 0;
        multiplier += get_upgrade_attribute_value(global.upgrade_attributes.borbventure_increase_time);
        var __array = self.borbs;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (is_undefined(mitem))
            {
                continue;
            }
            multiplier += mitem.get_borbventure_duration(duration);
        }
        duration *= (1 + multiplier);
        duration = max(sec(30), duration);
        return duration;
    };
    
    get_participants_count = function()
    {
        var count = 2;
        return count;
    };
    
    get_remaining_time = function()
    {
        return self.data.finish_time - o_game.data.stats.time_elapsed;
    };
    
    get_reward_multiplier = function()
    {
        if (!self.has_available_borbs())
        {
            return 1;
        }
        var multiplier = 1;
        return multiplier;
    };
    
    get_reward_resources = function()
    {
        var res = self.data.reward.resources;
        return res;
    };
    
    get_selected_borbs = function()
    {
        var borbs = [];
        var __array = self.borbs;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (is_undefined(mitem))
            {
                continue;
            }
            array_push(borbs, mitem);
        }
        return borbs;
    };
    
    has_borbs = function()
    {
        return array_length(self.get_selected_borbs()) > 0;
    };
    
    get_available_selected_borbs = function()
    {
        var borbs = [];
        var __array = self.borbs;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (is_undefined(mitem))
            {
                continue;
            }
            if (mitem.is_on_adventure())
            {
                continue;
            }
            array_push(borbs, mitem);
        }
        return borbs;
    };
    
    get_selected_available_borbs_count = function()
    {
        return array_length(self.get_available_selected_borbs());
    };
    
    has_available_borbs = function()
    {
        return self.get_selected_available_borbs_count() > 0;
    };
    
    get_success_chance = function()
    {
        if (!self.has_borbs())
        {
            return 0;
        }
        var cleaned_level = self.data.level - ((global.borbventures.get_rarity_level(self.data.level) - 1) * 10);
        var success_chance = self.data.chance;
        var multiplier = get_upgrade_attribute_value(global.upgrade_attributes.borbventure_increase_success_chance);
        var __array = self.borbs;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (is_undefined(mitem))
            {
                continue;
            }
            multiplier += mitem.get_borbventure_success_chance(success_chance);
        }
        success_chance *= (1 + multiplier);
        if (self.rarity.level > 1)
        {
            success_chance *= (1 / (5 * power(self.rarity.level - 1, 2.25)));
        }
        success_chance *= (1 - (cleaned_level * 0.02));
        success_chance = clamp(success_chance, 0.01, 100);
        return success_chance;
    };
    
    get_start_resources = function()
    {
        var input_multiplier = get_default_struct_value(self.type, "input_multiplier", 0);
        var min_value = self.data.level * 2 * (1 + self.data.ascend_level) * (1 + input_multiplier);
        var max_value = self.data.level * 3 * (1 + self.data.ascend_level) * (1 + input_multiplier);
        var value = irandom_range(min_value, max_value);
        var res = build_resource_cost(global.resources.borb_token, value);
        return res;
    };
    
    get_xp = function()
    {
        var xp = global.game_settings.borbventure_base_xp * self.data.level * (1 + self.data.ascend_level) * 0.5;
        xp *= (1 + get_upgrade_attribute_value(global.upgrade_attributes.borbventure_increase_xp));
        var multiplier = 0;
        var __array = self.borbs;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (is_undefined(mitem))
            {
                continue;
            }
            multiplier += mitem.get_bonus("borbventure_increase_xp", 0);
        }
        xp *= (1 + multiplier);
        return max(1, round(xp));
    };
    
    has_item_reward = function()
    {
        return !is_undefined(struct_get_from_hash(self.data.reward, variable_get_hash("borbventure_item"))) || !is_undefined(struct_get_from_hash(self.data.reward, variable_get_hash("borbventure_borb")));
    };
    
    is_started = function()
    {
        return self.data.started;
    };
    
    set_reward = function()
    {
        self.reward_cache = struct_clone(self.data.reward);
        self.start_res_cache = struct_clone(self.data.start_res);
        if (self.is_started())
        {
            exit;
        }
        var reward_multiplier = 1 + get_upgrade_attribute_value(global.upgrade_attributes.borbventure_increase_reward);
        var start_multiplier = 1 + get_upgrade_attribute_value(global.upgrade_attributes.borbventure_increase_start_resources);
        var __array = self.borbs;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (is_undefined(mitem))
            {
                continue;
            }
            reward_multiplier += mitem.get_bonus("borbventure_increase_reward", 0);
            start_multiplier += mitem.get_bonus("borbventure_increase_start_resources", 0);
        }
        reward_multiplier *= get_default_struct_value(self.type, "multiplier_scale", 1);
        var multiplier_max = get_default_struct_value(self.type, "multiplier_max", undefined);
        if (is_numeric(multiplier_max))
        {
            reward_multiplier = min(reward_multiplier, multiplier_max);
        }
        var scale_reward = get_default_struct_value(self.type, "scale_reward", true);
        if (scale_reward)
        {
            self.reward_cache = multiply_struct_values(self.reward_cache, reward_multiplier, true, 1);
        }
        self.start_res_cache = multiply_struct_values(self.start_res_cache, start_multiplier, true, 1);
    };
    
    set_type = function()
    {
        if (is_undefined(self.data.rarity_key))
        {
            self.data.rarity_key = global.borbventures.borbventure_levels.common.key;
        }
        self.rarity = variable_struct_get(global.borbventures.borbventure_levels, self.data.rarity_key);
        if (is_undefined(self.data.type_key))
        {
            self.data.type_key = global.borbventures.get_random_type(self.data.level);
        }
        self.type = variable_struct_get(global.borbventures.borbventure_types, self.data.type_key);
    };
    
    start = function()
    {
        if (!self.can_start())
        {
            return false;
        }
        dec_resources(self.data.start_res);
        self.data.borb_ids = pluck(self.borbs, "get_id");
        self.data.finish_time = o_game.data.stats.time_elapsed + self.get_duration();
        self.data.reward = self.reward_cache;
        self.data.start_res = self.start_res_cache;
        self.data.started = true;
        variable_struct_set(o_game.data.borbventure_generation_time, self.data.type_key, o_game.data.stats.time_elapsed + get_default_struct_value(self.type, "generate_timeout", 0));
        var __array = self.borbs;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (is_undefined(mitem))
            {
                continue;
            }
            mitem.start();
        }
        if (!self.data.success_set)
        {
            random_set_seed(self.data.seed);
            self.data.chance_final = self.get_success_chance();
            self.data.success = percent_chance(self.data.chance_final);
            randomize();
            self.data.success_set = true;
        }
        __array = global.borbventures.items.borbventures;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (mitem.data.id == self.data.id)
            {
                continue;
            }
            var __array2 = mitem.borbs;
            var __prop_len2 = array_length(__array2);
            for (var __i2 = 0; __i2 < __prop_len2; __i2++)
            {
                var mitem2 = __array2[__i2];
                if (is_undefined(mitem2))
                {
                    continue;
                }
                var __array3 = self.data.borb_ids;
                var __prop_len3 = array_length(__array3);
                for (var __i3 = 0; __i3 < __prop_len3; __i3++)
                {
                    var mitem3 = __array3[__i3];
                    if (is_undefined(mitem3))
                    {
                        continue;
                    }
                    if (mitem2.data.id == mitem3)
                    {
                        mitem.data.borb_ids[__i2] = undefined;
                        mitem.change_borb(undefined, __i2);
                    }
                }
            }
        }
    };
    
    get_name = function()
    {
        var level = self.data.level - (self.data.ascend_level * 60);
        var name_final = sprintf("[%s] %s %s", self.data.level, self.rarity.name, get_value_ext(self, self.name, false));
        if (self.data.ascend_level > 0)
        {
            name_final = sprintf("[%s | %s] %s %s", self.data.level, self.data.ascend_level, self.rarity.name, get_value_ext(self, self.name, false));
        }
        return name_final;
    };
    
    get_description = function(arg0 = false)
    {
        if (arg0)
        {
            return self.get_success_chance_text();
        }
        var desc_final = get_value_ext(self, self.description, false);
        desc_final += "\n";
        desc_final += __s("Experience: %s", number_format(self.get_xp()));
        desc_final += "\n";
        var duration = self.get_duration();
        var duration_f = (duration == 0) ? "?" : format_time(secr(duration), true, true);
        desc_final += __s("Duration: %s", duration_f);
        var show_success_chance = true;
        if (show_success_chance)
        {
            desc_final += ("\n" + self.get_success_chance_text());
        }
        if (self.is_started())
        {
            desc_final += "\n";
            if (self.get_remaining_time() <= 0 && self.data.success_set)
            {
                var color = self.data.success ? global.colors.green : global.colors.red;
                var success_text = sprintf("Borbventure %s!", self.data.success ? __("succeeded") : __("failed"));
                desc_final += success_text;
                if (self.has_item_reward() && !self.can_add_item_reward())
                {
                    desc_final += ("\n" + __s("Can't finish: %s", __("No inventory space available")));
                }
            }
            else
            {
                var remaining_time_formatted = format_time(secr(self.get_remaining_time()), false, true);
                desc_final += __s("Time remaining: %s", remaining_time_formatted);
            }
        }
        return desc_final;
    };
    
    get_success_chance_text = function()
    {
        var success_chance = self.is_started() ? self.data.chance_final : self.get_success_chance();
        var success_chance_text = sprintf("%s%", number_format(success_chance));
        if (!self.has_borbs())
        {
            success_chance_text = "?";
        }
        if (global.debug)
        {
            success_chance_text += sprintf(" [base=%s]", self.data.chance);
        }
        return __s("Success chance: %s", success_chance_text);
    };
    
    is_obfuscated = function()
    {
        return false;
    };
    
    load_data = function(arg0)
    {
        apply_struct_to_struct(self.data, arg0);
        self.init();
    };
    
    apply_struct_to_struct(self.data, arg0);
}
