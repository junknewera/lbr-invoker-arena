function init_shop_menus()
{
    init_shop_menus_events();
    init_shop_menus_leaves();
    init_shop_menus_options();
    init_shop_menus_prestige();
    init_shop_menus_stats();
    init_shop_menus_tokens();
    global.shop_items_weapons_array = [];
    global.shop_items_weapons_array_sections = {};
    for (var i = 0; i < array_length(global.shops_sorted.weapons); i++)
    {
        var item = variable_struct_get(global.shops.weapons, global.shops_sorted.weapons[i].key);
        var level_menu_item = new Gui_Item(UnknownEnum.Value_47, id, 
        {
            draw_fav: true,
            item: item,
            section: variable_struct_get(global.dialog_sections.shop_blowers, item.type.key),
            
            button_text: function()
            {
                if (get_upgrade_count(self.item) == 1)
                {
                    if (o_blower.blower.key == self.item.key)
                    {
                        return __("Equipped");
                    }
                    return __("Equip");
                }
                return __("Buy");
            },
            
            buy_max: false,
            
            check: function()
            {
                var item_cost = get_item_cost(self.item);
                if (self.item.data.count == 0)
                {
                    return has_enough_resources(item_cost);
                }
                if (o_blower.blower.key == self.item.key)
                {
                    return false;
                }
                return true;
            },
            
            func: function()
            {
                if (self.item.data.count == 0)
                {
                    self.item.data.count++;
                    self.item.data.collected++;
                    dec_resources(get_item_cost(self.item), false);
                }
                change_blower(self.item);
                if (self.item.is_alb_equippable())
                {
                    change_alb_blower(self.item);
                }
                init_game_vars(true);
            },
            
            is_hidden_until_bought: true,
            
            add_draw: function(arg0, arg1, arg2)
            {
                var blower = arg0.item;
                if (get_upgrade_count(blower) > 0)
                {
                    var can_do_action_pl = o_blower.blower.key != blower.key;
                    var can_do_action_alb = o_game.data.current_alb_weapon_key != blower.key;
                    if (get_upgrade_count(global.shops.blc.albs_tools) > 0)
                    {
                        if (gui_button_sprite(arg1 + gui_col_x(18.2), arg2 + gui_col_y(0.5), spr_player, can_do_action_pl, false, 
                        {
                            tooltip: __("Equip tool on player")
                        }))
                        {
                            change_blower(blower);
                        }
                        if (arg0.item.is_alb_equippable() && gui_button_sprite(arg1 + gui_col_x(19.2), arg2 + gui_col_y(0.5), spr_autoblower, can_do_action_alb, false, 
                        {
                            tooltip: __("Equip tool on ALBs")
                        }))
                        {
                            change_alb_blower(blower);
                        }
                    }
                }
            }
        });
        array_push(variable_struct_get(shop_items, UnknownEnum.Value_37), level_menu_item);
        array_push(global.shop_items_weapons_array, level_menu_item);
        if (!is_array(variable_struct_get(global.shop_items_weapons_array_sections, item.type.key)))
        {
            variable_struct_set(global.shop_items_weapons_array_sections, item.type.key, []);
        }
        array_push(variable_struct_get(global.shop_items_weapons_array_sections, item.type.key), level_menu_item);
    }
    variable_struct_set(titles, UnknownEnum.Value_1, 
    {
        title: __("Achievements"),
        subtitle: __("Play, idle, get achievements.")
    });
    variable_struct_set(titles, UnknownEnum.Value_3, 
    {
        title: __("Areas") + " **",
        subtitle: __("Discover areas to find rare leaves. Some leaves only spawn in certain areas.")
    });
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_3), new Gui_Item(UnknownEnum.Value_2, id));
    variable_struct_set(titles, UnknownEnum.Value_7, 
    {
        title: __("Cards") + " ****",
        subtitle: __("Boost your stats with Cards! Cards can be obtained by defeating enemies (requires an upgrade in the MLC shop). Each enemy has a chance to drop a card of its own type.")
    });
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_7), new Gui_Item(UnknownEnum.Value_7, id));
    variable_struct_set(titles, UnknownEnum.Value_21, 
    {
        title: __("Milestones"),
        subtitle: __("Climb up or down and get some milestone rewards!")
    });
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_21), new Gui_Item(UnknownEnum.Value_32, id));
    variable_struct_set(titles, UnknownEnum.Value_76, 
    {
        title: __("Prestige"),
        subtitle: __("Enter the Leaf Portal to restart your blowing adventure with some coins. 20+ coins recommended at first prestige.")
    });
    variable_struct_set(shop_items, UnknownEnum.Value_76, [new Gui_Item("prestige", id, global.prestige_levels.prestige)]);
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_76), new Gui_Item(UnknownEnum.Value_40, id, 
    {
        is_visible: function()
        {
            var res = get_prestige_resources(false, global.prestige_levels.prestige.level);
            return res.coins > 0;
        },
        
        resources: function()
        {
            return get_prestige_resources(false, global.prestige_levels.prestige.level);
        }
    }));
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_76), new Gui_Item(UnknownEnum.Value_5, id, 
    {
        button_text: __("Prestige"),
        
        check: function()
        {
            var prestige_resources = get_prestige_resources(false, global.prestige_levels.prestige.level);
            return prestige_resources.coins > 0;
        },
        
        func: function()
        {
            confirm_dialog("Do you want to prestige now?", function()
            {
                prestige_exec(global.prestige_levels.prestige.level);
            });
        },
        
        hotkey: 32
    }));
    variable_struct_set(titles, UnknownEnum.Value_77, 
    {
        title: __("Big Leaf Crunch"),
        subtitle: __("Enter the Big Leaf Crunch Portal to restart your blowing adventure with some BLC Coin(s).")
    });
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_77), new Gui_Item(UnknownEnum.Value_54, id, 
    {
        is_visible: function()
        {
            return true;
        },
        
        text: __("Restart your leaf blowing adventure with valuable BLC Coins. All upgrades will be reset with some exceptions (shops marked with ** will persist).")
    }));
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_77), new Gui_Item(UnknownEnum.Value_40, id, 
    {
        is_visible: function()
        {
            return true;
        },
        
        resources: function()
        {
            return get_prestige_resources(false, global.prestige_levels.blc.level);
        }
    }));
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_77), new Gui_Item(UnknownEnum.Value_51, id));
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_77), new Gui_Item(UnknownEnum.Value_5, id, 
    {
        button_text: "Crunch",
        
        check: function()
        {
            return true;
        },
        
        func: function()
        {
            confirm_dialog("Do you want to enter the Big Leaf Crunch Portal now?", function()
            {
                prestige_exec(global.prestige_levels.blc.level);
            });
        },
        
        hotkey: 32
    }));
    variable_struct_set(titles, UnknownEnum.Value_78, 
    {
        title: __("Mega Leaf Crunch"),
        subtitle: __("Enter the Mega Leaf Crunch Portal to restart your blowing adventure with some MLC Coin(s).")
    });
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_78), new Gui_Item(UnknownEnum.Value_54, id, 
    {
        is_visible: function()
        {
            return true;
        },
        
        text: __("Restart your leaf blowing adventure with valuable MLC Coins. All upgrades will be reset with some exceptions (shops marked with *** will persist). The amount of MLC coins is based on your highest tower floor as well as your current amount of BLC coins.")
    }));
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_78), new Gui_Item(UnknownEnum.Value_40, id, 
    {
        is_visible: function()
        {
            return true;
        },
        
        resources: function()
        {
            return get_prestige_resources(false, global.prestige_levels.mlc.level);
        }
    }));
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_78), new Gui_Item(UnknownEnum.Value_51, id));
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_78), new Gui_Item(UnknownEnum.Value_5, id, 
    {
        button_text: __s("Mega Crunch"),
        
        check: function()
        {
            return true;
        },
        
        func: function()
        {
            confirm_dialog(__("Do you want to enter the Mega Leaf Crunch Portal now?"), function()
            {
                prestige_exec(global.prestige_levels.mlc.level);
            });
        },
        
        hotkey: 32
    }));
    variable_struct_set(titles, UnknownEnum.Value_12, 
    {
        title: __("Daily Rewards"),
        subtitle: __("Check your daily rewards here.")
    });
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_12), new Gui_Item(UnknownEnum.Value_54, id, 
    {
        text: function()
        {
            if (daily_reward_claimed())
            {
                return __("You have already claimed your daily reward. Don't be too greedy!");
            }
        }
    }), new Gui_Item(UnknownEnum.Value_54, id, 
    {
        is_visible: function()
        {
            return !daily_reward_claimed();
        },
        
        text: function()
        {
            var text = [];
            if (global.is_mobile && instance_exists(o_mobile_helper) && !o_mobile_helper.got_purchase_data)
            {
                array_push(text, __("Purchase data not retrieved yet, please wait. You might be missing out your pack bonuses."));
            }
            array_push(text, __("Your daily reward:"));
            return implode("\n", text);
        }
    }), new Gui_Item(UnknownEnum.Value_41, id, 
    {
        is_visible: function()
        {
            return !daily_reward_claimed();
        },
        
        result: function()
        {
            return get_daily_reward_resources();
        }
    }), new Gui_Item(UnknownEnum.Value_51, -1, 
    {
        height: 60
    }), new Gui_Item(UnknownEnum.Value_54, id, 
    {
        text: function()
        {
            return global.await_async_action_text;
        }
    }));
    variable_struct_set(titles, UnknownEnum.Value_19, 
    {
        title: __("Leaf Blower's Journey"),
        subtitle: ""
    });
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_19), new Gui_Item(UnknownEnum.Value_31, id));
    variable_struct_set(titles, UnknownEnum.Value_16, 
    {
        title: __("Guide"),
        subtitle: ""
    });
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_16), new Gui_Item(UnknownEnum.Value_25, id, 
    {
        guide: global.guide
    }));
    variable_struct_set(titles, UnknownEnum.Value_92, 
    {
        title: __("Unique Leaves") + " ****",
        subtitle: __("These leaves only spawn under certain conditions. Their buffs only apply when active.")
    });
    var __array = global.unique_leaves_sorted;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        array_push(variable_struct_get(shop_items, UnknownEnum.Value_92), new Gui_Item(UnknownEnum.Value_13, id, 
        {
            pos_button_use_x: gui_col_x(16)
        }, mitem));
    }
    variable_struct_set(shop_items, UnknownEnum.Value_73, get_shop_items(global.shops.pets, global.shops_sorted.pets, undefined, global.dialog_sections.pets.pets));
    variable_struct_set(titles, UnknownEnum.Value_73, 
    {
        title: __("Pets") + " ****",
        subtitle: ""
    });
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_73), new Gui_Item(UnknownEnum.Value_37, id, 
    {
        section: global.dialog_sections.pets.teams
    }));
    variable_struct_set(titles, UnknownEnum.Value_32, 
    {
        title: __("Artifacts") + " ****",
        subtitle: ""
    });
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_32), new Gui_Item(UnknownEnum.Value_14, id, 
    {
        items: global.artifacts_sorted,
        sections_key: "artifacts",
        show_fav: true,
        
        add_description: function()
        {
            return get_option(global.options.artifact_list_padding) == "default";
        }
    }));
    variable_struct_set(titles, UnknownEnum.Value_8, 
    {
        title: __("Challenges"),
        subtitle: __("Take on several leaf blowing challenges to receive great bonuses.")
    });
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_8), new Gui_Item(UnknownEnum.Value_9, id));
    variable_struct_set(titles, UnknownEnum.Value_2, 
    {
        title: __("Alchemy") + " ****",
        subtitle: __("Throw a bunch of materials into a large pot, wait, and hopefully, nothing will explode.")
    });
    __array = global.recipes_sorted;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        array_push(variable_struct_get(shop_items, UnknownEnum.Value_2), new Gui_Item(UnknownEnum.Value_13, id, mitem));
    }
    variable_struct_set(titles, UnknownEnum.Value_5, 
    {
        title: __("Borbventure") + " ****",
        subtitle: __("Send Borbs on adventures to find rare resources and items.")
    });
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_5), new Gui_Item(UnknownEnum.Value_3, id));
    variable_struct_set(titles, UnknownEnum.Value_6, 
    {
        title: __("Control Panel")
    });
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_6), new Gui_Item(UnknownEnum.Value_4, id));
    variable_struct_set(titles, UnknownEnum.Value_9, 
    {
        title: __("Chests") + " ***",
        subtitle: __("Chests contain valuable resources, artifacts, equipment items and more. Open multiple chests by holding down ctrl, alt or shift.")
    });
    _map(global.chests_array, function(arg0)
    {
        array_push(variable_struct_get(shop_items, UnknownEnum.Value_9), new Gui_Item(UnknownEnum.Value_13, id, arg0));
    });
    variable_struct_set(titles, UnknownEnum.Value_43, 
    {
        title: __("Converters") + " *",
        subtitle: ""
    });
    variable_struct_set(titles, UnknownEnum.Value_11, 
    {
        title: __("Crafting") + " ****",
        subtitle: __("Craft individual leaves which can provide huge boosts. Leaves in backpack don't provide any bonuses.")
    });
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_11), new Gui_Item(UnknownEnum.Value_11, id));
    variable_struct_set(titles, UnknownEnum.Value_15, 
    {
        title: __("Equipment") + " ***",
        subtitle: __("Enemies in The Leaf Tower can drop valuable items.")
    });
    _map(global.equipment_array, function(arg0)
    {
        array_push(variable_struct_get(shop_items, UnknownEnum.Value_15), new Gui_Item(UnknownEnum.Value_13, id, arg0));
    });
    variable_struct_set(titles, UnknownEnum.Value_17, 
    {
        title: __("House Constructor") + " ****",
        subtitle: __("Place house items with left mouse click. Pick up items with right mouse click. Scroll through item sprites with mouse scroll. Place/remove multiple items with shift + click. Left click on a placed item selects the same tile. Each unlocked house item adds +25% to all leaf rewards and some items may add more bonuses.")
    });
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_17), new Gui_Item(UnknownEnum.Value_26, id));
    variable_struct_set(titles, UnknownEnum.Value_10, 
    {
        title: __("Community Leaves") + " ****",
        subtitle: sprintf(__("Find and collect the community leaves. Each collected community leaf adds +%s% to all leaf rewards. Community leaves spawn rarily but they can be found elsewhere."), 5)
    });
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_10), new Gui_Item(UnknownEnum.Value_12, id, 
    {
        items: global.community_leaves,
        items_array: global.community_leaves_array,
        shown_on_hover: true
    }));
    variable_struct_set(titles, UnknownEnum.Value_18, 
    {
        title: __("Leafscension") + " ****",
        subtitle: __("Transcend leaves to more powerful leaves by Leafscension.")
    });
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_18), new Gui_Item(UnknownEnum.Value_28, id));
    variable_struct_set(titles, UnknownEnum.Value_20, 
    {
        title: __("Materials") + " ***",
        subtitle: __("Materials can spawn all over the world. Some materials can be crafted from certain leaves.")
    });
    variable_struct_set(titles, UnknownEnum.Value_27, 
    {
        title: __("Leaf Relics") + " ****",
        subtitle: __("Relics increase your blowing damage depending on the current number of Leafscended leaves for the relevant type.")
    });
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_27), new Gui_Item(UnknownEnum.Value_12, id, 
    {
        columns: 16,
        display_count: true,
        items: global.relics,
        items_array: global.relics_array,
        sections_key: "relics"
    }));
    variable_struct_set(titles, UnknownEnum.Value_28, 
    {
        title: __("Scrolls") + " ***",
        subtitle: __("Scrolls provide temporary boosts. These are dropped by tower bosses. Alternatively, you can get them in arcade machines in a famous pub.")
    });
    __array = global.scrolls_sorted;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        array_push(variable_struct_get(shop_items, UnknownEnum.Value_28), new Gui_Item(UnknownEnum.Value_13, id, undefined, mitem));
    }
    variable_struct_set(shop_items, UnknownEnum.Value_45, get_shop_items(global.shops.dlc, global.shops_sorted.dlc, UnknownEnum.Value_48));
    variable_struct_set(titles, UnknownEnum.Value_45, 
    {
        title: __("Supporter Shop") + " ****",
        subtitle: ""
    });
    array_insert(variable_struct_get(shop_items, UnknownEnum.Value_45), 0, new Gui_Item(UnknownEnum.Value_54, id, 
    {
        text: __("DLC packs are optional, and you don't need these to progress further into the game. However, you can support my work by purchasing the DLC packs so I can continue working on this game. Thanks :)") + " " + __("Note: DLC packs don't transfer between Steam/Android/iOS but daily rewards can be claimed once per platform.")
    }));
    variable_struct_set(shop_items, UnknownEnum.Value_52, get_shop_items(global.shops.farming, global.shops_sorted.farming));
    variable_struct_set(titles, UnknownEnum.Value_52, 
    {
        title: __("Farming Shop") + " **",
        subtitle: __("Seeds increase the amount of your current leaves by 1% per level.")
    });
    variable_struct_set(shop_items, UnknownEnum.Value_61, get_shop_items(global.shops.gems, global.shops_sorted.gems));
    variable_struct_set(titles, UnknownEnum.Value_61, 
    {
        title: __("Gems Shop") + get_shop_menu_stars("gems"),
        subtitle: __("Gems can be collected by completing achievements, claiming the daily reward or by purchasing DLC packs to support my work. Gems are completely optional and they are not needed to progress further into the game.")
    });
    array_insert(variable_struct_get(shop_items, UnknownEnum.Value_61), 0, new Gui_Item(UnknownEnum.Value_54, id, 
    {
        section: global.dialog_sections.shop_gems.supporter,
        text: __s("These upgrades are available for supporters only. Supporter Perks are divided into different tiers: %s", "T1 = All packs (except Premium/Gems), T2 = Premium Pack")
    }));
    variable_struct_set(shop_items, UnknownEnum.Value_70, get_shop_items(global.shops.mulch, global.shops_sorted.mulch));
    variable_struct_set(titles, UnknownEnum.Value_70, 
    {
        title: __("Mulch Shop") + " ***",
        subtitle: ""
    });
    variable_struct_set(shop_items, UnknownEnum.Value_79, get_shop_items(global.shops.printers, global.shops_sorted.printers));
    variable_struct_set(titles, UnknownEnum.Value_79, 
    {
        title: __("Printers Shop") + " *",
        subtitle: __("Printers print leaves every second. Join the printers cult!")
    });
    variable_struct_set(shop_items, UnknownEnum.Value_84, get_shop_items(global.shops.skins, global.shops_sorted.skins));
    variable_struct_set(titles, UnknownEnum.Value_84, 
    {
        title: __("Skins Shop") + get_shop_menu_stars("skins"),
        subtitle: ""
    });
    variable_struct_set(titles, UnknownEnum.Value_91, 
    {
        title: __("Trading") + " **",
        subtitle: __("Trading can be a good source of additional resource income. For each completed trade, you will also receive one cheese.")
    });
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_91), new Gui_Item(UnknownEnum.Value_57, id));
    variable_struct_set(shop_items, UnknownEnum.Value_38, get_shop_items(global.shops.borbs, global.shops_sorted.borbs));
    variable_struct_set(titles, UnknownEnum.Value_38, 
    {
        title: __("Borbs Borb") + " **",
        subtitle: "Borb, borb borb. Borb borb borb, borb borb. BORB, BORB!"
    });
    variable_struct_set(shop_items, UnknownEnum.Value_39, get_shop_items(global.shops.cards_transcension, global.shops_sorted.cards_transcension));
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_13), new Gui_Item(UnknownEnum.Value_17, id));
    variable_struct_set(titles, UnknownEnum.Value_13, 
    {
        title: __("Death Book") + " ****",
        subtitle: __s("Upgrade passive enemy rewards. The %s does not work with time skips.", __("Death Book"))
    });
    variable_struct_set(shop_items, UnknownEnum.Value_86, get_shop_items(global.shops.soul_entities, global.shops_sorted.soul_entities));
    variable_struct_set(titles, UnknownEnum.Value_86, 
    {
        title: __("Soul Shop") + " ***",
        subtitle: __s("%s may drop in the %s.", global.resources.soul_particles.name, global.areas.soul_crypt.name)
    });
    variable_struct_set(shop_items, UnknownEnum.Value_87, get_shop_items(global.shops.soul_forge, global.shops_sorted.soul_forge));
    shop_items.dice = get_shop_items(global.shops.dice, global.shops_sorted.dice);
    shop_items.fish = get_shop_items(global.shops.fish, global.shops_sorted.fish);
    shop_items.harbor = get_shop_items(global.shops.harbor, global.shops_sorted.harbor);
    shop_items.mines = get_shop_items(global.shops.mines, global.shops_sorted.mines);
    shop_items.quark = get_shop_items(global.shops.quark, global.shops_sorted.quark);
    shop_items.quark_structure_shop = get_shop_items(global.shops.quark_structure, global.shops_sorted.quark_structure);
    shop_items.leafton_shop = get_shop_items(global.shops.leafton, global.shops_sorted.leafton);
    shop_items.dusk = get_shop_items(global.shops.dusk, global.shops_sorted.dusk);
    if (is_struct(global.online_shops))
    {
        build_mp_shops_items(global.online_shops);
    }
}

function init_shop_menus_events()
{
    shop_items.event_halloween = get_shop_items(global.shops.event, global.shops_sorted.event);
    variable_struct_set(shop_items, UnknownEnum.Value_50, [new Gui_Item(UnknownEnum.Value_49, id, 
    {
        has_general_page: true,
        sections: global.dialog_sections.event,
        shops: [
        {
            shop_key: "halloween",
            shop: get_shop_items(global.shops.event, global.shops_sorted.event),
            section: global.dialog_sections.event.halloween
        }, 
        {
            shop_key: "nature_season",
            shop: get_shop_items(global.shops.event_nature, global.shops_sorted.event_nature),
            section: global.dialog_sections.event.nature_season
        }, 
        {
            shop_key: "anniversary",
            shop: get_shop_items(global.shops.event_anniversary, global.shops_sorted.event_anniversary),
            section: global.dialog_sections.event.anniversary
        }]
    })]);
    variable_struct_set(titles, UnknownEnum.Value_50, 
    {
        title: __("Event Shop") + " ****",
        subtitle: ""
    });
    variable_struct_set(titles, UnknownEnum.Value_29, 
    {
        title: __("Season Pass") + " ****",
        subtitle: __("")
    });
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_29), new Gui_Item(UnknownEnum.Value_44, id, 
    {
        season_pass: global.season_pass.nature
    }));
    titles.event_nature_butterfly = 
    {
        title: __("Butterflies"),
        subtitle: __("Butterflies increase plant field bonuses.")
    };
    titles.event_nature_plants = 
    {
        title: __("Plants"),
        subtitle: __("Plants increase your Nature XP and provide useful bonuses.")
    };
    shop_items.event_nature = get_shop_items(global.shops.event_nature, global.shops_sorted.event_nature);
    shop_items.event_anniversary = get_shop_items(global.shops.event_anniversary, global.shops_sorted.event_anniversary);
    shop_items.event_nature_plants = [new Gui_Item(UnknownEnum.Value_45, id, 
    {
        before_draw: season_pass_nature_gui_before_selection,
        list_props: 
        {
            button_func: function(arg0)
            {
                if (!is_struct(arg0))
                {
                    exit;
                }
                global.selected_plant = arg0;
            },
            
            columns: 8,
            display_count: true,
            display_count_data: true,
            fixed_y: false,
            height: gui_col_y(12),
            items_array: global.resources_plants,
            
            is_unlocked_func: function(arg0)
            {
                return arg0.data.collected_total > 0;
            },
            
            selected_key: function()
            {
                return get_default_struct_value(global.selected_plant, "key", "");
            },
            
            width: gui_col_x(12)
        },
        
        selected_item: function()
        {
            return is_struct(global.selected_plant) ? global.selected_plant : undefined;
        },
        
        selected_item_draw_func: season_pass_nature_gui_draw_item_actions,
        
        selected_item_is_unlocked_func: function(arg0)
        {
            return arg0.data.collected_total > 0;
        }
    })];
    shop_items.event_nature_butterfly = [new Gui_Item(UnknownEnum.Value_45, id, 
    {
        before_draw: season_pass_nature_gui_before_selection_butterflies,
        list_props: 
        {
            button_func: function(arg0)
            {
                if (!is_struct(arg0))
                {
                    exit;
                }
                global.selected_plant = arg0;
            },
            
            columns: 8,
            display_count: true,
            display_count_data: true,
            fixed_y: false,
            height: gui_col_y(12),
            items_array: global.resources_types.butterfly,
            
            is_unlocked_func: function(arg0)
            {
                return arg0.data.collected_total > 0;
            },
            
            selected_key: function()
            {
                return get_default_struct_value(global.selected_plant, "key", "");
            },
            
            width: gui_col_x(12)
        },
        
        selected_item: function()
        {
            return is_struct(global.selected_plant) ? global.selected_plant : undefined;
        },
        
        selected_item_draw_func: season_pass_nature_gui_draw_item_actions_butterflies,
        
        selected_item_is_unlocked_func: function(arg0)
        {
            return arg0.data.collected_total > 0;
        }
    })];
}

function init_shop_item_tags()
{
    global.shop_item_tags = 
    {
        combo: 100,
        farming: 200,
        fishing: 201,
        pets: 250,
        printer: 300,
        relics: 320,
        scrolls: 350,
        trade: 400,
        unknown: 1000
    };
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_7,
    Value_8,
    Value_9,
    Value_10,
    Value_11,
    Value_12,
    Value_13,
    Value_14,
    Value_15,
    Value_16,
    Value_17,
    Value_18,
    Value_19,
    Value_20,
    Value_21,
    Value_25 = 25,
    Value_26,
    Value_27,
    Value_28,
    Value_29,
    Value_31 = 31,
    Value_32,
    Value_37 = 37,
    Value_38,
    Value_39,
    Value_40,
    Value_41,
    Value_43 = 43,
    Value_44,
    Value_45,
    Value_47 = 47,
    Value_48,
    Value_49,
    Value_50,
    Value_51,
    Value_52,
    Value_54 = 54,
    Value_57 = 57,
    Value_61 = 61,
    Value_70 = 70,
    Value_73 = 73,
    Value_76 = 76,
    Value_77,
    Value_78,
    Value_79,
    Value_84 = 84,
    Value_86 = 86,
    Value_87,
    Value_91 = 91,
    Value_92
}
