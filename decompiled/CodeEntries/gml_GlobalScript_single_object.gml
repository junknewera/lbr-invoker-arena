function single_object(arg0 = true)
{
    if (instance_number(object_index) > 1)
    {
        instance_destroy(id, arg0);
        return true;
    }
    return false;
}
