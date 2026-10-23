function join_guild(arg0)
{
    dec_resources(global.cloud_data.guild_settings.join_guild_costs);
    post_to_cloud("guild", "join", 
    {
        guild_id: arg0
    }, function(arg0)
    {
        set_guild(arg0.guild);
        open_dialog("guilds");
        set_async_response_text("");
        notify(arg0.text);
        variable_struct_remove(global.await_async_actions, "guild_joining");
    }, function(arg0)
    {
        add_resources(global.cloud_data.guild_settings.join_guild_costs, false, true);
        set_async_response_text(arg0);
        variable_struct_remove(global.await_async_actions, "guild_joining");
    });
}
