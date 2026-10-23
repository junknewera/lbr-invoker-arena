alpha = global.is_mobile ? 0.99 : 0.3;
if (global.debug)
{
    alpha = 0.3;
}
can_destroy = false;
frame_skip = 0;
frame_skip_refresh = 10;
text = __("AFK mode");
if (!global.is_mobile)
{
    text += ("\n" + __s("Press %s to return", "Escape"));
}
text_pos = 
{
    x: 0,
    y: 0
};
text_pos_timer = sec(10);

change_text_pos = function()
{
    text_pos = 
    {
        x: random_range(100, global.gui_width - 400),
        y: random_range(100, global.gui_height - 100)
    };
};

change_text_pos();
delay("overlay_timer", sec(1), function()
{
    with (o_overlay)
    {
        can_destroy = true;
    }
});
alarm[0] = text_pos_timer;
