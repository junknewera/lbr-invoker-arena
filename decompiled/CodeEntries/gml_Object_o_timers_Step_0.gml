global.dtf = 1;
if (delta_time > 0)
{
    global.dt = 1 / (1000000 / delta_time);
    var dt_expected = 16666.666666666668;
    var dt_diff = clamp(0, delta_time - dt_expected, dt_expected * 60);
    var dt_add = dt_diff / dt_expected;
    global.dtf = 1 + dt_add;
}
time_elapsed += global.dtf;
if (!init)
{
    exit;
}
ez_process_timers();
