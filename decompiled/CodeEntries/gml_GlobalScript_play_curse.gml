function play_curse()
{
    if (!can_play_curse())
    {
        exit;
    }
    if (instance_exists(o_minigame_curse))
    {
        if (o_minigame_curse.state == UnknownEnum.Value_0)
        {
            o_minigame_curse.trigger();
        }
        o_minigame_curse.trigger();
    }
}

enum UnknownEnum
{
    Value_0
}
