function drop_random_relic_chance()
{
    var r = random_range(0, 100);
    var __array = global.relics_array;
    var __prop_len = array_length(__array);
    var __i = __prop_len - 1;
    while (__i >= 0)
    {
        var mitem = __array[__i];
        var __ireal = __prop_len - 1 - __i;
        if (r <= mitem.get_spawn_chance())
        {
            return mitem.spawn();
        }
        __i--;
    }
    return false;
}
