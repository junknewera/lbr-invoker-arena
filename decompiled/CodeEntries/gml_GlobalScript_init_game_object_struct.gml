function init_game_object_struct(arg0)
{
    if (!is_struct(arg0))
    {
        exit;
    }
    add_keys_to_struct(arg0);
    call_struct(arg0, "_init");
}

function init_rarities(arg0)
{
    add_keys_to_struct(arg0);
    var rarity_array = struct_to_sorted_array_by(arg0, "level");
    var length = array_length(rarity_array);
    var __array = rarity_array;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (__i > 0)
        {
            mitem.previous_rarity = rarity_array[__i - 1];
        }
        if (__i < (length - 1))
        {
            mitem.next_rarity = rarity_array[__i + 1];
        }
    }
    __array = rarity_array;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        mitem._init();
    }
    return rarity_array;
}
