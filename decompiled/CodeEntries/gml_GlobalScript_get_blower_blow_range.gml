function get_blower_blow_range()
{
    var base_range = o_blower.size * 8;
    base_range *= (1 + get_upgrade_attribute_value(global.upgrade_attributes.blower_blow_leaf_range_multiplier));
    return base_range;
}
