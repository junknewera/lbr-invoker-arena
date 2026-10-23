function gui_draw_sprite(arg0, arg1, arg2, arg3 = 16777215, arg4 = global.gui_sprite_scale, arg5 = 1, arg6 = undefined, arg7 = 0, arg8 = undefined, arg9 = undefined, arg10 = 0)
{
    var spr_w = sprite_get_width(arg2);
    var spr_h = sprite_get_height(arg2);
    var ratio = divide_safe(spr_w, spr_h);
    if (ratio == 0)
    {
        exit;
    }
    var target_size_w = 16 * arg4;
    var target_size_h = 16 * arg4;
    var scale_x = target_size_w / spr_w;
    var scale_y = target_size_h / spr_h;
    var return_width = spr_w;
    if (is_numeric(arg9))
    {
        scale_x = arg9;
        scale_y = arg9;
    }
    var sprite_offset_x = sprite_get_xoffset(arg2);
    var sprite_offset_y = sprite_get_yoffset(arg2);
    var offset_x = 0;
    var offset_y = 0;
    if (is_numeric(arg10) && arg10 > 0)
    {
        scale_x = get_sprite_scale_to_size(arg10, spr_w);
        scale_y = get_sprite_scale_to_size(arg10, spr_h);
        if (scale_x < scale_y)
        {
            scale_y /= ratio;
        }
        else
        {
            scale_x *= ratio;
        }
        offset_x = (((spr_w / 2) - sprite_offset_x) / 2) * scale_x * sign(spr_w - 32);
        offset_y = (((spr_h / 2) - sprite_offset_y) / 2) * scale_y * sign(spr_h - 32);
    }
    if (!is_undefined(arg6))
    {
        if (mouse_in_gui_range(arg0 - 16, arg1 - 16, arg0 + offset_x + spr_w, arg1 + offset_y + spr_h))
        {
            draw_tooltip(arg0, arg1, spr_w * 2, spr_h * 2, arg6);
        }
    }
    draw_sprite_ext(arg2, arg7, arg0 + offset_x, arg1 + offset_y, scale_x, scale_y, 0, arg3, arg5);
    if (!is_undefined(arg8))
    {
        set_default_font(f_gui_default, 0, 1);
        draw_text((arg0 + (spr_w * scale_x)) - 8, arg1, string(arg8));
        return_width = ((arg0 + (spr_w * scale_x)) - 8) + string_width(arg8);
    }
    return return_width;
}
