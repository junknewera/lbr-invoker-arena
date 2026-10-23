function get_relic_drop_chance()
{
    var base_chance = global.game_settings.relics_enemy_drop_chance + get_upgrade_attribute_value(global.upgrade_attributes.relics_enemy_drop_chance);
    return base_chance;
}
