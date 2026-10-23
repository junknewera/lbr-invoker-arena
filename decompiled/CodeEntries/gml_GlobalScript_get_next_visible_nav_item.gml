function get_next_visible_nav_item(arg0, arg1, arg2)
{
    var nav_items_length = array_length(arg0);
    for (var i = 0; i < nav_items_length; i++)
    {
        var next_nav_item = get_next_array_item(arg0, arg1 + (i * arg2), arg2);
        if (is_struct(next_nav_item) && next_nav_item.check_flag)
        {
            return next_nav_item;
        }
    }
    return undefined;
}
