function init_globals()
{
    log("====================");
    log("=== INIT GLOBALS ===");
    log("====================");
    global.current_challenge = -1;
    global.game_time_stats = 
    {
        earliest: get_time_object(),
        latest: get_time_object(),
        start: get_time_object()
    };
    global.globalstats = 
    {
        android_save_slot_name: "0",
        challenge_data: 
        {
            quests: {},
            unlocked_resources: {}
        },
        challenge_seed: "",
        current_challenge_key: -1,
        time_elapsed: 0
    };
    global.shadow_crystal_log = [];
    global.user_log = [];
    global.current_dungeon_boss_spawned = false;
    global.current_tower_enemies = [];
    global.current_tower_enemies_floor = -1;
    global.current_tower_floor = 1;
    global.current_tower_floor_enemies_defeated = 0;
    global.current_tower_floor_enemies_proceed_base = 10;
    global.current_tower_floor_enemies_proceed = global.current_tower_floor_enemies_proceed_base;
    global.max_pyramid_floor = 1000;
    global.max_tower_floor = 10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    init_game_settings();
    init_costs();
    global.blower_action_timeout_duration = 0;
    global.blower_action_timeout_timer = 0;
    global.active_fishing_tournament = undefined;
    global.active_pets = ds_list_create();
    global.suppress_ua_refresh = false;
    global.active_scroll_count = 0;
    global.autobrew_enabled = true;
    global.autosave = iif(global.debug, false, true);
    global.bcp_nav_state = false;
    global.benchmark_enabled = false;
    global.boostergame_ua_stages = get_boostergame_ua_stages();
    global.cache = {};
    global.can_teleport = true;
    global.check_milestones_flag = false;
    global.craft_leaves_filter_index = -1;
    global.craft_leaves_filter_index_sub = 0;
    global.craft_leaves_filter_key = "";
    global.craft_leaves_filter_key_sub = "";
    global.craft_leaves_filter_struct = undefined;
    global.craft_leaves_filter_struct_sub = undefined;
    global.cloud_slot_selected = 1;
    global.cursed_dice_ua_stages = get_dice_cursed_ua_stages();
    global.damage_output_cache = __("Not calculated yet");
    global.dice_log = 
    {
        cursed_last_run: 0
    };
    global.disable_inventory_check = false;
    global.disable_leaf_exceed_draw = false;
    global.enable_upgrade_attributes = true;
    global.fishing_rod_enchant_slots = [];
    global.flasks = ["red", "green", "blue", "magenta", "orange", "black", "strange"];
    global.force_pet_limits = false;
    global.gui_instance_ids = {};
    global.guide_page = {};
    global.init_game_vars_delay = sec(1);
    global.init_game_vars_timer = 0;
    global.inventory_pages = {};
    global.is_prestiging = false;
    global.is_season_salvage = false;
    global.last_click = 
    {
        x: 0,
        y: 0
    };
    global.last_pet_capacity = -1;
    global.last_prestige_level = undefined;
    global.last_reduce_upgrade_prices = -1;
    global.last_save_upload_google = 0;
    global.max_house_items = 500;
    global.max_leaf_storage_cache = 0;
    global.max_leaf_storage_cache_level = -1;
    global.max_leaves = iif(global.is_mobile, 500, 750);
    global.max_resource_reward_texts = iif(global.is_mobile, 75, 200);
    global.mines_drill_ua_stages = get_mines_drill_ua_stages();
    global.next_ua_apply_timer = 0;
    global.player_locked = false;
    global.player_locked_x = 0;
    global.player_locked_y = 0;
    global.refresh_craft_cache = false;
    global.refresh_game_vars = true;
    global.season_pass_page = 0;
    global.selected_card = undefined;
    global.selected_card_pack = undefined;
    global.selected_card_pack_open_count = 1;
    global.selected_craft_item = undefined;
    global.selected_craft_item_id = -1;
    global.selected_crypt_level = 1;
    global.selected_death_book = undefined;
    global.selected_dice = undefined;
    global.selected_house_item = undefined;
    global.selected_inventory_item = 
    {
        harbor_target_type: "generators"
    };
    global.selected_plant = undefined;
    global.selected_plant_field = undefined;
    global.selected_season_pass_item = undefined;
    global.spawn_chances = {};
    global.spawn_chances_seed = {};
    global.struct_cache = {};
    global.upgradable_items = 
    {
        equipment: __("Equipment"),
        pets: __("Pets"),
        tools: __("Tools"),
        unique: __("Unique Leaves")
    };
    global.vial_plants_level = 0;
    global.vial_plants = undefined;
    init_minigames();
    global.gui_instances = [o_gui_instance, o_gui_scrollable_text, o_tooltip];
    init_shop_item_tags();
    global.online_shops = false;
    init_resource_types();
    init_damage_types();
    init_quark_types();
    init_area_types();
    init_upgrade_sections();
    reset_upgrade_cache();
    global.player_hp = 10;
    global.tmpdebug = false;
    global.upgrade_attributes = undefined;
    global.upgrade_attributes_start = undefined;
    init_layers();
    init_prestige_levels();
    init_resources();
    init_merge_resources();
    init_galaxies();
    init_cards_types();
    init_enemies();
    init_cards();
    init_areas();
    init_events();
    init_upgrade_attributes();
    init_artifacts();
    init_comm_leaves();
    init_dice();
    init_leafscenders();
    init_lore();
    init_materials();
    init_milestones();
    init_mines();
    init_equipment();
    init_loadouts();
    init_pets();
    init_scrolls();
    init_unique_leaves();
    init_relics();
    init_recipes();
    init_shadow_crystal();
    init_transmuters();
    init_banks();
    init_borbventures();
    init_fish();
    init_harbor();
    candle_game_init();
    init_journeys();
    init_shops(-1);
    init_challenges();
    init_chests();
    init_daily_challenges();
    init_season_pass();
    init_booster();
    init_boostergame();
    init_craft_vars();
    init_upgrade_attributes_late();
    init_texts_late();
    init_trade_types();
    init_dig_items();
    init_galaxies_late();
    init_house_items();
    init_options_late();
    init_quests();
    init_riddles();
    init_scrolls_late();
    init_dialog_sections_late();
    global.upgrade_attributes_start = struct_clone(global.upgrade_attributes);
    var __struct = global.upgrade_sections;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(global.upgrade_sections_values, mkey, struct_clone(global.upgrade_attributes));
    }
    global.number_notation_current = get_option(global.options.number_notation);
}
