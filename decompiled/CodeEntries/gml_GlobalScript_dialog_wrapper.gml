function actions_dialog(arg0, arg1 = undefined, arg2 = 6, arg3 = undefined, arg4 = undefined, arg5 = undefined)
{
    if (!gui_can_open_dialog(arg3))
    {
        exit;
    }
    var current_section_key = get_current_dialog_section_key();
    dialog_click_delay();
    destroy_dialog();
    var o = instance_create_layer(0, 0, global.layers.gui_dialog, o_dialog_actions);
    o.actions = arg0;
    if (is_string(arg4))
    {
        o.dialog_id = arg4;
    }
    if (is_struct(arg1))
    {
        o.titles = arg1;
    }
    if (is_numeric(arg2))
    {
        o.items_display = arg2;
    }
    apply_struct_to_instance(arg3, o);
    if (is_struct(arg3) && !is_undefined(struct_get_from_hash(arg3, variable_get_hash("check_dialog_help_button"))))
    {
        o.check_dialog_help_button = arg3.check_dialog_help_button;
    }
    var sections_key = arg4;
    if (is_struct(arg3) && is_string(struct_get_from_hash(arg3, variable_get_hash("sections_key"))))
    {
        sections_key = arg3.sections_key;
    }
    if (is_string(sections_key))
    {
        var sections = variable_struct_get(global.dialog_sections, sections_key);
        if (is_struct(sections))
        {
            o.sections = sections;
            o.sections_sorted = variable_struct_get(global.dialog_sections_array, sections_key);
            var start_section = undefined;
            var __array = o.sections_sorted;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                if (mitem.selected)
                {
                    start_section = mitem;
                    break;
                }
                if (!get_default_struct_value(mitem, "start", false))
                {
                    continue;
                }
                start_section = mitem;
            }
            if (is_undefined(start_section))
            {
                start_section = o.sections_sorted[0];
            }
            if (is_string(arg5) && is_struct(variable_struct_get(sections, arg5)))
            {
                start_section = variable_struct_get(sections, arg5);
            }
            o.start_section = start_section;
        }
    }
    array_push(global.dialog_history, 
    {
        dialog_id: o.dialog_id,
        selected_sections_key: current_section_key
    });
    limit_log(global.dialog_history, 10);
    if (is_struct(arg3) && is_callable(struct_get_from_hash(arg3, variable_get_hash("on_open"))))
    {
        arg3.on_open();
    }
    with (o)
    {
        init();
        visible = true;
    }
    if (instance_exists(o_shop))
    {
        o_shop.current_nav_key = "__other";
        o_shop.current_nav_item = undefined;
    }
    return o;
}

function actions_dialog_simple(arg0, arg1 = undefined, arg2 = undefined, arg3 = undefined, arg4 = undefined, arg5 = false)
{
    var actions = [new Gui_Item(UnknownEnum.Value_18, undefined, 
    {
        func: arg0,
        props: arg2
    })];
    if (!is_undefined(arg3))
    {
        if (!is_struct(arg2))
        {
            arg2 = {};
        }
        set_struct_value(arg2, "sections_key", arg3);
        set_struct_value(arg2, "selected_sections_key", arg4);
    }
    if (arg5)
    {
        var parent_nav = get_default_struct_value(arg2, "parent_nav", undefined);
        if (is_undefined(parent_nav) && instance_exists(o_shop))
        {
            parent_nav = o_shop.current_nav_key;
        }
        if (!is_struct(arg2))
        {
            arg2 = {};
        }
        arg2.parent_nav = parent_nav;
    }
    return actions_dialog(actions, arg1, undefined, arg2, arg3, arg4);
}

function confirm_dialog(arg0, arg1, arg2 = undefined, arg3 = undefined, arg4 = undefined, arg5 = __void)
{
    if (keyboard_check(vk_shift) && !get_default_struct_value(arg4, "force_confirm", false))
    {
        var _shift_call_target = get_default_struct_value(arg4, "shift_call_target", {});
        call_method(_shift_call_target, arg1, arg2);
        if (!is_undefined(arg3))
        {
            call_method(_shift_call_target, arg3, arg2);
        }
        exit;
    }
    if (instance_exists(o_dialog))
    {
        with (o_dialog)
        {
            destroy();
        }
    }
    delay("confirm_dialog_create", 1, function(arg0)
    {
        var o = instance_create_layer(0, 0, global.layers.gui_dialog, o_dialog_confirm);
        o.text = arg0.text;
        o.func_confirm = arg0.func;
        o.func_cancel = arg0.func_cancel;
        o.btn_args = arg0.btn_args;
        if (!is_undefined(arg0.func_after))
        {
            o.func_confirm_after = arg0.func_after;
        }
        apply_struct_to_instance(arg0.props, o);
        with (o)
        {
            init();
        }
    }, 
    {
        btn_args: arg2,
        func_after: arg3,
        func: arg1,
        func_cancel: arg5,
        props: arg4,
        text: arg0
    });
}

function confirm_dialog_current_nav(arg0, arg1, arg2 = undefined, arg3 = undefined, arg4 = undefined, arg5 = __void)
{
    var parent_nav = get_default_struct_value(arg4, "parent_nav", undefined);
    if (is_undefined(parent_nav) && instance_exists(o_shop))
    {
        parent_nav = o_shop.current_nav_key;
    }
    if (!is_struct(arg4))
    {
        arg4 = {};
    }
    arg4.parent_nav = parent_nav;
    confirm_dialog(arg0, arg1, arg2, arg3, arg4, arg5);
}

function confirm_dialog_item_func(arg0, arg1)
{
    global.dialog_confirm_func = arg1;
    confirm_dialog_current_nav(arg0, function()
    {
        if (!is_callable(global.dialog_confirm_func))
        {
            exit;
        }
        global.dialog_confirm_func();
    });
}

function confirm_dialog_nav(arg0, arg1, arg2 = undefined)
{
    confirm_dialog(arg0, arg1, undefined, undefined, 
    {
        parent_nav: arg2
    });
}

function confirm_remove_item(arg0, arg1, arg2)
{
    variable_struct_set(global.selected_inventory_item, arg1, arg0);
    if (keyboard_check(vk_shift))
    {
        call_method(arg0, arg2, arg0);
    }
    else
    {
        confirm_dialog(global.texts.confirm_remove_item, arg2, arg0, undefined, 
        {
            parent_nav: o_shop.current_nav_key,
            parent_section: get_current_dialog_section()
        });
    }
}

function destroy_dialog()
{
    try
    {
        with (o_dialog)
        {
            destroy();
        }
    }
    catch (e)
    {
    }
}

function dialog_help_button()
{
    if (is_undefined(o_shop.current_nav_key))
    {
        exit;
    }
    var props = 
    {
        parent_nav: o_shop.current_nav_key
    };
    var text = get_value_ext(global.texts_help, variable_struct_get(global.texts_help, o_shop.current_nav_key));
    if (is_undefined(text))
    {
        return log("=== NO HELP TEXT ===", text, o_shop.current_nav_key);
    }
    var help_button_x = global.is_mobile ? 1.5 : 1;
    if (gui_button_sprite((gui_x_start + gui_width) - gui_col_x(help_button_x), gui_y_start - 24, spr_icon_help, true, false, 
    {
        tooltip: text
    }) && global.is_mobile)
    {
        delay("help_button", 1, function()
        {
            text_dialog(help_button_text, titles, 
            {
                parent_nav: o_shop.current_nav_key
            });
        }, 
        {
            instance: id
        });
    }
}

function draw_fancy_title(arg0, arg1, arg2)
{
    set_default_font(f_gui_default, undefined, 1, 16777215, f_gui_default);
    draw_sprite_stretched(spr_textbox_9s2, 0, arg0, arg1 - gui_col_y(1.8), (string_width(arg2) * 1) + gui_col_x(2), gui_col_y(2));
    draw_heading(arg0 + gui_col_x(1), arg1 - gui_col_y(0.9), arg2, undefined, undefined, undefined, 1);
}

function dialog_click_delay()
{
    global.dialog_click_delay = false;
    delay(undefined, 1, function()
    {
        global.dialog_click_delay = true;
    });
}

function get_current_dialog_nav_key()
{
    if (!instance_exists(o_dialog))
    {
        exit;
    }
    return o_dialog.dialog_id;
}

function get_current_shop_nav_key()
{
    if (!instance_exists(o_shop))
    {
        exit;
    }
    return o_shop.current_nav_key;
}

function input_dialog(arg0, arg1, arg2 = "", arg3 = undefined, arg4 = undefined)
{
    if (instance_exists(o_dialog))
    {
        with (o_dialog)
        {
            destroy();
        }
    }
    var o = instance_create_layer(0, 0, global.layers.gui_dialog, o_dialog_input);
    o.text = arg0;
    o.func_confirm = arg1;
    o.input_props = arg4;
    o.label = arg2;
    apply_struct_to_instance(arg3, o);
    with (o)
    {
        init();
    }
    return o;
}

function is_dialog_visible()
{
    if (!instance_exists(o_dialog))
    {
        return false;
    }
    return o_dialog.visible;
}

function open_dialog(arg0, arg1 = "", arg2 = "", arg3 = false, arg4 = undefined)
{
    if (is_string(arg0))
    {
        var action = variable_struct_get(global.dialog_actions, arg0);
        var settings = variable_struct_get(global.dialog_settings, arg0);
        if (is_undefined(action))
        {
            exit;
        }
        global.open_dialog_settings_action = action;
        global.open_dialog_settings_tmp = settings;
        global.open_dialog_id = arg0;
        delay("open_dialog_delay", 1, function()
        {
            actions_dialog(global.open_dialog_settings_action, get_default_struct_value(global.open_dialog_settings_tmp, "titles"), get_default_struct_value(global.open_dialog_settings_tmp, "items_display"), get_default_struct_value(global.open_dialog_settings_tmp, "props"), global.open_dialog_id);
        });
    }
    else if (is_callable(arg0))
    {
        delay_nav_func(arg0, arg1, arg2, arg3, undefined, arg4);
    }
}

function open_instance_dialog(arg0, arg1)
{
    if (!instance_exists(arg0))
    {
        exit;
    }
    var action = variable_instance_get(arg0, arg1);
    if (is_undefined(action))
    {
        exit;
    }
    global.open_dialog_settings_action = action;
    global.open_dialog_settings_instance = arg0;
    global.open_dialog_settings_tmp = arg1;
    delay("open_dialog_delay", 1, function()
    {
        actions_dialog(global.open_dialog_settings_action, struct_get_from_hash(global.open_dialog_settings_instance, variable_get_hash("titles")), struct_get_from_hash(global.open_dialog_settings_instance, variable_get_hash("items_display")), struct_get_from_hash(global.open_dialog_settings_instance, variable_get_hash("props")));
    });
}

function open_nav(arg0, arg1 = undefined, arg2 = false)
{
    if (!is_undefined(variable_struct_get(global.dialog_actions, arg0)))
    {
        open_dialog(arg0);
        exit;
    }
    if (!instance_exists(o_shop))
    {
        exit;
    }
    with (o_shop)
    {
        var nav = variable_struct_get(nav_items, arg0);
        if (is_undefined(nav))
        {
            if (is_undefined(variable_struct_get(global.dialog_actions, arg0)))
            {
                exit;
            }
            open_dialog(arg0);
            exit;
        }
        if (current_nav_key == arg0 && is_dialog_visible())
        {
            gui_dialog_toggle();
        }
        else
        {
            call_method(o_shop, nav.func);
        }
        with (o_shop)
        {
            if (arg2)
            {
                skip_frame = true;
                delay("reset_skip_frame", 2, function()
                {
                    o_shop.skip_frame = false;
                });
            }
            current_nav_item = nav;
            current_nav_key = arg0;
        }
        if (!is_undefined(arg1))
        {
            set_dialog_section(arg1);
        }
    }
}

function open_nav_delay(arg0, arg1 = undefined, arg2 = false)
{
    global.nav_delay = 
    {
        key: arg0,
        section: arg1,
        skip_frame: arg2
    };
    delay(undefined, 1, function()
    {
        open_nav(global.nav_delay.key, global.nav_delay.section, global.nav_delay.skip_frame);
    });
}

function open_previous_dialog()
{
    var length = array_length(global.dialog_history);
    if (length < 2)
    {
        exit;
    }
    var last_item = global.dialog_history[length - 2];
    log(last_item);
    if (!is_string(last_item.dialog_id))
    {
        exit;
    }
    open_dialog(last_item.dialog_id, undefined, undefined, undefined, last_item.selected_sections_key);
}

function refresh_dialog_surface()
{
    if (!instance_exists(o_dialog))
    {
        exit;
    }
    with (o_dialog)
    {
        refresh_surface = true;
    }
}

function resource_dialog(arg0, arg1, arg2, arg3, arg4 = true, arg5 = undefined, arg6 = undefined, arg7 = undefined)
{
    if (!gui_can_open_dialog(arg7))
    {
        exit;
    }
    var o = instance_create_layer(0, 0, global.layers.gui_dialog, o_dialog_resources);
    o.text = arg0;
    o.resources = arg1;
    o.text2 = arg2;
    o.resources2 = arg3;
    o.can_close_dialog = arg4;
    o.set_titles(arg5);
    apply_struct_to_instance(arg6, o);
    with (o)
    {
        init();
        visible = true;
    }
}

function reward_dialog(arg0, arg1, arg2 = true, arg3 = undefined, arg4 = undefined, arg5 = undefined, arg6 = undefined)
{
    if (!gui_can_open_dialog(arg5))
    {
        exit;
    }
    var o = instance_create_layer(0, 0, global.layers.gui_dialog, o_dialog_reward);
    o.text = arg0;
    o.reward = arg1;
    o.reward_opened_items = arg6;
    o.can_close_dialog = arg2;
    o.set_titles(arg3);
    apply_struct_to_instance(arg4, o);
    with (o)
    {
        init();
        visible = true;
    }
}

function text_dialog(arg0, arg1 = undefined, arg2 = undefined, arg3 = undefined, arg4 = undefined)
{
    var current_nav_key = get_current_dialog_nav_key();
    var current_section = get_current_dialog_section();
    destroy_dialog();
    var o = instance_create_layer(0, 0, global.layers.gui_dialog, o_dialog_text);
    o.text = arg0;
    o.set_titles(arg1);
    o.parent_nav = current_nav_key;
    if (is_string(arg3))
    {
        o.parent_nav = arg3;
    }
    o.parent_section = current_section;
    if (is_struct(arg4))
    {
        o.parent_section = arg4;
    }
    log(current_nav_key, current_section);
    apply_struct_to_instance(arg2, o);
    with (o)
    {
        init();
        scroll_y = 0;
        scroll_y_fx = 0;
        visible = true;
    }
    return o;
}

enum UnknownEnum
{
    Value_18 = 18
}
