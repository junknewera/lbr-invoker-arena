function check_leafscenders()
{
    if (!global.game_settings.leafscenders_enabled)
    {
        exit;
    }
    var __array = global.leafscenders_array;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        mitem.check();
    }
}
