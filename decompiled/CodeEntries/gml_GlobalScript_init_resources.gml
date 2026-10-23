function init_resources()
{
    global.resources = 
    {
        leaves: 
        {
            index: 0,
            prestige_value: 1,
            sprite: spr_leaf,
            sprite_seed: spr_seed_leaf,
            name: __("Leaf"),
            name_single: __("Basic"),
            name_plural: __("Basic Leaves"),
            is_leaf: true,
            spawn_chance: 100,
            can_generate_in_quests: true,
            can_lose_resource: true,
            can_trade: true,
            has_craft_property_leaf_add: true,
            droppable: true,
            printable: true,
            has_fruits: true,
            has_relic: true,
            fruit_image_index: 0,
            has_seeds: true,
            seed_unlocked: true,
            available_in_chest: true,
            offline_reward: true,
            type: global.resource_types.leaf,
            upgrade_attributes_dice: 
            {
                leaf_multiplier_dice: 0.05
            },
            data: 
            {
                unlocked: true,
                unlocked_fruit: true
            }
        },
        gold: 
        {
            index: 10,
            prestige_value: 2,
            sprite: spr_leaf_gold,
            sprite_seed: spr_seed_gold,
            name: __("Gold Leaf"),
            name_single: __("Gold"),
            name_plural: __("Gold Leaves"),
            is_leaf: true,
            spawn_chance: 1,
            can_generate_in_quests: true,
            can_lose_resource: true,
            can_trade: true,
            has_craft_property_leaf_add: true,
            droppable: true,
            printable: true,
            has_fruits: true,
            has_relic: true,
            fruit_image_index: 1,
            has_seeds: true,
            seed_unlocked: true,
            available_in_chest: true,
            offline_reward: true,
            armor: 2,
            type: global.resource_types.leaf,
            upgrade_attributes_dice: 
            {
                prestige_value_multiplier_dice: 0.05
            }
        },
        platinum: 
        {
            index: 20,
            prestige_value: 3,
            sprite: spr_leaf_platinum,
            sprite_seed: spr_seed_platinum,
            name: __("Platinum Leaf"),
            name_single: __("Platinum"),
            name_plural: __("Platinum Leaves"),
            armor: 4,
            is_leaf: true,
            spawn_chance: 0.1,
            can_generate_in_quests: true,
            can_lose_resource: true,
            can_trade: true,
            has_craft_property_leaf_add: true,
            droppable: true,
            printable: true,
            has_fruits: true,
            has_relic: true,
            fruit_image_index: 2,
            has_seeds: true,
            seed_unlocked: true,
            available_in_chest: true,
            offline_reward: true,
            type: global.resource_types.leaf,
            upgrade_attributes_dice: 
            {
                nuclear_fuel_multiplier_dice: 0.01
            }
        },
        bismuth: 
        {
            index: 30,
            prestige_value: 4,
            sprite: spr_leaf_bismuth,
            sprite_seed: spr_seed_bismuth,
            name: __("Bismuth Leaf"),
            name_single: __("Bismuth"),
            name_plural: __("Bismuth Leaves"),
            armor: 8,
            is_leaf: true,
            spawn_chance: 0.1,
            can_generate_in_quests: true,
            can_lose_resource: true,
            can_trade: true,
            has_craft_property_leaf_add: true,
            droppable: true,
            printable: true,
            has_fruits: true,
            has_relic: true,
            fruit_image_index: 3,
            has_seeds: true,
            seed_unlocked: true,
            available_in_chest: true,
            offline_reward: true,
            type: global.resource_types.leaf,
            upgrade_attributes_dice: 
            {
                alb_blowing_power_dice: 0.02
            }
        },
        cosmic: 
        {
            index: 40,
            prestige_value: 5,
            sprite: spr_leaf_cosmic,
            sprite_seed: spr_seed_cosmic,
            name: __("Cosmic Leaf"),
            name_single: __("Cosmic"),
            name_plural: __("Cosmic Leaves"),
            armor: 12,
            is_leaf: true,
            spawn_chance: 0.1,
            can_generate_in_quests: true,
            can_lose_resource: true,
            can_trade: true,
            has_craft_property_leaf_add: true,
            droppable: true,
            printable: true,
            has_fruits: true,
            has_relic: true,
            fruit_image_index: 4,
            has_seeds: true,
            seed_unlocked: true,
            available_in_chest: true,
            offline_reward: true,
            type: global.resource_types.leaf,
            upgrade_attributes_dice: 
            {
                slap_multiplier_dice: 0.02
            }
        },
        void: 
        {
            index: 50,
            prestige_value: 6,
            sprite: spr_leaf_void,
            sprite_seed: spr_seed_void,
            name: __("Void Leaf"),
            name_single: __("Void"),
            name_plural: __("Void Leaves"),
            armor: 16,
            is_leaf: true,
            spawn_chance: 0.1,
            can_generate_in_quests: true,
            can_lose_resource: true,
            can_trade: true,
            has_craft_property_leaf_add: true,
            droppable: true,
            printable: true,
            has_fruits: true,
            has_relic: true,
            fruit_image_index: 5,
            has_seeds: true,
            seed_unlocked: true,
            available_in_chest: true,
            offline_reward: true,
            type: global.resource_types.leaf,
            upgrade_attributes_dice: 
            {
                converter_crit_value_multiplier_dice: 0.1
            }
        },
        exotic: 
        {
            index: 60,
            prestige_value: 12,
            sprite: spr_leaf_exotic,
            sprite_seed: spr_seed_exotic,
            name: __("Exotic Leaf"),
            name_single: __("Exotic"),
            name_plural: __("Exotic Leaves"),
            armor: 128,
            is_leaf: true,
            spawn_chance: 0.1,
            can_generate_in_quests: true,
            can_lose_resource: true,
            can_trade: true,
            has_craft_property_leaf_add: true,
            droppable: true,
            printable: true,
            print_cost_multiplier: 4,
            print_value_multiplier: 0.1,
            has_fruits: true,
            has_relic: true,
            fruit_image_index: 6,
            has_seeds: true,
            seed_unlocked: true,
            available_in_chest: true,
            offline_reward: true,
            type: global.resource_types.leaf,
            upgrade_attributes_dice: 
            {
                blc_value_multiplier_dice: 0.02
            }
        },
        celestial: 
        {
            index: 70,
            prestige_value: 13,
            sprite: spr_leaf_celestial,
            sprite_seed: spr_seed_celestial,
            name: __("Celestial Leaf"),
            name_single: __("Celestial"),
            name_plural: __("Celestial Leaves"),
            armor: 192,
            is_leaf: true,
            spawn_chance: 0,
            spawn_chance_seed: 1,
            can_generate_in_quests: true,
            can_lose_resource: true,
            can_trade: true,
            has_craft_property_leaf_add: true,
            droppable: true,
            printable: true,
            print_cost_multiplier: 24,
            print_value_multiplier: 0.001,
            has_fruits: true,
            has_relic: true,
            fruit_image_index: 7,
            has_seeds: true,
            seed_unlocked: true,
            calculate_special: true,
            type: global.resource_types.leaf,
            upgrade_attributes_dice: 
            {
                enemy_drop_multiplier_dice: 0.05
            },
            
            available_in_chest: function()
            {
                return global.resources.celestial.offline_reward();
            },
            
            offline_reward: function()
            {
                return get_upgrade_count(global.shops.celestial.celestial_offline) > 0;
            }
        },
        mythical: 
        {
            index: 80,
            prestige_value: 14,
            sprite: spr_leaf_mythical,
            sprite_seed: spr_seed_mythical,
            name: __("Mythical Leaf"),
            name_single: __("Mythical"),
            name_plural: __("Mythical Leaves"),
            armor: 256,
            is_leaf: true,
            spawn_chance: 0.1,
            can_generate_in_quests: true,
            can_lose_resource: true,
            can_trade: true,
            has_craft_property_leaf_add: true,
            droppable: true,
            printable: true,
            print_cost_multiplier: 32,
            print_value_multiplier: 0.001,
            reward_value_multiplier: 0.0001,
            has_fruits: true,
            has_relic: true,
            fruit_image_index: 8,
            has_seeds: true,
            seed_unlocked: true,
            available_in_chest: true,
            offline_reward: true,
            type: global.resource_types.leaf,
            upgrade_attributes_dice: 
            {
                printer_multiplier_dice: 0.01,
                printer_printer_multiplier_dice: 0.02
            }
        },
        lava: 
        {
            index: 90,
            prestige_value: 15,
            sprite: spr_leaf_lava,
            sprite_seed: spr_seed_lava,
            name: __("Lava Leaf"),
            name_single: __("Lava"),
            name_plural: __("Lava Leaves"),
            armor: 300,
            is_leaf: true,
            spawn_chance: 0.1,
            can_generate_in_quests: true,
            can_lose_resource: true,
            can_trade: true,
            has_craft_property_leaf_add: true,
            droppable: true,
            printable: true,
            print_cost_multiplier: 32,
            print_value_multiplier: 0.001,
            reward_value_multiplier: 0.0001,
            has_fruits: true,
            has_relic: true,
            fruit_image_index: 9,
            has_seeds: true,
            seed_unlocked: true,
            available_in_chest: true,
            offline_reward: true,
            type: global.resource_types.leaf,
            upgrade_attributes_dice: 
            {
                player_hp_multiplier_dice: 0.01
            }
        },
        ice: 
        {
            index: 100,
            prestige_value: 16,
            sprite: spr_leaf_ice,
            sprite_seed: spr_seed_ice,
            name: __("Ice Leaf"),
            name_single: __("Ice"),
            name_plural: __("Ice Leaves"),
            armor: 500,
            is_leaf: true,
            spawn_chance: 0.1,
            can_generate_in_quests: true,
            can_lose_resource: true,
            can_trade: true,
            has_craft_property_leaf_add: true,
            droppable: true,
            printable: true,
            print_cost_multiplier: 32,
            print_value_multiplier: 0.001,
            reward_value_multiplier: 0.00001,
            has_fruits: true,
            has_relic: true,
            fruit_image_index: 10,
            has_seeds: true,
            seed_unlocked: true,
            available_in_chest: true,
            offline_reward: true,
            type: global.resource_types.leaf,
            upgrade_attributes_dice: 
            {
                trade_resources_multiplier_dice: 0.01
            }
        },
        obsidian: 
        {
            index: 110,
            prestige_value: 17,
            sprite: spr_leaf_obsidian,
            sprite_seed: spr_seed_obsidian,
            name: __("Obsidian Leaf"),
            name_single: __("Obsidian"),
            name_plural: __("Obsidian Leaves"),
            armor: 800,
            is_leaf: true,
            spawn_chance: 0,
            spawn_chance_seed: 1,
            can_generate_in_quests: true,
            can_lose_resource: true,
            can_trade: true,
            has_craft_property_leaf_add: true,
            droppable: false,
            printable: false,
            print_cost_multiplier: 32,
            print_value_multiplier: 0.001,
            reward_value_multiplier: 0.000001,
            has_fruits: false,
            has_relic: true,
            has_seeds: true,
            seed_unlocked: true,
            available_in_chest: true,
            offline_reward: true,
            type: global.resource_types.leaf,
            upgrade_attributes_dice: 
            {
                blower_enemy_damage_multiplier_dice: 0.02
            }
        },
        silicon: 
        {
            index: 120,
            prestige_value: 18,
            sprite: spr_leaf_silicon,
            sprite_seed: spr_seed_silicon,
            name: __("Silicon Leaf"),
            name_single: __("Silicon"),
            name_plural: __("Silicon Leaves"),
            armor: 1000,
            is_leaf: true,
            spawn_chance: 0.1,
            can_generate_in_quests: true,
            can_lose_resource: true,
            can_trade: true,
            has_craft_property_leaf_add: true,
            droppable: true,
            printable: true,
            print_cost_multiplier: 32,
            print_value_multiplier: 0.001,
            reward_value_multiplier: 0.000001,
            has_fruits: false,
            has_relic: true,
            has_seeds: true,
            seed_unlocked: true,
            available_in_chest: true,
            offline_reward: true,
            type: global.resource_types.leaf,
            upgrade_attributes_dice: 
            {
                mlc_value_multiplier_dice: 0.03
            }
        },
        benitoite: 
        {
            index: 130,
            prestige_value: 19,
            sprite: spr_leaf_benitoite,
            sprite_seed: spr_seed_benitoite,
            name: __("Benitoite Leaf"),
            name_single: __("Benitoite"),
            name_plural: __("Benitoite Leaves"),
            armor: 1200,
            is_leaf: true,
            spawn_chance: 0,
            spawn_chance_seed: 1,
            can_generate_in_quests: true,
            can_lose_resource: true,
            can_trade: true,
            has_craft_property_leaf_add: true,
            droppable: false,
            printable: false,
            print_cost_multiplier: 32,
            print_value_multiplier: 0.001,
            reward_value_multiplier: 0.000001,
            has_fruits: false,
            has_relic: true,
            has_seeds: true,
            seed_unlocked: true,
            available_in_chest: true,
            offline_reward: true,
            type: global.resource_types.leaf,
            upgrade_attributes_dice: 
            {
                resources_leaf_add: 
                {
                    borbs: 5
                }
            }
        },
        water: 
        {
            index: 131,
            prestige_value: 19,
            sprite: spr_leaf_water,
            sprite_seed: spr_placeholder,
            name: __("Water Leaf"),
            name_single: __("Water"),
            name_plural: __("Water Leaves"),
            armor: 1200,
            is_dice_enemy: false,
            is_leaf: true,
            spawn_chance: 0.2,
            spawn_chance_seed: 0,
            can_generate_in_quests: false,
            can_lose_resource: false,
            can_trade: false,
            has_craft_property_leaf_add: false,
            
            house_item_can_buy: function()
            {
                return is_unlocked_harbor();
            },
            
            house_item_cost: 
            {
                water_crystal: 1000
            },
            droppable: false,
            printable: false,
            print_cost_multiplier: 32,
            print_value_multiplier: 0.001,
            reward_value_multiplier: 0.000001,
            has_fruits: false,
            has_relic: false,
            has_seeds: false,
            include_in_stats: false,
            seed_unlocked: false,
            available_in_chest: false,
            offline_reward: false,
            show_in_nav: false,
            type: global.resource_types.leaf
        },
        moonstone: 
        {
            index: 140,
            prestige_value: 20.5,
            sprite: spr_leaf_moonstone,
            sprite_seed: spr_seed_moonstone,
            name: __("Moonstone Leaf"),
            name_single: __("Moonstone"),
            name_plural: __("Moonstone Leaves"),
            armor: 3000,
            is_leaf: true,
            spawn_chance: 0.1,
            spawn_chance_seed: 1,
            can_generate_in_quests: true,
            can_lose_resource: true,
            can_trade: true,
            has_craft_property_leaf_add: true,
            droppable: false,
            printable: false,
            print_cost_multiplier: 64,
            print_value_multiplier: 0.001,
            reward_value_multiplier: 0.000001,
            has_fruits: false,
            has_relic: true,
            has_seeds: true,
            seed_unlocked: true,
            available_in_chest: true,
            offline_reward: true,
            type: global.resource_types.leaf,
            upgrade_attributes_dice: 
            {
                alchemy_brew_crit_chance: 0.005
            }
        },
        sand: 
        {
            index: 150,
            prestige_value: 21,
            sprite: spr_leaf_sand,
            sprite_seed: spr_seed_sand,
            name: __("Sand Leaf"),
            name_single: __("Sand"),
            name_plural: __("Sand Leaves"),
            armor: 6000,
            is_leaf: true,
            spawn_chance: 0.1,
            spawn_chance_seed: 1,
            can_generate_in_quests: true,
            can_lose_resource: true,
            can_trade: true,
            has_craft_property_leaf_add: true,
            droppable: false,
            printable: false,
            print_cost_multiplier: 96,
            print_value_multiplier: 0.001,
            reward_value_multiplier: 0.000001,
            has_fruits: false,
            has_relic: true,
            has_seeds: true,
            seed_unlocked: true,
            available_in_chest: true,
            offline_reward: true,
            type: global.resource_types.leaf,
            upgrade_attributes_dice: 
            {
                cursed_autocollect_multiplier: 0.01,
                cursed_count_multiplier: 0.02
            }
        },
        azurite: 
        {
            index: 151,
            prestige_value: 21.1,
            sprite: spr_leaf_azurite,
            sprite_seed: spr_seed_leaf,
            name: __("Azurite Leaf"),
            name_single: __("Azurite"),
            name_plural: __("Azurite Leaves"),
            armor: 1000000,
            discountable: false,
            is_leaf: true,
            spawn_chance: 0.1,
            spawn_chance_seed: 0,
            calculate_single_upgrade: true,
            can_generate_in_quests: false,
            can_lose_resource: true,
            can_trade: false,
            has_craft_property_leaf_add: false,
            droppable: false,
            persist_prestige_level: global.prestige_levels.mlc.level,
            printable: false,
            print_cost_multiplier: 288,
            print_value_multiplier: 0.001,
            reward_value_multiplier: 0.000001,
            seed_cost_multiplier: 100,
            seed_cost_exp: 18,
            has_fruits: false,
            has_relic: false,
            has_seeds: false,
            available_in_chest: true,
            offline_reward: true,
            offline_reward_multiplier: 0.000001,
            type: global.resource_types.leaf,
            upgrade_attributes_dice: 
            {
                dice_battlefield_reward_multiplier: 0.02
            }
        },
        niobium: 
        {
            index: 152,
            prestige_value: 21.2,
            sprite: spr_leaf_niobium,
            sprite_seed: spr_seed_leaf,
            name: __("Niobium Leaf"),
            name_single: __("Niobium"),
            name_plural: __("Niobium Leaves"),
            armor: 1000000,
            discountable: false,
            is_leaf: true,
            spawn_chance: 0.1,
            spawn_chance_seed: 0,
            calculate_single_upgrade: true,
            can_generate_in_quests: false,
            can_lose_resource: true,
            can_trade: false,
            has_craft_property_leaf_add: false,
            droppable: false,
            persist_prestige_level: global.prestige_levels.mlc.level,
            printable: false,
            print_cost_multiplier: 288,
            print_value_multiplier: 0.001,
            reward_value_multiplier: 0.000001,
            seed_cost_multiplier: 100,
            seed_cost_exp: 18,
            has_fruits: false,
            has_relic: false,
            has_seeds: false,
            available_in_chest: true,
            offline_reward: true,
            offline_reward_multiplier: 0.000001,
            type: global.resource_types.leaf,
            upgrade_attributes_dice: 
            {
                dice_cursed_reward_multiplier: 0.01
            }
        },
        ancient: 
        {
            index: 160,
            prestige_value: 22,
            sprite: spr_leaf_ancient,
            sprite_seed: spr_seed_ancient,
            name: __("Ancient Leaf"),
            name_single: __("Ancient"),
            name_plural: __("Ancient Leaves"),
            armor: 32000,
            is_leaf: true,
            spawn_chance: 0,
            spawn_chance_seed: 0,
            calculate_single_upgrade: true,
            can_generate_in_quests: true,
            can_lose_resource: true,
            can_trade: false,
            has_craft_property_leaf_add: true,
            droppable: false,
            persist_prestige_level: global.prestige_levels.mlc.level,
            printable: false,
            print_cost_multiplier: 128,
            print_value_multiplier: 0.001,
            reward_value_multiplier: 0.000001,
            seed_cost_multiplier: 1,
            seed_cost_exp: 8,
            has_fruits: false,
            has_relic: true,
            has_seeds: true,
            
            available_in_chest: function()
            {
                return global.resources.ancient.offline_reward();
            },
            
            offline_reward: function()
            {
                return get_upgrade_count(global.shops.gems.offline_ancient) > 0;
            },
            
            type: global.resource_types.leaf,
            upgrade_attributes_dice: 
            {
                witch_cursed_count_multiplier_dice: 0.03,
                witch_essence_count_multiplier_dice: 0.01
            }
        },
        sacred: 
        {
            index: 170,
            prestige_value: 23,
            sprite: spr_leaf_sacred,
            sprite_seed: spr_seed_sacred,
            name: __("Sacred Leaf"),
            name_single: __("Sacred"),
            name_plural: __("Sacred Leaves"),
            armor: 10000000,
            is_leaf: true,
            spawn_chance: 0.1,
            spawn_chance_seed: 0,
            calculate_single_upgrade: true,
            can_generate_in_quests: true,
            can_lose_resource: true,
            can_trade: false,
            has_craft_property_leaf_add: false,
            droppable: false,
            persist_prestige_level: global.prestige_levels.mlc.level,
            printable: false,
            print_cost_multiplier: 160,
            print_value_multiplier: 0.001,
            reward_value_multiplier: 0.000001,
            seed_cost_multiplier: 100,
            seed_cost_exp: 10,
            has_fruits: false,
            has_relic: false,
            has_seeds: false,
            available_in_chest: true,
            offline_reward: true,
            offline_reward_multiplier: 0.01,
            type: global.resource_types.leaf,
            upgrade_attributes_dice: 
            {
                relics_base_damage_multiplier_dice: 0.1
            }
        },
        biotite: 
        {
            index: 180,
            prestige_value: 24,
            sprite: spr_leaf_biotite,
            sprite_seed: spr_seed_biotite,
            name: __("Biotite Leaf"),
            name_single: __("Biotite"),
            name_plural: __("Biotite Leaves"),
            armor: 100000000,
            is_leaf: true,
            spawn_chance: 0.1,
            spawn_chance_seed: 0,
            calculate_single_upgrade: true,
            can_generate_in_quests: false,
            can_lose_resource: true,
            can_trade: false,
            has_craft_property_leaf_add: false,
            droppable: false,
            persist_prestige_level: global.prestige_levels.mlc.level,
            printable: false,
            print_cost_multiplier: 192,
            print_value_multiplier: 0.001,
            reward_value_multiplier: 0.000001,
            seed_cost_multiplier: 100,
            seed_cost_exp: 12,
            has_fruits: false,
            has_relic: false,
            has_seeds: false,
            available_in_chest: true,
            offline_reward: true,
            offline_reward_multiplier: 0.01,
            type: global.resource_types.leaf,
            upgrade_attributes_dice: 
            {
                skip_tower_floor_chance_multiplier_dice: 0.03
            }
        },
        malachite: 
        {
            index: 190,
            prestige_value: 25,
            sprite: spr_leaf_malachite,
            sprite_seed: spr_placeholder,
            name: __("Malachite Leaf"),
            name_single: __("Malachite"),
            name_plural: __("Malachite Leaves"),
            armor: 1000000000,
            is_leaf: true,
            spawn_chance: 0.1,
            spawn_chance_seed: 0,
            calculate_single_upgrade: true,
            can_generate_in_quests: false,
            can_lose_resource: true,
            can_trade: false,
            has_craft_property_leaf_add: false,
            droppable: false,
            persist_prestige_level: global.prestige_levels.mlc.level,
            printable: false,
            print_cost_multiplier: 224,
            print_value_multiplier: 0.001,
            reward_value_multiplier: 0.000001,
            seed_cost_multiplier: 100,
            seed_cost_exp: 14,
            has_fruits: false,
            has_relic: false,
            has_seeds: false,
            available_in_chest: true,
            offline_reward: true,
            offline_reward_multiplier: 0.01,
            type: global.resource_types.leaf,
            upgrade_attributes_dice: 
            {
                cards_boss_drop_chance: 0.001
            }
        },
        hematite: 
        {
            index: 200,
            prestige_value: 26,
            sprite: spr_leaf_hematite,
            sprite_seed: spr_placeholder,
            name: __("Hematite Leaf"),
            name_single: __("Hematite"),
            name_plural: __("Hematite Leaves"),
            armor: 10000000000,
            is_leaf: true,
            spawn_chance: 0.1,
            spawn_chance_seed: 0,
            calculate_single_upgrade: true,
            can_generate_in_quests: false,
            can_lose_resource: true,
            can_trade: false,
            has_craft_property_leaf_add: false,
            droppable: false,
            persist_prestige_level: global.prestige_levels.mlc.level,
            printable: false,
            print_cost_multiplier: 256,
            print_value_multiplier: 0.001,
            reward_value_multiplier: 0.000001,
            seed_cost_multiplier: 100,
            seed_cost_exp: 16,
            has_fruits: false,
            has_relic: false,
            has_seeds: false,
            available_in_chest: true,
            offline_reward: true,
            offline_reward_multiplier: 0.01,
            type: global.resource_types.leaf,
            upgrade_attributes_dice: 
            {
                craft_min_chance_multiplier: 0.1
            }
        },
        plasma: 
        {
            index: 210,
            prestige_value: 32,
            sprite: spr_leaf_plasma,
            sprite_seed: spr_placeholder,
            name: __("Plasma Leaf"),
            name_single: __("Plasma"),
            name_plural: __("Plasma Leaves"),
            anim: true,
            armor: 100000000000,
            direction_drift: 100,
            is_leaf: true,
            min_blow_speed: 10,
            spawn_chance: 0.1,
            spawn_chance_seed: 0,
            calculate_single_upgrade: true,
            can_generate_in_quests: false,
            can_lose_resource: true,
            can_trade: false,
            has_craft_property_leaf_add: false,
            droppable: false,
            persist_prestige_level: global.prestige_levels.mlc.level,
            printable: false,
            print_cost_multiplier: 288,
            print_value_multiplier: 0.001,
            reward_value_multiplier: 0.000001,
            seed_cost_multiplier: 100,
            seed_cost_exp: 18,
            has_fruits: false,
            has_relic: false,
            has_seeds: false,
            available_in_chest: true,
            offline_reward: true,
            offline_reward_multiplier: 0.0001,
            type: global.resource_types.leaf,
            upgrade_attributes_dice: 
            {
                energy_base_charge_value_multiplier_dice: 0.02
            }
        },
        coal: 
        {
            index: 220,
            prestige_value: 33,
            sprite: spr_leaf_coal,
            sprite_seed: spr_placeholder,
            name: __("Coal Leaf"),
            name_single: __("Coal"),
            name_plural: __("Coal Leaves"),
            armor: 1000000000000,
            crumble: true,
            crumble_duration: 10,
            is_leaf: true,
            spawn_chance: 0.1,
            spawn_chance_seed: 0,
            calculate_single_upgrade: true,
            can_generate_in_quests: false,
            can_lose_resource: true,
            can_trade: false,
            has_craft_property_leaf_add: false,
            droppable: false,
            persist_prestige_level: global.prestige_levels.mlc.level,
            printable: false,
            print_cost_multiplier: 288,
            print_value_multiplier: 0.001,
            reward_value_multiplier: 0.000001,
            seed_cost_multiplier: 100,
            seed_cost_exp: 18,
            has_fruits: false,
            has_relic: false,
            has_seeds: false,
            available_in_chest: true,
            offline_reward: true,
            offline_reward_multiplier: 0.000001,
            type: global.resource_types.leaf,
            upgrade_attributes_dice: 
            {
                db_souls_count_multiplier_dice: 0.02
            }
        },
        amber: 
        {
            index: 500,
            prestige_value: 20.01,
            sprite: spr_leaf_amber,
            sprite_seed: spr_seed_amber,
            name: __("Amber Leaf"),
            name_single: __("Amber"),
            name_plural: __("Amber Leaves"),
            armor: 2000,
            is_leaf: true,
            is_gem_leaf: true,
            spawn_chance: 0,
            spawn_chance_seed: 1,
            calculate_special: true,
            can_generate_in_quests: true,
            can_lose_resource: true,
            can_trade: false,
            discountable: false,
            droppable: false,
            printable: false,
            print_cost_multiplier: 64,
            print_value_multiplier: 0.0001,
            has_relic: true,
            has_fruits: false,
            has_seeds: true,
            available_in_chest: false,
            offline_reward: false,
            type: global.resource_types.leaf,
            upgrade_attributes_dice: 
            {
                dice_drop_value_multiplier: 0.02
            }
        },
        amethyst: 
        {
            index: 510,
            prestige_value: 20.02,
            sprite: spr_leaf_amethyst,
            sprite_seed: spr_seed_amethyst,
            name: __("Amethyst Leaf"),
            name_single: __("Amethyst"),
            name_plural: __("Amethyst Leaves"),
            armor: 2000,
            is_leaf: true,
            is_gem_leaf: true,
            spawn_chance: 0,
            spawn_chance_seed: 1,
            calculate_special: true,
            can_generate_in_quests: true,
            can_lose_resource: true,
            can_trade: false,
            discountable: false,
            droppable: false,
            printable: false,
            print_cost_multiplier: 64,
            print_value_multiplier: 0.0001,
            has_relic: true,
            has_fruits: false,
            has_seeds: true,
            available_in_chest: false,
            offline_reward: false,
            type: global.resource_types.leaf,
            upgrade_attributes_dice: 
            {
                dice_drop_value_multiplier: 0.02
            }
        },
        emerald: 
        {
            index: 520,
            prestige_value: 20.03,
            sprite: spr_leaf_emerald,
            sprite_seed: spr_seed_emerald,
            name: __("Emerald Leaf"),
            name_single: __("Emerald"),
            name_plural: __("Emerald Leaves"),
            armor: 2000,
            is_leaf: true,
            is_gem_leaf: true,
            spawn_chance: 0,
            spawn_chance_seed: 1,
            calculate_special: true,
            can_generate_in_quests: true,
            can_lose_resource: true,
            can_trade: false,
            discountable: false,
            droppable: false,
            printable: false,
            print_cost_multiplier: 64,
            print_value_multiplier: 0.0001,
            has_relic: true,
            has_fruits: false,
            has_seeds: true,
            available_in_chest: false,
            offline_reward: false,
            type: global.resource_types.leaf,
            upgrade_attributes_dice: 
            {
                dice_drop_value_multiplier: 0.02
            }
        },
        kyanite: 
        {
            index: 530,
            prestige_value: 20.04,
            sprite: spr_leaf_kyanite,
            sprite_seed: spr_seed_kyanite,
            name: __("Kyanite Leaf"),
            name_single: __("Kyanite"),
            name_plural: __("Kyanite Leaves"),
            armor: 2000,
            is_leaf: true,
            is_gem_leaf: true,
            spawn_chance: 0,
            spawn_chance_seed: 1,
            calculate_special: true,
            can_generate_in_quests: true,
            can_lose_resource: true,
            can_trade: false,
            discountable: false,
            droppable: false,
            printable: false,
            print_cost_multiplier: 64,
            print_value_multiplier: 0.0001,
            has_relic: true,
            has_fruits: false,
            has_seeds: true,
            available_in_chest: false,
            offline_reward: false,
            type: global.resource_types.leaf,
            upgrade_attributes_dice: 
            {
                dice_drop_value_multiplier: 0.02
            }
        },
        rhodonite: 
        {
            index: 540,
            prestige_value: 20.05,
            sprite: spr_leaf_rhodonite,
            sprite_seed: spr_seed_rhodonite,
            name: __("Rhodonite Leaf"),
            name_single: __("Rhodonite"),
            name_plural: __("Rhodonite Leaves"),
            armor: 2000,
            is_leaf: true,
            is_gem_leaf: true,
            spawn_chance: 0,
            spawn_chance_seed: 1,
            calculate_special: true,
            can_generate_in_quests: true,
            can_lose_resource: true,
            can_trade: false,
            discountable: false,
            droppable: false,
            printable: false,
            print_cost_multiplier: 64,
            print_value_multiplier: 0.0001,
            has_relic: true,
            has_fruits: false,
            has_seeds: true,
            available_in_chest: false,
            offline_reward: false,
            type: global.resource_types.leaf,
            upgrade_attributes_dice: 
            {
                dice_drop_value_multiplier: 0.02
            }
        },
        ruby: 
        {
            index: 550,
            prestige_value: 20.06,
            sprite: spr_leaf_ruby,
            sprite_seed: spr_seed_ruby,
            name: __("Ruby Leaf"),
            name_single: __("Ruby"),
            name_plural: __("Ruby Leaves"),
            armor: 2000,
            is_leaf: true,
            is_gem_leaf: true,
            spawn_chance: 0,
            spawn_chance_seed: 1,
            calculate_special: true,
            can_generate_in_quests: true,
            can_lose_resource: true,
            can_trade: false,
            discountable: false,
            droppable: false,
            printable: false,
            print_cost_multiplier: 64,
            print_value_multiplier: 0.0001,
            has_relic: true,
            has_fruits: false,
            has_seeds: true,
            available_in_chest: false,
            offline_reward: false,
            type: global.resource_types.leaf,
            upgrade_attributes_dice: 
            {
                dice_drop_value_multiplier: 0.02
            }
        },
        tektite: 
        {
            index: 560,
            prestige_value: 20.07,
            sprite: spr_leaf_tektite,
            sprite_seed: spr_seed_tektite,
            name: __("Tektite Leaf"),
            name_single: __("Tektite"),
            name_plural: __("Tektite Leaves"),
            armor: 2000,
            is_leaf: true,
            is_gem_leaf: true,
            spawn_chance: 0,
            spawn_chance_seed: 1,
            calculate_special: true,
            can_generate_in_quests: true,
            can_lose_resource: true,
            can_trade: false,
            discountable: false,
            droppable: false,
            printable: false,
            print_cost_multiplier: 64,
            print_value_multiplier: 0.0001,
            has_relic: true,
            has_fruits: false,
            has_seeds: true,
            available_in_chest: false,
            offline_reward: false,
            type: global.resource_types.leaf,
            upgrade_attributes_dice: 
            {
                dice_drop_value_multiplier: 0.02
            }
        },
        flask_red: 
        {
            index: 1100,
            sprite: spr_flask_red,
            prestige_value: 7,
            name: __("Red Flask"),
            name_single: __("Red"),
            name_plural: __("Red Flasks"),
            can_generate_in_quests: true,
            can_trade: true,
            print_value_multiplier: 0.01,
            type: global.resource_types.flask
        },
        flask_green: 
        {
            index: 1110,
            sprite: spr_flask_green,
            prestige_value: 8,
            name: __("Green Flask"),
            name_single: __("Green"),
            name_plural: __("Green Flasks"),
            can_generate_in_quests: true,
            can_trade: true,
            print_value_multiplier: 0.009,
            type: global.resource_types.flask
        },
        flask_blue: 
        {
            index: 1120,
            sprite: spr_flask_blue,
            prestige_value: 9,
            name: __("Blue Flask"),
            name_single: __("Blue"),
            name_plural: __("Blue Flasks"),
            can_generate_in_quests: true,
            can_trade: true,
            print_value_multiplier: 0.008,
            type: global.resource_types.flask
        },
        flask_magenta: 
        {
            index: 1130,
            sprite: spr_flask_magenta,
            prestige_value: 10,
            name: __("Magenta Flask"),
            name_single: __("Magenta"),
            name_plural: __("Magenta Flasks"),
            can_generate_in_quests: true,
            can_trade: true,
            print_value_multiplier: 0.007,
            type: global.resource_types.flask
        },
        flask_orange: 
        {
            index: 1140,
            sprite: spr_flask_orange,
            prestige_value: 11,
            name: __("Orange Flask"),
            name_single: __("Orange"),
            name_plural: __("Orange Flasks"),
            can_generate_in_quests: true,
            can_trade: true,
            print_value_multiplier: 0.006,
            type: global.resource_types.flask
        },
        flask_black: 
        {
            index: 1150,
            sprite: spr_flask_black,
            prestige_value: 12,
            name: __("Black Flask"),
            name_single: __("Black"),
            name_plural: __("Black Flasks"),
            can_generate_in_quests: true,
            can_trade: true,
            print_value_multiplier: 0.005,
            type: global.resource_types.flask
        },
        flask_strange: 
        {
            index: 1160,
            sprite: spr_flask_strange,
            prestige_value: 13,
            name: __("Strange Flask"),
            name_single: __("Strange"),
            name_plural: __("Strange Flasks"),
            can_generate_in_quests: true,
            can_trade: true,
            print_value_multiplier: 0.001,
            type: global.resource_types.flask
        },
        honor: 
        {
            index: -1030,
            sprite: spr_resource_honor,
            name: __("Honor"),
            name_single: __("Honor"),
            name_plural: __("Honor"),
            decimal: true,
            discountable: false,
            
            include_in_stats: function()
            {
                return global.game_settings.honor_enabled && mp_is_season();
            },
            
            show_in_nav_check: function()
            {
                return global.game_settings.honor_enabled && mp_is_season();
            },
            
            persist_prestige: true,
            season_only: true,
            type: global.resource_types.currency
        },
        season_gems: 
        {
            index: -1010,
            sprite: spr_resource_season_gem,
            name: __("Season Gems"),
            name_single: __("Season Gem"),
            name_plural: __("Season Gems"),
            discountable: false,
            
            include_in_stats: function()
            {
                return global.game_settings.season_gems_enabled && mp_is_season();
            },
            
            show_in_nav_check: function()
            {
                return global.game_settings.season_gems_enabled && mp_is_season();
            },
            
            persist_prestige: true,
            season_only: true,
            type: global.resource_types.currency
        },
        gems: 
        {
            index: -1000,
            sprite: spr_resource_gem,
            name: __("Gems"),
            name_single: __("Gem"),
            name_plural: __("Gems"),
            discountable: false,
            chest_values: 
            {
                common: 
                {
                    min: 1,
                    max: 1
                },
                uncommon: 
                {
                    min: 1,
                    max: 1
                },
                rare: 
                {
                    min: 1,
                    max: 2
                },
                epic: 
                {
                    min: 3,
                    max: 4
                },
                legendary: 
                {
                    min: 5,
                    max: 10
                }
            },
            persist_prestige: true,
            type: global.resource_types.currency
        },
        nature_gems: 
        {
            index: -990,
            sprite: spr_resource_nature_gem,
            name: __("Nature Gems"),
            name_single: __("Nature Gem"),
            name_plural: __("Nature Gems"),
            discountable: false,
            nav_type: global.resource_types.event,
            persist_prestige: true,
            type: global.resource_types.currency,
            
            show_in_nav_check: function()
            {
                return is_event_active(global.events.nature_season) && is_unlocked_areas();
            }
        },
        gold_token: 
        {
            index: -11,
            sprite: spr_resource_gold_token,
            name: __("Gold Token"),
            name_single: __("Gold Token"),
            name_plural: __("Gold Tokens"),
            discountable: false,
            chest_value_base: 50,
            chest_value_minmax_multiplier: 4,
            chest_value_rarity_multiplier: 2,
            is_prestige_resource: false,
            is_tower_resource: true,
            persist_prestige_level: global.prestige_levels.blc.level,
            show_in_nav: true,
            type: global.resource_types.currency
        },
        silver_token: 
        {
            index: -10,
            sprite: spr_resource_silver_token,
            name: __("Silver Token"),
            name_single: __("Silver Token"),
            name_plural: __("Silver Tokens"),
            discountable: false,
            chest_value_base: 500,
            chest_value_minmax_multiplier: 4,
            chest_value_rarity_multiplier: 2,
            is_prestige_resource: false,
            is_tower_resource: true,
            persist_prestige_level: global.prestige_levels.blc.level,
            show_in_nav: true,
            type: global.resource_types.currency
        },
        ulc: 
        {
            index: -830,
            sprite: spr_ulc,
            name: __("ULC Coins"),
            name_single: __("ULC"),
            name_plural: __("ULCs"),
            discountable: false,
            is_prestige_resource: true,
            persist_prestige_level: global.prestige_levels.ulc.level,
            prestige_level: global.prestige_levels.ulc.level,
            type: global.resource_types.currency
        },
        mlc: 
        {
            index: -820,
            sprite: spr_mlc,
            name: __("MLC Coins"),
            name_single: __("MLC"),
            name_plural: __("MLCs"),
            discountable: false,
            is_prestige_resource: true,
            persist_prestige_level: global.prestige_levels.mlc.level,
            prestige_level: global.prestige_levels.mlc.level,
            type: global.resource_types.currency
        },
        blc: 
        {
            index: -810,
            sprite: spr_blc,
            name: __("BLC Coins"),
            name_single: __("BLC"),
            name_plural: __("BLCs"),
            discountable: false,
            is_prestige_resource: true,
            persist_prestige_level: global.prestige_levels.blc.level,
            prestige_level: global.prestige_levels.blc.level,
            type: global.resource_types.currency
        },
        coins: 
        {
            index: -800,
            sprite: spr_gold,
            name: __("Prestige Coins"),
            name_single: __("Prestige Coin"),
            name_plural: __("Prestige Coins"),
            discountable: false,
            is_prestige_resource: true,
            persist_prestige_level: global.prestige_levels.prestige.level,
            prestige_level: global.prestige_levels.prestige.level,
            show_in_nav: true,
            type: global.resource_types.currency
        },
        ship_fuel: 
        {
            index: -551,
            sprite: spr_resource_ship_fuel,
            name: __("Ship Fuel"),
            name_single: __("Ship Fuel"),
            name_plural: __("Ship Fuels"),
            decimal: true,
            discountable: false,
            is_prestige_resource: false,
            persist_prestige: true,
            show_in_nav: true,
            type: global.resource_types.misc
        },
        water_crystal: 
        {
            index: -550,
            sprite: spr_resource_water_crystal,
            name: __("Water Crystals"),
            name_single: __("Water Crystal"),
            name_plural: __("Water Crystals"),
            discountable: false,
            is_prestige_resource: false,
            persist_prestige: true,
            show_in_nav: true,
            type: global.resource_types.misc
        },
        fish_credits: 
        {
            index: -541,
            sprite: spr_resource_fish_credits,
            name: __("Fish Credits"),
            name_single: __("Fish Credit"),
            name_plural: __("Fish Credits"),
            discountable: false,
            is_prestige_resource: false,
            persist_prestige: true,
            type: global.resource_types.misc
        },
        fish_trash: 
        {
            index: -540,
            sprite: spr_resource_fish_trash,
            name: __("Trash"),
            name_single: __("Trash"),
            name_plural: __("Trash"),
            discountable: false,
            is_prestige_resource: false,
            persist_prestige: true,
            type: global.resource_types.misc
        },
        dice: 
        {
            index: -531,
            sprite: spr_icon_die,
            name: __("Dice Points"),
            name_single: __("Dice Point"),
            name_plural: __("Dice Points"),
            discountable: false,
            is_prestige_resource: false,
            persist_prestige: true,
            type: global.resource_types.misc
        },
        power_dice: 
        {
            index: -530,
            sprite: spr_icon_power_die,
            name: __("Power Dice Points"),
            name_single: __("Power Dice Point"),
            name_plural: __("Power Dice Points"),
            discountable: false,
            is_prestige_resource: false,
            persist_prestige: true,
            type: global.resource_types.misc
        },
        cp: 
        {
            index: -40,
            sprite: spr_icon_challenge,
            name: __("Challenge Points"),
            name_single: __("Challenge Point"),
            name_plural: __("Challenge Points"),
            discountable: false,
            is_prestige_resource: false,
            persist_prestige: true,
            type: global.resource_types.misc
        },
        fruits: 
        {
            index: 10000,
            sprite: spr_fruit,
            name: __("Fruits"),
            name_single: __("Fruit"),
            name_plural: __("Fruits"),
            discountable: false,
            show_in_nav: false,
            type: global.resource_types.misc
        },
        seeds: 
        {
            index: 10100,
            sprite: spr_seed_leaf,
            name: __("Seeds"),
            name_single: __("Seed"),
            name_plural: __("Seeds"),
            show_in_nav: false,
            discountable: false,
            type: global.resource_types.misc
        },
        borbs: 
        {
            index: 10200,
            sprite: spr_borb,
            name: __("Borbs"),
            name_single: __("Borb"),
            name_plural: __("Borbs"),
            calculate_single_upgrade: true,
            discountable: false,
            chest_value_base: 50,
            chest_value_minmax_multiplier: 3,
            chest_value_rarity_multiplier: 2,
            harbor_container_add_value: 10,
            print_value_multiplier: 0.1,
            armor: 99999999,
            show_single_reward: true,
            persist_prestige_level: global.prestige_levels.mlc.level,
            type: global.resource_types.misc,
            
            show_in_nav_check: function()
            {
                return is_unlocked_borbs();
            }
        },
        borb_juice: 
        {
            index: 10210,
            sprite: spr_flask_borb,
            name: __("Borb Juice"),
            name_single: __("Borb Juice"),
            name_plural: __("Borb Juice"),
            calculate_single_upgrade: true,
            can_generate_in_quests: false,
            can_trade: false,
            discountable: false,
            persist_prestige_level: global.prestige_levels.mlc.level,
            type: global.resource_types.misc,
            data: 
            {
                unlocked: true
            },
            
            show_in_nav_check: function()
            {
                return is_unlocked_borbventure() && self.data.collected_total > 0;
            }
        },
        borb_ascension_juice: 
        {
            index: 10211,
            sprite: spr_flask_borb_ascension_juice,
            name: __("Borb Ascension Juice"),
            name_single: __("Borb Ascension Juice"),
            name_plural: __("Borb Ascension Juice"),
            calculate_single_upgrade: true,
            can_generate_in_quests: false,
            can_trade: false,
            discountable: false,
            persist_prestige_level: global.prestige_levels.mlc.level,
            type: global.resource_types.misc,
            data: 
            {
                unlocked: true
            },
            
            show_in_nav_check: function()
            {
                return is_unlocked_borbventure() && self.data.collected_total > 0;
            }
        },
        borb_token: 
        {
            index: 10212,
            sprite: spr_resource_borb_token,
            name: __("Borb Token"),
            name_single: __("Borb Token"),
            name_plural: __("Borb Tokens"),
            can_generate_in_quests: false,
            can_trade: false,
            discountable: false,
            persist_prestige_level: global.prestige_levels.mlc.level,
            type: global.resource_types.misc,
            data: 
            {
                unlocked: true
            },
            
            show_in_nav_check: function()
            {
                return is_unlocked_borbventure() && self.data.collected_total > 0;
            }
        },
        borb_rune: 
        {
            index: 10213,
            sprite: spr_resource_borb_rune,
            name: __("Borb Rune"),
            name_single: __("Borb Rune"),
            name_plural: __("Borb Runes"),
            can_generate_in_quests: false,
            can_trade: false,
            discountable: false,
            persist_prestige_level: global.prestige_levels.mlc.level,
            type: global.resource_types.misc,
            data: 
            {
                unlocked: true
            },
            
            show_in_nav_check: function()
            {
                return is_unlocked_borbventure() && self.data.collected_total > 0;
            }
        },
        borb_ascension_rune: 
        {
            index: 10213.1,
            sprite: spr_resource_borb_ascension_rune,
            name: __("Borb Ascension Rune"),
            name_single: __("Borb Ascension Rune"),
            name_plural: __("Borb Ascension Runes"),
            can_generate_in_quests: false,
            can_trade: false,
            discountable: false,
            persist_prestige_level: global.prestige_levels.mlc.level,
            type: global.resource_types.misc,
            data: 
            {
                unlocked: true
            },
            
            show_in_nav_check: function()
            {
                return is_unlocked_borbventure() && self.data.collected_total > 0;
            }
        },
        diamond_coal: 
        {
            index: 10221,
            sprite: spr_resource_coal_diamond,
            name: __("Coal Diamond"),
            name_single: __("Coal Diamond"),
            name_plural: __("Coal Diamonds"),
            can_generate_in_quests: false,
            can_trade: false,
            discountable: false,
            persist_prestige_level: global.prestige_levels.mlc.level,
            type: global.resource_types.misc,
            
            show_in_nav_check: function()
            {
                return is_unlocked_mines();
            }
        },
        diamond_shiny: 
        {
            index: 10221.1,
            sprite: spr_resource_diamond,
            name: __("Shiny Diamond"),
            name_single: __("Shiny Diamond"),
            name_plural: __("Shiny Diamonds"),
            can_generate_in_quests: false,
            can_trade: false,
            discountable: false,
            persist_prestige_level: global.prestige_levels.mlc.level,
            type: global.resource_types.misc,
            
            show_in_nav_check: function()
            {
                return is_unlocked_mines();
            }
        },
        coal_time_sphere: 
        {
            index: 10222,
            sprite: spr_resource_coal_time_sphere,
            name: __("Coal Time Sphere"),
            name_single: __("Coal Time Sphere"),
            name_plural: __("Coal Time Spheres"),
            discountable: false,
            
            show_in_nav_check: function()
            {
                return is_unlocked_mines();
            },
            
            persist_prestige_level: global.prestige_levels.inf.level,
            type: global.resource_types.misc
        },
        fuel: 
        {
            index: 10223,
            sprite: spr_resource_fuel,
            name: __("Fuel"),
            name_single: __("Fuel"),
            name_plural: __("Fuels"),
            discountable: false,
            
            show_in_nav_check: function()
            {
                return is_unlocked_mines();
            },
            
            persist_prestige_level: global.prestige_levels.inf.level,
            type: global.resource_types.misc
        },
        cheese: 
        {
            index: 10300,
            sprite: spr_icon_cheese,
            name: __("Cheese"),
            name_single: __("Cheese"),
            name_plural: __("Cheese"),
            calculate_single: true,
            discountable: false,
            chest_value_base: 5,
            chest_value_minmax_multiplier: 3,
            chest_value_rarity_multiplier: 2,
            data: 
            {
                unlocked: true
            },
            print_value_multiplier: 0.01,
            
            show_in_nav_check: function()
            {
                return self.data.unlocked || get_upgrade_count(global.shops.blc.unlock_trading) > 0 || get_upgrade_count(global.shops.blc.unlock_crafting) > 0 || !is_undefined(variable_struct_get(global.globalstats.challenge_data.unlocked_resources, self.key));
            },
            
            persist_prestige_level: global.prestige_levels.mlc.level,
            type: global.resource_types.misc
        },
        beer: 
        {
            index: 10400,
            sprite: spr_icon_beer,
            name: __("Beer"),
            name_single: __("Beer"),
            name_plural: __("Beers"),
            calculate_single: true,
            discountable: false,
            chest_value_base: 1,
            chest_value_minmax_multiplier: 3,
            chest_value_rarity_multiplier: 2,
            data: 
            {
                unlocked: true
            },
            print_value_multiplier: 0.001,
            
            show_in_nav_check: function()
            {
                return get_upgrade_count(global.shops.blc.unlock_trading) > 0 || get_upgrade_count(global.shops.blc.unlock_crafting) > 0;
            },
            
            persist_prestige_level: global.prestige_levels.mlc.level,
            type: global.resource_types.misc
        },
        mulch: 
        {
            index: 10500,
            sprite: spr_icon_mulch,
            sprite_seed: spr_seed_mulch,
            name: __("Mulch"),
            name_single: __("Mulch"),
            name_plural: __("Mulch"),
            calculate_single_upgrade: true,
            discountable: false,
            chest_value_base: 10,
            chest_value_minmax_multiplier: 3,
            chest_value_rarity_multiplier: 2,
            has_seeds: true,
            prestige_value: 25,
            print_value_multiplier: 0.0001,
            show_single_reward: true,
            
            show_in_nav_check: function()
            {
                return get_upgrade_count(global.shops.blc.unlock_mulch) > 0;
            },
            
            persist_prestige_level: global.prestige_levels.mlc.level,
            type: global.resource_types.misc
        },
        card_parts: 
        {
            index: 10550,
            sprite: spr_icon_card_part,
            name: __("Card Part"),
            name_single: __("Card Part"),
            name_plural: __("Card Parts"),
            calculate_single_upgrade: true,
            discountable: false,
            chest_value_base: 0,
            chest_value_minmax_multiplier: 2,
            chest_value_rarity_multiplier: 2,
            
            show_in_nav_check: function()
            {
                return is_unlocked_cards() && global.resources.card_parts.data.collected_total > 0;
            },
            
            persist_prestige_level: global.prestige_levels.mlc.level,
            type: global.resource_types.misc
        },
        transcension_card_parts: 
        {
            index: 10551,
            sprite: spr_resource_card_part_transcend,
            name: __("Transcension Card Part"),
            name_single: __("Transcension Card Part"),
            name_plural: __("Transcension Card Parts"),
            calculate_single_upgrade: true,
            discountable: false,
            chest_value_base: 0,
            chest_value_minmax_multiplier: 2,
            chest_value_rarity_multiplier: 2,
            
            show_in_nav_check: function()
            {
                return is_unlocked_cards() && global.resources.transcension_card_parts.data.collected_total > 0;
            },
            
            persist_prestige_level: global.prestige_levels.ulc.level,
            type: global.resource_types.misc
        },
        shards: 
        {
            index: 10600,
            sprite: spr_resource_shards,
            name: __("Shards"),
            name_single: __("Shard"),
            name_plural: __("Shards"),
            calculate_single_upgrade: true,
            discountable: false,
            chest_value_base: 0,
            chest_value_minmax_multiplier: 2,
            chest_value_rarity_multiplier: 2,
            
            show_in_nav_check: function()
            {
                return get_upgrade_count(global.shops.ancient.unlock_shards) > 0;
            },
            
            persist_prestige_level: global.prestige_levels.mlc.level,
            type: global.resource_types.misc
        },
        ascension_shards: 
        {
            index: 10700,
            sprite: spr_resource_ascension_shards,
            name: __("Ascension Shards"),
            name_single: __("Ascension Shard"),
            name_plural: __("Ascension Shards"),
            calculate_single_upgrade: true,
            discountable: false,
            chest_value_base: 0,
            chest_value_minmax_multiplier: 2,
            chest_value_rarity_multiplier: 2,
            
            show_in_nav_check: function()
            {
                return is_unlocked_ascension_shards();
            },
            
            persist_prestige_level: global.prestige_levels.mlc.level,
            type: global.resource_types.misc
        },
        fusion_shards: 
        {
            index: 10710,
            sprite: spr_resource_fusion_shards,
            name: __("Fusion Shards"),
            name_single: __("Fusion Shard"),
            name_plural: __("Fusion Shards"),
            calculate_single_upgrade: true,
            discountable: false,
            chest_value_base: 0,
            chest_value_minmax_multiplier: 2,
            chest_value_rarity_multiplier: 2,
            
            show_in_nav_check: function()
            {
                return is_unlocked_fusion_shards();
            },
            
            persist_prestige_level: global.prestige_levels.mlc.level,
            type: global.resource_types.misc
        },
        transformation_shards: 
        {
            index: 10720,
            sprite: spr_resource_transformation_shards,
            name: __("Transformation Shards"),
            name_single: __("Transformation Shard"),
            name_plural: __("Transformation Shards"),
            calculate_single_upgrade: true,
            discountable: false,
            chest_value_base: 0,
            chest_value_minmax_multiplier: 2,
            chest_value_rarity_multiplier: 2,
            
            show_in_nav_check: function()
            {
                return is_unlocked_transformation_shards();
            },
            
            persist_prestige_level: global.prestige_levels.mlc.level,
            type: global.resource_types.misc
        },
        soul_stones: 
        {
            index: 11000,
            sprite: spr_resource_soul_stone,
            name: __("Soul Stone"),
            name_single: __("Soul Stone"),
            name_plural: __("Soul Stones"),
            calculate_single_upgrade: true,
            discountable: false,
            chest_value_base: 0,
            chest_value_minmax_multiplier: 2,
            chest_value_rarity_multiplier: 2,
            
            show_in_nav_check: function()
            {
                return is_unlocked_resource(global.resources.soul_stones);
            },
            
            persist_prestige_level: global.prestige_levels.mlc.level,
            type: global.resource_types.misc
        },
        soul_keys: 
        {
            index: 11010,
            sprite: spr_material_key,
            name: __("Soul Key"),
            name_single: __("Soul Key"),
            name_plural: __("Soul Keys"),
            calculate_single_upgrade: true,
            discountable: false,
            
            show_in_nav_check: function()
            {
                return is_unlocked_soul_realm();
            },
            
            persist_prestige_level: global.prestige_levels.mlc.level,
            type: global.resource_types.misc
        },
        soul_particles: 
        {
            index: 11020,
            sprite: spr_resource_soul_particle,
            name: __("Soul Particle"),
            name_single: __("Soul Particle"),
            name_plural: __("Soul Particles"),
            calculate_single_upgrade: true,
            discountable: false,
            
            show_in_nav_check: function()
            {
                return is_unlocked_soul_realm();
            },
            
            persist_prestige_level: global.prestige_levels.mlc.level,
            type: global.resource_types.misc
        },
        soul_entities: 
        {
            index: 11030,
            sprite: spr_resource_soul_entity,
            name: __("Soul Entity"),
            name_single: __("Soul Entity"),
            name_plural: __("Soul Entities"),
            calculate_single_upgrade: true,
            discountable: false,
            
            show_in_nav_check: function()
            {
                return is_unlocked_soul_realm();
            },
            
            persist_prestige_level: global.prestige_levels.mlc.level,
            type: global.resource_types.misc
        },
        soul_flask: 
        {
            index: 11040,
            sprite: spr_resource_soul_flask,
            name: __("Soul Flask"),
            name_single: __("Soul Flask"),
            name_plural: __("Soul Flasks"),
            calculate_single_upgrade: true,
            discountable: false,
            
            show_in_nav_check: function()
            {
                return is_unlocked_soul_realm();
            },
            
            persist_prestige_level: global.prestige_levels.mlc.level,
            type: global.resource_types.misc
        },
        soul_empty: 
        {
            index: 11050,
            prestige_value: 35,
            sprite: spr_leaf_soul_empty,
            sprite_seed: spr_placeholder,
            name: __("Empty Soul Leaf"),
            name_single: __("Empty Soul"),
            name_plural: __("Empty Soul Leaves"),
            armor: 1000000000000000,
            is_leaf: true,
            spawn_chance: 0,
            spawn_chance_seed: 0,
            calculate_single_upgrade: true,
            can_generate_in_quests: false,
            can_lose_resource: true,
            can_trade: false,
            has_craft_property_leaf_add: false,
            droppable: false,
            persist_prestige_level: global.prestige_levels.mlc.level,
            printable: false,
            print_cost_multiplier: 288,
            print_value_multiplier: 0.001,
            reward_value_multiplier: 0.000001,
            seed_cost_multiplier: 100,
            seed_cost_exp: 18,
            has_fruits: false,
            has_relic: false,
            has_seeds: false,
            available_in_chest: true,
            offline_reward: true,
            offline_reward_multiplier: 0.0000001,
            upgrade_attributes_dice: 
            {
                soul_crypt_bonus_reward_multiplier: 0.02
            },
            type: global.resource_types.leaf
        },
        soul: 
        {
            index: 11060,
            prestige_value: 36,
            sprite: spr_leaf_soul,
            sprite_seed: spr_placeholder,
            name: __("Soul Leaf"),
            name_single: __("Soul"),
            name_plural: __("Soul Leaves"),
            armor: 1000000000000000,
            is_leaf: true,
            spawn_chance: 0,
            spawn_chance_seed: 0,
            calculate_single_upgrade: true,
            can_generate_in_quests: false,
            can_lose_resource: true,
            can_trade: false,
            has_craft_property_leaf_add: false,
            droppable: false,
            persist_prestige_level: global.prestige_levels.mlc.level,
            printable: false,
            print_cost_multiplier: 288,
            print_value_multiplier: 0.001,
            reward_value_multiplier: 0.000001,
            seed_cost_multiplier: 100,
            seed_cost_exp: 18,
            has_fruits: false,
            has_relic: false,
            has_seeds: false,
            available_in_chest: true,
            offline_reward: true,
            offline_reward_multiplier: 0.0000001,
            upgrade_attributes_dice: 
            {
                soul_forge_count_multiplier: 0.015
            },
            type: global.resource_types.leaf
        },
        quark: 
        {
            index: 11100,
            prestige_value: 37,
            sprite: spr_leaf_quark,
            sprite_seed: spr_placeholder,
            name: __("Quark Leaf"),
            name_single: __("Quark"),
            name_plural: __("Quark Leaves"),
            armor: 100000000000000000000,
            direction_drift_random: true,
            is_leaf: true,
            spawn_chance: 0.1,
            spawn_chance_seed: 0,
            calculate_single_upgrade: true,
            can_generate_in_quests: false,
            can_lose_resource: true,
            can_trade: false,
            has_craft_property_leaf_add: false,
            droppable: false,
            persist_prestige_level: global.prestige_levels.mlc.level,
            printable: false,
            print_cost_multiplier: 288,
            print_value_multiplier: 0.001,
            reward_value_multiplier: 0.000001,
            seed_cost_multiplier: 100,
            seed_cost_exp: 18,
            has_fruits: false,
            has_relic: false,
            has_seeds: false,
            available_in_chest: true,
            offline_reward: true,
            offline_reward_multiplier: 0.0000001,
            upgrade_attributes_dice: 
            {
                quark_damage_multiplier: 0.001,
                quark_reactor_inc_count_multiplier_dice: 0.002
            },
            type: global.resource_types.leaf
        },
        dusk: 
        {
            index: 12000,
            prestige_value: 38,
            sprite: spr_leaf_dusk,
            sprite_seed: spr_placeholder,
            name: __("Dusk Leaf"),
            name_single: __("Dusk"),
            name_plural: __("Dusk Leaves"),
            armor: 100000000000000000000,
            is_leaf: true,
            spawn_chance: 0.1,
            spawn_chance_seed: 0,
            calculate_single_upgrade: true,
            can_generate_in_quests: false,
            can_lose_resource: true,
            can_trade: false,
            has_craft_property_leaf_add: false,
            droppable: false,
            persist_prestige_level: global.prestige_levels.mlc.level,
            printable: false,
            print_cost_multiplier: 288,
            print_value_multiplier: 0.001,
            reward_value_multiplier: 0.000001,
            seed_cost_multiplier: 100,
            seed_cost_exp: 18,
            available_in_chest: false,
            has_fruits: false,
            has_relic: false,
            has_seeds: false,
            offline_reward: true,
            offline_reward_multiplier: 0.0000001,
            type: global.resource_types.leaf
        },
        quantum_blob: 
        {
            index: 19110,
            sprite: spr_resource_quantum_blob,
            name: __("Quantum Blob"),
            name_single: __("Quantum Blob"),
            name_plural: __("Quantum Blobs"),
            discountable: false,
            persist_prestige_level: global.prestige_levels.mlc.level,
            type: global.resource_types.misc
        },
        quark_blob: 
        {
            index: 19111,
            sprite: spr_resource_quark_blob,
            name: __("Quark Blob"),
            name_single: __("Quark Blob"),
            name_plural: __("Quark Blobs"),
            discountable: false,
            persist_prestige_level: global.prestige_levels.mlc.level,
            type: global.resource_types.misc
        },
        quark_structure: 
        {
            index: 19112,
            sprite: spr_resource_quark_structure,
            name: __("Quark Structure"),
            name_single: __("Quark Structure"),
            name_plural: __("Quark Structures"),
            discountable: false,
            persist_prestige_level: global.prestige_levels.mlc.level,
            type: global.resource_types.misc
        },
        leafton: 
        {
            index: 19113,
            sprite: spr_resource_leafton,
            name: __("Leafton"),
            name_single: __("Leafton"),
            name_plural: __("Leaftons"),
            discountable: false,
            persist_prestige_level: global.prestige_levels.mlc.level,
            type: global.resource_types.misc
        },
        energy_electrical: 
        {
            index: 20000,
            sprite: spr_resource_electrical_energy,
            name: __("Electrical Energy"),
            name_single: __("Electrical Energy"),
            name_plural: __("Electrical Energy"),
            discountable: false,
            is_energy: true,
            
            show_in_nav_check: function()
            {
                return is_unlocked_energy_electrical();
            },
            
            storage: 1000,
            persist_prestige_level: global.prestige_levels.mlc.level,
            type: global.resource_types.energy
        },
        energy_quark: 
        {
            index: 20010,
            sprite: spr_resource_quark_energy,
            name: __("Quark Energy"),
            name_single: __("Quark Energy"),
            name_plural: __("Quark Energy"),
            decimal: true,
            discountable: false,
            is_energy: true,
            
            show_in_nav_check: function()
            {
                return is_unlocked_quarks();
            },
            
            storage: 1,
            persist_prestige_level: global.prestige_levels.mlc.level,
            type: global.resource_types.energy
        },
        borb_o_lantern: 
        {
            index: 30000,
            sprite: spr_borb_o_lantern,
            name: __("Borb O'Lantern"),
            name_single: __("Borb O'Lantern"),
            name_plural: __("Borb O'Lanterns"),
            discountable: false,
            
            show_in_nav_check: function()
            {
                return is_event_active(global.events.halloween);
            },
            
            persist_prestige_level: global.prestige_levels.inf.level,
            type: global.resource_types.event,
            data: 
            {
                unlocked: true
            }
        },
        party_tokens: 
        {
            index: 30010,
            sprite: spr_icon_birthday_cake,
            name: __("Party Tokens"),
            name_single: __("Party Token"),
            name_plural: __("Party Tokens"),
            discountable: false,
            
            show_in_nav_check: function()
            {
                return is_event_active(global.events.anniversary) && self.data.collected_total > 0;
            },
            
            persist_prestige_level: global.prestige_levels.inf.level,
            type: global.resource_types.event,
            data: 
            {
                unlocked: true
            }
        },
        magic_mulch: 
        {
            index: 30100,
            sprite: spr_icon_magic_mulch,
            name: __("Magic Mulch"),
            name_single: __("Magic Mulch"),
            name_plural: __("Magic Mulch"),
            discountable: false,
            
            show_in_nav_check: function()
            {
                return is_event_active(global.events.nature_season) && is_unlocked_areas() && self.data.collected_total > 0;
            },
            
            persist_prestige_level: global.prestige_levels.inf.level,
            type: global.resource_types.event,
            data: 
            {
                unlocked: true
            }
        },
        clover_basic3: 
        {
            index: 30200,
            sprite: spr_resource_clover3,
            name: __("3-Leaf Clover"),
            name_single: __("3-Leaf Clover"),
            name_plural: __("3-Leaf Clovers"),
            discountable: false,
            
            show_in_nav_check: function()
            {
                return is_event_active(global.events.nature_season) && is_unlocked_areas() && self.data.collected_total > 0;
            },
            
            persist_prestige_level: global.prestige_levels.inf.level,
            type: global.resource_types.event,
            data: 
            {
                unlocked: true
            }
        },
        clover_basic4: 
        {
            index: 30201,
            sprite: spr_resource_clover4,
            name: __("4-Leaf Clover"),
            name_single: __("4-Leaf Clover"),
            name_plural: __("4-Leaf Clovers"),
            discountable: false,
            
            show_in_nav_check: function()
            {
                return is_event_active(global.events.nature_season) && is_unlocked_areas() && self.data.collected_total > 0;
            },
            
            persist_prestige_level: global.prestige_levels.inf.level,
            type: global.resource_types.event,
            data: 
            {
                unlocked: true
            }
        },
        nature_time_sphere: 
        {
            index: 30300,
            sprite: spr_resource_time_sphere,
            name: __("Nature Time Sphere"),
            name_single: __("Nature Time Sphere"),
            name_plural: __("Nature Time Spheres"),
            discountable: false,
            
            show_in_nav_check: function()
            {
                return is_event_active(global.events.nature_season) && is_unlocked_areas() && self.data.collected_total > 0;
            },
            
            persist_prestige_level: global.prestige_levels.inf.level,
            type: global.resource_types.event,
            data: 
            {
                unlocked: true
            }
        },
        usd: 
        {
            index: -400,
            sprite: spr_resource_usd,
            name: __("USD"),
            name_single: __("USD"),
            name_plural: __("USD"),
            discountable: false,
            format_value: false,
            show_in_nav: false,
            include_in_stats: false,
            type: global.resource_types.misc
        }
    };
    init_plants();
    init_butterflies();
    var defaults = 
    {
        anim: false,
        armor: 1,
        autobuy_threshold: 0,
        available_in_chest: false,
        data: 
        {
            leafscend_count: {},
            leafscend_collected: {},
            leafscend_collected_total: {},
            count: 0,
            collected: 0,
            collected_total: 0,
            fav: false,
            level: 0,
            locked: false,
            spent: 0,
            unlocked: false,
            unlocked_fruit: false
        },
        calculate_single: false,
        calculate_single_upgrade: false,
        calculate_special: false,
        can_craft: false,
        can_generate_in_quests: false,
        can_lose_resource: false,
        can_trade: false,
        chest_value_base: 0,
        chest_value_minmax_multiplier: 3,
        chest_value_rarity_multiplier: 2,
        chest_values: {},
        craft_min_rarity: 0,
        crumble: false,
        crumble_duration: 10,
        decimal: false,
        discountable: true,
        direction_drift: 0,
        direction_drift_random: false,
        droppable: false,
        force_draw: false,
        format_value: true,
        fruit_image_index: 0,
        game_item_type: UnknownEnum.Value_11,
        harbor_container_add_value: 1,
        has_craft_property_leaf_add: false,
        has_fruits: false,
        has_relic: false,
        has_seeds: false,
        house_item_can_buy: undefined,
        house_item_cost: undefined,
        include_in_stats: true,
        is_dice_enemy: true,
        is_energy: false,
        is_leaf: false,
        is_gem_leaf: false,
        is_plant: false,
        is_prestige_resource: false,
        is_tower_resource: false,
        merge_check: false,
        merge_check_active: false,
        merge_check_passive: false,
        min_blow_speed: 0,
        name: __("Unknown Leaf"),
        name_single: __("Unknown"),
        name_plural: __("Unknown Leaves"),
        nav_type: undefined,
        offline_reward: false,
        offline_reward_multiplier: 1,
        persist_prestige: false,
        persist_prestige_level: 0,
        prestige_level: 0,
        prestige_value: 0,
        printable: false,
        print_cost_multiplier: 1,
        print_value_multiplier: 1,
        res_type: "leaf",
        reward_value_multiplier: 1,
        scale: 1,
        season_only: false,
        seed_cost_exp: 1.5,
        seed_cost_multiplier: 1,
        seed_unlocked: false,
        show_in_nav: true,
        show_in_nav_check: true,
        show_single_reward: false,
        spawn_chance: 0,
        spawn_chance_seed: -1,
        sprite: spr_placeholder,
        sprite_seed: spr_placeholder,
        type: global.resource_types.misc
    };
    global.leaf_dice_enemies = [];
    global.resources_array = [];
    global.resources_array_index = [];
    global.resources_array_quests = [];
    global.resources_butterflies = [];
    global.resources_butterflies_rarity = [];
    global.resources_can_lose = [];
    global.resources_energy_array = [];
    global.resources_have_fruits = [];
    global.resources_have_seeds = [];
    global.resources_gem_leaves = [];
    global.resources_leaves = [];
    global.resources_nav = [];
    global.resources_plants = [];
    global.resources_plants_rarity = [];
    global.resources_printable = [];
    global.resources_sorted_rarity = [];
    global.resources_sorted_nav_types = {};
    global.resources_sorted_types = {};
    global.resources_sorted_types_rarity = {};
    global.resources_sorted_value = [];
    global.resources_tower = [];
    global.resources_trades = [];
    global.resources_types = {};
    var __struct = global.resource_types;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(global.resources_sorted_nav_types, mkey, []);
        variable_struct_set(global.resources_sorted_types, mkey, []);
        variable_struct_set(global.resources_sorted_types_rarity, mkey, []);
    }
    _map(global.resources, function(arg0, arg1, arg2, arg3)
    {
        arg0.reward = arg1;
        struct_apply_defaults(arg0, arg3);
        arg0.data_start = struct_clone(arg0.data);
        arg0.key = arg1;
        if (arg0.spawn_chance_seed == -1)
        {
            arg0.spawn_chance_seed = arg0.spawn_chance;
        }
        set_sprite_data(arg0);
        var nav_type = arg0.nav_type ?? arg0.type;
        arg0.nav_type = nav_type;
        array_push(variable_struct_get(global.resources_sorted_nav_types, nav_type.key), arg0);
        array_push(global.resources_array, arg0);
        array_push(global.resources_sorted_rarity, arg0);
        array_push(variable_struct_get(global.resources_sorted_types, arg0.type.key), arg0);
        array_push(variable_struct_get(global.resources_sorted_types_rarity, arg0.type.key), arg0);
        if (arg0.prestige_value > 0)
        {
            array_push(global.resources_array_index, arg0);
        }
        if (arg0.can_generate_in_quests)
        {
            array_push(global.resources_array_quests, arg0);
        }
        if (arg0.can_lose_resource)
        {
            array_push(global.resources_can_lose, arg0);
        }
        if (arg0.is_energy)
        {
            array_push(global.resources_energy_array, arg0);
        }
        if (arg0.has_fruits)
        {
            array_push(global.resources_have_fruits, arg0);
        }
        if (arg0.has_seeds)
        {
            array_push(global.resources_have_seeds, arg0);
        }
        if (arg0.printable)
        {
            array_push(global.resources_printable, arg0);
        }
        if (arg0.is_plant)
        {
            array_push(global.resources_plants, arg0);
            array_push(global.resources_plants_rarity, arg0);
        }
        if (arg0.is_tower_resource)
        {
            array_push(global.resources_tower, arg0);
        }
        if (arg0.is_leaf)
        {
            arg0.can_craft = true;
            array_push(global.resources_leaves, arg0);
            array_push(global.resources_sorted_value, arg0);
            if (arg0.is_dice_enemy)
            {
                array_push(global.leaf_dice_enemies, arg0);
            }
        }
        if (arg0.is_gem_leaf)
        {
            arg0.can_craft = true;
            arg0.craft_min_rarity = 6;
            arg0.has_craft_property_leaf_add = true;
            arg0.persist_prestige_level = global.prestige_levels.mlc.level;
            arg0.seed_cost_multiplier = 10000;
            arg0.seed_cost_exp = 4;
            array_push(global.resources_gem_leaves, arg0);
        }
        if (arg0.can_trade)
        {
            array_push(global.resources_trades, arg0);
        }
        if (arg0.include_in_stats && (mp_is_season() || (!mp_is_season() && !arg0.season_only)))
        {
            if ((is_bool(arg0.show_in_nav) && arg0.show_in_nav) || !is_bool(arg0.show_in_nav))
            {
                array_push(global.resources_nav, arg0);
            }
        }
        if (is_struct(arg0.type))
        {
            if (is_undefined(variable_struct_get(global.resources_types, arg0.type.key)))
            {
                variable_struct_set(global.resources_types, arg0.type.key, []);
            }
            array_push(variable_struct_get(global.resources_types, arg0.type.key), arg0);
        }
    }, defaults);
    sort_array_by_index(global.resources_leaves, true);
    sort_array_by(global.resources_sorted_value, "prestige_value", true);
    sort_array_by(global.leaf_dice_enemies, "prestige_value", true);
    array_sort(global.resources_array, function(arg0, arg1)
    {
        return arg0.index - arg1.index;
    });
    array_sort(global.resources_array_index, function(arg0, arg1)
    {
        return arg0.index - arg1.index;
    });
    sort_array_by_index(global.resources_nav);
    global.resources_nav_desc = array_inverse(global.resources_nav);
    sort_array_by_index(global.resources_plants, true);
    sort_array_by(global.resources_plants_rarity, "spawn_chance", true);
    __struct = global.resources_sorted_types;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        array_sort(mitem, function(arg0, arg1)
        {
            return arg0.index - arg1.index;
        });
        sort_array_by_index(variable_struct_get(global.resources_sorted_nav_types, mkey), true);
        sort_array_by(variable_struct_get(global.resources_sorted_types_rarity, mkey), "spawn_chance", true);
    }
    __struct = global.resources_types;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        sort_array_by_index(mitem, true);
    }
    array_sort(global.resources_sorted_rarity, function(arg0, arg1)
    {
        return arg0.spawn_chance - arg1.spawn_chance;
    });
    global.resources_energy = {};
    var __array = global.resources_energy_array;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        variable_struct_set(global.resources_energy, mitem.key, mitem);
    }
    global.resources_shuffled = [];
    array_copy(global.resources_shuffled, 0, global.resources_array, 0, array_length(global.resources_array));
}

enum UnknownEnum
{
    Value_11 = 11
}
