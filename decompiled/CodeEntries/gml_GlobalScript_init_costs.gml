function init_costs()
{
    global.cost_types = 
    {
        materials: "materials",
        resources: "resources"
    };
    global.costs = 
    {
        blower_upgrade_base: 20,
        blower_upgrade_exp: 1.3,
        borb_claw_machine: 
        {
            cheese: 3
        },
        borb_taxi_leafton_pit: 
        {
            resources: 
            {
                quark: 5000
            }
        },
        borb_taxi_pyramid: 
        {
            resources: 
            {
                borbs: 25000
            }
        },
        borb_taxi_soul_crypt: 
        {
            resources: 
            {
                borb_token: 25
            }
        },
        borbventure_craft_item: 
        {
            borb_rune: 30
        },
        borbventure_craft_item_single: 
        {
            borb_rune: 60
        },
        borbventure_recruit_cost: 
        {
            borb_token: 100
        },
        crafted_leaves_reroll: 
        {
            beer: 5
        },
        curse_game: 
        {
            cheese: 3
        },
        fishing_bait_farm: 
        {
            materials: 
            {
                tide_crystal: 5
            }
        },
        fishing_craft_rod: 
        {
            resources: 
            {
                fish_credits: 20
            }
        },
        harbor_unlock_worker: 
        {
            resources: 
            {
                water_crystal: 50
            }
        },
        house_item: 
        {
            cp: 2
        },
        mines_craft_item_single: 
        {
            diamond_coal: 25
        },
        mines_craft_item_single_t2: 
        {
            diamond_shiny: 3
        },
        refresh_harbor_jobs: 
        {
            resources: 
            {
                water_crystal: 10
            }
        },
        reset_relics: 
        {
            materials: 
            {
                relic_fragment: 1000
            }
        },
        respec_season_shop: 
        {
            season_gems: 20
        },
        skin_cursor_premium: 
        {
            gems: 100
        },
        skin_default: 
        {
            gems: 5
        },
        skin_discount: 
        {
            gems: 1
        },
        skin_pet: 
        {
            gems: 75
        },
        skin_pet_premium: 
        {
            gems: 300
        },
        skin_premium: 
        {
            gems: 20
        },
        slots: 
        {
            cheese: 3
        },
        trades_refresh: 
        {
            cheese: 2
        },
        unlock_black_leaf_hole: 
        {
            shards: 250
        },
        unlock_death_book: 
        {
            resources: 
            {
                shards: 100000,
                borb_ascension_juice: 300
            },
            materials: 
            {
                essence_light: 500,
                essence_dark: 500,
                essence_strange: 100,
                essence_iridescent: 10
            }
        },
        unlock_ff_portal: 
        {
            borb_rune: 10,
            borb_juice: 5000,
            borb_token: 100
        },
        unlock_soul_portal: 
        {
            resources: 
            {
                soul_stones: 25
            },
            materials: 
            {
                essence_strange: 20,
                essence_iridescent: 2
            }
        },
        unlock_spark_portal: 
        {
            shards: 10000,
            ascension_shards: 500,
            fusion_shards: 500,
            transformation_shards: 500,
            energy_electrical: 50000
        },
        unlock_transform_property: 
        {
            shards: 5000,
            transformation_shards: 100,
            energy_electrical: 10000
        }
    };
}
