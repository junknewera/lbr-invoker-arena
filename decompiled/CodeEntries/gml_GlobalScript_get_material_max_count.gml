function get_material_max_count(arg0 = undefined)
{
    var value = global.game_settings.material_max_count_base + get_upgrade_attribute_value(global.upgrade_attributes.material_max_count);
    if (is_string(arg0))
    {
        value += get_upgrade_attribute_value(variable_struct_get(global.upgrade_attributes.material_max_count_single, arg0));
    }
    return round(value);
}
