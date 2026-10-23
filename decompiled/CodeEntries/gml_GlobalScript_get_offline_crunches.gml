function get_offline_prestige()
{
    if (get_default_struct_value(o_game.data.stats.prestige_run, "prestige", 0) == 0)
    {
        return 0;
    }
    var value = get_upgrade_attribute_value(global.upgrade_attributes.offline_prestige);
    return value;
}

function get_offline_crunches()
{
    if (get_default_struct_value(o_game.data.stats.prestige_run, "blc", 0) == 0)
    {
        return 0;
    }
    var value = get_upgrade_attribute_value(global.upgrade_attributes.offline_crunches);
    return value;
}

function get_offline_mlc()
{
    if (get_default_struct_value(o_game.data.stats.prestige_run, "mlc", 0) == 0)
    {
        return 0;
    }
    var value = get_upgrade_attribute_value(global.upgrade_attributes.offline_mlc);
    return value;
}

function get_offline_ulc()
{
    if (get_default_struct_value(o_game.data.stats.prestige_run, "ulc", 0) == 0)
    {
        return 0;
    }
    var value = get_upgrade_attribute_value(global.upgrade_attributes.offline_ulc);
    return value;
}
