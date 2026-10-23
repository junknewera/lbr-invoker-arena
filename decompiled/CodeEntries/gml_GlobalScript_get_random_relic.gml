function get_random_relic(arg0 = undefined)
{
    var item;
    if (!is_undefined(arg0))
    {
        item = array_random_item(variable_struct_get(global.relics_rarity_array, arg0));
    }
    else
    {
        item = array_random_item(global.relics_array);
    }
    return item;
}
