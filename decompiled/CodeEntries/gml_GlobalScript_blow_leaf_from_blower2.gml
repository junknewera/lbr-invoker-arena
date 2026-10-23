function blow_leaf_from_blower2(arg0)
{
    if (instance_exists(o_artifact_gravity_ball))
    {
        exit;
    }
    if (arg0.blower.can_mulch)
    {
        mulch_leaf();
        exit;
    }
    else if (arg0.blower.can_juice && object_index == o_borb)
    {
        juice_leaf();
        exit;
    }
    else if (!arg0.blower.can_blow)
    {
        if (!arg0.can_blow_tmp || arg0.damage == 0)
        {
            exit;
        }
    }
    else if (arg0.blower.can_blow && arg0.damage == 0)
    {
        exit;
    }
    var dir = point_direction(arg0.x, arg0.y, x, y);
    if (arg0.blower.inverse)
    {
        dir *= -1;
    }
    var rotation_direction = (dir >= 90 && dir < 270) ? 1 : -1;
    target_xscale *= choose(1, -1);
    if (target_xscale == image_xscale)
    {
        target_yscale *= choose(1, -1);
    }
    var damage = (arg0.damage * 8) / armor;
    damage = max(damage, 12);
    if (arg0.use_fixed_damage)
    {
        damage = arg0.fixed_damage;
    }
    else if (arg0.use_min_damage)
    {
        damage = 12;
    }
    direction = dir + direction_drift;
    var speed_add = max(0.5, damage / global.game_settings.leaf_speed_divisor);
    speed += speed_add;
    target_rotation += (random_range(3, 40) * rotation_direction);
}
