function set_blower_action_timeout(arg0 = 0)
{
    var action_timeout = o_blower.blower.action_timeout * (1 - arg0);
    action_timeout = max(0.1, action_timeout);
    global.blower_action_timeout_duration = action_timeout;
    global.blower_action_timeout_timer = global.blower_action_timeout_duration;
    o_blower.action_timeout_timer_fx = global.blower_action_timeout_timer;
    set_unit_state(UnknownEnum.Value_1);
}

enum UnknownEnum
{
    Value_1 = 1
}
