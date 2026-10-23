function quicksort(arg0, arg1)
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
    var compare;
    if (arg1)
    {
        compare = function(arg0, arg1)
        {
            return arg0 < arg1;
        };
    }
    else
    {
        compare = function(arg0, arg1)
        {
            return arg0 > arg1;
        };
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
