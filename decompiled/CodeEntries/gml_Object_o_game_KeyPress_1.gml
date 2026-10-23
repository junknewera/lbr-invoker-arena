if (global.is_awaiting_input)
{
    if (!is_undefined(global.awaiting_input_option))
    {
        global.awaiting_input_option._func();
    }
}
