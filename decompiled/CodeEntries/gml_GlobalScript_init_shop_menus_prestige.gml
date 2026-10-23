function init_shop_menus_prestige()
{
    variable_struct_set(shop_items, UnknownEnum.Value_42, get_shop_items(global.shops.coins, global.shops_sorted.coins));
    variable_struct_set(titles, UnknownEnum.Value_42, 
    {
        title: __("Coins Shop *"),
        subtitle: __("Purchased upgrades in the Coins Shop persist after stepping into the Leaf Portal. Neat! All shops marked with * will persist.")
    });
    variable_struct_set(shop_items, UnknownEnum.Value_36, get_shop_items(global.shops.blc, global.shops_sorted.blc));
    variable_struct_set(titles, UnknownEnum.Value_36, 
    {
        title: __("BLC Shop **"),
        subtitle: ""
    });
    variable_struct_set(shop_items, UnknownEnum.Value_68, get_shop_items(global.shops.mlc, global.shops_sorted.mlc));
    variable_struct_set(titles, UnknownEnum.Value_68, 
    {
        title: __("Mega Leaf Crunch Shop ***"),
        subtitle: ""
    });
    variable_struct_set(shop_items, UnknownEnum.Value_88, get_shop_items(global.shops.ulc, global.shops_sorted.ulc));
}

enum UnknownEnum
{
    Value_36 = 36,
    Value_42 = 42,
    Value_68 = 68,
    Value_88 = 88
}
