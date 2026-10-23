if (!global.draw_hud)
{
    exit;
}
if (!surface_exists(surface))
{
    surface = surface_create(960, 540);
    refresh_surface = true;
}
surface_set_target(surface);
if (refresh_surface)
{
    draw_clear_alpha(c_black, 0);
    set_default_font(f_game_small);
    draw_set_halign(fa_left);
    with (o_fx_text)
    {
        alpha = lerp(alpha, alpha_target, 0.1);
        draw_set_alpha(alpha);
        var text_x = x;
        if (sprite_index != -1)
        {
            text_x += 20;
            draw_sprite_contain(sprite_index, 0, x + 8, y + 8, 16, image_angle, 16777215, alpha);
        }
        draw_text(text_x, y, string(text));
        draw_set_alpha(1);
    }
    refresh_surface = false;
}
surface_reset_target();
draw_surface_ext(surface, 0, 0, 1, 1, 0, c_white, 1);
