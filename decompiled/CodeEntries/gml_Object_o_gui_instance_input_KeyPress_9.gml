if (!has_focus || tab_index == -1)
{
    exit;
}
var s = keyboard_check(vk_shift) ? -1 : 1;
var tab_index_next = tab_index + s;
has_focus = false;
_change(input);
with (o_gui_instance_input)
{
    if (tab_index == tab_index_next)
    {
        alarm[2] = 1;
    }
}
