function is_event_active(arg0)
{
    if (in_challenge())
    {
        return false;
    }
    if (!get_option(global.options.enable_events))
    {
        return false;
    }
    return arg0._is_active();
}
