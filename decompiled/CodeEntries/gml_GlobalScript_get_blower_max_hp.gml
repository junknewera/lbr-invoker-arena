function get_blower_max_hp()
{
    var value = ceil(20 + global.upgrade_attributes.player_hp);
    value *= (1 + global.upgrade_attributes.player_hp_multiplier);
    value *= (1 + global.upgrade_attributes.player_hp_multiplier_dice);
    value = apply_max_number(rround(value));
    return value;
}
