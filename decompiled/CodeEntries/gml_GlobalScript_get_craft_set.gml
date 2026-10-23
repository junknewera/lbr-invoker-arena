function get_craft_set()
{
    var backpack = [];
    var inventory = [];
    var __array = global.craft_leaves_backpack;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        array_push(backpack, mitem.data.id);
    }
    __array = global.craft_leaves_inventory;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        array_push(inventory, mitem.data.id);
    }
    return 
    {
        backpack: backpack,
        inventory: inventory
    };
}
