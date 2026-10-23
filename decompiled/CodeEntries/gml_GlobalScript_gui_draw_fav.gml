function gui_draw_fav(arg0, arg1, arg2)
{
    if (!is_struct(arg2))
    {
        exit;
    }
    var fav_color = arg2.data.fav ? 16777215 : 0;
    if (gui_button_sprite(arg0, arg1, spr_star, true, false, 
    {
        sprite_color: fav_color,
        tooltip: __s("Add to favorites")
    }))
    {
        arg2.data.fav = !arg2.data.fav;
    }
}
