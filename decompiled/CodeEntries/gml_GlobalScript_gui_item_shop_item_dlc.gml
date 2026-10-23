function gui_item_shop_item_dlc(arg0, arg1, arg2)
{
    if (live_auto_call_1())
    {
        var lac_argc = argument_count;
        var lac_args = array_create(lac_argc);
        var lac_argk = 0;
        repeat (lac_argc)
        {
            lac_args[lac_argk] = argument[lac_argk];
            lac_argk++;
        }
        if (live_auto_call_2(lac_args))
        {
            return global.live_result;
        }
    }
    var draw_buy_button = false;
    var draw_buy_button_max = false;
    var draw_price = false;
    var item = arg2.item;
    if (!is_struct(item))
    {
        return 0;
    }
    if (!is_struct(struct_get_from_hash(item.data, variable_get_hash("claimed_os"))))
    {
        item.data.claimed_os = {};
    }
    var col = 16777215;
    draw_sprite_stretched_ext(item.sprite, item.sprite_image_index, arg0 + 8, arg1 - 12, 32, 32, col, 1);
    var is_free = get_value_ext(item, item.is_free);
    var item_name = get_value_ext(item, item.name, false);
    var name = item_name;
    var description = get_value_ext(arg2.instance, item.description, item);
    var dlc_item_bought = is_dlc_purchase_valid(item.dlc_id);
    if (dlc_item_bought)
    {
        var bought_text = is_free ? __("Free") : __("Bought");
        name = sprintf("%s (%s)", item_name, bought_text);
    }
    draw_heading(arg0 + gui_col_x(1), arg1, name);
    var y_height = draw_description(arg0 + gui_col_x(1), arg1 + gui_col_y(0.5), description, gui_col_x(10));
    y_height = max(global.gui_items_default_height, y_height);
    var timeout_key = sprintf("iap_timeout_%s", item.dlc_id);
    var can_do_action = !has_timeout(timeout_key);
    if (!dlc_item_bought)
    {
        if (global.is_opera)
        {
            draw_description(arg0 + gui_col_x(17), arg1 + gui_col_y(0.9), __s("Currently unavailable for %s.", "GX.Games") + "\n" + __s("Play on Steam, Android or iOS to purchase."), gui_col_x(6));
        }
        else
        {
            if (is_struct(variable_struct_get(global.dlc_prices, item.dlc_id)))
            {
                var dlc_price = variable_struct_get(global.dlc_prices, item.dlc_id);
                var initial_price_f = sprintf("$%s", string_format(dlc_price.initial, 0, 2));
                if (!is_undefined(struct_get_from_hash(dlc_price, variable_get_hash("initial_price_f"))))
                {
                    initial_price_f = dlc_price.initial_price_f;
                }
                draw_heading(arg0 + gui_col_x(12.5), arg1 + gui_col_y(0.9), initial_price_f, gui_col_x(4));
                if (dlc_price.initial != dlc_price.final)
                {
                    var discount_pct = calc_percent(dlc_price.final, dlc_price.initial) - 100;
                    var final_price_f = sprintf("$%s (%s%)", string_format(dlc_price.final, 0, 2), string_format(discount_pct, 0, 0));
                    draw_line_width(arg0 + gui_col_x(12.5), arg1 + gui_col_y(0.95), arg0 + gui_col_x(14), arg1 + gui_col_y(0.9), 3);
                    draw_heading(arg0 + gui_col_x(12.5), arg1 + gui_col_y(1.9), final_price_f, gui_col_x(4));
                }
            }
            if (is_dlc_purchase_pending(item.dlc_id))
            {
                draw_description(arg0 + gui_col_x(20), arg1 + gui_col_y(0.9), __("Purchase is pending, please wait..."), gui_col_x(6));
            }
            else if (gui_button(arg0 + gui_col_x(20), arg1 + gui_col_y(0.5), __("Buy"), can_do_action, gui_col_x(3.5)))
            {
                if (global.is_mobile)
                {
                    if (global.is_android && !extension_stubfunc_real())
                    {
                        return text_dialog(__("You are not connected to the Google Play Store. Please log in to your Google account and try again."), undefined, undefined, "supporter_shop");
                    }
                    else if (global.is_ios && !o_mobile_helper.connected_to_store)
                    {
                        return text_dialog(__("You are not connected to the App Store. Please check your internet connection, restart the game and try again."), undefined, undefined, "supporter_shop");
                    }
                    logf("trying to purchase", item.dlc_id);
                    if (global.is_android)
                    {
                        extension_stubfunc_real(item.dlc_id);
                    }
                    else if (global.is_ios)
                    {
                        notify(__s("Purchase dialog is opening, please wait..."), "important");
                        extension_stubfunc_real(item.dlc_id);
                    }
                }
                else
                {
                    if (!steam_initialised() || !steam_is_overlay_enabled())
                    {
                        text_dialog(__("You have to activate Steam Overlay in order to buy these items."), undefined, undefined, o_shop.current_nav_key);
                        exit;
                    }
                    if (is_dlc_purchase_valid(item.dlc_id))
                    {
                        text_dialog(__("You already own this item."), undefined, undefined, o_shop.current_nav_key);
                        exit;
                    }
                    if (get_default_struct_value(item, "is_iap", false))
                    {
                        set_timeout(timeout_key, sec(10));
                        post_to_cloud("iap", "buy", 
                        {
                            dlc_id: item.dlc_id
                        }, handle_iap_init_response, notify_error);
                        notify(__("Initializing purchase, please wait..."));
                    }
                    else
                    {
                        steam_activate_overlay_store(item.dlc_id);
                    }
                }
            }
        }
    }
    else
    {
        var claimed = is_dlc_claimed(item.key);
        if (!claimed)
        {
            var shop_item_key = item.key;
            if (shop_item_key == "material_pack")
            {
                shop_item_key = "materials_pack";
            }
            if (!is_undefined(struct_get_from_hash(item, variable_get_hash("check_claim"))))
            {
                can_do_action = item.check_claim();
            }
            if (global.is_mobile && instance_exists(o_mobile_helper) && !is_struct(o_mobile_helper.purchasesData))
            {
                set_default_font(f_gui_small);
                var connecting_to_store_text = __("Connecting to the store, please wait...");
                draw_description(arg0 + gui_col_x(17), arg1 + gui_col_y(0.9), connecting_to_store_text, gui_col_x(6));
            }
            else if (gui_button(arg0 + gui_col_x(20), arg1 + gui_col_y(0.5), __("Claim"), can_do_action, gui_col_x(2.5)))
            {
                variable_struct_set(variable_struct_get(o_game.data.dlc_claimed, item.key), 0, true);
                arg2._func(item);
            }
        }
        else
        {
            set_default_font(f_gui_small);
            var claimed_text = __s("You have claimed this item for %s.", global.os_type_text);
            draw_description(arg0 + gui_col_x(17), arg1 + gui_col_y(0.9), claimed_text, gui_col_x(6));
        }
    }
    gui_draw_buy_debug(item);
    return y_height + gui_col_y(0.5);
}

function gui_item_shop_item_dlc_add_draw()
{
    if (live_auto_call_1())
    {
        var lac_argc = argument_count;
        var lac_args = array_create(lac_argc);
        var lac_argk = 0;
        repeat (lac_argc)
        {
            lac_args[lac_argk] = argument[lac_argk];
            lac_argk++;
        }
        if (live_auto_call_2(lac_args))
        {
            return global.live_result;
        }
    }
    if (global.is_mobile)
    {
        set_default_font(f_gui_small, 0);
        var connected_to_store = instance_exists(o_mobile_helper) && o_mobile_helper.connected_to_store;
        var has_purchase_data = instance_exists(o_mobile_helper) && is_struct(o_mobile_helper.purchasesData);
        var text = [];
        array_push(text, connected_to_store ? __("Connected to store") : __("Not connected to store"));
        array_push(text, has_purchase_data ? __("Purchase data retrieved") : __("Purchase data not retrieved"));
        draw_description(add_text_base_x, add_text_base_y, implode(" | ", text), gui_col_x(8));
    }
    var can_claim_all = false;
    var __struct = global.shops.dlc;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (is_dlc_purchase_valid(mitem.dlc_id) && !is_dlc_claimed(mkey))
        {
            can_claim_all = true;
            break;
        }
    }
    if (gui_button_tl(add_button_base_x + gui_col_x(8), add_button_base_y, __("Claim all"), can_claim_all, gui_col_x(3)))
    {
        __struct = global.shops.dlc;
        __prop_names = struct_get_names(__struct);
        __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            if (!is_dlc_purchase_valid(mitem.dlc_id))
            {
                continue;
            }
            if (is_dlc_claimed(mkey))
            {
                continue;
            }
            claim_dlc(mitem);
        }
        refresh_dlc_shop();
        init_game_vars(true);
    }
    if (gui_button_tl(add_button_base_x + gui_col_x(13), add_button_base_y, __("Restore DLC Purchases"), !has_timeout("restore_dlc_purchases"), gui_col_x(4)))
    {
        notify(__("Restoring purchase data..."));
        restore_dlc_purchases(true);
        set_timeout("restore_dlc_purchases", sec(30));
    }
    if (!global.is_ios)
    {
        if (gui_button_tl(add_button_base_x + gui_col_x(19), add_button_base_y, __("Redeem code"), undefined, gui_col_x(3)))
        {
            open_dialog("redeem_code");
        }
    }
}
