function get_hp_drain_area(arg0, arg1 = false)
{
    var area_hp_drain = arg0.hp_drain;
    var hp_drain = area_hp_drain - global.upgrade_attributes.player_resistance;
    hp_drain = max(0, ceil(hp_drain));
    var perma_reg = get_upgrade_count(global.shops.blc.player_hp_reg_perma) > 0;
    if (perma_reg || arg0.hp_drain == 0)
    {
        hp_drain -= get_hp_reg(arg1);
    }
    if (is_struct(arg0.hp_drain_types))
    {
        hp_drain = 0;
        var __struct = arg0.hp_drain_types;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var type_drain_value = get_blower_max_hp() * mitem * (1 - get_upgrade_attribute_value(variable_struct_get(global.upgrade_attributes.damage_types_environment_resistance, mkey)));
            hp_drain += type_drain_value;
        }
    }
    return hp_drain;
}
