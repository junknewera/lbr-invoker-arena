function gui_button_item_sprite(arg0, arg1, arg2, arg3)
{
    var padding = 16;
    var is_active = draw_get_button((arg0 + ((arg2.sprite_data.w * global.gui_sprite_scale) / 2)) - (padding / 2), (arg1 + arg2.sprite_data.h + (global.gui_sprite_scale / 2)) - (padding / 2), "", (arg2.sprite_data.w * global.gui_sprite_scale) + padding, (arg2.sprite_data.h * global.gui_sprite_scale) + padding, true, arg3);
    gui_draw_item_sprite(arg0, arg1, arg2);
    return is_active;
}
