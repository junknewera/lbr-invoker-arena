function is_game_state(arg0)
{
    if (!instance_exists(o_game))
    {
        return false;
    }
    return o_game.state == arg0;
}
