function prepare_resource_value(arg0, arg1)
{
    var value_new = apply_max_number(arg1);
    value_new = arg0.decimal ? value_new : floor(value_new);
    return value_new;
}
