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
event_inherited();
width = gui_col_x(20);
height = gui_col_x(17);
padding = 0;
font = f_gui_small;
items = [];
add_draw_list = undefined;
btn_bg_color = undefined;
button_force_enable = false;
button_func = undefined;
button_func_alt = undefined;
button_text = __("Action");
columns = 22;
column_width = 1;
column_height = 1;
display_count = false;
display_count_data = false;
display_count_func_key = "get_display_count";
display_resources = true;
fixed_y = true;
get_btn_bg_sprite = undefined;
height_max = 0;
is_unlocked_func = undefined;
is_visible_in_list = undefined;
items_drawn = -1;
items_filter = undefined;
items_have_func = false;
loop_dir = "asc";
number_places = 0;
places = 2;
refresh_surface = false;
refresh_surface_delay = sec(0.2);
scroll_buttons = false;
sections_key = undefined;
sections_item_key = "sections_key";
selected_key = undefined;
selection_key = undefined;
shown_on_hover = false;
scroll_height = 0;
scroll_x = 0;
scroll_y = 0;
scroll_y_start = 0;
surface = -1;
tooltip = undefined;

init = function()
{
    set_size();
    height = round(max(1, height));
    column_width = width / columns;
    column_height = height / max(1, (array_length(items) div columns) - 1);
    if (is_undefined(sections_item_key))
    {
        sections_item_key = "sections_key";
    }
    if (!is_undefined(items_filter))
    {
        items = _filter(items, items_filter);
    }
    if (!fixed_y && instance_exists(o_dialog))
    {
        scroll_y_start = o_dialog.scroll_y;
    }
};

draw_items = function()
{
    col_x = -1;
    col_y = 0;
    col_padding_y_default = global.is_mobile ? 96 : 64;
    if (display_count)
    {
        col_padding_y_default += (global.is_mobile ? 24 : 12);
    }
    col_padding_y = col_padding_y_default;
    current_width = 0;
    text_item_count_padding_y_default = global.is_mobile ? 40 : 20;
    text_item_count_padding_y = text_item_count_padding_y_default;
    selected_key_cache = get_value_ext(id, selected_key);
    if (is_string(selection_key))
    {
        selected_key_cache = get_default_struct_value(variable_struct_get(global.selected_inventory_item, selection_key), "key", "");
    }
    items_drawn = 0;
    if (loop_dir == "asc")
    {
        var __array = items;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            draw_item(mitem);
        }
    }
    else
    {
        var __array = items;
        var __prop_len = array_length(__array);
        var __i = __prop_len - 1;
        while (__i >= 0)
        {
            var mitem = __array[__i];
            var __ireal = __prop_len - 1 - __i;
            draw_item(mitem);
            __i--;
        }
    }
    scroll_height = max(0, (height_max - height) + 100);
    scroll_buttons = scroll_height > 0;
};

draw_item = function(arg0)
{
    if (!is_undefined(sections_key) && !is_undefined(sections_item_key))
    {
        var current_item_section = variable_struct_get(arg0, sections_item_key);
        if (!is_current_dialog_section(variable_struct_get(variable_struct_get(global.dialog_sections, sections_key), current_item_section)))
        {
            exit;
        }
    }
    if (!is_undefined(is_visible_in_list) && !is_visible_in_list(arg0))
    {
        exit;
    }
    col_x++;
    if (current_width >= width)
    {
        col_x = 0;
        col_y++;
        current_width = 0;
    }
    text_item_count_padding_y = text_item_count_padding_y_default;
    col_padding_y = col_padding_y_default;
    var display_count_text = "";
    if (display_count)
    {
        set_default_font(f_gui_small, 1, 0);
        if (display_count_data)
        {
            display_count_text = number_format(arg0.data.count, places);
        }
        else
        {
            display_count_text = variable_struct_get(arg0, display_count_func_key)();
        }
        var display_count_height = string_height(display_count_text) - 16;
        col_padding_y += display_count_height;
    }
    var item_x = round((48 + (col_x * column_width)) - scroll_x);
    var item_y = round((48 + (col_y * col_padding_y)) - scroll_y);
    height_max = max(item_y, height_max);
    current_width = item_x + 100;
    if (item_y < -48 || item_y > (height + 16))
    {
        exit;
    }
    var is_unlocked = false;
    if (!is_undefined(struct_get_from_hash(arg0, variable_get_hash("is_unlocked"))))
    {
        is_unlocked = get_value_ext(arg0, arg0.is_unlocked);
    }
    else if (is_struct(struct_get_from_hash(arg0, variable_get_hash("data"))) && !is_undefined(struct_get_from_hash(arg0.data, variable_get_hash("unlocked"))))
    {
        is_unlocked = arg0.data.unlocked;
    }
    if (!is_undefined(is_unlocked_func))
    {
        is_unlocked = is_unlocked_func(arg0);
    }
    var col = iif(is_unlocked, 16777215, 0);
    var btn_bg_sprite = get_default_struct_value(arg0, "btn_bg_sprite", spr_textbox_9s);
    if (!is_undefined(struct_get_from_hash(arg0, variable_get_hash("get_btn_bg_sprite"))))
    {
        btn_bg_sprite = get_value_ext(arg0, arg0.get_btn_bg_sprite);
    }
    if (!is_undefined(get_btn_bg_sprite))
    {
        btn_bg_sprite = get_btn_bg_sprite(arg0);
    }
    if ((!is_undefined(selected_key) || is_string(selection_key)) && !is_undefined(struct_get_from_hash(arg0, variable_get_hash("key"))) && selected_key_cache == arg0.key)
    {
        btn_bg_sprite = spr_textbox_square_active;
    }
    var item_tooltip = get_value_ext(arg0, struct_get_from_hash(arg0, variable_get_hash("get_tooltip")));
    var item_tooltip_func = struct_get_from_hash(arg0, variable_get_hash("get_tooltip_func"));
    if (!is_undefined(tooltip))
    {
        item_tooltip = get_value_ext(arg0, tooltip, arg0);
    }
    var btn_bg_color_final = call_method(arg0, btn_bg_color, arg0);
    if (!is_undefined(struct_get_from_hash(arg0, variable_get_hash("get_btn_bg_color"))))
    {
        btn_bg_color_final = arg0.get_btn_bg_color();
    }
    var opt = 
    {
        btn_bg_sprite: btn_bg_sprite,
        btn_bg_color: btn_bg_color_final,
        mouse_offset: 
        {
            _x: x - scroll_x,
            _y: y - (scroll_y / col_padding_y_default)
        },
        sprite_contain: true,
        sprite_color: col,
        tooltip: item_tooltip,
        tooltip_func: item_tooltip_func,
        resources: display_resources ? get_default_struct_value(arg0, "cost", undefined) : undefined
    };
    var can_do_action = true;
    if (button_force_enable)
    {
        can_do_action = true;
    }
    if (gui_button_sprite(item_x, item_y, arg0.sprite, can_do_action, false, opt))
    {
        if (is_string(selection_key))
        {
            variable_struct_set(global.selected_inventory_item, selection_key, arg0);
        }
        if ((global.is_mobile || mouse_lastbutton == 1) && !is_undefined(button_func))
        {
            button_func(arg0);
        }
        else if (mouse_lastbutton == 2 && !is_undefined(button_func_alt))
        {
            button_func_alt(arg0);
        }
        if (!is_undefined(struct_get_from_hash(arg0, variable_get_hash("list_button_click"))))
        {
            arg0.list_button_click();
        }
        if (shown_on_hover && is_struct(struct_get_from_hash(arg0, variable_get_hash("data"))))
        {
            arg0.data.shown = true;
        }
    }
    if (display_count)
    {
        set_default_font(f_gui_small, 1, 0);
        draw_text_shadow(item_x, item_y + text_item_count_padding_y + 2, display_count_text, 16777215);
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("data"))) && get_default_struct_value(arg0.data, "locked", false))
    {
        draw_sprite_ext(spr_icon_lock, 0, item_x + gui_col_x(0.35), item_y - gui_col_y(0.6), 2, 2, 0, c_white, 1);
    }
    if (is_struct(arg0) && get_default_struct_value_ext(arg0, "draw_exclamation_mark", false))
    {
        gui_draw_sprite(item_x + gui_col_x(0.35), item_y - gui_col_y(0.6), spr_icon_exclamation_mark, undefined, global.is_mobile ? 2 : 1);
    }
    if (!is_undefined(add_draw_list))
    {
        add_draw_list(item_x, item_y, arg0);
    }
    items_drawn++;
};

check_scroll = function()
{
    var scroll_down = false;
    var scroll_up = false;
    if (keyboard_check(vk_down))
    {
        scroll_down = true;
    }
    else if (get_mouse_wheel_down() && mouse_over_panel())
    {
        scroll_down = true;
    }
    if (scroll_down)
    {
        scroll();
    }
    if (keyboard_check(vk_up))
    {
        scroll_up = true;
    }
    else if (get_mouse_wheel_up() && mouse_over_panel())
    {
        scroll_up = true;
    }
    if (scroll_up)
    {
        scroll(-1);
    }
};

mouse_over_panel = function()
{
    var scroll_padding = gui_col_x(1);
    return mouse_in_gui_range(x1 - scroll_padding, y1 - scroll_padding, x2 + scroll_padding, y2 + scroll_padding);
};

set_size = function()
{
    x1 = x;
    x2 = x + width;
    y1 = y;
    y2 = y + height;
};

scroll = function(arg0 = 1)
{
    if (scroll_height < 0)
    {
        exit;
    }
    if (!is_numeric(arg0))
    {
        arg0 = 1;
    }
    scroll_y += (16 * arg0);
    scroll_y = clamp(scroll_y, 0, scroll_height);
};

set_size();
alarm[2] = 2;
