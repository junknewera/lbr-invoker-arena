function get_unlocked_resources(arg0)
{
    if (is_undefined(arg0))
    {
        arg0 = global.resources_array;
    }
    var resources = [];
    var __array = arg0;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (mitem.data.unlocked)
        {
            array_push(resources, mitem);
        }
    }
    return resources;
}
