function get_honor_xp(arg0)
{
    if (!is_struct(global.cloud_data.guild_settings) || is_undefined(struct_get_from_hash(global.cloud_data.guild_settings, variable_get_hash("xp_per_honor"))))
    {
        return 0;
    }
    return arg0 * global.cloud_data.guild_settings.xp_per_honor;
}
