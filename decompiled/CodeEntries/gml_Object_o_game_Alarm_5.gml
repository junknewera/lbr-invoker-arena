if (is_playing_tavern_games())
{
    alarm[5] = sec(1);
    exit;
}
autoupgrade_exec();
var autoupgrade_timer = 1 - (0.008 * global.upgrade_attributes.autobuy_accelerator);
autoupgrade_timer = clamp(autoupgrade_timer, 0.2, 1);
alarm[5] = sec(autoupgrade_timer);
