if (live_auto_call_1())
{
    var lac_argc = argument_count;
    var lac_args = array_create(lac_argc);
    var lac_argk = 0;
    repeat (lac_argc)
    {
        lac_args[lac_argk] = argument[lac_argk];
        lac_argk++;
    }
    if (live_auto_call_2(lac_args))
    {
        return global.live_result;
    }
}
set_default_font(f_gui_button);
var is_dialog_item_button_enabled = true;
if (is_dialog_item_button && !is_in_content_range)
{
    is_dialog_item_button_enabled = false;
}
var prev_color = draw_get_color();
var prev_alpha = draw_get_alpha();
var res_y = y;
var x_resources = x;
var text_width = string_width(text);
w = w_start;
h = h_start;
if (is_string(button_text_prefix))
{
    if (button_text_affix_brackets)
    {
        button_text_prefix = "(" + button_text_prefix + ") ";
    }
    text = button_text_prefix + text;
}
if (is_string(button_text_suffix))
{
    if (button_text_affix_brackets)
    {
        button_text_suffix = " (" + button_text_suffix + ")";
    }
    text += button_text_suffix;
}
btn_bg_color = is_empty(enabled) ? global.colors.button_bg_disabled : 16777215;
if (selected)
{
    btn_bg_color = global.colors.button_bg_selected;
}
if (w_start == -1)
{
    w = text_width + 20;
    if (!is_undefined(icon))
    {
        w += 40;
    }
}
else
{
    scale_text_width = true;
}
if (is_numeric(min_width))
{
    w = max(w, min_width);
}
w = rround(w);
h = rround(h);
var button_w = floor(w / 2);
var button_h = floor(h / 2);
if (text != "")
{
    h += 16;
    button_h = floor(max(h / 2, (string_height(text) / 2) + 8));
}
text_color = global.colors.text_default;
if (is_empty(enabled))
{
    text_color = global.colors.text_disabled;
}
else if (hover)
{
    btn_bg_color = global.colors.button_bg_hover;
    text_color = global.colors.text_hover;
    if (selected)
    {
        btn_bg_color = global.colors.button_bg_hover_selected;
    }
}
draw_set_alpha(1);
draw_sprite_stretched_ext(global.gui_settings.button_bg_sprite, -1, bl, bt, w, h, btn_bg_color, 1);
if (!is_empty(text_below))
{
    set_default_font(f_gui_small, 1);
    draw_text(bl + (w / 2), bt + h + 5, string(text_below));
    res_y += (global.is_mobile ? 30 : 20);
}
if (!is_empty(text_right))
{
    draw_description(br + 16, bt + 9, text_right, text_right_width);
}
if (result_position == "top")
{
    res_y = y - gui_col_y(2.5);
}
var font_halign = 0;
var text_x = x + 10;
var text_y = y + button_h;
if (center)
{
    font_halign = 1;
    text_x = x + button_w;
    x_resources = text_x - (global.is_mobile ? 48 : 24);
}
if (!is_undefined(icon))
{
    var icon_pos = 
    {
        x: x + 24,
        y: y + button_h
    };
    if (center)
    {
        icon_pos.x = text_x - (text_width / 2) - 8;
    }
    draw_sprite_contain(icon, 0, icon_pos.x, icon_pos.y, 32, 0, 16777215, 1);
    text_x += 16;
    x += 16;
    text_width += 64;
}
if (hover && is_string(tooltip) && is_dialog_item_button_enabled)
{
    draw_tooltip(bl + (w / 2), bt + (h / 2), w, h, tooltip);
}
draw_set_halign(font_halign);
draw_set_valign(fa_middle);
if (is_string(header_text))
{
    draw_set_color(c_white);
    draw_text(text_x, text_y - button_h - 14, header_text);
}
draw_set_color(text_color);
if (scale_text_width && text_width >= (w - 30))
{
    var scale = (w - 30) / text_width;
    scale = clamp(scale, 0.4, 1);
    draw_text_transformed(text_x, text_y, string(text), scale, scale, 0);
}
else
{
    draw_text(text_x, text_y, string(text));
}
draw_set_color(prev_color);
draw_set_alpha(prev_alpha);
if (!is_undefined(materials))
{
    draw_materials(x_resources + gui_col_x(x_padding_resources), res_y + gui_col_y(y_padding_resources), materials, 1, materials_options);
    res_y += 32;
}
if (!is_undefined(materials_mini))
{
    draw_materials_mini(x_resources + gui_col_x(x_padding_resources), res_y + gui_col_y(y_padding_resources), materials_mini, 1, materials_options);
    res_y += 24;
}
if (!is_undefined(resources))
{
    draw_resources(x_resources + gui_col_x(x_padding_resources), res_y + gui_col_y(y_padding_resources), resources, 1, resources_options);
    res_y += 32;
}
if (!is_undefined(resources_mini))
{
    draw_resources_mini(x_resources + gui_col_x(x_padding_resources), res_y + gui_col_y(y_padding_resources), resources_mini, 1, resources_options);
    res_y += 24;
}
if (global.debug && ((keyboard_check(vk_shift) && w_start == -1) || (keyboard_check(vk_shift) && keyboard_check(vk_control))))
{
    var debugw = sprintf("TLcx=%s", w / gui_col_x(1));
    draw_text(x, y - 15, debugw);
}
