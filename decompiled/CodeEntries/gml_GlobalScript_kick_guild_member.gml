function kick_guild_member(arg0)
{
    post_to_cloud("guild", "kick", 
    {
        member_id: arg0
    }, function(arg0)
    {
        notify(__s("Member %s has been kicked from the guild.", arg0.wp_user_id));
    }, notify_error);
}
