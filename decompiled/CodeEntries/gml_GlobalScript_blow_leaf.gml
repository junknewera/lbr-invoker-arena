function blow_leaf(arg0)
{
    if (!instance_exists(arg0) || instance_exists(o_artifact_gravity_ball))
    {
        exit;
    }
    var dir = point_direction(x, y, arg0.x, arg0.y);
    var rotation_direction = (dir >= 90 && dir < 270) ? 1 : -1;
    with (arg0)
    {
        target_xscale *= choose(1, -1);
        if (target_xscale == image_xscale)
        {
            target_yscale *= choose(1, -1);
        }
        var damage = (other.damage * 8) / armor;
        damage = max(damage, 12);
        target_x = x + lengthdir_x(damage, dir);
        target_y = y + lengthdir_y(damage, dir);
        target_rotation += (random_range(3, 40) * rotation_direction);
    }
}
