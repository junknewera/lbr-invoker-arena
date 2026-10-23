function get_player_damage_resistance()
{
    var damage_resistance = min(global.game_settings.damage_resistance_max, global.upgrade_attributes.damage_resistance);
    return damage_resistance;
}
