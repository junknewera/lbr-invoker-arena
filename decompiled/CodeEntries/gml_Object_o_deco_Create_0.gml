spawn_dates = undefined;

init = function()
{
    if (is_struct(spawn_dates))
    {
        var spawn_start = get_date_from_object(spawn_dates.spawn_start);
        var spawn_end = get_date_from_object(spawn_dates.spawn_end);
        var now = date_current_datetime();
        if (date_compare_date(now, spawn_start) < 0 || date_compare_date(now, spawn_end) > 0)
        {
            instance_destroy();
            exit;
        }
    }
    init_after();
};

init_after = __void;
init();
