function add_resources_leafscended(arg0, arg1 = 1)
{
    if (!is_struct(arg0))
    {
        exit;
    }
    add_resources(arg0, undefined, undefined, undefined, undefined, undefined, undefined, 
    {
        leafscend_level: arg1
    });
}
