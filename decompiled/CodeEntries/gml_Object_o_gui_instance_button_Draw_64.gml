event_inherited();
if (!global.draw_hud)
{
    exit;
}
if (gui_button_sprite(x, y, sprite, enabled, check_auto_mouse_trigger, options))
{
    call_method(id, click);
}
