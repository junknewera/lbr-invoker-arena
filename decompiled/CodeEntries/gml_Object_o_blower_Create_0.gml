event_inherited();
if (global.blower_action_timeout_timer <= 0)
{
    set_unit_state(UnknownEnum.Value_4);
}
else
{
    set_unit_state(UnknownEnum.Value_1);
}
x = room_width / 2;
y = room_height / 2;
image_alpha = 1;
image_xscale = 3.5;
image_yscale = 3.5;
image_draw_scale = 3.5;
weapon_draw_scale = 3.5;
can_draw_hp = false;
can_draw_weapon = true;
blower = global.shops.weapons.hands;
_angle = 0;
_damage = global.game_settings.blower_base_power;
damage = _damage;
dig_timer = 0;
dir = 0;
fixed_damage = 1;
hp_max = 20;
hp = hp_max;
is_autoblower = false;
locked = false;
locked_x = x;
locked_y = y;
resistance = 0;
size = 1;
skin = global.shops.skins.def;
slap_timer = 0;
use_fixed_damage = false;
walked = 0;
list_leaves = ds_list_create();
particle_step_counter = 9999;
particle_step_interval = sec(1);
step_update_duration = 1;
step_update_timer = 0;
keyboard_dir_x = 0;
keyboard_dir_y = 0;
movespeed = 10;
skin_image_index = -1;
sprite_image_index = -1;
target_x = mouse_x;
target_y = mouse_y;
vstick_sens = 30;
hp_bar_width = 48;
hp_bar_y = 48;
action_timeout_duration = 1;
action_timeout_timer_fx = 0;
hp_fx = hp;

init = function()
{
    _damage = global.game_settings.blower_base_power;
    damage = _damage + (blower.damage * 4) + (global.upgrade_attributes.nuclear_fuel * 2);
    damage *= (1 + global.upgrade_attributes.nuclear_fuel_multiplier);
    damage *= (1 + global.upgrade_attributes.nuclear_fuel_multiplier_dice);
    hp_max = get_blower_max_hp();
    hp = clamp(ceil(global.player_hp), 1, hp_max);
    hp_fx = hp;
    resistance = ceil(1 + global.upgrade_attributes.player_resistance) * (1 + global.upgrade_attributes.player_resistance_multiplier);
    size = 1 + blower.size;
    size_leaf_distance = get_blower_blow_range();
    use_min_damage = false;
    if (get_upgrade_count(global.shops.blc.blow_power_controller) > 0)
    {
        damage = (global.shops.blc.blow_power_controller.data.slider_value / 100) * damage;
        use_min_damage = global.shops.blc.blow_power_controller.data.slider_value == 1;
    }
    if (o_game.area.type == global.area_types.closed)
    {
        damage = 1;
    }
    damage = apply_max_number(damage);
    if (global.player_locked)
    {
        x = global.player_locked_x;
        y = global.player_locked_y;
    }
    init_skin();
};

init_skin = function()
{
    if (!is_undefined(o_game.data.skins.blower) && is_string(o_game.data.skins.blower) && !is_undefined(variable_struct_get(global.shops.skins, o_game.data.skins.blower)))
    {
        if (!is_undefined(variable_struct_get(global.shops.skins, o_game.data.skins.blower)))
        {
            skin = variable_struct_get(global.shops.skins, o_game.data.skins.blower);
            sprite_index = skin.sprite;
            image_speed = skin.img_speed;
            sprite_image_index = skin.sprite_image_index;
            try
            {
                var scale_base = 56;
                image_draw_scale = scale_base / skin.sprite_data.w;
            }
            catch (e)
            {
            }
        }
    }
    weapon_draw_scale = blower.scale;
};

on_area_change = function()
{
    visible = o_game.area.player_visible;
};

init();
alarm[0] = sec(1);
alarm[1] = sec(0.5);
alarm[2] = sec(1);
alarm[3] = sec(1);

enum UnknownEnum
{
    Value_1 = 1,
    Value_4 = 4
}
