function get_autocollect_curses()
{
    var curses = get_default_struct_value(global.cache, "autocollect_curse_count", 0);
    return curses;
}
