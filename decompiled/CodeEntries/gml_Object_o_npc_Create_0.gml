actions = [];
gui_func = undefined;
angle = 0;
check_spawn = __return_true;
custom_func = undefined;
has_shadow = true;
hovering = false;
in_range = false;
props = {};
refresh_actions_on_click = false;
rotating = false;
show_tooltip = false;
spawn_dates = undefined;
step_check = sec(0.2);
step_check_counter = 0;
talk_range = 40;
text = "";
text_func = undefined;
titles = 
{
    title: "",
    subtitle: ""
};
t = 0;
xscale = 3;
yscale = 3;
w = 100;
h = 100;
_x = x;
_y = y;
image_xscale = xscale;
image_yscale = yscale;

init = function()
{
    if (is_struct(spawn_dates))
    {
        var spawn_start = get_date_from_object(spawn_dates.spawn_start);
        var spawn_end = get_date_from_object(spawn_dates.spawn_end);
        var now = date_current_datetime();
        if (date_compare_date(now, spawn_start) < 0 || date_compare_date(now, spawn_end) > 0)
        {
            instance_destroy();
            exit;
        }
    }
    if (!check_spawn())
    {
        instance_destroy();
        exit;
    }
    set_text();
    x1 = x - (w / 2);
    x2 = x + (w / 2);
    y1 = y - (h / 2);
    y2 = y + (h / 2);
    set_default_font(f_gui_small);
    w = string_width(text) + 20;
    image_angle = angle;
    image_xscale = xscale;
    image_yscale = yscale;
    props.dialog_id = "npc";
    rotating = get_value_ext(id, rotating);
};

init_actions = __void;

refresh_actions_dialog = function()
{
    set_text();
    if (is_callable(gui_func))
    {
        actions_dialog_simple(gui_func, titles);
    }
    else
    {
        actions_dialog(actions, titles, 6, props);
    }
};

open = refresh_actions_dialog;

set_text = function()
{
    if (!is_undefined(text_func))
    {
        text = text_func();
    }
};
