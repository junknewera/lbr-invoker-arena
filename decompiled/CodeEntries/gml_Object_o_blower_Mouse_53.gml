if (!is_state(UnknownEnum.Value_4) || is_dialog_visible())
{
    exit;
}
delay("blower_action_timeout", 2, function()
{
    if (is_dialog_visible())
    {
        exit;
    }
    if (blower.can_dig)
    {
        dig_ground();
        set_blower_action_timeout(get_upgrade_attribute_value(global.upgrade_attributes.dig_reduce_timeout));
    }
    else if (blower.can_damage_enemy)
    {
        slap(get_default_instance_value(o_blower, "x", 0), get_default_instance_value(o_blower, "y", 0));
        set_blower_action_timeout(get_upgrade_attribute_value(global.upgrade_attributes.auto_slap_reduce_timeout));
    }
}, 
{
    instance: id
});

enum UnknownEnum
{
    Value_4 = 4
}
