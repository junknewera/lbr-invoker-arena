event_inherited();
image_xscale = 0.5;
image_yscale = 0.5;

check_position = function()
{
    if (!o_minigame_curse.is_random_level)
    {
        exit;
    }
    x = irandom_range(o_minigame_curse.x + 40, (o_minigame_curse.x + o_minigame_curse.width) - 40);
    y = irandom_range(o_minigame_curse.y + 40, (o_minigame_curse.y + o_minigame_curse.height) - 40);
    if (distance_to_object(o_minigame_curse_ball) <= 64 || distance_to_object(o_minigame_curse_goal) <= 64)
    {
        check_position();
    }
};

check_position();
