event_inherited();
_damage = global.game_settings.blower_base_power;
_movespeed = 1.5;
ai = false;
alpha = 1;
animated = false;
battery_charge_max = sec(20);
battery_charge = 0;
battery_charging_rate = battery_charge_max / sec(20);
bump_startup_delay_start = sec(1);
bump_startup_delay = bump_startup_delay_start;
can_bump_enemies = false;
can_draw = true;
can_move = true;
damage = _damage;
enemy_damage = 1;
fixed_damage = 1;
knockback_dir = 0;
knockback_power = 0;
movespeed = _movespeed;
need_charge = true;
pathing = UnknownEnum.Value_0;
pathing_timer = is_shop_item_enabled(global.shops.blc.albs_pathing_timer_start) ? 9999999 : 0;
pathing_tmp = 0;
is_autoblower = true;
scale_sign = 1;
skin_image_index = -1;
slap_timer = 0;
slap_timer_max = sec(1);
spinning = false;
target = -1;
use_fixed_damage = false;
weapon_draw_scale = 1;
set_unit_state(UnknownEnum.Value_6);
direction = irandom(359);
image_xscale = 2;
image_yscale = 2;
image_speed = 0.1;
image_speed_base = image_speed;
chase_enemy = false;
chase_enemy_timer_base = sec(5);
chase_enemy_timer = 1;
draw_scale_x = 1;
draw_scale_y = 1;
scale_base = 32;
sprite_above = spr_solid;
sprite_image_index = spr_autoblower;

init = function()
{
    var _blower = global.shops.weapons.hands;
    if (get_upgrade_count(global.shops.blc.albs_tools) > 0 && global.shops.blc.albs_tools.data.toggle)
    {
        if (!is_undefined(o_game.data.current_alb_weapon_key))
        {
            _blower = get_default_struct_value(global.shops.weapons, o_game.data.current_alb_weapon_key, o_blower.blower);
        }
        else
        {
            _blower = o_blower.blower;
        }
    }
    if (!_blower.is_alb_equippable())
    {
        _blower = global.shops.weapons.hands;
    }
    blower = _blower;
    chase_enemy_timer = max(1, chase_enemy_timer_base);
    damage = get_alb_blowing_power();
    movespeed = _movespeed + (global.upgrade_attributes.alb_speed * 0.25);
    size = 1 + blower.size;
    size_leaf_distance = size * 8;
    bump_startup_delay = bump_startup_delay_start;
    can_move = true;
    battery_charge_max = sec(10 + (global.upgrade_attributes.alb_battery_capacity * 2));
    battery_charge = 0;
    battery_charging_rate = battery_charge_max / max(0.01, sec(10 - (global.upgrade_attributes.alb_battery_charge_rate / 2)));
    need_charge = get_upgrade_count(global.shops.mlc.alb_unlimited_power) == 0 || (get_upgrade_count(global.shops.mlc.alb_unlimited_power) == 1 && !global.shops.mlc.alb_unlimited_power.data.toggle);
    enemy_damage = get_alb_enemy_damage();
    set_unit_state(UnknownEnum.Value_6);
    image_speed_base = clamp(0.2 + (movespeed / 8), 0.2, 1.5);
    image_speed = image_speed_base;
    alarm[0] = chase_enemy_timer;
    if (get_upgrade_count(global.shops.blc.albs_pathing) > 0)
    {
        pathing = get_shop_item_option_value(global.shops.blc.albs_pathing);
    }
    check_bump_enemies();
    check_draw();
    init_skin();
    if (is_event_active(global.events.anniversary))
    {
        sprite_above = spr_icon_birthday_hat;
    }
};

init_skin = function()
{
    if (!is_undefined(o_game.data.skins.autoblower) && is_string(o_game.data.skins.autoblower) && !is_undefined(variable_struct_get(global.shops.skins, o_game.data.skins.autoblower)))
    {
        var skin = variable_struct_get(global.shops.skins, o_game.data.skins.autoblower);
        sprite_index = skin.sprite;
        if (o_game.data.skins.autoblower == "alb_minime")
        {
            skin = o_blower.skin;
            sprite_index = o_blower.sprite_index;
        }
        scale_sign = skin.scale_sign;
        sprite_image_index = skin.sprite_image_index;
        spinning = skin.spinning;
        weapon_draw_scale = o_blower.blower.scale / 3.5;
        try
        {
            draw_scale_x = scale_base / skin.sprite_data.w;
            draw_scale_y = scale_base / skin.sprite_data.h;
        }
        catch (e)
        {
            image_xscale = 2;
            image_yscale = 2;
        }
    }
};

check_bump_enemies = function()
{
    can_bump_enemies = get_upgrade_count(global.shops.bismuth.auto_leaf_blower_can_hit_enemy) > 0 && get_option(global.options.enable_alb_bumping) && bump_startup_delay <= 0;
};

check_draw = function()
{
    alpha = get_option(global.options.alb_visible) / 100;
    can_draw = global.options.alb_visible.data.checked && o_game.area.type != global.area_types.idle && alpha > 0;
};

init();
alarm[1] = sec(0.5);

enum UnknownEnum
{
    Value_0,
    Value_6 = 6
}
