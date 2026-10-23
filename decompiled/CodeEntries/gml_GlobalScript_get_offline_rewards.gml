function add_offline_rewards(arg0, arg1 = "", arg2 = false, arg3 = false, arg4 = true, arg5 = false, arg6 = false)
{
    var offline_rewards = get_offline_rewards(arg0, arg3, arg4, undefined, arg5, arg6);
    add_result(offline_rewards, arg1, __("Offline Rewards"), arg2, true);
}

function get_offline_rewards(arg0, arg1 = undefined, arg2 = true, arg3 = true, arg4 = false, arg5 = false)
{
    if (live_auto_call_1())
    {
        var lac_argc = argument_count;
        var lac_args = array_create(lac_argc);
        var lac_argk = 0;
        repeat (lac_argc)
        {
            lac_args[lac_argk] = argument[lac_argk];
            lac_argk++;
        }
        if (live_auto_call_2(lac_args))
        {
            return global.live_result;
        }
    }
    var trees = global.upgrade_attributes.trees;
    var offline_base_value = arg0;
    var offline_frames = sec(arg0);
    var offline_value = offline_base_value;
    offline_value += (offline_base_value * trees);
    offline_value += (offline_value * global.upgrade_attributes.leaf_add);
    offline_value += (offline_value * max(0, global.upgrade_attributes.leaf_multiplier - 1) * (1 + global.upgrade_attributes.leaf_hard_multiplier));
    offline_value += (offline_value * global.upgrade_attributes.offline_multiplier);
    offline_value = rround(offline_value / 4);
    var artifacts_collected = {};
    var misc = {};
    var res_added = {};
    var res_count = 0;
    var seed_count = 0;
    var stats_added = {};
    var result = get_empty_result_struct();
    var __struct = global.resources;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(res_added, mkey, 0);
    }
    if (!is_undefined(struct_get_from_hash(o_game.data.stats, variable_get_hash("resources_collected_avg"))))
    {
        __struct = global.resources;
        __prop_names = struct_get_names(__struct);
        __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            if (!mitem.data.unlocked || !get_value_ext(mitem, mitem.offline_reward, false))
            {
                continue;
            }
            var res_add_value = get_leaf_reward_offline_value(mitem, arg0);
            add_to_struct_value(result.resources, mkey, res_add_value);
        }
    }
    __struct = global.shops.printers;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (!variable_struct_get(global.resources, mitem.resource.key).data.unlocked)
        {
            continue;
        }
        var printer_value = get_printer_value(mitem, arg0);
        if (printer_value == 0)
        {
            continue;
        }
        add_to_struct_value(result.resources, mitem.resource.key, printer_value);
    }
    if (!global.game_settings.seeds_enabled)
    {
        arg1 = true;
    }
    if (is_undefined(arg1) || !arg1)
    {
        var res_added_seeds = get_offline_seeds(arg0);
        add_struct_to_struct(result.resources, res_added_seeds);
    }
    if (is_unlocked_trading() && arg3 && !arg4 && !arg5)
    {
        __array = global.trades;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            mitem.forward_time(sec(arg0));
        }
    }
    var converted_resources_total = {};
    var __array = global.converters_array;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (!can_converter_convert(mitem))
        {
            continue;
        }
        if (arg4 && mitem.time_resistant)
        {
            continue;
        }
        var convert_index = 0;
        var convert_count = arg0;
        var resources_from_to = get_converter_input_resources(mitem);
        var res_converted = convert_resources(mitem, convert_count, arg3);
        if (!is_struct(res_converted))
        {
            continue;
        }
        var __struct2 = res_converted.to;
        var __prop_names2 = struct_get_names(__struct2);
        var __prop_len2 = array_length(__prop_names2);
        for (var __i2 = 0; __i2 < __prop_len2; __i2++)
        {
            var mkey2 = __prop_names2[__i2];
            var mitem2 = variable_struct_get(__struct2, mkey2);
            if (is_undefined(variable_struct_get(converted_resources_total, mkey2)))
            {
                variable_struct_set(converted_resources_total, mkey2, 0);
            }
            variable_struct_set(converted_resources_total, mkey2, bignum_add_safe(variable_struct_get(converted_resources_total, mkey2), mitem2));
        }
    }
    if (get_upgrade_count(global.shops.blc.unlock_artifacts) > 0 && get_upgrade_attribute_value(global.upgrade_attributes.artifact_collect_offline) > 0 && get_default_struct_value(o_game.data.stats.prestige_run, "blc", 0) > 0)
    {
        if (!is_struct(struct_get_from_hash(result, variable_get_hash("artifacts"))))
        {
            result.artifacts = {};
        }
        __struct = global.artifacts;
        __prop_names = struct_get_names(__struct);
        __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            if (mitem.data.collected == 0)
            {
                continue;
            }
            if (!mitem.offline)
            {
                continue;
            }
            var count = mitem.get_offline_count(arg0);
            if (count > 0)
            {
                add_to_struct_value(result.artifacts, mitem.key, count);
            }
        }
    }
    if (!arg2 && global.game_settings.offline_rewards_prestige_resources)
    {
        var offline_prestige_per_minute = get_offline_prestige();
        var offline_prestige_pct = get_upgrade_attribute_value(global.upgrade_attributes.offline_prestige_pct);
        if (offline_prestige_per_minute > 0 && o_game.data.stats.prestige > 0)
        {
            var offline_prestige = floor(offline_prestige_per_minute * (arg0 / 60));
            add_to_struct_value(result.stats, "prestige", offline_prestige);
            if (offline_prestige_pct > 0 && !is_undefined(variable_struct_get(o_game.data.stats.prestige_resources_highest, global.resources.coins.key)))
            {
                var offline_prestige_coins = floor(o_game.data.stats.prestige_resources_highest.coins * offline_prestige_pct * offline_prestige);
                add_to_struct_value(result.resources, global.resources.coins.key, offline_prestige_coins);
            }
        }
        var offline_crunches_per_minute = get_offline_crunches();
        var offline_crunches_blc_pct = get_upgrade_attribute_value(global.upgrade_attributes.offline_crunches_blc_pct);
        if (offline_crunches_per_minute > 0 && o_game.data.stats.prestige_crunch > 0)
        {
            var offline_crunches = floor(offline_crunches_per_minute * (arg0 / 60));
            add_to_struct_value(result.stats, "prestige_crunch", offline_crunches);
            if (offline_crunches_blc_pct > 0 && !is_undefined(variable_struct_get(o_game.data.stats.prestige_resources_highest, global.resources.blc.key)))
            {
                var offline_crunches_blc = floor(o_game.data.stats.prestige_resources_highest.blc * offline_crunches_blc_pct * offline_crunches);
                add_to_struct_value(result.resources, global.resources.blc.key, offline_crunches_blc);
            }
        }
        var offline_mlc_per_minute = get_offline_mlc();
        var offline_crunches_mlc_pct = get_upgrade_attribute_value(global.upgrade_attributes.offline_mlc_pct);
        if (offline_mlc_per_minute > 0 && o_game.data.stats.prestige_mlc > 0)
        {
            var offline_mlc = floor(offline_mlc_per_minute * (arg0 / 60));
            add_to_struct_value(result.stats, "prestige_mlc", offline_mlc);
            if (offline_crunches_mlc_pct > 0 && !is_undefined(variable_struct_get(o_game.data.stats.prestige_resources_highest, global.resources.mlc.key)))
            {
                var offline_crunches_mlc = floor(o_game.data.stats.prestige_resources_highest.mlc * offline_crunches_mlc_pct * offline_mlc);
                add_to_struct_value(result.resources, global.resources.mlc.key, offline_crunches_mlc);
            }
        }
    }
    var offline_tower_floors = get_upgrade_attribute_value(global.upgrade_attributes.offline_tower_floors);
    if (offline_tower_floors > 0 && global.areas.tower.get_highest_floor_current_run() > 100 && get_default_struct_value(o_game.data.stats.prestige_run, "mlc", 0) > 0)
    {
        var tower_floors = floor(arg0 / 60) * offline_tower_floors;
        add_to_struct_value(result.misc, "tower_floors", tower_floors);
    }
    if (is_unlocked_death_book() && !arg4)
    {
        var enemies_killed = [];
        __array = global.enemies_bosses;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            var kills = mitem.get_reward_count(arg0);
            var loop_res = mitem.offline_step(arg0, false, arg3);
            add_struct_to_struct(result, loop_res);
            if (kills > 0)
            {
                array_push(enemies_killed, sprintf("%s: %sx", mitem.name, number_format(kills)));
                if (arg3)
                {
                    mitem.add_offline_kill(kills);
                }
            }
        }
        if (array_length(enemies_killed) > 0)
        {
            array_push(result.info, sprintf("[%s]", __("Offline enemies")) + "\n" + implode(", ", enemies_killed));
        }
    }
    var offline_alchemy_unlocked = get_upgrade_count(global.shops.gems.offline_alchemy) > 0;
    if (is_unlocked_alchemy() && !arg4 && offline_alchemy_unlocked && arg3 && get_option(global.options.alchemy_autobrew_enabled))
    {
        var brew_result = [];
        __struct = global.recipes;
        __prop_names = struct_get_names(__struct);
        __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            if (!mitem.data.autouse)
            {
                continue;
            }
            var brew_count = mitem.activate_offline(arg0);
            if (brew_count > 0)
            {
                array_push(brew_result, sprintf("%s: %s", mitem.name, brew_count));
            }
        }
        if (array_length(brew_result) > 0)
        {
            var brew_result_final = sprintf("[%s]%s%s", __("Offline alchemy"), "\n", implode(", ", brew_result));
            array_push(result.info, brew_result_final);
        }
    }
    if (global.areas.soul_forge.check() && get_default_struct_value(o_game.data.stats.areas_time, global.areas.soul_forge.key, 0) > 0 && !arg4 && arg3)
    {
        var soul_forge_result = soul_forge_inc(arg0, true);
        if (is_string(soul_forge_result))
        {
            array_push(result.info, soul_forge_result);
        }
    }
    if (is_unlocked_dice() && !arg4 && arg3 && !arg5)
    {
        o_game.data.dice.drop_timer -= sec(arg0);
        var dice_add_text = [];
        var cursed_high = o_game.data.dice.cursed_count_max_saved;
        var cursed_saved_total = o_game.data.dice.cursed_count_total_saved;
        var kill_count = 0;
        var roll_count = 0;
        if (has_bought_shop_item_safe(global.shops.gems.dice_battlefield_auto_roll))
        {
            var roll_delay = secr(get_dice_battlefield_roll_delay());
            roll_count = floor(divide_safe(arg0, roll_delay));
            roll_count = min(roll_count, 500);
            repeat (roll_count)
            {
                var kill = roll_dice_battlefield(false, true);
                if (kill)
                {
                    kill_count++;
                }
            }
            if (kill_count > 0)
            {
                array_push(dice_add_text, __s("Enemies defeated: %s", kill_count));
            }
        }
        if (has_bought_shop_item_safe(global.shops.gems.dice_cursed_auto_roll))
        {
            var cursed_count = 0;
            var cursed_saved = 0;
            var cursed_save_timeout = secr(get_dice_cursed_save_timeout_duration());
            var cursed_timeout = secr(get_dice_cursed_timeout());
            var seconds_per_roll = 10;
            roll_count = floor(arg0 / seconds_per_roll);
            roll_count = min(roll_count, 500);
            var roll_loop = roll_count;
            var rolled = 0;
            var auto_save_value_option = 0;
            var auto_save_value_option_start = auto_save_value_option;
            var has_auto_save = has_bought_shop_item_safe(global.shops.gems.dice_cursed_auto_save);
            if (has_auto_save)
            {
                auto_save_value_option = get_option(global.options.dice_cursed_auto_save_value);
                if (auto_save_value_option == 0)
                {
                    auto_save_value_option = o_game.data.dice.cursed_count_max_saved + 1;
                }
                else
                {
                    auto_save_value_option_start = auto_save_value_option;
                }
            }
            while (roll_loop > 0)
            {
                var value = roll_dice_cursed(true);
                rolled++;
                if (is_dice_cursed_value(value))
                {
                    cursed_count++;
                    roll_loop -= ceil(divide_safe(cursed_timeout, seconds_per_roll));
                }
                else if (o_game.data.dice.cursed_count_current > o_game.data.dice.cursed_count_max_saved || (has_auto_save && o_game.data.dice.cursed_count_current >= auto_save_value_option))
                {
                    cursed_saved += value;
                    save_dice_cursed(true);
                    roll_loop -= ceil(divide_safe(cursed_save_timeout, seconds_per_roll));
                    if (auto_save_value_option_start == 0)
                    {
                        auto_save_value_option = o_game.data.dice.cursed_count_max_saved + 1;
                    }
                }
                roll_loop--;
            }
            o_game.data.dice.cursed_reward = get_dice_cursed_save_reward();
            if (roll_count > 0)
            {
                array_push(dice_add_text, __s("%s rolled: %s", __("Cursed Dice"), rolled));
                array_push(dice_add_text, __s("%s curses: %s", __("Cursed Dice"), cursed_count));
                array_push(dice_add_text, __s("%s saved: %s", __("Cursed Dice"), cursed_saved));
            }
            if (o_game.data.dice.cursed_count_total_saved > cursed_saved_total)
            {
                array_push(dice_add_text, __s("Total saved: %s -> %s", cursed_saved_total, o_game.data.dice.cursed_count_total_saved));
            }
            if (o_game.data.dice.cursed_count_max_saved > cursed_high)
            {
                array_push(dice_add_text, __s("New Cursed dice high: %s -> %s", cursed_high, o_game.data.dice.cursed_count_max_saved));
            }
        }
        if (array_length(dice_add_text) > 0)
        {
            var text = concatstr(sprintf("[%s]", __s("Dice")), "\n", implode("\n", dice_add_text));
            array_push(result.info, text);
        }
    }
    if (is_unlocked_quarks() && !arg4 && arg3)
    {
        var quark_count = _sum(global.quarks_array, function(arg0)
        {
            return arg0.data.count;
        });
        var repeat_count = 1;
        var inc_count = get_cache("quark_reactor_inc_count", 0.01);
        var inc_value = arg0 * inc_count;
        add_quark_reactor_count(inc_value, false);
        var quark_count_after = _sum(global.quarks_array, function(arg0)
        {
            return arg0.data.count;
        });
        var quarks_added = quark_count_after - quark_count;
        var qs_text = [];
        if (is_unlocked_quarks_structure() && !arg5 && arg0 > 0)
        {
            var energy_add_value = get_quark_qs_value(arg0);
            if (energy_add_value > 0)
            {
                add_energy(global.resources.energy_quark, energy_add_value);
                array_push(qs_text, sprintf("%s: %s", global.resources.energy_quark.name, number_format(energy_add_value)));
            }
            if (has_bought_shop_item_safe(global.shops.gems.quark_auto_funnel) && get_option(global.options.quark_auto_funnel))
            {
                var funnel_count_time = floor(arg0 / secr(get_quark_funnel_timeout_duration()));
                if (funnel_count_time >= 1)
                {
                    var max_funnel_value = floor(global.resources.quark.data.count / quark_funnel_get_input_value());
                    var funnel_count_final = min(funnel_count_time, max_funnel_value);
                    if (funnel_count_final > 0)
                    {
                        quark_funnel(funnel_count_final);
                        array_push(qs_text, __s("Funnel: %s", number_format(funnel_count_final)));
                    }
                }
            }
            var structurize_threshold_value = 0;
            var structurize_threshold_value_option = get_option(global.options.quark_auto_structurize_value);
            if (structurize_threshold_value_option == "full")
            {
                structurize_threshold_value = get_max_energy_storage(global.resources.energy_quark);
            }
            else if (structurize_threshold_value_option == "asap")
            {
                structurize_threshold_value = 1;
            }
            else
            {
                structurize_threshold_value = get_max_energy_storage(global.resources.energy_quark) * structurize_threshold_value_option;
            }
            if (has_bought_shop_item_safe(global.shops.gems.quark_auto_structurize) && get_option(global.options.quark_auto_structurize) && quark_can_structurize() && global.resources.energy_quark.data.count >= structurize_threshold_value)
            {
                var qs_result_text = quark_structurize();
                array_push(qs_text, format_result_text(qs_result_text, ""));
            }
            if (has_bought_shop_item_safe(global.shops.gems.quark_auto_quantify) && get_option(global.options.quark_auto_quantify))
            {
                var quantify_count_time = floor(arg0 / secr(get_quantify_timeout_duration()));
                if (quantify_count_time >= 1)
                {
                    var max_quantify_value = floor(global.resources.quark_structure.data.count / quark_quantify_get_input_value());
                    var quantify_count_final = min(quantify_count_time, max_quantify_value);
                    if (quantify_count_final > 0)
                    {
                        quark_quantify(quantify_count_final);
                        array_push(qs_text, __s("Quantify: %s", number_format(quantify_count_final)));
                    }
                }
            }
        }
        var quark_offline_text = concatstr(sprintf("[%s]", __s("Quark Reactor")), "\n", __s("Reactor count: %s", number_format(inc_value, undefined, true)), ", ", __s("Quarks added: %s", number_format(quarks_added, undefined, true)));
        if (array_length(qs_text) > 0)
        {
            quark_offline_text += concatstr("\n\n", sprintf("[%s]", __s("Quark Structure")), "\n", implode(", ", qs_text));
        }
        array_push(result.info, quark_offline_text);
    }
    if (is_unlocked_banks() && !arg4 && !arg5 && arg3)
    {
        var bank_time = o_game.data.stats.time_elapsed;
        var bank_offline_count = min(120, floor(arg0 / 60));
        var cards_collect_count = 0;
        repeat (bank_offline_count)
        {
            __struct = global.banks;
            __prop_names = struct_get_names(__struct);
            __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                if (mitem.data.offline <= 0)
                {
                    continue;
                }
                var auto_deposit_timer_before = mitem.data.auto_deposit_timer;
                var bc_timer_before = mitem.data.bc_timer;
                cards_collect_count += mitem.check(bank_time, true);
                mitem.data.auto_deposit_timer = auto_deposit_timer_before;
                mitem.data.bc_timer = bc_timer_before;
            }
            bank_time += sec(60);
        }
        if (cards_collect_count > 0)
        {
            array_push(result.info, concatstr(sprintf("[%s]", __s("Banks")), "\n", __s("Cards collected: %s", number_format(cards_collect_count))));
        }
    }
    if (is_unlocked_mines() && !arg4 && !arg5 && arg3)
    {
        dec_timeout_data("mines_search_vein", sec(arg0));
        __array = o_game.data.mines.veins;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            mitem.timeout -= sec(arg0);
        }
        var caves_finished = 0;
        __array = global.mines;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            var progress_value = mitem.get_mine_progress_value();
            var __array2 = mitem.data.caves;
            var __prop_len2 = array_length(__array2);
            for (var __i2 = 0; __i2 < __prop_len2; __i2++)
            {
                var mitem2 = __array2[__i2];
                if (!mitem2.active)
                {
                    continue;
                }
                var was_finished = mitem2.progress < 1;
                mitem2.progress += progress_value * arg0;
                mitem2.progress = clamp(mitem2.progress, 0, 1);
                if (mitem2.progress >= 1 && !was_finished)
                {
                    caves_finished++;
                }
            }
            if (mitem.is_drilling())
            {
                mitem.drill(arg0);
            }
        }
        if (caves_finished > 0)
        {
            array_push(result.info, concatstr(sprintf("[%s]", __s("Mine Caves")), "\n", __s("%s caves finished.", number_format(caves_finished))));
        }
        if (has_bought_shop_item_safe(global.shops.mines.unlock_depth_drill))
        {
            var depth_before = o_game.data.mines.drill_depth;
            var fuel_drain = get_depth_drill_fuel_drain(1);
            var max_drill_time = global.resources.fuel.data.count / fuel_drain;
            var max_drill_time_final = min(arg0, max_drill_time);
            mines_drill_depth_step(max_drill_time_final);
            var depth_after = o_game.data.mines.drill_depth;
            var drilled = depth_after - depth_before;
            dec_timeout_data("drill_refuel", sec(arg0));
            if (drilled > 0)
            {
                array_push(result.info, concatstr(sprintf("[%s]", __s("Mine Drill")), "\n", __s("%sm drilled.", number_format(drilled))));
            }
        }
    }
    if (is_unlocked_harbor() && !arg4 && !arg5 && arg3)
    {
        __array = global.harbor.ships;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (mitem.data.status == UnknownEnum.Value_1)
            {
                mitem.data.time_end -= offline_frames;
            }
        }
        __array = global.harbor.jobs;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (mitem.data.started)
            {
                mitem.data.time_end -= offline_frames;
            }
        }
        var job_refresh_duration = get_harbor_jobs_timeout_duration();
        var time_diff = o_game.data.harbor.job_refresh_time_end - o_game.data.stats.time_elapsed;
        var total_offline_time = offline_frames - time_diff;
        if (total_offline_time >= 0)
        {
            var additional_refreshes = floor(total_offline_time / job_refresh_duration) + 1;
            var max_refreshes = get_max_harbor_refresh_count();
            if ((o_game.data.harbor.job_refresh_count + additional_refreshes) >= max_refreshes)
            {
                o_game.data.harbor.job_refresh_count = max_refreshes;
                o_game.data.harbor.job_refresh_time_end = o_game.data.stats.time_elapsed + job_refresh_duration;
            }
            else
            {
                o_game.data.harbor.job_refresh_count += additional_refreshes;
                var remaining_time = total_offline_time % job_refresh_duration;
                o_game.data.harbor.job_refresh_time_end = o_game.data.stats.time_elapsed + (job_refresh_duration - remaining_time);
            }
        }
        else
        {
            o_game.data.harbor.job_refresh_time_end -= offline_frames;
        }
    }
    if (is_unlocked_pets() && !arg4 && !arg5 && arg3)
    {
        var __dslist = global.active_pets;
        __prop_len = ds_list_size(__dslist);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            if (is_undefined(ds_list_find_value(__dslist, __i)))
            {
                continue;
            }
            var mitem = ds_list_find_value(__dslist, __i);
            if (is_undefined(mitem.offline_reward))
            {
                continue;
            }
            var reward = mitem.get_offline_reward(arg0);
            add_struct_to_struct(result, reward);
        }
    }
    if (!arg4 && arg3)
    {
        __struct = global.events;
        __prop_names = struct_get_names(__struct);
        __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            if (!is_event_active(mitem))
            {
                continue;
            }
            mitem.offline_step(arg0, arg5);
        }
    }
    var res_added_return = {};
    var converted_resources_total_return = {};
    __struct = res_added;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (mitem > 0)
        {
            variable_struct_set(res_added_return, mkey, mitem);
        }
    }
    __struct = converted_resources_total;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (mitem > 0)
        {
            variable_struct_set(converted_resources_total_return, mkey, mitem);
        }
    }
    return result;
}

function get_offline_seeds(arg0 = 1)
{
    var available_seeds = get_available_seeds();
    var offline_seed_count = get_upgrade_attribute_value(global.upgrade_attributes.offline_seeds);
    var seed_result = {};
    if (offline_seed_count > 0 && array_length(available_seeds) > 0)
    {
        var offline_seed_amount = floor((arg0 / 60) * offline_seed_count);
        if (offline_seed_amount > 100)
        {
            var seed_count_div = offline_seed_amount div array_length(available_seeds);
            var __array = available_seeds;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                var seed_loop_res = mitem.resource;
                var seed_res_value = get_seed_value(seed_loop_res, seed_count_div);
                add_to_struct_value(seed_result, seed_loop_res.key, seed_res_value);
            }
        }
        else
        {
            for (var i = 0; i < offline_seed_amount; i++)
            {
                var seed = array_random_item(available_seeds);
                var seed_res_value = get_seed_value(seed.resource, 1);
                add_to_struct_value(seed_result, seed.resource.key, seed_res_value);
            }
        }
    }
    return seed_result;
}

enum UnknownEnum
{
    Value_1 = 1
}
