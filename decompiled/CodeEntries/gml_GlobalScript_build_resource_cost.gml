function build_resource_cost(arg0, arg1, arg2 = undefined)
{
    var cost = {};
    variable_struct_set(cost, arg0.key, arg1);
    if (!is_undefined(arg2))
    {
        arg1 = arg2(arg1);
    }
    return cost;
}
