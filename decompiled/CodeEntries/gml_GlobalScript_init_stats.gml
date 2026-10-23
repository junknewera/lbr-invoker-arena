function init_stats()
{
    var data = o_game.data;
    if (is_undefined(struct_get_from_hash(data, variable_get_hash("skins"))) || !is_struct(data.skins))
    {
        data.skins = 
        {
            autoblower: "alb_def",
            blower: "def",
            cursor: "cursor_def"
        };
    }
    data.stats = 
    {
        areas_time: {},
        artifacts_collected: 0,
        borbcipherer: 0,
        borb_claw_machine: 
        {
            played: 0,
            won: 0,
            values: {},
            last_offline_win: ""
        },
        borb_juiced: 0,
        borb_slapped: 0,
        borbventures_finished: 0,
        boss_green_flame_counter: 0,
        boss_spectralseeker_counter: 0,
        brews: 
        {
            regular: 0,
            crits: 0
        },
        cards_transcensions: {},
        chests_opened: 0,
        claimed_rewards: {},
        claimed_seasons: [],
        combo_high: 0,
        curse_game: {},
        crafted_leaves: 0,
        crafted_leaves_fusion: 0,
        crafted_leaves_types: {},
        crafted_vars_seen: {},
        crafted_vars_transform_unlocked: {},
        cursed_count: 0,
        daily_quests: 0,
        digs: 0,
        digs_items: {},
        digs_items_count: 0,
        enemies_defeated: 0,
        enemies_slapped: 0,
        fish_caught: 0,
        fish_length_max: 0,
        fishing_spots: 0,
        game_started: 0,
        house_item_id_counter: 0,
        leaf_pub_counter: 0,
        leaf_pub_counter_delay: 0,
        leaf_pub_last_counter_name: "",
        leaves_blown_total: 0,
        leaves_mulched: 0,
        leaves_pile_max: 0,
        max_damage: 0,
        max_printer_count: 0,
        notifications: 0,
        pending_guild_resources: {},
        pets_pet: 0,
        prestige: 0,
        prestige_crunch: 0,
        prestige_mlc: 0,
        prestige_ulc: 0,
        prestige_random_number: random(1),
        prestige_resources_highest: {},
        prestige_resources_highest_history: {},
        prestige_run: {},
        prestige_time_current: -1,
        prestige_time_fastest: {},
        prints_total: 0,
        prints_total_type: {},
        prints: {},
        pub_lore_text: "",
        pub_lore_text_riddle_solved: false,
        quarks_bought_gems: 0,
        random_num: irandom_range(1, 99999),
        resources_collected_avg: {},
        resources_collected_count: {},
        riddles: {},
        salvaged_seasons: [],
        slots: 
        {
            played: 0,
            won: 0,
            slot_values: {},
            last_offline_win: ""
        },
        time_elapsed: 0,
        time_elapsed_delta: 0,
        time_elapsed_delta_max: 0,
        time_elapsed_frames: -1,
        trade_id_counter: 0,
        trades_finished: 0,
        trades_refresh: {},
        trades_refresh_start: {},
        ut: 0,
        utmax: 0,
        walked: 0
    };
    data.track_index = 0;
    _map(global.prestige_levels, function(arg0, arg1)
    {
        variable_struct_set(o_game.data.stats.prestige_time_fastest, arg0.level, -1);
    });
    for (var i = 1; i <= global.tavern_games_curse_count; i++)
    {
        variable_struct_set(o_game.data.stats.curse_game, i, {});
        struct_apply_defaults(variable_struct_get(o_game.data.stats.curse_game, i), 
        {
            played: 0,
            won: 0,
            hit: 0,
            hit_min: -1,
            hit_max: 0,
            time_min: -1,
            time_real_min: -1,
            win_streak: 0,
            win_streak_max: 0,
            replay_data_time: []
        });
    }
    var __struct = global.areas;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(data.stats.areas_time, mkey, 0);
    }
}
