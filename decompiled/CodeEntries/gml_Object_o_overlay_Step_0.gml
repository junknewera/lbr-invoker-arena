if (!global.is_opera)
{
    draw_enable_drawevent((++frame_skip % frame_skip_refresh) == 0);
}
if (can_destroy)
{
    if (global.is_mobile)
    {
        if (any_user_input())
        {
            instance_destroy();
        }
    }
    else if (any_user_input(true) || keyboard_check(vk_escape))
    {
        instance_destroy();
    }
}
