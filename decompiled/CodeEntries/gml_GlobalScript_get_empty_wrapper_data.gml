function get_empty_wrapper_data()
{
    var wrapper_data = 
    {
        achievements: {},
        autobuy_priorities: global.autobuy_priorities,
        challenges: {},
        community_leaves: {},
        current_profile: global.current_profile,
        house_items: {},
        lore: {},
        profiles: {},
        shops_persist: {},
        stats: {},
        time: get_time_object(),
        time_stats: 
        {
            earliest: get_time_object(),
            latest: get_time_object(),
            start: get_time_object()
        },
        version: global.game_version,
        version_int: 2229.07
    };
    return struct_clone(wrapper_data);
}
