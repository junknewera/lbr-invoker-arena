function get_enemy_drop_shards_count(arg0 = 1)
{
    var shards_count = get_bm_value(arg0, "enemy_shards_drop_base_value", "enemy_shards_drop_multiplier", undefined, true);
    return ceil(shards_count);
}
