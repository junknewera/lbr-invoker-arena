function get_blower_enemy_damage(arg0, arg1 = 1, arg2 = undefined, arg3 = true, arg4 = true)
{
    var damage = 1 + global.upgrade_attributes.blower_enemy_damage + (arg0 * 4);
    damage *= (1 + global.upgrade_attributes.blower_enemy_damage_multiplier);
    damage *= (1 + global.upgrade_attributes.blower_enemy_damage_multiplier_blower);
    damage *= (1 + global.upgrade_attributes.blower_enemy_damage_multiplier_borbventure);
    damage *= (1 + get_cache("blower_enemy_damage_multiplier_boost", 0));
    damage *= (1 + global.upgrade_attributes.blower_enemy_damage_multiplier_cards);
    damage *= (1 + global.upgrade_attributes.blower_enemy_damage_multiplier_counter);
    damage *= (1 + global.upgrade_attributes.blower_enemy_damage_multiplier_craft);
    damage *= (1 + global.upgrade_attributes.blower_enemy_damage_multiplier_dice);
    damage *= (1 + global.upgrade_attributes.blower_enemy_damage_multiplier_event);
    damage *= (1 + global.upgrade_attributes.blower_enemy_damage_multiplier_fish);
    damage *= (1 + global.upgrade_attributes.blower_enemy_damage_multiplier_gem_leaves);
    damage *= (1 + global.upgrade_attributes.blower_enemy_damage_multiplier_global);
    damage *= (1 + global.upgrade_attributes.blower_enemy_damage_multiplier_guild);
    damage *= (1 + global.upgrade_attributes.blower_enemy_damage_multiplier_harbor);
    damage *= (1 + global.upgrade_attributes.blower_enemy_damage_multiplier_milestone);
    damage *= (1 + global.upgrade_attributes.blower_enemy_damage_multiplier_mine);
    damage *= (1 + global.upgrade_attributes.blower_enemy_damage_multiplier_plants);
    damage *= (1 + global.upgrade_attributes.blower_enemy_damage_multiplier_relics);
    damage *= (1 + global.upgrade_attributes.blower_enemy_damage_multiplier_scroll);
    damage *= (1 + global.upgrade_attributes.blower_enemy_damage_multiplier_shadow);
    damage *= (1 + get_shadow_crystal_blower_damage_multiplier());
    damage *= (1 + global.upgrade_attributes.blower_enemy_damage_multiplier_supporter);
    damage *= (1 + global.upgrade_attributes.blower_enemy_damage_multiplier_soul);
    damage *= (1 + (global.upgrade_attributes.blower_enemy_damage_multiplier_quarks * global.resources.quantum_blob.data.count));
    damage *= (1 + sqrt(get_cache_numeric("quark_damage", 0) * 10 * global.upgrade_attributes.quark_damage_blower_damage_multiplier));
    damage *= arg1;
    if (is_struct(arg2))
    {
        if (arg3)
        {
            var _damage_type_victim = arg2.damage_type;
            if (!is_undefined(_damage_type_victim))
            {
                var ua = 1 + get_upgrade_attribute_value(global.upgrade_attributes.damage_type_damage_pct);
                var damage_type_value = get_cache_sub("damage_resistance_value", _damage_type_victim.key);
                if (!is_numeric(damage_type_value))
                {
                    damage_type_value = 1 + (get_damage_resistance_value(_damage_type_victim) * ua);
                    set_cache_sub("damage_resistance_value", _damage_type_victim.key, damage_type_value);
                }
                damage += (damage * damage_type_value);
            }
        }
        damage = arg2._get_damage(damage, "leaf");
        if (arg4)
        {
            damage = apply_enemy_cards_damage(damage, arg2);
        }
    }
    damage = max(1, rround(damage));
    if (global.game_settings.blower_enemy_damage_override)
    {
        damage = global.game_settings.blower_enemy_damage_override_value;
    }
    damage = apply_max_number(damage);
    return damage;
}
