function get_cache(arg0, arg1 = undefined)
{
    return get_default_struct_value(global.cache, arg0, arg1);
}

function get_cache_numeric(arg0, arg1 = undefined)
{
    var value = get_default_struct_value(global.cache, arg0, arg1);
    if (is_infinity(value))
    {
        value = arg1;
    }
    if (!is_numeric(value))
    {
        value = arg1;
    }
    return value;
}

function get_cache_sub(arg0, arg1, arg2 = undefined)
{
    if (!is_struct(variable_struct_get(global.cache, arg0)))
    {
        return arg2;
    }
    return get_default_struct_value(variable_struct_get(global.cache, arg0), arg1, arg2);
}

function get_cache_from_struct(arg0, arg1, arg2, arg3 = sec(1))
{
    if (!is_struct(arg0))
    {
        exit;
    }
    var value = get_default_struct_value(arg0, arg2, 0);
    var refresh_timer_key = sprintf("%s_%s", arg2, "refresh_timer");
    var refresh_timer = get_default_struct_value(arg0, refresh_timer_key, 0);
    if (refresh_timer <= o_game.data.stats.time_elapsed)
    {
        value = variable_struct_get(arg0, arg1)();
        variable_struct_set(arg0, refresh_timer_key, o_game.data.stats.time_elapsed + arg3);
    }
    return value;
}

function set_cache(arg0, arg1)
{
    variable_struct_set(global.cache, arg0, arg1);
}

function set_cache_sub(arg0, arg1, arg2)
{
    if (!is_struct(variable_struct_get(global.cache, arg0)))
    {
        variable_struct_set(global.cache, arg0, {});
    }
    variable_struct_set(variable_struct_get(global.cache, arg0), arg1, arg2);
}
