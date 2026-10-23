button_width = 32;
button_height = 32;
init_x = x;
init_y = y;
orig_x1 = x;
orig_x2 = x;
orig_y1 = y;
orig_y2 = y;
text_x = x;
text_y = y;
text_height = 0;
x1 = x;
x2 = x;
y1 = y;
y2 = y;
options_default = 
{
    halign: 1,
    tooltip_refresh: false,
    valign: 1
};
options = options_default;
resources = false;
surface = -1;
text = "";
tooltip_text = "";
w = 100;
h = 0;
line_spacing = global.gui_text_line_height;
halign = 1;
valign = 1;

init = function()
{
    if (!is_struct(options))
    {
        options = options_default;
    }
    tooltip_text = get_value_ext(self, text, false);
    tooltip_text = string(tooltip_text);
    init_x = x;
    init_y = y;
    set_default_font(f_gui_small, struct_get_from_hash(options, variable_get_hash("halign")), struct_get_from_hash(options, variable_get_hash("valign")));
    w = string_width(tooltip_text) + 20;
    w = min(600, w);
    text_height = string_height_ext(tooltip_text, line_spacing, w) + 20;
    h = text_height;
    halign = get_default_value(struct_get_from_hash(options, variable_get_hash("halign")), 1);
    valign = get_default_value(struct_get_from_hash(options, variable_get_hash("valign")), 1);
    if (is_struct(struct_get_from_hash(options, variable_get_hash("result"))))
    {
        var result_height = draw_result(-9999, -9999, options.result, undefined, 
        {
            mini: true
        }, false, gui_col_x(5));
        h += (result_height + 20);
        w = global.is_mobile ? gui_col_x(7) : gui_col_x(4.5);
        halign = 0;
        valign = 0;
    }
    update_position();
};

update_position = function()
{
    x1 = x - (w / 2);
    x2 = x + (w / 2);
    y1 = (y - h) + 20;
    y2 = y + 20;
    orig_x1 = init_x - (button_width / 2);
    orig_x2 = init_x + (button_width / 2);
    orig_y1 = init_y - (button_height / 2);
    orig_y2 = init_y + (button_height / 2);
    if (global.is_mobile)
    {
        y1 -= 16;
        y2 -= 16;
    }
    if (is_numeric(struct_get_from_hash(options, variable_get_hash("tooltip_position"))))
    {
        y1 += 120;
        y2 += 120;
    }
    var tmp_x = x;
    var tmp_y = y;
    if (x1 < 0)
    {
        x += abs(x1);
        x1 = x;
    }
    else if (x2 > global.gui_width)
    {
        x -= (x2 - global.gui_width);
        x2 = x;
    }
    if ((y1 - 40) < 0)
    {
        y += abs(y1 - 40);
        y1 = y;
    }
    else if (y2 > global.gui_height)
    {
        y -= (y2 - global.gui_height);
        y2 = y;
    }
    if (halign == 0)
    {
        text_x = x1 + 10;
    }
    else if (halign == 2)
    {
        text_x = x2 - 10;
    }
    if (valign == 0)
    {
        text_y = y1 - 20;
    }
    else if (valign == 1)
    {
        text_y = (y1 + (h / 2)) - 40;
    }
    else if (valign == 2)
    {
        text_y = y2 - 10;
    }
    if (x != tmp_x || y != tmp_y)
    {
        update_position();
    }
};
