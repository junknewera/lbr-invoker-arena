function load_craft_set(arg0, arg1 = true, arg2 = true)
{
    var is_position = false;
    var set = arg0;
    if (is_numeric(arg0))
    {
        is_position = true;
        set = variable_struct_get(o_game.data.craft_sets, arg0);
    }
    if (!is_struct(set))
    {
        exit;
    }
    if (is_position)
    {
        o_game.data.current_craft_set = arg0;
    }
    var __array = set.inventory;
    var __prop_len = array_length(__array);
    var __i = __prop_len - 1;
    while (__i >= 0)
    {
        var mitem = __array[__i];
        var __ireal = __prop_len - 1 - __i;
        if (!is_struct(get_leaf_by_id(mitem)))
        {
            array_delete(set.inventory, __i, 1);
        }
        __i--;
    }
    var bp_size = get_craft_backpack_size();
    var inv_size = get_craft_inventory_size();
    var bp_set_size = array_length(global.craft_leaves_backpack);
    var bp_inv_size = array_length(global.craft_leaves_inventory);
    var saved_set_inv_size = array_length(set.inventory);
    var crafted_leaves_size = bp_set_size + bp_inv_size;
    var check_overload_size = (crafted_leaves_size - saved_set_inv_size) > bp_size;
    if (bp_size < bp_set_size || inv_size < bp_inv_size || check_overload_size)
    {
        return notify(__("Can't load set as backpack/inventory size is too small."));
    }
    __array = global.craft_leaves_inventory;
    __prop_len = array_length(__array);
    __i = __prop_len - 1;
    while (__i >= 0)
    {
        var mitem = __array[__i];
        var __ireal = __prop_len - 1 - __i;
        move_array_item(mitem, global.craft_leaves_inventory, global.craft_leaves_backpack);
        __i--;
    }
    __array = set.inventory;
    __prop_len = array_length(__array);
    __i = __prop_len - 1;
    while (__i >= 0)
    {
        var mitem = __array[__i];
        var __ireal = __prop_len - 1 - __i;
        var leaf = get_leaf_by_id(mitem);
        if (!is_struct(leaf))
        {
        }
        else
        {
            move_array_item(leaf, global.craft_leaves_backpack, global.craft_leaves_inventory);
        }
        __i--;
    }
    if (arg2 && is_position)
    {
        var craft_set_name = string(variable_struct_get(o_game.data.craft_sets_names, arg0 + 1));
        notify(__s("Craft set #%s loaded.", string(arg0 + 1) + " (" + craft_set_name + ")"));
    }
    if (arg1)
    {
        init_game_vars(true);
    }
}
