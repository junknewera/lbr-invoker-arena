function get_critical_slap_chance()
{
    var value = get_bm_value(0, "slap_critical_chance");
    return value;
}

function get_critical_slap_damage()
{
    var value = get_slap_damage() * get_critical_slap_multiplier();
    return value;
}

function get_critical_slap_multiplier()
{
    var value = get_bm_value(2, "slap_critical_multiplier");
    return value;
}

function get_slap_damage(arg0 = undefined, arg1 = true, arg2 = true)
{
    var slap_multiplier = get_cache("slap_multiplier", 1);
    var damage = 1;
    if (instance_exists(o_blower) && is_same_key(o_blower.blower.type, global.weapon_types.trouts))
    {
        damage = get_blower_enemy_damage(o_blower.blower.damage_base, slap_multiplier, arg0, arg1, arg2);
    }
    return damage;
}

function get_slap_delay()
{
    var value = sec(global.game_settings.auto_slap_delay_duration) - sec(get_upgrade_attribute_value(global.upgrade_attributes.auto_slap_decrease_delay));
    value = max(1, value);
    return value;
}
