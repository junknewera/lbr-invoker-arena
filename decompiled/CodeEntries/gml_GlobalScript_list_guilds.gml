function list_guilds(arg0, arg1, arg2)
{
    if (!is_array(arg2))
    {
        return 0;
    }
    var __array = arg2;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        var members_count = is_struct(mitem.cache) ? mitem.cache.members_count : "-";
        var text = __s("ID: %s | Name: %s | Level: %s | Members: %s | Status: %s", mitem.id, mitem.name, mitem.level, members_count, iif(mitem.private, __("Private"), __("Public")));
        draw_text(arg0, arg1 + (gui_col_y(2.5) * __i), text);
        if (is_undefined(global.cloud_data.guild))
        {
            var can_join = has_enough_resources(global.cloud_data.guild_settings.join_guild_costs) && is_undefined(get_async_data_by_name("guild_join")) && !mitem.private;
            if (gui_button_tl(arg0 + gui_col_x(12), (arg1 + (gui_col_y(2.5) * __i)) - 15, __s("Join (%s)", format_resources_text(global.cloud_data.guild_settings.join_guild_costs)), can_join, undefined, undefined, 
            {
                sprite: spr_resource_honor
            }))
            {
                join_guild(mitem.id);
            }
        }
    }
    return (gui_col_y(2.5) * array_length(arg2)) + 50;
}
