function can_spawn_seeds()
{
    if (!o_game.area.type.spawn_leaves)
    {
        return false;
    }
    if (!o_game.area.spawn_seeds)
    {
        return false;
    }
    return instance_number(o_seed) < 50 && global.game_settings.seeds_enabled;
}
