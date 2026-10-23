function previous_item_check(arg0, arg1)
{
    if ((arg1 - 1) <= 0)
    {
        return true;
    }
    var _item = arg0[arg1 - 1];
    return _item.check();
}
