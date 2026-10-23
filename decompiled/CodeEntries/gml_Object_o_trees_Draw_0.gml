if (!get_option(global.options.draw_trees) || !o_game.area.trees)
{
    exit;
}
if (!surface_exists(surface))
{
    surface = surface_create(960, 540);
}
surface_set_target(surface);
update_draw_delay_timer++;
if (update_draw_delay_timer >= update_draw_delay)
{
    draw_clear_alpha(c_black, 0);
    var tl = array_length(trees_list);
    for (var t = 0; t < tl; t++)
    {
        var tree = @@array_get@@(trees_list, t);
        tree.scale_target = tree.scale + (sin((current_time / tree.rand_scale_speed) + tree.rand_scale_offset) / 2);
        tree._scale = lerp(tree._scale, tree.scale_target, 0.15);
        draw_sprite_ext(sprite_index, tree.index, tree.pos._x, tree.pos._y, tree._scale, tree._scale, tree.rotation, c_white, 0.8);
    }
    update_draw_delay_timer = 0;
}
surface_reset_target();
draw_surface(surface, 0, 0);
