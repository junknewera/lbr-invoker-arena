function get_available_area_materials(arg0 = o_game.area)
{
    var area_materials = get_area_materials(arg0);
    var available_materials = [];
    var __array = area_materials;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (mitem._can_spawn(arg0))
        {
            array_push(available_materials, mitem);
        }
    }
    return available_materials;
}
