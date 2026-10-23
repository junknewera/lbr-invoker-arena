function refresh_upgrade_cache(arg0)
{
    variable_struct_set(global.upgrade_sections_cache, arg0, {});
    variable_struct_set(global.upgrade_sections_cache_refresh, arg0, true);
}
