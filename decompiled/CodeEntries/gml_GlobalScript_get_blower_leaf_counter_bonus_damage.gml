function get_blower_leaf_counter_bonus_damage(arg0 = o_game.data.stats.leaf_pub_counter)
{
    var bonus = floor(arg0 / 10) * 0.001;
    bonus += (floor(arg0 / 100) * 0.005);
    bonus += (floor(arg0 / 1000) * 0.01);
    bonus += (floor(arg0 / 10000) * 0.05);
    return bonus;
}
