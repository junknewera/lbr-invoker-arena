function get_max_active_scroll_count()
{
    return global.game_settings.max_active_scrolls + get_upgrade_attribute_value(global.upgrade_attributes.scrolls_active_max);
}
