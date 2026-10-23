function can_spawn_leaves()
{
    if (!o_game.area.type.spawn_leaves)
    {
        return false;
    }
    if (!get_value_ext(o_game.area, o_game.area.can_spawn_area_leaves))
    {
        return false;
    }
    return ds_list_size(o_game.leaves_active) < global.max_leaves;
}
