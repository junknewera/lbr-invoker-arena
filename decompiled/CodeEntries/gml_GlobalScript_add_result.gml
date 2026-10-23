function add_result(arg0, arg1 = "", arg2 = undefined, arg3 = false, arg4 = false, arg5 = undefined, arg6 = true, arg7 = false, arg8 = false, arg9 = "[%s] ", arg10 = false, arg11 = 1)
{
    if (!is_struct(arg0))
    {
        exit;
    }
    if (arg8)
    {
        arg6 = true;
    }
    if (arg10)
    {
        global.disable_inventory_check = true;
    }
    var opened_items = 
    {
        added: {},
        inventory_full: {}
    };
    var res = {};
    var add_stats = [];
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("artifacts"))))
    {
        var text_row = sprintf(arg9, __("Artifacts"));
        var text_array = [];
        if (is_numeric(struct_get_from_hash(arg0.artifacts, variable_get_hash("__all"))))
        {
            arg0.artifacts = pluck_set_result(global.artifacts, arg0.artifacts.__all);
        }
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
            if (mitem == 0)
            {
                continue;
            }
            artifact.collect(true, mitem * arg11);
            array_push(text_array, sprintf("%sx %s", number_format(mitem * arg11), artifact.name));
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("borbventure_borb"))))
    {
        var text_row = sprintf(arg9, __("Borbventure Borb"));
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
                var borb = global.borbventures.recruit(item, rarity, undefined, true);
                array_push(text_array, sprintf("%sx %s", number_format(mitem2), borb.get_name()));
            }
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("borbventure_item"))))
    {
        var text_row = sprintf(arg9, __("Borbventure Items"));
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
                var add_item_result = global.borbventures.add_item(mkey2, mitem2, rarity);
                if (is_struct(add_item_result) && is_undefined(struct_get_from_hash(add_item_result, variable_get_hash("game_item_type"))))
                {
                    set_struct_value(arg0, "resources", {}, true);
                    var __struct3 = add_item_result;
                    var __prop_names3 = struct_get_names(__struct3);
                    var __prop_len3 = array_length(__prop_names3);
                    for (var __i3 = 0; __i3 < __prop_len3; __i3++)
                    {
                        var mkey3 = __prop_names3[__i3];
                        var mitem3 = variable_struct_get(__struct3, mkey3);
                        add_to_struct_value(arg0.resources, mkey3, mitem3);
                    }
                }
                array_push(text_array, sprintf("+%sx %s %s", number_format(mitem2), rarity.name, item.name));
            }
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("borbventure_packs"))))
    {
        var text_row = sprintf(arg9, __("Borbventure Packs"));
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
            item.collect(mitem * arg11);
            array_push(text_array, sprintf("%sx %s", number_format(mitem * arg11), item.name));
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("cards"))))
    {
        var text_row = sprintf(arg9, __("Cards"));
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
            item.collect(mitem * arg11);
            array_push(text_array, sprintf("%sx %s", number_format(mitem * arg11), item.name_full));
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("cards_packs"))))
    {
        var text_row = sprintf(arg9, __("Card Packs"));
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
            item.collect(mitem * arg11);
            array_push(text_array, sprintf("%sx %s", number_format(mitem * arg11), item.name));
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("chests"))))
    {
        var text_row = sprintf(arg9, __("Chests"));
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
            if (mitem == 0)
            {
                continue;
            }
            item.collect(mitem * arg11);
            array_push(text_array, sprintf("%sx %s", number_format(mitem * arg11), item.name));
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("community_leaves"))))
    {
        var text_row = sprintf(arg9, __("Community Leaves"));
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
            if (mitem == 0)
            {
                continue;
            }
            cleaf.collect(mitem * arg11);
            array_push(text_array, sprintf("%sx %s", number_format(mitem * arg11), cleaf.name));
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("dice_rarity"))))
    {
        var text_row = sprintf(arg9, __("Dice"));
        var text_array = [];
        if (!is_struct(struct_get_from_hash(opened_items.added, variable_get_hash("dice"))))
        {
            opened_items.added.dice = {};
        }
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
            repeat (mitem * arg11)
            {
                var add_text = "";
                var type = get_random_dice_type();
                var d = create_die(type, rarity, false);
                var die_existing = get_die_in_inventory(d.rarity, d.type);
                if (!is_struct(variable_struct_get(opened_items.added.dice, rarity.key)))
                {
                    variable_struct_set(opened_items.added.dice, rarity.key, {});
                }
                add_to_struct_value(variable_struct_get(opened_items.added.dice, rarity.key), type.key, 1);
                if (is_struct(die_existing))
                {
                    die_existing.collect(1);
                }
                else if (is_dice_inventory_full() && is_dice_backpack_full() && !global.disable_inventory_check)
                {
                    var compensation = rarity.get_salvage_resources();
                    add_struct_to_struct(arg0, compensation);
                    add_text += "*";
                }
                else
                {
                    variable_struct_set(o_game.data.dice.types_seen, d.type.key, true);
                    d.data.count = 1;
                    if (!is_dice_inventory_full())
                    {
                        d.bag = "inventory";
                        array_push(global.dice_inventory, d);
                    }
                    else
                    {
                        d.bag = "backpack";
                        array_push(global.dice_backpack, d);
                    }
                }
                array_push(text_array, sprintf("%sx %s%s", number_format(1), d.get_die_name(), add_text));
            }
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("dice_rarity_type"))))
    {
        var text_row = sprintf(arg9, __("Dice"));
        var text_array = [];
        if (!is_struct(struct_get_from_hash(opened_items.added, variable_get_hash("dice"))))
        {
            opened_items.added.dice = {};
        }
        var __struct = arg0.dice_rarity_type;
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
            var __struct2 = mitem;
            var __prop_names2 = struct_get_names(__struct2);
            var __prop_len2 = array_length(__prop_names2);
            for (var __i2 = 0; __i2 < __prop_len2; __i2++)
            {
                var mkey2 = __prop_names2[__i2];
                var mitem2 = variable_struct_get(__struct2, mkey2);
                var type = variable_struct_get(global.dice_types, mkey2);
                if (is_undefined(type))
                {
                    continue;
                }
                if (mitem2 == 0)
                {
                    continue;
                }
                repeat (mitem2 * arg11)
                {
                    var add_text = "";
                    var d = create_die(type, rarity, false);
                    var die_existing = get_die_in_inventory(d.rarity, d.type);
                    if (!is_struct(variable_struct_get(opened_items.added.dice, rarity.key)))
                    {
                        variable_struct_set(opened_items.added.dice, rarity.key, {});
                    }
                    add_to_struct_value(variable_struct_get(opened_items.added.dice, rarity.key), type.key, 1);
                    if (is_struct(die_existing))
                    {
                        die_existing.collect(1);
                    }
                    else if (is_dice_inventory_full() && is_dice_backpack_full() && !global.disable_inventory_check)
                    {
                        var compensation = rarity.get_salvage_resources();
                        add_struct_to_struct(arg0, compensation);
                        add_text += "*";
                    }
                    else
                    {
                        variable_struct_set(o_game.data.dice.types_seen, d.type.key, true);
                        d.data.count = 1;
                        if (!is_dice_inventory_full())
                        {
                            d.bag = "inventory";
                            array_push(global.dice_inventory, d);
                        }
                        else if (!is_dice_backpack_full())
                        {
                            d.bag = "backpack";
                            array_push(global.dice_backpack, d);
                        }
                    }
                    array_push(text_array, sprintf("%sx %s%s", number_format(mitem2 * arg11), d.get_die_name(), add_text));
                }
            }
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("equipment"))))
    {
        var text_row = sprintf(arg9, __("Equipment"));
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
            if (mitem == 0)
            {
                continue;
            }
            eq_item.collect(mitem * arg11);
            array_push(text_array, sprintf("%sx %s", number_format(mitem * arg11), eq_item.name));
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_numeric(struct_get_from_hash(arg0, variable_get_hash("equipment_random"))))
    {
        var text_row = sprintf(arg9, __("Equipment"));
        var text_array = [];
        var distribution_count = arg0.equipment_random div global.equipment_length;
        var distribution_count_left = arg0.equipment_random - (distribution_count * global.equipment_length);
        var __array = global.equipment_array;
        var __prop_len = array_length(__array);
        __array = array_shuffle(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var __sindex = __i;
            var mitem = __array[__i];
            mitem.collect(distribution_count);
            if (distribution_count_left > 0)
            {
                mitem.collect(1);
                distribution_count_left -= 1;
            }
        }
        array_push(text_array, sprintf("%sx %s", number_format(arg0.equipment_random), __("Random Equipment")));
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("fish"))))
    {
        var text_row = sprintf(arg9, __("Fish"));
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
            item.collect(mitem);
            array_push(text_array, sprintf("%sm %s", number_format(mitem), item.get_name()));
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("fish_baits"))))
    {
        var text_row = sprintf(arg9, __("Fish Baits"));
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
            item.collect(mitem * arg11);
            array_push(text_array, sprintf("%s %s", number_format(mitem), item.name));
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("fish_spot"))))
    {
        var text_row = sprintf(arg9, __("Fish Spot"));
        var text_array = [];
        var __struct = arg0.fish_spot;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var rarity = variable_struct_get(global.fishing_spots_rarity, mkey);
            if (!is_struct(rarity))
            {
                continue;
            }
            repeat (mitem)
            {
                var spot = add_fishing_spot(mkey);
                refresh_fishing_spot_indexes();
                variable_struct_set(global.fishing_spots_map, spot.data.id, spot);
            }
            array_push(text_array, sprintf("%s %s", number_format(mitem), rarity.name));
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("fish_rarity"))))
    {
        var text_row = sprintf(arg9, __("Fish"));
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
            var collected_fish = {};
            repeat (mitem * arg11)
            {
                var item = array_random_item(variable_struct_get(global.fish_array_rarity, mkey));
                if (is_undefined(item))
                {
                    continue;
                }
                item.collect();
                add_to_struct_value(collected_fish, item.name_full, 1);
            }
            __struct = collected_fish;
            __prop_names = struct_get_names(__struct);
            __prop_len = array_length(__prop_names);
            for (__i = 0; __i < __prop_len; __i++)
            {
                mkey = __prop_names[__i];
                mitem = variable_struct_get(__struct, mkey);
                array_push(text_array, sprintf("%s %s", number_format(mitem), mkey));
            }
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("fishing_rods_rarity"))))
    {
        var text_row = sprintf(arg9, __("Fishing Rod"));
        var text_array = [];
        var __struct = arg0.fishing_rods_rarity;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var rarity = variable_struct_get(global.fishing_rods_rarity, mkey);
            if (is_undefined(rarity))
            {
                continue;
            }
            if (mitem == 0)
            {
                continue;
            }
            var rod = add_fishing_rod(rarity);
            variable_struct_set(global.fishing_rods_map, rod.data.id, rod);
            array_push(text_array, sprintf("%sx %s", number_format(mitem), rod.get_short_name()));
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("harbor_items"))))
    {
        var text_row = sprintf(arg9, __("Harbor"));
        var text_array = [];
        if (!is_struct(struct_get_from_hash(opened_items.added, variable_get_hash("harbor"))))
        {
            opened_items.added.harbor = {};
        }
        var __struct = arg0.harbor_items;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var item = variable_struct_get(global.harbor_inventory.items, mkey);
            if (is_undefined(item))
            {
                continue;
            }
            if (mitem == 0)
            {
                continue;
            }
            var add_count = mitem * arg11;
            global.harbor_inventory.add_item(item, add_count);
            array_push(text_array, sprintf("%sx %s", number_format(add_count), item.get_name()));
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("harbor_items_rarity"))))
    {
        var text_row = sprintf(arg9, __("Harbor"));
        var text_array = [];
        if (!is_struct(struct_get_from_hash(opened_items.added, variable_get_hash("harbor"))))
        {
            opened_items.added.harbor = {};
        }
        var added = 0;
        var __struct = arg0.harbor_items_rarity;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            if (mitem <= 0)
            {
                continue;
            }
            var items = global.harbor_inventory.get_random_items(mkey, mitem);
            log(items);
            var __struct2 = items;
            var __prop_names2 = struct_get_names(__struct2);
            var __prop_len2 = array_length(__prop_names2);
            for (var __i2 = 0; __i2 < __prop_len2; __i2++)
            {
                var mkey2 = __prop_names2[__i2];
                var mitem2 = variable_struct_get(__struct2, mkey2);
                var item = variable_struct_get(global.harbor_inventory.items, mkey2);
                if (is_undefined(item))
                {
                    continue;
                }
                var add_count = mitem2;
                added += global.harbor_inventory.add_item(item, add_count);
                add_to_struct_value(opened_items.added.harbor, item.key, add_count);
                array_push(text_array, sprintf("%sx %s", number_format(add_count), item.get_name()));
            }
        }
        log("added harbor items", added);
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("iap"))))
    {
        var text_row = sprintf(arg9, __("IAP"));
        var text_array = [];
        var __struct = arg0.iap;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var dlc_item = variable_struct_get(global.shops.dlc, mkey);
            if (!is_struct(dlc_item))
            {
                continue;
            }
            if (!is_struct(variable_struct_get(o_game.data.dlc_status, 0)))
            {
                variable_struct_set(o_game.data.dlc_status, 0, {});
            }
            if (!is_struct(variable_struct_get(variable_struct_get(o_game.data.dlc_status, 0), dlc_item.key)))
            {
                variable_struct_set(variable_struct_get(o_game.data.dlc_status, 0), dlc_item.key, {});
            }
            var set_count = gdsv(mitem, "count", 0) * arg11;
            if (set_count > 0)
            {
                set_struct_value(variable_struct_get(variable_struct_get(o_game.data.dlc_status, 0), dlc_item.key), "count", set_count, false);
                array_push(text_array, sprintf("%sx %s", number_format(set_count), dlc_item.name));
            }
            var add_count = gdsv(mitem, "add_count", 0) * arg11;
            if (add_count > 0)
            {
                add_to_struct_value(variable_struct_get(variable_struct_get(o_game.data.dlc_status, 0), dlc_item.key), "count", add_count);
                array_push(text_array, sprintf("+%sx %s", number_format(add_count), dlc_item.name));
            }
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("journey_xp"))))
    {
        var text_row = sprintf(arg9, __("Journey Exp"));
        var text_array = [];
        var __struct = arg0.journey_xp;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var item = variable_struct_get(global.journeys, mkey);
            if (is_undefined(item))
            {
                continue;
            }
            if (mitem == 0)
            {
                continue;
            }
            item.add_xp(mitem * arg11);
            array_push(text_array, sprintf("%s %s", number_format(mitem * arg11), __("Exp")));
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("materials"))))
    {
        var text_row = sprintf(arg9, __("Materials"));
        var text_array = [];
        var __struct = arg0.materials;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var item = variable_struct_get(global.materials, mkey);
            if (is_undefined(item))
            {
                continue;
            }
            if (mitem == 0)
            {
                continue;
            }
            item.collect(mitem * arg11);
            array_push(text_array, sprintf("%sx %s", number_format(mitem * arg11), pluralize(mitem * arg11, item.name, item.name_plural)));
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("mine_item_rarity"))))
    {
        var text_row = sprintf(arg9, __("Mine Items"));
        var text_array = [];
        if (!is_struct(struct_get_from_hash(opened_items.added, variable_get_hash("mine_item_rarity_type"))))
        {
            opened_items.added.mine_item_rarity_type = {};
        }
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
            repeat (mitem * arg11)
            {
                var count = 1;
                var type = struct_random_chance_level(global.mine_items);
                if (is_undefined(type))
                {
                    continue;
                }
                var item_res = add_mine_inventory_item(type, rarity, count);
                if (!is_struct(variable_struct_get(opened_items.added.mine_item_rarity_type, rarity.key)))
                {
                    variable_struct_set(opened_items.added.mine_item_rarity_type, rarity.key, {});
                }
                add_to_struct_value(variable_struct_get(opened_items.added.mine_item_rarity_type, rarity.key), type.key, count);
                if (is_struct(item_res))
                {
                    array_push(text_array, sprintf("%sx %s", number_format(count), item_res.get_name(false)));
                }
                else
                {
                    set_struct_value(opened_items.inventory_full, "mine_item_rarity_type", {}, true);
                    set_struct_value(opened_items.inventory_full.mine_item_rarity_type, rarity.key, {}, true);
                    variable_struct_set(variable_struct_get(opened_items.inventory_full.mine_item_rarity_type, rarity.key), type.key, true);
                    array_push(text_array, sprintf("%sx %s %s (%s)", count, rarity.name, type.name, __("inventory full")));
                }
            }
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("mine_item_rarity_type"))))
    {
        var text_row = sprintf(arg9, __("Mine Items"));
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
                repeat (mitem2 * arg11)
                {
                    var item_res = add_mine_inventory_item(type, rarity, 1);
                    if (is_struct(item_res))
                    {
                        array_push(text_array, sprintf("%sx %s", number_format(1), item_res.get_name(false)));
                    }
                    else
                    {
                        array_push(text_array, sprintf("%sx %s %s (%s)", 1, rarity.name, type.name, __("inventory full")));
                    }
                }
            }
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("misc"))))
    {
        var text_row = sprintf(arg9, __("Other"));
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
            var display_value = number_format(mitem * arg11);
            var display_x = "";
            if (mkey == "tower_floors")
            {
                name = __("Tower Floors");
                if (global.areas.tower.get_highest_floor_current_run() < 101)
                {
                    mitem = 0;
                }
                var highest_floor = global.areas.tower.get_highest_floor_current_run();
                var max_floor = global.areas.tower.get_max_floor();
                var highest_floor_new = highest_floor + (mitem * arg11);
                global.areas.tower.set_max_floor_stats(highest_floor_new);
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
        var text_row = sprintf(arg9, __("Relics"));
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
            item.collect(mitem * arg11);
            array_push(text_array, sprintf("%sx %s", number_format(mitem * arg11), item.name));
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("relic_types"))))
    {
        var text_row = sprintf(arg9, __("Relics"));
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
            relic.collect(mitem * arg11);
            array_push(text_array, sprintf("%sx %s", number_format(mitem * arg11), relic.name));
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("resources"))))
    {
        var text_row = sprintf(arg9, __("Resources"));
        var text_array = [];
        add_resources(arg0.resources, undefined, undefined, undefined, undefined, undefined, undefined, undefined, arg11);
        var __struct = arg0.resources;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var item = variable_struct_get(global.resources, mkey);
            if (is_undefined(item))
            {
                continue;
            }
            if (mitem == 0)
            {
                continue;
            }
            array_push(text_array, sprintf("%sx %s", number_format(mitem * arg11), pluralize(mitem * arg11, item.name, item.name_plural)));
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("resources_leafscended"))))
    {
        var text_row = sprintf(arg9, __("Leafscended"));
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
                var leafscend_res_add = {};
                variable_struct_set(leafscend_res_add, mkey, mitem2 * arg11);
                add_resources_leafscended(leafscend_res_add, mkey2);
                array_push(text_array, sprintf("%sx %s L%s", number_format(mitem2), pluralize(mitem2 * arg11, item.name, item.name_plural), mkey2));
            }
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("scrolls"))))
    {
        var text_row = sprintf(arg9, __("Scrolls"));
        var text_array = [];
        if (is_numeric(struct_get_from_hash(arg0.scrolls, variable_get_hash("__all"))))
        {
            arg0.scrolls = pluck_set_result(global.scrolls, arg0.scrolls.__all);
        }
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
            if (mitem == 0)
            {
                continue;
            }
            scroll.collect(mitem * arg11);
            array_push(text_array, sprintf("%sx %s", number_format(mitem * arg11), scroll.name));
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("stats"))))
    {
        var text_row = sprintf(arg9, __("Stats"));
        var text_array = [];
        var __struct = arg0.stats;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var name = mkey;
            if (is_undefined(variable_struct_get(o_game.data.stats, mkey)))
            {
                continue;
            }
            if (mitem == 0)
            {
                continue;
            }
            var display_value = number_format(mitem * arg11);
            var display_x = "x";
            name = get_default_struct_value(global.texts_stats, mkey, mkey);
            if (mkey == "time_elapsed")
            {
                display_value = format_time(secr(mitem * arg11), false, true);
                display_x = "";
            }
            variable_struct_set(o_game.data.stats, mkey, variable_struct_get(o_game.data.stats, mkey) + (mitem * arg11));
            array_push(text_array, sprintf("%s%s %s", display_value, display_x, name));
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("time_travel"))))
    {
        var text_row = sprintf(arg9, __("Time Travel"));
        var text_array = [];
        log("Time Travel: ", arg0.time_travel);
        var __struct = arg0.time_travel;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var item = variable_struct_get(global.shops.gems, mkey);
            log("Time Travel Item: ", is_struct(item));
            if (is_undefined(item))
            {
                continue;
            }
            if (mitem == 0)
            {
                continue;
            }
            item.data.inventory += mitem * arg11;
            array_push(text_array, sprintf("%sx %s", number_format(mitem * arg11), item.name));
        }
        if (array_length(text_array) > 0)
        {
            array_push(add_stats, text_row + implode(", ", text_array));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("unique_leaves"))))
    {
        var text_row = sprintf(arg9, __("Unique Leaves"));
        var text_array = [];
        var __struct = arg0.unique_leaves;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var item = variable_struct_get(global.unique_leaves, mkey);
            if (is_undefined(item))
            {
                continue;
            }
            item.collect();
            array_push(text_array, sprintf("%sx %s", number_format(1), item.name));
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
    var text = arg1 + __("Resources:");
    var items_text = "";
    if (!is_empty(arg1))
    {
        items_text = arg1 + "\n";
    }
    if (array_length(add_stats) > 0 && arg6)
    {
        items_text += implode("\n\n", add_stats);
    }
    if (arg10)
    {
        global.disable_inventory_check = false;
    }
    if (arg3)
    {
        return items_text;
    }
    if (arg8)
    {
        return notify(items_text);
    }
    var dialog_options = undefined;
    if (!is_undefined(arg5))
    {
        dialog_options = 
        {
            parent_nav: arg5
        };
    }
    if (array_length(add_stats) > 0)
    {
        reward_dialog(arg1, arg0, true, arg2, dialog_options, undefined, opened_items);
    }
    else
    {
        resource_dialog(text, res, "", undefined, true, arg2, dialog_options);
    }
    if (mp_is_season() || arg4)
    {
        exit;
    }
    save_game();
}

function add_result_lite(arg0, arg1 = 1, arg2 = undefined)
{
    return add_result(arg0, undefined, undefined, true, true, undefined, undefined, undefined, undefined, arg2, undefined, arg1);
}
