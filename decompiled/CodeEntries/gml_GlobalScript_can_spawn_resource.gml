function can_spawn_resource()
{
    return instance_number(o_collectable_resource) <= 30;
}

function can_spawn_halloween_event_resource()
{
    if (!is_event_active(global.events.halloween))
    {
        return false;
    }
    return instance_number(o_collectable_event_resource) <= 30;
}

function can_spawn_anniversary_event_resource()
{
    if (!is_event_active(global.events.anniversary))
    {
        return false;
    }
    return instance_number(o_collectable_event_resource) <= 30;
}
