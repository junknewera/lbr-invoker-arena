var __array = nav_items_tl;
var __prop_len = array_length(__array);
for (var __i = 0; __i < __prop_len; __i++)
{
    var mitem = __array[__i];
    current_gui_item = mitem;
    mitem.check_flag = call_method(mitem, mitem.check);
    mitem.has_badge = call_method(mitem, mitem.check_badge);
    if (is_unlocked_nav(mitem.key))
    {
        mitem.check_flag = true;
    }
}
__array = nav_items_bl;
__prop_len = array_length(__array);
for (var __i = 0; __i < __prop_len; __i++)
{
    var mitem = __array[__i];
    current_gui_item = mitem;
    mitem.check_flag = call_method(mitem, mitem.check);
    mitem.has_badge = call_method(mitem, mitem.check_badge);
    if (is_unlocked_nav(mitem.key))
    {
        mitem.check_flag = true;
    }
}
alarm[0] = sec(1);
