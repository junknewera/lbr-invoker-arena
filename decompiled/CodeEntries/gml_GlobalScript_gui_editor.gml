function gui_editor()
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
    if (!variable_global_exists("gui_editor_vars"))
    {
        global.gui_editor_vars = 
        {
            data: {},
            drag_instance: -1,
            selected_instance: -1,
            show_pos: false,
            snap: true,
            states: []
        };
    }
    actions_dialog_simple(gui_editor_draw, undefined, 
    {
        add_draw: gui_editor_add_draw
    });
    if (!instance_exists(o_gui_editor))
    {
        instance_create_layer(0, 0, global.layers.gui_debug, o_gui_editor);
    }
}

function gui_editor_draw(arg0, arg1)
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
    return arg1 - y_start;
}

function gui_editor_add_draw()
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
    var _x = add_button_base_x_tl;
    var _y = add_button_base_y;
    var gx = gui_x_start;
    var gy = gui_y_start_items;
    if (gui_button_tl(_x, _y, "+buttonTL"))
    {
        var o = instance_create_layer(gx + 100, gy, global.layers.gui_debug, o_gui_editor_button);
        o.type = "tl";
    }
    if (gui_button_tl(_x + gui_col_x(2), _y, "+button"))
    {
        var o = instance_create_layer(gx + 100, gy, global.layers.gui_debug, o_gui_editor_button);
        o.type = "center";
    }
    if (gui_button_tl(_x + gui_col_x(4), _y, "+heading"))
    {
        instance_create_layer(gx, gy, global.layers.gui_debug, o_gui_editor_heading);
    }
    if (gui_button_tl(_x + gui_col_x(4), _y + gui_col_y(2), "+text"))
    {
        instance_create_layer(gx, gy, global.layers.gui_debug, o_gui_editor_text);
    }
    if (gui_button_tl(_x + gui_col_x(6), _y, "+large text"))
    {
        var o = instance_create_layer(gx, gy, global.layers.gui_debug, o_gui_editor_text);
        o.text = "test test test test\ntest test test test\ntest test\ntest test ntest test ntest testtest test test test";
    }
    if (gui_button_tl(_x + gui_col_x(9), _y, "+result"))
    {
        instance_create_layer(gx, gy, global.layers.gui_debug, o_gui_editor_result);
    }
    if (gui_button_tl(_x + gui_col_x(15), _y, "del selected"))
    {
        instance_destroy(global.gui_editor_vars.selected_instance);
    }
    if (gui_button_tl(_x + gui_col_x(18), _y, sprintf("snap (%s)", global.gui_editor_vars.snap ? "on" : "off")))
    {
        global.gui_editor_vars.snap = !global.gui_editor_vars.snap;
    }
    if (gui_button_tl(_x + gui_col_x(20), _y, "toggle pos"))
    {
        global.gui_editor_vars.show_pos = !global.gui_editor_vars.show_pos;
    }
    if (gui_button_tl(_x + gui_col_x(22), _y, "remove all"))
    {
        instance_destroy(o_gui_editor_instance);
        instance_destroy(o_gui_editor);
        global.gui_editor_vars.data = {};
        global.gui_editor_vars.selected_instance = -1;
    }
    if (gui_button_tl(_x + gui_col_x(20), _y + gui_col_y(2), "close"))
    {
        instance_destroy(o_gui_editor_instance);
        instance_destroy(o_gui_editor);
        global.gui_editor_vars.data = {};
        global.gui_editor_vars.selected_instance = -1;
        gui_dialog_close();
    }
    if (gui_button_tl(_x + gui_col_x(22), _y + gui_col_y(2), "save"))
    {
        var data = json_stringify(global.gui_editor_vars.data);
        save_string_to_file(data, "gui_editor.txt");
        log("saved");
    }
    if (gui_button_tl(_x + gui_col_x(22), _y + gui_col_y(4), "load"))
    {
        var data = read_json_file("gui_editor.txt");
        if (is_struct(data))
        {
            var __struct = data;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                if (!is_struct(mitem))
                {
                    continue;
                }
                var obj = asset_get_index(mitem.object_name);
                if (obj == -1)
                {
                    log("can't find object", mitem.object.name);
                }
                else
                {
                    var o = instance_create_layer(mitem.x, mitem.y, global.layers.gui_debug, obj);
                    apply_struct_to_instance(mitem, o);
                }
            }
        }
    }
}
