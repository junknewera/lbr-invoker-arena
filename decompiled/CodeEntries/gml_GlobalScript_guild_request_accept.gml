function guild_request_accept(arg0)
{
    post_to_cloud("guild", "request_accept", 
    {
        _user_id: arg0
    }, notify, notify_error);
}
