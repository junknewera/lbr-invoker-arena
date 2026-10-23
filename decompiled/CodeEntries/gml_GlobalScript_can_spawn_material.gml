function can_spawn_material()
{
    if (get_upgrade_count(global.shops.blc.unlock_materials) == 0)
    {
        return false;
    }
    if (instance_number(o_material) >= 50)
    {
        return false;
    }
    return true;
}

function get_material_collect_count()
{
    var value = get_bm_value(1, "material_collect_count");
    return value;
}
