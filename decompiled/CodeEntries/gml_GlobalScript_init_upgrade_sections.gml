function init_upgrade_sections()
{
    global.upgrade_sections_array = ["artifacts", "borbventure", "boost", "cards", "challenges", "community_leaves", "crafted_leaves", "death_book", "dice", "equipment", "event", "fish", "general", "guild", "harbor", "house", "journeys", "milestones", "mine", "plants", "pets", "quarks", "relics", "season_pass", "shadow", "shops", "shops_early", "shops_late", "scrolls", "supporter", "unique", "weapon"];
    global.upgrade_sections = array_to_struct(global.upgrade_sections_array);
    global.upgrade_sections_values = {};
    global.upgrade_sections_values_added = {};
    global.upgrade_sections_upgrades = ["blower", "borbventure", "boost", "cards", "craft", "dice", "dlc", "event", "fish", "gem_leaves", "guild", "harbor", "journeys", "milestone", "mine", "plants", "pets", "quarks", "relics", "scroll", "shadow", "soul", "supporter", "unique"];
    global.upgrade_sections_cache = {};
    global.upgrade_sections_cache_refresh = {};
    var __array = global.upgrade_sections_array;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        variable_struct_set(global.upgrade_sections_cache_refresh, mitem, true);
        variable_struct_set(global.upgrade_sections_values_added, mitem, false);
    }
}
