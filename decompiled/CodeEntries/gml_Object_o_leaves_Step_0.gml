var ob_x = o_blower.x;
var ob_y = o_blower.y;
var ob_damage = o_blower.damage;
for (var i = 0; i < array_length(leaves); i++)
{
    var leaf = @@array_get@@(leaves, i);
    if (point_distance(ob_x, ob_y, leaf._x, leaf._y) < 32)
    {
        var dir = point_direction(ob_x, ob_y, leaf._x, leaf._y);
        leaf._target_x = leaf._x + lengthdir_x(ob_damage * 8, dir);
        leaf._target_y = leaf._y + lengthdir_y(ob_damage * 8, dir);
        leaf._rotation += random_range(1, 5);
    }
    if (leaf._x < 8 || leaf._x > (room_width - 8) || leaf._y < 8 || leaf._y > (room_height - 8))
    {
        var gold = global.environment.golden_paint.data.count + 1;
        add_gold(gold);
        array_delete(leaves, i, 1);
    }
    leaf.step();
}
