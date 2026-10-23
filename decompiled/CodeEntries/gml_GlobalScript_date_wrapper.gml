function get_daily_data_today()
{
    var daily_data = get_cache("daily_data");
    if (!is_struct(daily_data))
    {
        daily_data = get_daily_data_today_nocache();
    }
    if (is_struct(daily_data) && struct_get_from_hash(daily_data, variable_get_hash("key")) != get_daily_data_today_key())
    {
        daily_data = get_daily_data_today_nocache();
    }
    return daily_data;
}

function get_daily_data_today_key()
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
    var d = get_time_object();
    var d_key = sprintf("%s-%s-%s", d.year, d.month, d.day);
    return d_key;
}

function get_yesterday_key()
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
    var d = get_time_object();
    var date = date_create_datetime(d.year, d.month, d.day, 0, 0, 0);
    var yesterday = date_inc_day(date, -1);
    var d_key = sprintf("%s-%s-%s", date_get_year(yesterday), date_get_month(yesterday), date_get_day(yesterday));
    return d_key;
}

function get_daily_data_today_nocache()
{
    var d_key = get_daily_data_today_key();
    var __array = o_game.data.daily_data;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (mitem.key == d_key)
        {
            return mitem;
        }
    }
    array_push(o_game.data.daily_data, 
    {
        key: d_key,
        data: {}
    });
    return o_game.data.daily_data[array_length(o_game.data.daily_data) - 1];
}

function init_date_flags()
{
    global.dates = 
    {
        christmas: 
        {
            start: 
            {
                year: current_year,
                month: 12,
                day: 1,
                hour: 0,
                minute: 0,
                second: 0
            },
            expire: 
            {
                year: current_year,
                month: 12,
                day: 29,
                hour: 0,
                minute: 0,
                second: 0
            }
        },
        new_years_eve: 
        {
            start: 
            {
                year: current_year,
                month: 12,
                day: 31,
                hour: 0,
                minute: 0,
                second: 0
            },
            expire: 
            {
                year: current_year + 1,
                month: 1,
                day: 2,
                hour: 0,
                minute: 0,
                second: 0
            }
        }
    };
    refresh_date_flags();
}

function refresh_date_flags()
{
    global.dates_flags = 
    {
        christmas: is_christmas_time(),
        new_years_eve: is_new_years_eve_time()
    };
}
