function sort_array_by(arg0, arg1, arg2 = true)
{
    var length = array_length(arg0);
    if (length == 0)
    {
        exit;
    }
    var lb_stack = [];
    var ub_stack = [];
    var stack_pos = 1;
    lb_stack[1] = 0;
    ub_stack[1] = length - 1;
    do
    {
        var lb = @@array_get@@(lb_stack, stack_pos);
        var ub = @@array_get@@(ub_stack, stack_pos);
        stack_pos--;
        do
        {
            var pivot_pos = (lb + ub) >> 1;
            var i = lb;
            var j = ub;
            var pivot = @@array_get@@(arg0, pivot_pos);
            do
            {
                while (sort_array_by_compare_func(@@array_get@@(arg0, i), pivot, arg1, arg2))
                {
                    i++;
                }
                while (sort_array_by_compare_func(pivot, @@array_get@@(arg0, j), arg1, arg2))
                {
                    j--;
                }
                if (i <= j)
                {
                    var temp = @@array_get@@(arg0, i);
                    array_set(arg0, i, @@array_get@@(arg0, j));
                    array_set(arg0, j, temp);
                    i++;
                    j--;
                }
            }
            until (i > j);
            if (i < pivot_pos)
            {
                if (i < ub)
                {
                    stack_pos++;
                    array_set(lb_stack, stack_pos, i);
                    array_set(ub_stack, stack_pos, ub);
                }
                ub = j;
            }
            else
            {
                if (j > lb)
                {
                    stack_pos++;
                    array_set(lb_stack, stack_pos, lb);
                    array_set(ub_stack, stack_pos, j);
                }
                lb = i;
            }
        }
        until (lb >= ub);
    }
    until (stack_pos == 0);
}

function sort_array_by_compare_func(arg0, arg1, arg2, arg3 = true)
{
    if (is_array(arg2))
    {
        var a_sum = 0;
        var b_sum = 0;
        var i_loop = array_length(arg2) + 1;
        var __array = arg2;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            var a_res = power(10000, i_loop - __i) * get_value_ext(undefined, variable_struct_get(arg0, mitem));
            var b_res = power(10000, i_loop - __i) * get_value_ext(undefined, variable_struct_get(arg1, mitem));
            a_sum += a_res;
            b_sum += b_res;
        }
        return arg3 ? (a_sum < b_sum) : (a_sum > b_sum);
    }
    return arg3 ? (get_value_ext(undefined, variable_struct_get(arg0, arg2)) < get_value_ext(undefined, variable_struct_get(arg1, arg2))) : (get_value_ext(undefined, variable_struct_get(arg0, arg2)) > get_value_ext(undefined, variable_struct_get(arg1, arg2)));
}

function sort_array_by_index(arg0, arg1 = false)
{
    if (array_length(arg0) == 0)
    {
        return arg0;
    }
    var compare;
    if (arg1)
    {
        compare = function(arg0, arg1)
        {
            return arg0.index < arg1.index;
        };
    }
    else
    {
        compare = function(arg0, arg1)
        {
            return arg0.index > arg1.index;
        };
    }
    var length = array_length(arg0);
    var lb_stack = [];
    var ub_stack = [];
    var stack_pos = 1;
    lb_stack[1] = 0;
    ub_stack[1] = length - 1;
    do
    {
        var lb = @@array_get@@(lb_stack, stack_pos);
        var ub = @@array_get@@(ub_stack, stack_pos);
        stack_pos--;
        do
        {
            var pivot_pos = (lb + ub) >> 1;
            var i = lb;
            var j = ub;
            var pivot = @@array_get@@(arg0, pivot_pos);
            do
            {
                while (compare(@@array_get@@(arg0, i), pivot))
                {
                    i++;
                }
                while (compare(pivot, @@array_get@@(arg0, j)))
                {
                    j--;
                }
                if (i <= j)
                {
                    var temp = @@array_get@@(arg0, i);
                    array_set(arg0, i, @@array_get@@(arg0, j));
                    array_set(arg0, j, temp);
                    i++;
                    j--;
                }
            }
            until (i > j);
            if (i < pivot_pos)
            {
                if (i < ub)
                {
                    stack_pos++;
                    array_set(lb_stack, stack_pos, i);
                    array_set(ub_stack, stack_pos, ub);
                }
                ub = j;
            }
            else
            {
                if (j > lb)
                {
                    stack_pos++;
                    array_set(lb_stack, stack_pos, lb);
                    array_set(ub_stack, stack_pos, j);
                }
                lb = i;
            }
        }
        until (lb >= ub);
    }
    until (stack_pos == 0);
}

function sort_array_by_key(arg0, arg1)
{
    if (!is_array(arg0))
    {
        exit;
    }
    var length = array_length(arg0);
    if (length == 0)
    {
        exit;
    }
    var lb_stack = [];
    var ub_stack = [];
    var stack_pos = 1;
    lb_stack[1] = 0;
    ub_stack[1] = length - 1;
    do
    {
        var lb = @@array_get@@(lb_stack, stack_pos);
        var ub = @@array_get@@(ub_stack, stack_pos);
        stack_pos--;
        do
        {
            var pivot_pos = (lb + ub) >> 1;
            if (pivot_pos < 0 || pivot_pos > length)
            {
                exit;
            }
            var i = lb;
            var j = ub;
            var pivot = @@array_get@@(arg0, pivot_pos);
            do
            {
                while (sort_array_by_key_compare_func(@@array_get@@(arg0, i), pivot, arg1))
                {
                    i++;
                }
                while (sort_array_by_key_compare_func(pivot, @@array_get@@(arg0, j), arg1))
                {
                    j--;
                }
                if (i <= j)
                {
                    var temp = @@array_get@@(arg0, i);
                    array_set(arg0, i, @@array_get@@(arg0, j));
                    array_set(arg0, j, temp);
                    i++;
                    j--;
                }
            }
            until (i > j);
            if (i < pivot_pos)
            {
                if (i < ub)
                {
                    stack_pos++;
                    array_set(lb_stack, stack_pos, i);
                    array_set(ub_stack, stack_pos, ub);
                }
                ub = j;
            }
            else
            {
                if (j > lb)
                {
                    stack_pos++;
                    array_set(lb_stack, stack_pos, lb);
                    array_set(ub_stack, stack_pos, j);
                }
                lb = i;
            }
        }
        until (lb >= ub);
    }
    until (stack_pos == 0);
}

function sort_array_by_data_count(arg0, arg1 = false)
{
    if (!is_array(arg0))
    {
        exit;
    }
    var length = array_length(arg0);
    if (length == 0)
    {
        exit;
    }
    var lb_stack = [];
    var ub_stack = [];
    var stack_pos = 1;
    lb_stack[1] = 0;
    ub_stack[1] = length - 1;
    do
    {
        var lb = @@array_get@@(lb_stack, stack_pos);
        var ub = @@array_get@@(ub_stack, stack_pos);
        stack_pos--;
        do
        {
            var pivot_pos = (lb + ub) >> 1;
            if (pivot_pos < 0 || pivot_pos > length)
            {
                exit;
            }
            var i = lb;
            var j = ub;
            var pivot = @@array_get@@(arg0, pivot_pos);
            do
            {
                while (sort_array_by_data_count_compare_func(@@array_get@@(arg0, i), pivot, arg1))
                {
                    i++;
                }
                while (sort_array_by_data_count_compare_func(pivot, @@array_get@@(arg0, j), arg1))
                {
                    j--;
                }
                if (i <= j)
                {
                    var temp = @@array_get@@(arg0, i);
                    array_set(arg0, i, @@array_get@@(arg0, j));
                    array_set(arg0, j, temp);
                    i++;
                    j--;
                }
            }
            until (i > j);
            if (i < pivot_pos)
            {
                if (i < ub)
                {
                    stack_pos++;
                    array_set(lb_stack, stack_pos, i);
                    array_set(ub_stack, stack_pos, ub);
                }
                ub = j;
            }
            else
            {
                if (j > lb)
                {
                    stack_pos++;
                    array_set(lb_stack, stack_pos, lb);
                    array_set(ub_stack, stack_pos, j);
                }
                lb = i;
            }
        }
        until (lb >= ub);
    }
    until (stack_pos == 0);
}

function sort_array_by_key_compare_func(arg0, arg1, arg2)
{
    return arg2 ? (arg0.key < arg1.key) : (arg0.key > arg1.key);
}

function sort_array_by_data_count_compare_func(arg0, arg1, arg2)
{
    return arg2 ? (arg0.data.count < arg1.data.count) : (arg0.data.count > arg1.data.count);
}
