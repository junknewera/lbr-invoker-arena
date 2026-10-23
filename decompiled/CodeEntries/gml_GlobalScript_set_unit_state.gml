function set_unit_state(arg0, arg1 = undefined)
{
    if (!is_undefined(arg1) && instance_exists(arg1))
    {
        with (arg1)
        {
            state = arg0;
        }
    }
    else
    {
        state = arg0;
    }
}
