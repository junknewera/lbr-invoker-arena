function init_borbventures()
{
    global.borbventures = new Borbventure_Controller();
    global.borbventures.init();
}

function Borbventure_Controller() constructor
{
    craftable_items_cache = undefined;
    selected_borb = undefined;
    selected_inventory = undefined;
    selected_pack = undefined;
    data = 
    {
        init: false,
        refresh_borbventures_timer_start: 0,
        refresh_borbventures_timer_end: 0,
        unlocked_borb_types: {}
    };
    items = 
    {
        borbventures: [],
        borbs: [],
        inventory: []
    };
    borbventure_levels = 
    {
        common: new Borbventure_Rarity(
        {
            level: 1,
            name: __("Common")
        }),
        uncommon: new Borbventure_Rarity(
        {
            level: 2,
            name: __("Uncommon"),
            color: global.rarity_colors.uncommon
        }),
        rare: new Borbventure_Rarity(
        {
            level: 3,
            name: __("Rare"),
            color: global.rarity_colors.rare
        }),
        epic: new Borbventure_Rarity(
        {
            level: 4,
            name: __("Epic"),
            color: global.rarity_colors.epic
        }),
        mythical: new Borbventure_Rarity(
        {
            level: 5,
            name: __("Mythical"),
            color: global.rarity_colors.mythical
        }),
        legendary: new Borbventure_Rarity(
        {
            level: 6,
            name: __("Legendary"),
            color: global.rarity_colors.legendary
        })
    };
    init_game_object_struct(borbventure_levels);
    init_rarities(borbventure_levels);
    borbventure_levels_array = struct_to_sorted_array_by(borbventure_levels, "level", true);
    borb_levels = 
    {
        common: new Borbventure_Rarity(
        {
            level: 1,
            name: __("Common"),
            sprite: spr_borb
        }),
        uncommon: new Borbventure_Rarity(
        {
            level: 2,
            name: __("Uncommon"),
            sprite: spr_borbventurer_uncommon
        }),
        rare: new Borbventure_Rarity(
        {
            level: 3,
            name: __("Rare"),
            sprite: spr_borbventurer_rare
        }),
        epic: new Borbventure_Rarity(
        {
            level: 4,
            name: __("Epic"),
            sprite: spr_borbventurer_epic
        }),
        mythical: new Borbventure_Rarity(
        {
            level: 5,
            name: __("Mythical"),
            sprite: spr_borbventurer_uncommon
        }),
        legendary: new Borbventure_Rarity(
        {
            level: 6,
            name: __("Legendary"),
            sprite: spr_borbventurer_legendary
        })
    };
    init_game_object_struct(borb_levels);
    init_rarities(borb_levels);
    
    init = function()
    {
        self.borb_types = 
        {
            common: 
            {
                name: __("Borb"),
                sprite: spr_borb,
                bonus: 
                {
                    borbventure_increase_success_chance: 0.1
                }
            },
            borbiana_jones: 
            {
                name: __("Borbiana Jones"),
                sprite: spr_borb_jones,
                bonus: 
                {
                    borbventure_increase_success_chance: 0.5,
                    borbventure_increase_reward: 0.5,
                    borbventure_increase_time: -0.3,
                    borbventure_increase_xp: 0.75
                },
                premium: true
            },
            builder: 
            {
                name: __("Builder"),
                sprite: spr_borb_builder,
                bonus: 
                {
                    borbventure_increase_reward: 0.25,
                    borbventure_increase_success_chance: -0.25,
                    borbventure_increase_time: 0.25
                }
            },
            cool: 
            {
                name: __("Cool"),
                sprite: spr_borb_cool,
                bonus: 
                {
                    borbventure_increase_reward: 0.15,
                    borbventure_increase_success_chance: 0.15,
                    borbventure_increase_time: 0.5
                }
            },
            ghost: 
            {
                name: __("Ghost"),
                sprite: spr_borb_ghost,
                bonus: 
                {
                    borbventure_increase_reward: 0.5,
                    borbventure_increase_success_chance: 0.1,
                    borbventure_increase_time: 0.75
                }
            },
            ninja: 
            {
                name: __("Ninja"),
                sprite: spr_borb_ninja,
                bonus: 
                {
                    borbventure_increase_reward: -0.25,
                    borbventure_increase_time: -0.5
                }
            },
            teacher: 
            {
                name: __("Teacher"),
                sprite: spr_borb_helper,
                bonus: 
                {
                    borbventure_increase_xp: 0.35,
                    borbventure_increase_time: 0.5
                }
            },
            viking: 
            {
                name: __("Viking"),
                sprite: spr_borb_viking,
                bonus: 
                {
                    borbventure_increase_reward: -0.35,
                    borbventure_increase_success_chance: 0.35
                }
            }
        };
        self.borbventure_items = get_borbventure_items();
        self.borbventure_packs = get_borbventure_packs();
        self.borbventure_types = get_borbventure_types();
        add_keys_to_struct(self.borbventure_items);
        add_keys_to_struct(self.borbventure_levels);
        add_keys_to_struct(self.borbventure_packs);
        add_keys_to_struct(self.borbventure_types);
        add_keys_to_struct(self.borb_levels);
        add_keys_to_struct(self.borb_types);
        self.borbventure_items_array = struct_to_sorted_array_key(self.borbventure_items);
        self.borbventure_items_candy = _filter(self.borbventure_items_array, function(arg0)
        {
            var tags = get_default_struct_value(arg0, "tags", undefined);
            return in_array("candy", tags);
        });
        self.borbventure_items_craftable_array = _filter(self.borbventure_items_array, function(arg0)
        {
            return !arg0.is_usable;
        });
        self.borbventure_types_array = struct_to_array(self.borbventure_types);
        self.borbventure_types_chance_array = struct_to_sorted_array_by(self.borbventure_types, "chance", true);
        self.borb_levels_array = struct_to_sorted_array_by(self.borb_levels, "level", true);
        self.borb_packs_array = struct_to_sorted_array_by(self.borbventure_packs, "index", true);
        self.borb_types_array = struct_to_array(self.borb_types);
        self.borb_types_array_special = _filter(self.borb_types_array, function(arg0)
        {
            return arg0.key != global.borbventures.borb_types.common.key && !get_default_struct_value(arg0, "premium", false);
        });
        self.borb_types_array_premium = _filter(self.borb_types_array, function(arg0)
        {
            return arg0.key != global.borbventures.borb_types.common.key && get_default_struct_value(arg0, "premium", false);
        });
        sort_array_by(self.borb_types_array_special, "name", true);
        self.borbventure_packs_array = struct_to_sorted_array(self.borbventure_packs);
        var __struct = self.borbventure_packs;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            sort_array_by(mitem.items_rarity, "chance");
        }
        var borb_levels_length = array_length(self.borb_levels_array);
        var __array = self.borb_levels_array;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            mitem.next_rarity = undefined;
            if (__i == (borb_levels_length - 1))
            {
                break;
            }
            mitem.next_rarity = @@array_get@@(self.borb_levels_array, __i + 1);
        }
        delay("borbventure_start", 1, function()
        {
            if (global.borbventures.data.init)
            {
                exit;
            }
            global.borbventures.data.init = true;
            global.borbventures.refresh_borbventures();
            if (global.borbventures.can_recruit_count())
            {
                global.borbventures.recruit(global.borbventures.borb_levels.common, undefined, undefined, true);
            }
        });
    };
    
    can_craft_item = function(arg0 = 1)
    {
        if (!has_enough_resources(self.get_craft_item_cost(arg0)))
        {
            return false;
        }
        return true;
    };
    
    can_refresh = function(arg0 = false)
    {
        if (o_game.data.stats.time_elapsed < self.data.refresh_borbventures_timer_end)
        {
            return false;
        }
        if (!arg0 && !has_enough_resources(self.get_refresh_cost()))
        {
            return false;
        }
        return true;
    };
    
    can_recruit = function()
    {
        if (!self.can_recruit_count())
        {
            return false;
        }
        if (!has_enough_resources(self.get_recruit_cost()))
        {
            return false;
        }
        return true;
    };
    
    can_recruit_count = function(arg0 = 1)
    {
        return (array_length(global.borbventures.items.borbs) + arg0) <= self.get_max_borbs();
    };
    
    add_item = function(arg0, arg1 = 1, arg2 = global.borbventures.borb_levels.common, arg3 = true)
    {
        return self.craft_item(arg1, 
        {
            item_key: arg0,
            rarity_key: arg2.key
        }, arg3, false, true);
    };
    
    craft_item = function(arg0 = 1, arg1 = undefined, arg2 = true, arg3 = true, arg4 = false)
    {
        if (!is_struct(arg1))
        {
            arg1 = {};
        }
        var crafted = 0;
        var compensation_count = 0;
        var compensation_total = {};
        var cost = self.get_craft_item_cost(1);
        var n = 0;
        self.refresh_craftable_items();
        repeat (arg0)
        {
            if (arg3 && !self.can_craft_item(1))
            {
                exit;
            }
            var rarity_key = get_default_struct_value(arg1, "rarity_key", global.borbventures.borb_levels.common.key);
            arg1.rarity_key = rarity_key;
            var item_key = get_default_struct_value(arg1, "item_key", undefined);
            var item_type;
            if (is_undefined(item_key))
            {
                item_type = self.get_random_craftable_item();
            }
            else
            {
                item_type = variable_struct_get(global.borbventures.borbventure_items, item_key);
            }
            arg1.type_key = item_type.key;
            var item = self.find_item(item_type.key, rarity_key);
            if (is_struct(item))
            {
                if (item.data.count >= item.get_max_count())
                {
                    var add_count = max(0, (item.data.count + arg0) - n - item.get_max_count());
                    add_struct_to_struct(compensation_total, item.get_scrap_resources(add_count));
                    compensation_count += add_count;
                    if (arg3)
                    {
                        cost = self.get_craft_item_cost(add_count);
                        dec_resources(cost);
                    }
                    break;
                }
                else
                {
                    var collect_count = max(0, min(arg0 - n, item.get_max_count() - item.data.count));
                    item.collect(collect_count);
                    crafted += collect_count;
                    if (arg3)
                    {
                        cost = self.get_craft_item_cost(collect_count);
                        dec_resources(cost);
                    }
                    if (arg0 == 1)
                    {
                        return item;
                    }
                    break;
                }
            }
            else if (array_length(global.borbventures.items.inventory) >= self.get_inventory_size())
            {
                var add_count = max(0, arg0 - n);
                var craft_compensation = self.get_scrap_resources(add_count, variable_struct_get(global.borbventures.borb_levels, rarity_key));
                add_struct_to_struct(compensation_total, craft_compensation);
                compensation_count += add_count;
                if (arg3)
                {
                    cost = self.get_craft_item_cost(add_count);
                    dec_resources(cost);
                }
                break;
            }
            else
            {
                item = new Borbventure_Item(arg1);
                item.create();
                var collect_count = max(0, min(arg0 - n, item.get_max_count() - item.data.count));
                item.collect(collect_count);
                crafted += collect_count;
                if (arg2)
                {
                    array_push(global.borbventures.items.inventory, item);
                }
                if (arg3)
                {
                    cost = self.get_craft_item_cost(collect_count);
                    dec_resources(cost);
                }
                if (arg0 == 1)
                {
                    return item;
                }
            }
            n++;
        }
        if (get_struct_length(compensation_total) > 0)
        {
            if (arg4)
            {
                return compensation_total;
            }
            notify(__s("Crafting storage exceeded. You've received %s as compensation for %s %s.", format_resources_text(compensation_total), compensation_count, pluralize(compensation_count, __("item"), __("items"))));
            add_resources(compensation_total);
        }
        return crafted;
    };
    
    craft_notify = function(arg0)
    {
        if (is_struct(arg0))
        {
            var craft_text = sprintf("%s (%s/%s)", arg0.get_name(false), arg0.data.count, arg0.get_max_count());
            notify(__s("Crafted %s", craft_text));
        }
        else
        {
            notify(__s("Crafted %s items.", arg0));
        }
    };
    
    find_item = function(arg0, arg1)
    {
        var item = undefined;
        var __array = global.borbventures.items.inventory;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (mitem.data.type_key == arg0 && mitem.data.rarity_key == arg1)
            {
                item = mitem;
                break;
            }
        }
        return item;
    };
    
    get_borbventure_rarity = function(arg0 = 1)
    {
        var available = [];
        var __array = self.borbventure_levels_array;
        var __prop_len = array_length(__array);
        var __i = __prop_len - 1;
        while (__i >= 0)
        {
            var mitem = __array[__i];
            var __ireal = __prop_len - 1 - __i;
            if (arg0 >= mitem.level)
            {
                return mitem;
            }
            __i--;
        }
        return @@array_get@@(self.borbventure_levels_array, 0);
    };
    
    get_borb_special_recruit_chance = function()
    {
        var value = global.game_settings.borbventure_special_recruit_chance + get_upgrade_attribute_value(global.upgrade_attributes.borbventure_special_recruit_chance);
        return value;
    };
    
    get_craft_item_cost = function(arg0 = 1)
    {
        var res = struct_clone(global.costs.borbventure_craft_item);
        var multiply_value = arg0 * (1 + get_upgrade_attribute_value(global.upgrade_attributes.borbventure_craft_cost_multiplier));
        res = multiply_struct_values(res, multiply_value, true, 1);
        return res;
    };
    
    get_current_borbventures_type_count = function(arg0)
    {
        var count = _sum(global.borbventures.items.borbventures, function(arg0, arg1, arg2)
        {
            return (arg0.type.key == arg2.key) ? 1 : 0;
        }, 
        {
            key: arg0
        });
        return count;
    };
    
    get_inventory_size = function()
    {
        return global.game_settings.borbventure_inventory_size + get_upgrade_attribute_value(global.upgrade_attributes.borbventure_inventory_size);
    };
    
    get_max_borbventures = function()
    {
        return global.game_settings.borbventure_max_borbventures + get_upgrade_attribute_value(global.upgrade_attributes.borbventure_max_borbventures);
    };
    
    get_max_borbs = function()
    {
        return global.game_settings.borbventure_max_borbs + get_upgrade_attribute_value(global.upgrade_attributes.borbventure_max_borbs);
    };
    
    get_available_borbs = function()
    {
        return array_filter_custom(global.borbventures.items.borbs, function(arg0)
        {
            return !arg0.is_on_adventure();
        });
    };
    
    get_next_available_borb = function(arg0 = undefined, arg1 = 1, arg2 = false, arg3 = [], arg4 = 0)
    {
        if (array_length(global.borbventures.items.borbs) == 0 || arg4 > 100)
        {
            return undefined;
        }
        arg4++;
        var available_borbs = self.get_available_borbs();
        if (array_length(available_borbs) == 0)
        {
            return undefined;
        }
        var next_borb = undefined;
        if (is_undefined(arg0))
        {
            if (arg2)
            {
                if (arg1 > 0)
                {
                    next_borb = @@array_get@@(available_borbs, 0);
                }
                else
                {
                    next_borb = array_last(available_borbs);
                }
            }
            else
            {
                next_borb = @@array_get@@(available_borbs, 0);
            }
            if (is_struct(next_borb))
            {
                var exclude_borb_ids = pluck(arg3, "get_id");
                if (in_array(next_borb.data.id, exclude_borb_ids))
                {
                    next_borb = self.get_next_available_borb(next_borb, arg1, arg2, arg3, arg4);
                }
                return next_borb;
            }
        }
        var borb_index = -1;
        var __array = available_borbs;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (arg0.data.id != mitem.data.id)
            {
                continue;
            }
            borb_index = __i;
        }
        if (borb_index == -1)
        {
            return undefined;
        }
        if (arg2 && ((arg1 > 0 && borb_index == (array_length(available_borbs) - 1)) || (arg1 < 0 && borb_index == 0)))
        {
            return undefined;
        }
        next_borb = get_next_array_item(available_borbs, borb_index, arg1);
        if (is_struct(next_borb))
        {
            var exclude_borb_ids = pluck(arg3, "get_id");
            if (in_array(next_borb.data.id, exclude_borb_ids))
            {
                next_borb = self.get_next_available_borb(next_borb, arg1, arg2, arg3, arg4);
            }
        }
        return next_borb;
    };
    
    get_random_borbventure_level = function()
    {
        var min_level = self.get_borbventure_min_level();
        var max_level = self.get_borbventure_max_level();
        return irandom_range(min_level, max_level);
    };
    
    get_random_craftable_item = function()
    {
        if (is_undefined(self.craftable_items_cache))
        {
            self.refresh_craftable_items();
        }
        return array_random_item(self.craftable_items_cache);
    };
    
    refresh_craftable_items = function()
    {
        self.craftable_items_cache = [];
        var __array = self.borbventure_items_craftable_array;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (mitem.craftable())
            {
                array_push(self.craftable_items_cache, mitem);
            }
        }
        return self.craftable_items_cache;
    };
    
    get_refresh_borbventure_duration = function()
    {
        var timer = global.game_settings.borbventure_refresh_timer;
        timer *= (1 + get_upgrade_attribute_value(global.upgrade_attributes.borbventure_refresh_timer_multiplier));
        timer = max(1, timer);
        if (global.debug)
        {
            timer = 1;
        }
        return timer;
    };
    
    get_scrap_resources = function(arg0, arg1)
    {
        var count = arg0 * 2 * (1 + ((arg1.level - 1) * 2));
        var res = 
        {
            borb_rune: count
        };
        return res;
    };
    
    get_borbventure_min_level = function()
    {
        if (!get_option(global.options.borbventure_scale_min_level))
        {
            return 1;
        }
        var level = floor(1 * (1 + (get_upgrade_attribute_value(global.upgrade_attributes.borbventure_increase_adventure_rarity) * 5)));
        level = clamp(level, 1, global.game_settings.borbventure_max_borbventure_level);
        return level;
    };
    
    get_borbventure_max_level = function()
    {
        var level = floor(10 * (1 + get_upgrade_attribute_value(global.upgrade_attributes.borbventure_increase_adventure_rarity)));
        level = clamp(level, 1, global.game_settings.borbventure_max_borbventure_level);
        return level;
    };
    
    get_random_type = function(arg0 = 1)
    {
        var available = [];
        var __array = self.borbventure_types_chance_array;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            var min_rarity = get_default_struct_value(mitem, "min_rarity", global.borbventures.borb_levels.common);
            var max_rarity = get_default_struct_value(mitem, "max_rarity", global.borbventures.borb_levels.legendary);
            if (arg0 < min_rarity.level)
            {
                continue;
            }
            if (arg0 > max_rarity.level)
            {
                continue;
            }
            if (!is_undefined(struct_get_from_hash(mitem, variable_get_hash("can_generate"))) && !mitem.can_generate())
            {
                continue;
            }
            var last_generation_time = get_default_struct_value(o_game.data.borbventure_generation_time, mitem.key, 0);
            if (last_generation_time > o_game.data.stats.time_elapsed)
            {
                continue;
            }
            var tags = get_default_struct_value(mitem, "tags", undefined);
            if (is_array(tags))
            {
                var tag_is_enabled = false;
                var __array2 = tags;
                var __prop_len2 = array_length(__array2);
                for (var __i2 = 0; __i2 < __prop_len2; __i2++)
                {
                    var mitem2 = __array2[__i2];
                    if (get_default_struct_value(o_game.data.borbventure_generation_disabled_tags, mitem2, false))
                    {
                        tag_is_enabled = true;
                        break;
                    }
                }
                if (!tag_is_enabled)
                {
                    continue;
                }
            }
            array_push(available, mitem);
        }
        array_shuffle(available);
        __array = available;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (percent_chance(mitem.chance))
            {
                return mitem;
            }
        }
        return self.borbventure_types.borb_juice;
    };
    
    get_rarity_level = function(arg0)
    {
        return ceil(arg0 / 10);
    };
    
    get_rarity_multiplier = function(arg0)
    {
        var multiplier = (self.get_rarity_level(arg0) - 1) * 0.33;
        return 1 + multiplier;
    };
    
    get_recruit_cost = function()
    {
        return global.costs.borbventure_recruit_cost;
    };
    
    get_refresh_cost = function()
    {
        var res = build_resource_cost(global.resources.borb_juice, 50);
        return res;
    };
    
    has_free_inventory_space = function()
    {
        return array_length(global.borbventures.items.inventory) < global.borbventures.get_inventory_size();
    };
    
    offline = function(arg0)
    {
        self.data.refresh_borbventures_timer_start = max(0, self.data.refresh_borbventures_timer_start - sec(arg0));
        self.data.refresh_borbventures_timer_end = max(0, self.data.refresh_borbventures_timer_end - sec(arg0));
        var __array = global.borbventures.items.borbventures;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            mitem.data.finish_time -= sec(arg0);
        }
    };
    
    recruit = function(arg0 = undefined, arg1 = global.borbventures.borb_levels.common, arg2 = true, arg3 = false)
    {
        var level = 1;
        if (is_undefined(arg0) && arg2)
        {
            arg0 = self.borb_types.common;
            var available_premium = _filter(self.borb_types_array_premium, function(arg0)
            {
                var borb = variable_struct_get(global.borbventures.data.unlocked_borb_types, arg0.key);
                if (is_undefined(borb))
                {
                    return false;
                }
                return true;
            });
            if (array_length(available_premium) > 0 && percent_chance(global.game_settings.borbventure_special_recruit_chance_premium * 100))
            {
                arg0 = array_random_item(available_premium);
            }
            else if (percent_chance(self.get_borb_special_recruit_chance() * 100))
            {
                var available = _filter(self.borb_types_array_special, function(arg0)
                {
                    var borb = variable_struct_get(global.borbventures.data.unlocked_borb_types, arg0.key);
                    if (is_undefined(borb))
                    {
                        return false;
                    }
                    return true;
                });
                if (array_length(available) > 0)
                {
                    arg0 = array_random_item(available);
                }
            }
        }
        if (is_undefined(arg0))
        {
            arg0 = self.borb_types.common;
        }
        var borb = new Borbventurer(
        {
            level: level,
            rarity_key: arg1.key,
            type_key: arg0.key
        });
        borb.create();
        array_push(global.borbventures.items.borbs, borb);
        if (!arg3)
        {
            dec_resources(self.get_recruit_cost());
        }
        return borb;
    };
    
    refresh_borbventures = function()
    {
        if (!self.can_refresh())
        {
            exit;
        }
        dec_resources(self.get_refresh_cost());
        var max_count = self.get_max_borbventures();
        global.borbventures.items.borbventures = _filter(global.borbventures.items.borbventures, function(arg0)
        {
            return arg0.is_started() || arg0.data.locked;
        });
        var i = array_length(global.borbventures.items.borbventures);
        while (i < max_count)
        {
            var borbventure = new Borbventure();
            borbventure.create();
            array_insert_first(global.borbventures.items.borbventures, borbventure);
            i++;
        }
        self.data.refresh_borbventures_timer_start = o_game.data.stats.time_elapsed;
        self.data.refresh_borbventures_timer_end = o_game.data.stats.time_elapsed + self.get_refresh_borbventure_duration();
        if (is_unlocked_borbventure() && get_option(global.options.enable_borbventure_notifications))
        {
            notify(__("Borbventures refreshed."));
        }
    };
    
    load_data = function(arg0)
    {
        apply_struct_to_struct(self.data, arg0);
    };
}

function cancel_all_borbventures()
{
    var __array = global.borbventures.items.borbs;
    var __prop_len = array_length(__array);
    for (__i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        mitem.data.started = false;
    }
    __array = global.borbventures.items.borbventures;
    __prop_len = array_length(__array);
    var __i = __prop_len - 1;
    while (__i >= 0)
    {
        var mitem = __array[__i];
        var __ireal = __prop_len - 1 - __i;
        mitem.cancel();
        __i--;
    }
}

function can_auto_craft_bv_items()
{
    return has_bought_shop_item(global.shops.ulc.auto_craft_bv_items);
}

function check_borbventures()
{
    var can_auto_start = has_bought_shop_item_safe(global.shops.gems.borbventure_auto_start);
    if (can_auto_start && get_option(global.options.borbventures_auto_start))
    {
        var available_borbs = global.borbventures.get_available_borbs();
        if (global.borbventures.data.refresh_borbventures_timer_end <= o_game.data.stats.time_elapsed && array_length(available_borbs) > 0)
        {
            global.borbventures.refresh_borbventures();
        }
        __array = global.borbventures.items.borbventures;
        __prop_len = array_length(__array);
        for (__i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (mitem.is_started())
            {
                continue;
            }
            mitem.clear_selection();
        }
    }
    var __array = global.borbventures.items.borbventures;
    var __prop_len = array_length(__array);
    var __i = __prop_len - 1;
    while (__i >= 0)
    {
        var mitem = __array[__i];
        var __ireal = __prop_len - 1 - __i;
        mitem.check();
        __i--;
    }
    if (can_auto_craft_bv_items() && get_option(global.options.auto_craft_bv_items))
    {
        var auto_craft_count = 1 + global.upgrade_attributes.borbventure_auto_craft_count;
        __array = global.borbventures.items.inventory;
        __prop_len = array_length(__array);
        for (__i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (!mitem.data.auto_craft)
            {
                continue;
            }
            var max_count = mitem.get_max_count();
            var max_craft_count = min(max_count - mitem.data.count, auto_craft_count);
            max_craft_count = max(1, max_craft_count);
            if (mitem.can_craft(max_craft_count))
            {
                mitem.craft(max_craft_count);
                break;
            }
            else if (mitem.can_craft(1))
            {
                mitem.craft();
                break;
            }
        }
    }
}

function open_all_borbventure_packs()
{
    var res = {};
    var packs_opened = 0;
    var __array = global.borbventures.borbventure_packs_array;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        packs_opened += mitem.data.count;
        var res_pack = mitem.open(mitem.data.count, false);
        add_struct_to_struct(res, res_pack);
    }
    var show_dialog = get_option(global.options.show_reward_dialogs);
    add_result(res, undefined, undefined, !show_dialog, true, "borbventures");
    if (show_dialog)
    {
        notify(__s("%s %s opened.", packs_opened, pluralize(packs_opened, __("item"), __("items"))));
    }
}
