function init_shop_menus_options()
{
    variable_struct_set(titles, UnknownEnum.Value_25, 
    {
        title: __("Options"),
        subtitle: __("")
    });
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_25), new Gui_Item(UnknownEnum.Value_36, id));
}

enum UnknownEnum
{
    Value_25 = 25,
    Value_36 = 36
}
