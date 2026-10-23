function get_max_energy_storage(arg0)
{
    var value = arg0.storage + get_upgrade_attribute_value(global.upgrade_attributes.max_energy_storage) + get_upgrade_attribute_value(variable_struct_get(global.upgrade_attributes.max_resource_storage, arg0.key));
    value *= (1 + get_upgrade_attribute_value(variable_struct_get(global.upgrade_attributes.max_resource_storage_pct, arg0.key)));
    return value;
}
