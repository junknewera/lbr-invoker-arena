set_default_font(f_game_small);
var fields = global.season_pass.nature.get_max_fields();
var col_x = 0;
var col_y = 0;
var field_w = 100;
var field_h = 100;
var dialog_visible = is_dialog_visible();
var mouse_click_check_func = global.is_mobile ? mouse_check_button_released : mouse_check_button_pressed;
for (var i = 0; i < fields; i++)
{
    if (i > 0 && (i % 5) == 0)
    {
        col_y++;
        col_x = 0;
    }
    var _x = 140 + (col_x * 140);
    var _y = 180 + (col_y * 140);
    var field_prop = variable_struct_get(o_game.data.nature_season.field_props, i);
    var item_key = variable_struct_get(o_game.data.nature_season.fields_butterflies, i);
    var item = is_string(item_key) ? variable_struct_get(global.resources, item_key) : undefined;
    var plant_y = _y;
    var sprite = spr_solid;
    if (is_struct(item))
    {
        plant_y += ((field_prop.bfly_progress < 1) ? 10 : 0);
        sprite = (field_prop.bfly_progress < 1) ? spr_icon_larva : item.sprite;
    }
    var field_hover = mouse_in_range(_x - (field_w / 2), (_y - (field_h / 2)) + 5, _x + (field_w / 2), _y + (field_h / 2) + 20);
    if (!dialog_visible && field_hover)
    {
        draw_set_alpha(0.3);
        draw_rectangle(_x - (field_w / 2), (_y - (field_h / 2)) + 5, _x + (field_w / 2), _y + (field_h / 2) + 20, false);
        draw_set_alpha(1);
    }
    draw_sprite_ext(spr_icon_soil3, 0, _x, _y + 12, 2, 2, 0, c_white, 1);
    draw_sprite_ext(sprite, 0, _x, plant_y, 2, 2, 0, c_white, 1);
    if (field_hover && mouse_click_check_func(1) && !is_dialog_visible())
    {
        global.selected_plant_field = i;
        var field_key = variable_struct_get(o_game.data.nature_season.fields_butterflies, global.selected_plant_field);
        var field_item = is_string(field_key) ? variable_struct_get(global.resources, field_key) : undefined;
        if (is_struct(field_item))
        {
            global.selected_plant = field_item;
        }
        else
        {
            global.selected_plant = undefined;
        }
        alarm[2] = 1;
    }
    set_default_font(f_game_small, 1);
    var text_top = "";
    var text_bottom = "";
    if (is_struct(item))
    {
        text_top = __("No plant");
        if (is_string(variable_struct_get(o_game.data.nature_season.fields, i)))
        {
            if (field_prop.progress < 1)
            {
                text_top = __("Waiting");
            }
            else
            {
                text_top = (field_prop.bfly_progress < 1) ? __("Breeding") : __("Bred");
            }
        }
        else if (field_prop.bfly_progress >= 1)
        {
            text_top = __("Bred");
        }
        text_bottom = number_format_percent(calc_percent(field_prop.bfly_progress, 1) / 100, 1);
        draw_text(_x, _y - gui_col_y(1.4), text_top);
        draw_text(_x, _y + gui_col_y(0.8), text_bottom);
        var progress_pct = field_prop.bfly_progress * 100;
        draw_healthbar(_x - gui_col_x(0.5), _y + gui_col_y(1.5), _x + gui_col_x(0.5), _y + gui_col_y(1.6), progress_pct, c_white, c_purple, c_purple, 0, true, false);
    }
    if (field_prop.bfly_locked)
    {
        draw_sprite_ext(spr_icon_lock, 0, _x + gui_col_x(0.6), _y + gui_col_y(0.2), 1.5, 1.5, 0, c_white, 1);
    }
    col_x++;
}
