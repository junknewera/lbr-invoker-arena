image_alpha = 1;
image_xscale = 3.5;
image_yscale = 3.5;
blower = global.shops.weapons.hands;
_angle = 0;
_damage = global.game_settings.blower_base_power;
can_blow_tmp = false;
damage = _damage;
is_autoblower = false;
size = 1;
size_leaf_distance = size * 8;
state = UnknownEnum.Value_6;
use_min_damage = false;
particle_step_counter = 9999;
particle_step_interval = sec(1);

init = function()
{
    damage = _damage + blower.damage + (get_upgrade_count(global.shops.environment.nuclear_fuel) * 2);
    size = 1 + blower.size;
    size_leaf_distance = size * 8;
};

init();

enum UnknownEnum
{
    Value_6 = 6
}
