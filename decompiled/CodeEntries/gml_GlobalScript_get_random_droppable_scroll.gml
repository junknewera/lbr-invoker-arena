function get_random_droppable_scroll()
{
    var drop_array = get_droppable_scrolls();
    if (array_length(drop_array) == 0)
    {
        return false;
    }
    var drop_item = array_random_item(drop_array);
    return drop_item;
}
