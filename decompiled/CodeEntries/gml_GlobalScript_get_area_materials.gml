function get_area_materials(arg0 = o_game.area)
{
    var materials = [];
    var __array = global.materials_spawnable;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if ((!is_undefined(mitem.spawn_area) && mitem.spawn_area.key == arg0.key) || arg0.key == global.areas.dark_glade.key)
        {
            array_push(materials, mitem);
        }
    }
    return materials;
}
