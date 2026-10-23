function init_shops(arg0)
{
    if (!is_undefined(arg0) && arg0 != -1)
    {
        __struct = global.shops;
        __prop_names = struct_get_names(__struct);
        __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var __struct2 = mitem;
            var __prop_names2 = struct_get_names(__struct2);
            var __prop_len2 = array_length(__prop_names2);
            for (var __i2 = 0; __i2 < __prop_len2; __i2++)
            {
                var mkey2 = __prop_names2[__i2];
                var mitem2 = variable_struct_get(__struct2, mkey2);
                mitem2.clear_cache();
            }
            if (!check_shop_prestige_level(arg0, variable_struct_get(global.upgrade_attributes.prestige_persist_shops, mkey)))
            {
                continue;
            }
            reset_shop_items(mitem, arg0);
        }
        stop_all_converters();
        if (get_upgrade_count(global.shops.blc.auto_start_converters) > 0 && global.shops.blc.auto_start_converters.data.toggle)
        {
            start_all_converters(true);
        }
        exit;
    }
    global.dlc_items = {};
    global.shops = {};
    global.shops_autoupgrade_items = {};
    global.shops_items_array = [];
    global.shops_items_array_autobuyers = [];
    global.shops_items_array_upgrade_early = [];
    global.shops_items_array_upgrade_late = [];
    global.shops_items_gui = {};
    global.shops_keys = {};
    global.shops_prestige_levels = {};
    global.shops_resources = {};
    global.shops_sorted = {};
    global.shops_sorted_sections = {};
    global.shops_supporter_items = [];
    global.supporter_tier_item_keys = {};
    init_weapons();
    init_shop_leaves();
    init_shop_ancient();
    init_shop_blc();
    init_shop_gold();
    init_shop_platinum();
    init_shop_benitoite();
    init_shop_bismuth();
    init_shop_biotite();
    init_shop_borbventure();
    init_shop_cards_transcension();
    init_shop_celestial();
    init_shop_cosmic();
    init_shop_void();
    init_shop_borbs();
    init_shop_coal();
    init_shop_coins();
    init_shop_converters();
    init_shop_dice();
    init_shop_dlc();
    init_shop_dusk();
    init_shop_energy_electrical();
    init_shop_exotic();
    init_shop_event();
    init_shop_farming();
    init_shop_fish();
    init_shop_flask_red();
    init_shop_flask_green();
    init_shop_flask_blue();
    init_shop_flask_magenta();
    init_shop_flask_orange();
    init_shop_flask_black();
    init_shop_flask_strange();
    init_shop_gems();
    init_shop_gem_leaves();
    init_shop_gold_token();
    init_shop_harbor();
    init_shop_hematite();
    init_shop_ice();
    init_shop_lava();
    init_shop_malachite();
    init_shop_mines();
    init_shop_mlc();
    init_shop_mythical();
    init_shop_moonstone();
    init_shop_mulch();
    init_shop_obsidian();
    init_shop_pets();
    init_shop_plasma();
    init_shop_prestige();
    init_shop_printers();
    init_shop_quarks();
    init_shop_sacred();
    init_shop_sand();
    init_shop_silicon();
    init_shop_skins();
    init_shop_soul();
    init_shop_soul_forge();
    init_shop_silver_token();
    init_shop_ulc();
    if (instance_exists(o_season_helper))
    {
        if (is_struct(o_season_helper.shop_data))
        {
            global.online_shops = o_season_helper.shop_data;
        }
    }
    if (is_struct(global.online_shops))
    {
        build_mp_shops(global.online_shops);
    }
    var __struct = global.shops;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(global.shops_sorted, mkey, []);
        variable_struct_set(global.shops_sorted_sections, mkey, {});
        var __struct2 = mitem;
        var __prop_names2 = struct_get_names(__struct2);
        var __prop_len2 = array_length(__prop_names2);
        for (var __i2 = 0; __i2 < __prop_len2; __i2++)
        {
            var mkey2 = __prop_names2[__i2];
            var mitem2 = variable_struct_get(__struct2, mkey2);
            var shop_item = new Shop_Item(mkey2, mitem2);
            variable_struct_set(__struct2, mkey2, shop_item);
            shop_item.shop = mitem;
            shop_item.shop_key = mkey;
            shop_item._init();
            if ((is_struct(shop_item.upgrade_attributes) && !is_undefined(struct_get_from_hash(shop_item.upgrade_attributes, variable_get_hash("upgrade_section_multiplier")))) || get_default_struct_value(shop_item, "upgrade_attributes_apply_early", false))
            {
                shop_item.upgrade_attributes_apply_early = true;
                array_push(global.shops_items_array_upgrade_early, shop_item);
            }
            else
            {
                array_push(global.shops_items_array_upgrade_late, shop_item);
            }
            array_push(global.shops_items_array, shop_item);
            array_push(variable_struct_get(global.shops_sorted, mkey), shop_item);
            if (!is_array(variable_struct_get(variable_struct_get(global.shops_sorted_sections, mkey), shop_item.section_key)))
            {
                variable_struct_set(variable_struct_get(global.shops_sorted_sections, mkey), shop_item.section_key, []);
            }
            array_push(variable_struct_get(variable_struct_get(global.shops_sorted_sections, mkey), shop_item.section_key), shop_item);
            if (shop_item.is_dlc)
            {
                variable_struct_set(global.dlc_items, shop_item.dlc_id, shop_item);
                if (!is_array(variable_struct_get(global.supporter_tier_item_keys, shop_item.supporters_tier)))
                {
                    variable_struct_set(global.supporter_tier_item_keys, shop_item.supporters_tier, []);
                }
                array_push(variable_struct_get(global.supporter_tier_item_keys, shop_item.supporters_tier), mkey2);
            }
            if (shop_item.supporters_only)
            {
                array_push(global.shops_supporter_items, shop_item);
            }
        }
        array_sort(variable_struct_get(global.shops_sorted, mkey), function(arg0, arg1)
        {
            return arg0.index - arg1.index;
        });
        _map(variable_struct_get(global.shops_sorted, mkey), function(arg0, arg1)
        {
            arg0.array_index = arg1;
        }, false);
        variable_struct_set(global.shops_keys, mkey, mkey);
    }
    _map(global.shops_items_array, function(arg0, arg1)
    {
        if (is_string(arg0.auto_upgrade_shop) && arg0.auto_upgrade_shop == "")
        {
            exit;
        }
        if (is_array(arg0.auto_upgrade_shop) && array_length(arg0.auto_upgrade_shop) == 0)
        {
            exit;
        }
        var shop_key_array = arg0.auto_upgrade_shop;
        if (is_string(arg0.auto_upgrade_shop))
        {
            shop_key_array = [arg0.auto_upgrade_shop];
        }
        var shop_items = [];
        var shop_items_length = array_length(shop_key_array);
        for (var s = 0; s < shop_items_length; s++)
        {
            var shop_key = shop_key_array[s];
            var shop = variable_struct_get(global.shops_sorted, shop_key);
            if (is_undefined(shop))
            {
                exit;
            }
            for (var si = 0; si < array_length(shop); si++)
            {
                var shop_item = shop[si];
                array_push(shop_items, shop_item);
            }
        }
        arg0.auto_upgrade = shop_items;
    }, false);
    _map(global.shops_items_array, function(arg0, arg1)
    {
        if (is_empty(arg0.auto_upgrade))
        {
            exit;
        }
        arg0.is_autobuyer = true;
        var find_auto_upgrades_array = arg0.auto_upgrade;
        if (!is_array(find_auto_upgrades_array))
        {
            find_auto_upgrades_array = [arg0.auto_upgrade];
        }
        arg0.auto_upgrade_item_cache = get_shop_items_by_array(find_auto_upgrades_array, [global.resources.gems, global.resources.borbs]);
        var __array = arg0.auto_upgrade_item_cache;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (get_default_struct_value(mitem, "disable_auto_upgrade", false))
            {
                continue;
            }
            array_push(mitem.auto_upgrade_parent, arg0);
            mitem.has_auto_upgrade = true;
        }
        array_push(global.shops_items_array_autobuyers, arg0);
    }, false);
    array_sort(global.shops_items_array, function(arg0, arg1)
    {
        return arg1.auto_upgrade_prio - arg0.auto_upgrade_prio;
    });
    _map(global.shops, function(arg0, arg1)
    {
        variable_struct_set(global.upgrade_attributes.prestige_persist_shops, arg1, get_cloned_struct_value(variable_struct_get(global.shops_prestige_levels, arg1), "level"));
    }, false);
    __struct = global.shops.dlc;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        var init_claim_struct = !is_struct(struct_get_from_hash(mitem.data, variable_get_hash("claimed_os")));
        if (init_claim_struct)
        {
            mitem.data.claimed_os = {};
        }
    }
    var __array = global.converters_array;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        call_method(mitem, mitem.init);
    }
    global.shops_items_gui.borbventure = get_shop_items(global.shops.borbventure, global.shops_sorted.borbventure);
}
