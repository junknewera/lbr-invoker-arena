if (!can_draw_shadows)
{
    exit;
}
if (!surface_exists(shadow_surface))
{
    shadow_surface = surface_create(960, 540);
}
var view_x = camera_get_view_x(view_camera[0]);
var view_y = camera_get_view_y(view_camera[0]);
surface_set_target(shadow_surface);
draw_clear_alpha(c_black, 0);
gpu_set_fog(true, c_black, 0, 1);
if (get_option(global.options.draw_leaves))
{
    with (o_leaf)
    {
        if (can_draw_shadow())
        {
            draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_draw_xscale, image_draw_yscale, image_angle, c_black, image_alpha - 0.3);
        }
    }
}
with (o_blower)
{
    if (visible)
    {
        draw_sprite_ext(sprite_index, 0, x, y, image_draw_scale, image_draw_scale, image_angle, c_white, 1);
    }
}
with (o_enemy)
{
    if (can_draw)
    {
        draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, image_alpha - 0.3);
    }
}
with (o_fruit)
{
    if (can_draw)
    {
        draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, image_alpha - 0.3);
    }
}
with (o_npc)
{
    if (has_shadow)
    {
        draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, image_alpha - 0.3);
    }
}
if (get_option(global.options.draw_pet))
{
    with (o_pet)
    {
        if (visible)
        {
            draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale * scale_sign * scale_sign_x * scale, image_yscale * scale_sign * scale_sign_y * scale, image_angle, c_white, 1);
        }
    }
}
with (o_seed)
{
    if (can_draw)
    {
        draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, image_alpha - 0.3);
    }
}
if (get_option(global.options.draw_trees) && o_game.area.trees)
{
    with (o_trees)
    {
        var tl = array_length(trees_list);
        for (var t = 0; t < tl; t++)
        {
            var tree = trees_list[t];
            draw_sprite_ext(sprite_index, tree.index, tree.pos._x + 2, tree.pos._y + 2, tree._scale, tree._scale, tree.rotation, c_black, 0.5);
        }
    }
}
gpu_set_fog(false, c_white, 0, 0);
surface_reset_target();
draw_set_alpha(0.5);
draw_surface(shadow_surface, view_x, view_y);
draw_set_alpha(1);
