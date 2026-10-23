function gui_draw_item_sprite(arg0, arg1, arg2)
{
    draw_sprite_ext(arg2.sprite, 0, arg0 + arg2.sprite_data.offset.x, arg1 + arg2.sprite_data.offset.y + 6, global.gui_sprite_scale, global.gui_sprite_scale, 0, c_white, 1);
}
