function array_lowest(arg0)
{
    if (!is_array(arg0) || array_length(arg0) == 0)
    {
        return 0;
    }
    var value = arg0[0];
    var __array = arg0;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        value = min(value, mitem);
    }
    return value;
}

function array_append(arg0, arg1)
{
    array_push(arg0, arg1);
}

function array_append_flat(arg0, arg1)
{
    if (!is_array(arg1))
    {
        exit;
    }
    var __array = arg1;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        array_push(arg0, mitem);
    }
}

function array_clear(arg0)
{
    if (!is_array(arg0))
    {
        exit;
    }
    array_delete(arg0, 0, array_length(arg0));
}

function array_fill_index(arg0)
{
    var arr = [];
    for (var i = 0; i < arg0; i++)
    {
        array_push(arr, i);
    }
    return arr;
}

function array_filter_custom(arg0, arg1)
{
    var result = [];
    var length = array_length(arg0);
    for (var i = 0; i < length; i++)
    {
        var filter_func_method = arg1;
        if (is_string(arg1) && is_struct(@@array_get@@(arg0, i)) && !is_undefined(variable_struct_get(@@array_get@@(arg0, i), arg1)))
        {
            filter_func_method = variable_struct_get(@@array_get@@(arg0, i), arg1);
        }
        var func = maybe_add_method(@@array_get@@(arg0, i), filter_func_method);
        if (func(@@array_get@@(arg0, i)))
        {
            array_push(result, @@array_get@@(arg0, i));
        }
    }
    return result;
}

function array_filter_by_key(arg0, arg1, arg2)
{
    var result = [];
    var length = array_length(arg0);
    var __array = arg0;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        var value = get_default_struct_value(mitem, arg1, undefined);
        if (value == arg2)
        {
            array_push(result, mitem);
        }
    }
    return result;
}

function array_insert_first(arg0, arg1)
{
    array_insert(arg0, 0, arg1);
}

function array_inverse(arg0)
{
    var a = [];
    var __array = arg0;
    var __prop_len = array_length(__array);
    var __i = __prop_len - 1;
    while (__i >= 0)
    {
        var mitem = __array[__i];
        var __ireal = __prop_len - 1 - __i;
        array_push(a, mitem);
        __i--;
    }
    return a;
}

function array_key_in_array(arg0, arg1)
{
    return _any(arg0, function(arg0, arg1, arg2)
    {
        return _any(arg2, function(arg0, arg1, arg2)
        {
            var key_needle = arg0;
            var key_haystack = arg2;
            if (is_struct(arg0) && !is_undefined(struct_get_from_hash(arg0, variable_get_hash("key"))))
            {
                key_needle = arg0.key;
            }
            if (is_struct(arg2) && !is_undefined(struct_get_from_hash(arg2, variable_get_hash("key"))))
            {
                key_haystack = arg2.key;
            }
            return key_needle == key_haystack;
        }, arg0);
    }, arg1);
}

function all_array_keys_present(arg0, arg1)
{
    if (!is_array(arg0) || !is_array(arg1))
    {
        return false;
    }
    var __array = arg0;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (!in_array(mitem, arg1))
        {
            return false;
        }
    }
    return true;
}

function array_last(arg0)
{
    if (!is_array(arg0) || array_length(arg0) == 0)
    {
        return undefined;
    }
    return @@array_get@@(arg0, array_length(arg0) - 1);
}

function array_random_item(arg0, arg1 = undefined)
{
    if (!is_array(arg0) || array_length(arg0) == 0)
    {
        return "";
    }
    if (is_undefined(arg1))
    {
        arg1 = array_length(arg0);
    }
    var r = irandom_range(0, arg1 - 1);
    return arg0[r];
}

function array_random_item_check_func(arg0, arg1, arg2 = undefined)
{
    if (!is_array(arg0) || array_length(arg0) == 0)
    {
        return undefined;
    }
    var __array = arg0;
    var __prop_len = array_length(__array);
    __array = array_shuffle(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var __sindex = __i;
        var mitem = __array[__i];
        if (is_undefined(variable_struct_get(mitem, arg1)))
        {
            continue;
        }
        if (variable_struct_get(mitem, arg1)(arg2))
        {
            return mitem;
        }
    }
    return undefined;
}

function array_random_item_check_custom_func(arg0, arg1, arg2 = undefined)
{
    if (!is_array(arg0) || array_length(arg0) == 0)
    {
        return undefined;
    }
    var __array = arg0;
    var __prop_len = array_length(__array);
    __array = array_shuffle(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var __sindex = __i;
        var mitem = __array[__i];
        if (arg1(mitem, arg2))
        {
            return mitem;
        }
    }
    return undefined;
}

function array_random_item_check_max_count(arg0)
{
    if (!is_array(arg0) || array_length(arg0) == 0)
    {
        return undefined;
    }
    var __array = arg0;
    var __prop_len = array_length(__array);
    __array = array_shuffle(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var __sindex = __i;
        var mitem = __array[__i];
        if (is_struct(mitem))
        {
            if (mitem.max_count > 0 && mitem.data.count >= mitem.max_count)
            {
                continue;
            }
            return mitem;
        }
        else if (mitem == 0)
        {
        }
        else
        {
            return mitem;
        }
    }
    return undefined;
}

function array_random_item_exclude(arg0, arg1, arg2 = undefined, arg3 = false)
{
    if (!is_array(arg0) || array_length(arg0) == 0)
    {
        return undefined;
    }
    if (is_undefined(arg2))
    {
        arg2 = array_length(arg0);
    }
    var n = 0;
    var n_max = 100;
    while (n < n_max)
    {
        var r = irandom_range(0, arg2 - 1);
        if (!in_array(arg0[r], arg1))
        {
            if (arg3 && is_struct(arg0[r]) && is_callable(struct_get_from_hash(@@array_get@@(arg0, r), variable_get_hash("can_generate"))) && !arg0[r].can_generate())
            {
                continue;
            }
            return arg0[r];
        }
        n++;
    }
    return undefined;
}

function array_random_items(arg0, arg1 = 1, arg2 = false)
{
    if (!is_array(arg0) || array_length(arg0) == 0)
    {
        exit;
    }
    var size = array_length(arg0);
    arg1 = min(arg1, size);
    var return_array = [];
    if (!arg2)
    {
        repeat (arg1)
        {
            array_push(return_array, arg0[irandom_range(0, size - 1)]);
        }
        return return_array;
    }
    if (arg1 <= (size * 0.5))
    {
        var rmap = {};
        repeat (arg1)
        {
            var safety_counter = 0;
            var r;
            do
            {
                r = irandom_range(0, size - 1);
                safety_counter++;
            }
            until (is_undefined(variable_struct_get(rmap, r)) || safety_counter >= 10000);
            variable_struct_set(rmap, r, 1);
            array_push(return_array, arg0[r]);
        }
    }
    else
    {
        var temp_array = [];
        array_copy(temp_array, 0, arg0, 0, size);
        for (var i = 0; i < arg1; i++)
        {
            var j = irandom_range(i, size - 1);
            var temp = temp_array[i];
            temp_array[i] = temp_array[j];
            temp_array[j] = temp;
            array_push(return_array, temp_array[i]);
        }
    }
    return return_array;
}

function array_random_item_key(arg0)
{
    if (!is_array(arg0))
    {
        exit;
    }
    var item = array_random_item(arg0);
    if (!is_struct(item))
    {
        exit;
    }
    return struct_get_from_hash(item, variable_get_hash("key"));
}

function array_shuffle2(arg0)
{
    var size = array_length(arg0);
    for (var i = 0; i < size; i += 1)
    {
        var j = irandom_range(i, size - 1);
        if (i != j)
        {
            var k = @@array_get@@(arg0, i);
            array_set(arg0, i, @@array_get@@(arg0, j));
            array_set(arg0, j, k);
        }
    }
    return arg0;
}

function clear_array(arg0)
{
    if (!is_array(arg0))
    {
        return false;
    }
    var __array = arg0;
    var __prop_len = array_length(__array);
    var __i = __prop_len - 1;
    while (__i >= 0)
    {
        var mitem = __array[__i];
        var __ireal = __prop_len - 1 - __i;
        array_delete(arg0, __i, 1);
        __i--;
    }
    return true;
}

function concat(arg0, arg1 = "\n")
{
    if (is_array(arg0))
    {
        return implode(arg1, arg0);
    }
}

function default_sort_func(arg0, arg1)
{
    return arg0 < arg1;
}

function default_sort_func_asc(arg0, arg1)
{
    return arg0 > arg1;
}

function default_sort_func2(arg0, arg1)
{
    return arg0 - arg1;
}

function default_sort_func2_asc(arg0, arg1)
{
    return arg1 - arg0;
}

function in_array(arg0, arg1, arg2 = "key", arg3 = "key")
{
    if (!is_array(arg1))
    {
        return false;
    }
    var len = array_length(arg1);
    for (var i = 0; i < len; i++)
    {
        var needle = arg0;
        var haystack_row = arg1[i];
        if (is_struct(arg0))
        {
            needle = get_default_struct_value(arg0, arg2, needle);
        }
        if (is_struct(arg1[i]))
        {
            haystack_row = get_default_struct_value(arg1[i], arg3, haystack_row);
        }
        if (needle == haystack_row)
        {
            return true;
        }
    }
    return false;
}

function sort_func_auto_upgrade(arg0, arg1)
{
    var prio_a = arg0.data.auto_upgrade_prio_user;
    var prio_b = arg1.data.auto_upgrade_prio_user;
    return prio_a - prio_b;
}

function sort_func_index(arg0, arg1)
{
    return arg0.index < arg1.index;
}

function sort_func_index_asc(arg0, arg1)
{
    return arg0.index > arg1.index;
}

function sort_func_resources_index(arg0, arg1)
{
    return variable_struct_get(global.resources, arg0).index - variable_struct_get(global.resources, arg1).index;
}

function sort_func_resources_index_desc(arg0, arg1)
{
    return variable_struct_get(global.resources, arg1).index - variable_struct_get(global.resources, arg0).index;
}

function sort_func_materials_index(arg0, arg1)
{
    return variable_struct_get(global.materials, arg0).index - variable_struct_get(global.materials, arg1).index;
}

function sort_func_materials_index_desc(arg0, arg1)
{
    return variable_struct_get(global.materials, arg1).index - variable_struct_get(global.materials, arg0).index;
}

function sort_func_struct_price(arg0, arg1)
{
    var item_cost_a = get_item_cost(arg0);
    var item_cost_b = get_item_cost(arg1);
    var item_cost_a_key = struct_get_first_key(item_cost_a);
    var item_cost_b_key = struct_get_first_key(item_cost_b);
    if (item_cost_a_key != item_cost_b_key)
    {
        return 0;
    }
    return variable_struct_get(item_cost_a, item_cost_a_key) - variable_struct_get(item_cost_b, item_cost_b_key);
}

function get_array_item_by(arg0, arg1, arg2, arg3 = true)
{
    var __array = arg0;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (arg3)
        {
            if (is_struct(struct_get_from_hash(mitem, variable_get_hash("data"))) && variable_struct_get(mitem.data, arg1) == arg2)
            {
                return mitem;
            }
        }
        else if (variable_struct_get(mitem, arg1) == arg2)
        {
            return mitem;
        }
    }
    return undefined;
}

function get_array_item_by_id(arg0, arg1)
{
    var __array = arg0;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (mitem.data.id == arg1)
        {
            return mitem;
        }
    }
    return undefined;
}

function get_array_item_by_key(arg0, arg1, arg2 = true)
{
    return get_array_item_by(arg0, "key", arg1, arg2);
}

function get_next_array_item(arg0, arg1 = 0, arg2 = 1, arg3 = false)
{
    if (!is_array(arg0))
    {
        exit;
    }
    var next_item_index = arg1 + arg2;
    var arr_length = array_length(arg0);
    if (arr_length == 0)
    {
        exit;
    }
    if (next_item_index >= arr_length)
    {
        if (arg3)
        {
            return undefined;
        }
        next_item_index = 0;
    }
    else if (next_item_index < 0)
    {
        if (arg3)
        {
            return undefined;
        }
        next_item_index = arr_length - abs(arg1) - 1;
    }
    return arg0[next_item_index];
}

function get_random_array_item_by_chance(arg0, arg1, arg2 = undefined)
{
    var item = arg2;
    var __array = arg0;
    var __prop_len = array_length(__array);
    __array = array_shuffle(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var __sindex = __i;
        var mitem = __array[__i];
        var r = random(1);
        if (r > arg1(mitem))
        {
            continue;
        }
        item = mitem;
        break;
    }
    return item;
}

function item_id_is_in_array(arg0, arg1)
{
    var __array = arg0;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (mitem.data.id == arg1)
        {
            return true;
        }
    }
    return false;
}

function limit_array(arg0, arg1)
{
    if (!is_array(arg0))
    {
        exit;
    }
    var length = array_length(arg0);
    if (length >= arg1)
    {
        array_delete(arg0, 0, length - arg1);
    }
}

function move_array_item(arg0, arg1, arg2)
{
    array_push(arg2, arg0);
    remove_item_from_array_by_id(arg1, arg0.data.id);
}

function remove_from_array_by(arg0, arg1, arg2)
{
    var __array = arg0;
    var __prop_len = array_length(__array);
    var __i = __prop_len - 1;
    while (__i >= 0)
    {
        var mitem = __array[__i];
        var __ireal = __prop_len - 1 - __i;
        if (!is_struct(mitem))
        {
        }
        else if (variable_struct_get(mitem, arg1) != arg2)
        {
        }
        else
        {
            array_delete(arg0, __i, 1);
            return true;
        }
        __i--;
    }
    return false;
}

function remove_from_array_by_key(arg0, arg1)
{
    var __array = arg0;
    var __prop_len = array_length(__array);
    var __i = __prop_len - 1;
    while (__i >= 0)
    {
        var mitem = __array[__i];
        var __ireal = __prop_len - 1 - __i;
        if (mitem.key != arg1)
        {
        }
        else
        {
            array_delete(arg0, __i, 1);
            return true;
        }
        __i--;
    }
    return false;
}

function remove_from_array_by_string(arg0, arg1)
{
    var __array = arg0;
    var __prop_len = array_length(__array);
    var __i = __prop_len - 1;
    while (__i >= 0)
    {
        var mitem = __array[__i];
        var __ireal = __prop_len - 1 - __i;
        if (mitem != arg1)
        {
        }
        else
        {
            array_delete(arg0, __i, 1);
            return true;
        }
        __i--;
    }
    return false;
}

function remove_item_from_array_by_id(arg0, arg1, arg2 = false)
{
    var deleted = false;
    var __array = arg0;
    var __prop_len = array_length(__array);
    var __i = __prop_len - 1;
    for (; __i >= 0; __i--)
    {
        var mitem = __array[__i];
        var __ireal = __prop_len - 1 - __i;
        if (is_undefined(mitem))
        {
            continue;
        }
        if (is_struct(struct_get_from_hash(mitem, variable_get_hash("data"))))
        {
            if (mitem.data.id != arg1)
            {
                continue;
            }
        }
        else if (struct_get_from_hash(mitem, variable_get_hash("id")) != arg1)
        {
            continue;
        }
        if (arg2)
        {
            arg0[__i] = undefined;
        }
        else
        {
            array_delete(arg0, __i, 1);
        }
        deleted = true;
        break;
    }
    return deleted;
}

function remove_self_from_array(arg0, arg1)
{
    var __array = arg0;
    var __prop_len = array_length(__array);
    var __i = __prop_len - 1;
    while (__i >= 0)
    {
        var mitem = __array[__i];
        var __ireal = __prop_len - 1 - __i;
        if (mitem != arg1)
        {
        }
        else
        {
            array_delete(arg0, __i, 1);
            return true;
        }
        __i--;
    }
    return false;
}

function swap_array_items(arg0, arg1, arg2, arg3)
{
    if (!is_array(arg0) || !is_array(arg1))
    {
        return false;
    }
    if (!is_struct(arg2) || !is_struct(arg3))
    {
        return false;
    }
    var index1 = -1;
    var index2 = -1;
    var __array = arg0;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (mitem == arg2)
        {
            index1 = __i;
            break;
        }
    }
    __array = arg1;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (mitem == arg3)
        {
            index2 = __i;
            break;
        }
    }
    if (index1 == -1 || index2 == -1)
    {
        return false;
    }
    array_insert(arg0, index1, arg3);
    array_insert(arg1, index2, arg2);
    array_delete(arg0, index1 + 1, 1);
    array_delete(arg1, index2 + 1, 1);
    return true;
}
