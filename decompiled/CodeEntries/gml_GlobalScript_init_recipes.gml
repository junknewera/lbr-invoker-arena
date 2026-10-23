function init_recipes()
{
    global.recipes = 
    {
        random_artifact: new Recipe(
        {
            index: 1000,
            name: __("Artifacts"),
            description: __("Create %s random artifacts."),
            scale_value: 3,
            sprite: spr_artifact_orb,
            input_materials: 
            {
                mysterious_plant: 50,
                eyeball: 50
            },
            input_resources: 
            {
                flask_red: 100000
            },
            unlock_cost: 
            {
                materials: 
                {
                    mysterious_plant: 100,
                    eyeball: 100
                }
            },
            
            output: function()
            {
                return 
                {
                    artifacts: create_random_collection_struct(get_droppable_artifacts(), 3)
                };
            }
        }),
        random_equipment: new Recipe(
        {
            index: 1010,
            name: __("Equipment Items"),
            description: __("Create %s random equipment items."),
            scale_value: 5,
            sprite: spr_equip_shield,
            input_materials: 
            {
                batwing: 60,
                leather: 60
            },
            input_resources: 
            {
                flask_blue: 100000
            },
            unlock_cost: 
            {
                materials: 
                {
                    batwing: 100,
                    leather: 100
                }
            },
            
            output: function()
            {
                return 
                {
                    equipment: create_random_collection_struct(get_droppable_equipment(), 5)
                };
            }
        }),
        random_materials_01: new Recipe(
        {
            index: 1020,
            name: __("Random Materials"),
            description: __("Create %s random materials. The same material can be generated multiple times."),
            scale_value: 5,
            sprite: spr_material_copper_bar,
            input_materials: 
            {
                sand: 10
            },
            input_resources: 
            {
                flask_red: 10000000000,
                flask_green: 10000000000
            },
            skip_material_count_check: true,
            unlock_cost: 
            {
                materials: 
                {
                    sand: 100
                }
            },
            
            output: function()
            {
                return 
                {
                    materials: create_random_collection_struct(global.materials_spawnable, 5)
                };
            }
        }),
        random_scroll: new Recipe(
        {
            index: 1030,
            name: __("Scrolls"),
            description: __("Create %s random scrolls."),
            scale_value: 2,
            sprite: spr_scroll_damage,
            input_materials: 
            {
                mushroom_red: 80,
                scarab: 80
            },
            input_resources: 
            {
                flask_green: 100000
            },
            unlock_cost: 
            {
                materials: 
                {
                    mushroom_red: 100,
                    scarab: 100
                }
            },
            
            output: function()
            {
                return 
                {
                    scrolls: create_random_collection_struct(get_droppable_scrolls(), 2)
                };
            }
        }),
        de_card_parts: new Recipe(
        {
            index: 2000,
            name: __("Card Parts"),
            use_auto_description: true,
            sprite: spr_icon_card_part,
            input_materials: 
            {
                essence_dark: 3
            },
            input_resources: 
            {
                fusion_shards: 5,
                transformation_shards: 15
            },
            unlock_cost: 
            {
                materials: 
                {
                    essence_dark: 10
                }
            },
            
            output: function()
            {
                return 
                {
                    resources: 
                    {
                        card_parts: 25
                    }
                };
            },
            
            can_brew: function()
            {
                return is_unlocked_cards() && is_unlocked_shards();
            },
            
            can_unlock: function()
            {
                return is_unlocked_cards() && is_unlocked_shards();
            }
        }),
        essence_cosmic: new Recipe(
        {
            index: 100,
            name: __("Cosmic Essence"),
            use_auto_description: true,
            sprite: spr_material_essence_cosmic,
            input_materials: 
            {
                dark_matter: 20,
                cloud: 20
            },
            input_resources: 
            {
                cheese: 100
            },
            
            output: function()
            {
                return 
                {
                    materials: 
                    {
                        essence_cosmic: 5
                    }
                };
            },
            
            unlock_cost: 
            {
                materials: 
                {
                    dark_matter: 100,
                    cloud: 100
                }
            },
            section: global.dialog_sections.alchemy.essences
        }),
        essence_earth: new Recipe(
        {
            index: 120,
            name: __("Earth Essence"),
            use_auto_description: true,
            sprite: spr_material_essence_earth,
            input_materials: 
            {
                dark_matter: 20,
                bone: 20
            },
            input_resources: 
            {
                cheese: 20
            },
            
            output: function()
            {
                return 
                {
                    materials: 
                    {
                        essence_earth: 5
                    }
                };
            },
            
            unlock_cost: 
            {
                materials: 
                {
                    dark_matter: 100,
                    bone: 100
                }
            },
            section: global.dialog_sections.alchemy.essences
        }),
        essence_leaf: new Recipe(
        {
            index: 130,
            name: __("Leaf Essence"),
            use_auto_description: true,
            sprite: spr_material_essence_leaf,
            input_materials: 
            {
                dark_matter: 50,
                scarab: 50
            },
            input_resources: 
            {
                cheese: 100
            },
            
            output: function()
            {
                return 
                {
                    materials: 
                    {
                        essence_leaf: 5
                    }
                };
            },
            
            unlock_cost: 
            {
                materials: 
                {
                    dark_matter: 100,
                    scarab: 100
                }
            },
            section: global.dialog_sections.alchemy.essences
        }),
        essence_water: new Recipe(
        {
            index: 131,
            name: __("Water Essence"),
            use_auto_description: true,
            sprite: spr_material_essence_water,
            input_materials: 
            {
                dark_matter: 50,
                oyster: 50
            },
            input_resources: 
            {
                cheese: 100
            },
            
            output: function()
            {
                return 
                {
                    materials: 
                    {
                        essence_water: 5
                    }
                };
            },
            
            unlock_cost: 
            {
                materials: 
                {
                    dark_matter: 100,
                    oyster: 100
                }
            },
            section: global.dialog_sections.alchemy.essences
        }),
        essence_dark: new Recipe(
        {
            index: 140,
            name: __("Dark Essence"),
            use_auto_description: true,
            sprite: spr_material_essence_dark,
            input_materials: 
            {
                essence_cosmic: 30,
                essence_earth: 30,
                essence_leaf: 30,
                essence_water: 30
            },
            input_resources: 
            {
                cheese: 25000
            },
            
            output: function()
            {
                return 
                {
                    materials: 
                    {
                        essence_dark: 5
                    }
                };
            },
            
            unlock_cost: 
            {
                materials: 
                {
                    essence_cosmic: 5,
                    essence_earth: 5,
                    essence_leaf: 5,
                    essence_water: 5
                }
            },
            section: global.dialog_sections.alchemy.essences
        }),
        essence_light: new Recipe(
        {
            index: 150,
            name: __("Light Essence"),
            use_auto_description: true,
            sprite: spr_material_essence_light,
            input_materials: 
            {
                essence_cosmic: 30,
                essence_earth: 30,
                essence_leaf: 30,
                essence_water: 30
            },
            input_resources: 
            {
                cheese: 25000
            },
            
            output: function()
            {
                return 
                {
                    materials: 
                    {
                        essence_light: 5
                    }
                };
            },
            
            unlock_cost: 
            {
                materials: 
                {
                    essence_cosmic: 5,
                    essence_earth: 5,
                    essence_leaf: 5,
                    essence_water: 5
                }
            },
            section: global.dialog_sections.alchemy.essences
        }),
        essence_strange: new Recipe(
        {
            index: 160,
            name: __("Strange Essence"),
            use_auto_description: true,
            sprite: spr_material_essence_strange,
            input_materials: 
            {
                essence_dark: 3000,
                essence_light: 3000
            },
            input_resources: 
            {
                shards: 500,
                energy_electrical: 300
            },
            
            output: function()
            {
                return 
                {
                    materials: 
                    {
                        essence_strange: 1
                    }
                };
            },
            
            unlock_cost: 
            {
                materials: 
                {
                    essence_dark: 5,
                    essence_light: 5
                }
            },
            section: global.dialog_sections.alchemy.essences
        }),
        essence_iridescent: new Recipe(
        {
            index: 170,
            name: __("Iridescent Essence"),
            use_auto_description: true,
            sprite: spr_material_essence_iridescent,
            input_materials: 
            {
                essence_dark: 1500,
                essence_light: 1500,
                essence_strange: 750
            },
            input_resources: 
            {
                shards: 2500,
                energy_electrical: 500
            },
            
            output: function()
            {
                return 
                {
                    materials: 
                    {
                        essence_iridescent: 1
                    }
                };
            },
            
            unlock_cost: 
            {
                materials: 
                {
                    essence_dark: 10,
                    essence_light: 10,
                    essence_strange: 5
                }
            },
            section: global.dialog_sections.alchemy.essences
        }),
        essence_shadow: new Recipe(
        {
            index: 180,
            name: __("Shadow Essence"),
            use_auto_description: true,
            sprite: spr_material_essence_shadow,
            input_materials: 
            {
                essence_iridescent: 200
            },
            input_resources: 
            {
                energy_electrical: 1000,
                energy_quark: 500,
                dusk: 100000000
            },
            
            output: function()
            {
                return 
                {
                    materials: 
                    {
                        essence_shadow: 1
                    }
                };
            },
            
            unlock_cost: 
            {
                materials: 
                {
                    essence_shadow: 10
                }
            },
            output_max_count: 1,
            section: global.dialog_sections.alchemy.essences
        }),
        shards: new Recipe(
        {
            index: 3000,
            name: __("Shards"),
            use_auto_description: true,
            sprite: spr_resource_shards,
            input_materials: 
            {
                essence_dark: 50
            },
            input_resources: 
            {
                cheese: 100000,
                beer: 100000
            },
            unlock_cost: 
            {
                materials: 
                {
                    essence_dark: 5
                }
            },
            
            output: function()
            {
                return 
                {
                    resources: 
                    {
                        shards: 3
                    }
                };
            },
            
            can_brew: function()
            {
                return is_unlocked_shards();
            },
            
            can_unlock: function()
            {
                return is_unlocked_shards();
            },
            
            section: global.dialog_sections.alchemy.shards
        }),
        shards_ascension: new Recipe(
        {
            index: 3010,
            name: __("Ascension Shards"),
            use_auto_description: true,
            sprite: spr_resource_ascension_shards,
            input_materials: 
            {
                essence_dark: 200
            },
            input_resources: 
            {
                shards: 300,
                energy_electrical: 50
            },
            unlock_cost: 
            {
                resources: 
                {
                    shards: 3500,
                    energy_electrical: 750
                }
            },
            
            output: function()
            {
                return 
                {
                    resources: 
                    {
                        ascension_shards: 2
                    }
                };
            },
            
            can_brew: function()
            {
                return is_unlocked_shards() && is_unlocked_ascension_shards();
            },
            
            can_unlock: function()
            {
                return is_unlocked_shards() && is_unlocked_ascension_shards();
            },
            
            section: global.dialog_sections.alchemy.shards
        }),
        shards_fusion: new Recipe(
        {
            index: 3020,
            name: __("Fusion Shards"),
            use_auto_description: true,
            sprite: spr_resource_fusion_shards,
            input_materials: 
            {
                essence_dark: 100
            },
            input_resources: 
            {
                shards: 350,
                energy_electrical: 50
            },
            unlock_cost: 
            {
                resources: 
                {
                    shards: 2500,
                    energy_electrical: 500
                }
            },
            
            output: function()
            {
                return 
                {
                    resources: 
                    {
                        fusion_shards: 2
                    }
                };
            },
            
            can_brew: function()
            {
                return is_unlocked_shards() && is_unlocked_fusion_shards();
            },
            
            can_unlock: function()
            {
                return is_unlocked_shards() && is_unlocked_fusion_shards();
            },
            
            section: global.dialog_sections.alchemy.shards
        }),
        shards_transformation: new Recipe(
        {
            index: 3030,
            name: __("Transformation Shards"),
            use_auto_description: true,
            sprite: spr_resource_transformation_shards,
            input_materials: 
            {
                essence_dark: 5
            },
            input_resources: 
            {
                shards: 20,
                energy_electrical: 50
            },
            unlock_cost: 
            {
                resources: 
                {
                    shards: 10,
                    energy_electrical: 500
                }
            },
            
            output: function()
            {
                return 
                {
                    resources: 
                    {
                        transformation_shards: 2
                    }
                };
            },
            
            can_brew: function()
            {
                return is_unlocked_shards() && is_unlocked_transformation_shards();
            },
            
            can_unlock: function()
            {
                return is_unlocked_shards() && is_unlocked_transformation_shards();
            },
            
            section: global.dialog_sections.alchemy.shards
        }),
        soul_stones: new Recipe(
        {
            index: 4000,
            name: __("Soul Stones"),
            use_auto_description: true,
            sprite: spr_resource_soul_stone,
            input_materials: 
            {
                essence_iridescent: 30,
                raw_soul_stone: 30
            },
            input_resources: 
            {
                borb_juice: 5000
            },
            
            output: function()
            {
                return 
                {
                    resources: 
                    {
                        soul_stones: 1
                    }
                };
            },
            
            unlock_cost: 
            {
                materials: 
                {
                    essence_iridescent: 10,
                    raw_soul_stone: 1
                }
            },
            
            can_brew: function()
            {
                return is_unlocked_death_book() && is_unlocked_borbventure();
            },
            
            can_unlock: function()
            {
                return is_unlocked_death_book() && is_unlocked_borbventure();
            },
            
            section: global.dialog_sections.alchemy.souls
        }),
        soul_stones_ascension_juice: new Recipe(
        {
            index: 4001,
            name: __("Soul Stones"),
            use_auto_description: true,
            sprite: spr_resource_soul_stone,
            input_materials: 
            {
                essence_iridescent: 20,
                raw_soul_stone: 20
            },
            input_resources: 
            {
                borb_ascension_juice: 250
            },
            
            output: function()
            {
                return 
                {
                    resources: 
                    {
                        soul_stones: 2
                    }
                };
            },
            
            unlock_cost: 
            {
                materials: 
                {
                    essence_iridescent: 10,
                    raw_soul_stone: 1
                },
                resources: 
                {
                    borb_ascension_juice: 10
                }
            },
            
            can_brew: function()
            {
                return is_unlocked_death_book() && is_unlocked_borbventure();
            },
            
            can_unlock: function()
            {
                return is_unlocked_death_book() && is_unlocked_borbventure();
            },
            
            section: global.dialog_sections.alchemy.souls
        }),
        soul_particles: new Recipe(
        {
            index: 4010,
            name: __("Soul Particles"),
            use_auto_description: true,
            sprite: spr_resource_soul_particle,
            input_materials: 
            {
                essence_iridescent: 150
            },
            input_resources: 
            {
                soul_stones: 10,
                soul_keys: 75
            },
            
            output: function()
            {
                return 
                {
                    resources: 
                    {
                        soul_particles: 2
                    }
                };
            },
            
            unlock_cost: 
            {
                materials: 
                {
                    essence_iridescent: 25
                },
                resources: 
                {
                    soul_stones: 2,
                    soul_keys: 2
                }
            },
            
            can_brew: function()
            {
                return is_unlocked_death_book();
            },
            
            can_unlock: function()
            {
                return is_unlocked_death_book();
            },
            
            section: global.dialog_sections.alchemy.souls
        }),
        soul_particles_ascension_juice: new Recipe(
        {
            index: 4012,
            name: __("Soul Particles"),
            use_auto_description: true,
            sprite: spr_resource_soul_particle,
            input_materials: 
            {
                essence_iridescent: 75
            },
            input_resources: 
            {
                soul_stones: 10,
                soul_keys: 75,
                borb_ascension_juice: 500
            },
            
            output: function()
            {
                return 
                {
                    resources: 
                    {
                        soul_particles: 4
                    }
                };
            },
            
            unlock_cost: 
            {
                materials: 
                {
                    essence_iridescent: 25
                },
                resources: 
                {
                    soul_stones: 2,
                    soul_keys: 2,
                    borb_ascension_juice: 10
                }
            },
            
            can_brew: function()
            {
                return is_unlocked_death_book();
            },
            
            can_unlock: function()
            {
                return is_unlocked_death_book();
            },
            
            section: global.dialog_sections.alchemy.souls
        }),
        soul_entities: new Recipe(
        {
            index: 4020,
            name: __("Soul Entities"),
            use_auto_description: true,
            sprite: spr_resource_soul_entity,
            input_materials: 
            {
                essence_iridescent: 300
            },
            input_resources: 
            {
                soul_particles: 50,
                soul_keys: 150
            },
            
            output: function()
            {
                return 
                {
                    resources: 
                    {
                        soul_entities: 1
                    }
                };
            },
            
            unlock_cost: 
            {
                materials: 
                {
                    essence_iridescent: 100
                },
                resources: 
                {
                    soul_particles: 5,
                    soul_keys: 10
                }
            },
            
            can_brew: function()
            {
                return is_unlocked_death_book();
            },
            
            can_unlock: function()
            {
                return is_unlocked_death_book();
            },
            
            section: global.dialog_sections.alchemy.souls
        }),
        soul_entities_ascension_juice: new Recipe(
        {
            index: 4021,
            name: __("Soul Entities"),
            use_auto_description: true,
            sprite: spr_resource_soul_entity,
            input_materials: 
            {
                essence_iridescent: 150
            },
            input_resources: 
            {
                soul_particles: 50,
                soul_keys: 150,
                borb_ascension_juice: 750
            },
            
            output: function()
            {
                return 
                {
                    resources: 
                    {
                        soul_entities: 2
                    }
                };
            },
            
            unlock_cost: 
            {
                materials: 
                {
                    essence_iridescent: 100
                },
                resources: 
                {
                    soul_particles: 5,
                    soul_keys: 10,
                    borb_ascension_juice: 10
                }
            },
            
            can_brew: function()
            {
                return is_unlocked_death_book();
            },
            
            can_unlock: function()
            {
                return is_unlocked_death_book();
            },
            
            section: global.dialog_sections.alchemy.souls
        }),
        soul_flask: new Recipe(
        {
            index: 4030,
            name: __("Soul Flasks"),
            use_auto_description: true,
            sprite: spr_resource_soul_flask,
            input_materials: 
            {
                essence_iridescent: 1000
            },
            input_resources: 
            {
                soul_entities: 25,
                soul_keys: 300
            },
            
            output: function()
            {
                return 
                {
                    resources: 
                    {
                        soul_flask: 1
                    }
                };
            },
            
            unlock_cost: 
            {
                materials: 
                {
                    essence_iridescent: 250
                },
                resources: 
                {
                    soul_entities: 25,
                    soul_keys: 75
                }
            },
            
            can_brew: function()
            {
                return is_unlocked_death_book();
            },
            
            can_unlock: function()
            {
                return is_unlocked_death_book();
            },
            
            section: global.dialog_sections.alchemy.souls
        }),
        soul_flask_ascension_juice: new Recipe(
        {
            index: 4100,
            name: __("Soul Flasks"),
            use_auto_description: true,
            sprite: spr_resource_soul_flask,
            input_materials: 
            {
                essence_iridescent: 500
            },
            input_resources: 
            {
                soul_entities: 25,
                soul_keys: 300,
                borb_ascension_juice: 1000
            },
            
            output: function()
            {
                return 
                {
                    resources: 
                    {
                        soul_flask: 2
                    }
                };
            },
            
            unlock_cost: 
            {
                materials: 
                {
                    essence_iridescent: 250
                },
                resources: 
                {
                    soul_entities: 25,
                    soul_keys: 75,
                    borb_ascension_juice: 10
                }
            },
            
            can_brew: function()
            {
                return is_unlocked_death_book();
            },
            
            can_unlock: function()
            {
                return is_unlocked_death_book();
            },
            
            section: global.dialog_sections.alchemy.souls
        }),
        refined_soul_stone: new Recipe(
        {
            index: 5000,
            name: __("Refined Soul Stone"),
            description_locked: __s("Unlock %s to unlock this %s.", __("Banks"), __("recipe")),
            use_auto_description: true,
            sprite: spr_material_refined_soul_stone,
            duration: sec(600),
            input_materials: 
            {
                essence_iridescent: 5000,
                raw_soul_stone: 2000
            },
            input_resources: 
            {
                soul_particles: 50000,
                soul_keys: 100000
            },
            
            output: function()
            {
                return 
                {
                    materials: 
                    {
                        refined_soul_stone: 1
                    }
                };
            },
            
            crit_multiplier: 0.1,
            output_multiplier: 0.001,
            unlock_cost: 
            {
                materials: 
                {
                    essence_iridescent: 500,
                    raw_soul_stone: 200
                },
                resources: 
                {
                    soul_particles: 5000,
                    soul_keys: 10000
                }
            },
            
            can_brew: function()
            {
                return is_unlocked_banks();
            },
            
            can_unlock: function()
            {
                return is_unlocked_banks();
            },
            
            section: global.dialog_sections.alchemy.souls
        })
    };
    var __array = global.materials_sorted;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (!mitem.spawnable)
        {
            continue;
        }
        var key = sprintf("zz_curse_%s", mitem.key);
        variable_struct_set(global.recipes, key, new Recipe(
        {
            index: 10000 + __i,
            name: __s("Curse: %s", mitem.name),
            description: __("The Cursed Cheese will cast %s curses on you."),
            scale_value: 666,
            sprite: spr_icon_cursed_cheese,
            input_materials: {},
            input_resources: 
            {
                cheese: 100
            },
            
            output: function()
            {
                return 
                {
                    stats: 
                    {
                        cursed_count: 666
                    }
                };
            },
            
            section: global.dialog_sections.alchemy.curses,
            unlock_cost: 
            {
                materials: {}
            }
        }));
        variable_struct_set(variable_struct_get(global.recipes, key).input_materials, mitem.key, 1000);
        variable_struct_set(variable_struct_get(global.recipes, key).unlock_cost.materials, mitem.key, 100);
    }
    __array = global.relic_types_array;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        var key = sprintf("relic_%s_%s", mitem.level, mitem.key);
        variable_struct_set(global.recipes, key, new Recipe(
        {
            index: 20000 + __i,
            name: sprintf("%s %s", mitem.name, __("Relic")),
            description: __s("Create [count] random %s Relic.", mitem.name),
            scale_value: 1,
            sprite: mitem.sprite,
            input_materials: {},
            input_resources: 
            {
                shards: 20 * power(4, mitem.level),
                sacred: 1000 * power(10, mitem.level)
            },
            
            output: function()
            {
                var relics_not_maxed = array_filter_custom(variable_struct_get(global.relics_rarity_array, self.relic_type_key), function(arg0)
                {
                    return arg0.data.count < arg0.get_max_count();
                });
                if (array_length(relics_not_maxed) == 0)
                {
                    return self.input_resources;
                }
                var ret_output = 
                {
                    relics: create_random_collection_struct(relics_not_maxed, 1)
                };
                return ret_output;
            },
            
            relic_type_key: mitem.key,
            section: global.dialog_sections.alchemy.relics,
            unlock_cost: 
            {
                resources: 
                {
                    sacred: 1000 * power(5, mitem.level)
                }
            }
        }));
    }
    add_keys_to_struct(global.recipes);
    global.recipes_sorted = struct_to_sorted_array(global.recipes);
    global.recipes_shuffled = [];
    array_copy(global.recipes_shuffled, 0, global.recipes_shuffled, 0, array_length(global.recipes_shuffled));
}
