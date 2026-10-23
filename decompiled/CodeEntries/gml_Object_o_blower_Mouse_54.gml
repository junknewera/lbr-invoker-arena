if (instance_exists(o_dialog) && o_dialog.visible)
{
    exit;
}
if (!get_option(global.options.player_rc_lock))
{
    exit;
}
global.player_locked = !global.player_locked;
global.player_locked_x = x;
global.player_locked_y = y;
