function enemy_drop_relic(arg0 = undefined)
{
    if (!can_spawn_relics())
    {
        exit;
    }
    var relic_drop = percent_chance(get_relic_drop_chance() * 100);
    if (!relic_drop)
    {
        exit;
    }
    var relic = get_random_relic_by_type(arg0);
    if (!is_struct(relic))
    {
        exit;
    }
    return relic.spawn();
}
