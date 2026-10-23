if (!fade)
{
    exit;
}
draw_set_alpha(clamp(alpha, 0, 0.3));
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_alpha(1);
