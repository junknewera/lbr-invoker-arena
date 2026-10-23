function init_shop_quarks()
{
    var shop_resource = global.resources.quark;
    variable_struct_set(global.shops_prestige_levels, shop_resource.key, global.prestige_levels.inf);
    variable_struct_set(global.shops, shop_resource.key, 
    {
        reactor_size: 
        {
            index: 10,
            name: __s("Bigger Reactor"),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_icon_quark_reactor,
            cost: build_resource_cost(shop_resource, 2000),
            cost_exp: 4,
            max_count: 0,
            upgrade_attributes: 
            {
                quark_reactor_size: 1
            }
        },
        reactor_count_inc: 
        {
            index: 20,
            name: __s("Faster Reactor"),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_icon_quark_reactor,
            cost: build_resource_cost(shop_resource, 1500),
            cost_exp: 2,
            max_count: 10,
            upgrade_attributes: 
            {
                quark_reactor_inc_count: 0.002
            }
        },
        reactor_add_chance_multiplier: 
        {
            index: 30,
            name: __s("Focused Quarks"),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_icon_quark_reactor,
            cost: build_resource_cost(shop_resource, 2500),
            cost_exp: 2.25,
            max_count: 20,
            upgrade_attributes: 
            {
                quark_reactor_add_chance_multiplier: 0.1
            }
        },
        reactor_add_quark_multiplier: 
        {
            index: 40,
            name: __s("Efficient Quarks"),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_icon_quark_reactor,
            cost: build_resource_cost(shop_resource, 1750),
            cost_exp: 2,
            max_count: 10,
            upgrade_attributes: 
            {
                quark_reactor_add_quark: 0.1
            }
        },
        quark_damage_multiplier: 
        {
            index: 50,
            name: __s("Quark Damage"),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_icon_quark,
            cost: build_resource_cost(shop_resource, 5000),
            cost_exp: 3.5,
            max_count: 5,
            upgrade_attributes: 
            {
                quark_damage_multiplier: 0.2
            }
        },
        resources_multiplier_quark: 
        {
            index: 60,
            name: __s("More %s", global.resources.quark.name_plural),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_leaf_quark,
            cost: build_resource_cost(shop_resource, 500),
            cost_exp: 4,
            max_count: 10,
            upgrade_attributes: 
            {
                resources_multiplier: 
                {
                    quark: 0.05
                }
            }
        },
        quark_damage_blower_damage_multiplier: build_shop_item("quark_damage_blower_damage_multiplier", shop_resource, 2500, 
        {
            name: __s("Quark Damage to Real Damage"),
            sprite: spr_icon_quark,
            base_cost: 5000000,
            cost_exp: 4,
            max_count: 10,
            upgrade_attributes: 
            {
                quark_damage_blower_damage_multiplier: 0.005
            }
        }),
        unlock_quarks_structure: build_shop_item("unlock_quarks_structure", shop_resource, 3000, 
        {
            name: __s("Unlock %s", __("Quarks Structure")),
            description: __("Advanced quark mechanics."),
            sprite: spr_resource_quark_structure,
            base_cost: 75000,
            max_count: 1
        }),
        trade_gems_max_value: build_shop_item("trade_gems_max_value", shop_resource, 4000, 
        {
            base_cost: 5000000,
            max_count: 1,
            value: 1
        }),
        craft_level: build_shop_item("craft_level", shop_resource, 5000, 
        {
            base_cost: 5000000,
            max_count: 1,
            value: 1
        }),
        craft_min_chance: build_shop_item("craft_min_chance", shop_resource, 5010, 
        {
            base_cost: 1000000,
            cost_exp: 2,
            max_count: 10,
            value: 1
        })
    });
    shop_resource = global.resources.quark_structure;
    variable_struct_set(global.shops_prestige_levels, shop_resource.key, global.prestige_levels.inf);
    variable_struct_set(global.shops, shop_resource.key, 
    {
        quark_funnel_time_reduction_multiplier: build_shop_item("quark_funnel_time_reduction_multiplier", shop_resource, 10, 
        {
            name: __("Fast Funnel"),
            sprite: spr_resource_quark_blob,
            base_cost: 25,
            cost_exp: 2.75,
            max_count: 10,
            upgrade_attributes: 
            {
                quark_funnel_time_reduction_multiplier: 0.01
            }
        }),
        quark_energy_charge_multiplier: build_shop_item("quark_energy_charge_multiplier", shop_resource, 20, 
        {
            name: __("Efficient Blobs"),
            sprite: spr_resource_quark_energy,
            base_cost: 50,
            cost_exp: 1.75,
            max_count: 20,
            upgrade_attributes: 
            {
                quark_energy_charge_multiplier: 0.03
            }
        }),
        quark_structurize_multiplier: build_shop_item("quark_structurize_multiplier", shop_resource, 30, 
        {
            name: __("Structurize Multiplier"),
            sprite: spr_resource_quark_structure,
            base_cost: 50,
            cost_exp: 2.8,
            max_count: 10,
            upgrade_attributes: 
            {
                quark_structurize_multiplier: 0.02
            }
        }),
        quark_quantify_time_reduction_multiplier: build_shop_item("quark_quantify_time_reduction_multiplier", shop_resource, 40, 
        {
            name: __("Fast Quantify"),
            sprite: spr_resource_quantum_blob,
            base_cost: 50,
            cost_exp: 2.75,
            max_count: 10,
            upgrade_attributes: 
            {
                quark_quantify_time_reduction_multiplier: 0.05
            }
        }),
        blower_enemy_damage_multiplier_quarks: build_shop_item("blower_enemy_damage_multiplier_quarks", shop_resource, 100, 
        {
            name: __("Quantum Blower Damage"),
            description_prefix: __s("Bonus scales with %s.", global.resources.quantum_blob.name_plural),
            sprite: spr_resource_quantum_blob,
            base_cost: 200,
            cost_exp: 1.15,
            max_count: 0,
            upgrade_attributes: 
            {
                blower_enemy_damage_multiplier_quarks: 0.1
            }
        }),
        quarkstige_damage_multiplier: build_shop_item("quarkstige_damage_multiplier", shop_resource, 1000, 
        {
            name: __("Quarkstigeplier"),
            description_prefix: __s("The more %s, the more damage.", __("Quarkstiges")),
            sprite: spr_resource_quantum_blob,
            base_cost: 3500,
            cost_exp: 1.2,
            max_count: 0,
            upgrade_attributes: 
            {
                quarkstige_damage_multiplier: 0.01
            }
        }),
        quark_damage_blower_damage_multiplier: build_shop_item("quark_damage_blower_damage_multiplier", shop_resource, 1500, 
        {
            name: __s("Quark Damage to Real Damage"),
            sprite: spr_icon_quark,
            base_cost: 250,
            cost_exp: 4,
            max_count: 10,
            upgrade_attributes: 
            {
                quark_damage_blower_damage_multiplier: 0.05
            }
        }),
        quark_resources_enabled_in_bv: build_shop_item("quark_resources_enabled_in_bv", shop_resource, 2000, 
        {
            name: __("Quarkventures"),
            description: __s("Enables quark resources in %s.", __("Borbventures")) + sprintf(" (%s)", __s("Remember to enable this in the Borbventure settings")),
            sprite: spr_borb_jones,
            base_cost: 2000,
            max_count: 1
        }),
        quark_resources_enabled_in_mines: build_shop_item("quark_resources_enabled_in_mines", shop_resource, 2010, 
        {
            name: __("Quarkmines"),
            description: __s("Enables quark resources in %s.", __("Mines")),
            sprite: spr_icon_mine,
            base_cost: 2000,
            max_count: 1,
            
            is_obfuscated: function()
            {
                return !is_unlocked_mines();
            }
        }),
        unlock_leafton: build_shop_item("unlock_leafton", shop_resource, 3000, 
        {
            name: __s("Unlock %s", __("Leafton")),
            sprite: spr_resource_leafton,
            base_cost: 75000,
            max_count: 1
        })
    });
    shop_resource = global.resources.leafton;
    variable_struct_set(global.shops_prestige_levels, shop_resource.key, global.prestige_levels.inf);
    variable_struct_set(global.shops, shop_resource.key, 
    {
        quark_damage_blower_damage_multiplier: build_shop_item("quark_damage_blower_damage_multiplier", shop_resource, 100, 
        {
            name: __s("Quark Damage to Real Damage"),
            sprite: spr_icon_quark,
            base_cost: 250,
            cost_exp: 4,
            max_count: 10,
            upgrade_attributes: 
            {
                quark_damage_blower_damage_multiplier: 0.1
            }
        }),
        auto_restart_leafton_pit: build_shop_item("auto_restart_leafton_pit", shop_resource, 1000, 
        {
            name: __s("Borb %s Taxi", __("Leafton Pit")),
            description: __s("Automatically transports you back to %s when you get blown away or cleared a floor at the cost of %s.", global.areas.leafton_pit.name, format_result_text(global.costs.borb_taxi_leafton_pit)),
            sprite: spr_borb,
            base_cost: 750,
            max_count: 1,
            is_toggle: true
        }),
        leafton_pit_duration: build_shop_item("leafton_pit_duration", shop_resource, 1100, 
        {
            name: __s("%s Seconds", __("Leafton Pit")),
            sprite: spr_resource_leafton,
            base_cost: 150,
            cost_exp: 2.75,
            max_count: 5,
            upgrade_attributes: 
            {
                leafton_pit_duration: 1
            }
        }),
        leafton_pit_reward_multiplier: build_shop_item("leafton_pit_reward_multiplier", shop_resource, 1200, 
        {
            name: __s("%s Reward", __("Leafton Pit")),
            sprite: spr_resource_leafton,
            base_cost: 100,
            cost_exp: 2.5,
            max_count: 10,
            upgrade_attributes: 
            {
                leafton_pit_reward_multiplier: 0.1
            }
        }),
        leafton_pit_reward_quark_blob: build_shop_item("leafton_pit_reward_quark_blob", shop_resource, 1300, 
        {
            name: __s("%s Reward", __("Quark Blob")),
            sprite: spr_resource_quark_blob,
            base_cost: 350,
            cost_exp: 1.6,
            max_count: 10,
            upgrade_attributes: 
            {
                leafton_pit_reward_quark_blob: 0.1
            }
        }),
        leafton_pit_reward_quark_structure: build_shop_item("leafton_pit_reward_quark_structure", shop_resource, 1310, 
        {
            name: __s("%s Reward", __("Quark Structure")),
            sprite: spr_resource_quark_structure,
            base_cost: 700,
            cost_exp: 1.4,
            max_count: 10,
            upgrade_attributes: 
            {
                leafton_pit_reward_quark_structure: 0.1
            }
        }),
        leafton_pit_reward_quantum_blob: build_shop_item("leafton_pit_reward_quantum_blob", shop_resource, 1320, 
        {
            name: __s("%s Reward", __("Quantum Blob")),
            sprite: spr_resource_quantum_blob,
            base_cost: 1500,
            cost_exp: 1.3,
            max_count: 10,
            upgrade_attributes: 
            {
                leafton_pit_reward_quantum_blob: 0.1
            }
        }),
        leafton_pit_quark_boost_chance: build_shop_item("leafton_pit_quark_boost_chance", shop_resource, 1400, 
        {
            name: __s("Quark Boosted Enemies"),
            sprite: spr_icon_quark,
            base_cost: 350,
            cost_exp: 1.8,
            max_count: 10,
            upgrade_attributes: 
            {
                leafton_pit_quark_boost_chance: 0.02
            }
        }),
        leafton_pit_enemy_spawn_count: build_shop_item("leafton_pit_enemy_spawn_count", shop_resource, 1500, 
        {
            name: __s("Enemy Spawn Count"),
            sprite: spr_resource_leafton,
            base_cost: 600,
            cost_exp: 4,
            max_count: 3,
            upgrade_attributes: 
            {
                leafton_pit_enemy_spawn_count: 1
            }
        })
    });
}
