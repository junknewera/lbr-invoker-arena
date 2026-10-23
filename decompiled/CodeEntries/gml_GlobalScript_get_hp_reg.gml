function get_hp_reg(arg0 = false)
{
    var hp_reg = rround((1 + global.upgrade_attributes.player_hp_reg) * (1 + global.upgrade_attributes.player_hp_reg_multiplier));
    if (arg0 && is_current_area(global.areas.garden) && instance_exists(o_blower))
    {
        hp_reg += ceil(o_blower.hp_max / 10);
    }
    return hp_reg;
}
