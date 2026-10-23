function get_blower_enemy_slap_damage(arg0, arg1 = false)
{
    var damage = get_slap_damage(arg0, false, false);
    if (is_struct(arg0))
    {
        if (arg0.is_boss)
        {
            damage = damage * global.game_settings.slap_boss_damage_multiplier;
        }
        if (!is_undefined(arg0.damage_type))
        {
            var ua = 1 + get_upgrade_attribute_value(global.upgrade_attributes.damage_type_damage_pct);
            var damage_type_value = get_damage_resistance_value(arg0.damage_type) * ua;
            damage += (damage * damage_type_value);
        }
        damage = arg0._get_damage(damage, "slap");
        damage = apply_enemy_cards_damage(damage, arg0);
    }
    if (arg1)
    {
        damage *= get_cache("critical_slap_multiplier", 1);
    }
    damage = max(1, rround(damage));
    damage = apply_max_number(damage);
    return damage;
}
