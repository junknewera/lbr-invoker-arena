function check_drop_scroll()
{
    if (get_upgrade_count(global.shops.blc.unlock_scrolls) == 0 || !can_drop_scroll())
    {
        exit;
    }
    var r = 0.5 + (floor(global.current_tower_floor / 100) * 0.5) + global.upgrade_attributes.scroll_drop_chance;
    if (!percent_chance(r))
    {
        exit;
    }
    drop_random_scroll();
}
