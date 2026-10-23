function leaf_instance_init_after_resource()
{
    can_merge = type.merge_check_active;
    merge_check_timeout = false;
    if (type.merge_check_active)
    {
        alarm[1] = random_range(sec(1.5), sec(2.5));
    }
    if (!o_game.area.can_merge)
    {
        can_merge = false;
    }
    force_draw = type.force_draw;
}
