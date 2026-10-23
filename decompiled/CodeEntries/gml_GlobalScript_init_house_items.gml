function init_house_items()
{
    global.house_items = 
    {
        alb: new House_Item(
        {
            name: __("ALB"),
            sprite: spr_autoblower,
            scale: 2,
            upgrade_attributes: 
            {
                alb_enemy_damage_multiplier: 2
            }
        }),
        basketball: new House_Item(
        {
            name: __("Basketball"),
            sprite: spr_house_basketball
        }),
        bed: new House_Item(
        {
            name: __("Bed"),
            sprite: spr_house_bed,
            upgrade_attributes: 
            {
                player_hp_reg_multiplier: 0.05
            }
        }),
        beer: new House_Item(
        {
            name: __("Beer"),
            sprite: spr_icon_beer,
            upgrade_attributes: 
            {
                player_hp_reg_multiplier: 0.1
            }
        }),
        bookshelf: new House_Item(
        {
            name: __("Bookshelf"),
            sprite: spr_house_bookshelf
        }),
        borb: new House_Item(
        {
            name: __("Borb"),
            sprite: spr_borb,
            upgrade_attributes: 
            {
                resources_leaf_add: 
                {
                    borbs: 10
                }
            }
        }),
        borb_bounce: new House_Item(
        {
            name: __("Bouncing Borb"),
            sprite: spr_pet_borb_walk,
            sprite_animated: true,
            upgrade_attributes: 
            {
                resources_leaf_add: 
                {
                    borbs: 10
                }
            }
        }),
        borb_machine: new House_Item(
        {
            name: __("Borb Claw Machine"),
            sprite: spr_house_borb_machine
        }),
        carpet01: new House_Item(
        {
            name: __("Carpets #1"),
            sprite: spr_house_carpet01,
            grid_layer: global.house_layers.ground
        }),
        chair: new House_Item(
        {
            name: __("Chair"),
            sprite: spr_house_chair
        }),
        christmas_tree: new House_Item(
        {
            name: __("Christmas Tree"),
            sprite: spr_deco_christmas_tree,
            scale: 3
        }),
        christmas_wreath: new House_Item(
        {
            name: __("Christmas Wreath"),
            sprite: spr_deco_christmas_wreath,
            scale: 2
        }),
        couch: new House_Item(
        {
            name: __("Couch"),
            sprite: spr_house_couch
        }),
        desk: new House_Item(
        {
            name: __("Desk"),
            sprite: spr_house_desk,
            upgrade_attributes: 
            {
                converter_crit_value: 0.2
            }
        }),
        dumbbell: new House_Item(
        {
            name: __("Dumbbell"),
            sprite: spr_house_dumbbell,
            upgrade_attributes: 
            {
                damage_resistance: 0.02
            }
        }),
        fireplace: new House_Item(
        {
            name: __("Fireplace"),
            sprite: spr_house_fireplace,
            description: __("Warm and cozy!")
        }),
        globe: new House_Item(
        {
            name: __("Globe"),
            sprite: spr_house_globe
        }),
        guitar: new House_Item(
        {
            name: __("Guitar"),
            sprite: spr_house_guitar
        }),
        leafblower: new House_Item(
        {
            name: __("Leaf Blower"),
            sprite: spr_weapon_leaf_blower,
            scale: 2
        }),
        painting01: new House_Item(
        {
            name: __("Painting #1"),
            sprite: spr_house_painting01
        }),
        painting02: new House_Item(
        {
            name: __("Painting #2"),
            sprite: spr_house_painting02,
            description: __("The Cursed Cheese"),
            upgrade_attributes: 
            {
                cursed_count_multiplier: 0.2
            }
        }),
        painting03: new House_Item(
        {
            name: __("Painting #3"),
            sprite: spr_house_painting03,
            description: __("The Cleansed Cheese")
        }),
        palm: new House_Item(
        {
            name: __("Palm"),
            sprite: spr_house_palm
        }),
        radio: new House_Item(
        {
            name: __("Radio"),
            sprite: spr_house_radio
        }),
        table_deco01: new House_Item(
        {
            name: __("Table Deco #1"),
            sprite: spr_house_table_deco
        }),
        tile_color_black: new House_Item(
        {
            name: __("Black Tile"),
            sprite: spr_house_color_black,
            grid_layer: global.house_layers.ground
        }),
        tile_color_blue: new House_Item(
        {
            name: __("Blue Tile"),
            sprite: spr_house_color_blue,
            grid_layer: global.house_layers.ground
        }),
        tile_color_brown: new House_Item(
        {
            name: __s("%s Tile", __("Brown")),
            sprite: spr_house_color_brown,
            grid_layer: global.house_layers.ground
        }),
        tile_color_cyan: new House_Item(
        {
            name: __("Cyan Tile"),
            sprite: spr_house_color_cyan,
            grid_layer: global.house_layers.ground
        }),
        tile_color_gray: new House_Item(
        {
            name: __s("%s Tile", __("Gray")),
            sprite: spr_house_color_gray,
            grid_layer: global.house_layers.ground
        }),
        tile_color_green: new House_Item(
        {
            name: __("Green Tile"),
            sprite: spr_house_color_green,
            grid_layer: global.house_layers.ground
        }),
        tile_color_magenta: new House_Item(
        {
            name: __("Magenta Tile"),
            sprite: spr_house_color_magenta,
            grid_layer: global.house_layers.ground
        }),
        tile_color_orange: new House_Item(
        {
            name: __s("%s Tile", __("Orange")),
            sprite: spr_house_color_orange,
            grid_layer: global.house_layers.ground
        }),
        tile_color_pink: new House_Item(
        {
            name: __s("%s Tile", __("Pink")),
            sprite: spr_house_color_pink,
            grid_layer: global.house_layers.ground
        }),
        tile_color_purple: new House_Item(
        {
            name: __s("%s Tile", __("Purple")),
            sprite: spr_house_color_purple,
            grid_layer: global.house_layers.ground
        }),
        tile_color_red: new House_Item(
        {
            name: __("Red Tile"),
            sprite: spr_house_color_red,
            grid_layer: global.house_layers.ground
        }),
        tile_color_white: new House_Item(
        {
            name: __("White Tile"),
            sprite: spr_house_color_white,
            grid_layer: global.house_layers.ground
        }),
        tile_color_yellow: new House_Item(
        {
            name: __("Yellow Tile"),
            sprite: spr_house_color_yellow,
            grid_layer: global.house_layers.ground
        }),
        tire: new House_Item(
        {
            name: __("Tire"),
            sprite: spr_house_tire
        }),
        tv: new House_Item(
        {
            name: __("TV"),
            sprite: spr_house_tv
        })
    };
    var __array = global.resources_sorted_rarity;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        var item = false;
        var item_key = mitem.key;
        if (mitem.is_leaf)
        {
            var ua = 
            {
                resources_multiplier: {}
            };
            variable_struct_set(ua.resources_multiplier, item_key, global.game_settings.house_items_leaf_bonus_value);
            item = new House_Item(
            {
                name: mitem.name,
                sprite: mitem.sprite,
                scale: 2,
                resource: mitem,
                upgrade_attributes: ua
            });
            item_key = sprintf("leaf_%s", mitem.key);
        }
        if (mitem.type.key == global.resource_types.flask.key)
        {
            item = new House_Item(
            {
                name: mitem.name,
                sprite: mitem.sprite,
                scale: 2,
                resource: mitem
            });
            item_key = sprintf("flask_%s", mitem.key);
        }
        if (!is_struct(item))
        {
            continue;
        }
        variable_struct_set(global.house_items, item_key, item);
    }
    var fish_ua = 
    {
        fishing_xp_multiplier: 0.005
    };
    __array = global.fish_array_rarity.common;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        var item = new House_Item(
        {
            name: mitem.name,
            sprite: mitem.sprite,
            upgrade_attributes: fish_ua
        });
        var item_key = mitem.key;
        variable_struct_set(global.house_items, item_key, item);
    }
    global.house_items_sorted = [];
    var __struct = global.house_items;
    var __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        mitem.key = mkey;
        if (is_struct(mitem.upgrade_attributes))
        {
            if (!is_empty(mitem.description))
            {
                mitem.description += "\n\n";
            }
            mitem.description += format_upgrade_text(mitem.upgrade_attributes, undefined, undefined, undefined, "\n");
        }
        array_push(global.house_items_sorted, mitem);
    }
    sort_array_by_key(global.house_items_sorted, true);
}
