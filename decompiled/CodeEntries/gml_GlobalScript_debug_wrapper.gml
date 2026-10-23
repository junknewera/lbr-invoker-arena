function debug_keys()
{
    if (!global.debug)
    {
        exit;
    }
    if (keyboard_check_pressed(vk_numpad0))
    {
        window_set_position(6928, 154);
        window_set_size(2919, 1633);
    }
    if (keyboard_check_pressed(vk_pause))
    {
        global.pause = !global.pause;
        if (global.pause)
        {
            instance_deactivate_all_hook(true);
        }
        else
        {
            instance_activate_all();
        }
        instance_deactivate_object_hook(o_leaf);
    }
    if (keyboard_check(vk_shift) || true)
    {
        if (keyboard_check_pressed(vk_f1))
        {
            game_restart();
        }
        if (keyboard_check_pressed(vk_f2))
        {
            global.is_mobile = !global.is_mobile;
            init_fonts();
            set_gui_size();
        }
        if (keyboard_check_pressed(vk_f3))
        {
            if (instance_exists(o_grid))
            {
                instance_destroy(o_grid);
            }
            else
            {
                instance_create_layer(0, 0, global.layers.gui, o_grid);
            }
        }
        if (keyboard_check_pressed(vk_f4))
        {
            gui_editor();
        }
        if (keyboard_check_pressed(vk_f5))
        {
            game_end();
        }
        if (keyboard_check_pressed(vk_f6))
        {
            o_debug.visible = !o_debug.visible;
            show_debug_overlay(o_debug.visible);
        }
        if (keyboard_check_pressed(vk_f7))
        {
            if (keyboard_check(vk_shift))
            {
                o_debug.debug_draw = !o_debug.debug_draw;
            }
            else
            {
                o_mouse.visible = !o_mouse.visible;
                global.draw_hud = !global.draw_hud;
            }
        }
        if (keyboard_check_pressed(vk_f8))
        {
            open_nav("debug");
        }
        if (keyboard_check_pressed(vk_f9))
        {
            gui_dialog_close();
            delay(undefined, 2, gui_editor);
        }
        if (keyboard_check_pressed(vk_f10))
        {
            prestige_exec(global.prestige_levels.prestige.level);
        }
        if (keyboard_check_pressed(vk_f11))
        {
            prestige_exec(global.prestige_levels.blc.level);
        }
        if (keyboard_check_pressed(vk_f12))
        {
            if (keyboard_check(vk_shift))
            {
                prestige_exec(global.prestige_levels.ulc.level);
                log("ulc");
            }
            else
            {
                prestige_exec(global.prestige_levels.mlc.level);
                log("mlc");
            }
        }
        if (keyboard_check(vk_numpad0))
        {
            o_game.data.stats.time_elapsed += sec(1);
        }
    }
    if (keyboard_check_pressed(vk_numpad1))
    {
        var lang = (get_option(global.options.language) == "en") ? 1 : 0;
        global.options.language.data.value = lang;
        global.options.language.change();
    }
    if (keyboard_check_pressed(vk_numpad2))
    {
        init_fonts();
        global.options.alternative_font.change();
    }
    if (keyboard_check(vk_numpad3))
    {
        var __array = global.borbventures.items.borbs;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            mitem.data.xp += 10;
        }
    }
    if (keyboard_check(vk_numpad4))
    {
        var __struct = global.borbventures.borb_levels;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            global.borbventures.craft_item(10, 
            {
                rarity_key: mitem.key
            }, undefined, false);
        }
    }
    if (keyboard_check_pressed(vk_numpad5))
    {
        debugfunc();
    }
    if (keyboard_check(vk_numpad6))
    {
        check_spawn_artifacts();
    }
    if (keyboard_check(vk_numpad7))
    {
        change_area(o_game.area);
    }
    if (keyboard_check_pressed(vk_numpad8))
    {
        global.tmp_res_counter = 1;
    }
    if (keyboard_check_pressed(vk_numpad9))
    {
        window_set_position(6928, 154);
        window_set_size(2919, 1633);
        log(window_get_x(), window_get_y(), window_get_width(), window_get_height());
    }
    if (keyboard_check(vk_divide))
    {
        repeat (750)
        {
            spawn_leaf();
        }
    }
    if (keyboard_check(vk_multiply))
    {
        _map(global.resources, function(arg0)
        {
            arg0.data.count = 0;
            arg0.data.leafscend_count = {};
        }, false);
        var __struct = global.materials;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            mitem.data.count = 0;
        }
    }
    if (keyboard_check(vk_subtract))
    {
        var res = {};
        var __array = global.resources_array;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            variable_struct_set(res, mitem.key, 10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000);
        }
        add_resources(res);
        global.resources.coins.data.unlocked = true;
        global.resources.gems.data.unlocked = true;
        var __struct = global.materials;
        var __prop_names = struct_get_names(__struct);
        __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            mitem.collect(5000);
        }
        __struct = global.chests;
        __prop_names = struct_get_names(__struct);
        __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            mitem.collect(1);
        }
        o_game.data.stats.cursed_count += 1000;
    }
    if (keyboard_check(vk_add))
    {
        _map(global.resources, function(arg0, arg1)
        {
            if (!arg0.data.unlocked)
            {
                exit;
            }
            var res_add = {};
            variable_struct_set(res_add, arg1, 10000000000);
            add_resources(res_add, false, false);
            add_to_struct_value(arg0.data.leafscend_count, "1", 1);
            add_to_struct_value(arg0.data.leafscend_count, "2", 1);
            add_to_struct_value(arg0.data.leafscend_count, "3", 1);
            add_to_struct_value(arg0.data.leafscend_count, "4", 1);
            add_to_struct_value(arg0.data.leafscend_count, "5", 1);
            add_to_struct_value(arg0.data.leafscend_count, "6", 1);
        }, false);
    }
}

function is_gml_function(arg0)
{
    return !is_undefined(variable_struct_get(global.gml_functions, arg0));
}

function load_debug_config()
{
    if (global.cloud_data.is_season || !file_exists("debug.json"))
    {
        return log("is season/no debug.json");
    }
    var contents = get_file_contents("debug.json");
    log("content = ", contents);
    try
    {
        var cfg = json_parse(contents);
        if (!is_struct(cfg))
        {
            return log("no cfg struct");
        }
        log("cfg = ", cfg);
        var __struct = struct_get_from_hash(cfg, variable_get_hash("globals"));
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            if (!variable_global_exists(mkey))
            {
                log("global doesn't exist", mkey);
            }
            else
            {
                var g = variable_global_get(mkey);
                if (is_struct(mitem))
                {
                    var __struct2 = mitem;
                    var __prop_names2 = struct_get_names(__struct2);
                    var __prop_len2 = array_length(__prop_names2);
                    for (var __i2 = 0; __i2 < __prop_len2; __i2++)
                    {
                        var mkey2 = __prop_names2[__i2];
                        var mitem2 = variable_struct_get(__struct2, mkey2);
                        if (is_struct(mitem2))
                        {
                            var __struct3 = mitem2;
                            var __prop_names3 = struct_get_names(__struct3);
                            var __prop_len3 = array_length(__prop_names3);
                            for (var __i3 = 0; __i3 < __prop_len3; __i3++)
                            {
                                var mkey3 = __prop_names3[__i3];
                                var mitem3 = variable_struct_get(__struct3, mkey3);
                                log(sprintf("set global.%s.%s.%s = %s", mkey, mkey2, mkey3, mitem3));
                                variable_struct_set(variable_struct_get(g, mkey2), mkey3, mitem3);
                            }
                        }
                        else
                        {
                            log(sprintf("set global.%s.%s = %s", mkey, mkey2, mitem2));
                            variable_struct_set(g, mkey2, mitem2);
                        }
                    }
                }
                else
                {
                    log(sprintf("set global.%s = %s", mkey, mitem));
                    variable_global_set(g, mitem);
                }
            }
        }
        if (!is_undefined(struct_get_from_hash(cfg, variable_get_hash("result"))))
        {
            add_result(cfg.result, undefined, undefined, undefined, true);
            log("result added", cfg.result);
        }
        var a = o_game.area;
        change_area(global.areas.garden);
        change_area(a);
        init_game_vars();
        log("cfg refreshed");
    }
    catch (err)
    {
        log(err);
    }
}
