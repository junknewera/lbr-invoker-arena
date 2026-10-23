function init_prestige_levels()
{
    global.prestige_levels = 
    {
        none: 
        {
            index: -1,
            level: 0,
            name: "",
            name_short: ""
        },
        prestige: 
        {
            index: 0,
            level: 1,
            name: __("Leaf Crunch"),
            name_short: __("LC")
        },
        blc: 
        {
            index: 1,
            level: 2,
            name: __("Big Leaf Crunch"),
            name_short: __("BLC")
        },
        mlc: 
        {
            index: 2,
            level: 3,
            name: __("Mega Leaf Crunch"),
            name_short: __("MLC")
        },
        ulc: 
        {
            index: 3,
            level: 4,
            name: __("Ultra Leaf Crunch"),
            name_short: __("ULC"),
            add_prestige_resources_after_reset: true,
            base_points: 10,
            multiplier_add_value: 0.05
        },
        inf: 
        {
            index: 999999,
            level: 999999
        }
    };
    add_keys_to_struct(global.prestige_levels);
    global.prestige_levels_array = struct_to_sorted_array_by(global.prestige_levels, "level");
    global.prestige_levels_map = {};
    var __struct = global.prestige_levels;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(global.prestige_levels_map, mitem.level, mitem);
    }
    global.ulc_options = [new Prestige_Option(
    {
        key: "borbventure",
        name: __("Borbventures"),
        
        description: function()
        {
            return __s("Resets %s to level %s, all items to %s and all packs to %s.", __("Borbs"), 1, max(0, global.upgrade_attributes.ulc_borbventure_inventory_reset_count), 0);
        },
        
        get_points: function()
        {
            var points = 0;
            var __array = global.borbventures.items.inventory;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                if (mitem.data.count == 0)
                {
                    continue;
                }
                points += power(sqrt0(mitem.data.count / 100), 1 + (mitem.rarity.level / 30));
            }
            var __struct = global.borbventures.borbventure_packs;
            var __prop_names = struct_get_names(__struct);
            __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                if (mitem.data.count == 0)
                {
                    continue;
                }
                points += power(sqrt0(log2(mitem.data.count)), 1 + (mitem.rarity_index / 30));
            }
            return floor(points);
        }
    }), new Prestige_Option(
    {
        key: "cards",
        name: __("Cards"),
        
        description: function()
        {
            return __s("Resets %s to %s and all packs to %s.", __("Cards"), max(0, global.upgrade_attributes.ulc_cards_reset_count), 0);
        },
        
        get_points: function()
        {
            var points = 0;
            var __array = global.cards_array;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                if (mitem.data.count == 0)
                {
                    continue;
                }
                points += power(sqrt0(mitem.data.count / 250000), 1 + (mitem.type.level / 30));
            }
            var __struct = global.cards_packs;
            var __prop_names = struct_get_names(__struct);
            __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                if (mitem.data.count == 0)
                {
                    continue;
                }
                points += power(sqrt0(log2(mitem.data.count)), 1 + (mitem.rarity_index / 30));
            }
            return floor(points);
        }
    }), new Prestige_Option(
    {
        key: "crafted_leaves",
        name: __("Crafted Leaves"),
        
        description: function()
        {
            return __s("Removes all %s.", __("Crafted Leaves"));
        },
        
        get_points: function()
        {
            var points = 0;
            var __array = global.craft_leaves_backpack;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                points += sqrt(mitem.type.craft_level / 5);
            }
            __array = global.craft_leaves_inventory;
            __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                points += sqrt(mitem.type.craft_level / 5);
            }
            return floor(points);
        }
    }), new Prestige_Option(
    {
        key: "dice",
        name: __("Dice"),
        
        description: function()
        {
            return concatstr(__s("Resets the count of %s to %s.", __("Dice items"), max(1, global.upgrade_attributes.ulc_dice_reset_count + 1)), " ", __("Resets dice rolls."));
        },
        
        get_points: function()
        {
            var points = 0;
            var __array = global.dice_inventory;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                if (mitem.data.count == 0)
                {
                    continue;
                }
                points += power(sqrt0(mitem.data.count / 100), 1 + (mitem.rarity.level / 30));
            }
            __array = global.dice_backpack;
            __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                if (mitem.data.count == 0)
                {
                    continue;
                }
                points += power(sqrt0(mitem.data.count / 100), 1 + (mitem.rarity.level / 30));
            }
            return floor(points);
        }
    }), new Prestige_Option(
    {
        key: "equipment",
        name: __("Equipment"),
        
        description: function()
        {
            return __s("Resets the count of %s to %s.", __("Equipment items"), max(0, global.upgrade_attributes.ulc_equipment_reset_count));
        },
        
        get_points: function()
        {
            var points = 0;
            var __array = global.equipment_array;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                if (mitem.data.count == 0)
                {
                    continue;
                }
                points += sqrt0(log10(mitem.data.count));
            }
            return floor(points);
        }
    }), new Prestige_Option(
    {
        key: "leafscended_leaves",
        name: __("Leafscended Leaves"),
        
        description: function()
        {
            return __s("Resets the count of %s to %s.", __("Leafscended Leaves"), max(0, global.upgrade_attributes.ulc_leafscender_reset_count));
        },
        
        get_points: function()
        {
            var points = 0;
            var __array = global.resources_leaves;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                for (var i = 1; i <= 6; i++)
                {
                    var leafscend_count = get_default_struct_value(mitem.data.leafscend_count, i, 0);
                    if (leafscend_count <= 0)
                    {
                        continue;
                    }
                    points += power(sqrt0(log10(leafscend_count / 1000)), 1 + (i / 20));
                }
            }
            return floor(points);
        }
    }), new Prestige_Option(
    {
        key: "materials",
        name: __("Materials"),
        
        description: function()
        {
            return __s("Resets the count of %s to %s.", __("Materials"), max(0, global.upgrade_attributes.ulc_materials_reset_count));
        },
        
        get_points: function()
        {
            var points = 0;
            var __array = global.materials_sorted;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                if (mitem.data.count <= 0)
                {
                    continue;
                }
                points += power(sqrt0(log10(mitem.data.count / 100)), 1 + (1 - (mitem.daily_reward_modifier / 10)));
            }
            return floor(points);
        }
    }), new Prestige_Option(
    {
        key: "mines",
        name: __("Mines"),
        
        description: function()
        {
            return __s("Resets the count of %s to %s.", __("Mine items"), max(0, global.upgrade_attributes.ulc_mine_items_reset_count));
        },
        
        get_points: function()
        {
            var points = 0;
            var __array = global.mine_inventory;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                if (mitem.data.count == 0)
                {
                    continue;
                }
                points += power(sqrt0(mitem.data.count / 100), 1 + (mitem.rarity.level / 30));
            }
            return floor(points);
        }
    }), new Prestige_Option(
    {
        key: "quarks",
        name: __("Quarkstiges"),
        
        description: function()
        {
            return __s("Resets the %s count to %s.", __("Quarkstiges"), max(0, global.upgrade_attributes.ulc_quarkstiges_reset_count));
        },
        
        get_points: function()
        {
            var points = 0;
            points += (o_game.data.quarks.quarkstige_count / 10);
            return floor(points);
        }
    }), new Prestige_Option(
    {
        key: "relics",
        name: __("Relics"),
        
        description: function()
        {
            return __s("Resets the %s count to %s.", __("Relics"), max(0, global.upgrade_attributes.ulc_relics_reset_count));
        },
        
        get_points: function()
        {
            var points = 0;
            var __array = global.relics_array;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                if (mitem.data.count == 0)
                {
                    continue;
                }
                points += power(sqrt0(mitem.data.count / 1000), 1 + (mitem.type.level / 30));
            }
            return floor(points);
        }
    })];
}

function get_min_ulc_sacrifices()
{
    var value = global.game_settings.ulc_min_sacrifices_count - global.upgrade_attributes.ulc_min_sacrifices_decrease_count;
    return value;
}

function get_min_ulc_wow_defeat_count()
{
    var value = global.game_settings.ulc_min_wow_defeat_count - global.upgrade_attributes.ulc_min_wow_defeat_decrease_count;
    return value;
}
