function can_spawn_relics()
{
    if (get_upgrade_count(global.shops.sacred.unlock_relics) == 0)
    {
        return false;
    }
    if (instance_number(o_relic) > 20)
    {
        return false;
    }
    return true;
}
