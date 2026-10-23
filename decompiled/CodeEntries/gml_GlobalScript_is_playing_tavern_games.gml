function is_playing_tavern_games()
{
    if (!variable_global_exists("tavern_games_playing"))
    {
        return false;
    }
    return _any(global.tavern_games_playing, function(arg0)
    {
        return arg0;
    });
}
