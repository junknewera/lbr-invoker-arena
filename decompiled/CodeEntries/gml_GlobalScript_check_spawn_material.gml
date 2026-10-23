function check_spawn_material()
{
    if (!can_spawn_material())
    {
        exit;
    }
    var available_materials = get_available_area_materials();
    if (array_length(available_materials) == 0)
    {
        exit;
    }
    var material_spawn_count = 1 + get_upgrade_attribute_value(global.upgrade_attributes.material_spawn_count);
    var __array = available_materials;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        var spawn_chance = mitem.get_spawn_chance();
        if (!percent_chance(spawn_chance * 100))
        {
            continue;
        }
        repeat (material_spawn_count)
        {
            spawn_material(mitem);
        }
    }
}
