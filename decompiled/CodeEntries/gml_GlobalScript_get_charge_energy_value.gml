function get_charge_energy_value(arg0, arg1 = 1)
{
    var energy_base_value = global.game_settings.energy_base_charge_value + get_upgrade_attribute_value(global.upgrade_attributes.energy_base_charge_value) + get_upgrade_attribute_value(variable_struct_get(global.upgrade_attributes.energy_base_charge_value_single, arg0.key));
    energy_base_value += arg1;
    var energy_multiplier = (1 + get_upgrade_attribute_value(global.upgrade_attributes.energy_base_charge_value_multiplier)) * (1 + get_upgrade_attribute_value(variable_struct_get(global.upgrade_attributes.energy_base_charge_value_multiplier_single, arg0.key))) * (1 + get_upgrade_attribute_value(global.upgrade_attributes.energy_base_charge_value_multiplier_dice));
    var energy_value = energy_base_value * energy_multiplier;
    return energy_value;
}
