function resource_is_collected(arg0)
{
    return arg0.data.collected > 0;
}

function resource_is_collected_total(arg0)
{
    return arg0.data.collected_total > 0;
}

function resource_is_unlocked(arg0)
{
    return variable_struct_get(global.resources, arg0).data.unlocked;
}
