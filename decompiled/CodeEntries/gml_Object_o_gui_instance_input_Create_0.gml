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
allow_special_chars = false;
autofocus = false;
await_string_id = undefined;
disable_release_click = false;
digits_only = false;
enter_func = __void;
has_focus = false;
input = "";
label_id = -1;
label = "";
max_length = 64;
obfuscated = false;
show_unmask_option = false;
type = UnknownEnum.Value_27;
width = gui_col_x(8);
height = global.is_mobile ? gui_col_y(1.5) : gui_col_y(0.9);

init = function()
{
    update_position();
    keyboard_string = input;
    if (obfuscated)
    {
        show_unmask_option = true;
    }
    if (autofocus)
    {
        disable_release_click = true;
        set_focus();
    }
};

_change = function(arg0 = "")
{
    if (digits_only)
    {
        input = string_digits(input);
    }
    if (max_length > 0)
    {
        input = string_copy(input, 1, max_length);
    }
    if (!allow_special_chars)
    {
        input = string_lettersdigits(input);
    }
    change(input);
};

change = __void;

release = function()
{
    set_game_state(UnknownEnum.Value_0);
    await_string_id = undefined;
    has_focus = false;
    keyboard_virtual_hide();
    _change(input);
    keyboard_string = "";
};

set_focus = function()
{
    with (o_gui_instance_input)
    {
        has_focus = false;
    }
    set_game_state(UnknownEnum.Value_1);
    has_focus = true;
    keyboard_string = input;
    if (global.is_mobile)
    {
        keyboard_virtual_show(0, 0, 0, false);
    }
    else if (global.is_opera)
    {
        input = get_string(label, input);
    }
};

update_position = function()
{
    box_x1 = x;
    box_y1 = y + gui_col_y(1);
    box_x2 = x + width;
    box_y2 = y + gui_col_y(1) + height;
};

init();

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_27 = 27
}
