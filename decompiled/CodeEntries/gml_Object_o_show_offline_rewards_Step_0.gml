offline_seconds = offline_seconds_start;
if (keyboard_check(vk_shift))
{
    offline_seconds = 3600;
}
if (keyboard_check(vk_control))
{
    offline_seconds = 86400;
}
if (keyboard_check(vk_alt))
{
    offline_seconds = 259200;
}
if (keyboard_check_released(vk_shift) || keyboard_check_released(vk_control) || keyboard_check_released(vk_alt) || keyboard_check_pressed(vk_shift) || keyboard_check_pressed(vk_control) || keyboard_check_pressed(vk_alt))
{
    offline_rewards = get_offline_rewards(offline_seconds, true, false, false);
    alarm[1] = 1;
}
