function leaf_instance_draw_shadow_check()
{
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
