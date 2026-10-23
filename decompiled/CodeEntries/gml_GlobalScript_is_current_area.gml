function is_current_area(arg0)
{
    if (!is_struct(arg0))
    {
        return false;
    }
    return o_game.area.key == arg0.key;
}

function is_current_areas(arg0)
{
    if (!is_array(arg0))
    {
        return false;
    }
    var __array = arg0;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (is_current_area(mitem))
        {
            return true;
        }
    }
    return false;
}
