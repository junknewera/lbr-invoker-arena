function init_game_vars_misc()
{
    var __benchmark_t, __benchmark_total;
    if (global.benchmark_enabled)
    {
        __benchmark_total = 0;
        log("game vars misc 1");
        __benchmark_t = current_time;
    }
    refresh_ua_values_cache();
    if (global.benchmark_enabled)
    {
        logf("Benchmark ended", current_time - __benchmark_t);
        __benchmark_total += (current_time - __benchmark_t);
        log("game vars misc 2");
        __benchmark_t = current_time;
    }
    set_struct_values(global.spawn_chances, 0);
    set_struct_values(global.spawn_chances_seed, 0);
    var __struct = global.resources;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(global.spawn_chances, mkey, mitem.spawn_chance + get_upgrade_attribute_value(variable_struct_get(global.upgrade_attributes.leaf_spawn_chance, mkey)));
        variable_struct_set(global.spawn_chances_seed, mkey, mitem.spawn_chance_seed + get_upgrade_attribute_value(variable_struct_get(global.upgrade_attributes.leaf_spawn_chance, mkey)) + (get_upgrade_attribute_value(variable_struct_get(global.upgrade_attributes.seed_spawn_chance_leaf, mkey)) * 100));
    }
    global.current_tower_floor_enemies_proceed = o_game.area.get_enemy_proceed_count();
    if (is_unlocked_energy_electrical())
    {
        add_energy(global.resources.energy_electrical, 0);
    }
    if (global.benchmark_enabled)
    {
        logf("Benchmark ended", current_time - __benchmark_t);
        __benchmark_total += (current_time - __benchmark_t);
        log("game vars misc 3");
        __benchmark_t = current_time;
    }
    with (o_game)
    {
        autocrunch_timer_duration = autocrunch_timer_base - get_upgrade_attribute_value(global.upgrade_attributes.autocrunch_timer_reduced);
        autocrunch_timer_duration = max(1, autocrunch_timer_duration);
        if (!variable_instance_exists(id, "combo"))
        {
            combo = 0;
        }
        combo_max = get_combo_max();
        combo = min(combo, combo_max);
        combo_decrease_step = (0.2 * (100 - (get_upgrade_count(global.shops.gold.combo_duration) * 5))) / 100;
        combo_counter = 0;
        combo_counter_max = rround(sec(0.5) + sec(get_upgrade_count(global.shops.gold.combo_duration) * 0.2));
        combo_multiplier = get_combo_multiplier(combo);
        combo_leaves_value = 0;
        leaf_merge_range = 24 + global.upgrade_attributes.leaf_merge_range;
    }
    if (global.benchmark_enabled)
    {
        logf("Benchmark ended", current_time - __benchmark_t);
        __benchmark_total += (current_time - __benchmark_t);
        log("game vars misc 4");
        __benchmark_t = current_time;
    }
    with (o_blower)
    {
        init();
    }
    if (global.benchmark_enabled)
    {
        logf("Benchmark ended", current_time - __benchmark_t);
        __benchmark_total += (current_time - __benchmark_t);
        log("game vars misc 5");
        __benchmark_t = current_time;
    }
    global.resources.nature_gems.data.unlocked = true;
    if (global.resources.beer.show_in_nav_check())
    {
        global.resources.beer.data.unlocked = true;
    }
    if (global.resources.cheese.show_in_nav_check())
    {
        global.resources.cheese.data.unlocked = true;
    }
    if (global.resources.celestial.data.unlocked && get_upgrade_count(global.shops.celestial.unlock_mythical_leaves) > 0)
    {
        global.resources.mythical.data.unlocked = true;
    }
    if (global.resources.mythical.data.unlocked && get_upgrade_count(global.shops.mythical.unlock_lava_leaves) > 0)
    {
        global.resources.lava.data.unlocked = true;
    }
    if (global.resources.lava.data.unlocked && get_upgrade_count(global.shops.lava.unlock_ice_leaves) > 0)
    {
        global.resources.ice.data.unlocked = true;
    }
    if (global.resources.ice.data.unlocked && get_upgrade_count(global.shops.ice.unlock_obsidian_leaves) > 0)
    {
        global.resources.obsidian.data.unlocked = true;
    }
    if (global.resources.obsidian.data.unlocked && get_upgrade_count(global.shops.obsidian.unlock_silicon_leaves) > 0)
    {
        global.resources.silicon.data.unlocked = true;
    }
    if (global.resources.silicon.data.unlocked && get_upgrade_count(global.shops.silicon.unlock_benitoite_leaves) > 0)
    {
        global.resources.benitoite.data.unlocked = true;
    }
    if (global.resources.benitoite.data.unlocked && get_upgrade_count(global.shops.benitoite.unlock_resource_moonstone) > 0)
    {
        global.resources.moonstone.data.unlocked = true;
    }
    if (global.resources.moonstone.data.unlocked && get_upgrade_count(global.shops.moonstone.unlock_resource_sand) > 0)
    {
        global.resources.sand.data.unlocked = true;
    }
    if (get_upgrade_count(global.areas.tower) > 0)
    {
        global.resources.silver_token.data.unlocked = true;
        global.resources.gold_token.data.unlocked = true;
    }
    if (is_unlocked_harbor())
    {
        global.resources.water.data.unlocked = true;
    }
    if (is_unlocked_pyramid())
    {
        global.resources.ancient.data.unlocked = true;
    }
    if (get_upgrade_count(global.shops.mlc.unlock_resource_amber) > 0)
    {
        global.resources.amber.data.unlocked = true;
    }
    if (get_upgrade_count(global.shops.mlc.unlock_resource_amethyst) > 0)
    {
        global.resources.amethyst.data.unlocked = true;
    }
    if (get_upgrade_count(global.shops.mlc.unlock_resource_emerald) > 0)
    {
        global.resources.emerald.data.unlocked = true;
    }
    if (get_upgrade_count(global.shops.mlc.unlock_resource_kyanite) > 0)
    {
        global.resources.kyanite.data.unlocked = true;
    }
    if (get_upgrade_count(global.shops.mlc.unlock_resource_rhodonite) > 0)
    {
        global.resources.rhodonite.data.unlocked = true;
    }
    if (get_upgrade_count(global.shops.mlc.unlock_resource_ruby) > 0)
    {
        global.resources.ruby.data.unlocked = true;
    }
    if (get_upgrade_count(global.shops.mlc.unlock_resource_tektite) > 0)
    {
        global.resources.tektite.data.unlocked = true;
    }
    if (get_upgrade_count(global.shops.ancient.unlock_shards) > 0)
    {
        global.resources.shards.data.unlocked = true;
    }
    if (is_unlocked_sacred())
    {
        global.resources.sacred.data.unlocked = true;
    }
    if (is_unlocked_sacred())
    {
        global.resources.biotite.data.unlocked = true;
    }
    if (get_upgrade_count(global.shops.biotite.unlock_resource_malachite) > 0)
    {
        global.resources.malachite.data.unlocked = true;
    }
    if (get_upgrade_count(global.shops.malachite.unlock_resource_hematite) > 0)
    {
        global.resources.hematite.data.unlocked = true;
    }
    if (global.areas.energy_shrine.check())
    {
        global.resources.plasma.data.unlocked = true;
    }
    if (global.areas.shadow_cavern.check())
    {
        global.resources.coal.data.unlocked = true;
    }
    if (is_unlocked_ascension_shards())
    {
        global.resources.ascension_shards.data.unlocked = true;
    }
    if (is_unlocked_fusion_shards())
    {
        global.resources.fusion_shards.data.unlocked = true;
    }
    if (is_unlocked_transformation_shards())
    {
        global.resources.transformation_shards.data.unlocked = true;
    }
    if (is_unlocked_cards())
    {
        global.resources.card_parts.data.unlocked = true;
    }
    if (is_unlocked_death_book() || is_unlocked_soul_realm())
    {
        global.resources.soul_stones.data.unlocked = true;
        global.resources.soul_keys.data.unlocked = true;
        global.resources.soul_particles.data.unlocked = true;
        global.resources.soul_entities.data.unlocked = true;
        global.resources.soul_flask.data.unlocked = true;
    }
    if (is_unlocked_soul_forge())
    {
        global.resources.soul_empty.data.unlocked = true;
        global.resources.soul.data.unlocked = true;
    }
    if (is_unlocked_quarks())
    {
        global.resources.quark.data.unlocked = true;
        global.resources.quantum_blob.data.unlocked = true;
        if (is_unlocked_quarks_structure())
        {
            global.resources.energy_quark.data.unlocked = true;
            global.resources.quark_blob.data.unlocked = true;
            global.resources.quark_structure.data.unlocked = true;
        }
        if (is_unlocked_leafton())
        {
            global.resources.leafton.data.unlocked = true;
        }
    }
    if (global.areas.tenebris_field.check())
    {
        global.resources.dusk.data.unlocked = true;
    }
    if (area_bought(global.areas.dicey_meadows))
    {
        global.resources.dice.data.unlocked = true;
        global.resources.power_dice.data.unlocked = true;
    }
    if (get_upgrade_count(global.shops.dice.unlock_azurite_leaves))
    {
        global.resources.azurite.data.unlocked = true;
    }
    if (get_upgrade_count(global.shops.dice.unlock_niobium_leaves))
    {
        global.resources.niobium.data.unlocked = true;
    }
    if (get_upgrade_count(global.shops.hematite.unlock_resource_energy_electrical) > 0)
    {
        global.resources.energy_electrical.data.unlocked = true;
    }
    if (is_gt(get_profile_resource(global.profile_types.def, global.resources.blc, "collected_total"), 0))
    {
        global.resources.cp.data.unlocked = true;
    }
    global.converters.convert_flask_strange_silver_token.data.unlocked = get_upgrade_count(global.shops.mlc.unlock_converter_strange_silver) > 0;
    global.converters.convert_silver_token_gold_token.data.unlocked = get_upgrade_count(global.shops.mlc.unlock_converter_silver_gold) > 0;
    if (is_unlocked_borbventure())
    {
        unlock_borbventures();
    }
    if (is_unlocked_fishing())
    {
        unlock_fishing();
    }
    if (is_unlocked_harbor())
    {
        unlock_harbor();
    }
    if (is_unlocked_mines())
    {
        global.resources.diamond_coal.data.unlocked = true;
        global.resources.diamond_shiny.data.unlocked = true;
        global.resources.coal_time_sphere.data.unlocked = true;
        global.resources.fuel.data.unlocked = true;
    }
    if (mp_is_season())
    {
        global.resources.honor.data.unlocked = true;
        global.resources.season_gems.data.unlocked = true;
    }
    if (global.benchmark_enabled)
    {
        logf("Benchmark ended", current_time - __benchmark_t);
        __benchmark_total += (current_time - __benchmark_t);
    }
}

function refresh_ua_values_cache()
{
    global.upgrade_attributes.blower_enemy_damage_multiplier_counter = get_blower_leaf_counter_bonus_damage(o_game.data.stats.leaf_pub_counter);
    global.cache.alchemy_autobrew_enabled = get_option(global.options.alchemy_autobrew_enabled);
    global.cache.autocollect_curse_count = get_bm_value(0, "cursed_autocollect", "cursed_autocollect_multiplier", undefined, true);
    global.cache.banks_boss_card_rarity_multiplier = get_bm_value(1, undefined, "banks_boss_card_rarity_multiplier", undefined, true);
    global.cache.blower_enemy_damage_multiplier_boost = get_booster_damage_multiplier();
    global.cache.boostergame_ua_stage = get_boostergame_ua_current_stage();
    global.cache.critical_slap_chance = get_critical_slap_chance();
    global.cache.critical_slap_multiplier = get_critical_slap_multiplier();
    global.cache.cursed_critical_chance = get_dice_cursed_critical_chance();
    global.cache.cursed_dice_ua_stage = get_dice_cursed_ua_current_stage();
    global.cache.daily_data = get_daily_data_today_nocache();
    global.cache.damage_resistance_value = {};
    global.cache.dice_battlefield_min_damage = get_dice_battlefield_min_damage();
    global.cache.dice_battlefield_max_damage = get_dice_battlefield_max_damage();
    global.cache.dice_power_roll_count = round(get_bm_value(0, "dice_power_roll_count", "dice_power_roll_count_multiplier", undefined, true));
    global.cache.enemy_cards_count = {};
    global.cache.fishing_bait_farm_progress_value = get_bm_value(global.game_settings.fishing_bait_farm_progress_value, "fishing_bait_farm_progress_value");
    global.cache.harbor_container_max_storage = get_bm_value(global.game_settings.harbor_container_max_storage, "harbor_container_max_storage", "harbor_container_max_storage_multiplier", round, true);
    global.cache.harbor_packer_max_count = get_bm_value(global.game_settings.harbor_packer_max_count, "harbor_packer_max_count", undefined, round, true);
    global.cache.harbor_packer_pack_count = get_bm_value(global.game_settings.harbor_packer_pack_count, "harbor_packer_pack_count", "harbor_packer_pack_count_multiplier", round, true);
    global.cache.harbor_roles_max_count = get_bm_value(global.game_settings.harbor_roles_max_count, "harbor_roles_max_count", undefined, round, true);
    global.cache.harbor_ships_max_count = get_bm_value(global.game_settings.harbor_ships_max_count, "harbor_ships_max_count", undefined, round, true);
    global.cache.mine_power = get_mine_power();
    global.cache.mines_drill_ua_stage = get_mines_drill_current_stage();
    global.cache.mines_fuel_drain = get_depth_drill_fuel_drain();
    global.cache.pet_auto_pet_count = round(get_bm_value(1, "pet_auto_pet_count", "pet_auto_pet_count_multiplier", undefined, true));
    global.cache.printer_printer = round(get_bm_value(0, "printer_printer", "printer_printer_multiplier", undefined, true));
    global.cache.relics_base_damage_multiplier = get_bm_value(1, undefined, "relics_base_damage_multiplier", undefined, true);
    global.cache.slap_multiplier = instance_exists(o_blower) ? get_bm_value(o_blower.blower.damage, undefined, "slap_multiplier", undefined, true) : 1;
    global.cache.soul_forge_complete_count = get_bm_value(1, "soul_forge_complete_count", "soul_forge_complete_count_multiplier", undefined, true) * (1 + get_upgrade_attribute_value(struct_get_from_hash(global.upgrade_attributes.resources_multiplier, variable_get_hash("soul"))));
    global.cache.quark_damage = get_quark_damage();
    global.cache.quark_reactor_inc_count = get_quark_reactor_inc_count();
    global.cache.quark_reactor_size = get_quark_reactor_size();
    refresh_shop_prices();
}

function refresh_shop_prices()
{
    global.cache.discount_value = (global.shops.coins.reduce_upgrade_prices.upgrade_attributes.reduce_upgrade_prices * global.shops.coins.reduce_upgrade_prices.data.count) + (global.challenges.hands_only.upgrade_attributes.reduce_upgrade_prices * sign(global.challenges.hands_only.data.finished));
    var __array = global.shops_items_array;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        mitem.cost_cache_current = undefined;
        mitem.cost_cache_current_count = 0;
        mitem.cost_cache_reduced_price = 0;
        mitem.cost_cache_reduced_price_ua_count = 0;
        mitem.maxed = check_shop_item_maxed(mitem);
    }
}
