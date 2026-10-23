function init_game_data()
{
    o_game.data = 
    {
        achievement_rank_claimed: {},
        artifact_counter: 0,
        autobuy_priorities: {},
        autocollect_counters: 
        {
            curses: 0,
            materials: 0
        },
        booster_game: 
        {
            actions: [],
            actions_history: {},
            distance: 0,
            distance_high: 0,
            distance_last: 0,
            distance_total: 0,
            fuel: 0,
            hp: 0,
            log: [],
            metal: 0,
            plays: 0,
            risk_fields: {},
            status: UnknownEnum.Value_0,
            turns: 0,
            turns_total: 0,
            upgrades: {}
        },
        borbventure_generation_disabled_tags: {},
        borbventure_generation_time: {},
        borbventure_id_counter: 0,
        borbventure_item_id_counter: 0,
        borbventure_types_seen: {},
        borbventurer_id_counter: 0,
        candle: 
        {
            auto_advance_timer: 0,
            auto_attack_timer: 0,
            available_skills: [],
            candles: [],
            candles_blown: 0,
            candles_blown_total: 0,
            current_level: 0,
            dead: false,
            highest_stage: 1,
            manual_blow_cooldown: 0,
            playing: false,
            reward: undefined,
            reward_claimed: true,
            reward_full: undefined,
            skill_choice_shown: false,
            stage_reward: 
            {
                resources: 
                {
                    party_tokens: 0
                }
            },
            stage_timer: 0,
            stages_completed: 0,
            state: 0,
            upgrades: {}
        },
        cchk: 0,
        challenge_time_completed_frames: 0,
        codes_redeemed: {},
        craft_presets: {},
        craft_presets_names: {},
        craft_sets: {},
        craft_sets_names: {},
        current_alb_weapon_key: false,
        current_area_key: undefined,
        current_block: 0,
        current_craft_set: 0,
        current_guide_key: __("General"),
        current_guide_sub_key: __("Welcome"),
        current_lore_key: "",
        current_lore_page: 0,
        current_pet_team: 0,
        current_save_slot: 1,
        current_weapon_key: false,
        daily_data: [],
        daily_rewards_claimed: [],
        dbgchk: 0,
        dice: 
        {
            auto_roll_timer: 0,
            battlefield_last_roll: 0,
            battlefield_level: 0,
            battlefield_level_max: 0,
            battlefield_rarity: "normal",
            battlefield_roll_delay: 0,
            cursed_count_current: 0,
            cursed_count_max: 0,
            cursed_count_max_saved: 0,
            cursed_count_total: 0,
            cursed_count_total_saved: 0,
            cursed_crit: false,
            cursed_curses_total: 0,
            cursed_last_crit_value: 0,
            cursed_last_roll: 0,
            cursed_last_roll_raw: 0,
            cursed_last_rolls: [],
            cursed_last_run: 0,
            cursed_last_saved: 0,
            cursed_reward: undefined,
            cursed_reward_next_save_time: 0,
            cursed_roll_timeout: 0,
            cursed_rolls_total: 0,
            drop_charges: 0,
            drop_timer: 0,
            drop_total: 0,
            types_seen: {}
        },
        dlc_cache: {},
        dlc_claimed: {},
        dlc_orders: {},
        dlc_status: {},
        fishing: 
        {
            search_charges: 0
        },
        flags: 
        {
            black_leaf_hole: false,
            death_book: false,
            ff_prison_solution: 0,
            ff_prison_solved: false,
            ff_prison_values: {}
        },
        game_log: [],
        harbor: 
        {
            container: undefined,
            diver_result: 
            {
                resources: 
                {
                    water_crystal: 0
                }
            },
            generators: {},
            jobs: [],
            job_refresh_count: 0,
            job_refresh_time_end: 0,
            pending_inventory_result: {},
            ships: [],
            stats: 
            {
                containers_packed: 0,
                jobs_completed: 0,
                leaves_pushed: 0,
                shipments_completed: 0
            },
            types_seen: {}
        },
        input_log: [],
        journeys: 
        {
            anniversary: {},
            fishing: {},
            harbor: {}
        },
        last_daily_reward: 0,
        daily_streak: 0,
        daily_last_completed_day: "",
        last_report_id: "",
        last_report_upload: 0,
        loadouts: {},
        loadouts_options: {},
        loadouts_names: {},
        log_id_counter: 0,
        milestones_claimed: {},
        mines: 
        {
            caves_claimed: 0,
            caves_id_counter: 0,
            drill_depth: 0,
            id_counter: 0,
            item_id_counter: 0,
            mines_completed: 0,
            power_drills: 0,
            types_seen: {},
            upgrade_attributes: {},
            veins: [],
            veins_level: 0,
            veins_id_counter: 0,
            veins_mined: 0,
            veins_searched: 0
        },
        mirror_timer: 0,
        mirrors: {},
        mobile_review_shown: false,
        mp_current_run_finished: false,
        mp_tracker: [],
        nature_season: 
        {
            butterflies_harvested: 0,
            fields_enhanced: 0,
            field_props: {},
            fields: {},
            fields_butterflies: {},
            level: 0,
            plants_harvested: 0,
            rewards_claimed: 
            {
                f2p: {},
                premium: {}
            },
            tutorial_step: 0,
            vial_charges: 0,
            vial_timer: 0,
            xp: 0,
            xp_total: 0
        },
        nav_fav_sets: {},
        nav_items: {},
        news_seen: {},
        os: {},
        os_devices: {},
        os_last: 0,
        pet_team_names: {},
        pet_teams: {},
        player_id: guid(),
        player_steam_id: steam_get_user_steam_id(),
        priority_names: {},
        quantum: 
        {
            count: 0
        },
        quarks: 
        {
            quark_add_counter: 0,
            quark_seed: -1,
            quarkstige_count: 0,
            quarks: 
            {
                basic: {},
                gold: {},
                strange: {},
                plasma: {},
                soul: {},
                cursed: {}
            },
            reactor: 
            {
                count: 0,
                level: 1,
                modifier: -1
            }
        },
        random_num: irandom_range(1, 9999999),
        scrolls_teams: {},
        season_challenge_init_done: false,
        season_id: undefined,
        season_quests_claimed: {},
        shadow_pit: 
        {
            ascend_count: 0,
            strength: 0
        },
        soul_forge_counter: 0,
        tester_message_shown: false,
        timeouts: {},
        tower_floor_peak_flag: false,
        trade_types_started: {},
        ulc_settings: {},
        upgrade_texts_seen: {},
        upload_save_time: undefined
    };
    var __struct = global.shops.dlc;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(o_game.data.dlc_claimed, mkey, {});
    }
    init_game_data_after();
}

function init_game_data_after()
{
}

enum UnknownEnum
{
    Value_0
}
