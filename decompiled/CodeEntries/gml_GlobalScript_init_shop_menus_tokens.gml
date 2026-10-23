function init_shop_menus_tokens()
{
    variable_struct_set(shop_items, UnknownEnum.Value_63, get_shop_items(global.shops.gold_token, global.shops_sorted.gold_token));
    variable_struct_set(titles, UnknownEnum.Value_63, 
    {
        title: __("Gold Token Shop **"),
        subtitle: ""
    });
    variable_struct_set(shop_items, UnknownEnum.Value_85, get_shop_items(global.shops.silver_token, global.shops_sorted.silver_token));
    variable_struct_set(titles, UnknownEnum.Value_85, 
    {
        title: __("Silver Token Shop **"),
        subtitle: ""
    });
}

enum UnknownEnum
{
    Value_63 = 63,
    Value_85 = 85
}
