function get_borbventure_items()
{
    return 
    {
        backpack: new Borbventure_Item_Type(
        {
            name: __("Backpack"),
            sprite: spr_icon_backpack,
            upgrade_attributes: 
            {
                borbventure_items_max_count: 0.1
            }
        }),
        cape: new Borbventure_Item_Type(
        {
            name: __("Cape"),
            sprite: spr_borbventure_item_cape,
            upgrade_attributes: 
            {
                borbventure_increase_adventure_rarity: 0.05
            }
        }),
        glasses: new Borbventure_Item_Type(
        {
            name: __("Glasses"),
            sprite: spr_borbventure_item_glasses,
            upgrade_attributes: 
            {
                borbventure_increase_success_chance: 0.005
            }
        }),
        pirate_hat: new Borbventure_Item_Type(
        {
            name: __("Pirate Hat"),
            sprite: spr_borbventure_item_pirate_hat,
            upgrade_attributes: 
            {
                borbventure_increase_reward: 0.005
            }
        }),
        ribbon: new Borbventure_Item_Type(
        {
            name: __("Ribbon"),
            sprite: spr_borbventure_item_ribbon,
            upgrade_attributes: 
            {
                borbventure_increase_xp: 0.005
            }
        }),
        ring: new Borbventure_Item_Type(
        {
            name: __("Ring"),
            sprite: spr_borbventure_item_ring,
            upgrade_attributes: 
            {
                borbventure_increase_time: -0.0005
            }
        }),
        socks: new Borbventure_Item_Type(
        {
            name: __("Socks"),
            sprite: spr_borbventure_item_socks,
            upgrade_attributes: 
            {
                borbventure_refresh_timer_multiplier: -0.001
            }
        }),
        blc_coin: new Borbventure_Item_Type(
        {
            name: __("BLC Coin"),
            sprite: spr_blc,
            upgrade_attributes: 
            {
                blc_value_multiplier_borbventure: 0.05
            }
        }),
        cursed_cheese: new Borbventure_Item_Type(
        {
            name: __("Cursed Cheese"),
            sprite: spr_icon_cursed_cheese,
            upgrade_attributes: 
            {
                cursed_autocollect: 0.3,
                cursed_autocollect_multiplier: 0.005
            }
        }),
        death_book: new Borbventure_Item_Type(
        {
            name: __("Death Book"),
            sprite: spr_borbventure_item_death_book,
            upgrade_attributes: 
            {
                offline_boss_kills_multiplier: 0.001
            },
            
            craftable: function()
            {
                return is_unlocked_death_book();
            }
        }),
        heat_shield: new Borbventure_Item_Type(
        {
            name: __("Heat Shield"),
            sprite: spr_borbventure_item_heat_shield,
            upgrade_attributes: 
            {
                damage_types_environment_resistance: 
                {
                    heat: 0.005
                }
            },
            
            craftable: function()
            {
                return area_bought(global.areas.shadow_cavern);
            }
        }),
        leaf_blower: new Borbventure_Item_Type(
        {
            name: __("Leaf Blower"),
            sprite: spr_weapon_leaf_blower,
            upgrade_attributes: 
            {
                blower_enemy_damage_multiplier_borbventure: 0.05
            }
        }),
        magic_leaf: new Borbventure_Item_Type(
        {
            name: __("Magic Leaf"),
            sprite: spr_borbventure_item_magic_leaf,
            upgrade_attributes: 
            {
                leaf_multiplier_borbventure: 0.01
            }
        }),
        mlc_coin: new Borbventure_Item_Type(
        {
            name: __("MLC Coin"),
            sprite: spr_mlc,
            upgrade_attributes: 
            {
                mlc_value_multiplier_borbventure: 0.05
            },
            
            craftable: function()
            {
                return o_game.data.stats.prestige_mlc > 0;
            }
        }),
        trout: new Borbventure_Item_Type(
        {
            name: __("Trout"),
            sprite: spr_weapon_trout,
            upgrade_attributes: 
            {
                slap_multiplier_borbventure: 0.005
            }
        }),
        free_borb: new Borbventure_Item_Type(
        {
            name: __s("Free %s Recruit", "Borb"),
            description: __("Recruit a free Borb."),
            sprite: spr_borb,
            is_usable: true,
            
            activate: function(arg0, arg1)
            {
                var rarity = arg1.rarity;
                if (rarity.level > 3)
                {
                    rarity = global.borbventures.borb_levels_array[2];
                }
                global.borbventures.recruit(undefined, rarity, true, true);
            },
            
            can_activate: function(arg0, arg1)
            {
                return global.borbventures.can_recruit_count(arg0);
            }
        }),
        random_item: new Borbventure_Item_Type(
        {
            name: __("Random Item"),
            description: __("Add a random item to your Borb inventory."),
            sprite: spr_icon_questionbox,
            is_usable: true,
            
            activate: function(arg0 = 1, arg1)
            {
                global.borbventures.refresh_craftable_items();
                var result = {};
                repeat (arg0)
                {
                    var item = global.borbventures.get_random_craftable_item();
                    var rarity = arg1.rarity;
                    if (arg1.rarity.level > 3)
                    {
                        rarity = global.borbventures.borb_levels_array[2];
                    }
                    var bitem = global.borbventures.craft_item(1, 
                    {
                        item_key: item.key,
                        rarity_key: rarity.key
                    }, true, false, true);
                    if (is_undefined(struct_get_from_hash(bitem, variable_get_hash("key"))))
                    {
                        add_struct_to_struct(result, bitem);
                    }
                }
                return result;
            }
        }),
        time_candy: new Borbventure_Item_Type(
        {
            name: __s("Time Candy"),
            description: __s("Reduces the Borbventure refresh timer."),
            sprite: spr_borbventure_item_time_candy,
            is_usable: true,
            tags: ["candy"],
            
            activate: function(arg0, arg1)
            {
                var value = arg0 * sec(180) * arg1.rarity.level;
                global.borbventures.data.refresh_borbventures_timer_start = max(0, global.borbventures.data.refresh_borbventures_timer_start - value);
                global.borbventures.data.refresh_borbventures_timer_end = max(0, global.borbventures.data.refresh_borbventures_timer_end - value);
                notify(__s("Borbventure refresh timer decreased by %s.", format_time(secr(value))));
            },
            
            can_activate: function(arg0, arg1)
            {
                return !global.borbventures.can_refresh(true);
            }
        }),
        xp_candy: new Borbventure_Item_Type(
        {
            name: __s("XP Candy"),
            description: __s("Add XP for all Borbventurers."),
            sprite: spr_borbventure_item_xp_candy,
            is_usable: true,
            tags: ["candy"],
            
            activate: function(arg0, arg1)
            {
                var xp = 3 * arg1.rarity.level * arg0;
                var __array = global.borbventures.items.borbs;
                var __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    mitem.add_xp(xp);
                }
                notify(__s("%s xp added for %s Borbs.", xp, array_length(global.borbventures.items.borbs)));
            },
            
            can_activate: function(arg0, arg1)
            {
                return array_length(global.borbventures.items.borbs) > 0;
            }
        })
    };
}
