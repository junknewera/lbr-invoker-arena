function spawn_random_material(arg0 = get_available_area_materials(), arg1 = undefined, arg2 = undefined)
{
    if (array_length(arg0) == 0)
    {
        exit;
    }
    return spawn_material(array_random_item(arg0), arg1, arg2);
}
