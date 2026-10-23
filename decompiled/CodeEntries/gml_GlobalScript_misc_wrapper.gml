function __return_arg(arg0 = undefined)
{
    return arg0;
}

function __return_false()
{
    return false;
}

function __return_text()
{
    return "";
}

function __return_true()
{
    return true;
}

function __void(arg0 = undefined)
{
    return arg0;
}

function call_method(arg0, arg1, arg2)
{
    if (is_undefined(arg1))
    {
        exit;
    }
    var func = maybe_add_method(arg0, arg1);
    if (is_array(arg1))
    {
        if (array_length(arg1) > 3)
        {
            return func(arg1[1], arg1[2], arg1[3]);
        }
        else if (array_length(arg1) > 2)
        {
            return func(arg1[1], arg1[2]);
        }
        else if (array_length(arg1) > 1)
        {
            return func(arg1[1]);
        }
    }
    if (is_array(arg2))
    {
        var args_length = array_length(arg2);
        if (args_length <= 1)
        {
            return func(arg2);
        }
        else if (args_length == 2)
        {
            return func(arg2[0], arg2[1]);
        }
        else if (args_length == 3)
        {
            return func(arg2[0], arg2[1], arg2[2]);
        }
        else if (args_length == 4)
        {
            return func(arg2[0], arg2[1], arg2[2], arg2[3]);
        }
    }
    return func(arg2);
}

function check_time_cheat()
{
    if (!instance_exists(o_game))
    {
        exit;
    }
    o_game.data.stats.ut = unixtime();
    o_game.data.stats.utmax = max(o_game.data.stats.ut, o_game.data.stats.utmax);
}

function game_restart_adv()
{
    if (global.is_ios)
    {
        room_goto(r_init);
    }
    else
    {
        game_restart();
    }
}

function game_restart_main()
{
    global.force_skip_to_start = true;
    game_restart_adv();
}

function get_default_global_value(arg0, arg1 = undefined)
{
    if (!variable_global_exists(arg0))
    {
        return arg1;
    }
    return variable_global_get(arg0);
}

function get_external_image(arg0)
{
    sprite_add(arg0, 0, false, false, 0, 0);
}

function get_news()
{
    if (global.debug)
    {
        exit;
    }
    var news_timeout_key = "get_news";
    post_to_cloud("misc", "get_news", undefined, parse_news);
}

function has_external_image(arg0)
{
    return !is_undefined(variable_struct_get(global.image_cache_http, arg0));
}

function hexcolor(arg0)
{
    var bgr = 0;
    var bsh = 16;
    bgr = (arg0 & 255) << bsh;
    bgr += (arg0 & 65280);
    bgr += ((arg0 & 16711680) >> bsh);
    return bgr;
}

function image_helpers()
{
}

function parse_news(arg0)
{
    var news_raw = get_default_struct_value(arg0, "news", undefined);
    if (is_undefined(news_raw))
    {
        exit;
    }
    var news = undefined;
    try
    {
        news = json_parse(news_raw);
    }
    catch (e)
    {
    }
    if (is_undefined(news))
    {
        exit;
    }
    global.news = news;
}

function testers_test()
{
}

function crash_handler(arg0)
{
    log(arg0.longMessage);
    var fname = sprintf("crashes/%s-%s.txt", "crash", unixtime());
    var crash_text = concatstr_nl($"Version: {global.game_version} // OS {global.os_type_text} // Time: {unixtime()} // Crash ID: {guid()} // Player ID: {o_game.data.player_id} // TE: {o_game.data.stats.time_elapsed} // UT: {o_game.data.stats.ut} // UTMAX: {o_game.data.stats.utmax} // DBG: {o_game.data.dbgchk}", "", arg0.message, "", arg0.script, "", $"Line {arg0.line}", "", arg0.stacktrace, "", arg0.longMessage);
    save_string_to_file(crash_text, fname);
    save_string_to_file(crash_text, "crashes/lastcrash.txt");
    show_message_async(concatstr_nl("The game has crashed :(", "Crash file written to %localappdata%/blow_the_leaves_away/crashes/lastcrash.txt", "", arg0.longMessage, "", arg0.script, "", $"Line {arg0.line}", "", arg0.stacktrace));
    return 0;
}

function get_data_count_sum(arg0)
{
    if (is_struct(arg0))
    {
        return get_struct_sum(arg0, "data", "count");
    }
    return 0;
}

function get_user_steam_id()
{
    return steam_get_user_steam_id();
}

function guid()
{
    var r = "";
    for (var i = 0; i < 32; i++)
    {
        if (i == 8 || i == 12 || i == 16 || i == 20)
        {
            r += "-";
        }
        r += choose("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F");
    }
    return r;
}

function is_afk()
{
    return instance_exists(o_overlay);
}

function is_ingame()
{
    return room == r_start;
}

function has_item(arg0)
{
    return arg0.data.count > 0;
}

function has_item_collected(arg0)
{
    return arg0.data.collected > 0;
}

function has_item_collected_total(arg0)
{
    return arg0.data.collected_total > 0;
}

function hex_string_byte(arg0, arg1)
{
    var _value = 0;
    var _high_char = ord(string_char_at(arg0, (2 * arg1) + 1));
    var _low_char = ord(string_char_at(arg0, (2 * arg1) + 2));
    if (_low_char >= 48 && _low_char <= 57)
    {
        _value += (_low_char - 48);
    }
    else if (_low_char >= 97 && _low_char <= 102)
    {
        _value += (_low_char - 87);
    }
    if (_high_char >= 48 && _high_char <= 57)
    {
        _value += ((_high_char - 48) << 4);
    }
    else if (_high_char >= 97 && _high_char <= 102)
    {
        _value += ((_high_char - 87) << 4);
    }
    return _value;
}

function iif(arg0, arg1, arg2)
{
    if (arg0)
    {
        return arg1;
    }
    return arg2;
}

function is_empty(arg0)
{
    if (is_undefined(arg0))
    {
        return true;
    }
    if (is_bool(arg0) && !arg0)
    {
        return true;
    }
    if (is_numeric(arg0) && arg0 == 0)
    {
        return true;
    }
    if (is_string(arg0) && arg0 == "")
    {
        return true;
    }
    if (is_array(arg0) && array_length(arg0) == 0)
    {
        return true;
    }
    return false;
}

function maybe_add_method(arg0, arg1)
{
    if (is_undefined(arg0))
    {
        return arg1;
    }
    if (!is_struct(arg0) && !instance_exists(arg0))
    {
        return arg1;
    }
    if (is_array(arg1) && array_length(arg1) > 0)
    {
        var array_method = arg1[0];
        if (!is_callable(array_method))
        {
            return arg1;
        }
        return method(arg0, array_method);
    }
    if (!is_method(arg1))
    {
        return arg1;
    }
    return method(arg0, arg1);
}

function mouse_over()
{
    return mouse_x >= bbox_left && mouse_x <= bbox_right && mouse_y >= bbox_top && mouse_y <= bbox_bottom;
}

function sec(arg0)
{
    return room_speed * arg0;
}

function secr(arg0)
{
    return arg0 / room_speed;
}

function sha1_string_utf8_hmac(arg0, arg1)
{
    var _block_size = 64;
    var _hash_size = 20;
    var _inner_size = _block_size + string_byte_length(arg1);
    var _outer_size = _block_size + _hash_size;
    var _key_buffer = buffer_create(_block_size, buffer_fixed, 1);
    var _inner_buffer = buffer_create(_inner_size, buffer_fixed, 1);
    var _outer_buffer = buffer_create(_outer_size, buffer_fixed, 1);
    if (string_byte_length(arg0) > _block_size)
    {
        var _sha1_key = sha1_string_utf8(arg0);
        for (var _i = 0; _i < _hash_size; _i++)
        {
            buffer_write(_key_buffer, buffer_u8, hex_string_byte(_sha1_key, _i));
        }
    }
    else
    {
        buffer_write(_key_buffer, buffer_text, arg0);
    }
    for (var _i = 0; _i < _block_size; _i++)
    {
        var _key_byte = buffer_peek(_key_buffer, _i, buffer_u8);
        buffer_poke(_inner_buffer, _i, buffer_u8, 54 ^ _key_byte);
        buffer_poke(_outer_buffer, _i, buffer_u8, 92 ^ _key_byte);
    }
    buffer_seek(_inner_buffer, buffer_seek_start, _block_size);
    buffer_write(_inner_buffer, buffer_text, arg1);
    var _sha1_inner = buffer_sha1(_inner_buffer, 0, _inner_size);
    buffer_seek(_outer_buffer, buffer_seek_start, _block_size);
    for (var _i = 0; _i < _hash_size; _i++)
    {
        buffer_write(_outer_buffer, buffer_u8, hex_string_byte(_sha1_inner, _i));
    }
    var _result = buffer_sha1(_outer_buffer, 0, _outer_size);
    buffer_delete(_key_buffer);
    buffer_delete(_inner_buffer);
    buffer_delete(_outer_buffer);
    return _result;
}

function url_encode(arg0)
{
    if (!is_string(arg0))
    {
        return arg0;
    }
    if (string_length(arg0) > 1024)
    {
        return arg0;
    }
    var _new = "";
    var char = 0;
    var tmp = 0;
    var ans = 0;
    var _strlen = string_length(arg0);
    for (var ps = 1; ps <= _strlen; ps++)
    {
        var char_orig = string_char_at(arg0, ps);
        char = ord(char_orig);
        if (!is_undefined(variable_struct_get(global.encoded_chars_table, char_orig)))
        {
            _new += variable_struct_get(global.encoded_chars_table, char_orig);
        }
        else
        {
            _new += char_orig;
        }
    }
    return _new;
}
