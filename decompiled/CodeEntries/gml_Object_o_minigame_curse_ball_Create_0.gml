event_inherited();
border_collision_padding = round(sprite_width / 2);
charge_direction = 1;
charge_min = 1;
charge_max = 100;
charge_speed = 3;
charge = charge_min;
collision_threshold = 8;
friction = 0.25;
image_xscale = 2;
image_yscale = 2;
speed_goal_threshold = 12;
state = UnknownEnum.Value_0;
target_angle = 0;
target_direction = irandom_range(0, 359);
target_speed = 10;
if (get_option(global.options.minigame_cursed_upgrades_enabled))
{
    charge_speed *= (1 - global.upgrade_attributes.curse_machine_slower_charge_speed_multiplier);
    charge_speed = max(0.5, charge_speed);
    target_speed *= (1 - global.upgrade_attributes.curse_machine_slower_aim_multiplier);
    target_speed = max(1, target_speed);
}
xmin = o_minigame_curse.xmin;
xmax = o_minigame_curse.xmax;
ymin = o_minigame_curse.ymin;
ymax = o_minigame_curse.ymax;

enum UnknownEnum
{
    Value_0
}
