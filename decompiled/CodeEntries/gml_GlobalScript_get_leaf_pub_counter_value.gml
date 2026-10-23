function get_leaf_pub_counter_value()
{
    var value = 1 + get_upgrade_attribute_value(global.upgrade_attributes.leaf_pub_counter);
    value *= (1 + get_upgrade_attribute_value(global.upgrade_attributes.leaf_pub_counter_multiplier));
    return value;
}
