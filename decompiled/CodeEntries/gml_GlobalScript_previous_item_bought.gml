function previous_item_bought(arg0, arg1)
{
    if ((arg1 - 1) <= 0)
    {
        return true;
    }
    var _item = arg0[arg1 - 1];
    return get_upgrade_count(_item) > 0;
}
