function add_shop_respec_button(arg0, arg1)
{
    set_default_font(f_gui_small);
    draw_resources(gui_x_start, add_button_base_y + 20, arg0, 1, 
    {
        font: f_gui_small,
        prefix: __("Respec cost: ")
    });
    var btn_enabled = has_enough_resources(arg0);
    if (gui_button_tl(gui_x_start + gui_col_x(3), add_button_base_y + 15, __("Respec"), btn_enabled))
    {
        var o = confirm_dialog(__("Do you want to respec all items?"), [respec_shop, arg0, arg1]);
        var respec_resources = get_shop_respec_resources(arg1);
        array_push(o.actions, new Gui_Item(UnknownEnum.Value_40, -1, 
        {
            resources: respec_resources,
            resources_options: 
            {
                font: f_gui_small,
                prefix: __("You will get the following resources:") + " "
            }
        }));
    }
}

function build_mp_shops(arg0)
{
    var shops = {};
    try
    {
        var __struct = arg0;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            if (is_undefined(struct_get_from_hash(mitem, variable_get_hash("data"))))
            {
                continue;
            }
            var shop_key = mitem.data.key;
            variable_struct_set(global.shops_prestige_levels, shop_key, global.prestige_levels.inf);
            variable_struct_set(global.shops, shop_key, {});
            var __struct2 = mitem.items;
            var __prop_names2 = struct_get_names(__struct2);
            var __prop_len2 = array_length(__prop_names2);
            for (var __i2 = 0; __i2 < __prop_len2; __i2++)
            {
                var mkey2 = __prop_names2[__i2];
                var mitem2 = variable_struct_get(__struct2, mkey2);
                var shop_item = build_shop_item(mitem2.key, variable_struct_get(global.resources, mitem2.resource), mitem2.index, mitem2.props);
                log(mitem2, shop_item);
                variable_struct_set(variable_struct_get(global.shops, shop_key), mitem2.key, shop_item);
            }
        }
    }
    catch (err)
    {
        log(err);
        notify_error(__("Invalid season shop items."));
    }
}

function build_mp_shops_items(arg0)
{
    var __struct = arg0;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        var shop_key = mitem.data.key;
        var shop = variable_struct_get(global.shops, shop_key);
        var shop_array = variable_struct_get(global.shops_sorted, shop_key);
        variable_struct_set(o_shop.shop_items, shop_key, get_shop_items(shop, shop_array));
        if (get_default_struct_value(mitem.data, "has_respec", false))
        {
            variable_struct_set(o_shop.shop_dialog_add_draw, shop_key, [add_shop_respec_button, global.costs.respec_season_shop, shop_key]);
        }
        variable_struct_set(o_shop.titles, shop_key, 
        {
            title: get_default_struct_value(mitem.data, "title", mitem.name),
            subtitle: get_default_struct_value(mitem.data, "subtitle", "")
        });
    }
}

function build_mp_shops_nav(arg0)
{
    var __struct = arg0;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        var shop_key = mitem.data.key;
        var nav_item = 
        {
            name: mitem.name,
            sprite: asset_get_index(mitem.data.sprite),
            
            check: function()
            {
                return mp_is_logged_in();
            },
            
            check_badge: function()
            {
                return false;
            },
            
            func: [open_shop_dialog, shop_key],
            hotkey: -1,
            key: shop_key,
            shop_key: shop_key
        };
        array_push(o_shop.nav_items_tl, nav_item);
    }
}

function get_shop_items_by_key(arg0, arg1)
{
    var items = _map(global.shops_items_array, function(arg0, arg1, arg2)
    {
        if (get_default_struct_value(arg0, "disable_auto_upgrade", false))
        {
            exit;
        }
        if (arg0.key == arg2._find_key)
        {
            if (is_array(arg2._exclude_resources))
            {
                var item_cost = get_item_cost(arg0);
                var item_cost_res = variable_struct_get_names(item_cost);
                if (array_key_in_array(arg2._exclude_resources, item_cost_res))
                {
                    return -1;
                }
            }
            return arg0;
        }
        return -1;
    }, 
    {
        _find_key: arg0,
        _exclude_resources: arg1
    });
    return _filter(items, function(arg0, arg1)
    {
        return is_struct(arg0);
    });
}

function get_shop_items_by_array(arg0, arg1)
{
    var item_arrays = _map(arg0, function(arg0, arg1, arg2)
    {
        if (!is_string(arg0) && is_struct(arg0))
        {
            return arg0;
        }
        return get_shop_items_by_key(arg0, arg2);
    }, arg1);
    var items = [];
    var i = 0;
    var len = array_length(item_arrays);
    while (i < len)
    {
        var item_array = item_arrays[i];
        if (!is_array(item_array))
        {
            if (is_struct(item_array))
            {
                array_push(items, item_array);
            }
        }
        else
        {
            for (var ii = 0; ii < array_length(item_array); ii++)
            {
                array_push(items, item_array[ii]);
            }
        }
        i++;
    }
    return items;
}

function get_shop_menu_stars(arg0)
{
    if (!is_string(arg0))
    {
        return "";
    }
    var shop_level = variable_struct_get(global.shops_prestige_levels, arg0);
    var text = "";
    switch (shop_level)
    {
        case global.prestige_levels.prestige.level:
            text = " *";
            break;
        case global.prestige_levels.blc.level:
            text = " **";
            break;
        case global.prestige_levels.mlc.level:
            text = " ***";
            break;
        case global.prestige_levels.ulc.level:
            text = " ****";
            break;
        case global.prestige_levels.inf.level:
            text = " *****";
            break;
    }
    return text;
}

function get_shop_respec_resources(arg0)
{
    var respec_resources = {};
    var __struct = variable_struct_get(global.shops, arg0);
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        var upgrade_count = get_upgrade_count(mitem);
        var item_cost;
        if (mitem.add_to_inventory)
        {
            item_cost = get_item_cost(mitem, 1, 0, true);
            item_cost = multiply_struct_values(item_cost, mitem.data.inventory);
        }
        else
        {
            if (upgrade_count == 0)
            {
                continue;
            }
            item_cost = get_item_cost(mitem, upgrade_count, 0, true);
        }
        add_resources_to_struct(item_cost, respec_resources, floor);
    }
    __struct = respec_resources;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(__struct, mkey, apply_max_number(mitem));
    }
    return respec_resources;
}

function has_bought_shop_item(arg0, arg1 = false)
{
    if (is_undefined(arg0))
    {
        return false;
    }
    var bought = get_upgrade_count(arg0) > 0;
    if (!bought)
    {
        return false;
    }
    if (bought && arg1 && !arg0.data.toggle)
    {
        return false;
    }
    return bought;
}

function has_bought_shop_item_safe(arg0, arg1 = undefined, arg2 = false)
{
    var shop_item = undefined;
    if (is_struct(arg0))
    {
        shop_item = arg0;
    }
    else
    {
        var shop = variable_struct_get(global.shops, arg0);
        if (is_undefined(shop))
        {
            return sprintf(log("=== INVALID SHOP: %s ==="), arg0);
        }
        shop_item = variable_struct_get(shop, arg1);
        if (is_undefined(shop))
        {
            return sprintf(log("=== INVALID SHOP ITEM: %s ==="), arg1);
        }
    }
    if (is_undefined(shop_item))
    {
        return false;
    }
    return has_bought_shop_item(shop_item, arg2);
}

function open_shop_dialog(arg0)
{
    var shop = variable_struct_get(o_shop.shop_items, arg0);
    if (is_undefined(shop))
    {
        return log("Invalid shop", arg0);
    }
    actions_dialog(shop, variable_struct_get(o_shop.titles, arg0), 6, 
    {
        dialog_id: arg0,
        tab: arg0,
        can_toggle: true,
        add_draw: variable_struct_get(o_shop.shop_dialog_add_draw, arg0),
        shop_key: arg0
    });
}

function refresh_dlc_shop()
{
    if (!variable_global_exists("shops"))
    {
        exit;
    }
    var __struct = global.shops.dlc;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (!global.is_ios)
        {
            mitem.data.count = 0;
        }
        if (global.is_pc)
        {
            if (get_upgrade_count(mitem) > 0 && !get_default_struct_value(mitem.data.claimed_os, 0, false))
            {
                variable_struct_set(mitem.data.claimed_os, 0, true);
            }
        }
        if (is_dlc_purchase_valid(mitem.dlc_id))
        {
            mitem.data.count = 1;
        }
        if (get_default_struct_value(mitem.data.claimed_os, 0, false))
        {
            mitem.data.count = 1;
        }
    }
    var tier = get_supporter_tier();
    var __array = global.shops_supporter_items;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        mitem.data.count = 0;
        var is_obfuscated = get_value_ext(mitem, mitem.is_obfuscated);
        if (tier >= mitem.supporters_tier && !is_obfuscated)
        {
            mitem.data.count = 1;
        }
    }
}

function respec_shop(arg0, arg1)
{
    if (!has_enough_resources(arg0))
    {
        exit;
    }
    with (o_game)
    {
        init_game_soft();
    }
    dec_resources(arg0);
    var respec_resources = get_shop_respec_resources(arg1);
    var __struct = variable_struct_get(global.shops, arg1);
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        mitem.data.count = 0;
        mitem.data.inventory = 0;
    }
    add_resources(respec_resources, false, true);
}

function sort_shop_items_by_user(arg0)
{
    array_sort(arg0, sort_func_auto_upgrade);
    return arg0;
}

enum UnknownEnum
{
    Value_40 = 40
}
