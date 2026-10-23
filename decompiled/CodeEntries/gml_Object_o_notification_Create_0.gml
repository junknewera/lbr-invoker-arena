alpha = 0.01;
alpha_max = 1;
text = "";
w = 300;
h = 100;
appearing = true;
disappearing = false;
duration = 4;
line_spacing = global.gui_text_line_height;
padding = 10;
sprite = undefined;
orig_x1 = x;
orig_x2 = x;
orig_y1 = y;
orig_y2 = y;
x1 = x;
x2 = x;
y1 = y;
y2 = y;
target_y = y;
halign = 0;
valign = 1;
bg_color = 0;
type = "notification";

init = function()
{
    set_default_font(f_gui_small);
    w = string_width_ext(text, line_spacing, 500);
    h = string_height_ext(text, line_spacing, w);
    if (variable_global_exists("options"))
    {
        set_alpha_max(get_option(global.options.notification_transparency) / 100);
    }
    update_position();
    switch (type)
    {
        case "error":
            bg_color = global.colors.red;
            duration = 120;
            break;
        case "error_persist":
            bg_color = global.colors.red;
            duration = 99999999999999999;
            break;
        case "important":
            bg_color = global.colors.blue;
            duration = 120;
            break;
        case "success":
            bg_color = global.colors.green;
            duration = 30;
            break;
    }
    alarm[0] = sec(duration);
    add_user_log(type, text);
};

push = function(arg0)
{
    y -= arg0;
    update_position();
    if (y < 100)
    {
        instance_destroy();
    }
};

set_alpha_max = function(arg0)
{
    alpha_max = arg0;
    alpha = clamp(alpha, 0, alpha_max);
};

update_position = function()
{
    x1 = x;
    x2 = x + w;
    y1 = y - (h / 2);
    y2 = y + (h / 2);
};
