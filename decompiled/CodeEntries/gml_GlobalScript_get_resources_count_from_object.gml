function get_resources_count_from_object(arg0)
{
    if (!is_struct(arg0))
    {
        return 0;
    }
    var res_value = _sum(arg0, function(arg0, arg1)
    {
        return arg0;
    }, false);
    return res_value;
}
