debug_keys();
fps_count++;
fps_avg += ((fps - fps_avg) / fps_count);
td++;
if (keyboard_check(vk_shift))
{
    if (keyboard_check(vk_left))
    {
        global.debug_x -= 1;
    }
    if (keyboard_check(vk_right))
    {
        global.debug_x += 1;
    }
    if (keyboard_check(vk_up))
    {
        global.debug_y -= 1;
    }
    if (keyboard_check(vk_down))
    {
        global.debug_y += 1;
    }
    if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_f6))
    {
        check_input = !check_input;
        set_game_state(iif(check_input, UnknownEnum.Value_1, UnknownEnum.Value_0));
        if (check_input)
        {
            keyboard_string = "";
        }
    }
    exit;
}
if (!check_input)
{
    exit;
}
if (keyboard_check_pressed(vk_escape))
{
    keyboard_string = "";
}
if (keyboard_check_pressed(vk_up))
{
    debug_history_index--;
    debug_history_index = clamp(debug_history_index, 0, array_length(debug_history) - 1);
    try
    {
        keyboard_string = debug_history[debug_history_index];
    }
    catch (e)
    {
    }
}
debug_input = keyboard_string;
if (keyboard_check_pressed(vk_enter))
{
    try
    {
        var args = explode(" ", debug_input);
        var obj = args[0];
        if (obj == "log")
        {
            if (args[1] == "global")
            {
                debug_result = log(variable_global_get(args[2]));
            }
            else if (args[1] == "instance")
            {
                debug_result = log(variable_instance_get(args[2], args[3]));
            }
        }
        else if (obj == "addres")
        {
            var resource_input = {};
            variable_struct_set(resource_input, @@array_get@@(args, 1), real(args[2]));
            add_resources(resource_input);
        }
        else if (obj == "call" || obj == "c")
        {
            var script_name = asset_get_index(args[1]);
            try
            {
                log(script_name());
            }
            catch (err)
            {
                log(err);
            }
        }
        else if (obj == "gs" || obj == "setgs")
        {
            variable_struct_set(global.game_settings, @@array_get@@(args, 1), real(args[2]));
            log("game setting", args[1], args[2], variable_struct_get(global.game_settings, @@array_get@@(args, 1)));
            init_game_vars();
        }
        else if (obj == "setglobal")
        {
            var global_name = args[1];
            variable_global_set(global_name, real(args[2]));
        }
        else if (obj == "setmats")
        {
            var resource_input = args[1];
            variable_struct_get(global.materials, resource_input).data.count = real(args[2]);
        }
        else if (obj == "setres")
        {
            var resource_input = args[1];
            variable_struct_get(global.resources, resource_input).data.count = real(args[2]);
        }
        else if (obj == "setstats")
        {
            if (array_length(args) == 3)
            {
                variable_struct_set(o_game.data.stats, @@array_get@@(args, 1), real(args[2]));
            }
            else if (array_length(args) == 4)
            {
                variable_struct_set(variable_struct_get(o_game.data.stats, @@array_get@@(args, 1)), @@array_get@@(args, 2), real(args[3]));
            }
        }
        else
        {
            var input_script = asset_get_index(obj);
            if (is_gml_function(obj))
            {
                var gml_func = variable_struct_get(global.gml_functions, obj);
                if (in_array(obj, ["instance_number"]))
                {
                    var __array = args;
                    var __prop_len = array_length(__array);
                    for (var __i = 0; __i < __prop_len; __i++)
                    {
                        var mitem = __array[__i];
                        if (__i == 0)
                        {
                            continue;
                        }
                        args[__i] = asset_get_index(mitem);
                    }
                }
                if (array_length(args) == 1)
                {
                    log(gml_func());
                }
                else if (array_length(args) == 2)
                {
                    log(gml_func(args[1]));
                }
                else if (array_length(args) == 3)
                {
                    log(gml_func(args[1], args[2]));
                }
                else if (array_length(args) == 4)
                {
                    log(gml_func(args[1], args[2], args[3]));
                }
            }
            else if (input_script != -1)
            {
                if (array_length(args) == 1)
                {
                    log(input_script());
                }
                else if (array_length(args) == 2)
                {
                    log(input_script(args[1]));
                }
                else if (array_length(args) == 3)
                {
                    log(input_script(args[1], args[2]));
                }
                else if (array_length(args) == 4)
                {
                    log(input_script(args[1], args[2], args[3]));
                }
            }
        }
    }
    catch (e)
    {
        log(e);
    }
    array_push(debug_history, debug_input);
    keyboard_string = "";
}

enum UnknownEnum
{
    Value_0,
    Value_1
}
