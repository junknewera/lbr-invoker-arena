function blow_leaf_from_blower(arg0)
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
    else if (!arg0.blower.can_blow)
    {
        if (!arg0.can_blow_tmp || arg0.damage == 0)
        {
            exit;
        }
    }
    var dir = point_direction(arg0.x, arg0.y, x, y);
    var rotation_direction = (dir >= 90 && dir < 270) ? 1 : -1;
    target_xscale *= choose(1, -1);
    if (target_xscale == image_xscale)
    {
        target_yscale *= choose(1, -1);
    }
    var damage = (arg0.damage * 8) / armor;
    damage = max(damage, 12);
    if (arg0.use_min_damage)
    {
        damage = 12;
    }
    target_x = x + lengthdir_x(damage, dir);
    target_y = y + lengthdir_y(damage, dir);
    target_rotation += (random_range(3, 40) * rotation_direction);
}
