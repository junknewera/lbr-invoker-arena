function fx_sprite(arg0, arg1, arg2 = false)
{
    if (!get_option(global.options.draw_resource_text_rewards))
    {
        exit;
    }
    fx_text(x, y, arg1, arg0, arg2);
}
