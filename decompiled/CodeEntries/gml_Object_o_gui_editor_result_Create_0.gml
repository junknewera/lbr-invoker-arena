if (live_auto_call_1())
{
    var lac_argc = argument_count;
    var lac_args = array_create(lac_argc);
    var lac_argk = 0;
    repeat (lac_argc)
    {
        lac_args[lac_argk] = argument[lac_argk];
        lac_argk++;
    }
    if (live_auto_call_2(lac_args))
    {
        return global.live_result;
    }
}
event_inherited();
drag_offset_x = -10;
drag_offset_y = -10;
font = f_gui_large;
result = 
{
    resources: 
    {
        gems: 100
    }
};
