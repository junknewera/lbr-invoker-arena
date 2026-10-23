function get_time_elapsed()
{
    if (!instance_exists(o_game))
    {
        return current_time;
    }
    return o_game.data.stats.time_elapsed;
}
