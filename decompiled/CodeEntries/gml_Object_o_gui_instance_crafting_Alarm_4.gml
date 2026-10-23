if (!get_option(global.options.autocraft) || !global.tavern_games_playing.crafting)
{
    exit;
}
stop_craft_leaf();
