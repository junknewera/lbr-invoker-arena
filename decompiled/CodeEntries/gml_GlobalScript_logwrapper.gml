function add_game_log(arg0, arg1 = "other")
{
    var d = 
    {
        id: o_game.data.log_id_counter++,
        l: arg0,
        s: arg1,
        t: o_game.data.stats.time_elapsed
    };
    array_push(o_game.data.game_log, d);
}

function elv()
{
    var text = "";
    for (var i = 0; i < argument_count; i++)
    {
        text += string(argument[i]);
        if (i < (argument_count - 1))
        {
            text += " | ";
        }
    }
    show_message(text);
}

function is_log_enabled()
{
    return global.debug && (!variable_global_exists("log_enabled") || global.log_enabled);
}

function log()
{
    if (!is_log_enabled())
    {
        exit;
    }
    var file = "gml_GlobalScript_logwrapper";
    var line = "33";
    var color_code_pre = "[31;96m";
    var color_code_end = "[0m";
    var text = "[" + color_code_pre + file + ":" + line + color_code_end + "] ";
    for (var i = 0; i < argument_count; i++)
    {
        var text_string = string(argument[i]);
        if (string_length(text_string) > 5000)
        {
            text_string = string_copy(text_string, 0, 5000) + "...";
        }
        text += text_string;
        if (i < (argument_count - 1))
        {
            text += " | ";
        }
    }
    show_debug_message(text);
    return text;
}

function logstack()
{
    for (var i = 0; i < argument_count; i++)
    {
        log(argument[i]);
    }
    return log(debug_get_callstack());
}

function logdelay()
{
    if (!is_log_enabled())
    {
        exit;
    }
    if (argument_count < 3)
    {
        exit;
    }
    if (has_timeout(argument[0]))
    {
        exit;
    }
    set_timeout(argument[0], argument[1]);
    var text = "";
    for (var i = 2; i < argument_count; i++)
    {
        text += string(argument[i]);
        if (i < (argument_count - 1))
        {
            text += " | ";
        }
    }
    show_debug_message(text);
    return text;
}

function logd()
{
    log(" ");
    log("=============");
    log(" ");
}

function logfd()
{
    logf(" ");
    logf("=============");
    logf(" ");
}

function logdeep(arg0, arg1 = undefined, arg2 = 0, arg3 = undefined)
{
    if (arg2 >= 2000)
    {
        return log("Overflow!");
    }
    if (is_struct(arg0))
    {
        var __struct = arg0;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            logdeep(mitem, mkey, ++arg2, arg3);
        }
    }
    else if (is_array(arg0))
    {
        var __array = arg0;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            logdeep(mitem, __i, ++arg2, arg3);
        }
    }
    else if (is_numeric(arg0))
    {
        if (is_string(arg3))
        {
            log(textr(arg3, arg0));
        }
        else
        {
            log(arg1, number_format(arg0, 2));
        }
    }
    else if (is_string(arg3))
    {
        log(textr(arg3, arg0));
    }
    else
    {
        log(arg1, arg0);
    }
}

function logdsmap(arg0 = "")
{
    if (!is_log_enabled())
    {
        exit;
    }
    var keys = _keys(async_load);
    var i = array_length(keys) - 1;
    while (i >= 0)
    {
        logf(sprintf("async %s", arg0), keys[i], ds_map_find_value(async_load, keys[i]));
        i--;
    }
}

function logdsmapstream(arg0 = "")
{
    if (!is_log_enabled())
    {
        exit;
    }
    var keys = _keys(async_load);
    var i = array_length(keys) - 1;
    while (i >= 0)
    {
        var value = ds_map_find_value(async_load, keys[i]);
        if (string_length(value) > 1000)
        {
            value = string_copy(value, 0, 1000) + "...";
        }
        if (keys[i] == "save_data")
        {
            logstream("async save_data (skipped)");
        }
        else
        {
            logstream(sprintf("async %s", arg0), keys[i], value);
        }
        i--;
    }
}

function logf()
{
    var text = "";
    for (var i = 0; i < argument_count; i++)
    {
        var str = string(argument[i]);
        text += str;
        if (i < (argument_count - 1))
        {
            text += " | ";
        }
    }
    show_debug_message(text);
    return text;
}

function lognf()
{
    if (!is_log_enabled())
    {
        exit;
    }
    var text = "";
    for (var i = 0; i < argument_count; i++)
    {
        var item = argument[i];
        var mkey;
        if (is_struct(item))
        {
            var __struct = item;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                text += sprintf("%s: %s", mkey, iif(is_numeric(mitem), number_format(mitem), string(item)));
            }
        }
        else if (is_array(item))
        {
            var __array = item;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                text += sprintf("%s: %s", mkey, iif(is_numeric(mitem), number_format(mitem), string(item)));
            }
        }
        else if (!is_numeric(item))
        {
            text += string(item);
        }
        if (i < (argument_count - 1))
        {
            text += " | ";
        }
    }
    show_debug_message(text);
    return text;
}

function logsafe()
{
    if (!is_log_enabled())
    {
        exit;
    }
    var text = "";
    for (var i = 0; i < argument_count; i++)
    {
        text += string(string_replace_all(argument[i], "%s", "$s"));
        if (i < (argument_count - 1))
        {
            text += " | ";
        }
    }
    show_debug_message(text);
    return text;
}

function logobj()
{
    if (!is_log_enabled())
    {
        exit;
    }
    var text = "";
    for (var i = 0; i < argument_count; i++)
    {
        var loop_item = argument[i];
        var loop_item_text = "";
        if (is_struct(loop_item) && !is_undefined(struct_get_from_hash(loop_item, variable_get_hash("name"))))
        {
            loop_item_text = loop_item.name;
        }
        else
        {
            loop_item_text = string(argument[i]);
        }
        text += loop_item_text;
        if (i < (argument_count - 1))
        {
            text += " | ";
        }
    }
    show_debug_message(text);
}

function logonce()
{
    static logonce_map = {};
    
    if (argument_count == 0)
    {
        exit;
    }
    var _guid = argument[0];
    if (!is_undefined(variable_struct_get(logonce_map, _guid)))
    {
        exit;
    }
    variable_struct_set(logonce_map, _guid, true);
    var text = "";
    for (var i = 1; i < argument_count; i++)
    {
        text += string(argument[i]);
        if (i < (argument_count - 1))
        {
            text += " | ";
        }
    }
    show_debug_message(text);
    return text;
}

function logpretty(arg0)
{
    if (!is_log_enabled())
    {
        exit;
    }
    if (!is_string(arg0) && is_struct(arg0))
    {
        arg0 = json_encode(arg0);
    }
    var indent_level = 0;
    var pretty_string = "";
    for (var i = 0; i < string_length(arg0); i++)
    {
        var char = string_char_at(arg0, i);
        if (char == "{" || char == "[")
        {
            pretty_string += (string_repeat(" ", indent_level * 2) + char + "\n");
            indent_level++;
        }
        else if (char == "}" || char == "]")
        {
            indent_level--;
            pretty_string += (string_repeat(" ", indent_level * 2) + char + "\n");
        }
        else if (char == ",")
        {
            pretty_string += (char + "\n");
        }
        else
        {
            pretty_string += char;
        }
    }
    return pretty_string;
}

function logshift()
{
    if (!is_log_enabled() || keyboard_check(vk_shift))
    {
        exit;
    }
    var text = "";
    for (var i = 0; i < argument_count; i++)
    {
        text += string(argument[i]);
        if (i < (argument_count - 1))
        {
            text += " | ";
        }
    }
    show_debug_message(text);
    return text;
}

function logstream()
{
    if (!variable_global_exists("__logstream_array"))
    {
        global.__logstream_array = [];
    }
    var text = "";
    for (var i = 0; i < argument_count; i++)
    {
        text += string(argument[i]);
        if (i < (argument_count - 1))
        {
            text += " | ";
        }
    }
    array_push(global.__logstream_array, text);
    if (array_length(global.__logstream_array) >= 50)
    {
        show_debug_message(global.__logstream_array);
        global.__logstream_array = [];
    }
}

function logstream_flush()
{
    show_debug_message(global.__logstream_array);
    global.__logstream_array = [];
}

function log2file()
{
    exit;
    var text = "";
    for (var i = 0; i < argument_count; i++)
    {
        text += string(argument[i]);
        if (i < (argument_count - 1))
        {
            text += " | ";
        }
    }
    save_string_to_file(text + "\n\n", "log.txt", true);
}

function add_sc_log(arg0)
{
    array_push(global.shadow_crystal_log, arg0);
    limit_log(global.shadow_crystal_log, 10);
}

function add_to_log(arg0, arg1, arg2 = 10)
{
    array_push(arg0, arg1);
    limit_log(arg0, arg2);
}

function add_user_log(arg0, arg1)
{
    if (!variable_global_exists("user_log"))
    {
        global.user_log = [];
    }
    if (array_length(global.user_log) >= 100)
    {
        array_delete(global.user_log, 0, 1);
    }
    var d = 
    {
        data: arg1,
        key: arg0,
        time: date_datetime_string(date_current_datetime())
    };
    array_push(global.user_log, d);
}

function tidy_game_log()
{
    var daily_data_max_size = 100;
    var game_log_max_size = 256;
    var input_log_max_size = 256;
    var game_log_length = array_length(o_game.data.game_log);
    if (game_log_length >= game_log_max_size)
    {
        array_delete(o_game.data.game_log, 0, game_log_length - game_log_max_size);
    }
    var daily_events_length = array_length(o_game.data.daily_data);
    if (daily_events_length >= daily_data_max_size)
    {
        array_delete(o_game.data.daily_data, 0, daily_events_length - daily_data_max_size);
    }
    var input_log_length = array_length(o_game.data.input_log);
    if (input_log_length >= input_log_max_size)
    {
        array_delete(o_game.data.input_log, 0, input_log_length - input_log_max_size);
    }
    o_game.data.dice.cursed_last_run = "";
    var __struct = o_game.data.craft_sets_names;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(__struct, mkey, string_lettersdigits(mitem));
    }
    __struct = o_game.data.loadouts_names;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(__struct, mkey, string_lettersdigits(mitem));
    }
    __struct = o_game.data.pet_team_names;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(__struct, mkey, string_lettersdigits(mitem));
    }
    __struct = o_game.data.priority_names;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(__struct, mkey, string_lettersdigits(mitem));
    }
}

function limit_log(arg0, arg1)
{
    if (!is_array(arg0))
    {
        exit;
    }
    var log_length = array_length(arg0);
    if (log_length >= arg1)
    {
        array_delete(arg0, 0, log_length - arg1);
    }
}
