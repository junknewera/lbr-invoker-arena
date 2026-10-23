function is_ds_list(arg0)
{
    return typeof(arg0) == "number" && ds_exists(arg0, ds_type_list);
}

function is_ds_map(arg0)
{
    return typeof(arg0) == "number" && ds_exists(arg0, ds_type_map);
}
