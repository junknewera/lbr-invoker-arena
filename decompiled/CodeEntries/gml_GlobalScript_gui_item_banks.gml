function gui_item_banks(arg0, arg1)
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
    var button_x = 0;
    var button_y = 0;
    var content_x = arg0 + gui_col_x(5);
    var padding_y = global.is_mobile ? 2 : 1.5;
    var y_start = arg1;
    var selected_key = get_default_struct_value(struct_get_from_hash(global.selected_inventory_item, variable_get_hash("bank")), "key", "leaf_galaxy");
    var __array = global.banks_array;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        button_x = arg0;
        button_y = gui_y_start_items + (__i * gui_col_y(padding_y));
        var button_enabled = true;
        var button_text = mitem.galaxy.name;
        if (mitem.galaxy.is_obfuscated())
        {
            button_enabled = false;
            button_text = "?";
        }
        if (gui_button_tl(button_x, button_y, button_text, button_enabled, gui_col_x(4), undefined, 
        {
            selected: selected_key == mitem.key
        }))
        {
            global.selected_inventory_item.bank = mitem;
        }
    }
    var bx = content_x;
    var by = arg1;
    var bank = get_default_struct_value(global.selected_inventory_item, "bank", global.banks.leaf_galaxy);
    if (is_struct(bank))
    {
        by += draw_heading(bx, by, bank.name, undefined, undefined, undefined, undefined, false);
        if (bank.is_unlocked())
        {
            var boss_card_cost = bank.get_boss_card_cost();
            var has_rss_boost = bank.get_upgrade_value("rss_boost") > 0;
            draw_description(bx, by, __("Current Amount"));
            bank.draw_current_amount(bx, by + gui_col_y(1));
            draw_description(bx + gui_col_x(5), by, __("Deposited"));
            draw_result(bx + gui_col_x(5), by + gui_col_y(1), bank.current_amount, undefined, 
            {
                suffix_resource_text: "/" + number_format(bank.get_storage_size()),
                insufficient_indicator: true,
                insufficient_indicator_base_value: bank.get_current_amount_value(),
                insufficient_indicator_check_value: boss_card_cost
            });
            draw_description(bx + gui_col_x(10), by, __("Boss Card Cost"));
            bank.draw_boss_card_cost(bx + gui_col_x(10), by + gui_col_y(1));
            if (has_rss_boost)
            {
                draw_description(bx + gui_col_x(15), by, __("Deposited"));
                draw_result(bx + gui_col_x(15), by + gui_col_y(1), bank.current_amount_rss, undefined, 
                {
                    suffix_resource_text: "/" + number_format(bank.get_storage_size_rss())
                });
            }
            var max_deposit_count = bank.get_max_deposit_count();
            var max_deposit_count_rss = bank.get_max_deposit_count_rss();
            var deposit_count = boss_card_cost;
            var deposit_count_value = bank.has_resource ? bank.resource.data.count : bank.material.data.count;
            var deposit_count_10 = _clamp(floor(deposit_count_value * 0.1), 1, max_deposit_count);
            var deposit_count_50 = _clamp(floor(deposit_count_value * 0.5), 1, max_deposit_count);
            var deposit_count_100 = _clamp(floor(deposit_count_value * 1), 1, max_deposit_count);
            var deposit_count_all = _clamp(floor(deposit_count_value), 1, max_deposit_count);
            var deposit_button_y = by + gui_col_y(2.5);
            if (gui_button_tl(bx, deposit_button_y, __s("Deposit %s", number_format(deposit_count)), bank.can_deposit(deposit_count), gui_col_x(3.5)))
            {
                bank.deposit(deposit_count);
            }
            if (gui_button_tl(bx + gui_col_x(4.5), deposit_button_y, __s("Deposit all (%s)", number_format(deposit_count_all)), bank.can_deposit(deposit_count_all), gui_col_x(3.5)))
            {
                bank.deposit(deposit_count_all);
            }
            if (has_rss_boost)
            {
                var deposit_rss_base_value = bank.get_boost_cost_value();
                var deposit_rss = _clamp(deposit_rss_base_value * get_key_modifier(), 100, max_deposit_count_rss);
                if (gui_button_tl(bx + gui_col_x(14.5), deposit_button_y, __s("Deposit %s", number_format(deposit_rss)), bank.can_deposit_rss(deposit_rss), gui_col_x(3.5)))
                {
                    bank.deposit_rss(deposit_rss);
                }
            }
            by += gui_col_y(5);
            var ux = bx + gui_col_x(8);
            var uy = by;
            if (has_rss_boost)
            {
                by += gui_col_y(0.5);
                var boost_cost_value = bank.get_boost_cost_value();
                var boost_level_text = bank.data.rss_boost_level;
                if (gui_button_toggle(bx + gui_col_x(0.3), by, bank.data.rss_boost_active, undefined, 
                {
                    text: __("Boost enabled")
                }))
                {
                    bank.data.rss_boost_active = !bank.data.rss_boost_active;
                }
                by += gui_col_y(1.25);
                by += draw_description(bx, by, __s("Boss card drop multiplier: %s", number_format_percent(bank.get_boss_card_drop_multiplier())));
                by += draw_result(bx + gui_col_x(0.1), by, bank.current_amount_rss, undefined, 
                {
                    suffix_resource_text: "/" + number_format(boost_cost_value),
                    insufficient_indicator: true,
                    insufficient_indicator_base_value: bank.get_current_amount_value_rss(),
                    insufficient_indicator_check_value: boost_cost_value
                });
                by += gui_col_y(0.5);
                by += draw_value_change_buttons(bx, by, __s("Boost level %s", string(boost_level_text)), bank.data.rss_boost_level, bank.change_rss_boost_level);
            }
            var bc_text = bank.data.bc_enabled ? format_time(secr(bank.data.bc_timer - o_game.data.stats.time_elapsed), false, true) : __("Disabled");
            var bc_duration_text = format_time(secr(bank.get_boss_card_timer_duration()), false, true);
            by += draw_description(bx, by, __s("Next boss card: %s", bc_text) + sprintf(" (%s)", bc_duration_text));
            var deposit_duration_text = format_time(secr(bank.get_auto_deposit_duration()), false, true);
            if (bank.data.auto_deposit > 0)
            {
                by += draw_description(bx, by, __s("Next deposit: %s", format_time(secr(bank.data.auto_deposit_timer - o_game.data.stats.time_elapsed), false, true) + sprintf(" (%s)", deposit_duration_text)));
            }
            var available_bosses = pluck_implode(bank.get_available_bosses(), "get_name_spoiler", undefined, undefined, undefined, "-");
            var bc_rarity_value = bank.get_boss_card_rarity_multiplier();
            var bc_rarity_value_adder = bank.get_boss_card_rarity_adder();
            var text_rarity = [];
            var __array2 = global.cards_types_rarity;
            var __prop_len2 = array_length(__array2);
            var __i2 = __prop_len2 - 1;
            while (__i2 >= 0)
            {
                var mitem2 = __array2[__i2];
                var chance_text = number_format(min(100, (mitem2.spawn_chance * (1 + bc_rarity_value)) + bc_rarity_value_adder)) + "%";
                array_push(text_rarity, sprintf("%s: %s", mitem2.name, chance_text));
                __i2--;
            }
            var text = implode("\n", [__("Last cards collected") + ": ", implode("\n", bank.last_cards_collected, true, undefined, "-"), "", __("Card rarity drop chance") + ": ", implode("\n", text_rarity), "", __("Available bosses") + ": ", available_bosses]);
            by += draw_description(bx, by, text, gui_col_x(7));
            by += gui_col_y(1);
            uy += draw_upgrades_buyable(ux, uy + gui_col_y(0.4), bank, gui_col_x(11), 
            {
                add_upgrade_description: false
            });
            arg1 = max(by, uy);
        }
        else
        {
            var cost = bank.get_unlock_cost();
            var can_unlock = has_enough(cost);
            if (gui_button_tl(bx, by, __("Unlock"), can_unlock, gui_col_x(3), undefined, 
            {
                result_mini: cost
            }))
            {
                bank.unlock();
            }
        }
    }
    return arg1 - y_start;
}

function gui_item_banks_add_draw()
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
    draw_resources_current_amount_lite_array(add_text_base_x + gui_col_x(15), add_text_base_y, [global.resources.soul_particles], false);
    draw_materials_current_amount_lite(add_text_base_x + gui_col_x(18), add_text_base_y, [global.materials.raw_soul_stone, global.materials.refined_soul_stone], false);
}
