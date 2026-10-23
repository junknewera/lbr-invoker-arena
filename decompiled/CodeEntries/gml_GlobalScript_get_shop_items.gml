function get_shop_items(arg0, arg1, arg2, arg3 = undefined)
{
    if (is_undefined(arg2) || !arg2)
    {
        arg2 = UnknownEnum.Value_47;
    }
    var items = [];
    for (var i = 0; i < array_length(arg1); i++)
    {
        var item = variable_struct_get(arg0, arg1[i].key);
        var level_menu_item = new Gui_Item(arg2, id, 
        {
            item: item,
            
            button_text: function()
            {
                if (self.item.is_skin && get_upgrade_count(global.shops.dlc.skins_pack) == 1)
                {
                    return __("Use");
                }
                if (self.item.is_toggle && get_upgrade_count(self.item) > 0)
                {
                    return iif(self.item.data.toggle, __("On"), __("Off"));
                }
                else if (self.item.is_slider && get_upgrade_count(self.item) > 0)
                {
                    var slider_value = self.item.data.slider_value;
                    if (self.item.slider_format_number)
                    {
                        slider_value = number_format(slider_value, self.item.slider_format_number_dec);
                    }
                    return sprintf("%s%s%s", self.item.slider_prefix, slider_value, self.item.slider_affix);
                }
                else if (array_length(self.item.options) > 0 && get_upgrade_count(self.item) > 0)
                {
                    var option_text = get_shop_item_option_text(self.item);
                    return sprintf("%s%s%s", self.item.slider_prefix, option_text, self.item.slider_affix);
                }
                else if (self.item.is_usable && get_upgrade_count(self.item) > 0 && !self.item.add_to_inventory)
                {
                    return __("Use");
                }
                var ret_text = __("Buy");
                var shop_item_max_count = get_shop_item_max_count(self.item);
                if (o_game.key_modifier != 1 && shop_item_max_count > 1)
                {
                    var ret_text_count = abs(get_key_modifier_item(self.item));
                    ret_text_count = min(shop_item_max_count, ret_text_count);
                    if (ret_text_count > 1)
                    {
                        ret_text += (" " + string(ret_text_count));
                    }
                }
                return ret_text;
            },
            
            check: function()
            {
                if (is_method(self.item.can_buy) && !get_value_ext(self.item, self.item.can_buy))
                {
                    return false;
                }
                if (self.item.supporters_only)
                {
                    return has_any_dlc_pack();
                }
                if (self.item.is_skin && get_upgrade_count(global.shops.dlc.skins_pack) == 1)
                {
                    return true;
                }
                if ((is_array(self.item.auto_upgrade) || self.item.auto_upgrade != "") && get_upgrade_count(self.item) > 0)
                {
                    return true;
                }
                if ((self.item.is_toggle || self.item.is_slider || self.item.is_usable || array_length(self.item.options) > 0) && get_upgrade_count(self.item) > 0 && !self.item.add_to_inventory)
                {
                    return true;
                }
                var item_cost = get_item_cost(self.item, abs(get_key_modifier_item(self.item)));
                if (!has_enough_resources(item_cost))
                {
                    return false;
                }
                var max_count = get_shop_item_max_count(self.item);
                if (max_count > 0)
                {
                    return self.item.data.count < max_count;
                }
                return true;
            },
            
            func: function(arg0, arg1)
            {
                if (self.item.supporters_only && !has_any_dlc_pack())
                {
                    return false;
                }
                var click_dir = get_click_dir();
                instance_destroy(o_tooltip);
                refresh_dialog_surface();
                if (self.item.is_skin)
                {
                    if (get_upgrade_count(self.item) > 0 || get_upgrade_count(global.shops.dlc.skins_pack) == 1)
                    {
                        call_method(self.item, self.item.func, self.item.key);
                        self._func_after();
                    }
                    else
                    {
                        buy_item(self.item);
                    }
                    exit;
                }
                if (self.item.is_dlc)
                {
                    claim_dlc(self.item);
                    refresh_dlc_shop();
                    init_game_vars(true);
                    exit;
                }
                if (self.item.is_usable)
                {
                    if (self.item.add_to_inventory)
                    {
                        buy_item(self.item);
                    }
                    else if (get_upgrade_count(self.item) > 0)
                    {
                        self.item.func(self.item.key);
                    }
                    else
                    {
                        buy_item(self.item);
                    }
                }
                else if (self.item.is_toggle)
                {
                    if (get_upgrade_count(self.item) > 0)
                    {
                        self.item.data.toggle = !self.item.data.toggle;
                        if (is_method(self.item.func))
                        {
                            self.item.func(self.item);
                        }
                    }
                    else
                    {
                        buy_item(self.item);
                    }
                }
                else if (self.item.is_slider)
                {
                    if (get_upgrade_count(self.item) > 0)
                    {
                        var inc_value = click_dir * self.item.slider_step * get_key_modifier();
                        self.item.data.slider_value += inc_value;
                        self.item.data.slider_value = clamp(self.item.data.slider_value, self.item.slider_min, self.item.slider_max);
                        if (is_method(self.item.func))
                        {
                            self.item.func(self.item);
                        }
                    }
                    else
                    {
                        buy_item(self.item);
                    }
                }
                else if (array_length(self.item.options) > 0)
                {
                    if (get_upgrade_count(self.item) > 0)
                    {
                        var inc_value = click_dir;
                        self.item.data.slider_value += inc_value;
                        if (self.item.data.slider_value >= array_length(self.item.options))
                        {
                            self.item.data.slider_value = 0;
                        }
                        else if (self.item.data.slider_value < 0)
                        {
                            self.item.data.slider_value = array_length(self.item.options) - 1;
                        }
                        if (is_method(self.item.func))
                        {
                            self.item.func(self.item);
                        }
                    }
                    else
                    {
                        buy_item(self.item);
                    }
                }
                else if (arg1 == -1)
                {
                    buy_item(self.item, false, -1);
                }
                else
                {
                    buy_item(self.item, false, abs(get_key_modifier_item(self.item)));
                }
                self._func_after(self.item.key);
            },
            
            is_obfuscated: item.is_obfuscated,
            is_visible: item.is_visible
        });
        if (!is_undefined(arg3))
        {
            level_menu_item.section = arg3;
        }
        if (!is_undefined(struct_get_from_hash(item, variable_get_hash("section"))))
        {
            level_menu_item.section = item.section;
        }
        array_push(items, level_menu_item);
    }
    return items;
}

enum UnknownEnum
{
    Value_47 = 47
}
