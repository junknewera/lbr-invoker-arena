function maybe_create_instance(arg0, arg1, arg2, arg3, arg4)
{
    if (instance_exists(arg3))
    {
        exit;
    }
    return instance_create_layer(arg0, arg1, arg2, arg3, arg4);
}

function set_local_vars(arg0)
{
    if (!is_struct(arg0))
    {
        exit;
    }
    var _props_names = variable_struct_get_names(arg0);
    var i = 0;
    var len = array_length(_props_names);
    while (i < len)
    {
        variable_struct_set(self, _props_names[i], variable_struct_get(arg0, _props_names[i]));
        i++;
    }
}
