function get_instances_in_range(arg0, arg1)
{
    var instances = ds_list_create();
    with (arg0)
    {
        if (distance_to_object(other) <= arg1)
        {
            ds_list_add(instances, id);
        }
    }
    return instances;
}
