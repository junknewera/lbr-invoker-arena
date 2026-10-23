function check_delta_time_offline_rewards()
{
    if (!instance_exists(o_game))
    {
        exit;
    }
    var _dt = floor(delta_time / 1000000);
    if (_dt > 5)
    {
        o_game.data.stats.time_elapsed += sec(_dt);
        var skip_dialog = false;
        if (instance_exists(o_dialog))
        {
            skip_dialog = true;
            notify(sprintf(__("You received offline rewards for %s."), format_time(_dt, false, true)));
        }
        add_offline_rewards(_dt, "", skip_dialog, false, false);
    }
}
