function get_value_ext(arg0, arg1, arg2 = undefined)
{
    if (is_undefined(arg1))
    {
        return arg1;
    }
    else if (is_bool(arg1))
    {
        return arg1;
    }
    else if (is_string(arg1))
    {
        return arg1;
    }
    else if (is_method(arg1))
    {
        if (!is_undefined(arg0) && arg0 != -1)
        {
            if (typeof(arg0) == "ref" && !instance_exists(arg0))
            {
                return arg1(arg2);
            }
            var func = method(arg0, arg1);
            return func(arg2);
        }
        return arg1(arg2);
    }
    else if (is_array(arg1))
    {
        var func = maybe_add_method(arg0, arg1);
        if (array_length(arg1) > 3)
        {
            return func(arg1[1], arg1[2], arg1[3]);
        }
        else if (array_length(arg1) > 2)
        {
            return func(arg1[1], arg1[2]);
        }
        else if (array_length(arg1) > 1)
        {
            return func(arg1[1]);
        }
        else
        {
            return func();
        }
    }
    return arg1;
}
