function save_craft_set(arg0)
{
    var craft_set = get_craft_set();
    variable_struct_set(o_game.data.craft_sets, arg0, 
    {
        backpack: craft_set.backpack,
        inventory: craft_set.inventory
    });
    notify(sprintf(__("Craft set #%s saved."), arg0 + 1));
}
