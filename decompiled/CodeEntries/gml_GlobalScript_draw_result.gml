function draw_result(arg0, arg1, arg2, arg3 = undefined, arg4 = undefined, arg5 = true, arg6 = gui_col_x(22), arg7 = true)
{
    if (!is_struct(arg2))
    {
        return 0;
    }
    var _result_opened = get_default_struct_value(arg4, "result_opened");
    if (!is_struct(_result_opened))
    {
        _result_opened = {};
    }
    var inline = get_default_struct_value(arg4, "inline", false);
    var mini = get_default_struct_value(arg4, "mini", false);
    var show_titles = get_default_struct_value(arg4, "show_titles", false);
    var y_start = arg1;
    if (is_struct(struct_get_from_hash(arg2, variable_get_hash("resources"))) && get_struct_length(arg2.resources) > 0)
    {
        set_struct_value(arg4, "collection", global.resources);
        if (show_titles)
        {
            arg1 += draw_heading(arg0, arg1, __("Resources"), undefined, undefined, undefined, undefined, false);
        }
        arg1 += draw_resources(arg0, arg1, arg2.resources, arg3, arg4, arg5);
    }
    if (is_struct(struct_get_from_hash(arg2, variable_get_hash("materials"))) && get_struct_length(arg2.materials) > 0)
    {
        if (show_titles)
        {
            arg1 += draw_heading(arg0, arg1, __("Materials"), undefined, undefined, undefined, undefined, false);
        }
        arg1 += draw_materials(arg0, arg1, arg2.materials, arg3, arg4, arg5);
    }
    if (is_struct(struct_get_from_hash(arg2, variable_get_hash("artifacts"))) && get_struct_length(arg2.artifacts) > 0)
    {
        if (show_titles)
        {
            arg1 += draw_heading(arg0, arg1, __("Artifacts"), undefined, undefined, undefined, undefined, false);
        }
        arg1 += draw_resources(arg0, arg1, arg2.artifacts, undefined, 
        {
            collection: global.artifacts,
            inline: inline
        }, arg5);
    }
    if (is_struct(struct_get_from_hash(arg2, variable_get_hash("borbventure_item"))) && get_struct_length(arg2.borbventure_item) > 0)
    {
        if (show_titles)
        {
            arg1 += draw_heading(arg0, arg1, __("Borbventure Items"), undefined, undefined, undefined, undefined, false);
        }
        arg1 += draw_item_list_struct_rarity(arg0, arg1, arg2.borbventure_item, global.borbventures.borbventure_items, undefined, arg4);
    }
    if (is_struct(struct_get_from_hash(arg2, variable_get_hash("borbventure_packs"))) && get_struct_length(arg2.borbventure_packs) > 0)
    {
        if (show_titles)
        {
            arg1 += draw_heading(arg0, arg1, __("Borbventure Packs"), undefined, undefined, undefined, undefined, false);
        }
        arg1 += draw_resources(arg0, arg1, arg2.borbventure_packs, undefined, 
        {
            collection: global.borbventures.borbventure_packs,
            inline: inline,
            resource_name: "name_full",
            show_resource_name: true,
            inline_padding_x: gui_col_x(12)
        });
    }
    if (is_struct(struct_get_from_hash(arg2, variable_get_hash("cards"))) && get_struct_length(arg2.cards) > 0)
    {
        if (show_titles)
        {
            arg1 += draw_heading(arg0, arg1, __("Cards"), undefined, undefined, undefined, undefined, false);
        }
        arg1 += draw_cards_result(arg0, arg1, arg2.cards);
    }
    if (is_struct(struct_get_from_hash(arg2, variable_get_hash("cards_packs"))) && get_struct_length(arg2.cards_packs) > 0)
    {
        if (show_titles)
        {
            arg1 += draw_heading(arg0, arg1, __("Card Packs"), undefined, undefined, undefined, undefined, false);
        }
        arg1 += draw_resources(arg0, arg1, arg2.cards_packs, undefined, 
        {
            collection: global.cards_packs,
            inline: inline,
            resource_name: "name_full",
            show_resource_name: true,
            inline_padding_x: gui_col_x(12)
        });
    }
    if (is_struct(struct_get_from_hash(arg2, variable_get_hash("dice_rarity"))) && get_struct_length(arg2.dice_rarity) > 0)
    {
        if (show_titles)
        {
            arg1 += draw_heading(arg0, arg1, __("Dice Items"), undefined, undefined, undefined, undefined, false);
        }
        if (is_struct(struct_get_from_hash(_result_opened, variable_get_hash("added"))) && is_struct(struct_get_from_hash(_result_opened.added, variable_get_hash("dice"))))
        {
            arg4.inline_padding_x = gui_col_x(6);
            arg4.show_resource_name = true;
            arg1 += draw_item_list_struct_rarity(arg0, arg1, _result_opened.added.dice, global.dice_types, undefined, 
            {
                inline: true,
                inline_padding_x: gui_col_x(8),
                show_resource_name: true
            });
        }
        else
        {
            arg1 += draw_resources(arg0, arg1, arg2.dice_rarity, undefined, 
            {
                collection: global.dice_rarity,
                inline: inline,
                resource_name: "name_full",
                show_resource_name: true,
                inline_padding_x: gui_col_x(8)
            });
        }
    }
    if (is_struct(struct_get_from_hash(arg2, variable_get_hash("fish"))) && get_struct_length(arg2.fish) > 0)
    {
        arg1 += draw_resources(arg0, arg1, arg2.fish, undefined, 
        {
            collection: global.fish,
            display_rarity: true,
            inline: inline,
            resource_name: "name_full",
            show_resource_name: true,
            suffix_value: "m"
        });
    }
    if (is_struct(struct_get_from_hash(arg2, variable_get_hash("fish_baits"))) && get_struct_length(arg2.fish_baits) > 0)
    {
        arg1 += draw_item_list_struct(arg0, arg1, arg2.fish_baits, global.fishing_baits, undefined, arg4);
    }
    if (is_struct(struct_get_from_hash(arg2, variable_get_hash("harbor_items"))) && get_struct_length(arg2.harbor_items) > 0)
    {
        if (show_titles)
        {
            arg1 += draw_heading(arg0, arg1, __("Harbor Items"), undefined, undefined, undefined, undefined, false);
        }
        if (is_struct(struct_get_from_hash(_result_opened, variable_get_hash("added"))) && is_struct(struct_get_from_hash(_result_opened.added, variable_get_hash("harbor_items"))))
        {
            arg4.inline_padding_x = gui_col_x(6);
            arg4.show_resource_name = true;
            arg1 += draw_item_list_struct_rarity(arg0, arg1, _result_opened.added.harbor_items, global.harbor_inventory.items, undefined, 
            {
                inline: true,
                inline_padding_x: gui_col_x(8),
                show_resource_name: true
            });
        }
        else
        {
            arg1 += draw_resources(arg0, arg1, arg2.harbor_items, undefined, 
            {
                collection: global.harbor_inventory.items,
                inline: inline,
                mini: mini,
                show_resource_name: true,
                inline_padding_x: gui_col_x(8)
            });
        }
    }
    if (is_struct(struct_get_from_hash(arg2, variable_get_hash("harbor_items_rarity"))) && get_struct_length(arg2.harbor_items_rarity) > 0)
    {
        arg1 += draw_rarities(arg0, arg1, arg2.harbor_items_rarity, global.harbor_item_rarity);
    }
    if (is_struct(struct_get_from_hash(arg2, variable_get_hash("journey_xp"))) && get_struct_length(arg2.journey_xp) > 0)
    {
        var __struct = arg2.journey_xp;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var item = variable_struct_get(global.journeys, mkey);
            if (!is_struct(item))
            {
                continue;
            }
            gui_draw_sprite(arg0 + 8, arg1 + 24, spr_icon_journey, undefined, undefined, undefined, item.name, undefined, sprintf("+%s Exp", number_format(mitem)));
            arg1 += gui_col_y(0.75);
        }
    }
    if (is_struct(struct_get_from_hash(arg2, variable_get_hash("leafscended_leaves"))) && get_struct_length(arg2.leafscended_leaves) > 0)
    {
        set_struct_value(arg4, "collection", global.resources);
        if (show_titles)
        {
            arg1 += draw_heading(arg0, arg1, __("Leafscended Leaves"), undefined, undefined, undefined, undefined, false);
        }
        arg1 += draw_leafscended_leaves(arg0, arg1, arg2.leafscended_leaves, arg3, arg4, arg5);
    }
    if (is_struct(struct_get_from_hash(arg2, variable_get_hash("mine_item_rarity"))) && get_struct_length(arg2.mine_item_rarity) > 0)
    {
        if (show_titles)
        {
            arg1 += draw_heading(arg0, arg1, __("Mine Items"), undefined, undefined, undefined, undefined, false);
        }
        if (is_struct(struct_get_from_hash(_result_opened, variable_get_hash("added"))) && is_struct(struct_get_from_hash(_result_opened.added, variable_get_hash("mine_item_rarity_type"))))
        {
            arg4.inline_padding_x = gui_col_x(6);
            arg4.show_resource_name = true;
            arg1 += draw_item_list_struct_rarity(arg0, arg1, _result_opened.added.mine_item_rarity_type, global.mine_items, undefined, 
            {
                inline: true,
                inline_padding_x: gui_col_x(8),
                inventory_full: struct_get_from_hash(_result_opened.inventory_full, variable_get_hash("mine_item_rarity_type")),
                show_resource_name: true
            });
        }
        else
        {
            arg1 += draw_resources(arg0, arg1, arg2.mine_item_rarity, undefined, 
            {
                collection: global.mine_rarity,
                inline: inline,
                resource_name: "name_full",
                show_resource_name: true,
                inline_padding_x: gui_col_x(8)
            });
        }
    }
    arg1 += gui_col_y(0.5);
    if (is_struct(struct_get_from_hash(_result_opened, variable_get_hash("inventory_full"))) && get_struct_length(_result_opened.inventory_full) > 0)
    {
        arg1 += draw_description(arg0, arg1, sprintf("* %s", __s("Inventory full")));
    }
    if (arg7)
    {
        arg1 += draw_description(arg0, arg1, format_result_text(arg2, undefined, undefined, true));
    }
    var prefix = get_default_struct_value(arg4, "result_prefix", undefined);
    if (is_string(prefix))
    {
        draw_description(arg0 - gui_col_x(0.5), y_start + 4, prefix, undefined, 2);
    }
    return arg1 - y_start;
}

function draw_leafscended_leaves(arg0, arg1, arg2, arg3, arg4 = 1, arg5 = undefined, arg6 = undefined)
{
    var y_start = arg1;
    var __struct = arg2;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
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
            gui_draw_sprite(arg0, arg1 + gui_col_y(0.5), spr_gui_arrow_right);
            arg1 += draw_resource(arg0 + gui_col_x(0.6), arg1, mitem, mitem2, arg4, mkey2);
        }
    }
    return arg1 - y_start;
}

function draw_resource(arg0, arg1, arg2, arg3 = 0, arg4 = 1, arg5 = 0, arg6 = undefined)
{
    var width = 32;
    var height = 32;
    var insufficient_indicator = get_default_struct_value(arg6, "insufficient_indicator", false);
    var show_current_collection_count = get_default_struct_value(arg6, "show_current_collection_count", false);
    var text_prefix = get_default_struct_value(arg6, "text_prefix", undefined);
    var text_suffix = get_default_struct_value(arg6, "text_suffix", undefined);
    draw_sprite_stretched_ext(arg2.sprite, 0, arg0 - 9, arg1 - 2, width, height, c_white, 1);
    if (arg5 > 0)
    {
        set_default_font(f_gui_small);
        draw_text_shadow((arg0 + width) - 8, arg1 - 4, arg5);
    }
    var text = string(arg3);
    if (is_string(text_prefix))
    {
        text = text_prefix + text;
    }
    if (show_current_collection_count)
    {
        text += sprintf("/%s", number_format(arg2.data.count));
    }
    if (is_string(text_suffix))
    {
        text += text_suffix;
    }
    var color_row = 16777215;
    if (insufficient_indicator)
    {
        var insufficient_indicator_base_value = get_default_struct_value(arg6, "insufficient_indicator_base_value", arg2.data.count);
        var insufficient_indicator_check_value = get_default_struct_value(arg6, "insufficient_indicator_check_value", arg3);
        color_row = (insufficient_indicator_base_value >= insufficient_indicator_check_value) ? 16777215 : global.colors.insufficient_indicator;
    }
    set_default_font(f_gui_default, undefined, undefined, color_row);
    draw_text(arg0 + width + 4, arg1 - 4, text);
    return height;
}
