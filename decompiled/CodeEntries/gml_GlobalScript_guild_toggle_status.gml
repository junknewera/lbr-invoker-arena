function guild_toggle_status()
{
    post_to_cloud("guild", "toggle_status", undefined, function(arg0)
    {
        notify(arg0.text);
    }, undefined, undefined, sec(5));
}
