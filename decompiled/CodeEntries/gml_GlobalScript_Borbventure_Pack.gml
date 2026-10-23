function Borbventure_Pack(arg0) : Collectable_Usable_Object(arg0) constructor
{
    name = "";
    index = 0;
    btn_bg_sprite = spr_borb;
    sprite = spr_placeholder;
    unlocked = true;
    
    init = function()
    {
    };
    
    can_buy = function(arg0, arg1 = false)
    {
        if (in_challenge() && !global.game_settings.gem_upgrades_enabled)
        {
            return false;
        }
        if (arg1)
        {
            var daily_data = get_daily_data_today();
            if (!is_undefined(struct_get_from_hash(daily_data.data, variable_get_hash("borbventure_packs_bought"))))
            {
                if (daily_data.data.borbventure_packs_bought >= global.game_settings.cards_packs_gem_purchases_per_day)
                {
                    return false;
                }
            }
        }
        return has_enough_resources(arg0);
    };
    
    buy = function(arg0, arg1 = false, arg2 = 1)
    {
        dec_resources(arg0);
        self.data.count += arg2;
        self.data.collected += arg2;
        if (arg1)
        {
            var daily_data = get_daily_data_today();
            add_to_struct_value(daily_data.data, "borbventure_packs_bought", arg2);
        }
    };
    
    can_open = function()
    {
        if (self.data.count <= 0)
        {
            return false;
        }
        return true;
    };
    
    open = function(arg0 = 1, arg1 = true)
    {
        var result = 
        {
            borbventure_item: {}
        };
        var count_real = arg0;
        var multiplier = 0;
        if (arg0 >= 1000)
        {
            multiplier = arg0 / 1000;
            arg0 = 1000;
        }
        repeat (arg0)
        {
            if (self.data.count == 0)
            {
                break;
            }
            var items_guarantee_count = 0;
            var __struct = self.items_guarantee;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                repeat (mitem)
                {
                    var item = global.borbventures.get_random_craftable_item();
                    if (!is_struct(item))
                    {
                        continue;
                    }
                    if (!is_struct(variable_struct_get(result.borbventure_item, mkey)))
                    {
                        variable_struct_set(result.borbventure_item, mkey, {});
                    }
                    add_to_struct_value(variable_struct_get(result.borbventure_item, mkey), item.key, 1);
                    items_guarantee_count++;
                }
            }
            var count_remaining = self.items_count - items_guarantee_count;
            repeat (count_remaining)
            {
                var rarity = self.items_rarity[0].rarity;
                var __array = self.items_rarity;
                __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    if (!percent_chance(mitem.chance))
                    {
                        continue;
                    }
                    rarity = mitem.rarity;
                    break;
                }
                var item = global.borbventures.get_random_craftable_item();
                if (!is_struct(item))
                {
                    break;
                }
                if (!is_struct(variable_struct_get(result.borbventure_item, rarity.key)))
                {
                    variable_struct_set(result.borbventure_item, rarity.key, {});
                }
                add_to_struct_value(variable_struct_get(result.borbventure_item, rarity.key), item.key, 1);
            }
        }
        self.data.count -= count_real;
        if (multiplier > 0)
        {
            result = multiply_struct_values(result, multiplier, true);
        }
        if (arg1)
        {
            add_result(result, undefined, 
            {
                title: self.name
            }, !get_option(global.options.show_reward_dialogs), undefined, "borbventures", false);
            if (!get_option(global.options.show_reward_dialogs))
            {
                notify(__s("%s %s opened.", count_real, pluralize(count_real, __("item"), __("items"))));
            }
        }
        return result;
    };
    
    set_local_vars(arg0);
    set_sprite_data(self);
    init();
}
