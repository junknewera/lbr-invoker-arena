function can_play_leaf_counter()
{
    if (o_game.data.stats.time_elapsed < o_game.data.stats.leaf_pub_counter_delay)
    {
        return false;
    }
    return true;
}
