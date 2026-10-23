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
if (has_focus)
{
    if (keyboard_check(vk_control) && keyboard_check_pressed(ord("V")))
    {
        keyboard_string += clipboard_get_text();
    }
    if (keyboard_string != "")
    {
        input = keyboard_string;
    }
    else if (keyboard_check(vk_backspace))
    {
        input = "";
    }
    if (keyboard_check(vk_control) && keyboard_check_pressed(ord("C")))
    {
        clipboard_set_text(input);
    }
    if (keyboard_check_pressed(vk_enter))
    {
        has_focus = false;
    }
    if (keyboard_check_pressed(vk_anykey))
    {
        _change(input);
    }
}
