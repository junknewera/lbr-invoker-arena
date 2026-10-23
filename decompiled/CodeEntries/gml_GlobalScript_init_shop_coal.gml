function init_shop_coal()
{
    var shop_resource = global.resources.coal;
    variable_struct_set(global.shops_prestige_levels, shop_resource.key, global.prestige_levels.mlc);
    variable_struct_set(global.shops, shop_resource.key, 
    {
        unlock_mines: build_shop_item("unlock_mines", shop_resource, -10, 
        {
            name: __("Unlock Mines"),
            description: __("Exploit coal veins, discover mine caves, drill deep into the Fire Field depths for exclusive rewards."),
            sprite: spr_icon_mine,
            base_cost: 5000,
            max_count: 1
        }),
        fertilizer: build_shop_item("fertilizer", shop_resource, 0),
        leaf_marketing: build_shop_item("leaf_marketing", shop_resource, 10, 
        {
            cost_exp: 1.25,
            max_count: 0
        }),
        damage_types_environment_resistance_heat: 
        {
            index: 100,
            name: __s("%s Resistance", global.damage_types_environment.heat.name),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_icon_fire,
            cost: build_resource_cost(shop_resource, 250),
            cost_exp: 1.75,
            max_count: 10,
            upgrade_attributes: 
            {
                damage_types_environment_resistance: 
                {
                    heat: 0.02
                }
            }
        },
        leaf_crumble_duration: 
        {
            index: 200,
            name: __s("Anti-Crumble"),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: global.resources.coal.sprite,
            cost: build_resource_cost(shop_resource, 200),
            cost_exp: 1.3,
            max_count: 0,
            upgrade_attributes: 
            {
                leaf_crumble_duration: 0.1
            }
        },
        ff_prison_hints: 
        {
            index: 300,
            name: __s("Prison Hint"),
            description: __s("Adds a hint to the prison riddle."),
            description_locked: __s("Find the %s in uncommon Borbventures.", "Borbcipherer"),
            sprite: spr_icon_borbcipherer,
            cost: build_resource_cost(shop_resource, 25000),
            cost_exp: 1.5,
            max_count: global.game_settings.ff_prison_length,
            
            is_obfuscated: function()
            {
                return !area_bought(global.areas.fire_temple) || o_game.data.stats.borbcipherer == 0;
            }
        },
        persistent_boss_hp_regeneration: 
        {
            index: 350,
            name: __("Boss Anti-Regeneration"),
            description: __("Persistent bosses do not regenerate HP when you were blown away."),
            sprite: spr_icon_heart,
            cost: build_resource_cost(shop_resource, 100000),
            
            is_obfuscated: function()
            {
                return get_upgrade_count(global.areas.shadow_cavern) == 0;
            },
            
            upgrade_attributes: 
            {
                persistent_boss_hp_regeneration: 1
            }
        },
        enemy_add_damage_multiplier_green_flame: 
        {
            index: 400,
            name: __s("%s Vulnerability", __("Green Flame")),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_icon_green_flame,
            cost: build_resource_cost(shop_resource, 500000),
            cost_exp: 1.75,
            max_count: 0,
            upgrade_attributes: 
            {
                enemy_add_damage_multiplier: 
                {
                    boss_green_flame: 0.5
                }
            },
            
            is_obfuscated: function()
            {
                return !get_value_ext(global.areas.flame_brazier, global.areas.flame_brazier.check);
            }
        },
        spectralseeker_green_flame_multiplier: 
        {
            index: 500,
            name: __s("%s Vulnerability", __("Spectralseeker")),
            
            description: function()
            {
                return concatstr_nl(__s("%s receives %s more damage after each defeat of %s.", __("Spectralseeker"), number_format_percent(1), __("Green Flame")), __s("Current vulnerability level: %s", global.enemies.boss_green_flame.get_defeat_counter()));
            },
            
            sprite: spr_boss_chimera,
            cost: build_resource_cost(shop_resource, 2000000),
            cost_exp: 2.75,
            max_count: 0,
            upgrade_attributes: 
            {
                spectralseeker_green_flame_multiplier: 1
            },
            
            is_obfuscated: function()
            {
                return !get_value_ext(global.areas.fire_universe, global.areas.fire_universe.check);
            }
        },
        unlock_cards_auto_ascend: build_shop_item("unlock_cards_auto_ascend", shop_resource, 900, 
        {
            name: __("Auto ascend"),
            sprite: spr_card_common,
            base_cost: 1000000,
            max_count: 1,
            description: __s("Unlocks %s", __("Auto ascend"))
        }),
        unlock_cards_auto_transcend: build_shop_item("unlock_cards_auto_transcend", shop_resource, 901, 
        {
            name: __("Auto transcend"),
            sprite: spr_card_common,
            base_cost: 10000000,
            max_count: 1,
            description: __s("Unlocks %s", __("Auto transcend"))
        }),
        leafscenders_safe_mode: build_shop_item("leafscenders_safe_mode", shop_resource, 902, 
        {
            name: __("Leafscender Safe Mode"),
            description: __s("Automatic leafscensions keep %s input leaf in reserve and will not start if only the listed amount remains.", 1),
            sprite: spr_icon_leafscension,
            base_cost: 10000000,
            max_count: 1,
            
            is_obfuscated: function()
            {
                return !is_unlocked_leafscension();
            }
        }),
        craft_level: build_shop_item("craft_level", shop_resource, 1000, 
        {
            base_cost: 5000000,
            cost_exp: 24,
            max_count: 1,
            value: 1
        }),
        craft_min_chance: build_shop_item("craft_min_chance", shop_resource, 1010, 
        {
            base_cost: 1000000,
            cost_exp: 3,
            max_count: 10,
            value: 1
        }),
        craft_leaf_type_sacred: build_shop_item("craft_leaf_type_sacred", shop_resource, 4000, 
        {
            name: __s("Craft Formula: %s", global.resources.sacred.name_plural),
            description_locked: __s("Defeat %s to unlock this upgrade.", global.enemies.boss_green_flame.name),
            sprite: spr_leaf_sacred,
            base_cost: 10000000,
            max_count: 1,
            upgrade_attributes: 
            {
                craft_leaf_type_manual: 
                {
                    sacred: 1
                }
            },
            
            is_obfuscated: function()
            {
                return global.enemies.boss_green_flame.get_current_defeat_counter() == 0;
            }
        }),
        craft_leaf_type_biotite: build_shop_item("craft_leaf_type_biotite", shop_resource, 4010, 
        {
            name: __s("Craft Formula: %s", global.resources.biotite.name_plural),
            description_locked: __s("Defeat %s to unlock this upgrade.", global.enemies.boss_spectralseeker.name),
            sprite: spr_leaf_biotite,
            base_cost: 100000000,
            max_count: 1,
            upgrade_attributes: 
            {
                craft_leaf_type_manual: 
                {
                    biotite: 1
                }
            },
            
            is_obfuscated: function()
            {
                return global.enemies.boss_spectralseeker.get_current_defeat_counter() == 0;
            }
        }),
        trade_gems_max_value: build_shop_item("trade_gems_max_value", shop_resource, 5000, 
        {
            base_cost: 10000000,
            max_count: 1,
            value: 1
        })
    });
}
