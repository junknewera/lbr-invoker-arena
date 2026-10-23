function reset_game()
{
    global.cache = {};
    global.trades_init = undefined;
    with (o_game)
    {
        init();
    }
    with (o_shop)
    {
        init();
    }
    reset_shops();
}
