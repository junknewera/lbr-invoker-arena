function get_random_unlocked_resource(arg0 = global.resources_leaves)
{
    var resources = get_unlocked_resources(arg0);
    if (array_length(resources) == 0)
    {
        return false;
    }
    return array_random_item(resources);
}
