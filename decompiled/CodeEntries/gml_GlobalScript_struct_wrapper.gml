function add_keys_to_struct(arg0)
{
    if (!is_struct(arg0))
    {
        exit;
    }
    var __struct = arg0;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        mitem.key = mkey;
    }
}

function compare_struct(arg0, arg1)
{
    if (!is_struct(arg0))
    {
        return log("struct1 is not a struct.");
    }
    if (!is_struct(arg1))
    {
        return log("struct2 is not a struct.");
    }
    var __struct = arg0;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (is_undefined(variable_struct_get(arg1, mkey)))
        {
            return log("undefined", mkey);
        }
        if (is_numeric(mitem) && mitem != variable_struct_get(arg1, mkey))
        {
            return log("wrong", mkey, mitem, variable_struct_get(arg1, mkey));
        }
        if (is_struct(mitem))
        {
            compare_struct(mitem, variable_struct_get(arg1, mkey));
        }
    }
}

function get_default_value(arg0, arg1 = undefined)
{
    if (is_undefined(arg0))
    {
        return arg1;
    }
    return arg0;
}

function get_different_struct_keys_count(arg0, arg1)
{
    if (!is_struct(arg0) || !is_struct(arg1))
    {
        return 0;
    }
    var count = 0;
    if (get_struct_length(arg0) >= get_struct_length(arg1))
    {
        var __struct = arg0;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            if (!variable_struct_exists(arg1, mkey))
            {
                count++;
            }
        }
    }
    else
    {
        var __struct = arg1;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            if (!variable_struct_exists(arg0, mkey))
            {
                count++;
            }
        }
    }
    return count;
}

function get_same_struct_keys_count(arg0, arg1)
{
    if (!is_struct(arg0) || !is_struct(arg1))
    {
        return 0;
    }
    var count = 0;
    var __struct = arg0;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (variable_struct_exists(arg1, mkey))
        {
            count++;
        }
    }
    return count;
}

function add_struct_to_struct(arg0, arg1)
{
    if (!is_struct(arg0) || !is_struct(arg1))
    {
        exit;
    }
    var __struct = arg1;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (is_struct(mitem))
        {
            if (!is_struct(variable_struct_get(arg0, mkey)))
            {
                variable_struct_set(arg0, mkey, {});
            }
            add_struct_to_struct(variable_struct_get(arg0, mkey), mitem);
        }
        else if (is_numeric(mitem))
        {
            if (is_numeric(variable_struct_get(arg0, mkey)))
            {
                variable_struct_set(arg0, mkey, variable_struct_get(arg0, mkey) + mitem);
            }
            else
            {
                variable_struct_set(arg0, mkey, mitem);
            }
        }
    }
}

function append_struct_to_array(arg0, arg1)
{
    if (!is_array(arg0) || !is_struct(arg1))
    {
        exit;
    }
    var __struct = arg1;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        array_push(arg0, mitem);
    }
}

function add_struct_values(arg0, arg1 = 1)
{
    var res_new = {};
    var __struct = arg0;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (is_struct(mitem))
        {
            variable_struct_set(res_new, mkey, {});
            var __struct2 = mitem;
            var __prop_names2 = struct_get_names(__struct2);
            var __prop_len2 = array_length(__prop_names2);
            for (var __i2 = 0; __i2 < __prop_len2; __i2++)
            {
                var mkey2 = __prop_names2[__i2];
                var mitem2 = variable_struct_get(__struct2, mkey2);
                var new_value = mitem2 + arg1;
                variable_struct_set(variable_struct_get(res_new, mkey), mkey2, new_value);
            }
        }
        else
        {
            var new_value = mitem + arg1;
            variable_struct_set(res_new, mkey, new_value);
        }
    }
    return res_new;
}

function add_to_struct_value(arg0, arg1, arg2, arg3 = true)
{
    if (!is_struct(arg0))
    {
        arg0 = {};
    }
    set_struct_value(arg0, arg1, 0, arg3);
    variable_struct_set(arg0, arg1, variable_struct_get(arg0, arg1) + arg2);
    variable_struct_set(arg0, arg1, apply_max_number(variable_struct_get(arg0, arg1)));
}

function reduce_struct_value(arg0, arg1, arg2, arg3 = true)
{
    add_to_struct_value(arg0, arg1, -arg2, arg3);
}

function apply_struct_to_instance(arg0, arg1)
{
    if (!is_struct(arg0) || !instance_exists(arg1))
    {
        exit;
    }
    var __struct = arg0;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (is_struct(mitem) && variable_instance_exists(arg1, mkey))
        {
            var instance_struct = variable_instance_get(arg1, mkey);
            struct_apply_defaults(mitem, instance_struct);
            variable_instance_set(arg1, mkey, mitem);
        }
        else
        {
            variable_instance_set(arg1, mkey, mitem);
        }
    }
}

function apply_struct_to_struct(arg0, arg1, arg2 = false)
{
    if (!is_struct(arg0) || !is_struct(arg1))
    {
        exit;
    }
    var __struct = arg1;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (is_struct(mitem))
        {
            if (!is_struct(variable_struct_get(arg0, mkey)))
            {
                variable_struct_set(arg0, mkey, {});
            }
            apply_struct_to_struct(variable_struct_get(arg0, mkey), mitem);
        }
        else if (!arg2 || (arg2 && is_undefined(variable_struct_get(arg0, mkey))))
        {
            variable_struct_set(arg0, mkey, mitem);
        }
    }
}

function array_to_struct(arg0)
{
    var struct = {};
    var __array = arg0;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        variable_struct_set(struct, mitem, mitem);
    }
    return struct;
}

function array_to_struct_key(arg0)
{
    var struct = {};
    var __array = arg0;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        variable_struct_set(struct, mitem.key, mitem);
    }
    return struct;
}

function build_struct(arg0, arg1)
{
    var item = {};
    variable_struct_set(item, arg0, arg1);
    return item;
}

function maybe_build_struct(arg0)
{
    if (is_struct(arg0))
    {
        return arg0;
    }
    return {};
}

function call_array_struct(arg0, arg1)
{
    if (!is_array(arg0) || !is_string(arg1))
    {
        exit;
    }
    var __array = arg0;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (!is_struct(mitem) || is_undefined(variable_struct_get(mitem, arg1)))
        {
            continue;
        }
        variable_struct_get(mitem, arg1)();
    }
}

function call_collection(arg0, arg1)
{
    if (is_array(arg0))
    {
        call_array(arg0, arg1);
    }
    else if (is_struct(arg0))
    {
        call_struct(arg0, arg1);
    }
}

function call_array(arg0, arg1)
{
    if (!is_array(arg0) || !is_string(arg1))
    {
        exit;
    }
    var __array = arg0;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (is_undefined(variable_struct_get(mitem, arg1)))
        {
            continue;
        }
        variable_struct_get(mitem, arg1)();
    }
}

function call_struct(arg0, arg1)
{
    if (!is_struct(arg0) || !is_string(arg1))
    {
        exit;
    }
    var __struct = arg0;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (!is_struct(mitem))
        {
            continue;
        }
        if (is_undefined(variable_struct_get(mitem, arg1)))
        {
            continue;
        }
        variable_struct_get(mitem, arg1)();
    }
}

function call_struct_func(arg0, arg1)
{
    if (!is_struct(arg0))
    {
        return arg0;
    }
    var __struct = arg0;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (is_struct(mitem))
        {
            call_struct_func(mitem, arg1);
        }
        else if (is_array(arg1))
        {
            variable_struct_set(__struct, mkey, arg1[0](mitem, arg1[1]));
        }
        else
        {
            variable_struct_set(__struct, mkey, arg1(mitem));
        }
    }
}

function gdsv(arg0, arg1, arg2 = undefined)
{
    return get_default_struct_value(arg0, arg1, arg2);
}

function get_cloned_struct_value(arg0, arg1)
{
    if (!is_struct(arg0))
    {
        return false;
    }
    var clone = struct_clone(arg0);
    return variable_struct_get(clone, arg1);
}

function get_create_global_struct(arg0)
{
    if (variable_global_exists(arg0))
    {
        return variable_global_get(arg0);
    }
    return {};
}

function get_create_instance_struct(arg0)
{
    if (variable_instance_exists(id, arg0))
    {
        return variable_instance_get(id, arg0);
    }
    return {};
}

function get_default_instance_value(arg0, arg1, arg2 = undefined)
{
    if (!instance_exists(arg0) || !variable_instance_exists(arg0, arg1))
    {
        return arg2;
    }
    return variable_instance_get(arg0, arg1);
}

function get_default_struct_value(arg0, arg1, arg2 = undefined)
{
    if (!is_struct(arg0))
    {
        return arg2;
    }
    if (is_array(arg1))
    {
        return get_default_struct_value_deep(arg0, arg1, arg2);
    }
    if (variable_struct_exists(arg0, arg1))
    {
        return variable_struct_get(arg0, arg1);
    }
    return arg2;
}

function get_default_struct_value_number(arg0, arg1, arg2 = undefined)
{
    if (!is_struct(arg0))
    {
        return arg2;
    }
    var value = variable_struct_get(arg0, arg1);
    return is_numeric(value) ? value : arg2;
}

function get_default_struct_value_data(arg0, arg1, arg2 = undefined)
{
    if (!is_struct(arg0) || !is_struct(struct_get_from_hash(arg0, variable_get_hash("data"))))
    {
        return arg2;
    }
    if (variable_struct_exists(struct_get_from_hash(arg0, variable_get_hash("data")), arg1))
    {
        return variable_struct_get(struct_get_from_hash(arg0, variable_get_hash("data")), arg1);
    }
    return arg2;
}

function get_default_struct_value_not_undefined(arg0, arg1, arg2 = undefined)
{
    if (!is_struct(arg0))
    {
        return arg2;
    }
    if (is_array(arg1))
    {
        return get_default_struct_value_deep(arg0, arg1, arg2);
    }
    if (!is_undefined(variable_struct_get(arg0, arg1)))
    {
        return variable_struct_get(arg0, arg1);
    }
    return arg2;
}

function get_default_struct_value_deep(arg0, arg1, arg2 = undefined)
{
}

function get_default_struct_value_ext(arg0, arg1, arg2 = undefined, arg3 = arg0)
{
    var value = get_default_struct_value(arg0, arg1, arg2);
    return get_value_ext(arg3, value);
}

function get_default_struct_value_func(arg0, arg1, arg2 = undefined)
{
    var value = get_default_struct_value(arg0, arg1, arg2);
    if (is_undefined(value))
    {
        return arg2;
    }
    if (is_string(value))
    {
        return value;
    }
    if (is_callable(value))
    {
        return value();
    }
    return arg2;
}

function get_data_id(arg0)
{
    if (!is_struct(arg0))
    {
        return undefined;
    }
    if (!is_struct(struct_get_from_hash(arg0, variable_get_hash("data"))))
    {
        return undefined;
    }
    if (is_undefined(struct_get_from_hash(arg0.data, variable_get_hash("id"))))
    {
        return undefined;
    }
    return arg0.data.id;
}

function get_first_key_from_struct(arg0)
{
    return struct_get_first_key(arg0);
}

function get_key2_from_struct(arg0, arg1, arg2, arg3 = "")
{
    if (!is_struct(arg0) || is_undefined(arg1) || is_undefined(arg2))
    {
        return arg3;
    }
    var struct = variable_struct_get(arg0, arg1);
    if (!is_struct(struct))
    {
        return arg3;
    }
    var value = variable_struct_get(struct, arg2);
    if (is_undefined(value))
    {
        return arg3;
    }
    return value;
}

function get_struct_keys(arg0)
{
    return variable_struct_get_names(arg0);
}

function get_struct_length(arg0)
{
    if (!is_struct(arg0))
    {
        return 0;
    }
    return variable_struct_names_count(arg0);
}

function is_same_key(arg0, arg1)
{
    if (!is_struct(arg0) || !is_struct(arg1))
    {
        return false;
    }
    return arg0.key == arg1.key;
}

function multiply_struct_values(arg0, arg1 = 1, arg2 = false, arg3 = undefined)
{
    if (!is_struct(arg0))
    {
        return arg0;
    }
    var res_new = {};
    var __struct = arg0;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (is_struct(mitem))
        {
            variable_struct_set(res_new, mkey, {});
            var __struct2 = mitem;
            var __prop_names2 = struct_get_names(__struct2);
            var __prop_len2 = array_length(__prop_names2);
            for (var __i2 = 0; __i2 < __prop_len2; __i2++)
            {
                var mkey2 = __prop_names2[__i2];
                var mitem2 = variable_struct_get(__struct2, mkey2);
                if (is_struct(mitem2))
                {
                    variable_struct_set(variable_struct_get(res_new, mkey), mkey2, {});
                    var __struct3 = mitem2;
                    var __prop_names3 = struct_get_names(__struct3);
                    var __prop_len3 = array_length(__prop_names3);
                    for (var __i3 = 0; __i3 < __prop_len3; __i3++)
                    {
                        var mkey3 = __prop_names3[__i3];
                        var mitem3 = variable_struct_get(__struct3, mkey3);
                        var new_value = mitem3 * arg1;
                        if (arg2)
                        {
                            new_value = rround(new_value);
                        }
                        if (!is_undefined(arg3))
                        {
                            new_value = max(arg3, new_value);
                        }
                        variable_struct_set(variable_struct_get(variable_struct_get(res_new, mkey), mkey2), mkey3, new_value);
                    }
                }
                else
                {
                    var new_value = mitem2 * arg1;
                    if (arg2)
                    {
                        new_value = rround(new_value);
                    }
                    if (!is_undefined(arg3))
                    {
                        new_value = max(arg3, new_value);
                    }
                    variable_struct_set(variable_struct_get(res_new, mkey), mkey2, new_value);
                }
            }
        }
        else
        {
            var new_value = mitem * arg1;
            if (arg2)
            {
                new_value = rround(new_value);
            }
            if (!is_undefined(arg3))
            {
                new_value = max(arg3, new_value);
            }
            variable_struct_set(res_new, mkey, new_value);
        }
    }
    return res_new;
}

function multiply_struct_values_ref(arg0, arg1 = 1, arg2 = false, arg3 = undefined)
{
    if (!is_struct(arg0))
    {
        return arg0;
    }
    var __struct = arg0;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (is_struct(mitem))
        {
            multiply_struct_values_ref(mitem, arg1, arg2, arg3);
        }
        else
        {
            var new_value = mitem * arg1;
            if (arg2)
            {
                new_value = rround(new_value);
            }
            if (!is_undefined(arg3))
            {
                new_value = max(arg3, new_value);
            }
            variable_struct_set(arg0, mkey, new_value);
        }
    }
    return arg0;
}

function set_struct_values(arg0, arg1, arg2 = false)
{
    if (!is_struct(arg0))
    {
        exit;
    }
    var __struct = arg0;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (arg2 && is_struct(mitem))
        {
            set_struct_values(mitem, arg1, arg2);
        }
        else
        {
            variable_struct_set(arg0, mkey, arg1);
        }
    }
}

function struct_apply_defaults(arg0, arg1, arg2 = false)
{
    if (!is_struct(arg0) || !is_struct(arg1))
    {
        exit;
    }
    var defaults = json_parse(json_stringify(arg1));
    var default_keys = variable_struct_get_names(defaults);
    var len = array_length(default_keys);
    for (var i = 0; i < len; i++)
    {
        if (variable_struct_exists(arg0, @@array_get@@(default_keys, i)))
        {
            var struct_values = variable_struct_get(arg0, @@array_get@@(default_keys, i));
            var default_values = variable_struct_get(defaults, @@array_get@@(default_keys, i));
            if (is_struct(struct_values))
            {
                struct_apply_defaults(struct_values, default_values);
            }
        }
        else
        {
            variable_struct_set(arg0, @@array_get@@(default_keys, i), variable_struct_get(defaults, @@array_get@@(default_keys, i)));
        }
    }
}

function struct_clone(arg0)
{
    return json_parse(json_stringify(arg0));
}

function __struct_clone(arg0) constructor
{
    clone = {};
    var struct_keys = variable_struct_get_names(arg0);
    for (var i = 0; i < array_length(struct_keys); i++)
    {
        variable_struct_set(clone, @@array_get@@(struct_keys, i), variable_struct_get(arg0, @@array_get@@(struct_keys, i)));
    }
}

function struct_get_first_key(arg0)
{
    if (!is_struct(arg0))
    {
        return false;
    }
    var names = variable_struct_get_names(arg0);
    if (array_length(names) == 0)
    {
        return false;
    }
    return names[0];
}

function struct_get_keys(arg0)
{
    return variable_struct_get_names(arg0);
}

function struct_is_empty(arg0)
{
    if (!is_struct(arg0))
    {
        return true;
    }
    var __struct = arg0;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (!is_empty(mitem))
        {
            return false;
        }
    }
    return true;
}

function struct_map(arg0, arg1)
{
    if (!is_struct(arg0))
    {
        exit;
    }
    var __struct = arg0;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (is_struct(mitem))
        {
            struct_map(mitem, arg1);
        }
        else
        {
            arg1(mitem);
        }
    }
    return true;
}

function struct_merge(arg0, arg1)
{
    if (!is_struct(arg0) || !is_struct(arg1))
    {
        exit;
    }
    var __struct = arg1;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (is_struct(mitem))
        {
            var __struct2 = mitem;
            var __prop_names2 = struct_get_names(__struct2);
            var __prop_len2 = array_length(__prop_names2);
            for (var __i2 = 0; __i2 < __prop_len2; __i2++)
            {
                var mkey2 = __prop_names2[__i2];
                var mitem2 = variable_struct_get(__struct2, mkey2);
                if (is_struct(mitem2))
                {
                    var __struct3 = mitem2;
                    var __prop_names3 = struct_get_names(__struct3);
                    var __prop_len3 = array_length(__prop_names3);
                    for (var __i3 = 0; __i3 < __prop_len3; __i3++)
                    {
                        var mkey3 = __prop_names3[__i3];
                        var mitem3 = variable_struct_get(__struct3, mkey3);
                        add_to_struct_value(variable_struct_get(variable_struct_get(arg0, mkey), mkey2), mkey3, mitem3);
                    }
                }
                else
                {
                    add_to_struct_value(variable_struct_get(arg0, mkey), mkey2, mitem2);
                }
            }
        }
        else
        {
            add_to_struct_value(arg0, mkey, mitem);
        }
    }
}

function struct_random(arg0, arg1 = undefined)
{
    if (!is_struct(arg0))
    {
        exit;
    }
    var names = variable_struct_get_names(arg0);
    var size = array_length(names);
    var r = irandom_range(0, size - 1);
    var struct_item = variable_struct_get(arg0, @@array_get@@(names, r));
    if (is_array(arg1))
    {
        while (in_array(names[r], arg1))
        {
            r = irandom_range(0, size - 1);
            struct_item = variable_struct_get(arg0, @@array_get@@(names, r));
        }
    }
    return struct_item;
}

function struct_random_chance(arg0, arg1 = 1, arg2 = true, arg3 = undefined, arg4 = undefined)
{
    if (!is_struct(arg0))
    {
        exit;
    }
    var names = variable_struct_get_names(arg0);
    var size = array_length(names);
    var __prop_order = array_fill_index(size);
    __prop_order = array_shuffle(__prop_order);
    for (var __i = 0; __i < size; __i++)
    {
        var __sindex = __prop_order[__i];
        var mitem = variable_struct_get(arg0, @@array_get@@(names, __sindex));
        var chance = get_default_struct_value(mitem, "chance", arg1);
        if (!percent_chance(chance))
        {
            continue;
        }
        if (arg2 && is_struct(mitem) && is_callable(struct_get_from_hash(mitem, variable_get_hash("can_generate"))) && !mitem.can_generate(mitem))
        {
            continue;
        }
        return mitem;
    }
    return arg4;
}

function struct_random_chance_level(arg0, arg1 = 1, arg2 = 1, arg3 = 1, arg4 = true, arg5 = undefined, arg6 = undefined)
{
    if (!is_struct(arg0))
    {
        exit;
    }
    var chance_multiplier = get_default_struct_value(arg6, "chance_multiplier", 0);
    var names = variable_struct_get_names(arg0);
    var shuffle = get_default_struct_value(arg6, "shuffle", true);
    var size = array_length(names);
    var __prop_order = array_fill_index(size);
    if (shuffle)
    {
        __prop_order = array_shuffle(__prop_order);
    }
    for (var __i = 0; __i < size; __i++)
    {
        var __sindex = __prop_order[__i];
        var mitem = variable_struct_get(arg0, @@array_get@@(names, __sindex));
        var chance = get_default_struct_value(mitem, "chance", arg1);
        if (!is_numeric(chance))
        {
            chance = arg1;
        }
        chance *= (1 + chance_multiplier);
        if (!percent_chance(chance * 100))
        {
            continue;
        }
        var item_level = get_default_struct_value(mitem, "min_level", arg3);
        if (arg2 < item_level)
        {
            continue;
        }
        if (arg4 && is_struct(mitem) && is_callable(struct_get_from_hash(mitem, variable_get_hash("can_generate"))) && !mitem.can_generate(mitem))
        {
            continue;
        }
        return mitem;
    }
    return undefined;
}

function array_random_chance_level(arg0, arg1 = 1, arg2 = 1, arg3 = 1, arg4 = true, arg5 = undefined, arg6 = undefined, arg7 = undefined, arg8 = 0, arg9 = undefined)
{
    if (!is_array(arg0))
    {
        exit;
    }
    var chance_multiplier = get_default_struct_value(arg6, "chance_multiplier", arg8);
    var shuffle = get_default_struct_value(arg6, "shuffle", true);
    var size = array_length(arg0);
    var __prop_order = array_fill_index(size);
    if (shuffle)
    {
        __prop_order = array_shuffle(__prop_order);
    }
    var has_exclude_keys = is_array(arg5) && array_length(arg5) > 0;
    for (var __i = 0; __i < size; __i++)
    {
        var __sindex = __prop_order[__i];
        var mitem = arg0[__sindex];
        if (has_exclude_keys && is_struct(mitem) && array_contains(arg5, struct_get_from_hash(mitem, variable_get_hash("key"))))
        {
            continue;
        }
        var chance = get_default_struct_value(mitem, "chance", arg1);
        if (!is_numeric(chance))
        {
            chance = arg1;
        }
        if (is_numeric(arg9))
        {
            chance = arg9;
        }
        chance *= (1 + chance_multiplier);
        if (!percent_chance(chance * 100))
        {
            continue;
        }
        var item_level = get_default_struct_value(mitem, "min_level", arg3);
        if (arg2 < item_level)
        {
            continue;
        }
        if (arg4 && is_struct(mitem) && is_callable(struct_get_from_hash(mitem, variable_get_hash("can_generate"))) && !mitem.can_generate(mitem))
        {
            continue;
        }
        return mitem;
    }
    return arg7;
}

function get_random_rarity(arg0, arg1 = 0, arg2 = undefined, arg3 = undefined)
{
    if (!is_array(arg0))
    {
        exit;
    }
    var __array = arg0;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        var chance = get_default_struct_value(mitem, "chance", 1);
        if (!is_numeric(chance))
        {
            chance = 1;
        }
        chance += get_default_struct_value(arg3, struct_get_from_hash(mitem, variable_get_hash("key")), 0);
        chance *= (1 + arg1);
        var chance_multiplier_single = get_default_struct_value(arg2, struct_get_from_hash(mitem, variable_get_hash("key")), 0);
        chance *= (1 + chance_multiplier_single);
        if (!percent_chance(chance * 100))
        {
            continue;
        }
        return mitem;
    }
    return array_last(arg0);
}

function struct_random_key(arg0)
{
    if (!is_struct(arg0))
    {
        exit;
    }
    var names = variable_struct_get_names(arg0);
    var size = array_length(names);
    if (size == 0)
    {
        exit;
    }
    var r = irandom_range(0, size - 1);
    return @@array_get@@(names, r);
}

function set_struct_value(arg0, arg1, arg2, arg3 = false)
{
    if (!is_struct(arg0))
    {
        exit;
    }
    if (arg3 && !is_undefined(variable_struct_get(arg0, arg1)))
    {
        exit;
    }
    variable_struct_set(arg0, arg1, arg2);
}

function sort_resources_struct_to_array(arg0, arg1 = global.resources)
{
    if (!is_struct(arg0))
    {
        return [];
    }
    var res_struct_tmp = {};
    var ret_array = [];
    var tmp_array = [];
    var __struct = arg0;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        var index = get_default_struct_value(variable_struct_get(arg1, mkey), "index", 0);
        variable_struct_set(res_struct_tmp, mkey, 
        {
            index: index,
            key: mkey,
            value: mitem
        });
        array_push(tmp_array, variable_struct_get(res_struct_tmp, mkey));
    }
    array_sort(tmp_array, function(arg0, arg1)
    {
        return arg0.index - arg1.index;
    });
    var __array = tmp_array;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        array_push(ret_array, build_struct(mitem.key, mitem.value));
    }
    return ret_array;
}

function sort_resources_struct_to_array_keys_only(arg0, arg1 = global.resources)
{
    if (!is_struct(arg0))
    {
        return [];
    }
    var res_struct_tmp = {};
    var ret_array = [];
    var tmp_array = [];
    var __struct = arg0;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        var index = get_default_struct_value(variable_struct_get(arg1, mkey), "index", 0);
        variable_struct_set(res_struct_tmp, mkey, 
        {
            index: index,
            key: mkey,
            value: mitem
        });
        array_push(tmp_array, variable_struct_get(res_struct_tmp, mkey));
    }
    array_sort(tmp_array, function(arg0, arg1)
    {
        return arg0.index - arg1.index;
    });
    var __array = tmp_array;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        array_push(ret_array, mitem.key);
    }
    return ret_array;
}

function struct_to_array(arg0)
{
    if (!is_struct(arg0))
    {
        return arg0;
    }
    var ret_array = [];
    var __struct = arg0;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        array_push(ret_array, mitem);
    }
    return ret_array;
}

function struct_to_shuffled_array(arg0)
{
    if (!is_struct(arg0))
    {
        return [];
    }
    var ret_array = struct_to_array(arg0);
    ret_array = array_shuffle(ret_array);
    return ret_array;
}

function struct_to_sorted_array(arg0, arg1 = true)
{
    if (!is_struct(arg0))
    {
        return [];
    }
    var ret_array = [];
    var names = variable_struct_get_names(arg0);
    var i = 0;
    var len = array_length(names);
    while (i < len)
    {
        array_push(ret_array, variable_struct_get(arg0, @@array_get@@(names, i)));
        i++;
    }
    sort_array_by_index(ret_array, arg1);
    return ret_array;
}

function struct_to_sorted_array_by(arg0, arg1, arg2 = true)
{
    if (!is_struct(arg0))
    {
        return [];
    }
    var ret_array = struct_to_array(arg0);
    sort_array_by(ret_array, arg1, arg2);
    return ret_array;
}

function struct_to_sorted_array_key(arg0)
{
    if (!is_struct(arg0))
    {
        return [];
    }
    var ret_array = struct_to_array(arg0);
    sort_array_by_key(ret_array, true);
    return ret_array;
}
