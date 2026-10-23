function is_guild_owner()
{
    if (is_undefined(global.cloud_data.guild))
    {
        return false;
    }
    return global.cloud_data.user_id == global.cloud_data.guild.owner_id;
}
