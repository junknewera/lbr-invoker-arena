function gui_item_shop_item(arg0, arg1, arg2)
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
    var description_x = arg0 + gui_col_x(1);
    var description_width = gui_col_x(11);
    var name_x = arg0 + gui_col_x(1);
    var sprite_x = arg0 + 16;
    if (arg2.draw_fav)
    {
        var fav_offset_items = gui_col_x(1);
        description_x += fav_offset_items;
        description_width -= fav_offset_items;
        name_x += fav_offset_items;
        sprite_x += fav_offset_items;
    }
    var y_height = global.gui_items_default_height;
    if (!is_struct(item))
    {
        return y_height;
    }
    var item_name = get_value_ext(item, item.name, false);
    if (!is_undefined(struct_get_from_hash(item, variable_get_hash("get_name"))))
    {
        item_name = item.get_name();
    }
    var name = sprintf("%s (%s)", item_name, number_format(item.data.count, 2, false, false));
    var description = get_value_ext(item, item.description, item);
    if (!is_undefined(struct_get_from_hash(item, variable_get_hash("get_description"))))
    {
        description = item.get_description();
    }
    if (!is_undefined(struct_get_from_hash(item, variable_get_hash("description_dynamic"))))
    {
        description += ("\n" + get_value_ext(item, item.description_dynamic, item));
    }
    if (!is_undefined(struct_get_from_hash(item, variable_get_hash("result"))))
    {
        if (!is_empty(description))
        {
            description += "\n";
        }
        description += format_result_text(struct_get_from_hash(item, variable_get_hash("result")), "", ", ");
    }
    var upgrade_count = get_upgrade_count(item);
    var max_count = get_shop_item_max_count(item);
    var is_obfuscated = false;
    if (upgrade_count == 0)
    {
        is_obfuscated = get_value_ext(item, arg2._is_obfuscated, item);
    }
    var col = iif(is_obfuscated, 0, 16777215);
    var sprite_x_final = sprite_x;
    var sprite_y_final = arg1 + 16;
    draw_sprite_contain(item.sprite, item.sprite_image_index, sprite_x_final, sprite_y_final, 32, 0, col, 1, undefined, true);
    if (item.is_static || item.is_usable)
    {
        name = item_name;
        if (item.is_usable)
        {
            name = item_name;
        }
        else if (max_count == 1 && upgrade_count == 1)
        {
            name = sprintf("%s (%s)", item_name, __("Bought"));
        }
        else if (upgrade_count > 0)
        {
            name = sprintf("%s (%s %sx)", item_name, __("Bought"), upgrade_count);
        }
    }
    else if (max_count == 1)
    {
        name = sprintf("%s", item_name);
        if (item.data.count == 1)
        {
            name = sprintf("%s (%s)", item_name, __("Bought"));
        }
    }
    else if (max_count > 0)
    {
        if (item.is_upgradable)
        {
            name = sprintf("%s (%s/%s | %s %s)", item_name, item.data.count, max_count, __("Level"), item.data.upgrade_level);
        }
        else
        {
            name = sprintf("%s (%s/%s)", item_name, item.data.count, max_count);
        }
    }
    if (item.data.inventory > 0)
    {
        name += sprintf(" (%sx)", item.data.inventory);
    }
    if (is_obfuscated)
    {
        draw_buy_button = false;
        name = "?";
        description = get_default_value(struct_get_from_hash(item, variable_get_hash("description_locked")), "");
    }
    if (arg2.is_hidden_until_bought && item.data.count == 0)
    {
        name = "?";
        description = "";
    }
    arg1 += draw_heading(name_x, arg1, name, gui_col_x(11), undefined, undefined, 0);
    arg1 -= gui_col_y(1.4);
    set_default_font(f_gui_small);
    y_height = max(y_height, string_height_ext(description, global.gui_text_line_height, description_width) + global.gui_items_padding);
    draw_text_ext(description_x, arg1 + gui_col_y(0.9), description, global.gui_text_line_height, description_width);
    if (!get_value_ext(item, item.is_buyable))
    {
        draw_buy_button = false;
        draw_buy_button_max = false;
        draw_price = false;
    }
    else if (item.is_skin && get_upgrade_count(global.shops.dlc.skins_pack) == 1)
    {
        draw_buy_button = true;
        draw_buy_button_max = false;
        draw_price = false;
    }
    else if (item.auto_upgrade != "" && upgrade_count == 1)
    {
        draw_buy_button = true;
        draw_buy_button_max = true;
        draw_price = false;
    }
    else if ((item.is_toggle || item.is_slider || array_length(item.options) > 0) && upgrade_count == 1)
    {
        draw_buy_button = true;
        draw_buy_button_max = true;
        draw_price = false;
    }
    else if (item.is_usable)
    {
        draw_buy_button = true;
        if (item.is_static)
        {
            draw_price = true;
        }
        else
        {
            draw_price = upgrade_count == 0;
        }
    }
    else if (max_count == 0 && !is_infinity(upgrade_count))
    {
        draw_buy_button = true;
        draw_price = true;
        if (!item.is_static)
        {
            draw_buy_button_max = true;
        }
    }
    else if (upgrade_count < max_count && !is_infinity(upgrade_count))
    {
        draw_buy_button = true;
        draw_buy_button_max = true;
        draw_price = true;
    }
    if (!get_default_struct_value(item, "can_buy_max", true))
    {
        draw_buy_button_max = false;
    }
    if (item.supporters_tier > UnknownEnum.Value_0)
    {
        var supporter_active = item.data.count > 0 && !is_obfuscated;
        var supporter_sprite = supporter_active ? spr_icon_check : spr_icon_cancel;
        var supporter_text = (supporter_active > 0) ? __("Active") : __("Inactive");
        draw_text_icon(arg0 + gui_col_x(18), arg1 + gui_col_y(0.5), supporter_sprite, supporter_text, 32);
    }
    if (item.is_skin && (upgrade_count == 1 || has_dlc_pack(global.is_mobile ? "skins_pack" : "1482632")) && is_struct(item.target_item))
    {
        if (gui_button(arg0 + gui_col_x(22), arg1 + gui_col_y(0.5), __("Reset"), undefined, gui_col_x(2), undefined, global.static_structs.tooltip_pet_reset))
        {
            item.target_item.data.skin = undefined;
            call_method(item.target_item, item.target_item.refresh_skin);
        }
    }
    if (!is_undefined(struct_get_from_hash(item, variable_get_hash("has_auto_upgrade"))) && item.has_auto_upgrade)
    {
        var item_changed = false;
        var au_btn_text = item.data.auto_upgrade_prio_user;
        if (item.data.auto_upgrade_prio_user <= 0)
        {
            au_btn_text = __("Off");
        }
        else if (item.data.auto_upgrade_prio_user == 1)
        {
            au_btn_text = __("On");
        }
        var btn_opt = 
        {
            tooltip: __("Autobuy priority")
        };
        if (get_upgrade_count(global.shops.blc.autobuy_priority) == 1)
        {
            var change_val = get_click_dir();
            var autobuy_min = 0;
            var autobuy_max = 10;
            if (gui_button(arg0 + gui_col_x(20.5), arg1 + gui_col_y(0.5), au_btn_text, true, gui_col_x(1.5), false, btn_opt))
            {
                if (keyboard_check(vk_shift))
                {
                    item.data.auto_upgrade_prio_user = iif(change_val == 1, 1, 0);
                }
                else
                {
                    change_val *= get_key_modifier("prio");
                    item.data.auto_upgrade_prio_user += change_val;
                }
                if (item.data.auto_upgrade_prio_user > autobuy_max)
                {
                    item.data.auto_upgrade_prio_user = autobuy_min;
                }
                else if (item.data.auto_upgrade_prio_user < 0)
                {
                    item.data.auto_upgrade_prio_user = autobuy_max;
                }
                item.data.auto_upgrade_prio_user = clamp(item.data.auto_upgrade_prio_user, autobuy_min, autobuy_max);
                item_changed = true;
            }
            var au_qty_btn_text = number_format(item.data.max_buy_user, 2);
            if (item.data.max_buy_user == -1)
            {
                au_qty_btn_text = __("Inf");
            }
            var au_qty_btn_opt = 
            {
                tooltip: __("Autobuy max count")
            };
            if (max_count != 1 && gui_button(arg0 + gui_col_x(22), arg1 + gui_col_y(0.5), au_qty_btn_text, true, gui_col_x(1.5), false, au_qty_btn_opt))
            {
                change_val *= get_key_modifier();
                item.data.max_buy_user += change_val;
                item.data.max_buy_user = max(item.data.max_buy_user, -1);
                if (max_count != 0)
                {
                    item.data.max_buy_user = min(item.data.max_buy_user, max_count);
                }
                item_changed = true;
            }
        }
        if (item_changed)
        {
            item.refresh_parents();
        }
    }
    gui_draw_buy_debug(item, arg0, arg1);
    if (is_obfuscated || !draw_buy_button)
    {
        return y_height;
    }
    if (draw_price)
    {
        set_default_font(f_gui_default);
        draw_resources(arg0 + gui_col_x(12.5), arg1, get_item_cost(item, abs(get_key_modifier_item(item))), undefined, global.static_structs.show_resource_tooltip);
    }
    var can_do_action = get_value_ext(arg2, arg2._check);
    var btn_tooltip = get_value_ext(arg2, arg2._button_tooltip);
    var btn_options = undefined;
    if (!is_empty(btn_tooltip))
    {
        btn_options = 
        {
            tooltip: btn_tooltip
        };
    }
    if (gui_button(arg0 + gui_col_x(16.5), arg1 + gui_col_y(0.5), get_value_ext(arg2, arg2._button_text), can_do_action, gui_col_x(2), false, btn_options))
    {
        if (item.is_dlc)
        {
            if (!steam_initialised() || !steam_is_overlay_enabled())
            {
                text_dialog(__("You have to activate Steam Overlay in order to buy these items."));
                return y_height;
            }
            if (is_dlc_purchase_valid(item.dlc_id))
            {
                text_dialog(__("You already own this item."));
                return y_height;
            }
            steam_activate_overlay_store(item.dlc_id);
        }
        else
        {
            call_method(arg2, arg2._func);
        }
    }
    if (item.data.inventory > 0)
    {
        if (gui_button(arg0 + gui_col_x(18.5), arg1 + gui_col_y(0.5), __("Use"), true, gui_col_x(2)))
        {
            item.data.inventory -= 1;
            call_method(item, item.use, item);
        }
    }
    else if (draw_buy_button_max)
    {
        if (arg2.buy_max && gui_button(arg0 + gui_col_x(18.5), arg1 + gui_col_y(0.5), __("Buy max"), can_do_action, gui_col_x(2)))
        {
            var max_loop = 0;
            arg2._func(item, -1);
            refresh_ua_section(["shops", "shops_early", "shops_late"]);
            if (!is_undefined(struct_get_from_hash(item, variable_get_hash("after_apply"))))
            {
                item.after_apply();
            }
        }
    }
    var actual_item = get_default_struct_value(item, "item", item);
    gui_draw_buy_upgrades(arg0, arg1, actual_item);
    if (arg2.draw_fav)
    {
        gui_draw_fav(arg0 + gui_col_x(0.3), arg1 + gui_col_y(1), item);
    }
    if (!is_undefined(struct_get_from_hash(arg2, variable_get_hash("add_draw"))))
    {
        arg2.add_draw(arg2, arg0, arg1);
    }
    return y_height;
}

enum UnknownEnum
{
    Value_0
}
