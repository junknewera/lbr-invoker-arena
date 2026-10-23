function gui_item_prestige(arg0, arg1, arg2 = undefined)
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
    if (!is_struct(arg2) || !is_struct(struct_get_from_hash(arg2, variable_get_hash("props"))))
    {
        exit;
    }
    var prestige = arg2.props.prestige;
    if (prestige.level == global.prestige_levels.ulc.level)
    {
        return gui_item_prestige_ulc(arg0, arg1);
    }
    var button_text = "";
    if (prestige == global.prestige_levels.prestige)
    {
        button_text = __("Prestige");
        arg1 += draw_description(arg0, arg1, __("Enter the Leaf Portal to restart your blowing adventure with some coins. 20+ coins recommended at first prestige."));
        if (get_upgrade_count(global.shops.blc.auto_buy_all_coin_upgrades) > 0 && global.shops.blc.auto_buy_all_coin_upgrades.data.toggle)
        {
            arg1 += draw_description(arg0, arg1, __("ATTENTION: Coin Upgrade Bot is active! Your coins might be spent immediately after prestige."));
        }
    }
    else if (prestige == global.prestige_levels.blc)
    {
        button_text = __("Crunch");
        arg1 += draw_description(arg0, arg1, __("Restart your leaf blowing adventure with valuable BLC Coins. All upgrades will be reset with some exceptions (shops marked with ** will persist)."));
    }
    else if (prestige == global.prestige_levels.mlc)
    {
        button_text = __("Mega Crunch");
        arg1 += draw_description(arg0, arg1, __("Restart your leaf blowing adventure with valuable MLC Coins. All upgrades will be reset with some exceptions (shops marked with *** will persist). The amount of MLC coins is based on your highest tower floor as well as your current amount of BLC coins."));
    }
    arg1 += gui_col_y(1);
    if (gui_button(arg0 + (global.gui_settings.content_width / 2), gui_y_start_items + gui_col_y(6), button_text, undefined, gui_col_x(5)) || keyboard_check(vk_space))
    {
        if (prestige == global.prestige_levels.prestige)
        {
            prestige_exec(prestige.level);
        }
        else if (prestige == global.prestige_levels.blc)
        {
            confirm_dialog("Do you want to enter the Big Leaf Crunch Portal now?", function()
            {
                prestige_exec(global.prestige_levels.blc.level);
            });
        }
        else if (prestige == global.prestige_levels.mlc)
        {
            confirm_dialog(__("Do you want to enter the Mega Leaf Crunch Portal now?"), function()
            {
                prestige_exec(global.prestige_levels.mlc.level);
            });
        }
    }
    arg1 += draw_heading(arg0, arg1, __("Reward"), undefined, undefined, undefined, undefined, false);
    var res = get_prestige_resources(false, prestige.level);
    arg1 += draw_resources(arg0, arg1, res);
    if (is_unlocked_ulc())
    {
        arg1 += gui_col_y(2);
    }
}

function gui_item_prestige_ulc(arg0, arg1)
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
    var y_start = arg1;
    var prestige = global.prestige_levels.ulc;
    var min_wow_defeat_count = get_min_ulc_wow_defeat_count();
    var min_sacrifices = get_min_ulc_sacrifices();
    var sacrifices_count = 0;
    var row_x1 = arg0;
    var row_y1 = y_start;
    row_y1 += draw_heading_description(row_x1, row_y1, __("Sacrifices"), __("Choose what you would like to sacrifice."), gui_col_x(8));
    row_y1 += draw_options_toggle(row_x1, row_y1, global.ulc_options, o_game.data.ulc_settings, gui_col_x(8), false);
    var row_x2 = arg0 + gui_col_x(10);
    var row_y2 = gui_y_start_items;
    row_y2 += draw_heading(row_x2, row_y2, __("Reward"), undefined, undefined, undefined, undefined, false);
    var res = get_prestige_resources(false, prestige.level);
    var res_multiplier = get_prestige_multiplier(prestige.level);
    row_y2 += draw_resources(row_x2, row_y2, res);
    row_y2 += gui_col_y(0.5);
    var base_points = get_bm_value(global.prestige_levels.ulc.base_points, "ulc_value_adder");
    var points_list_text = [__s("Base: %s", number_format(base_points, undefined, true))];
    var points = base_points;
    var __array = global.ulc_options;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (get_default_struct_value(o_game.data.ulc_settings, mitem.key, false))
        {
            var points_item = mitem._get_points();
            points += points_item;
            array_push(points_list_text, sprintf("%s: %s", mitem.name, number_format(points_item, undefined, true)));
            sacrifices_count++;
        }
    }
    var multiplier_points = get_bm_value(points, undefined, "ulc_value_multiplier", undefined, true);
    var multiplier_points_final = multiplier_points - points;
    array_push(points_list_text, __s("Multiplier: %s", number_format(multiplier_points_final, undefined, true)));
    var sacrifice_multiplier_points = multiplier_points * res_multiplier;
    var multiplier_text = __s("Sacrifice multiplier: %s (%s)", number_format_percent(res_multiplier, 0), sprintf("+%s", number_format(floor(sacrifice_multiplier_points))));
    if (global.shops.gems.prestige_ulc_multiplier.data.count > 0)
    {
        multiplier_text += ("\n" + __s("%s multiplier: %s", __("Gems shop"), number_format_percent(global.shops.gems.prestige_ulc_multiplier.upgrade_attributes.ulc_gems_upgrade, 0, true)));
    }
    row_y2 += draw_description(row_x2, row_y2, multiplier_text, gui_col_x(5));
    draw_description(row_x2, row_y2, points_list_text);
    row_y2 += gui_col_y(2);
    var can_exec_ulc = can_ulc();
    var row_x3 = arg0 + gui_col_x(16);
    var row_y3 = gui_y_start_items;
    gui_draw_sprite(row_x3 + gui_col_x(3.5), row_y3 + gui_col_y(1.5), spr_icon_portal_ulc, undefined, 7);
    row_y3 += gui_col_y(4.25);
    if (gui_button_tl(row_x3 + gui_col_x(1), row_y3, __("ULTRA LEAF CRUNCH"), can_exec_ulc, gui_col_x(5)))
    {
        prestige_exec(prestige.level);
    }
    row_y3 += gui_col_y(2);
    var reset_text = concat_list(__("Artifacts"), __("Bank deposits"), __("Chests"), __("Printers"), __("Resources"), __("Scrolls"), __("Soul Forge"));
    var ulc_text = concatstr_nl(__s("Defeated %s: %s/%s", global.enemies.boss_weaver_of_worlds.name, number_format(global.enemies.boss_weaver_of_worlds.get_current_defeat_counter()), min_wow_defeat_count), __s("Required sacrifices: %s/%s", sacrifices_count, min_sacrifices), "", __s("The following will be reset: %s", "\n" + reset_text), "- " + __s("Selected sacrifices"), "", __s("All chests will be opened automatically before %s.", __("ULC")));
    draw_description(row_x3, row_y3, ulc_text, gui_col_x(7));
    return max(row_y1, row_y2, row_y3) - y_start;
}

function gui_item_prestige_ulc_add_draw()
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
    if (gui_button_tl(add_button_base_x_tl, add_button_base_y, __("Select all"), undefined, gui_col_x(3)))
    {
        var __array = global.ulc_options;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            variable_struct_set(o_game.data.ulc_settings, mitem.key, true);
        }
    }
    if (gui_button_tl(add_button_base_x_tl + gui_col_x(4), add_button_base_y, __("Select none"), undefined, gui_col_x(3)))
    {
        var __array = global.ulc_options;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            variable_struct_set(o_game.data.ulc_settings, mitem.key, false);
        }
    }
}
