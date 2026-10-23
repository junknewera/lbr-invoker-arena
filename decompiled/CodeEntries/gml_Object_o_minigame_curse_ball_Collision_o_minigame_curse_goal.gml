if (speed > speed_goal_threshold)
{
    exit;
}
if (distance_to_point(other.x, other.y) > collision_threshold)
{
    exit;
}
if (instance_exists(o_minigame_curse) && o_minigame_curse.state != UnknownEnum.Value_2)
{
    exit;
}
speed = 0;
x = other.x;
y = other.y;
o_minigame_curse.win();

enum UnknownEnum
{
    Value_2 = 2
}
