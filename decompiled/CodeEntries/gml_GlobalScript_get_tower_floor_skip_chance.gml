function get_tower_floor_skip_chance()
{
    var chance = get_upgrade_attribute_value(global.upgrade_attributes.skip_tower_floor_chance);
    chance *= (1 + get_upgrade_attribute_value(global.upgrade_attributes.skip_tower_floor_chance_multiplier));
    chance *= (1 + get_upgrade_attribute_value(global.upgrade_attributes.skip_tower_floor_chance_multiplier_dice));
    return chance;
}
