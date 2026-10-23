function guild_request_deny(arg0)
{
    post_to_cloud("guild", "request_deny", 
    {
        _user_id: arg0
    }, notify, notify_error);
}
