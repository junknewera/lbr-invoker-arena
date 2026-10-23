function get_defeated_enemies_count_unique()
{
    var sum = 0;
    var __array = global.enemies_sorted;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (mitem.data.defeated)
        {
            sum++;
        }
    }
    return sum;
}
