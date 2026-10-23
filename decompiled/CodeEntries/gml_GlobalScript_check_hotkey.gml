function check_hotkey(arg0)
{
    if (!is_struct(arg0))
    {
        return false;
    }
    if (!is_struct(arg0.option))
    {
        return false;
    }
    if (is_undefined(arg0.option.data.value) || is_empty(arg0.option.data.value))
    {
        return false;
    }
    return keyboard_check_pressed(arg0.option.data.value);
}

function check_hotkeys()
{
    static hotkey_delay_crunch = false;
    
    if (can_auto_crunch(true))
    {
        if (!hotkey_delay_crunch && keyboard_check(vk_shift) && keyboard_check(vk_control) && keyboard_check(ord("C")))
        {
            hotkey_delay_crunch = true;
            global.shops.blc.autocrunch_bot.data.toggle = !global.shops.blc.autocrunch_bot.data.toggle;
            with (o_game)
            {
                refresh_surface = true;
            }
        }
        else if (keyboard_check_released(vk_shift) || keyboard_check_released(vk_control) || keyboard_check_released(ord("C")))
        {
            hotkey_delay_crunch = false;
        }
    }
    if (mp_is_season() && keyboard_check(vk_shift) && keyboard_check(vk_control) && keyboard_check(ord("R")))
    {
        global.cloud_data.last_season_upload_manual = undefined;
    }
    if (keyboard_check(vk_shift) && keyboard_check(vk_control) && keyboard_check(vk_alt) && keyboard_check(ord("W")))
    {
        global.options.window_data.data.value = 
        {
            width: display_get_width() - 300,
            height: display_get_height() - 300,
            x: 150,
            y: 150
        };
        camera_init();
    }
    if ((global.debug || global.testers) && keyboard_check(vk_shift) && keyboard_check(vk_control) && keyboard_check(ord("L")))
    {
        o_game.data.game_log = [];
        text_dialog("Logs cleared");
    }
    if (mouse_check_button_pressed(mb_any) && mp_is_season())
    {
        array_push(o_game.data.input_log, 
        {
            x: o_mouse.x,
            y: o_mouse.y,
            b: mouse_lastbutton
        });
    }
}

function check_nav_hotkeys()
{
    var __array = hotkeys;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (is_empty(mitem.hotkey) || mitem.hotkey == -1 || !mitem.check())
        {
            continue;
        }
        if (mitem.hotkey == keyboard_lastkey)
        {
            call_method(mitem.hotkey_item, mitem.hotkey_item.hotkey_func, mitem.key);
            break;
        }
    }
}
