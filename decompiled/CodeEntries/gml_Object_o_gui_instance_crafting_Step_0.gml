if (global.tavern_games_playing.crafting)
{
    ub += ubspeed;
    if (can_press_hotkey && keyboard_check_pressed(vk_space))
    {
        craft_stop_timeout = true;
        stop_craft_leaf();
    }
}
