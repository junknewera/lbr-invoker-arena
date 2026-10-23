function init_shop_borbventure()
{
    var shop_resource = global.resources.borb_juice;
    global.shops_prestige_levels.borbventure = global.prestige_levels.inf;
    global.shops.borbventure = 
    {
        max_borbventures: 
        {
            index: 0,
            name: __s("More %s", "Borbventures"),
            description: __s("Increases the number of %s by %s.", "Borbventures", 1),
            sprite: spr_borb_jones,
            cost: build_resource_cost(shop_resource, 2000),
            cost_exp: 4,
            max_count: 3,
            upgrade_attributes: 
            {
                borbventure_max_borbventures: 1
            }
        },
        max_borbventure_borbs: 
        {
            index: 100,
            name: __s("More %s", "Borbs"),
            description: __s("Increases borb roster size by %s.", 1),
            sprite: spr_borb_jones,
            cost: build_resource_cost(shop_resource, 3000),
            cost_exp: 3.5,
            max_count: 5,
            upgrade_attributes: 
            {
                borbventure_max_borbs: 1
            }
        },
        max_borbventure_items: build_shop_item("max_borbventure_items", shop_resource, 200, 
        {
            base_cost: 3000,
            cost_exp: 1.15,
            max_count: 30,
            value: 1
        }),
        borbventure_craft_cost_multiplier: build_shop_item("borbventure_craft_cost_multiplier", shop_resource, 300, 
        {
            base_cost: 5000,
            cost_exp: 4,
            max_count: 5,
            value: -0.05
        }),
        borbventure_increase_xp: build_shop_item("borbventure_increase_xp", shop_resource, 400, 
        {
            base_cost: 750,
            cost_exp: 1.25,
            max_count: 20,
            value: 0.01
        }),
        borbventure_items_ascend_count: build_shop_item("borbventure_items_ascend_count", shop_resource, 450, 
        {
            base_cost: 50000,
            cost_exp: 2.5,
            max_count: 5,
            value: -1
        }),
        borbventure_refresh_timer_multiplier: build_shop_item("borbventure_refresh_timer_multiplier", shop_resource, 500, 
        {
            base_cost: 3000,
            cost_exp: 1.75,
            max_count: 10,
            value: -0.02
        }),
        borbventure_special_recruit_chance: build_shop_item("borbventure_special_recruit_chance", shop_resource, 600, 
        {
            base_cost: 10000,
            cost_exp: 1.5,
            max_count: 10,
            value: 0.01
        }),
        borbventure_craft_from_codex: build_shop_item("borbventure_craft_from_codex", global.resources.borb_ascension_rune, 700, 
        {
            name: __("Codex Crafter"),
            description: __("Craft items through the codex."),
            sprite: spr_icon_codex,
            base_cost: 50,
            max_count: 1
        })
    };
    var borb_recruit_shop_items = array_concat(global.borbventures.borb_types_array_premium, global.borbventures.borb_types_array_special);
    var __array = borb_recruit_shop_items;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        var is_premium = get_default_struct_value(mitem, "premium", false);
        var key = sprintf("unlock_borb_type_%s", mitem.key);
        variable_struct_set(global.shops.borbventure, key, 
        {
            index: 1000 + __i,
            name: __s("Unlock %s %s", mitem.name, "Borb"),
            
            description: function()
            {
                var text = concat([sprintf("[%s]", __("Borbventure")), format_upgrade_text(self.borb.bonus, undefined, undefined, undefined, "\n"), sprintf("[%s]", __("Global")), format_upgrade_text(self.upgrade_attributes, undefined, undefined, undefined, "\n")]);
                if (get_default_struct_value(self, "is_premium", false))
                {
                    text = __s("%s less chance to recruit this Borb.", number_format_percent(1 - global.game_settings.borbventure_special_recruit_chance_premium)) + "\n" + "\n" + text;
                }
                return text;
            },
            
            sprite: mitem.sprite,
            cost: build_resource_cost(global.resources.borb_ascension_juice, is_premium ? 35 : 5),
            max_count: 1,
            borb: mitem,
            
            func: function()
            {
                variable_struct_set(global.borbventures.data.unlocked_borb_types, self.borb.key, true);
            },
            
            upgrade_attributes: 
            {
                borbventure_increase_xp: 0.1,
                borbventure_special_recruit_chance: 0.025,
                borbventure_inventory_size: 1
            },
            is_premium: is_premium
        });
    }
}
