function check_enemies()
{
    var __array = global.enemies_resettable;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (mitem.data.auto_reset_defeat_counter && mitem.can_reset_defeat_counter() && mitem.get_defeat_counter() >= mitem.data.auto_reset_defeat_counter_count)
        {
            mitem.reset_defeat_counter();
        }
    }
}
