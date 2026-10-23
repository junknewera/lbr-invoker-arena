if (o_game.state != UnknownEnum.Value_0 || global.is_awaiting_input)
{
    exit;
}
if (global.debug && instance_exists(o_gui_editor))
{
    exit;
}
check_nav_hotkeys();
var dir = 0;
if (keyboard_check_pressed(vk_left))
{
    dir = -1;
}
else if (keyboard_check_pressed(vk_right))
{
    dir = 1;
}
if (instance_exists(o_dialog) && o_dialog.visible && !is_undefined(current_nav_item) && dir != 0)
{
    var next_nav_item;
    if (current_nav_item.nav_key == "tl")
    {
        next_nav_item = get_next_visible_nav_item(nav_items_tl, current_nav_item.index, dir);
    }
    else if (current_nav_item.nav_key == "bl")
    {
        next_nav_item = get_next_visible_nav_item(nav_items_bl, current_nav_item.index, dir);
    }
    if (is_struct(next_nav_item))
    {
        open_nav(next_nav_item.key);
        refresh_surface = true;
    }
}

enum UnknownEnum
{
    Value_0
}
