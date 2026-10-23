function can_spawn_comm_leaf()
{
    if (!comm_leaves_available())
    {
        exit;
    }
    if (!o_game.area.type.spawn_leaves)
    {
        return false;
    }
    return instance_number(o_leaf_community) == 0;
}
