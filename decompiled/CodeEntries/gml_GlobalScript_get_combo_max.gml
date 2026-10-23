function get_combo_max()
{
    var combo_max = 50 + get_upgrade_attribute_value(global.upgrade_attributes.combo_max);
    combo_max *= (1 + get_upgrade_attribute_value(global.upgrade_attributes.combo_max_multiplier));
    return rround(combo_max);
}
