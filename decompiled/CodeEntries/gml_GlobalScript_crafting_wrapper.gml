function auto_salvage(arg0)
{
    var auto_salvage_option = get_option(global.options.auto_salvage_crafted_leaf);
    var salvage_list = [];
    if (auto_salvage_option == "backpack" || auto_salvage_option == "all")
    {
        __array = global.craft_leaves_backpack;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (arg0.rarity_index < mitem.type.rarity_index || mitem.data.locked)
            {
                continue;
            }
            array_push(salvage_list, mitem);
        }
    }
    if (auto_salvage_option == "all")
    {
        __array = global.craft_leaves_inventory;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (arg0.rarity_index < mitem.type.rarity_index || mitem.data.locked)
            {
                continue;
            }
            array_push(salvage_list, mitem);
        }
    }
    var can_notify = get_option(global.options.enable_salvage_notifications);
    var __array = salvage_list;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (can_notify)
        {
            notify(sprintf(__("%s leaf was automatically salvaged."), mitem.type.name));
        }
        salvage_crafted_leaf(mitem.data.id);
    }
}

function can_craft_leaf()
{
    var inventory_size = get_craft_inventory_size();
    var backpack_size = get_craft_backpack_size();
    var craft_leaves_inventory_length = array_length(global.craft_leaves_inventory);
    var craft_leaves_backpack_length = array_length(global.craft_leaves_backpack);
    return !global.tavern_games_playing.crafting && has_enough_resources(global.game_settings.craft_leaves_cost) && (craft_leaves_inventory_length < inventory_size || craft_leaves_backpack_length < backpack_size);
}

function can_fuse_crafted_leaves()
{
    var fusion_slots_length = array_length(global.craft_leaves_fusion_slots);
    if (fusion_slots_length == 0)
    {
        global.craft_leaves_fusion_text = "";
        return false;
    }
    if (fusion_slots_length < global.game_settings.craft_leaves_fusion_slots)
    {
        global.craft_leaves_fusion_text = __("Missing leaves");
        return false;
    }
    var first_leaf = @@array_get@@(global.craft_leaves_fusion_slots, 0);
    var __array = global.craft_leaves_fusion_slots;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (mitem.type != first_leaf.type)
        {
            global.craft_leaves_fusion_text = __("Different leaf types");
            return false;
        }
    }
    var next_type = get_next_craft_type(first_leaf);
    if (is_undefined(next_type))
    {
        global.craft_leaves_fusion_text = __("Higher craft tier unavailable.");
        return false;
    }
    if (next_type.craft_level > get_craft_level())
    {
        global.craft_leaves_fusion_text = sprintf(__("Craft level too low (%s/%s)"), get_craft_level(), next_type.craft_level);
        return false;
    }
    if (!is_undefined(struct_get_from_hash(next_type, variable_get_hash("can_fuse"))) && !next_type.can_fuse())
    {
        global.craft_leaves_fusion_text = __("Can't fuse next tier yet.");
        return false;
    }
    var cost = get_crafted_leaves_fusion_cost(first_leaf);
    if (!has_enough_resources(cost))
    {
        global.craft_leaves_fusion_text = __("Insufficient resources");
        return false;
    }
    global.craft_leaves_fusion_text = __("Ready to fuse");
    return true;
}

function can_swap_leaves()
{
    var swap_enabled = true;
    var selected_leaf = struct_get_from_hash(global.selected_inventory_item, variable_get_hash("crafted_leaf"));
    var swap_item = struct_get_from_hash(global.selected_inventory_item, variable_get_hash("crafted_leaf_swap"));
    if (is_struct(swap_item) && swap_item == selected_leaf)
    {
        swap_enabled = false;
    }
    return swap_enabled;
}

function change_transform_output_key(arg0 = 1)
{
    global.craft_leaves_transform_output_index = wrap(global.craft_leaves_transform_output_index, arg0, -1, array_length(global.craft_leaf_upgrade_vars_array) - 1);
    global.craft_leaves_transform_output_var = undefined;
    if (global.craft_leaves_transform_output_index != -1)
    {
        global.craft_leaves_transform_output_var = global.craft_leaf_upgrade_vars_array[global.craft_leaves_transform_output_index];
        if (is_undefined(variable_struct_get(o_game.data.stats.crafted_vars_transform_unlocked, global.craft_leaves_transform_output_var.key)))
        {
            change_transform_output_key(arg0);
        }
    }
    if (array_length(global.craft_leaves_transformation_slots) > 0)
    {
        var transform_leaf = @@array_get@@(global.craft_leaves_transformation_slots, 0);
        transform_leaf.build_fusion_cost();
    }
}

function check_auto_craft()
{
    static autocraft_timer = 5;
    
    if (!is_unlocked_crafting())
    {
        exit;
    }
    check_auto_salvage();
    if (!get_option(global.options.autocraft))
    {
        exit;
    }
    if (!is_shop_item_enabled("gems", "persistent_autocraft_leaves"))
    {
        exit;
    }
    if (instance_exists(o_gui_instance_crafting))
    {
        exit;
    }
    if (!can_craft_leaf())
    {
        exit;
    }
    autocraft_timer -= 1;
    if (autocraft_timer <= 0)
    {
        autocraft_timer = get_autocraft_delay() * global.game_settings.autocraft_delay_alb;
        var leaf = stop_craft_leaf();
        if (get_option(global.options.enable_autocraft_notifications))
        {
            var craft_text = implode("\n", [__("Autocraft"), leaf.get_name(), __s("Craft Quality: %s%", leaf.data.quality_base), __s("RNG Quality: %s%", leaf.data.quality)]);
            notify(craft_text);
        }
        check_auto_salvage();
    }
}

function check_auto_salvage()
{
    if (has_timeout("auto_salvage_timeout"))
    {
        exit;
    }
    if (get_option(global.options.auto_salvage_crafted_leaf) == "off")
    {
        exit;
    }
    var salvage_type_key = get_option(global.options.auto_salvage_crafted_leaf_type);
    var salvage_type = variable_struct_get(global.craft_leaf_types, salvage_type_key);
    if (!is_undefined(salvage_type) && salvage_type_key != "none")
    {
        auto_salvage(salvage_type);
    }
}

function check_autofuse_crafted_leaves()
{
    if (get_upgrade_count(global.shops.gems.craft_autofuse) == 0)
    {
        exit;
    }
    if (!get_option(global.options.craft_autofuse))
    {
        exit;
    }
    var max_fuse_type_key = get_option(global.options.craft_autofuse_type);
    var max_fuse_type = variable_struct_get(global.craft_leaf_types, max_fuse_type_key);
    var fusion_slots_types = {};
    var __array = global.craft_leaves_backpack;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (max_fuse_type.rarity_index < mitem.type.rarity_index || mitem.data.locked)
        {
            continue;
        }
        add_to_struct_value(fusion_slots_types, mitem.type.key, 1);
    }
    var __struct = fusion_slots_types;
    var __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (mitem < global.game_settings.craft_leaves_fusion_slots)
        {
            continue;
        }
        var fusion_slots_count = 0;
        var items = [];
        var __array2 = global.craft_leaves_backpack;
        var __prop_len2 = array_length(__array2);
        for (var __i2 = 0; __i2 < __prop_len2; __i2++)
        {
            var mitem2 = __array2[__i2];
            if (fusion_slots_count >= global.game_settings.craft_leaves_fusion_slots)
            {
                continue;
            }
            if (max_fuse_type.rarity_index < mitem2.type.rarity_index || mitem2.data.locked)
            {
                continue;
            }
            if (mitem2.type.key != mkey)
            {
                continue;
            }
            array_push(items, mitem2);
            fusion_slots_count++;
        }
        global.craft_leaves_fusion_slots = items;
        if (can_fuse_crafted_leaves())
        {
            fuse_crafted_leaves();
        }
    }
}

function confirm_salvage_crafted_leaf(arg0)
{
    var show_salvage_dialog = get_option(global.options.show_salvage_confirm_dialog);
    if (show_salvage_dialog)
    {
        var crafted_leaf = get_leaf_by_id(arg0);
        var name = crafted_leaf.get_name();
        confirm_dialog_current_nav(__s("Do you want to salvage %s?", name), salvage_crafted_leaf, arg0);
        exit;
    }
    salvage_crafted_leaf(arg0);
}

function confirm_save_craft_set(arg0)
{
    global.selected_set_confirm = arg0;
    confirm_dialog_current_nav(__s("Overwrite set #%s?", global.selected_set_confirm + 1), function()
    {
        o_game.data.current_craft_set = global.selected_set_confirm;
        save_craft_set(global.selected_set_confirm);
        open_nav("crafting", global.dialog_sections.crafting.sets);
    }, undefined, undefined, undefined, function()
    {
        open_nav("crafting", global.dialog_sections.crafting.sets);
    });
}

function craft_benchmark(arg0 = 10000)
{
    var crafted = {};
    var __struct = global.craft_leaf_types;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(crafted, mkey, 0);
    }
    math_set_epsilon(global.epsilon_max);
    repeat (arg0)
    {
        var type = get_random_craft_leaf_type();
        variable_struct_set_post(crafted, type.key, variable_struct_get(crafted, type.key) + 1);
    }
    math_set_epsilon(global.epsilon);
    return crafted;
}

function craft_leaf(arg0)
{
    math_set_epsilon(global.epsilon_max);
    var leaf_type = get_random_craft_leaf_type();
    var leaf = craft_leaf_type(leaf_type, arg0);
    leaf.set_crafted_vars_seen();
    math_set_epsilon(global.epsilon);
    return leaf;
}

function craft_leaf_type(arg0, arg1 = undefined, arg2 = undefined)
{
    add_to_struct_value(o_game.data.stats.crafted_leaves_types, arg0.key, 1);
    return new Crafted_Leaf(arg0, arg1, arg2);
}

function crafted_leaf_is_in_backpack(arg0)
{
    return item_id_is_in_array(global.craft_leaves_backpack, arg0);
}

function crafted_leaf_is_in_inventory(arg0)
{
    return item_id_is_in_array(global.craft_leaves_inventory, arg0);
}

function delete_all_crafted_leaves()
{
    var __array = global.craft_leaves_inventory;
    var __prop_len = array_length(__array);
    var __i = __prop_len - 1;
    while (__i >= 0)
    {
        var mitem = __array[__i];
        var __ireal = __prop_len - 1 - __i;
        array_delete(global.craft_leaves_inventory, __i, 1);
        __i--;
    }
}

function delete_crafted_leaf(arg0)
{
    var deleted_count = 0;
    deleted_count += (remove_item_from_array_by_id(global.craft_leaves_backpack, arg0) ? 1 : 0);
    deleted_count += (remove_item_from_array_by_id(global.craft_leaves_inventory, arg0) ? 1 : 0);
    deleted_count += (remove_item_from_array_by_id(global.craft_leaves_fusion_slots, arg0) ? 1 : 0);
    deleted_count += (remove_item_from_array_by_id(global.craft_leaves_transformation_slots, arg0) ? 1 : 0);
    return deleted_count > 0;
}

function draw_crafted_leaves(arg0, arg1, arg2, arg3, arg4, arg5, arg6 = 8, arg7 = true, arg8 = undefined, arg9 = false, arg10 = 0, arg11 = 8)
{
    var craft_leaves_inventory_length = array_length(arg2);
    arg3 = max(arg3, craft_leaves_inventory_length);
    var max_page_backpack = ceil(arg3 / arg6);
    if (is_undefined(variable_struct_get(global.craft_leaves_backpack_pages, arg10)))
    {
        variable_struct_set(global.craft_leaves_backpack_pages, arg10, 0);
    }
    variable_struct_set(global.craft_leaves_backpack_pages, arg10, clamp(variable_struct_get(global.craft_leaves_backpack_pages, arg10), 0, max_page_backpack));
    var _page = variable_struct_get(global.craft_leaves_backpack_pages, arg10);
    if (_page > (arg3 * arg6))
    {
        _page = 0;
    }
    if (!arg9)
    {
        _page = 0;
    }
    var cx = arg0;
    var cy = arg1;
    if (global.is_mobile)
    {
        cy += gui_col_y(0.3);
    }
    var x_padding = global.is_mobile ? 60 : 48;
    var y_padding = global.is_mobile ? 60 : 48;
    var xcol = 0;
    var ycol = 0;
    for (var i = 0; i < min(arg3, arg6); i++)
    {
        if (i > 0 && (i % arg11) == 0)
        {
            ycol++;
            xcol = 0;
        }
        var bx = (cx + (xcol * x_padding)) - 8;
        var by = cy + (ycol * y_padding);
        var leaf_index = i + (_page * arg6);
        if (leaf_index < array_length(arg2))
        {
            var inventory_leaf = @@array_get@@(arg2, leaf_index);
            if (!is_struct(inventory_leaf))
            {
                continue;
            }
            var is_selected = global.selected_craft_item_id == inventory_leaf.data.id;
            var alpha = 1;
            if (global.craft_leaves_filter_index >= 0 && is_undefined(variable_struct_get(inventory_leaf.data.props, global.craft_leaves_filter_key)))
            {
                alpha = 0.5;
            }
            var props = 
            {
                alpha: alpha,
                btn_bg_color: inventory_leaf.get_bg_color(),
                halign: 0,
                selected: is_selected,
                mb_check: global.inputs.mouse.mb_all
            };
            if (!global.is_mobile)
            {
                props.force_show_tooltip = true;
                props.tooltip = inventory_leaf.get_info();
            }
            if (gui_button_sprite(bx + 32, by + 32, inventory_leaf.get_sprite(), arg7, false, props))
            {
                if (mouse_lastbutton == 1 || global.is_mobile)
                {
                    global.selected_craft_item_id = is_selected ? -1 : inventory_leaf.data.id;
                    global.selected_inventory_item.crafted_leaf = is_selected ? undefined : inventory_leaf;
                }
                var rightclick = mouse_lastbutton == 2 && !global.is_mobile;
                inventory_leaf.refresh_info_text();
                instance_destroy(o_tooltip);
                if (keyboard_check(vk_alt) && mouse_lastbutton == 1 && inventory_leaf.can_reroll())
                {
                    inventory_leaf.reroll_rng();
                    instance_destroy(o_tooltip);
                    refresh_ua_section("crafted_leaves");
                }
                else if (keyboard_check(vk_alt) && mouse_lastbutton == 2 && inventory_leaf.can_reroll_props())
                {
                    inventory_leaf.reroll_props();
                    instance_destroy(o_tooltip);
                    refresh_ua_section("crafted_leaves");
                }
                else if (keyboard_check(vk_alt) && mouse_lastbutton == 3 && inventory_leaf.can_reroll_shards())
                {
                    inventory_leaf.reroll_shards();
                    instance_destroy(o_tooltip);
                    refresh_ua_section("crafted_leaves");
                }
                else if (keyboard_check(vk_control) && inventory_leaf.can_salvage())
                {
                    confirm_salvage_crafted_leaf(inventory_leaf.data.id);
                    refresh_ua_section("crafted_leaves");
                }
                else if (rightclick || keyboard_check(vk_shift))
                {
                    if (!is_undefined(arg8))
                    {
                        arg8(inventory_leaf);
                    }
                    else if (array_length(arg4) < arg5)
                    {
                        move_array_item(inventory_leaf, arg2, arg4);
                    }
                    refresh_ua_section("crafted_leaves");
                    instance_destroy(o_tooltip);
                }
                else if (mouse_check_button_pressed(mb_middle))
                {
                    inventory_leaf.data.locked = !inventory_leaf.data.locked;
                }
            }
            if (inventory_leaf.data.locked)
            {
                draw_sprite_ext(spr_icon_lock, 0, bx + 48, by + 8, 2, 2, 0, c_white, 1);
            }
        }
        else if (leaf_index < arg3)
        {
            var alpha = (global.craft_leaves_filter_index >= 0) ? 0.5 : 1;
            gui_button_sprite(bx + 32, by + 32, spr_solid, arg7, false, 
            {
                alpha: alpha
            });
        }
        xcol++;
    }
    if (arg9)
    {
        var paging_x = arg0 + gui_col_x(3.5);
        var paging_y = arg1 - gui_col_y(1.4);
        if (global.is_mobile)
        {
            paging_y -= gui_col_y(0.4);
        }
        if (arg3 > arg6)
        {
            if (gui_button_tl(paging_x, paging_y, "<-", _page > 0, gui_col_x(1)))
            {
                variable_struct_set_post(global.craft_leaves_backpack_pages, arg10, variable_struct_get(global.craft_leaves_backpack_pages, arg10) - 1);
            }
            if (gui_button_tl(paging_x + gui_col_x(1.25), paging_y, "->", (_page + 1) < max_page_backpack, gui_col_x(1)))
            {
                variable_struct_set_post(global.craft_leaves_backpack_pages, arg10, variable_struct_get(global.craft_leaves_backpack_pages, arg10) + 1);
            }
            draw_description(paging_x + gui_col_x(2.5), paging_y + gui_col_y(0.3), sprintf("%s/%s", _page + 1, max_page_backpack));
        }
    }
}

function draw_crafted_leaves_swap(arg0, arg1)
{
    var selected_leaf = struct_get_from_hash(global.selected_inventory_item, variable_get_hash("crafted_leaf"));
    var swap_item = struct_get_from_hash(global.selected_inventory_item, variable_get_hash("crafted_leaf_swap"));
    if (!is_struct(selected_leaf))
    {
        exit;
    }
    if (selected_leaf == swap_item)
    {
        if (gui_button_sprite_tl(arg0, arg1, spr_icon_swap_cancel, true, undefined, 
        {
            tooltip: __s("Cancel %s", __("Swap"))
        }))
        {
            global.selected_inventory_item.crafted_leaf_swap = undefined;
        }
    }
    else
    {
        var swap_sprite = is_struct(swap_item) ? spr_icon_swap_active : spr_icon_swap;
        if (gui_button_sprite_tl(arg0, arg1, swap_sprite, can_swap_leaves(), undefined, 
        {
            tooltip: __("Swap")
        }))
        {
            swap_leaves(swap_item, selected_leaf);
        }
    }
}

function fuse_crafted_leaves()
{
    if (!is_array(global.craft_leaves_fusion_slots) || array_length(global.craft_leaves_fusion_slots) == 0)
    {
        exit;
    }
    var first_leaf = @@array_get@@(global.craft_leaves_fusion_slots, 0);
    var next_type = get_next_craft_type(first_leaf);
    if (is_undefined(next_type))
    {
        return log("No higher rarity type found.");
    }
    dec_resources(get_crafted_leaves_fusion_cost(first_leaf));
    var fusion_leaf_count = array_length(global.craft_leaves_fusion_slots);
    var quality_base_sum = 0;
    var quality_sum = 0;
    var __array = global.craft_leaves_fusion_slots;
    var __prop_len = array_length(__array);
    for (__i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        mitem.reclaim_shards();
        quality_base_sum += mitem.data.quality_base;
        quality_sum += mitem.data.quality;
    }
    __array = global.craft_leaves_fusion_slots;
    __prop_len = array_length(__array);
    var __i = __prop_len - 1;
    while (__i >= 0)
    {
        var mitem = __array[__i];
        var __ireal = __prop_len - 1 - __i;
        delete_crafted_leaf(mitem.data.id);
        __i--;
    }
    var quality_base = max(1, floor(quality_base_sum / fusion_leaf_count));
    var quality = max(1, floor(quality_sum / fusion_leaf_count));
    craft_leaf_type(next_type, 
    {
        quality_base: quality_base,
        quality: quality
    });
    o_game.data.stats.crafted_leaves_fusion++;
    notify(sprintf(__("%s leaf fused."), next_type.name));
}

function generate_crafted_leaf_id()
{
    var _id = 0;
    var __array = global.craft_leaves_backpack;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        _id = max(_id, mitem.data.id);
    }
    __array = global.craft_leaves_inventory;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        _id = max(_id, mitem.data.id);
    }
    _id++;
    return _id;
}

function get_autocraft_delay()
{
    var autocraft_delay = global.game_settings.autocraft_delay;
    autocraft_delay *= (1 - get_upgrade_attribute_value(global.upgrade_attributes.autocraft_delay_reduction));
    autocraft_delay = max(0.1, autocraft_delay);
    return autocraft_delay;
}

function get_craft_backpack_size()
{
    var size = 2 + get_upgrade_attribute_value(global.upgrade_attributes.craft_backpack_size);
    return size;
}

function get_craft_inventory_size()
{
    var inventory_size = 6 + get_upgrade_attribute_value(global.upgrade_attributes.craft_inventory_size);
    return inventory_size;
}

function get_craft_level()
{
    return get_upgrade_attribute_value(global.upgrade_attributes.craft_level);
}

function get_craft_max_chance()
{
    var max_chance_upgrade = get_upgrade_attribute_value(global.upgrade_attributes.craft_min_chance);
    var max_chance_modifier = 0;
    if (max_chance_upgrade > 0)
    {
        max_chance_modifier = power(1.17, max_chance_upgrade);
    }
    var max_chance = 2 + max_chance_modifier;
    max_chance *= (1 + get_upgrade_attribute_value(global.upgrade_attributes.craft_min_chance_multiplier));
    max_chance *= (1 + get_upgrade_attribute_value(global.upgrade_attributes.craft_min_chance_multiplier_dice));
    max_chance *= (1 + get_upgrade_attribute_value(global.upgrade_attributes.craft_min_chance_multiplier_plants));
    max_chance *= (1 + get_upgrade_attribute_value(global.upgrade_attributes.craft_min_chance_multiplier_scroll));
    if (max_chance == 0)
    {
        max_chance = 100000;
    }
    return 200 / max_chance;
}

function get_craft_sets_size()
{
    return 3 + get_upgrade_attribute_value(global.upgrade_attributes.craft_sets_size);
}

function get_crafted_leaf_prop_base_value(arg0, arg1)
{
    var base_prop = variable_struct_get(global.craft_leaf_upgrade_vars, arg0.key);
    if (is_undefined(base_prop))
    {
        return 0;
    }
    var prop_value = get_default_struct_value(base_prop, "value", 0);
    if (is_struct(arg1) && !is_undefined(struct_get_from_hash(arg1, variable_get_hash("__collection_key"))) && is_struct(struct_get_from_hash(base_prop, variable_get_hash("collection"))) && is_struct(struct_get_from_hash(base_prop, variable_get_hash("value_multiplier_keys"))))
    {
        var prop_sub_key = arg1.__collection_key;
        var prop_value_before = prop_value;
        if (!is_undefined(variable_struct_get(base_prop.value_multiplier_keys, prop_sub_key)))
        {
            prop_value *= variable_struct_get(base_prop.value_multiplier_keys, prop_sub_key);
        }
    }
    return prop_value;
}

function get_crafted_leaves_fusion_cost(arg0)
{
    var cost = arg0.get_fusion_cost();
    return cost;
}

function get_leaf_by_id(arg0)
{
    var __array = global.craft_leaves_inventory;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (!is_struct(mitem))
        {
            continue;
        }
        if (mitem.data.id == arg0)
        {
            return mitem;
        }
    }
    __array = global.craft_leaves_backpack;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (!is_struct(mitem))
        {
            continue;
        }
        if (mitem.data.id == arg0)
        {
            return mitem;
        }
    }
    return undefined;
}

function get_max_ascend_level()
{
    return 10;
}

function get_next_craft_type(arg0)
{
    if (!is_struct(arg0))
    {
        return undefined;
    }
    var __array = global.craft_leaf_types_rarity_array;
    var __prop_len = array_length(__array);
    var __i = __prop_len - 1;
    while (__i >= 0)
    {
        var mitem = __array[__i];
        var __ireal = __prop_len - 1 - __i;
        if (arg0.type.rarity_index >= mitem.rarity_index)
        {
        }
        else
        {
            return mitem;
        }
        __i--;
    }
    return undefined;
}

function get_random_craft_leaf_type()
{
    var min_chance = 0;
    var max_chance = get_craft_max_chance();
    var r = random_range(min_chance, max_chance);
    var leaf_type = global.craft_leaf_types.basic;
    var __array = global.craft_leaf_types_rarity_array;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (!mitem.can_craft())
        {
            continue;
        }
        if (r <= mitem.get_craft_chance())
        {
            leaf_type = mitem;
            break;
        }
    }
    return leaf_type;
}

function get_salvage_resources__old()
{
    return 
    {
        cheese: 1 + get_upgrade_attribute_value(global.upgrade_attributes.craft_salvage_reward)
    };
}

function init_craft_vars()
{
    global.craft_leaves_id_counter = 1;
    global.craft_leaves_backpack_page = 0;
    global.craft_leaves_backpack_pages = {};
    global.craft_leaves_backpack_count_per_page = 8;
    global.craft_leaves_inventory_page = 0;
    global.craft_leaves_inventory_count_per_page = 8;
    global.craft_leaves_fusion_text = "";
    global.craft_leaves_transform_output_index = -1;
    global.craft_leaves_transform_output_var = undefined;
    global.craft_leaves_backpack = [];
    global.craft_leaves_inventory = [];
    global.craft_leaves_fusion_slots = [];
    global.craft_leaves_transformation_slots = [];
    global.craft_leaf_types = 
    {
        basic: new Crafted_Leaf_Type("basic", 
        {
            rarity_index: 0,
            name: __("Basic"),
            craft_chance: 100,
            craft_level: 0,
            craft_bonus: 1,
            prop_count: 1
        }),
        gold: new Crafted_Leaf_Type("gold", 
        {
            rarity_index: 1,
            name: __("Gold"),
            craft_chance: 20,
            craft_level: 1,
            craft_bonus: 2,
            prop_count: 2
        }),
        platinum: new Crafted_Leaf_Type("platinum", 
        {
            rarity_index: 2,
            name: __("Platinum"),
            craft_chance: 10,
            craft_level: 1,
            craft_bonus: 4,
            prop_count: 2
        }),
        bismuth: new Crafted_Leaf_Type("bismuth", 
        {
            rarity_index: 3,
            name: __("Bismuth"),
            craft_chance: 5,
            craft_level: 1,
            craft_bonus: 6,
            prop_count: 3
        }),
        cosmic: new Crafted_Leaf_Type("cosmic", 
        {
            rarity_index: 4,
            name: __("Cosmic"),
            craft_chance: 2,
            craft_level: 2,
            craft_bonus: 8,
            prop_count: 3
        }),
        void: new Crafted_Leaf_Type("void", 
        {
            rarity_index: 5,
            name: __("Void"),
            craft_chance: 1,
            craft_level: 3,
            craft_bonus: 12,
            prop_count: 4
        }),
        exotic: new Crafted_Leaf_Type("exotic", 
        {
            rarity_index: 6,
            name: __("Exotic"),
            craft_chance: 0.75,
            craft_level: 3,
            craft_bonus: 16,
            prop_count: 4
        }),
        celestial: new Crafted_Leaf_Type("celestial", 
        {
            rarity_index: 7,
            name: __("Celestial"),
            craft_chance: 0.5,
            craft_level: 3,
            craft_bonus: 20,
            prop_count: 5
        }),
        mythical: new Crafted_Leaf_Type("mythical", 
        {
            rarity_index: 8,
            name: __("Mythical"),
            craft_chance: 0.25,
            craft_level: 4,
            craft_bonus: 32,
            prop_count: 5
        }),
        lava: new Crafted_Leaf_Type("lava", 
        {
            rarity_index: 9,
            name: __("Lava"),
            craft_chance: 0.1,
            craft_level: 4,
            craft_bonus: 48,
            prop_count: 5
        }),
        ice: new Crafted_Leaf_Type("ice", 
        {
            rarity_index: 10,
            name: __("Ice"),
            craft_chance: 0.075,
            craft_level: 5,
            craft_bonus: 64,
            prop_count: 5
        }),
        obsidian: new Crafted_Leaf_Type("obsidian", 
        {
            rarity_index: 11,
            name: __("Obsidian"),
            craft_chance: 0.05,
            craft_level: 5,
            craft_bonus: 80,
            prop_count: 6
        }),
        silicon: new Crafted_Leaf_Type("silicon", 
        {
            rarity_index: 12,
            name: __("Silicon"),
            craft_chance: 0.025,
            craft_level: 6,
            craft_bonus: 96,
            prop_count: 6
        }),
        benitoite: new Crafted_Leaf_Type("benitoite", 
        {
            rarity_index: 13,
            name: __("Benitoite"),
            craft_chance: 0.01,
            craft_level: 7,
            craft_bonus: 112,
            prop_count: 6
        }),
        moonstone: new Crafted_Leaf_Type("moonstone", 
        {
            rarity_index: 14,
            name: __("Moonstone"),
            craft_chance: 0.001,
            craft_level: 8,
            craft_bonus: 132,
            prop_count: 6
        }),
        sand: new Crafted_Leaf_Type("sand", 
        {
            rarity_index: 15,
            name: __("Sand"),
            craft_chance: 0.0001,
            craft_level: 9,
            craft_bonus: 164,
            prop_count: 6
        }),
        ancient: new Crafted_Leaf_Type("ancient", 
        {
            rarity_index: 16,
            name: __("Ancient"),
            craft_chance: 0.00001,
            craft_level: 9,
            craft_bonus: 256,
            prop_count: 7
        }),
        sacred: new Crafted_Leaf_Type("sacred", 
        {
            rarity_index: 17,
            name: __("Sacred"),
            craftable_manual: true,
            craft_chance: 0.0000001,
            craft_level: 10,
            craft_bonus: 384,
            prop_count: 7
        }),
        biotite: new Crafted_Leaf_Type("biotite", 
        {
            rarity_index: 18,
            name: __("Biotite"),
            craftable_manual: true,
            craft_chance: 0.00000001,
            craft_level: 11,
            craft_bonus: 512,
            prop_count: 7
        }),
        malachite: new Crafted_Leaf_Type("malachite", 
        {
            rarity_index: 19,
            name: __("Malachite"),
            craftable_manual: true,
            craft_chance: 0.000000001,
            craft_level: 12,
            craft_bonus: 640,
            prop_count: 7
        }),
        hematite: new Crafted_Leaf_Type("hematite", 
        {
            rarity_index: 20,
            name: __("Hematite"),
            craftable_manual: true,
            craft_chance: 0.0000000001,
            craft_level: 13,
            craft_bonus: 768,
            prop_count: 7
        }),
        plasma: new Crafted_Leaf_Type("plasma", 
        {
            rarity_index: 21,
            name: __("Plasma"),
            craftable_manual: true,
            craft_chance: 0.00000000001,
            craft_level: 13,
            craft_bonus: 896,
            prop_count: 7,
            
            can_fuse: function()
            {
                return is_energy_shrine_prophecy_fulfilled();
            }
        }),
        coal: new Crafted_Leaf_Type("coal", 
        {
            rarity_index: 22,
            name: __("Coal"),
            craftable_manual: true,
            craft_chance: 0.000000000001,
            craft_level: 14,
            craft_bonus: 1152,
            prop_count: 7,
            
            can_fuse: function()
            {
                return o_game.data.flags.ff_prison_solved;
            }
        }),
        soul: new Crafted_Leaf_Type("soul", 
        {
            rarity_index: 23,
            name: __("Soul"),
            craftable_manual: true,
            craft_chance: 0.0000000000001,
            craft_level: 15,
            craft_bonus: 1280,
            prop_count: 8
        }),
        quark: new Crafted_Leaf_Type("quark", 
        {
            rarity_index: 24,
            name: __("Quark"),
            craftable_manual: true,
            craft_chance: 0.00000000000001,
            craft_level: 16,
            craft_bonus: 1408,
            prop_count: 8
        }),
        dusk: new Crafted_Leaf_Type("dusk", 
        {
            rarity_index: 25,
            name: __("Dusk"),
            craftable_manual: true,
            craft_chance: 0.000000000000001,
            craft_level: 17,
            craft_bonus: 1536,
            prop_count: 8
        })
    };
    global.craft_leaf_types_rarity_array = struct_to_array(global.craft_leaf_types);
    sort_array_by(global.craft_leaf_types_rarity_array, "rarity_index", false);
    var last_leaf = global.craft_leaf_types_rarity_array[0];
    global.epsilon_max = last_leaf.craft_chance;
    global.craft_leaf_upgrade_vars = 
    {
        alb_enemy_damage: new Crafted_Leaf_Upgrade(
        {
            value: 5,
            min_rarity: 0,
            value_func: ceil
        }),
        alchemy_brew_multiplier: new Crafted_Leaf_Upgrade(
        {
            value: 0.0000000001,
            min_rarity: 13
        }),
        alchemy_brew_crit_chance: new Crafted_Leaf_Upgrade(
        {
            value: 0.0000000001,
            min_rarity: 8
        }),
        alchemy_brew_crit_multi_chance: new Crafted_Leaf_Upgrade(
        {
            value: 0.00000000001,
            min_rarity: 10
        }),
        blc_value_adder: new Crafted_Leaf_Upgrade(
        {
            value: 25,
            min_rarity: 0,
            value_func: ceil
        }),
        blc_value_multiplier_craft: new Crafted_Leaf_Upgrade(
        {
            value: 0.0001,
            min_rarity: 3
        }),
        blower_enemy_damage: new Crafted_Leaf_Upgrade(
        {
            value: 5,
            min_rarity: 1,
            value_func: ceil
        }),
        blower_enemy_damage_multiplier_craft: new Crafted_Leaf_Upgrade(
        {
            value: 0.01,
            min_rarity: 8
        }),
        combo_multiplier: new Crafted_Leaf_Upgrade(
        {
            value: 0.01,
            min_rarity: 1
        }),
        converter_crit_value: new Crafted_Leaf_Upgrade(
        {
            value: 0.01,
            min_rarity: 0
        }),
        cursed_autocollect: new Crafted_Leaf_Upgrade(
        {
            value: 0.0000001,
            min_rarity: 9,
            value_func: ceil
        }),
        cursed_autocollect_multiplier: new Crafted_Leaf_Upgrade(
        {
            value: 0.000000001,
            min_rarity: 9
        }),
        damage_resistance_absolute: new Crafted_Leaf_Upgrade(
        {
            value: 2,
            min_rarity: 0,
            value_func: ceil
        }),
        damage_resistance: new Crafted_Leaf_Upgrade(
        {
            value: 0.00000005,
            min_rarity: 7
        }),
        damage_types: new Crafted_Leaf_Upgrade(
        {
            value: 0.00000001,
            min_rarity: 12,
            collection: global.damage_types,
            collection_exclude_keys: global.damage_types_not_craftable_keys
        }),
        dice_battlefield_damage_multiplier_craft: new Crafted_Leaf_Upgrade(
        {
            value: 0.00000000001,
            min_rarity: 11
        }),
        enemy_drop_multiplier: new Crafted_Leaf_Upgrade(
        {
            value: 0.001,
            min_rarity: 5,
            value_func: ceil
        }),
        enemy_shards_drop_base_value: new Crafted_Leaf_Upgrade(
        {
            value: 0.0000001,
            min_rarity: 10,
            value_func: ceil
        }),
        enemy_shards_drop_multiplier: new Crafted_Leaf_Upgrade(
        {
            value: 0.00000001,
            min_rarity: 10
        }),
        energy_base_charge_value: new Crafted_Leaf_Upgrade(
        {
            value: 0.00000001,
            min_rarity: 11
        }),
        energy_base_charge_value_multiplier: new Crafted_Leaf_Upgrade(
        {
            value: 0.0000000001,
            min_rarity: 11
        }),
        max_resource_storage: new Crafted_Leaf_Upgrade(
        {
            value: 0.00001,
            value_func: ceil,
            min_rarity: 11,
            collection: global.resources_energy,
            value_multiplier_keys: 
            {
                energy_quark: 0.02
            }
        }),
        max_resource_storage_pct: new Crafted_Leaf_Upgrade(
        {
            value: 0.0000000001,
            min_rarity: 11,
            collection: global.resources_energy
        }),
        mlc_value_adder: new Crafted_Leaf_Upgrade(
        {
            value: 0.3,
            min_rarity: 5,
            value_func: ceil
        }),
        mlc_value_multiplier_craft: new Crafted_Leaf_Upgrade(
        {
            value: 0.000001,
            min_rarity: 7
        }),
        nuclear_fuel_multiplier: new Crafted_Leaf_Upgrade(
        {
            value: 0.001,
            min_rarity: 0
        }),
        player_hp_multiplier: new Crafted_Leaf_Upgrade(
        {
            value: 0.001,
            min_rarity: 2
        }),
        quark_damage_multiplier_craft: new Crafted_Leaf_Upgrade(
        {
            value: 0.000000001,
            min_rarity: 16
        }),
        relics_base_damage_multiplier: new Crafted_Leaf_Upgrade(
        {
            value: 0.000000001,
            min_rarity: 10
        }),
        resources_leaf_add: new Crafted_Leaf_Upgrade(
        {
            has_resources: true,
            value: 1,
            min_rarity: 0,
            value_func: ceil,
            resource_check_var: "has_craft_property_leaf_add"
        }),
        scrolls_duration: new Crafted_Leaf_Upgrade(
        {
            value: 0.0001,
            min_rarity: 4
        }),
        skip_tower_floor_chance: new Crafted_Leaf_Upgrade(
        {
            value: 0.0000000001,
            min_rarity: 10
        }),
        skip_tower_floor_chance_multiplier: new Crafted_Leaf_Upgrade(
        {
            value: 0.0000000003,
            min_rarity: 12
        }),
        slap_multiplier_craft: new Crafted_Leaf_Upgrade(
        {
            value: 0.0000001,
            min_rarity: 3
        }),
        soul_forge_complete_count_multiplier_craft: new Crafted_Leaf_Upgrade(
        {
            value: 0.0000000008000000000000001,
            min_rarity: 15
        }),
        tower_floor: new Crafted_Leaf_Upgrade(
        {
            value: 0.0001,
            min_rarity: 8,
            value_func: ceil
        }),
        tower_floor_pct: new Crafted_Leaf_Upgrade(
        {
            value: 0.0000000001,
            min_rarity: 9
        }),
        trade_resources_multiplier: new Crafted_Leaf_Upgrade(
        {
            has_resources: true,
            value: 0.005,
            min_rarity: 1,
            resource_check_var: "can_trade"
        }),
        trade_resources_multiplier_global: new Crafted_Leaf_Upgrade(
        {
            value: 0.0001,
            min_rarity: 2,
            resource_check_var: "can_trade"
        }),
        witch_cursed_count_multiplier: new Crafted_Leaf_Upgrade(
        {
            value: 0.0000001,
            min_rarity: 9
        }),
        witch_essence_count_multiplier: new Crafted_Leaf_Upgrade(
        {
            value: 0.0000000031622776601683795,
            min_rarity: 9
        })
    };
    init_game_object_struct(global.craft_leaf_upgrade_vars);
    global.craft_leaf_upgrade_vars_array = struct_to_sorted_array_key(global.craft_leaf_upgrade_vars);
    global.craft_user_vars = 
    {
        ub: random(1)
    };
    global.craft_level_names = {};
    var __array = global.craft_leaf_types_rarity_array;
    var __prop_len = array_length(__array);
    var __i = __prop_len - 1;
    while (__i >= 0)
    {
        var mitem = __array[__i];
        var __ireal = __prop_len - 1 - __i;
        if (!is_undefined(variable_struct_get(global.craft_level_names, mitem.craft_level)))
        {
        }
        else
        {
            variable_struct_set(global.craft_level_names, mitem.craft_level, mitem.name);
        }
        __i--;
    }
}

function refresh_crafted_leaves_cost()
{
    var __array = global.craft_leaves_backpack;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        mitem.build_fusion_cost();
    }
    __array = global.craft_leaves_inventory;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        mitem.build_fusion_cost();
    }
}

function reset_crafted_leaf_filter()
{
    global.craft_leaves_filter_index = -1;
    global.craft_leaves_filter_key = "";
    global.craft_leaves_filter_struct = undefined;
}

function salvage_crafted_leaf(arg0)
{
    var leaf = get_leaf_by_id(arg0);
    if (leaf.data.locked && !get_option(global.options.salvage_locked_leaves))
    {
        exit;
    }
    leaf.reclaim_shards();
    var salvage_resources = leaf.get_salvage_resources();
    if (global.selected_craft_item_id == leaf.data.id)
    {
        global.selected_craft_item_id = -1;
    }
    var res = delete_crafted_leaf(arg0);
    instance_destroy(o_tooltip);
    if (!res)
    {
        exit;
    }
    add_resources(salvage_resources);
}

function stop_craft_leaf()
{
    dec_resources(global.game_settings.craft_leaves_cost);
    o_game.data.stats.crafted_leaves++;
    var craft_quality = irandom_range(1, 100);
    with (o_gui_instance_crafting)
    {
        crafted = true;
        var ub_tmp = abs(sin(ub));
        if (ub_tmp < 0.01)
        {
            ub_tmp = 0;
        }
        craft_quality = (1 - ub_tmp) * 100;
        alarm[3] = sec(0.1);
    }
    var leaf = craft_leaf(
    {
        quality_base: craft_quality
    });
    global.tavern_games_playing.crafting = false;
    check_auto_salvage();
    return leaf;
}

function swap_leaves(arg0, arg1)
{
    if (is_struct(arg0))
    {
        if (in_array(arg0, global.craft_leaves_inventory))
        {
            swap_array_items(global.craft_leaves_inventory, global.craft_leaves_backpack, arg0, arg1);
        }
        else
        {
            swap_array_items(global.craft_leaves_backpack, global.craft_leaves_inventory, arg0, arg1);
        }
        refresh_ua_section("crafted_leaves");
        global.selected_inventory_item.crafted_leaf_swap = undefined;
    }
    else
    {
        global.selected_inventory_item.crafted_leaf_swap = arg1;
    }
}
