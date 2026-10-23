function init_scrolls()
{
    global.scrolls = 
    {
        crafting: new Scroll(
        {
            index: 100,
            name: __("Crafting Scroll"),
            description: __("Crafting rarity increased by [value]% for [duration]."),
            sprite: spr_scroll_crafting,
            bonus_value: 0.25,
            expire_duration: 60,
            upgrade_attributes: 
            {
                craft_min_chance_multiplier_scroll: 0.25
            }
        }),
        damage: new Scroll(
        {
            index: 200,
            name: __("Damage Scroll"),
            description: __("Increases player damage by [value]% for [duration]."),
            sprite: spr_scroll_damage,
            bonus_value: 0.25,
            upgrade_attributes: 
            {
                blower_enemy_damage_multiplier_scroll: 0.25
            }
        }),
        dice: new Scroll(
        {
            index: 210,
            name: __("Dice Scroll"),
            use_auto_description: true,
            sprite: spr_scroll_dice,
            bonus_value: 0.005,
            upgrade_attributes: 
            {
                dice_battlefield_die_drop_chance: 0.005
            }
        }),
        leaf: new Scroll(
        {
            index: 300,
            name: __("Leaf Scroll"),
            description: __("Get [value]% more leaves for [duration]."),
            sprite: spr_scroll_leaf,
            bonus_value: 2,
            upgrade_attributes: 
            {
                leaf_scroll_multiplier: 2
            }
        }),
        material: new Scroll(
        {
            index: 320,
            name: __("Material Scroll"),
            description: __("Material base spawn rate increased by [value]% for [duration]."),
            sprite: spr_scroll_material,
            bonus_value: 0.05,
            upgrade_attributes: 
            {
                material_spawn_chance_add_base: 0.05
            },
            can_activate: [has_bought_shop_item_safe, "blc", "unlock_materials"]
        }),
        mulch: new Scroll(
        {
            index: 350,
            name: __("Mulch Scroll"),
            description: sprintf(__("Get %s mulch per second for [duration]."), 500),
            sprite: spr_scroll_mulch,
            bonus_value: 500,
            upgrade_attributes: 
            {
                resources_auto_collect: 
                {
                    mulch: 500
                }
            },
            can_activate: [has_bought_shop_item_safe, "blc", "unlock_mulch"]
        }),
        pet: new Scroll(
        {
            index: 400,
            name: __("Pet Scroll"),
            description: __("Increases pet bonuses by [value]% for [duration]."),
            sprite: spr_scroll_pets,
            bonus_value: 0.2,
            upgrade_attributes: 
            {
                upgrade_section_multiplier: 
                {
                    pets: 0.2
                }
            }
        }),
        printers: new Scroll(
        {
            index: 410,
            name: __("Printers Scroll"),
            description: __("Increases printers output by [value]% for [duration]."),
            sprite: spr_scroll_printer,
            bonus_value: 10,
            upgrade_attributes: 
            {
                printer_scroll_multiplier: 10
            }
        }),
        seed: new Scroll(
        {
            index: 500,
            name: __("Seed Scroll"),
            description: __("Increases seed spawn chance by [value]% for [duration]."),
            sprite: spr_scroll_seed,
            bonus_value: 0.05,
            upgrade_attributes: 
            {
                seed_spawn_chance: 0.05
            }
        }),
        trading: new Scroll(
        {
            index: 600,
            name: __("Trading Scroll"),
            description: __("Increases global trade multiplier by [value]% for [duration]."),
            sprite: spr_scroll_trading,
            bonus_value: 0.25,
            upgrade_attributes: 
            {
                trade_resources_multiplier_scroll: 0.25
            }
        }),
        trout: new Scroll(
        {
            index: 700,
            name: __("Trout Scroll"),
            use_auto_description: true,
            sprite: spr_scroll_trout,
            bonus_value: 0.25,
            upgrade_attributes: 
            {
                slap_multiplier_scroll: 0.25
            }
        }),
        unique: new Scroll(
        {
            index: 800,
            name: __("Unique Leaves Scroll"),
            description: __("Increases unique leaves bonuses by [value]% for [duration]."),
            sprite: spr_scroll_unique,
            bonus_value: 0.2,
            upgrade_attributes: 
            {
                upgrade_section_multiplier: 
                {
                    unique: 0.2
                }
            }
        })
    };
    global.scrolls_upgrade_early = [];
    global.scrolls_upgrade_late = [];
    var __struct = global.scrolls;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        mitem.key = mkey;
        if (!is_undefined(struct_get_from_hash(mitem.upgrade_attributes, variable_get_hash("upgrade_section_multiplier"))))
        {
            mitem.upgrade_attributes_apply_early = true;
            array_push(global.scrolls_upgrade_early, mitem);
        }
        else
        {
            array_push(global.scrolls_upgrade_late, mitem);
        }
    }
    global.scrolls_sorted = struct_to_sorted_array(global.scrolls);
}

function init_scrolls_late()
{
    var __struct = global.scrolls;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        mitem.init_late();
    }
}
