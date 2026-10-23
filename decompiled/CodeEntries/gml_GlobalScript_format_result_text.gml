function format_result_text(arg0, arg1 = "[%s]", arg2 = "\n", arg3 = false)
{
    if (!is_struct(arg0))
    {
        return "";
    }
    if (!is_empty(arg1))
    {
        arg1 += " ";
    }
    var add_stats = [];
    if (!is_undefined(struct_get_from_hash(arg0, variable_get_hash("artifacts"))) && !arg3)
    {
        var text_row = sprintf(arg1, __("Artifacts"));
        var text_array = [];
        var __struct = arg0.artifacts;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var artifact = variable_struct_get(global.artifacts, mkey);
            if (is_undefined(artifact))
            {
                continue;
            }
            array_push(text_array, sprintf("%sx %s", mitem, artifact.name));
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("borbventure_borb"))))
    {
        var text_row = sprintf(arg1, __("Borbventure Borb"));
        var text_array = [];
        var __struct = arg0.borbventure_borb;
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
                var item = variable_struct_get(global.borbventures.borb_types, mkey2);
                var rarity = variable_struct_get(global.borbventures.borb_levels, mkey);
                if (is_undefined(item) || is_undefined(rarity))
                {
                    continue;
                }
                if (mitem2 == 0)
                {
                    continue;
                }
                array_push(text_array, sprintf("%sx %s", number_format(mitem2), item.name));
            }
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("borbventure_item"))) && !arg3)
    {
        var text_row = sprintf(arg1, __("Borbventure Items"));
        var text_array = [];
        var __struct = arg0.borbventure_item;
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
                var item = variable_struct_get(global.borbventures.borbventure_items, mkey2);
                if (is_undefined(item))
                {
                    continue;
                }
                if (mitem2 == 0)
                {
                    continue;
                }
                var rarity = variable_struct_get(global.borbventures.borb_levels, mkey);
                array_push(text_array, sprintf("+%sx %s %s", number_format(mitem2), rarity.name, item.name));
            }
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("borbventure_packs"))) && !arg3)
    {
        var text_row = sprintf(arg1, __("Borbventure Packs"));
        var text_array = [];
        var __struct = arg0.borbventure_packs;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var item = variable_struct_get(global.borbventures.borbventure_packs, mkey);
            if (is_undefined(item))
            {
                continue;
            }
            if (mitem == 0)
            {
                continue;
            }
            array_push(text_array, sprintf("%sx %s", number_format(mitem), item.name));
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("cards"))))
    {
        var text_row = sprintf(arg1, __("Cards"));
        var text_array = [];
        var __struct = arg0.cards;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var item = variable_struct_get(global.cards, mkey);
            if (is_undefined(item))
            {
                continue;
            }
            if (mitem == 0)
            {
                continue;
            }
            array_push(text_array, sprintf("%sx %s", number_format(mitem), item.name_full));
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("cards_packs"))) && !arg3)
    {
        var text_row = sprintf(arg1, __("Card Packs"));
        var text_array = [];
        var __struct = arg0.cards_packs;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var item = variable_struct_get(global.cards_packs, mkey);
            if (is_undefined(item))
            {
                continue;
            }
            if (mitem == 0)
            {
                continue;
            }
            array_push(text_array, sprintf("%sx %s", number_format(mitem), item.name));
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (!is_undefined(struct_get_from_hash(arg0, variable_get_hash("chests"))))
    {
        var text_row = sprintf(arg1, __("Chests"));
        var text_array = [];
        var __struct = arg0.chests;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var item = variable_struct_get(global.chests, mkey);
            if (is_undefined(item))
            {
                continue;
            }
            array_push(text_array, sprintf("%sx %s", mitem, item.name));
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (!is_undefined(struct_get_from_hash(arg0, variable_get_hash("community_leaves"))))
    {
        var text_row = sprintf(arg1, __("Community Leaves"));
        var text_array = [];
        var __struct = arg0.community_leaves;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var cleaf = variable_struct_get(global.community_leaves, mkey);
            if (is_undefined(cleaf))
            {
                continue;
            }
            array_push(text_array, sprintf("%sx %s", mitem, cleaf.name));
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("dice_rarity"))) && !arg3)
    {
        var text_row = sprintf(arg1, __("Dice"));
        var text_array = [];
        var __struct = arg0.dice_rarity;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var rarity = variable_struct_get(global.dice_rarity, mkey);
            if (is_undefined(rarity))
            {
                continue;
            }
            if (mitem == 0)
            {
                continue;
            }
            repeat (mitem)
            {
                array_push(text_array, sprintf("%sx %s %s", number_format(mitem), rarity.name, __("Die")));
            }
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (!is_undefined(struct_get_from_hash(arg0, variable_get_hash("equipment"))))
    {
        var text_row = sprintf(arg1, __("Equipment"));
        var text_array = [];
        var __struct = arg0.equipment;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var eq_item = variable_struct_get(global.equipment, mkey);
            if (is_undefined(eq_item))
            {
                continue;
            }
            array_push(text_array, sprintf("%sx %s", mitem, eq_item.name));
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("fish"))))
    {
        var text_row = sprintf(arg1, __("Fish"));
        var text_array = [];
        var __struct = arg0.fish;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var item = variable_struct_get(global.fish, mkey);
            if (is_undefined(item))
            {
                continue;
            }
            if (mitem == 0)
            {
                continue;
            }
            array_push(text_array, sprintf("%sx %s", number_format(mitem), item.get_name()));
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("fish_baits"))) && !arg3)
    {
        var text_row = sprintf(arg1, __("Fish Baits"));
        var text_array = [];
        var __struct = arg0.fish_baits;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var item = variable_struct_get(global.fishing_baits, mkey);
            if (is_undefined(item))
            {
                continue;
            }
            if (mitem == 0)
            {
                continue;
            }
            array_push(text_array, sprintf("%sx %s", number_format(mitem), item.name));
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("fish_rarity"))))
    {
        var text_row = sprintf(arg1, __("Fish"));
        var text_array = [];
        var __struct = arg0.fish_rarity;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var rarity = variable_struct_get(global.fish_rarity, mkey);
            if (is_undefined(rarity))
            {
                continue;
            }
            if (mitem == 0)
            {
                continue;
            }
            array_push(text_array, sprintf("%sx %s", number_format(mitem), __s("%s Fish", rarity.name)));
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("fishing_rods_rarity"))))
    {
        var text_row = sprintf(arg1, __("Fishing Rod"));
        var text_array = [];
        var __struct = arg0.fishing_rods_rarity;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var item = variable_struct_get(global.fishing_rods_rarity, mkey);
            if (is_undefined(item))
            {
                continue;
            }
            if (mitem == 0)
            {
                continue;
            }
            array_push(text_array, sprintf("%sx %s %s", number_format(mitem), item.name, __("Rod")));
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("journey_xp"))) && !arg3)
    {
        var text_row = sprintf(arg1, __("Journey"));
        var text_array = [];
        var __struct = arg0.journey_xp;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var res = variable_struct_get(global.journeys, mkey);
            if (is_undefined(res))
            {
                continue;
            }
            array_push(text_array, sprintf("%sxp", number_format(mitem, undefined, true)));
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("materials"))) && !arg3)
    {
        var text_row = sprintf(arg1, __("Materials"));
        var text_array = [];
        var __struct = arg0.materials;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var res = variable_struct_get(global.materials, mkey);
            if (is_undefined(res))
            {
                continue;
            }
            array_push(text_array, sprintf("%s %s", number_format(mitem), pluralize(mitem, res.name, res.name_plural)));
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("mine_item_rarity"))) && !arg3)
    {
        var text_row = sprintf(arg1, __("Mine Items"));
        var text_array = [];
        var __struct = arg0.mine_item_rarity;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var rarity = variable_struct_get(global.mine_rarity, mkey);
            if (is_undefined(rarity))
            {
                continue;
            }
            if (mitem == 0)
            {
                continue;
            }
            array_push(text_array, sprintf("%sx %s", number_format(mitem), rarity.name));
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("mine_item_rarity_type"))))
    {
        var text_row = sprintf(arg1, __("Mine Items"));
        var text_array = [];
        var __struct = arg0.mine_item_rarity_type;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var rarity = variable_struct_get(global.mine_rarity, mkey);
            if (is_undefined(rarity))
            {
                continue;
            }
            var __struct2 = mitem;
            var __prop_names2 = struct_get_names(__struct2);
            var __prop_len2 = array_length(__prop_names2);
            for (var __i2 = 0; __i2 < __prop_len2; __i2++)
            {
                var mkey2 = __prop_names2[__i2];
                var mitem2 = variable_struct_get(__struct2, mkey2);
                var type = variable_struct_get(global.mine_items, mkey2);
                if (is_undefined(type))
                {
                    continue;
                }
                if (mitem2 == 0)
                {
                    continue;
                }
                array_push(text_array, sprintf("%sx %s %s", number_format(mitem2), rarity.name, type.name));
            }
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_array(struct_get_from_hash(arg0, variable_get_hash("info"))))
    {
        var text_array = [];
        var __array = arg0.info;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            array_push(text_array, mitem);
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, implode("\n\n", text_array));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("misc"))))
    {
        var text_row = sprintf(arg1, __("Other"));
        var text_array = [];
        var __struct = arg0.misc;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var name = mkey;
            if (mitem == 0)
            {
                continue;
            }
            var display_value = number_format(mitem);
            var display_x = "";
            if (mkey == "tower_floors")
            {
                name = __("Tower Floors");
            }
            array_push(text_array, sprintf("%s%s %s", display_value, display_x, name));
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("relics"))))
    {
        var text_row = sprintf(arg1, __("Relics"));
        var text_array = [];
        var __struct = arg0.relics;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var item = variable_struct_get(global.relics, mkey);
            if (is_undefined(item))
            {
                continue;
            }
            if (mitem == 0)
            {
                continue;
            }
            array_push(text_array, sprintf("%sx %s", number_format(mitem), item.name));
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("relic_types"))))
    {
        var text_row = sprintf(arg1, __("Relics"));
        var text_array = [];
        var __struct = arg0.relic_types;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var item = variable_struct_get(global.relic_types, mkey);
            if (is_undefined(item))
            {
                continue;
            }
            if (mitem == 0)
            {
                continue;
            }
            var relic = array_random_item(variable_struct_get(global.relics_rarity_array, item.key));
            array_push(text_array, sprintf("%sx %s", number_format(mitem), relic.name));
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("resources"))) && !arg3)
    {
        var text_row = sprintf(arg1, __("Resources"));
        var text_array = [];
        var __struct = arg0.resources;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var res = variable_struct_get(global.resources, mkey);
            if (is_undefined(res))
            {
                continue;
            }
            array_push(text_array, sprintf("%s %s", number_format(mitem), pluralize(mitem, res.name, res.name_plural)));
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("resources_leafscended"))))
    {
        var text_row = sprintf(arg1, __("Leafscended"));
        var text_array = [];
        var __struct = arg0.resources_leafscended;
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
                var item = variable_struct_get(global.resources, mkey);
                if (is_undefined(item))
                {
                    continue;
                }
                if (mitem2 == 0)
                {
                    continue;
                }
                array_push(text_array, sprintf("%sx %s L%s", number_format(mitem2), pluralize(mitem2, item.name, item.name_plural), mkey2));
            }
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (!is_undefined(struct_get_from_hash(arg0, variable_get_hash("scrolls"))))
    {
        var text_row = sprintf(arg1, __("Scrolls"));
        var text_array = [];
        var __struct = arg0.scrolls;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var scroll = variable_struct_get(global.scrolls, mkey);
            if (is_undefined(scroll))
            {
                continue;
            }
            array_push(text_array, sprintf("%sx %s", mitem, scroll.name));
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (!is_undefined(struct_get_from_hash(arg0, variable_get_hash("stats"))))
    {
        var text_row = sprintf(arg1, __("Stats"));
        var text_array = [];
        var __struct = arg0.stats;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            if (is_undefined(variable_struct_get(o_game.data.stats, mkey)))
            {
                continue;
            }
            var name = get_default_struct_value(global.texts_stats, mkey, mkey);
            array_push(text_array, sprintf("%sx %s", number_format(mitem), name));
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (!is_undefined(struct_get_from_hash(arg0, variable_get_hash("upgrades"))))
    {
        var text_row = sprintf(arg1, __("Upgrades"));
        var ua_text = format_upgrade_text(arg0.upgrades);
        if (!is_empty(ua_text))
        {
            array_push(add_stats, text_row + ua_text);
        }
    }
    var items_text = implode(arg2, add_stats);
    return items_text;
}
