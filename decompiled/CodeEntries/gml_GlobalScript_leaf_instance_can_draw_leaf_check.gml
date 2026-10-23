function leaf_instance_can_draw_leaf_check()
{
    if (is_struct(unique) || is_struct(community_leaf) || force_draw)
    {
        return true;
    }
    if (type == global.resources.leaves && !get_option(global.options.draw_leaves))
    {
        return false;
    }
    if (type != global.resources.leaves && type != global.resources.borbs && !get_option(global.options.draw_other_leaves))
    {
        return false;
    }
    if (type == global.resources.borbs && !get_option(global.options.draw_borbs))
    {
        return false;
    }
    return true;
}
