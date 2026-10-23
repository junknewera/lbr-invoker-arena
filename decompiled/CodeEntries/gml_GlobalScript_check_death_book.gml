function check_death_book()
{
    if (!is_unlocked_death_book())
    {
        exit;
    }
    var __array = global.enemies_bosses;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        mitem.offline_step();
    }
}
