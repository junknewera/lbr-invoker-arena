function create_random_collection_struct(arg0 = [], arg1 = 1)
{
    var res = {};
    if (array_length(arg0) == 0)
    {
        return res;
    }
    repeat (arg1)
    {
        var item = array_random_item(arg0);
        if (!is_struct(item) || is_undefined(struct_get_from_hash(item, variable_get_hash("key"))))
        {
            continue;
        }
        add_to_struct_value(res, item.key, 1);
    }
    return res;
}
