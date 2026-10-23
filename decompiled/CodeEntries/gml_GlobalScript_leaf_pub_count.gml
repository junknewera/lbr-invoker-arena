function leaf_pub_count(arg0 = get_leaf_pub_counter_value())
{
    o_game.data.stats.leaf_pub_counter += arg0;
    leaf_pub_count_set_timeout();
}
