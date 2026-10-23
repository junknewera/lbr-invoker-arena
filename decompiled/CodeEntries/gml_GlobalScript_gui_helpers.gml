function check_input_refresh_surface()
{
    if (mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_right) || mouse_check_button_released(mb_left) || mouse_check_button_released(mb_right) || mouse_check_button_pressed(mb_middle) || mouse_check_button_released(mb_middle) || mouse_wheel_up() || mouse_wheel_down())
    {
        refresh_surface = true;
    }
}

function destroy_gui_instances()
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
    with (o_gui_instance)
    {
        if (variable_instance_exists(id, "is_dialog_button") && !is_dialog_button)
        {
            instance_destroy();
        }
    }
    instance_destroy(o_gui_editor);
    instance_destroy(o_gui_editor_instance);
    instance_destroy(o_tooltip);
}

function get_gui_input_value(arg0)
{
    var value = false;
    with (o_gui_instance)
    {
        if (label_id == arg0)
        {
            if (type == UnknownEnum.Value_27)
            {
                value = input;
            }
            else if (type == UnknownEnum.Value_10)
            {
                value = checked;
            }
        }
    }
    return value;
}

function get_gui_instance(arg0)
{
    with (o_gui_instance)
    {
        if (label_id == arg0)
        {
            return id;
        }
    }
    return undefined;
}

function get_scroll_height(arg0, arg1, arg2)
{
    return max(0, arg0 - arg1) * arg2;
}

function get_scroll_step(arg0 = scroll_steps)
{
    if (keyboard_check(vk_shift))
    {
        arg0 = items_display;
    }
    else if (keyboard_check(vk_control))
    {
        arg0 = 99999999;
    }
    if (keyboard_check(vk_down) || keyboard_check(vk_up))
    {
        arg0 *= 0.1;
    }
    return arg0;
}

function gui_back_button(arg0, arg1 = false)
{
    var item = arg1 ? UnknownEnum.Value_6 : UnknownEnum.Value_5;
    return new Gui_Item(item, -1, 
    {
        button_text: __("Back"),
        func: [open_dialog, arg0]
    });
}

function gui_draw_buy_debug(arg0, arg1 = gui_x, arg2 = gui_y)
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
    if (!global.debug || !keyboard_check(vk_control))
    {
        exit;
    }
    try
    {
        if (gui_button(arg1, arg2, "=0", true, 80))
        {
            arg0.data.count = 0;
        }
        if (gui_button(arg1 + 80, arg2, "+1", true, 80))
        {
            arg0.data.count += 1;
            if (is_callable(struct_get_from_hash(arg0, variable_get_hash("func"))))
            {
                arg0.func();
            }
        }
        if (gui_button(arg1 + 160, arg2, "+10", true, 80))
        {
            arg0.data.count += 10;
            if (is_callable(struct_get_from_hash(arg0, variable_get_hash("func"))))
            {
                arg0.func();
            }
        }
        if (gui_button(arg1 + 240, arg2, "+100", true, 80))
        {
            arg0.data.count += 100;
            if (is_callable(struct_get_from_hash(arg0, variable_get_hash("func"))))
            {
                arg0.func();
            }
        }
        if (gui_button(arg1 + 320, arg2, "Max", true, 80))
        {
            arg0.data.count = get_shop_item_max_count(arg0);
            if (is_callable(struct_get_from_hash(arg0, variable_get_hash("func"))))
            {
                arg0.func();
            }
        }
        if (gui_button(arg1 + 420, arg2, "=LVL1", true, 80))
        {
            arg0.data.level = 1;
            if (is_struct(struct_get_from_hash(arg0, variable_get_hash("item"))))
            {
                arg0.item.data.level = 1;
            }
        }
        if (gui_button(arg1 + 500, arg2, "+LVL1", true, 80))
        {
            arg0.data.level++;
            if (is_struct(struct_get_from_hash(arg0, variable_get_hash("item"))))
            {
                arg0.item.data.level++;
            }
        }
        if (gui_button(arg1 + 580, arg2, "-LVL1", true, 80))
        {
            arg0.data.level--;
            if (is_struct(struct_get_from_hash(arg0, variable_get_hash("item"))))
            {
                arg0.item.data.level--;
            }
        }
        if (gui_button(arg1 + 660, arg2, "+LVL10", true, 80))
        {
            arg0.data.level += 10;
            if (is_struct(struct_get_from_hash(arg0, variable_get_hash("item"))))
            {
                arg0.item.data.level += 10;
            }
        }
        if (gui_button(arg1 + 740, arg2, "=MAX", true, 80))
        {
            arg0.data.level = arg0.max_upgrade_level;
            if (is_struct(struct_get_from_hash(arg0, variable_get_hash("item"))))
            {
                arg0.item.data.level = arg0.item.max_upgrade_level;
            }
        }
        if (gui_button(arg1 + 820, arg2, "C", true, 40))
        {
            var cost = get_item_cost(arg0, iif(arg0.max_count == 0, 100, arg0.max_count), 0, true);
            log("item cost", arg0.name);
            var __struct = cost;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                log(number_format(mitem));
            }
        }
        if (gui_button(arg1 + 50, arg2 + gui_col_y(1.25), "Unclaimed all", true))
        {
            arg0.data.claimed_os = {};
            arg0.data.count = 0;
            variable_struct_set(o_game.data.dlc_claimed, arg0.key, false);
        }
        if (gui_button(arg1 + 200, arg2 + gui_col_y(1.25), "Unclaimed OS", true))
        {
            variable_struct_set(arg0.data.claimed_os, 0, undefined);
            arg0.data.count = 0;
        }
        if (gui_button(arg1 + 350, arg2 + gui_col_y(1.25), "Claimed all", true))
        {
            variable_struct_set(arg0.data.claimed_os, 0, true);
            variable_struct_set(arg0.data.claimed_os, 4, true);
            variable_struct_set(arg0.data.claimed_os, 3, true);
        }
        if (gui_button(arg1 + 500, arg2 + gui_col_y(1.25), "Claimed OS", true))
        {
            variable_struct_set(arg0.data.claimed_os, 0, true);
        }
        if (gui_button(arg1 + 700, arg2 + gui_col_y(1.25), "-1", true))
        {
            arg0.data.count -= 1;
            if (is_callable(struct_get_from_hash(arg0, variable_get_hash("func"))))
            {
                arg0.func();
            }
        }
    }
    catch (err)
    {
        log(err);
    }
}

function gui_draw_buy_max(arg0, arg1, arg2)
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
    if (!is_array(arg2))
    {
        return log("shop isn't an array.");
    }
    if (arg2 == global.shops_sorted.gems)
    {
        exit;
    }
    if (gui_button_tl(arg0, arg1, __("Buy max"), true, gui_col_x(3)))
    {
        global.selected_inventory_item.buy_shop_max = arg2;
        if (get_option(global.options.confirm_buy_max_shop_items) && !keyboard_check(vk_shift))
        {
            confirm_dialog_current_nav(__("Do you want to buy all items?"), buy_shop_max);
        }
        else
        {
            buy_shop_max(arg2);
        }
    }
}

function gui_draw_buy_upgrades(arg0, arg1, arg2, arg3 = true)
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
    if (get_upgrade_count(global.shops.blc.unlock_materials) == 0 || is_undefined(struct_get_from_hash(arg2, variable_get_hash("is_upgrade_unlocked"))))
    {
        return 0;
    }
    var bx = arg0;
    var by = arg1;
    if (arg3)
    {
        bx = arg0 + gui_col_x(21);
    }
    var draw_materials_options = 
    {
        mini: true,
        show_tooltip: true
    };
    if (!arg2.is_upgrade_unlocked())
    {
        if (arg2.is_upgrade_unlock_visible())
        {
            if (gui_button(bx, arg1 + gui_col_y(0.5), __("Unlock"), arg2._can_unlock_upgrade(), gui_col_x(2), undefined, 
            {
                materials_mini: arg2.get_unlock_upgrade_cost()
            }))
            {
                arg2.unlock_upgrade();
                refresh_ua_section("shops");
            }
        }
    }
    else
    {
        if (get_value_ext(arg2, arg2.is_upgradable))
        {
            var count = get_key_modifier_item(arg2, true, undefined, undefined, undefined, true);
            var upgrade_text = __("Upgrade");
            if (count > 1)
            {
                upgrade_text += sprintf(" %s", count);
            }
            if (gui_button(bx, arg1 + gui_col_y(0.5), upgrade_text, arg2.can_upgrade(count), gui_col_x(2.25), undefined, 
            {
                materials_mini: arg2.get_upgrade_cost(count)
            }))
            {
                arg2.upgrade(count);
                refresh_ua_section("shops");
            }
        }
        var upgrade_description = arg2.get_upgrade_description("\n");
        gui_button_sprite(bx + gui_col_x(2), arg1 + gui_col_y(0.5), spr_icon_help, true, false, 
        {
            tooltip: upgrade_description
        });
    }
    gui_draw_buy_debug(arg2);
    return gui_col_y(3);
}

function gui_draw_shop_items(arg0, arg1, arg2, arg3 = false)
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
    var y_height = 0;
    var __array = arg2;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (arg3 && !mitem.item.data.fav)
        {
            continue;
        }
        var y_item_height = gui_item_shop_item(arg0, arg1 + y_height, mitem);
        if (!is_numeric(y_item_height))
        {
            y_item_height = 0;
        }
        y_height += (y_item_height + global.gui_items_default_height);
    }
    return y_height;
}

function gui_inline_button(arg0 = "Button", arg1 = __void, arg2 = undefined)
{
    var btn = new Gui_Item(UnknownEnum.Value_6, -1, 
    {
        button_text: arg0,
        func: arg1,
        section: get_default_struct_value(arg2, "section", undefined)
    });
    return btn;
}

function gui_inline_button_sprite(arg0 = spr_solid, arg1 = __void, arg2 = undefined)
{
    var btn = new Gui_Item(UnknownEnum.Value_6, -1, 
    {
        button_text: "",
        func: arg1,
        section: get_default_struct_value(arg2, "section", undefined)
    }, gui_button_sprite);
    return btn;
}

function gui_inline_text(arg0 = "", arg1 = undefined)
{
    var item = new Gui_Item(UnknownEnum.Value_54, -1, 
    {
        text: arg0
    });
    apply_struct_to_struct(item, arg1);
    return item;
}

function hide_gui_instances(arg0)
{
    with (o_gui_instance)
    {
        visible = arg0;
    }
}

function mouse_in_gui_content_range()
{
    if (!instance_exists(o_dialog))
    {
        return false;
    }
    return mouse_in_gui_range(o_dialog.gui_x_start, o_dialog.gui_y_start_items, o_dialog.gui_x_start + o_dialog.gui_width, o_dialog.gui_y_start_items + o_dialog.gui_content_height);
}

function mouse_in_gui_dialog_range()
{
    if (!instance_exists(o_dialog))
    {
        return false;
    }
    return mouse_in_gui_range(o_dialog.gui_x_start - gui_col_x(0.5), o_dialog.gui_y_start - gui_col_y(1.2), o_dialog.gui_x_start + o_dialog.gui_width + gui_col_x(0.5), o_dialog.gui_y_start + o_dialog.gui_height + gui_col_y(1.35));
}

function set_gui_input_value(arg0, arg1)
{
    var i = get_gui_instance(arg0);
    if (is_undefined(i))
    {
        exit;
    }
    i.input = arg1;
    with (i)
    {
        change();
    }
}

function set_gui_size(arg0 = 1920, arg1 = 1080)
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
    var display_width = display_get_width();
    var display_height = display_get_height();
    var window_width = clamp(1920, 1920, display_width);
    var window_height = clamp(1080, 1080, display_height);
    var perfect_ratio = 1.7777777777777777;
    var aa = false;
    global.gui_width = arg0;
    global.gui_height = floor(arg0 / perfect_ratio);
    global.display_width = display_width;
    global.display_height = display_width;
    if (global.is_mobile)
    {
    }
    global.gui_ratio = global.gui_width / global.gui_height;
    global.gui_ratio_inv = global.gui_height / global.gui_width;
    var col_size = 32;
    global.gui_settings = 
    {
        button_bg_sprite: spr_textbox_9s,
        button_bg_sprite_alt: spr_textbox_9s,
        col_size: col_size,
        col_x: arg0 / col_size,
        col_y: arg1 / col_size,
        width: arg0,
        height: arg1,
        dialog_width_col: 24,
        dialog_height_col: iif(global.is_mobile, 26, 22)
    };
    global.gui_settings.dialog_width = gui_col_x(global.gui_settings.dialog_width_col);
    global.gui_settings.dialog_height = gui_col_y(global.gui_settings.dialog_height_col);
    global.gui_settings.content_width = global.gui_settings.dialog_width - gui_col_x(1);
    global.gui_settings.content_height = global.gui_settings.dialog_height - gui_col_y(1);
    global.gui_button_height = global.is_mobile ? 40 : 24;
    global.gui_button_mobile_padding_y = global.is_mobile ? gui_col_y(1) : 0;
    global.gui_item_bot_control_panel_selection = "resources";
    global.gui_items_count_shop = 7;
    global.gui_items_default_height = 56;
    global.gui_items_margin = global.is_mobile ? 56 : 32;
    global.gui_items_padding = 16;
    global.gui_resources_inline_padding = global.is_mobile ? 34 : 28;
    global.gui_sprite_scale = global.is_mobile ? 3 : 2;
    var text_line_height_base = global.is_mobile ? 24 : 16;
    global.gui_text_line_height = ceil(text_line_height_base + ((global.font_size - 20) * 1.5));
    if (variable_global_exists("options"))
    {
        global.gui_text_line_height += get_default_struct_value(global.fonts_line_height, get_option(global.options.alternative_font), 0);
        aa = get_option(global.options.enable_aa);
    }
    global.ui_gaps = 
    {
        xs: gui_col_y(0.5),
        sm: gui_col_y(1),
        md: gui_col_y(1.5),
        lg: gui_col_y(2),
        xl: gui_col_y(2.5),
        xxl: gui_col_y(3),
        button_y: gui_col_y(2),
        button_y_lg: gui_col_y(2.5)
    };
    if (global.is_mobile)
    {
        global.ui_gaps = 
        {
            xs: gui_col_y(1),
            sm: gui_col_y(1.25),
            md: gui_col_y(1.75),
            lg: gui_col_y(2.25),
            xl: gui_col_y(2.75),
            xxl: gui_col_y(3.25),
            button_y: gui_col_y(3),
            button_y_lg: gui_col_y(3.5)
        };
    }
    gpu_set_tex_filter(aa);
    display_set_gui_size(global.gui_width, global.gui_height);
    if (global.is_opera)
    {
        window_set_size(global.gui_width, global.gui_height);
    }
}

enum UnknownEnum
{
    Value_5 = 5,
    Value_6,
    Value_10 = 10,
    Value_27 = 27,
    Value_54 = 54
}
