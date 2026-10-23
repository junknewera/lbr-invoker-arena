function check_recipes()
{
    if (!is_unlocked_alchemy())
    {
        exit;
    }
    var __struct = global.recipes;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        mitem.check();
    }
}

function get_brew_crit_chance()
{
    return get_upgrade_attribute_value(global.upgrade_attributes.alchemy_brew_crit_chance);
}

function get_brew_crit_max_count()
{
    return global.game_settings.alchemy_brew_crit_max_count;
}

function get_brew_crit_multi_chance()
{
    var base_multi_crit = global.game_settings.alchemy_brew_crit_multi_chance + get_upgrade_attribute_value(global.upgrade_attributes.alchemy_brew_crit_multi_chance);
    var add_multi_crit = max(0, get_brew_crit_chance() - 1);
    return base_multi_crit + add_multi_crit;
}

function get_brew_multiplier()
{
    var value = get_upgrade_attribute_value(global.upgrade_attributes.alchemy_brew_multiplier);
    return value;
}

function gui_item_alchemy_add_draw()
{
    if (has_bought_shop_item_safe(global.shops.ancient.autobrew))
    {
        global.options.alchemy_autobrew_enabled.draw(add_button_base_x - gui_col_x(0.8), add_button_base_y);
    }
    var add_text = implode(" | ", [__s("Brew multiplier: %s", number_format_percent(get_brew_multiplier())), __s("Crit chance: %s", number_format_percent(get_brew_crit_chance())), __s("Multi Crit chance: %s", number_format_percent(get_brew_crit_multi_chance()))]);
    draw_description(add_text_base_x + global.gui_settings.content_width, add_text_base_y, add_text, gui_col_x(15), 2);
}
