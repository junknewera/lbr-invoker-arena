var autosave_interval = sec(max(20, get_option(global.options.autosave_interval)));
alarm[2] = global.cloud_data.is_season ? sec(900) : autosave_interval;
if (!global.autosave && !global.cloud_data.is_season)
{
    alarm[2] = sec(5);
    exit;
}
if (instance_exists(o_minigame_borb_claw_machine) || instance_exists(o_minigame_curse))
{
    alarm[2] = sec(5);
    exit;
}
save_game();
