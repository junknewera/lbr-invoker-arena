function init_shop_menus_leaves()
{
    variable_struct_set(shop_items, UnknownEnum.Value_48, get_shop_items(global.shops.environment, global.shops_sorted.environment));
    variable_struct_set(titles, UnknownEnum.Value_48, 
    {
        title: __("Leaves Shop"),
        subtitle: ""
    });
    variable_struct_set(shop_items, UnknownEnum.Value_31, get_shop_items(global.shops.ancient, global.shops_sorted.ancient));
    variable_struct_set(titles, UnknownEnum.Value_31, 
    {
        title: __("Ancient Shop ***"),
        subtitle: __("Deep down in the Desert, these leaves appear to be formed when evil forces are cleansed.")
    });
    variable_struct_set(shop_items, UnknownEnum.Value_33, get_shop_items(global.shops.benitoite, global.shops_sorted.benitoite));
    variable_struct_set(titles, UnknownEnum.Value_33, 
    {
        title: __("Benitoite Shop **"),
        subtitle: ""
    });
    variable_struct_set(shop_items, UnknownEnum.Value_34, get_shop_items(global.shops.bismuth, global.shops_sorted.bismuth));
    variable_struct_set(titles, UnknownEnum.Value_34, 
    {
        title: __("Bismuth Shop"),
        subtitle: ""
    });
    variable_struct_set(shop_items, UnknownEnum.Value_35, get_shop_items(global.shops.biotite, global.shops_sorted.biotite));
    variable_struct_set(titles, UnknownEnum.Value_35, 
    {
        title: __("Biotite Shop ***"),
        subtitle: ""
    });
    variable_struct_set(shop_items, UnknownEnum.Value_41, get_shop_items(global.shops.coal, global.shops_sorted.coal));
    variable_struct_set(titles, UnknownEnum.Value_41, 
    {
        title: __("Coal Shop ***")
    });
    variable_struct_set(shop_items, UnknownEnum.Value_40, get_shop_items(global.shops.celestial, global.shops_sorted.celestial));
    variable_struct_set(titles, UnknownEnum.Value_40, 
    {
        title: __("Celestial Shop **"),
        subtitle: __("Celestial Leaves can be earned by defeating enemies.")
    });
    variable_struct_set(shop_items, UnknownEnum.Value_44, get_shop_items(global.shops.cosmic, global.shops_sorted.cosmic));
    variable_struct_set(titles, UnknownEnum.Value_44, 
    {
        title: __("Cosmic Shop"),
        subtitle: ""
    });
    variable_struct_set(shop_items, UnknownEnum.Value_47, get_shop_items(global.shops.energy_electrical, global.shops_sorted.energy_electrical));
    variable_struct_set(titles, UnknownEnum.Value_47, 
    {
        title: __("Electric Shop ***"),
        subtitle: ""
    });
    variable_struct_set(shop_items, UnknownEnum.Value_49, get_shop_items(global.shops.exotic, global.shops_sorted.exotic));
    variable_struct_set(titles, UnknownEnum.Value_49, 
    {
        title: __("Exotic Shop"),
        subtitle: ""
    });
    variable_struct_set(shop_items, UnknownEnum.Value_60, get_shop_items(global.shops.gem_leaves, global.shops_sorted.gem_leaves));
    variable_struct_set(titles, UnknownEnum.Value_60, 
    {
        title: __("Gem Leaves Shop ***"),
        subtitle: ""
    });
    variable_struct_set(shop_items, UnknownEnum.Value_62, get_shop_items(global.shops.gold, global.shops_sorted.gold));
    variable_struct_set(titles, UnknownEnum.Value_62, 
    {
        title: __("Gold Shop"),
        subtitle: ""
    });
    variable_struct_set(shop_items, UnknownEnum.Value_64, get_shop_items(global.shops.hematite, global.shops_sorted.hematite));
    variable_struct_set(titles, UnknownEnum.Value_64, 
    {
        title: __("Hematite Shop ***"),
        subtitle: ""
    });
    variable_struct_set(shop_items, UnknownEnum.Value_65, get_shop_items(global.shops.ice, global.shops_sorted.ice));
    variable_struct_set(titles, UnknownEnum.Value_65, 
    {
        title: __("Ice Shop **"),
        subtitle: ""
    });
    variable_struct_set(shop_items, UnknownEnum.Value_66, get_shop_items(global.shops.lava, global.shops_sorted.lava));
    variable_struct_set(titles, UnknownEnum.Value_66, 
    {
        title: __("Lava Shop **"),
        subtitle: ""
    });
    variable_struct_set(shop_items, UnknownEnum.Value_67, get_shop_items(global.shops.malachite, global.shops_sorted.malachite));
    variable_struct_set(titles, UnknownEnum.Value_67, 
    {
        title: __("Malachite Shop ***"),
        subtitle: ""
    });
    variable_struct_set(shop_items, UnknownEnum.Value_69, get_shop_items(global.shops.moonstone, global.shops_sorted.moonstone));
    variable_struct_set(titles, UnknownEnum.Value_69, 
    {
        title: __("Moonstone Shop ***"),
        subtitle: ""
    });
    variable_struct_set(shop_items, UnknownEnum.Value_71, get_shop_items(global.shops.mythical, global.shops_sorted.mythical));
    variable_struct_set(titles, UnknownEnum.Value_71, 
    {
        title: __("Mythical Shop **"),
        subtitle: ""
    });
    variable_struct_set(shop_items, UnknownEnum.Value_72, get_shop_items(global.shops.obsidian, global.shops_sorted.obsidian));
    variable_struct_set(titles, UnknownEnum.Value_72, 
    {
        title: __("Obsidian Shop **"),
        subtitle: ""
    });
    variable_struct_set(shop_items, UnknownEnum.Value_74, get_shop_items(global.shops.plasma, global.shops_sorted.plasma));
    variable_struct_set(titles, UnknownEnum.Value_74, 
    {
        title: __("Plasma Shop ***"),
        subtitle: ""
    });
    variable_struct_set(shop_items, UnknownEnum.Value_75, get_shop_items(global.shops.platinum, global.shops_sorted.platinum));
    variable_struct_set(titles, UnknownEnum.Value_75, 
    {
        title: __("Platinum Shop"),
        subtitle: ""
    });
    variable_struct_set(shop_items, UnknownEnum.Value_81, get_shop_items(global.shops.sand, global.shops_sorted.sand));
    variable_struct_set(titles, UnknownEnum.Value_81, 
    {
        title: __("Sand Shop ***"),
        subtitle: ""
    });
    variable_struct_set(shop_items, UnknownEnum.Value_80, get_shop_items(global.shops.sacred, global.shops_sorted.sacred));
    variable_struct_set(titles, UnknownEnum.Value_80, 
    {
        title: __("Sacred Shop ***"),
        subtitle: sprintf(__("Sacred Leaves offline rewards are applied at a reduced rate (%s)."), number_format_percent(global.resources.sacred.offline_reward_multiplier))
    });
    variable_struct_set(shop_items, UnknownEnum.Value_83, get_shop_items(global.shops.silicon, global.shops_sorted.silicon));
    variable_struct_set(titles, UnknownEnum.Value_83, 
    {
        title: __("Silicon Shop **"),
        subtitle: ""
    });
    variable_struct_set(shop_items, UnknownEnum.Value_89, get_shop_items(global.shops.void, global.shops_sorted.void));
    variable_struct_set(titles, UnknownEnum.Value_89, 
    {
        title: __("Void Shop"),
        subtitle: ""
    });
    variable_struct_set(shop_items, UnknownEnum.Value_53, get_shop_items(global.shops.flask_red, global.shops_sorted.flask_red));
    variable_struct_set(titles, UnknownEnum.Value_53, 
    {
        title: __("Red Science"),
        subtitle: ""
    });
    variable_struct_set(shop_items, UnknownEnum.Value_54, get_shop_items(global.shops.flask_green, global.shops_sorted.flask_green));
    variable_struct_set(titles, UnknownEnum.Value_54, 
    {
        title: __("Green Science"),
        subtitle: ""
    });
    variable_struct_set(shop_items, UnknownEnum.Value_55, get_shop_items(global.shops.flask_blue, global.shops_sorted.flask_blue));
    variable_struct_set(titles, UnknownEnum.Value_55, 
    {
        title: __("Blue Science"),
        subtitle: ""
    });
    variable_struct_set(shop_items, UnknownEnum.Value_56, get_shop_items(global.shops.flask_magenta, global.shops_sorted.flask_magenta));
    variable_struct_set(titles, UnknownEnum.Value_56, 
    {
        title: __("Magenta Science"),
        subtitle: ""
    });
    variable_struct_set(shop_items, UnknownEnum.Value_57, get_shop_items(global.shops.flask_orange, global.shops_sorted.flask_orange));
    variable_struct_set(titles, UnknownEnum.Value_57, 
    {
        title: __("Orange Science"),
        subtitle: ""
    });
    variable_struct_set(shop_items, UnknownEnum.Value_58, get_shop_items(global.shops.flask_black, global.shops_sorted.flask_black));
    variable_struct_set(titles, UnknownEnum.Value_58, 
    {
        title: __("Black Science"),
        subtitle: ""
    });
    variable_struct_set(shop_items, UnknownEnum.Value_59, get_shop_items(global.shops.flask_strange, global.shops_sorted.flask_strange));
    variable_struct_set(titles, UnknownEnum.Value_59, 
    {
        title: __("Strange Science"),
        subtitle: ""
    });
}

enum UnknownEnum
{
    Value_31 = 31,
    Value_33 = 33,
    Value_34,
    Value_35,
    Value_40 = 40,
    Value_41,
    Value_44 = 44,
    Value_47 = 47,
    Value_48,
    Value_49,
    Value_53 = 53,
    Value_54,
    Value_55,
    Value_56,
    Value_57,
    Value_58,
    Value_59,
    Value_60,
    Value_62 = 62,
    Value_64 = 64,
    Value_65,
    Value_66,
    Value_67,
    Value_69 = 69,
    Value_71 = 71,
    Value_72,
    Value_74 = 74,
    Value_75,
    Value_80 = 80,
    Value_81,
    Value_83 = 83,
    Value_89 = 89
}
