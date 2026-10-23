function drop_random_scroll(arg0 = undefined, arg1 = undefined)
{
    var drop_item = get_random_droppable_scroll();
    if (!is_struct(drop_item))
    {
        exit;
    }
    return spawn_scroll(drop_item, arg0, arg1);
}
