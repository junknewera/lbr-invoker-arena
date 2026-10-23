if (distance_to_point(other.x, other.y) > collision_threshold)
{
    exit;
}
if (instance_exists(o_minigame_curse) && o_minigame_curse.state != UnknownEnum.Value_2)
{
    exit;
}
speed = 0;
o_minigame_curse.lose();

enum UnknownEnum
{
    Value_2 = 2
}
