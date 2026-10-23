function autoblower_charge(arg0)
{
    battery_charge += arg0;
    if (battery_charge >= battery_charge_max)
    {
        battery_charge = battery_charge_max;
        set_unit_state(UnknownEnum.Value_6);
    }
}

function can_spawn_autoblowers()
{
    if (o_game.area.type.key == global.area_types.tower.key && get_upgrade_attribute_value(global.upgrade_attributes.alb_tower) == 0)
    {
        return false;
    }
    return o_game.area.can_spawn_albs();
}

function change_alb_blower(arg0)
{
    if (is_string(arg0))
    {
        arg0 = variable_struct_get(global.shops.weapons, arg0);
    }
    if (is_undefined(arg0))
    {
        arg0 = global.shops.weapons.hands;
    }
    if (get_upgrade_count(arg0) == 0)
    {
        arg0 = global.shops.weapons.hands;
    }
    if (!arg0.is_alb_equippable())
    {
        exit;
    }
    o_game.data.current_alb_weapon_key = arg0.key;
    with (o_autoblower)
    {
        init();
    }
    init_game_vars(true);
}

function create_autoblowers()
{
    if (!can_spawn_autoblowers())
    {
        exit;
    }
    instance_destroy(o_autoblower);
    var max_blowers = min(50, get_upgrade_count_by_key("auto_leaf_blower"));
    var c = instance_number(o_autoblower);
    while (c < max_blowers)
    {
        create_autoblower();
        c++;
    }
}

function create_autoblower()
{
    if (!get_option(global.options.enable_alb) || !can_spawn_autoblowers())
    {
        exit;
    }
    var n = 0;
    var _x = irandom_range(50, room_width - 50);
    var _y = irandom_range(50, room_height - 50);
    instance_create_layer(_x, _y, global.layers.autoblower, o_autoblower);
}

function get_alb_blowing_power()
{
    var blower = global.shops.weapons.hands;
    if (get_upgrade_count(global.shops.blc.albs_tools) > 0 && global.shops.blc.albs_tools.data.toggle)
    {
        blower = o_blower.blower;
    }
    var value = global.game_settings.blower_base_power + blower.damage + (global.upgrade_attributes.alb_blowing_power * 2);
    value *= (1 + global.upgrade_attributes.alb_blowing_power_dice);
    return value;
}

function get_alb_enemy_damage(arg0 = undefined)
{
    var damage = 5 + (3 * global.upgrade_attributes.alb_enemy_damage);
    damage *= (1 + global.upgrade_attributes.alb_enemy_damage_multiplier);
    damage *= (1 + global.upgrade_attributes.alb_enemy_damage_multiplier_cards);
    if (is_struct(arg0))
    {
        damage = arg0._get_damage(damage, "alb");
    }
    return damage;
}

enum UnknownEnum
{
    Value_6 = 6
}
