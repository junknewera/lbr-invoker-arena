function get_resource(arg0)
{
    if (is_string(arg0))
    {
        if (is_struct(variable_struct_get(global.materials, arg0)))
        {
            return variable_struct_get(global.materials, arg0);
        }
        else if (is_struct(variable_struct_get(global.resources, arg0)))
        {
            return variable_struct_get(global.resources, arg0);
        }
    }
    return undefined;
}

function get_resource_collection(arg0)
{
    if (is_string(arg0))
    {
        if (is_struct(variable_struct_get(global.materials, arg0)))
        {
            return global.materials;
        }
        else if (is_struct(variable_struct_get(global.resources, arg0)))
        {
            return global.resources;
        }
    }
    return undefined;
}

function get_resource_type(arg0)
{
    if (is_string(arg0))
    {
        if (is_struct(variable_struct_get(global.materials, arg0)))
        {
            return global.cost_types.materials;
        }
        else if (is_struct(variable_struct_get(global.resources, arg0)))
        {
            return global.cost_types.resources;
        }
    }
    return undefined;
}
