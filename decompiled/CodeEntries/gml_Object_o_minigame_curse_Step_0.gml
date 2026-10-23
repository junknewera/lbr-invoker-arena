event_inherited();
if (is_state(UnknownEnum.Value_4) && (keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left)))
{
    trigger();
}
if (is_state(UnknownEnum.Value_2))
{
    level_timer++;
}

enum UnknownEnum
{
    Value_2 = 2,
    Value_4 = 4
}
