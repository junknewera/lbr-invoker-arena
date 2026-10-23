if (++global.mouse_click_timer > global.mouse_click_duration)
{
    global.mouse_click_triggered = true;
    if (++global.mouse_click_delay_timer > 1)
    {
        global.mouse_click_triggered = false;
        global.mouse_click_timer = 0;
        global.mouse_click_delay_timer = 0;
    }
}
