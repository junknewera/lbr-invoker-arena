function is_any_event_active()
{
    var __struct = global.events;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (is_event_active(mitem))
        {
            return true;
        }
    }
    return false;
}
