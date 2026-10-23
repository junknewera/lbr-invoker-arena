function get_seed_value(arg0, arg1 = 1)
{
    var seed_upgrade_value = variable_struct_get(global.upgrade_attributes.seed_value_add, arg0.key) + global.upgrade_attributes.seed_value_add_global;
    var res_current_count = arg0.data.count;
    var res_add_total = 0;
    res_add_total = arg0.data.count * (power(1 + seed_upgrade_value, arg1) - 1);
    res_add_total = max(1, res_add_total);
    return res_add_total;
}
