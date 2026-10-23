if (disappearing)
{
    if (o_game.area.type.enemy_damage_player && !enemy.is_infinite)
    {
        var raw_damage = o_game.area.get_enemy_damage();
        var damage_resistance = get_player_damage_resistance();
        var damage = (raw_damage - global.upgrade_attributes.damage_resistance_absolute) * (1 - damage_resistance);
        damage = max(1, damage);
        if (is_boss)
        {
            damage = o_blower.hp_max;
        }
        global.current_tower_floor_enemies_disappeared++;
        hit_blower(damage, name, enemy);
        o_game.area.enemy_disappears(self);
    }
    if (is_boss)
    {
        o_game.area.set_boss_delay();
    }
}
