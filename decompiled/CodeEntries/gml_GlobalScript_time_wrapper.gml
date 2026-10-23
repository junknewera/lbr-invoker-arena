function date_inc_second_compat(arg0, arg1)
{
    if (!variable_global_exists("lbr_date_inc_second_compat_test"))
    {
        var now = date_current_datetime();
        var datetest = date_inc_second(now, 666);
        global.lbr_date_inc_second_compat_test = date_compare_datetime(now, datetest) < 0;
    }
    if (global.lbr_date_inc_second_compat_test)
    {
        return date_inc_second(arg0, arg1);
    }
    arg1 += 3600;
    return date_inc_second(arg0, arg1);
}

function date_second_span_ext(arg0, arg1)
{
    var second_span = date_second_span(arg0, arg1);
    second_span *= date_compare_datetime(arg1, arg0);
    return second_span;
}

function dec_timeout_data(arg0, arg1)
{
    if (!instance_exists(o_game))
    {
        exit;
    }
    if (!is_numeric(variable_struct_get(o_game.data.timeouts, arg0)))
    {
        exit;
    }
    variable_struct_set(o_game.data.timeouts, arg0, variable_struct_get(o_game.data.timeouts, arg0) - arg1);
}

function delay(arg0 = guid(), arg1 = sec(1), arg2 = log, arg3 = undefined, arg4 = true, arg5 = false)
{
    with (o_timers)
    {
        var _timer = ez_get_timer(arg0);
        if (!is_undefined(_timer) && arg4)
        {
            ez_remove_timer(arg0);
        }
        _timer = ez_set_timer(arg0, arg1, arg5, arg2, !arg5, arg3);
        ez_activate_timer(arg0);
    }
}

function delay_instance(arg0 = guid(), arg1 = sec(1), arg2 = log, arg3 = undefined, arg4 = true, arg5 = false)
{
    if (!is_struct(arg3))
    {
        arg3 = {};
    }
    set_struct_value(arg3, "instanceid", id);
    arg0 = sprintf("%s_%s", id, arg0);
    delay(arg0, arg1, arg2, arg3, arg4, arg5);
}

function delay_instance_loop(arg0 = guid(), arg1 = sec(1), arg2 = log, arg3 = undefined)
{
    delay_instance(arg0, arg1, arg2, arg3, false, true);
}

function delay_nav_func(arg0, arg1 = "", arg2 = "", arg3 = false, arg4 = undefined, arg5 = undefined)
{
    global.tmp_delay_nav_func = 
    {
        func: arg0,
        parent_nav: undefined,
        sections_key: arg4,
        selected_sections_key: arg5,
        subtitle: arg2,
        title: arg1
    };
    if (arg3 && instance_exists(o_shop) && o_shop.current_nav_key != "__other")
    {
        global.tmp_delay_nav_func.parent_nav = o_shop.current_nav_key;
    }
    delay(guid(), 1, function()
    {
        actions_dialog_simple(global.tmp_delay_nav_func.func, 
        {
            title: global.tmp_delay_nav_func.title,
            subtitle: global.tmp_delay_nav_func.subtitle
        }, 
        {
            parent_nav: global.tmp_delay_nav_func.parent_nav
        }, global.tmp_delay_nav_func.sections_key, global.tmp_delay_nav_func.selected_sections_key);
    });
}

function delay_room_goto(arg0, arg1 = sec(1))
{
    global.tmp_delay_room = arg0;
    delay(sprintf("room_goto_%s", arg0), arg1, function()
    {
        room_goto(global.tmp_delay_room);
    });
}

function format_date(arg0)
{
    if (!is_struct(arg0))
    {
        return "";
    }
    return sprintf("%s-%s-%s: %s:%s:%s", arg0.year, arg0.month, arg0.day, arg0.hour, arg0.minute, arg0.second);
}

function format_remaining_time(arg0, arg1 = false, arg2 = false, arg3 = "", arg4 = ceil)
{
    if (is_undefined(arg0) || !is_numeric(arg0))
    {
        exit;
    }
    var remaining_time = arg0 - o_game.data.stats.time_elapsed;
    if (remaining_time <= 0)
    {
        return arg3;
    }
    if (!is_undefined(arg4))
    {
        remaining_time = arg4(remaining_time);
    }
    return format_time(secr(remaining_time), arg1, arg2);
}

function format_time(arg0, arg1 = false, arg2 = false, arg3 = __("a moment"))
{
    if (is_undefined(arg0) || !is_numeric(arg0))
    {
        exit;
    }
    var text = [];
    var text_template = arg2 ? "%s%s" : "%s %s";
    var days = floor(arg0 / 86400);
    if (days > 0)
    {
        arg0 -= (days * 60 * 60 * 24);
        var day_text = (days == 1) ? __("day") : __("days");
        if (arg2)
        {
            day_text = "d";
        }
        array_push(text, sprintf(text_template, days, day_text));
    }
    var hours = floor(arg0 / 3600);
    if (hours > 0)
    {
        arg0 -= (hours * 60 * 60);
        var hour_text = (hours == 1) ? __("hour") : __("hours");
        if (arg2)
        {
            hour_text = "h";
        }
        array_push(text, sprintf(text_template, hours, hour_text));
    }
    var minutes = floor(arg0 / 60);
    if (minutes > 0)
    {
        arg0 -= (minutes * 60);
        var minute_text = (minutes == 1) ? __("minute") : __("minutes");
        if (arg2)
        {
            minute_text = "m";
        }
        array_push(text, sprintf(text_template, minutes, minute_text));
    }
    if (arg0 > 0)
    {
        var second_text = (arg0 == 1) ? __("second") : __("seconds");
        if (arg2)
        {
            second_text = "s";
        }
        var seconds_int = floor(arg0);
        var seconds_display = iif(arg1, arg0, seconds_int);
        array_push(text, sprintf(text_template, seconds_display, second_text));
    }
    if (array_length(text) <= 0)
    {
        return arg3;
    }
    return implode(" ", text);
}

function format_time_ext(arg0, arg1 = date_current_datetime(), arg2 = false, arg3 = false)
{
    var from_time = arg0;
    var to_time = arg1;
    if (is_struct(arg0))
    {
        from_time = get_date_from_object(arg0);
    }
    if (is_struct(arg1))
    {
        to_time = get_date_from_object(arg1);
    }
    return format_time(date_second_span(from_time, to_time), arg2, arg3);
}

function format_time_left(arg0, arg1 = o_game.data.stats.time_elapsed, arg2 = false, arg3 = false, arg4 = "", arg5 = ceil)
{
    if (is_undefined(arg0) || !is_numeric(arg0))
    {
        exit;
    }
    var remaining_time = arg1 - arg0;
    if (remaining_time <= 0)
    {
        return arg4;
    }
    if (!is_undefined(arg5))
    {
        remaining_time = arg5(remaining_time);
    }
    return format_time(secr(remaining_time), arg2, arg3);
}

function get_date_from_object(arg0)
{
    if (!is_time_object(arg0))
    {
        return false;
    }
    try
    {
        return date_create_datetime(arg0.year, arg0.month, arg0.day, arg0.hour, arg0.minute, arg0.second);
    }
    catch (err)
    {
        return false;
    }
}

function get_elapsed_seconds(arg0, arg1)
{
    return floor((arg0 - arg1) / 1000);
}

function get_time_object()
{
    if (global.debug)
    {
        return get_time_object_debug();
    }
    var t = 
    {
        year: current_year,
        month: current_month,
        day: current_day,
        hour: current_hour,
        minute: current_minute,
        second: current_second
    };
    return t;
}

function get_time_object_debug()
{
    var d = current_day;
    if (d <= 0)
    {
        d = 28;
    }
    return 
    {
        year: current_year,
        month: current_month,
        day: d,
        hour: current_hour,
        minute: current_minute,
        second: current_second
    };
}

function get_time_object_from_datetime(arg0 = date_current_datetime())
{
    if (is_undefined(arg0))
    {
        exit;
    }
    return 
    {
        year: date_get_year(arg0),
        month: date_get_month(arg0),
        day: date_get_day(arg0),
        hour: date_get_hour(arg0),
        minute: date_get_minute(arg0),
        second: date_get_second(arg0)
    };
}

function get_timeout(arg0)
{
    if (!has_timeout(arg0))
    {
        return 0;
    }
    return variable_struct_get(global.timeouts_end, arg0);
}

function get_timeout_data(arg0)
{
    return get_default_struct_value(o_game.data.timeouts, arg0, 0);
}

function get_week_from_date(arg0 = date_current_datetime())
{
    var firstDay = (arg0 + 1) - date_get_day_of_year(arg0);
    var weekday = (date_get_weekday(firstDay) + 6) % 7;
    var calendar_days = date_get_day_of_year(arg0) - 1;
    var extra_days = weekday;
    var week = ((calendar_days + extra_days) div 7) + 1;
    var year = date_get_year(arg0);
    if (year == 2027 || year == 2033 || year == 2038 || year == 2044 || year == 2049 || year == 2055 || year == 2060 || year == 2065 || year == 2072 || year == 2077 || year == 2083 || year == 2088 || year == 2094 || year == 2099)
    {
        week--;
    }
    if (week > 52 || week < 1)
    {
        week = 1;
    }
    return week;
}

function has_timeout(arg0)
{
    return !is_undefined(variable_struct_get(global.timeouts, arg0));
}

function has_timeout_data(arg0)
{
    if (!instance_exists(o_game))
    {
        exit;
    }
    return get_timeout_data(arg0) > o_game.data.stats.time_elapsed;
}

function is_christmas_time()
{
    var now = date_current_datetime();
    return date_compare_date(now, get_date_from_object(global.dates.christmas.start)) >= 0 && date_compare_date(now, get_date_from_object(global.dates.christmas.expire)) <= 0;
}

function is_new_years_eve_time()
{
    var now = date_current_datetime();
    return date_compare_date(now, get_date_from_object(global.dates.new_years_eve.start)) >= 0 && date_compare_date(now, get_date_from_object(global.dates.new_years_eve.expire)) <= 0;
}

function is_time_object(arg0)
{
    return is_struct(arg0) && !is_undefined(struct_get_from_hash(arg0, variable_get_hash("year"))) && !is_undefined(struct_get_from_hash(arg0, variable_get_hash("month"))) && !is_undefined(struct_get_from_hash(arg0, variable_get_hash("day"))) && !is_undefined(struct_get_from_hash(arg0, variable_get_hash("hour"))) && !is_undefined(struct_get_from_hash(arg0, variable_get_hash("minute"))) && !is_undefined(struct_get_from_hash(arg0, variable_get_hash("second")));
}

function set_timeout(arg0, arg1)
{
    var time_elapsed_value = instance_exists(o_game) ? o_game.data.stats.time_elapsed : o_timers.time_elapsed;
    variable_struct_set(global.timeouts, arg0, true);
    variable_struct_set(global.timeouts_end, arg0, time_elapsed_value + arg1);
    delay(arg0, arg1, function()
    {
        variable_struct_remove(global.timeouts, self.props.timeout_name);
    }, 
    {
        timeout_name: arg0
    });
}

function set_timeout_data(arg0, arg1)
{
    if (!instance_exists(o_game))
    {
        exit;
    }
    variable_struct_set(o_game.data.timeouts, arg0, o_game.data.stats.time_elapsed + arg1);
    delay(arg0, arg1, function()
    {
        if (!instance_exists(o_game))
        {
            exit;
        }
        variable_struct_set(o_game.data, self.props.timeout_name, 0);
    }, 
    {
        timeout_name: arg0
    });
}

function unixtime(arg0)
{
    var timezone = date_get_timezone();
    var datetime;
    if (!is_undefined(arg0))
    {
        datetime = arg0;
    }
    else
    {
        datetime = date_current_datetime();
    }
    var timestamp = rround(date_second_span(25569, datetime));
    return timestamp;
}
