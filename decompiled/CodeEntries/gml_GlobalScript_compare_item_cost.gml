function compare_item_cost(arg0, arg1)
{
    var item_cost_a = get_item_cost(arg0);
    var item_cost_b = get_item_cost(arg1);
    var item_cost_a_key = struct_get_first_key(item_cost_a);
    var item_cost_b_key = struct_get_first_key(item_cost_b);
    if (item_cost_a_key != item_cost_b_key)
    {
        return 0;
    }
    return (variable_struct_get(item_cost_a, item_cost_a_key) > variable_struct_get(item_cost_b, item_cost_b_key)) ? 1 : -1;
}
