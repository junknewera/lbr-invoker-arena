function gui_item_crafting(arg0, arg1)
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
    var y_height = global.gui_items_default_height;
    var y_start = arg1;
    var col_x2 = arg0 + gui_col_x(9);
    var col_y2 = y_start + gui_col_y(0.5);
    var col_x3 = arg0 + gui_col_x(15);
    var col_y3 = y_start + gui_col_y(0.5);
    var inventory_size = get_craft_inventory_size();
    var backpack_size = get_craft_backpack_size();
    var craft_leaves_inventory_length = array_length(global.craft_leaves_inventory);
    var craft_leaves_backpack_length = array_length(global.craft_leaves_backpack);
    var selected_leaf = get_leaf_by_id(global.selected_craft_item_id);
    var has_selected_leaf = is_struct(selected_leaf);
    if (is_current_dialog_section(global.dialog_sections.crafting.craft))
    {
        col_y2 = y_start + gui_col_y(1);
        col_y3 = y_start + gui_col_y(2.5);
        draw_crafted_leaves_inventory_and_backpack(arg0, arg1);
        if (is_struct(selected_leaf))
        {
            var key_modifier = get_key_modifier();
            key_modifier = min(key_modifier, selected_leaf.get_max_level() - selected_leaf.data.level);
            var can_upgrade = selected_leaf.can_upgrade(key_modifier);
            var can_reroll = selected_leaf.can_reroll();
            var can_ascend = selected_leaf.can_ascend();
            var can_reroll_craft_quality = selected_leaf.can_reroll_craft_quality();
            var has_craft_improve_rng_upgrade = get_upgrade_count(global.shops.gems.craft_improve_rng) > 0 && global.shops.gems.craft_improve_rng.data.toggle;
            var leaf_info = selected_leaf.get_info();
            draw_sprite_contain(selected_leaf.get_sprite(), 0, col_x2, col_y2, 32, 0, 16777215, 1, undefined, true);
            draw_heading(col_x2 + gui_col_x(1), col_y2, selected_leaf.get_name());
            var is_in_inventory = crafted_leaf_is_in_inventory(selected_leaf.data.id);
            var is_in_backpack = crafted_leaf_is_in_backpack(selected_leaf.data.id);
            var can_move_to_backpack = backpack_size > craft_leaves_backpack_length && is_in_inventory;
            var can_move_to_inventory = inventory_size > craft_leaves_inventory_length && is_in_backpack;
            var equip_x = arg0 + gui_col_x(16);
            var equip_y = arg1 + gui_col_y(0.5);
            if (is_in_backpack)
            {
                if (gui_button_tl(equip_x, equip_y, __("Equip"), can_move_to_inventory, gui_col_x(2)))
                {
                    move_array_item(selected_leaf, global.craft_leaves_backpack, global.craft_leaves_inventory);
                    refresh_ua_section("crafted_leaves");
                }
            }
            if (is_in_inventory)
            {
                if (gui_button_tl(equip_x, equip_y, __("Unequip"), can_move_to_backpack, gui_col_x(2)))
                {
                    move_array_item(selected_leaf, global.craft_leaves_inventory, global.craft_leaves_backpack);
                    refresh_ua_section("crafted_leaves");
                }
            }
            gui_button_toggle_lock(arg0 + gui_col_x(20), arg1 + gui_col_y(1), selected_leaf);
            gui_button_salvage(arg0 + gui_col_x(22.5), arg1 + gui_col_y(1), selected_leaf, undefined, undefined, undefined, selected_leaf.can_salvage(), 
            {
                resources_mini: selected_leaf.get_salvage_resources()
            }, false);
            var action_y = col_y2 + gui_col_y(1.5);
            var sub_section = get_default_struct_value(global.selected_inventory_item, "craft_section", "upgrades");
            var sub_sections = [
            {
                key: "upgrades",
                text: __("Upgrades")
            }, 
            {
                key: "reroll",
                text: __("Reroll")
            }];
            action_y += draw_button_sections(col_x2, action_y, sub_sections, function(arg0)
            {
                global.selected_inventory_item.craft_section = arg0.key;
            }, gui_col_x(5), sub_section);
            var action_y_start = action_y;
            switch (sub_section)
            {
                case "upgrades":
                    var upgrade_text = iif(key_modifier > 1, sprintf(__("Upgrade %sx"), key_modifier), __("Upgrade"));
                    var upgrade_cost = selected_leaf.get_upgrade_cost(key_modifier);
                    if (gui_button_sprite_tl(col_x2, action_y, spr_icon_upgrade, can_upgrade, undefined, 
                    {
                        resources_mini: upgrade_cost,
                        tooltip: upgrade_text
                    }))
                    {
                        selected_leaf.upgrade(key_modifier);
                        instance_destroy(o_tooltip);
                    }
                    var ascend_tooltip = selected_leaf.can_ascend_level() ? "" : __("Ascension available after a leaf was upgraded to max level.");
                    if (gui_button_sprite_tl(col_x2 + gui_col_x(2.25), action_y, spr_icon_leafscension, can_ascend, undefined, 
                    {
                        resources_mini: selected_leaf.get_ascend_cost(),
                        tooltip: ascend_tooltip
                    }))
                    {
                        selected_leaf.ascend();
                    }
                    var can_max = can_upgrade || can_ascend || (has_craft_improve_rng_upgrade && (can_reroll || can_reroll_craft_quality));
                    if (gui_button_sprite_tl(col_x2 + gui_col_x(4.3), action_y, spr_icon_upgrade_max, can_max, undefined, 
                    {
                        tooltip: __s("Upgrade and ascend this leaf to max level, reroll RNG until %s (requires %s upgrade).", number_format_percent(1), __("Craft RNG Manipulator")),
                        text_below: __("Max")
                    }))
                    {
                        selected_leaf.max_leaf();
                    }
                    action_y += global.ui_gaps.button_y_lg;
                    if (global.resources.shards.data.unlocked)
                    {
                        var key_modifier_shards = get_key_modifier();
                        if (selected_leaf.selected_prop_index >= 0)
                        {
                            key_modifier_shards = min(key_modifier_shards, selected_leaf.get_shards_max_count_single() - selected_leaf.get_shards_count(selected_leaf.selected_prop));
                        }
                        else
                        {
                            key_modifier_shards = min(key_modifier_shards, selected_leaf.get_shards_max_count() - selected_leaf.get_shards_count());
                        }
                        key_modifier_shards = max(1, key_modifier_shards);
                        var can_add_shard = selected_leaf.can_add_shard(key_modifier_shards);
                        var add_shard_text = (key_modifier_shards > 1) ? __s("Add Shard %sx", key_modifier_shards) : __("Add Shard");
                        var add_shard_cost = selected_leaf.get_shards_cost();
                        add_shard_cost = multiply_struct_values(add_shard_cost, key_modifier_shards);
                        if (gui_button_tl(col_x2, action_y, add_shard_text, can_add_shard, gui_col_x(3), undefined, 
                        {
                            resources_mini: add_shard_cost
                        }))
                        {
                            selected_leaf.add_shard(key_modifier_shards);
                            instance_destroy(o_tooltip);
                        }
                        action_y += global.ui_gaps.button_y_lg;
                        if (gui_button_tl(col_x2, action_y, __("Reclaim Shards"), selected_leaf.can_reclaim_shards(), gui_col_x(3), undefined, 
                        {
                            materials_mini: selected_leaf.get_reclaim_shards_cost(),
                            tooltip: leaf_info,
                            halign: 0
                        }))
                        {
                            selected_leaf.reclaim_shards(true);
                            instance_destroy(o_tooltip);
                        }
                    }
                    break;
                case "reroll":
                    var button_width = gui_col_x(3);
                    if (gui_button_tl(col_x2, action_y + gui_col_y(0), __("Reroll RNG"), can_reroll, button_width, undefined, 
                    {
                        resources_mini: selected_leaf.get_reroll_cost(),
                        tooltip: sprintf(__("RNG Quality: %s%"), selected_leaf.data.quality)
                    }))
                    {
                        selected_leaf.reroll_rng();
                        instance_destroy(o_tooltip);
                    }
                    action_y += global.ui_gaps.button_y_lg;
                    if (gui_button_tl(col_x2, action_y + gui_col_y(0), __("Reroll Craft RNG"), can_reroll_craft_quality, button_width, undefined, 
                    {
                        resources_mini: selected_leaf.get_reroll_craft_quality_cost(),
                        tooltip: sprintf(__("Craft Quality: %s%"), selected_leaf.data.quality_base)
                    }))
                    {
                        selected_leaf.reroll_craft_rng();
                        instance_destroy(o_tooltip);
                    }
                    action_y += global.ui_gaps.button_y_lg;
                    var can_reroll_props = selected_leaf.can_reroll_props();
                    if (gui_button_tl(col_x2, action_y + gui_col_y(0), __("Reroll props"), can_reroll_props, button_width, undefined, 
                    {
                        materials_mini: selected_leaf.get_reroll_props_cost(),
                        materials_options: 
                        {
                            show_tooltip: true
                        }
                    }))
                    {
                        selected_leaf.reroll_props();
                        instance_destroy(o_tooltip);
                    }
                    action_y += global.ui_gaps.button_y_lg;
                    var can_reroll_shards = selected_leaf.can_reroll_shards();
                    if (gui_button_tl(col_x2, action_y + gui_col_y(0), __("Reroll Shards"), can_reroll_shards, button_width, undefined, 
                    {
                        materials_mini: selected_leaf.get_reroll_shards_cost()
                    }))
                    {
                        selected_leaf.reroll_shards();
                        instance_destroy(o_tooltip);
                    }
                    action_y += global.ui_gaps.button_y_lg;
                    break;
            }
            var leaf_description = selected_leaf.get_info(true);
            col_y3 += draw_description(col_x3, col_y3, leaf_description, gui_col_x(8));
            col_y3 += gui_col_y(1);
            var can_scroll = mouse_in_gui_content_range();
            if (gui_button_sprite_tl(col_x3 + gui_col_x(2.75), col_y3, spr_gui_arrow_up, true) || (mouse_wheel_up() && can_scroll))
            {
                selected_leaf.move_selected_prop(-1);
            }
            if (gui_button_sprite_tl(col_x3 + gui_col_x(3.75), col_y3, spr_gui_arrow_down, true) || (mouse_wheel_down() && can_scroll))
            {
                selected_leaf.move_selected_prop(1);
            }
            if (selected_leaf.selected_prop_index >= 0)
            {
                if (gui_button_tl(col_x3 + gui_col_x(6), col_y3, __("Clear"), true, gui_col_x(2), undefined, 
                {
                    tooltip: __("Clear shard selection")
                }))
                {
                    selected_leaf.move_selected_prop(-999999);
                }
            }
        }
        var can_craft = can_craft_leaf();
        var can_craft_hotkey = (can_craft && keyboard_check_pressed(vk_space)) && (!instance_exists(o_gui_instance_crafting) || !o_gui_instance_crafting.craft_stop_timeout);
        var autocraft = get_option(global.options.autocraft) && can_craft;
        var craft_x = arg0 + gui_col_x(1.5);
        var craft_y = arg1 + gui_col_y(16);
        if (global.is_mobile)
        {
            craft_y += gui_col_y(1.5);
        }
        if (!global.tavern_games_playing.crafting)
        {
            if (gui_button(craft_x, craft_y, __("Craft"), can_craft, gui_col_x(3), undefined, 
            {
                resources_mini: global.game_settings.craft_leaves_cost
            }) || can_craft_hotkey || autocraft)
            {
                instance_destroy(o_gui_instance_crafting);
                var o = instance_create_layer(craft_x + gui_col_x(3), craft_y - gui_col_y(1.5), global.layers.gui, o_gui_instance_crafting);
                var width = gui_content_width - gui_col_x(6);
                if (global.is_mobile)
                {
                    width = gui_col_x(10);
                }
                o.width = width;
            }
        }
        else if (gui_button(craft_x, craft_y, __("Stop"), true, gui_col_x(3)))
        {
            stop_craft_leaf();
        }
        return max(arg1, col_y2, col_y3) - y_start;
    }
    else if (is_current_dialog_section(global.dialog_sections.crafting.overview))
    {
        draw_crafted_leaves_inventory_and_backpack(arg0, arg1);
        if (has_selected_leaf)
        {
            col_y2 += draw_heading(col_x2, col_y2, __("Color"), undefined, undefined, undefined, undefined, false);
            col_y2 += global.ui_gaps.sm;
            var b_padding_x = global.is_mobile ? gui_col_x(1.5) : gui_col_x(1);
            var b_padding_y = global.ui_gaps.lg;
            var b_col_x = 0;
            var b_col_y = 0;
            var __array = global.custom_colors_array;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                var bx = col_x2 + gui_col_x(0.5) + (b_padding_x * b_col_x);
                var by = col_y2 + (b_padding_y * b_col_y);
                if (bx >= (col_x2 + gui_col_x(5)))
                {
                    b_col_x = 0;
                    b_col_y++;
                    bx = col_x2 + gui_col_x(0.5) + (b_padding_x * b_col_x);
                    by = col_y2 + (b_padding_y * b_col_y);
                }
                if (gui_button_sprite(bx, by, mitem.sprite))
                {
                    selected_leaf.data.color_id = mitem.key;
                }
                b_col_x++;
            }
        }
        col_y3 += draw_heading(col_x3, col_y3, __("Filter"), undefined, undefined, undefined, undefined, false);
        col_y3 += global.ui_gaps.xs;
        var filter_text_key = "-";
        var filter_text_key_upgrade = undefined;
        if (global.craft_leaves_filter_index >= 0)
        {
            filter_text_key = global.craft_leaves_filter_key;
            filter_text_key_upgrade = variable_struct_get(global.texts_upgrade_attributes, filter_text_key);
            if (is_struct(filter_text_key_upgrade))
            {
                filter_text_key = filter_text_key_upgrade.text;
                if (is_struct(filter_text_key))
                {
                    filter_text_key = filter_text_key_upgrade.text_neutral;
                }
            }
        }
        col_y3 += draw_description(col_x3, col_y3, __s("Current filter: %s", filter_text_key));
        if (gui_button_tl(col_x3, col_y3, __("Select property"), undefined, gui_col_x(3)))
        {
            var dialog = actions_dialog_simple(draw_crafted_leaves_filter_selection, undefined, 
            {
                filter_check_func: "is_obfuscated_filter"
            }, undefined, undefined, true);
            dialog.click_action = select_crafted_leaves_filter;
        }
        if (gui_button_sprite_tl(col_x3 + gui_col_x(7.5), col_y3, spr_icon_cancel, undefined, undefined, 
        {
            tooltip: __("Clear filter")
        }))
        {
            reset_crafted_leaf_filter();
        }
    }
    else if (is_current_dialog_section(global.dialog_sections.crafting.transformation))
    {
        draw_crafted_leaves_inventory_and_backpack(arg0, arg1, select_transform_leaf);
        col_y2 += draw_heading(col_x2, col_y2, __("Transformation Slot"), undefined, undefined, undefined, undefined, false);
        if (gui_button_sprite_tl(col_x2, col_y2 + gui_col_y(global.is_mobile ? 0.75 : 0.4), spr_gui_arrow_right, has_selected_leaf, undefined, 
        {
            tooltip: __("Add to slot")
        }))
        {
            select_transform_leaf(selected_leaf);
        }
        draw_crafted_leaves(col_x2 + gui_col_x(1.5), col_y2, global.craft_leaves_transformation_slots, global.game_settings.craft_leaves_transformation_slots, undefined, 0, 64, true, function(arg0)
        {
            remove_item_from_array_by_id(global.craft_leaves_transformation_slots, arg0.data.id);
        }, undefined, "transformation");
        var transform_leaf = undefined;
        if (array_length(global.craft_leaves_transformation_slots) > 0)
        {
            transform_leaf = @@array_get@@(global.craft_leaves_transformation_slots, 0);
        }
        if (is_struct(transform_leaf))
        {
            col_y2 += global.ui_gaps.xl;
            var property_text = "-";
            if (transform_leaf.selected_prop_index > -1)
            {
                property_text = get_upgrade_name(transform_leaf.selected_prop);
            }
            col_y2 += draw_description(col_x2, col_y2, __s("Selected property: %s", "\n" + property_text), gui_col_x(8));
            if (gui_button_sprite_tl(col_x2, col_y2, spr_gui_arrow_left) || mouse_wheel_up())
            {
                transform_leaf.move_selected_prop(-1);
            }
            if (gui_button_sprite_tl(col_x2 + gui_col_x(1), col_y2, spr_gui_arrow_right) || mouse_wheel_down())
            {
                transform_leaf.move_selected_prop(1);
            }
            if (gui_button_sprite_tl(col_x2 + gui_col_x(4.5), col_y2, spr_icon_cancel, undefined, undefined, 
            {
                tooltip: __("Clear selection")
            }))
            {
                transform_leaf.move_selected_prop(-999999);
            }
            col_y2 += global.ui_gaps.lg;
            if (is_energy_shrine_prophecy_fulfilled())
            {
                if (get_struct_length(o_game.data.stats.crafted_vars_transform_unlocked) == 0)
                {
                    draw_description(col_x2, col_y2, __("Unlock properties at The Energy Shrine"));
                }
                else
                {
                    var property_output_text = __("Random");
                    if (!is_undefined(global.craft_leaves_transform_output_var))
                    {
                        property_output_text = get_upgrade_name(global.craft_leaves_transform_output_var.key);
                    }
                    var transform_output_text = sprintf("%s:%s%s (%s/%s)", __("Target property"), "\n", property_output_text, global.craft_leaves_transform_output_index + 1, array_length(global.craft_leaf_upgrade_vars_array));
                    col_y2 += draw_description(col_x2, col_y2, transform_output_text, gui_col_x(8));
                    if (gui_button_tl(col_x2, col_y2, __("Select property"), undefined, gui_col_x(3)))
                    {
                        var o = actions_dialog_simple(draw_crafted_leaves_filter_selection, undefined, 
                        {
                            filter_check_func: "is_obfuscated"
                        }, undefined, undefined, true);
                        o.click_action = select_transform_leaf_property;
                    }
                    if (gui_button_sprite_tl(col_x2 + gui_col_x(4.5), col_y2, spr_icon_cancel, undefined, undefined, 
                    {
                        tooltip: __("Clear selection")
                    }))
                    {
                        global.craft_leaves_transform_output_index = -1;
                        global.craft_leaves_transform_output_var = undefined;
                    }
                }
                col_y2 += global.ui_gaps.xl;
            }
            var transform_text = is_undefined(global.craft_leaves_transform_output_var) ? __("Reroll property") : __("Set property");
            var can_transform = transform_leaf.can_transform();
            if (gui_button_tl(col_x2, col_y2, transform_text, can_transform, gui_col_x(3)))
            {
                transform_leaf.transform_reroll_prop();
                instance_destroy(o_tooltip);
            }
            col_y2 += global.ui_gaps.button_y;
            if (can_transform && transform_leaf.selected_prop_index > -1 && transform_leaf.get_shards_count(transform_leaf.selected_prop) > 0)
            {
                col_y2 += draw_description(col_x2, col_y2, __("Warning: You will lose all shards from the selected property."), gui_col_x(5));
            }
            draw_resources(col_x2, col_y2, transform_leaf.get_transformation_cost());
            var leaf_description = transform_leaf.get_info();
            col_y3 += draw_description(col_x3, col_y3, leaf_description, gui_col_x(8));
        }
    }
    else if (is_current_dialog_section(global.dialog_sections.crafting.fusion))
    {
        col_x3 = arg0 + gui_col_x(16);
        draw_crafted_leaves_inventory_and_backpack(arg0, arg1, select_fusion_leaf);
        col_y2 += draw_heading(col_x2, col_y2, __("Fusion Slots"), undefined, undefined, undefined, undefined, false);
        draw_crafted_leaves(col_x2, col_y2, global.craft_leaves_fusion_slots, global.game_settings.craft_leaves_fusion_slots, undefined, 0, 64, true, function(arg0)
        {
            remove_item_from_array_by_id(global.craft_leaves_fusion_slots, arg0.data.id);
        }, undefined, "fusion");
        col_y2 += global.ui_gaps.button_y_lg;
        has_selected_leaf = is_struct(selected_leaf);
        var can_remove = has_selected_leaf && array_length(global.craft_leaves_fusion_slots) > 0 && item_id_is_in_array(global.craft_leaves_fusion_slots, selected_leaf.data.id);
        if (gui_button_sprite_tl(col_x2, col_y2, spr_gui_arrow_left, can_remove))
        {
            remove_item_from_array_by_id(global.craft_leaves_fusion_slots, selected_leaf.data.id);
            if (array_length(global.craft_leaves_fusion_slots) > 0)
            {
                selected_leaf = global.craft_leaves_fusion_slots[0];
                global.selected_craft_item_id = selected_leaf.data.id;
                global.selected_inventory_item.crafted_leaf = selected_leaf;
            }
            exit;
        }
        var can_move_to_fusion_slot = has_selected_leaf && array_length(global.craft_leaves_fusion_slots) < global.game_settings.craft_leaves_fusion_slots && !in_array(selected_leaf, global.craft_leaves_fusion_slots);
        if (gui_button_sprite_tl(col_x2 + gui_col_x(1.5), col_y2, spr_gui_arrow_right, can_move_to_fusion_slot))
        {
            array_push(global.craft_leaves_fusion_slots, selected_leaf);
            exit;
        }
        col_y2 += global.ui_gaps.button_y_lg;
        var can_fuse = can_fuse_crafted_leaves();
        var can_fuse_hotkey = can_fuse && keyboard_check_pressed(vk_space);
        if (can_fuse_hotkey || gui_button_tl(col_x2, col_y2, __("Fuse"), can_fuse, gui_col_x(3)))
        {
            fuse_crafted_leaves();
            exit;
        }
        col_y2 += global.ui_gaps.lg;
        if (get_upgrade_count(global.shops.gems.craft_autofuse) > 0)
        {
            global.options.craft_autofuse.draw(col_x2, col_y2);
            col_y2 += global.ui_gaps.lg;
            global.options.craft_autofuse_type.draw(col_x2, col_y2);
        }
        col_y3 += draw_heading(col_x3, col_y3, __("Cost"), undefined, undefined, undefined, undefined, false);
        if (array_length(global.craft_leaves_fusion_slots) > 0)
        {
            var first_leaf = global.craft_leaves_fusion_slots[0];
            col_y3 += draw_resources(col_x3, col_y3, first_leaf.get_fusion_cost());
            col_y3 += global.ui_gaps.sm;
        }
        col_y3 += draw_description(col_x3, col_y3, global.craft_leaves_fusion_text, gui_col_x(7));
        if (global.debug)
        {
            if (gui_button_tl(arg0, arg1 + 550, "add dusk"))
            {
                craft_leaf_type(global.craft_leaf_types.dusk, 
                {
                    quality_base: 100,
                    quality: 100
                });
            }
        }
    }
    else if (is_current_dialog_section(global.dialog_sections.crafting.shadow_forge))
    {
        draw_crafted_leaves_inventory_and_backpack(arg0, arg1, select_fusion_leaf);
        selected_leaf = get_leaf_by_id(global.selected_craft_item_id);
        if (is_struct(selected_leaf))
        {
            if (selected_leaf.data.tier < selected_leaf.get_max_tier())
            {
                col_y2 += draw_heading(col_x2, col_y2, __s("Current tier: %s/%s", selected_leaf.data.tier, selected_leaf.get_max_tier()));
                col_y2 += draw_description(col_x2, col_y2, [__s("Level: %s/%s", selected_leaf.data.level, selected_leaf.min_ascend_craft_level), __s("Ascend Level: %s/%s", selected_leaf.data.ascend_level - 1, selected_leaf.min_ascend_craft_ascend_level - 1)]);
                var can_increase_tier = selected_leaf.can_increase_tier();
                if (gui_button_tl(col_x2, col_y2, __("Increase tier"), can_increase_tier, gui_col_x(3.5), undefined, 
                {
                    result_mini: selected_leaf.get_tier_upgrade_cost()
                }))
                {
                    selected_leaf.upgrade_tier();
                }
            }
            else
            {
                col_y2 += draw_heading(col_x2, col_y2, __s("Max tier reached (%s)", selected_leaf.get_max_tier()));
            }
            var leaf_description = selected_leaf.get_info();
            col_y3 += draw_description(col_x3, col_y3, leaf_description, gui_col_x(8));
        }
        if (global.debug)
        {
            if (selected_leaf && gui_button_tl(arg0, arg1 + gui_col_y(15), "info"))
            {
                log(selected_leaf.data.props);
            }
            if (selected_leaf && gui_button_tl(arg0 + gui_col_x(2), arg1 + gui_col_y(15), "dmg type"))
            {
                if (is_undefined(struct_get_from_hash(selected_leaf.data.props, variable_get_hash("damage_types"))))
                {
                    log("no damage type found.");
                    exit;
                }
                selected_leaf.data.props.damage_types = 
                {
                    ancient: 1,
                    __collection_key: "ancient"
                };
                selected_leaf.set_prop_values();
            }
        }
    }
    else if (is_current_dialog_section(global.dialog_sections.crafting.sets))
    {
        draw_heading(arg0, arg1, __("Craft Sets"));
        var craft_sets_size = get_craft_sets_size();
        var dcl_y_add = global.is_mobile ? 1 : 0;
        var y_padding = 3.25;
        var crafted_leaves_y_start = global.is_mobile ? 6 : 5.65;
        set_default_font(f_gui_small, 0);
        draw_text(arg0, arg1 + gui_col_y(1), sprintf(__("Current craft set: #%s"), o_game.data.current_craft_set + 1));
        draw_crafted_leaves(arg0 + gui_col_x(10), arg1 + gui_col_y(2), global.craft_leaves_inventory, inventory_size, global.craft_leaves_backpack, backpack_size, undefined, false, undefined, undefined, "inv_small");
        if (gui_button_tl(arg0, arg1 + gui_col_y(2), __("Save current craft set"), true))
        {
            confirm_save_craft_set(o_game.data.current_craft_set);
        }
        draw_button_list(arg0, arg1 + gui_col_y(6), __("Load craft set #%s"), craft_sets_size, function(arg0)
        {
            load_craft_set(arg0);
        }, function(arg0)
        {
            return !is_undefined(variable_struct_get(o_game.data.craft_sets, arg0));
        }, y_padding, gui_col_x(4));
        draw_button_list(arg0 + gui_col_x(5), arg1 + gui_col_y(6), __("Save craft set #%s"), craft_sets_size, function(arg0)
        {
            if (!is_undefined(variable_struct_get(o_game.data.craft_sets, arg0)))
            {
                confirm_save_craft_set(arg0);
                exit;
            }
            save_craft_set(arg0);
        }, undefined, y_padding, gui_col_x(4));
        for (var i = 0; i < craft_sets_size; i++)
        {
            var craft_set_ids = variable_struct_get(o_game.data.craft_sets, i);
            if (is_undefined(craft_set_ids))
            {
                continue;
            }
            var craft_set = [];
            var __array = craft_set_ids.inventory;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                var leaf = get_leaf_by_id(mitem);
                if (!is_struct(leaf))
                {
                    continue;
                }
                array_push(craft_set, leaf);
            }
            draw_crafted_leaves(arg0 + gui_col_x(10), arg1 + gui_col_y(crafted_leaves_y_start + (i * (y_padding + dcl_y_add))), craft_set, inventory_size, global.craft_leaves_backpack, backpack_size, inventory_size, false, undefined, undefined, "inv_small");
        }
        set_default_font(f_gui_small);
        draw_text_list(arg0, arg1 + gui_col_y(5), o_game.data.craft_sets_names, craft_sets_size, y_padding, undefined, true);
        draw_button_list(arg0 + gui_col_x(19.5), arg1 + gui_col_y(6), __("Rename"), craft_sets_size, function(arg0)
        {
            global.selected_priority_slot = arg0 + 1;
            var set_name = is_undefined(variable_struct_get(o_game.data.craft_sets_names, global.selected_priority_slot)) ? "" : variable_struct_get(o_game.data.craft_sets_names, global.selected_priority_slot);
            input_dialog(__("Crafted Leaves Sets"), function(arg0)
            {
                variable_struct_set(o_game.data.craft_sets_names, global.selected_priority_slot, arg0);
            }, __s("Rename #%s", global.selected_priority_slot), 
            {
                parent_nav: o_shop.current_nav_key
            }, 
            {
                input: set_name,
                max_length: 32
            });
        }, undefined, y_padding, gui_col_x(2));
        return 100 + gui_col_y(6 + (craft_sets_size * y_padding));
    }
    else if (is_current_dialog_section(global.dialog_sections.crafting.presets))
    {
        var transform_leaf = undefined;
        if (array_length(global.craft_leaves_transformation_slots) > 0)
        {
            transform_leaf = @@array_get@@(global.craft_leaves_transformation_slots, 0);
        }
        var craft_sets_size = get_craft_sets_size();
        var selected_preset_slot = struct_get_from_hash(global.selected_inventory_item, variable_get_hash("craft_preset"));
        draw_heading(arg0, arg1 + gui_col_y(1), __("Preset Leaf"));
        draw_crafted_leaves(arg0, arg1 + gui_col_y(2), global.craft_leaves_transformation_slots, global.game_settings.craft_leaves_transformation_slots, undefined, 0, 64, true, function(arg0)
        {
            remove_item_from_array_by_id(global.craft_leaves_transformation_slots, arg0.data.id);
        }, undefined, "transformation");
        if (gui_button_tl(arg0 + gui_col_x(4), arg1 + gui_col_y(2.5), __("Save preset"), is_struct(transform_leaf) && is_numeric(selected_preset_slot), gui_col_x(3), undefined, 
        {
            tooltip: __("Save leaf properties to the current preset")
        }))
        {
            variable_struct_set(o_game.data.craft_presets, selected_preset_slot, struct_clone(transform_leaf.data.props));
        }
        draw_heading(arg0 + gui_col_x(14), arg1 + gui_col_y(1), __("Inventory"));
        draw_crafted_leaves(arg0 + gui_col_x(14), arg1 + gui_col_y(2), global.craft_leaves_inventory, inventory_size, undefined, 0, 64, true, function(arg0)
        {
            clear_array(global.craft_leaves_transformation_slots);
            array_push(global.craft_leaves_transformation_slots, arg0);
            arg0.build_fusion_cost();
        }, undefined, "inv_small");
        draw_heading(arg0 + gui_col_x(14), arg1 + gui_col_y(5), __("Backpack"));
        draw_crafted_leaves(arg0 + gui_col_x(14), arg1 + gui_col_y(6), global.craft_leaves_backpack, backpack_size, undefined, 0, 40, true, function(arg0)
        {
            clear_array(global.craft_leaves_transformation_slots);
            array_push(global.craft_leaves_transformation_slots, arg0);
            arg0.build_fusion_cost();
        }, true, "bp_large");
        var can_move = has_selected_leaf;
        if (gui_button_tl(arg0 + gui_col_x(11.25), arg1 + gui_col_y(2.35), "<<", can_move))
        {
            clear_array(global.craft_leaves_transformation_slots);
            array_push(global.craft_leaves_transformation_slots, selected_leaf);
        }
        if (gui_button_tl(arg0 + gui_col_x(12), arg1 + gui_col_y(2.35), ">>", has_selected_leaf))
        {
            remove_item_from_array_by_id(global.craft_leaves_transformation_slots, selected_leaf.data.id);
        }
        var row_y = draw_button_list(arg0, arg1 + gui_col_y(5), __("Preset #%s"), craft_sets_size, function(arg0)
        {
            global.selected_inventory_item.craft_preset = arg0;
        }, undefined, undefined, gui_col_x(3), selected_preset_slot);
        set_default_font(f_gui_small);
        draw_text_list(arg0, arg1 + gui_col_y(4.35), o_game.data.craft_presets_names, craft_sets_size, undefined, undefined, true);
        var bx = arg0 + gui_col_x(4);
        var by = arg1 + gui_col_y(5);
        if (!is_undefined(selected_preset_slot))
        {
            var preset = variable_struct_get(o_game.data.craft_presets, selected_preset_slot);
            by += draw_heading(bx, by, __s("Preset %s", concatstr("#", selected_preset_slot + 1)));
            var resources_mini = (is_struct(transform_leaf) && is_struct(preset)) ? transform_leaf.get_preset_transformation_cost(preset) : undefined;
            if (gui_button_tl(bx, by + gui_col_y(0), __("Apply"), is_struct(transform_leaf) && is_struct(preset), gui_col_x(3), undefined, 
            {
                resources_mini: resources_mini,
                tooltip: __("Apply preset to the selected leaf")
            }))
            {
                transform_leaf.data.shards = {};
                transform_leaf.data.shards_added = 0;
                transform_leaf.set_props(preset);
                transform_leaf.selected_prop = undefined;
                transform_leaf.selected_prop_index = -1;
                transform_leaf.refresh_info_text();
                global.craft_leaves_transform_output_var = undefined;
            }
            if (gui_button_tl(bx, by + gui_col_y(3), __("Rename"), undefined, gui_col_x(3)))
            {
                global.selected_priority_slot = selected_preset_slot + 1;
                var set_name = gdsv(o_game.data.craft_presets_names, global.selected_priority_slot, "");
                input_dialog(__("Preset Leaf"), function(arg0)
                {
                    variable_struct_set(o_game.data.craft_presets_names, global.selected_priority_slot, arg0);
                }, __s("Rename #%s", global.selected_priority_slot), 
                {
                    parent_nav: o_shop.current_nav_key
                }, 
                {
                    input: set_name,
                    max_length: 20
                });
            }
            if (is_struct(preset))
            {
                draw_description(bx + gui_col_x(4), by, __("Properties") + ":");
                draw_description(bx + gui_col_x(4), by + gui_col_y(1), format_upgrade_text_names_only(preset, "\n") + "\n" + "\n" + __s("Warning: applying a preset will remove all shards."), gui_col_x(5));
            }
        }
        arg1 += (max(row_y, by) + gui_col_y(2));
        return arg1 - y_start;
    }
    else if (is_current_dialog_section(global.dialog_sections.crafting.info))
    {
        var text = [[__("Property"), __("Min craft level"), __("Leaf type"), __("Transformation")], ["", "", "", ""]];
        var __array = global.craft_leaf_upgrade_vars_array;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            var text_array_loop;
            if (is_undefined(variable_struct_get(o_game.data.stats.crafted_vars_seen, mitem.key)))
            {
                text_array_loop = ["?", ""];
            }
            else
            {
                var unlocked_text = is_undefined(variable_struct_get(o_game.data.stats.crafted_vars_transform_unlocked, mitem.key)) ? __("Locked") : __("Available");
                text_array_loop = [get_upgrade_name(mitem.key), mitem.min_rarity, sprintf("%s+", variable_struct_get(global.craft_level_names, mitem.min_rarity)), unlocked_text];
            }
            array_push(text, text_array_loop);
        }
        set_default_font(f_gui_small);
        var table_height = draw_text_table(arg0, arg1, text, global.gui_text_line_height + 2);
        y_height = max(y_height, table_height);
        return y_height;
    }
}

function gui_item_crafting_old(arg0, arg1)
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
    return gui_item_crafting_new(arg0, arg1);
    var y_height = global.gui_items_default_height;
    var y_start = arg1;
    var inventory_size = get_craft_inventory_size();
    var backpack_size = get_craft_backpack_size();
    var craft_leaves_inventory_length = array_length(global.craft_leaves_inventory);
    var craft_leaves_backpack_length = array_length(global.craft_leaves_backpack);
    var selected_leaf = get_leaf_by_id(global.selected_craft_item_id);
    var has_selected_leaf = is_struct(selected_leaf);
    if (is_current_dialog_section(global.dialog_sections.crafting.craft))
    {
        return gui_item_crafting_new(arg0, arg1);
        draw_heading(arg0, arg1 + gui_col_y(1), __("Inventory"));
        draw_crafted_leaves(arg0, arg1 + gui_col_y(2), global.craft_leaves_inventory, inventory_size, global.craft_leaves_backpack, backpack_size, undefined, undefined, undefined, undefined, "inv_small");
        draw_heading(arg0 + gui_col_x(12), arg1 + gui_col_y(1), __("Backpack"));
        draw_crafted_leaves(arg0 + gui_col_x(12), arg1 + gui_col_y(2), global.craft_leaves_backpack, backpack_size, global.craft_leaves_inventory, inventory_size, undefined, undefined, undefined, true, "bp_small");
        if (is_struct(selected_leaf))
        {
            var key_modifier = get_key_modifier();
            key_modifier = min(key_modifier, selected_leaf.get_max_level() - selected_leaf.data.level);
            var can_upgrade = selected_leaf.can_upgrade(key_modifier);
            var can_reroll = selected_leaf.can_reroll();
            var can_ascend = selected_leaf.can_ascend();
            var can_reroll_craft_quality = selected_leaf.can_reroll_craft_quality();
            var has_craft_improve_rng_upgrade = get_upgrade_count(global.shops.gems.craft_improve_rng) > 0 && global.shops.gems.craft_improve_rng.data.toggle;
            var leaf_info = selected_leaf.get_info();
            var upgrade_text = iif(key_modifier > 1, sprintf(__("Upgrade %sx"), key_modifier), __("Upgrade"));
            var upgrade_cost = selected_leaf.get_upgrade_cost(key_modifier);
            if (gui_button_tl(arg0, arg1 + gui_col_y(5), upgrade_text, can_upgrade, gui_col_x(2.25), undefined, 
            {
                resources_mini: upgrade_cost,
                tooltip: leaf_info,
                halign: 0
            }))
            {
                selected_leaf.upgrade(key_modifier);
                instance_destroy(o_tooltip);
            }
            var ascend_tooltip = selected_leaf.can_ascend_level() ? "" : __("Ascension available after a leaf was upgraded to max level.");
            if (gui_button_tl(arg0 + gui_col_x(2.75), arg1 + gui_col_y(5), __("Ascend"), can_ascend, gui_col_x(2), undefined, 
            {
                resources_mini: selected_leaf.get_ascend_cost(),
                tooltip: ascend_tooltip
            }))
            {
                selected_leaf.ascend();
            }
            if (global.resources.shards.data.unlocked)
            {
                var key_modifier_shards = get_key_modifier();
                if (selected_leaf.selected_prop_index >= 0)
                {
                    key_modifier_shards = min(key_modifier_shards, selected_leaf.get_shards_max_count_single() - selected_leaf.get_shards_count(selected_leaf.selected_prop));
                }
                else
                {
                    key_modifier_shards = min(key_modifier_shards, selected_leaf.get_shards_max_count() - selected_leaf.get_shards_count());
                }
                key_modifier_shards = max(1, key_modifier_shards);
                var can_add_shard = selected_leaf.can_add_shard(key_modifier_shards);
                var add_shard_text = iif(key_modifier_shards > 1, sprintf(__("Add Shard %sx"), key_modifier_shards), __("Add Shard"));
                var add_shard_cost = selected_leaf.get_shards_cost();
                add_shard_cost = multiply_struct_values(add_shard_cost, key_modifier_shards);
                if (gui_button_tl(arg0 + gui_col_x(6), arg1 + gui_col_y(5), add_shard_text, can_add_shard, gui_col_x(2), undefined, 
                {
                    resources_mini: add_shard_cost,
                    tooltip: leaf_info,
                    halign: 0
                }))
                {
                    selected_leaf.add_shard(key_modifier_shards);
                    instance_destroy(o_tooltip);
                }
                var can_reroll_shards = selected_leaf.can_reroll_shards();
                if (gui_button_tl(arg0 + gui_col_x(10), arg1 + gui_col_y(5), __("Reroll Shards"), can_reroll_shards, gui_col_x(2.75), undefined, 
                {
                    materials_mini: selected_leaf.get_reroll_shards_cost(),
                    tooltip: leaf_info,
                    halign: 0
                }))
                {
                    selected_leaf.reroll_shards();
                    instance_destroy(o_tooltip);
                }
                if (gui_button_tl(arg0 + gui_col_x(10), arg1 + gui_col_y(8), __("Reclaim Shards"), selected_leaf.can_reclaim_shards(), gui_col_x(2.75), undefined, 
                {
                    materials_mini: selected_leaf.get_reclaim_shards_cost(),
                    tooltip: leaf_info,
                    halign: 0
                }))
                {
                    selected_leaf.reclaim_shards(true);
                    instance_destroy(o_tooltip);
                }
                if (gui_button_tl(arg0 + gui_col_x(5.25), arg1 + gui_col_y(5), "<<", true, undefined, undefined, 
                {
                    tooltip: leaf_info,
                    halign: 0
                }) || mouse_wheel_up())
                {
                    selected_leaf.move_selected_prop(-1);
                }
                if (gui_button_tl(arg0 + gui_col_x(8.25), arg1 + gui_col_y(5), ">>", true, undefined, undefined, 
                {
                    tooltip: leaf_info,
                    halign: 0
                }) || mouse_wheel_down())
                {
                    selected_leaf.move_selected_prop(1);
                }
                if (gui_button_tl(arg0 + gui_col_x(8.25), arg1 + gui_col_y(6.75), "CLR", true, undefined, undefined, 
                {
                    tooltip: __("Clear shard selection")
                }))
                {
                    selected_leaf.move_selected_prop(-999999);
                }
            }
            if (gui_button_tl(arg0 + gui_col_x(13.5), arg1 + gui_col_y(5), __("Reroll RNG"), can_reroll, gui_col_x(2.75), undefined, 
            {
                resources_mini: selected_leaf.get_reroll_cost(),
                tooltip: sprintf(__("RNG Quality: %s%"), selected_leaf.data.quality)
            }))
            {
                selected_leaf.reroll_rng();
                instance_destroy(o_tooltip);
            }
            if (gui_button_tl(arg0 + gui_col_x(13.5), arg1 + gui_col_y(8), __("Reroll Craft RNG"), can_reroll_craft_quality, gui_col_x(2.8), undefined, 
            {
                resources_mini: selected_leaf.get_reroll_craft_quality_cost(),
                tooltip: sprintf(__("Craft Quality: %s%"), selected_leaf.data.quality_base)
            }))
            {
                selected_leaf.reroll_craft_rng();
                instance_destroy(o_tooltip);
            }
            var can_reroll_props = selected_leaf.can_reroll_props();
            if (gui_button_tl(arg0 + gui_col_x(17), arg1 + gui_col_y(5), __("Reroll props"), can_reroll_props, gui_col_x(2.75), undefined, 
            {
                tooltip: leaf_info,
                halign: 0,
                materials_mini: selected_leaf.get_reroll_props_cost(),
                materials_options: 
                {
                    show_tooltip: true
                }
            }))
            {
                selected_leaf.reroll_props();
                instance_destroy(o_tooltip);
            }
            var can_max = can_upgrade || can_ascend || (has_craft_improve_rng_upgrade && (can_reroll || can_reroll_craft_quality));
            if (gui_button_tl(arg0 + gui_col_x(17), arg1 + gui_col_y(8), __("Max leaf"), can_max, gui_col_x(2.75), undefined, 
            {
                tooltip: __s("Upgrade and ascend this leaf to max level, reroll RNG until %s (requires %s upgrade).", number_format_percent(1), __("Craft RNG Manipulator"))
            }))
            {
                selected_leaf.max_leaf();
            }
            draw_crafted_leaves_swap(arg0 + gui_col_x(22.5), arg1 + gui_col_y(3));
            gui_button_toggle_lock(arg0 + gui_col_x(22.5), arg1 + gui_col_y(5.6), selected_leaf);
            gui_button_salvage(arg0 + gui_col_x(22.5), arg1 + gui_col_y(9), selected_leaf, undefined, undefined, undefined, selected_leaf.can_salvage(), 
            {
                resources_mini: selected_leaf.get_salvage_resources()
            }, false);
            var can_move_to_backpack = backpack_size > craft_leaves_backpack_length && crafted_leaf_is_in_inventory(selected_leaf.data.id);
            var can_move_to_inventory = inventory_size > craft_leaves_inventory_length && crafted_leaf_is_in_backpack(selected_leaf.data.id);
            if (gui_button_tl(arg0 + gui_col_x(9.25), arg1 + gui_col_y(2.35), "<<", can_move_to_inventory))
            {
                move_array_item(selected_leaf, global.craft_leaves_backpack, global.craft_leaves_inventory);
                refresh_ua_section("crafted_leaves");
            }
            if (gui_button_tl(arg0 + gui_col_x(10), arg1 + gui_col_y(2.35), ">>", can_move_to_backpack))
            {
                move_array_item(selected_leaf, global.craft_leaves_inventory, global.craft_leaves_backpack);
                refresh_ua_section("crafted_leaves");
            }
        }
        if (global.debug)
        {
            if (global.selected_craft_item_id != -1)
            {
                if (gui_button_tl(arg0, arg1 + gui_col_y(16), "MAX", true))
                {
                    selected_leaf.data.ascend_level = 11;
                    selected_leaf.data.level = 30;
                    selected_leaf.data.quality = 100;
                    selected_leaf.data.quality_base = 100;
                    selected_leaf.set_prop_values(true);
                }
            }
            if (gui_button_tl(arg0 + gui_col_x(3), arg1 + gui_col_y(16), "Max Prop"))
            {
                global.craft_leaves_backpack = [];
                global.craft_leaves_inventory = [];
                var n = 1;
                repeat (9)
                {
                    var dleaf = craft_leaf_type(global.craft_leaf_types.quark);
                    if (n < 9)
                    {
                        dleaf.data.ascend_level = 11;
                        dleaf.data.level = 30;
                        dleaf.data.quality = 100;
                        dleaf.data.quality_base = 100;
                    }
                    dleaf.data.props.blower_enemy_damage = 1;
                    dleaf.data.shards.blower_enemy_damage = 10;
                    dleaf.data.props.blower_enemy_damage_multiplier_craft = 1;
                    dleaf.data.shards.blower_enemy_damage_multiplier_craft = 10;
                    dleaf.data.props.nuclear_fuel_multiplier = 1;
                    dleaf.data.shards.nuclear_fuel_multiplier = 10;
                    dleaf.data.props.max_resource_storage = 
                    {
                        __collection_key: "energy_quark",
                        energy_quark: 0
                    };
                    dleaf.data.shards.max_resource_storage = 
                    {
                        energy_quark: 10
                    };
                    dleaf.data.props.max_resource_storage_pct = 
                    {
                        __collection_key: "energy_quark",
                        energy_quark: 0
                    };
                    dleaf.data.shards.max_resource_storage_pct = 
                    {
                        energy_quark: 10
                    };
                    dleaf.set_prop_values();
                    dleaf.refresh_info_text();
                    n++;
                }
            }
            if (gui_button_tl(arg0 + gui_col_x(6), arg1 + gui_col_y(16), "Clear"))
            {
                global.craft_leaves_backpack = [];
                global.craft_leaves_inventory = [];
            }
        }
        if (gui_button_tl(arg0 + gui_col_x(21), arg1, __("Sort"), true, gui_col_x(2)))
        {
            sort_array_by(global.craft_leaves_backpack, ["rarity_index", "get_ascend_level", "get_level"]);
            sort_array_by(global.craft_leaves_inventory, ["rarity_index", "get_ascend_level", "get_level"]);
        }
        var can_craft = can_craft_leaf();
        var can_craft_hotkey = (can_craft && keyboard_check_pressed(vk_space)) && (!instance_exists(o_gui_instance_crafting) || !o_gui_instance_crafting.craft_stop_timeout);
        var autocraft = get_option(global.options.autocraft) && can_craft;
        if (!global.tavern_games_playing.crafting)
        {
            if (gui_button(arg0 + gui_col_x(1.5), arg1 + gui_col_y(11), __("Craft"), can_craft, gui_col_x(3)) || can_craft_hotkey || autocraft)
            {
                instance_destroy(o_gui_instance_crafting);
                var o = instance_create_layer(arg0, arg1 + gui_col_y(12.5), global.layers.gui, o_gui_instance_crafting);
                o.width = gui_content_width - gui_col_x(1);
            }
        }
        else if (gui_button(arg0 + gui_col_x(1.5), arg1 + gui_col_y(11), __("Stop"), true, gui_col_x(3)))
        {
            stop_craft_leaf();
        }
        return 0;
    }
    else if (is_current_dialog_section(global.dialog_sections.crafting.overview))
    {
        draw_heading(arg0, arg1 + gui_col_y(1), __("Inventory"));
        draw_crafted_leaves(arg0, arg1 + gui_col_y(2), global.craft_leaves_inventory, inventory_size, global.craft_leaves_backpack, backpack_size, undefined, undefined, undefined, undefined, "inv_small");
        draw_heading(arg0 + gui_col_x(12), arg1 + gui_col_y(1), __("Backpack"));
        draw_crafted_leaves(arg0 + gui_col_x(12), arg1 + gui_col_y(2), global.craft_leaves_backpack, backpack_size, global.craft_leaves_inventory, inventory_size, 40, undefined, undefined, true, "bp_large");
        selected_leaf = get_leaf_by_id(global.selected_craft_item_id);
        if (is_struct(selected_leaf))
        {
            var can_move_to_backpack = backpack_size > craft_leaves_backpack_length && crafted_leaf_is_in_inventory(global.selected_craft_item_id);
            var can_move_to_inventory = inventory_size > craft_leaves_inventory_length && crafted_leaf_is_in_backpack(global.selected_craft_item_id);
            if (gui_button_tl(arg0 + gui_col_x(9.25), arg1 + gui_col_y(2.35), "<<", can_move_to_inventory))
            {
                move_array_item(selected_leaf, global.craft_leaves_backpack, global.craft_leaves_inventory);
            }
            if (gui_button_tl(arg0 + gui_col_x(10), arg1 + gui_col_y(2.35), ">>", can_move_to_backpack))
            {
                move_array_item(selected_leaf, global.craft_leaves_inventory, global.craft_leaves_backpack);
            }
            draw_crafted_leaves_swap(arg0 + gui_col_x(22.5), arg1 + gui_col_y(3));
            set_default_font(f_gui_small);
            draw_text(arg0, arg1 + gui_col_y(11), __("Color"));
            var __array = global.custom_colors_array;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                if (gui_button_sprite(arg0 + gui_col_x(0.5) + (gui_col_x(1.25) * __i), arg1 + gui_col_y(13), mitem.sprite))
                {
                    selected_leaf.data.color_id = mitem.key;
                }
            }
        }
        var filter_text_key = "-";
        if (global.craft_leaves_filter_index >= 0)
        {
            filter_text_key = global.craft_leaves_filter_key;
            var filter_text_key_upgrade = variable_struct_get(global.texts_upgrade_attributes, filter_text_key);
            if (is_struct(filter_text_key_upgrade))
            {
                filter_text_key = filter_text_key_upgrade.text;
                if (is_struct(filter_text_key))
                {
                    filter_text_key = filter_text_key_upgrade.text_neutral;
                }
            }
        }
        var filter_button_text = sprintf(__("Filter: %s"), filter_text_key);
        if (gui_button_tl(arg0, arg1 + gui_col_y(5), filter_button_text, true))
        {
            var dir = get_click_dir(true);
            global.craft_leaves_filter_index += dir;
            if (global.craft_leaves_filter_index < -1)
            {
                global.craft_leaves_filter_index = array_length(global.craft_leaf_upgrade_vars_array) - 1;
            }
            if (global.craft_leaves_filter_index >= array_length(global.craft_leaf_upgrade_vars_array) || global.craft_leaves_filter_index <= -1)
            {
                reset_crafted_leaf_filter();
            }
            else
            {
                global.craft_leaves_filter_struct = @@array_get@@(global.craft_leaf_upgrade_vars_array, global.craft_leaves_filter_index);
                global.craft_leaves_filter_key = global.craft_leaves_filter_struct.key;
            }
        }
        if (gui_button_tl(arg0, arg1 + gui_col_y(8), __("Clear filter"), undefined, gui_col_x(3)))
        {
            reset_crafted_leaf_filter();
        }
    }
    else if (is_current_dialog_section(global.dialog_sections.crafting.transformation))
    {
        draw_heading(arg0, arg1 + gui_col_y(1), __("Transformation Slot"));
        draw_crafted_leaves(arg0, arg1 + gui_col_y(2), global.craft_leaves_transformation_slots, global.game_settings.craft_leaves_transformation_slots, undefined, 0, 64, true, function(arg0)
        {
            remove_item_from_array_by_id(global.craft_leaves_transformation_slots, arg0.data.id);
        }, undefined, "transformation");
        draw_heading(arg0 + gui_col_x(12), arg1 + gui_col_y(1), __("Inventory"));
        draw_crafted_leaves(arg0 + gui_col_x(12), arg1 + gui_col_y(2), global.craft_leaves_inventory, inventory_size, undefined, 0, 64, true, function(arg0)
        {
            clear_array(global.craft_leaves_transformation_slots);
            array_push(global.craft_leaves_transformation_slots, arg0);
            arg0.build_fusion_cost();
        }, undefined, "inv_small");
        draw_heading(arg0 + gui_col_x(12), arg1 + gui_col_y(5), __("Backpack"));
        draw_crafted_leaves(arg0 + gui_col_x(12), arg1 + gui_col_y(6), global.craft_leaves_backpack, backpack_size, undefined, 0, 40, true, function(arg0)
        {
            clear_array(global.craft_leaves_transformation_slots);
            array_push(global.craft_leaves_transformation_slots, arg0);
            arg0.build_fusion_cost();
        }, true, "bp_large");
        var can_move = has_selected_leaf;
        if (gui_button_tl(arg0 + gui_col_x(9.25), arg1 + gui_col_y(2.35), "<<", can_move))
        {
            clear_array(global.craft_leaves_transformation_slots);
            array_push(global.craft_leaves_transformation_slots, selected_leaf);
        }
        if (gui_button_tl(arg0 + gui_col_x(10), arg1 + gui_col_y(2.35), ">>", has_selected_leaf))
        {
            remove_item_from_array_by_id(global.craft_leaves_transformation_slots, selected_leaf.data.id);
        }
        var transform_leaf = undefined;
        if (array_length(global.craft_leaves_transformation_slots) > 0)
        {
            transform_leaf = @@array_get@@(global.craft_leaves_transformation_slots, 0);
        }
        if (is_struct(transform_leaf))
        {
            set_default_font(f_gui_small);
            var property_text = "-";
            if (transform_leaf.selected_prop_index > -1)
            {
                property_text = get_upgrade_name(transform_leaf.selected_prop);
            }
            draw_text(arg0, arg1 + gui_col_y(4), sprintf(__("Selected property: %s"), property_text));
            if (gui_button_tl(arg0 + gui_col_x(0), arg1 + gui_col_y(5.5), "<<", true, undefined, undefined, 
            {
                tooltip: transform_leaf.get_info()
            }) || mouse_wheel_up())
            {
                transform_leaf.move_selected_prop(-1);
            }
            if (gui_button_tl(arg0 + gui_col_x(1), arg1 + gui_col_y(5.5), ">>", true, undefined, undefined, 
            {
                tooltip: transform_leaf.get_info()
            }) || mouse_wheel_down())
            {
                transform_leaf.move_selected_prop(1);
            }
            if (gui_button_tl(arg0 + gui_col_x(3), arg1 + gui_col_y(5.5), "CLR", true, undefined, undefined, 
            {
                tooltip: __("Clear selection")
            }))
            {
                transform_leaf.move_selected_prop(-999999);
            }
            set_default_font(f_gui_small);
            if (is_energy_shrine_prophecy_fulfilled())
            {
                if (get_struct_length(o_game.data.stats.crafted_vars_transform_unlocked) == 0)
                {
                    draw_text(arg0, arg1 + gui_col_y(8), __("Unlock properties at The Energy Shrine"));
                }
                else
                {
                    var property_output_text = __("Random");
                    if (!is_undefined(global.craft_leaves_transform_output_var))
                    {
                        property_output_text = get_upgrade_name(global.craft_leaves_transform_output_var.key);
                    }
                    var transform_output_text = __s("%s: %s (%s/%s)", __("Target property"), property_output_text, global.craft_leaves_transform_output_index + 1, array_length(global.craft_leaf_upgrade_vars_array) + 1);
                    draw_text(arg0, arg1 + gui_col_y(8), transform_output_text);
                    if (gui_button_tl(arg0 + gui_col_x(0), arg1 + gui_col_y(9.5), "<<", true))
                    {
                        change_transform_output_key(-1);
                    }
                    if (gui_button_tl(arg0 + gui_col_x(1), arg1 + gui_col_y(9.5), ">>", true))
                    {
                        change_transform_output_key(1);
                    }
                    if (gui_button_tl(arg0 + gui_col_x(3), arg1 + gui_col_y(9.5), "CLR", true, undefined, undefined, 
                    {
                        tooltip: __("Clear selection")
                    }))
                    {
                        global.craft_leaves_transform_output_index = -1;
                        global.craft_leaves_transform_output_var = undefined;
                    }
                }
            }
            var can_transform = transform_leaf.can_transform();
            if (gui_button_tl(arg0, arg1 + gui_col_y(12), __("Reroll property"), can_transform, undefined, undefined, 
            {
                tooltip: transform_leaf.get_info()
            }))
            {
                transform_leaf.transform_reroll_prop();
                instance_destroy(o_tooltip);
            }
            if (can_transform && transform_leaf.selected_prop_index > -1 && transform_leaf.get_shards_count(transform_leaf.selected_prop) > 0)
            {
                set_default_font(f_gui_small);
                draw_text_ext(arg0, arg1 + gui_col_y(13.5), __("Warning: You will lose all shards from the selected property."), global.gui_text_line_height, gui_col_x(11));
            }
            draw_resources(arg0, arg1 + gui_col_y(15), transform_leaf.get_transformation_cost());
        }
    }
    else if (is_current_dialog_section(global.dialog_sections.crafting.fusion))
    {
        draw_heading(arg0, arg1 + gui_col_y(1), __("Fusion Slots"));
        draw_crafted_leaves(arg0, arg1 + gui_col_y(2), global.craft_leaves_fusion_slots, global.game_settings.craft_leaves_fusion_slots, undefined, 0, 64, true, function(arg0)
        {
            remove_item_from_array_by_id(global.craft_leaves_fusion_slots, arg0.data.id);
        }, undefined, "fusion");
        draw_heading(arg0 + gui_col_x(12), arg1 + gui_col_y(1), __("Inventory"));
        draw_crafted_leaves(arg0 + gui_col_x(12), arg1 + gui_col_y(2), global.craft_leaves_inventory, inventory_size, undefined, 0, 64, true, function(arg0)
        {
            var can_move_to_fusion_slot = array_length(global.craft_leaves_fusion_slots) < global.game_settings.craft_leaves_fusion_slots && !in_array(arg0, global.craft_leaves_fusion_slots);
            if (!can_move_to_fusion_slot)
            {
                exit;
            }
            array_push(global.craft_leaves_fusion_slots, arg0);
        }, undefined, "inv_small");
        draw_heading(arg0 + gui_col_x(12), arg1 + gui_col_y(5), __("Backpack"));
        draw_crafted_leaves(arg0 + gui_col_x(12), arg1 + gui_col_y(6), global.craft_leaves_backpack, backpack_size, undefined, 0, 40, true, function(arg0)
        {
            var can_move_to_fusion_slot = array_length(global.craft_leaves_fusion_slots) < global.game_settings.craft_leaves_fusion_slots && !in_array(arg0, global.craft_leaves_fusion_slots);
            if (!can_move_to_fusion_slot)
            {
                exit;
            }
            array_push(global.craft_leaves_fusion_slots, arg0);
        }, true, "bp_large");
        has_selected_leaf = is_struct(selected_leaf);
        var can_move_to_fusion_slot = has_selected_leaf && array_length(global.craft_leaves_fusion_slots) < global.game_settings.craft_leaves_fusion_slots && !in_array(selected_leaf, global.craft_leaves_fusion_slots);
        if (gui_button_tl(arg0 + gui_col_x(9.25), arg1 + gui_col_y(2.35), "<<", can_move_to_fusion_slot))
        {
            array_push(global.craft_leaves_fusion_slots, selected_leaf);
            exit;
        }
        if (gui_button_tl(arg0 + gui_col_x(10), arg1 + gui_col_y(2.35), ">>", has_selected_leaf))
        {
            remove_item_from_array_by_id(global.craft_leaves_fusion_slots, selected_leaf.data.id);
            exit;
        }
        var can_fuse = can_fuse_crafted_leaves();
        var can_fuse_hotkey = can_fuse && keyboard_check_pressed(vk_space);
        if (can_fuse_hotkey || gui_button_tl(arg0, arg1 + gui_col_y(6), __("Fuse"), can_fuse, gui_col_x(3)))
        {
            fuse_crafted_leaves();
            exit;
        }
        if (get_upgrade_count(global.shops.gems.craft_autofuse) > 0)
        {
            global.options.craft_autofuse.draw(arg0 + gui_col_x(5), arg1 + gui_col_y(6));
            global.options.craft_autofuse_type.draw(arg0 + gui_col_x(5), arg1 + gui_col_y(9));
        }
        set_default_font(f_gui_small);
        draw_text(arg0, arg1 + gui_col_y(9), global.craft_leaves_fusion_text);
        if (array_length(global.craft_leaves_fusion_slots) > 0)
        {
            var first_leaf = @@array_get@@(global.craft_leaves_fusion_slots, 0);
            draw_resources(arg0, arg1 + gui_col_y(14), first_leaf.get_fusion_cost());
        }
        if (global.debug)
        {
            if (gui_button_tl(arg0, arg1 + 350, "add dusk"))
            {
                craft_leaf_type(global.craft_leaf_types.dusk, 
                {
                    quality_base: 100,
                    quality: 100
                });
            }
        }
    }
    else if (is_current_dialog_section(global.dialog_sections.crafting.shadow_forge))
    {
        draw_heading(arg0, arg1 + gui_col_y(1), __("Inventory"));
        draw_crafted_leaves(arg0, arg1 + gui_col_y(2), global.craft_leaves_inventory, inventory_size, global.craft_leaves_backpack, backpack_size, undefined, undefined, undefined, undefined, "inv_small");
        draw_heading(arg0 + gui_col_x(12), arg1 + gui_col_y(1), __("Backpack"));
        draw_crafted_leaves(arg0 + gui_col_x(12), arg1 + gui_col_y(2), global.craft_leaves_backpack, backpack_size, global.craft_leaves_inventory, inventory_size, 40, undefined, undefined, true, "bp_large");
        selected_leaf = get_leaf_by_id(global.selected_craft_item_id);
        if (is_struct(selected_leaf))
        {
            var row_y = arg1 + gui_col_y(5.5);
            if (selected_leaf.data.tier < selected_leaf.get_max_tier())
            {
                row_y += draw_heading(arg0, row_y, __s("Current tier: %s/%s", selected_leaf.data.tier, selected_leaf.get_max_tier()));
                row_y += draw_description(arg0, row_y, [__s("Level: %s/%s", selected_leaf.data.level, selected_leaf.min_ascend_craft_level), __s("Ascend Level: %s/%s", selected_leaf.data.ascend_level - 1, selected_leaf.min_ascend_craft_ascend_level - 1)]);
                var can_increase_tier = selected_leaf.can_increase_tier();
                if (gui_button_tl(arg0, row_y, __("Increase tier"), can_increase_tier, gui_col_x(3.5), undefined, 
                {
                    result_mini: selected_leaf.get_tier_upgrade_cost()
                }))
                {
                    selected_leaf.upgrade_tier();
                }
            }
            else
            {
                row_y += draw_heading(arg0, row_y, __s("Max tier reached (%s)", selected_leaf.get_max_tier()));
            }
        }
        if (global.debug)
        {
            if (selected_leaf && gui_button_tl(arg0, arg1 + gui_col_y(15), "info"))
            {
                log(selected_leaf.data.props);
            }
            if (selected_leaf && gui_button_tl(arg0 + gui_col_x(2), arg1 + gui_col_y(15), "dmg type"))
            {
                if (is_undefined(struct_get_from_hash(selected_leaf.data.props, variable_get_hash("damage_types"))))
                {
                    log("no damage type found.");
                    exit;
                }
                selected_leaf.data.props.damage_types = 
                {
                    ancient: 1,
                    __collection_key: "ancient"
                };
                selected_leaf.set_prop_values();
            }
        }
    }
    else if (is_current_dialog_section(global.dialog_sections.crafting.sets))
    {
        draw_heading(arg0, arg1, __("Craft Sets"));
        var craft_sets_size = get_craft_sets_size();
        var dcl_y_add = global.is_mobile ? 1 : 0;
        var y_padding = 3.25;
        var crafted_leaves_y_start = global.is_mobile ? 6 : 5.65;
        set_default_font(f_gui_small, 0);
        draw_text(arg0, arg1 + gui_col_y(1), sprintf(__("Current craft set: #%s"), o_game.data.current_craft_set + 1));
        draw_crafted_leaves(arg0 + gui_col_x(10), arg1 + gui_col_y(2), global.craft_leaves_inventory, inventory_size, global.craft_leaves_backpack, backpack_size, undefined, false, undefined, undefined, "inv_small");
        if (gui_button_tl(arg0, arg1 + gui_col_y(2), __("Save current craft set"), true))
        {
            confirm_save_craft_set(o_game.data.current_craft_set);
        }
        draw_button_list(arg0, arg1 + gui_col_y(6), __("Load craft set #%s"), craft_sets_size, function(arg0)
        {
            load_craft_set(arg0);
        }, function(arg0)
        {
            return !is_undefined(variable_struct_get(o_game.data.craft_sets, arg0));
        }, y_padding, gui_col_x(4));
        draw_button_list(arg0 + gui_col_x(5), arg1 + gui_col_y(6), __("Save craft set #%s"), craft_sets_size, function(arg0)
        {
            if (!is_undefined(variable_struct_get(o_game.data.craft_sets, arg0)))
            {
                confirm_save_craft_set(arg0);
                exit;
            }
            save_craft_set(arg0);
        }, undefined, y_padding, gui_col_x(4));
        for (var i = 0; i < craft_sets_size; i++)
        {
            var craft_set_ids = variable_struct_get(o_game.data.craft_sets, i);
            if (is_undefined(craft_set_ids))
            {
                continue;
            }
            var craft_set = [];
            var __array = craft_set_ids.inventory;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                var leaf = get_leaf_by_id(mitem);
                if (!is_struct(leaf))
                {
                    continue;
                }
                array_push(craft_set, leaf);
            }
            draw_crafted_leaves(arg0 + gui_col_x(10), arg1 + gui_col_y(crafted_leaves_y_start + (i * (y_padding + dcl_y_add))), craft_set, inventory_size, global.craft_leaves_backpack, backpack_size, inventory_size, false, undefined, undefined, "inv_small");
        }
        set_default_font(f_gui_small);
        draw_text_list(arg0, arg1 + gui_col_y(5), o_game.data.craft_sets_names, craft_sets_size, y_padding, undefined, true);
        draw_button_list(arg0 + gui_col_x(19.5), arg1 + gui_col_y(6), __("Rename"), craft_sets_size, function(arg0)
        {
            global.selected_priority_slot = arg0 + 1;
            var set_name = is_undefined(variable_struct_get(o_game.data.craft_sets_names, global.selected_priority_slot)) ? "" : variable_struct_get(o_game.data.craft_sets_names, global.selected_priority_slot);
            input_dialog(__("Crafted Leaves Sets"), function(arg0)
            {
                variable_struct_set(o_game.data.craft_sets_names, global.selected_priority_slot, arg0);
            }, __s("Rename #%s", global.selected_priority_slot), 
            {
                parent_nav: o_shop.current_nav_key
            }, 
            {
                input: set_name,
                max_length: 32
            });
        }, undefined, y_padding, gui_col_x(2));
        return 100 + gui_col_y(6 + (craft_sets_size * y_padding));
    }
    else if (is_current_dialog_section(global.dialog_sections.crafting.presets))
    {
        var transform_leaf = undefined;
        if (array_length(global.craft_leaves_transformation_slots) > 0)
        {
            transform_leaf = @@array_get@@(global.craft_leaves_transformation_slots, 0);
        }
        var craft_sets_size = get_craft_sets_size();
        var selected_preset_slot = struct_get_from_hash(global.selected_inventory_item, variable_get_hash("craft_preset"));
        draw_heading(arg0, arg1 + gui_col_y(1), __("Preset Leaf"));
        draw_crafted_leaves(arg0, arg1 + gui_col_y(2), global.craft_leaves_transformation_slots, global.game_settings.craft_leaves_transformation_slots, undefined, 0, 64, true, function(arg0)
        {
            remove_item_from_array_by_id(global.craft_leaves_transformation_slots, arg0.data.id);
        }, undefined, "transformation");
        if (gui_button_tl(arg0 + gui_col_x(4), arg1 + gui_col_y(2.5), __("Save preset"), is_struct(transform_leaf) && is_numeric(selected_preset_slot), gui_col_x(3), undefined, 
        {
            tooltip: __("Save leaf properties to the current preset")
        }))
        {
            variable_struct_set(o_game.data.craft_presets, selected_preset_slot, struct_clone(transform_leaf.data.props));
        }
        draw_heading(arg0 + gui_col_x(14), arg1 + gui_col_y(1), __("Inventory"));
        draw_crafted_leaves(arg0 + gui_col_x(14), arg1 + gui_col_y(2), global.craft_leaves_inventory, inventory_size, undefined, 0, 64, true, function(arg0)
        {
            clear_array(global.craft_leaves_transformation_slots);
            array_push(global.craft_leaves_transformation_slots, arg0);
            arg0.build_fusion_cost();
        }, undefined, "inv_small");
        draw_heading(arg0 + gui_col_x(14), arg1 + gui_col_y(5), __("Backpack"));
        draw_crafted_leaves(arg0 + gui_col_x(14), arg1 + gui_col_y(6), global.craft_leaves_backpack, backpack_size, undefined, 0, 40, true, function(arg0)
        {
            clear_array(global.craft_leaves_transformation_slots);
            array_push(global.craft_leaves_transformation_slots, arg0);
            arg0.build_fusion_cost();
        }, true, "bp_large");
        var can_move = has_selected_leaf;
        if (gui_button_tl(arg0 + gui_col_x(11.25), arg1 + gui_col_y(2.35), "<<", can_move))
        {
            clear_array(global.craft_leaves_transformation_slots);
            array_push(global.craft_leaves_transformation_slots, selected_leaf);
        }
        if (gui_button_tl(arg0 + gui_col_x(12), arg1 + gui_col_y(2.35), ">>", has_selected_leaf))
        {
            remove_item_from_array_by_id(global.craft_leaves_transformation_slots, selected_leaf.data.id);
        }
        var row_y = draw_button_list(arg0, arg1 + gui_col_y(5), __("Preset #%s"), craft_sets_size, function(arg0)
        {
            global.selected_inventory_item.craft_preset = arg0;
        }, undefined, undefined, gui_col_x(3), selected_preset_slot);
        set_default_font(f_gui_small);
        draw_text_list(arg0, arg1 + gui_col_y(4.35), o_game.data.craft_presets_names, craft_sets_size, undefined, undefined, true);
        var bx = arg0 + gui_col_x(4);
        var by = arg1 + gui_col_y(5);
        if (!is_undefined(selected_preset_slot))
        {
            var preset = variable_struct_get(o_game.data.craft_presets, selected_preset_slot);
            by += draw_heading(bx, by, __s("Preset %s", concatstr("#", selected_preset_slot + 1)));
            var resources_mini = (is_struct(transform_leaf) && is_struct(preset)) ? transform_leaf.get_preset_transformation_cost(preset) : undefined;
            if (gui_button_tl(bx, by + gui_col_y(0), __("Apply"), is_struct(transform_leaf) && is_struct(preset), gui_col_x(3), undefined, 
            {
                resources_mini: resources_mini,
                tooltip: __("Apply preset to the selected leaf")
            }))
            {
                transform_leaf.data.shards = {};
                transform_leaf.data.shards_added = 0;
                transform_leaf.set_props(preset);
                transform_leaf.selected_prop = undefined;
                transform_leaf.selected_prop_index = -1;
                transform_leaf.refresh_info_text();
                global.craft_leaves_transform_output_var = undefined;
            }
            if (gui_button_tl(bx, by + gui_col_y(3), __("Rename"), undefined, gui_col_x(3)))
            {
                global.selected_priority_slot = selected_preset_slot + 1;
                var set_name = gdsv(o_game.data.craft_presets_names, global.selected_priority_slot, "");
                input_dialog(__("Preset Leaf"), function(arg0)
                {
                    variable_struct_set(o_game.data.craft_presets_names, global.selected_priority_slot, arg0);
                }, __s("Rename #%s", global.selected_priority_slot), 
                {
                    parent_nav: o_shop.current_nav_key
                }, 
                {
                    input: set_name,
                    max_length: 20
                });
            }
            if (is_struct(preset))
            {
                draw_description(bx + gui_col_x(4), by, __("Properties") + ":");
                draw_description(bx + gui_col_x(4), by + gui_col_y(1), format_upgrade_text_names_only(preset, "\n") + "\n" + "\n" + __s("Warning: applying a preset will remove all shards."), gui_col_x(5));
            }
        }
        arg1 += (max(row_y, by) + gui_col_y(2));
        return arg1 - y_start;
    }
    else if (is_current_dialog_section(global.dialog_sections.crafting.info))
    {
        var text = [[__("Property"), __("Min craft level"), __("Leaf type"), __("Transformation")], ["", "", "", ""]];
        var __array = global.craft_leaf_upgrade_vars_array;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            var text_array_loop;
            if (is_undefined(variable_struct_get(o_game.data.stats.crafted_vars_seen, mitem.key)))
            {
                text_array_loop = ["?", ""];
            }
            else
            {
                var unlocked_text = is_undefined(variable_struct_get(o_game.data.stats.crafted_vars_transform_unlocked, mitem.key)) ? __("Locked") : __("Available");
                text_array_loop = [get_upgrade_name(mitem.key), mitem.min_rarity, sprintf("%s+", variable_struct_get(global.craft_level_names, mitem.min_rarity)), unlocked_text];
            }
            array_push(text, text_array_loop);
        }
        set_default_font(f_gui_small);
        var table_height = draw_text_table(arg0, arg1, text, global.gui_text_line_height + 2);
        y_height = max(y_height, table_height);
        return y_height;
    }
}

function gui_item_crafting_add_draw()
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
    if (is_current_dialog_section(global.dialog_sections.crafting.craft))
    {
        draw_option(global.options.autocraft, add_button_base_x_tl + gui_col_y(0.75), add_button_base_y_tl, undefined, 
        {
            name_width: gui_col_x(2)
        }, 5);
        var button_text_suffix = has_timeout("auto_salvage_timeout") ? format_remaining_time(get_timeout("auto_salvage_timeout"), false, true) : undefined;
        draw_option(global.options.auto_salvage_crafted_leaf, add_button_base_x_tl + gui_col_x(5), add_button_base_y, undefined, 
        {
            btn_width: gui_col_x(2.5),
            name_width: gui_col_x(2),
            btn_options: 
            {
                button_text_suffix: button_text_suffix
            }
        });
        draw_option(global.options.auto_salvage_crafted_leaf_type, add_text_base_x + gui_col_x(11), add_button_base_y - 3, undefined, 
        {
            btn_width: gui_col_x(2.5),
            name_width: gui_col_x(3),
            btn_options: 
            {
                button_text_suffix: button_text_suffix
            }
        });
        if (gui_button_tl(add_text_base_x + gui_col_x(20.5), add_button_base_y, __("Probabilities"), true, gui_col_x(3)))
        {
            var craft_count = 10000;
            var crafted = craft_benchmark(craft_count);
            var text = [];
            var __array = global.craft_leaf_types_rarity_array;
            var __prop_len = array_length(__array);
            var __i = __prop_len - 1;
            while (__i >= 0)
            {
                var mitem = __array[__i];
                var __ireal = __prop_len - 1 - __i;
                if (is_undefined(variable_struct_get(crafted, mitem.key)))
                {
                }
                else
                {
                    var crafted_count = variable_struct_get(crafted, mitem.key);
                    if (crafted_count == 0)
                    {
                    }
                    else
                    {
                        var pct = crafted_count / craft_count;
                        var type_name = variable_struct_get(global.craft_leaf_types, mitem.key).name;
                        array_push(text, sprintf("%s: %sx (%s%)", type_name, crafted_count, number_format(pct * 100, 2)));
                    }
                }
                __i--;
            }
            text_dialog(implode("\n", text), 
            {
                title: __("Crafting probabilities"),
                subtitle: sprintf(__("Craft stats for %s crafted leaves"), craft_count)
            }, 
            {
                parent_nav: "crafting"
            });
        }
    }
}

function draw_crafted_leaves_inventory_and_backpack(arg0, arg1, arg2 = undefined)
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
    arg1 += gui_col_y(0.5);
    var y_start = arg1;
    var inventory_size = get_craft_inventory_size();
    var backpack_size = get_craft_backpack_size();
    arg1 += draw_heading(arg0, arg1, __("Inventory"), undefined, undefined, undefined, undefined, false);
    draw_crafted_leaves(arg0, arg1, global.craft_leaves_inventory, inventory_size, global.craft_leaves_backpack, backpack_size, undefined, undefined, arg2, undefined, "inv_small");
    arg1 += (global.ui_gaps.sm * 3);
    arg1 += draw_heading(arg0, arg1, __("Backpack"), undefined, undefined, undefined, undefined, false);
    var items_per_page = global.is_mobile ? 32 : 40;
    draw_crafted_leaves(arg0, arg1, global.craft_leaves_backpack, backpack_size, global.craft_leaves_inventory, inventory_size, items_per_page, undefined, arg2, true, "bp_small");
    draw_crafted_leaves_swap(arg0 + gui_col_x(4.5), y_start - gui_col_y(0.5));
    if (gui_button_sprite_tl(arg0 + gui_col_x(5.7), y_start - gui_col_y(0.5), spr_icon_sort, undefined, undefined, 
    {
        tooltip: __("Sort")
    }))
    {
        sort_array_by(global.craft_leaves_backpack, ["rarity_index", "get_ascend_level", "get_level"]);
        sort_array_by(global.craft_leaves_inventory, ["rarity_index", "get_ascend_level", "get_level"]);
    }
}

function draw_crafted_leaves_filter_selection(arg0, arg1, arg2 = undefined)
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
    arg1 += draw_heading(arg0, arg1, __("Choose leaf property"), undefined, undefined, undefined, undefined, false);
    var filter_check_func = "is_obfuscated";
    if (is_struct(arg2) && is_struct(arg2.props))
    {
        filter_check_func = get_default_struct_value(arg2.props, "filter_check_func", "is_obfuscated");
    }
    var b_col_x = 0;
    var b_col_y = 0;
    var b_padding_x = gui_col_x(4.25);
    var b_padding_y = gui_col_y(1.5);
    var bx = arg0;
    var by = arg1;
    if (gui_button_tl(bx, by, "-", undefined, gui_col_x(4)))
    {
        click_action();
    }
    b_col_x++;
    var __array = global.craft_leaf_upgrade_vars_array;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        bx = arg0 + (b_padding_x * b_col_x);
        by = arg1 + (b_padding_y * b_col_y);
        if (bx >= ((arg0 + global.gui_settings.content_width) - gui_col_x(3)))
        {
            b_col_x = 0;
            b_col_y++;
            bx = arg0 + (b_padding_x * b_col_x);
            by = arg1 + (b_padding_y * b_col_y);
        }
        var can_select = true;
        var upgrade = variable_struct_get(global.texts_upgrade_attributes, mitem.key);
        var upgrade_text = upgrade.text;
        if (is_struct(upgrade_text))
        {
            upgrade_text = upgrade.text_neutral;
        }
        var filter_func = is_callable(variable_struct_get(mitem, filter_check_func)) ? variable_struct_get(mitem, filter_check_func) : mitem.is_obfuscated;
        var is_obfuscated = filter_func();
        if (is_obfuscated)
        {
            can_select = false;
            upgrade_text = "?";
        }
        if (gui_button_tl(bx, by, upgrade_text, can_select, gui_col_x(4)))
        {
            if (!is_undefined(click_action))
            {
                click_action(upgrade);
            }
        }
        b_col_x++;
    }
}

function select_crafted_leaves_filter(arg0)
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
    if (is_struct(arg0))
    {
        global.craft_leaves_filter_index = 1;
        global.craft_leaves_filter_struct = variable_struct_get(global.craft_leaf_upgrade_vars, arg0.key);
        global.craft_leaves_filter_key = arg0.key;
    }
    else
    {
        reset_crafted_leaf_filter();
    }
    open_nav_delay("crafting", global.dialog_sections.crafting.overview);
}

function select_fusion_leaf(arg0)
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
    var can_move_to_fusion_slot = array_length(global.craft_leaves_fusion_slots) < global.game_settings.craft_leaves_fusion_slots && !in_array(arg0, global.craft_leaves_fusion_slots);
    if (!can_move_to_fusion_slot)
    {
        exit;
    }
    array_push(global.craft_leaves_fusion_slots, arg0);
}

function select_transform_leaf(arg0)
{
    clear_array(global.craft_leaves_transformation_slots);
    array_push(global.craft_leaves_transformation_slots, arg0);
    arg0.build_fusion_cost();
}

function select_transform_leaf_property(arg0)
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
    if (is_struct(arg0))
    {
        var item_key = arg0.key;
        global.craft_leaves_transform_output_var = variable_struct_get(global.craft_leaf_upgrade_vars, item_key);
        if (is_undefined(global.craft_leaves_transform_output_var))
        {
            item_key = sprintf("%s_craft", arg0.key);
            global.craft_leaves_transform_output_var = variable_struct_get(global.craft_leaf_upgrade_vars, item_key);
        }
        var __array = global.craft_leaf_upgrade_vars_array;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (mitem.key == item_key)
            {
                global.craft_leaves_transform_output_index = __i;
                break;
            }
        }
    }
    else
    {
        global.craft_leaves_transform_output_index = -1;
        global.craft_leaves_transform_output_var = undefined;
    }
    if (array_length(global.craft_leaves_transformation_slots) > 0)
    {
        var transform_leaf = global.craft_leaves_transformation_slots[0];
        transform_leaf.build_fusion_cost();
    }
    open_nav_delay("crafting", global.dialog_sections.crafting.transformation);
}
