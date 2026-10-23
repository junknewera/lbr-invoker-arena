function set_game_state(arg0)
{
    if (!instance_exists(o_game))
    {
        exit;
    }
    with (o_game)
    {
        state = arg0;
    }
}
