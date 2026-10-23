function leaf_pub_count_set_timeout()
{
    var leaf_count_delay = max(sec(1), sec(120) * (1 - get_upgrade_attribute_value(global.upgrade_attributes.leaf_pub_counter_delay_reduction)));
    o_game.data.stats.leaf_pub_counter_delay = o_game.data.stats.time_elapsed + leaf_count_delay;
}
