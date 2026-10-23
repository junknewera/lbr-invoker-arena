function season_pass_nature_gui_before_selection(arg0, arg1)
{
    var item_type = global.resource_types.plant;
    var field = get_plant_field(global.selected_plant_field);
    var max_fields = global.season_pass.nature.get_max_fields();
    if (gui_button_sprite(arg0 + gui_col_x(16), arg1 + gui_col_y(0.6), spr_gui_arrow_left))
    {
        var prev_field = wrap(global.selected_plant_field, -1, 0, max_fields - 1);
        global.selected_plant_field = prev_field;
    }
    if (gui_button_sprite(arg0 + gui_col_x(17), arg1 + gui_col_y(0.6), spr_gui_arrow_right))
    {
        var next_field = wrap(global.selected_plant_field, 1, 0, max_fields - 1);
        global.selected_plant_field = next_field;
    }
    if (is_unlocked_butterflies())
    {
        if (gui_button_sprite(arg0 + gui_col_x(20), arg1 + gui_col_y(0.6), spr_butterfly_meadowdance, undefined, undefined, 
        {
            tooltip: __("Switch field")
        }))
        {
            global.selected_plant = undefined;
            change_area(global.areas.butterfly_field);
            gui_dialog_close();
            delay("nature_switch_fields", 10, function()
            {
                actions_dialog(o_shop.shop_items.event_nature_butterfly, o_shop.titles.event_nature_butterfly, 6, 
                {
                    dialog_id: "nature_plants",
                    can_toggle: true
                });
            });
        }
    }
    var lock_sprite = field.prop.locked ? spr_icon_lock : spr_icon_lock_open;
    if (gui_button_sprite(arg0 + gui_col_x(22.5), arg1 + gui_col_y(0.6), lock_sprite, undefined, undefined, 
    {
        tooltip: __("Locked fields can't be harvested/collected.")
    }))
    {
        field.prop.locked = !field.prop.locked;
    }
    var current_bonus = "-";
    if (field.has_plant)
    {
        if (field.prop.progress >= 1)
        {
            current_bonus = format_upgrade_text(variable_struct_get(field.item.upgrade_attributes_cache, field.index));
            if (variable_struct_get(field.item.synergy_bonus_cache, field.index) != 0)
            {
                current_bonus += sprintf(" (%s)", number_format_percent(variable_struct_get(field.item.synergy_bonus_cache, field.index)));
            }
        }
    }
    var field_text = concatstr(__s("Field %s", "#" + string(global.selected_plant_field + 1)), " | ", field.has_plant ? field.item.name : __("Empty"), " | ", __s("Progress: %s", number_format_percent(calc_percent(field.prop.progress, 1) / 100, 2)), "\n", __s("Current bonus: %s", current_bonus));
    arg1 += draw_description(arg0, arg1 + gui_col_y(0.25), field_text);
    arg1 += gui_col_y(0.75);
    var button_x = arg0;
    var button_x_padding = gui_col_x(4);
    var can_harvest = global.season_pass.nature.can_harvest(field, item_type);
    var harvest_text_below = "";
    if (field.has_plant)
    {
        var xp = global.season_pass.nature.get_plant_xp(field, undefined, undefined, item_type);
        harvest_text_below = sprintf("XP: %s", number_format(xp, 2));
    }
    var res_total = {};
    var xp_total = 0;
    var __struct = o_game.data.nature_season.fields;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        var loop_field = get_plant_field(__i);
        if (global.season_pass.nature.can_harvest(loop_field, item_type))
        {
            xp_total += global.season_pass.nature.get_plant_xp(loop_field, undefined, undefined, item_type);
            add_struct_to_struct(res_total, global.season_pass.nature.get_harvest_resources(loop_field, item_type));
        }
    }
    var can_harvest_all = xp_total > 0;
    var harvest_text_all = sprintf("XP: %s", number_format(xp_total, 2));
    if (gui_button_tl(button_x, arg1, __("Harvest"), can_harvest, gui_col_x(3), undefined, 
    {
        text_below: harvest_text_below,
        resources_mini: global.season_pass.nature.get_harvest_resources(field, item_type)
    }))
    {
        global.season_pass.nature.harvest(field, false, item_type);
    }
    button_x += button_x_padding;
    if (gui_button_tl(button_x, arg1, __("Harvest all"), can_harvest_all, gui_col_x(3), undefined, 
    {
        text_below: harvest_text_all,
        resources_mini: res_total
    }))
    {
        var xp_harvested = 0;
        var seed_count = 0;
        var bfly_count = 0;
        var res_count = {};
        __struct = o_game.data.nature_season.fields;
        __prop_names = struct_get_names(__struct);
        __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var res = global.season_pass.nature.harvest(get_plant_field(__i), true, item_type);
            if (is_struct(res))
            {
                xp_harvested += res.xp;
                seed_count += res.seed_count;
                bfly_count += res.bfly_count;
                add_struct_to_struct(res_count, res.resources);
            }
        }
        global.season_pass.nature.check_upgrade_attributes();
        var result_text = sprintf("%s XP.", xp_harvested);
        if (seed_count > 0)
        {
            result_text += ("\n" + __s("%s %s harvested.", seed_count, pluralize(seed_count, __("Seed"), __("Seeds"))));
        }
        if (bfly_count > 0)
        {
            result_text += ("\n" + __s("%s %s collected.", bfly_count, pluralize(bfly_count, __("Butterfly"), __("Butterflies"))));
        }
        if (get_struct_length(res_count) > 0)
        {
            result_text += ("\n" + format_resources_text(res_count));
        }
        notify(result_text);
    }
    button_x += button_x_padding;
    var water_text = number_format_percent(field.prop.water, 1);
    water_text += ("\n" + sprintf("(-%s/s)", number_format_percent(global.season_pass.nature.get_water_decrease_value(field.key), 2)));
    if (gui_button_tl(button_x, arg1, __s("Water"), field.prop.water < 1, gui_col_x(3), true, 
    {
        text_below: water_text,
        tooltip: __s("Plants grow faster when watered.")
    }))
    {
        var water_value = global.season_pass.nature.get_water_increase_value();
        field.prop.water += water_value;
        field.prop.water = clamp(field.prop.water, 0, 1);
        var splash_effectivity = get_upgrade_attribute_value(global.upgrade_attributes.nature_water_all_fields_effectivity);
        if (splash_effectivity > 0)
        {
            var splash_value = water_value * splash_effectivity;
            __struct = o_game.data.nature_season.field_props;
            __prop_names = struct_get_names(__struct);
            __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                if (mitem.position == field.prop.position)
                {
                    continue;
                }
                mitem.water += splash_value;
                mitem.water = clamp(mitem.water, 0, 1);
            }
        }
    }
    button_x += button_x_padding;
    var quality_level = field.prop.quality;
    var enhance_cost = global.season_pass.nature.get_enhance_cost(field.prop);
    var can_enhance = global.season_pass.nature.can_enhance_field(field);
    var enhance_text_below = __s("Quality: %s", number_format_percent(field.prop.quality, 1));
    if (field.prop.quality_timeout > o_game.data.stats.time_elapsed)
    {
        enhance_text_below += (" | " + sprintf("(%s)", format_time(secr(field.prop.quality_timeout - o_game.data.stats.time_elapsed), false, true)));
    }
    if (gui_button_tl(button_x, arg1, __s("Enhance"), can_enhance, gui_col_x(3), undefined, 
    {
        text_below: enhance_text_below,
        resources_mini: enhance_cost,
        tooltip: __s("Enhanced fields increase harvest XP.")
    }))
    {
        global.season_pass.nature.enhance_field(field);
    }
    button_x += button_x_padding;
    var time_sphere_cost = global.season_pass.nature.get_time_skip_resources(field, item_type);
    var time_sphere_value = global.season_pass.nature.get_time_skip_value(field, item_type);
    var can_use_time_sphere = global.season_pass.nature.can_use_time_skip(field, item_type);
    var sphere_text_below = format_time(time_sphere_value, undefined, true);
    if (gui_button_tl(button_x, arg1, __s("Use Sphere"), can_use_time_sphere, gui_col_x(3), undefined, 
    {
        text_below: sphere_text_below,
        resources_mini: time_sphere_cost,
        tooltip: __s("Forwards the time for this field.")
    }))
    {
        global.season_pass.nature.forward_time(field, item_type);
    }
    button_x += button_x_padding;
    if (gui_button_sprite(arg0 + gui_col_x(21.3), arg1 + gui_col_y(0.55), spr_icon_cancel, field.has_plant, undefined, 
    {
        tooltip: __("Remove item from this field")
    }))
    {
        confirm_dialog(__("Do you really want to remove this item from the current field?"), function()
        {
            global.season_pass.nature.remove_plant(global.selected_plant_field);
        });
    }
    button_x += button_x_padding;
    var y_height = gui_col_y(4.5);
    if (global.is_mobile)
    {
        y_height += gui_col_y(1.8);
    }
    return y_height;
}

function season_pass_nature_gui_draw_item_actions(arg0, arg1, arg2, arg3, arg4, arg5)
{
    var item_type = global.resource_types.plant;
    var y_start = arg1;
    var field = get_plant_field(global.selected_plant_field);
    var selected_field_item_key = variable_struct_get(o_game.data.nature_season.fields, global.selected_plant_field);
    var selected_field_item = is_string(selected_field_item_key) ? variable_struct_get(global.resources, selected_field_item_key) : undefined;
    var grow_duration = format_time(global.season_pass.nature.get_grow_duration(arg2), false, true);
    var lock_sprite = arg2.data.locked ? spr_icon_lock : spr_icon_lock_open;
    if (gui_button_sprite(arg0 + gui_col_x(9.5), arg1 - gui_col_y(4.5), lock_sprite, undefined, undefined, 
    {
        tooltip: __("Locked items can't be salvaged.")
    }))
    {
        arg2.data.locked = !arg2.data.locked;
    }
    var can_plant = global.season_pass.nature.can_plant(arg2, field);
    if (gui_button_tl(arg0, arg1, __s("Plant"), can_plant, gui_col_x(3)))
    {
        global.season_pass.nature.plant(arg2, field);
    }
    var can_plant_all = arg2.data.count > 0;
    if (gui_button_tl(arg0 + gui_col_x(4), arg1, __("Plant all"), can_plant_all, gui_col_x(3), undefined, 
    {
        tooltip: __("Plant this item to all available fields")
    }))
    {
        var max_fields = global.season_pass.nature.get_max_fields();
        for (var i = 0; i < max_fields; i++)
        {
            field = get_plant_field(i);
            if (!global.season_pass.nature.can_plant(arg2, field))
            {
                continue;
            }
            global.season_pass.nature.plant(arg2, field);
        }
    }
    var key_modifier = get_key_modifier_item(arg2, undefined, true, undefined, undefined, true);
    var can_salvage = arg2.data.count > 0 && !arg2.data.locked;
    var salvage_resources = global.season_pass.nature.get_salvage_resources(arg2, key_modifier);
    if (gui_button_sprite(arg0 + gui_col_x(9.5), arg1 + gui_col_y(0.6), spr_icon_salvage, can_salvage, undefined, 
    {
        tooltip: __("Salvage"),
        resources_mini: salvage_resources,
        text_below: sprintf("%sx", key_modifier)
    }))
    {
        global.season_pass.nature.salvage(arg2, key_modifier);
    }
    arg1 += gui_col_y(2);
    var desc_array = [__s("Harvest XP: %s (%s)", number_format(arg2.xp_value, 2), number_format(global.season_pass.nature.get_plant_xp(field, 1, arg2.xp_value, item_type)), 2), __s("Grow duration: %s", grow_duration), __s("Spawn chance: %s", number_format_percent(global.season_pass.nature.get_item_spawn_chance(arg2))), "", __s("Bonus: %s", format_upgrade_text(arg2.upgrade_attributes, 1))];
    if (get_upgrade_count(global.shops.event_nature.nature_plant_synergy) > 0)
    {
        var syn_text = [];
        var __array = arg2.synergy;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            var syn_plant = variable_struct_get(global.plants_index_map, mitem.plant_index);
            var name = syn_plant.name;
            if (syn_plant.data.collected_total == 0)
            {
                name = "?";
            }
            array_push(syn_text, sprintf("%s: +%s", name, number_format_percent(mitem.synergy_bonus)));
        }
        array_push(desc_array, "");
        array_push(desc_array, __s("Synergy bonuses: %s", "\n" + implode("\n", syn_text)));
    }
    var desc_item = implode("\n", desc_array);
    arg1 += draw_description(arg0, arg1, desc_item, arg3);
    var desc = get_default_struct_value(arg2, "description", "");
    if (!is_empty(desc))
    {
        arg1 += draw_description(arg0, arg1, desc, arg3);
    }
    var padding_end = global.is_mobile ? 4.5 : 3;
    return (arg1 - y_start) + gui_col_y(padding_end);
}

function season_pass_nature_gui_before_selection_butterflies(arg0, arg1)
{
    var item_type = global.resource_types.butterfly;
    var field = get_plant_field(global.selected_plant_field);
    var max_fields = global.season_pass.nature.get_max_fields();
    if (gui_button_sprite(arg0 + gui_col_x(16), arg1 + gui_col_y(0.6), spr_gui_arrow_left))
    {
        var prev_field = wrap(global.selected_plant_field, -1, 0, max_fields - 1);
        global.selected_plant_field = prev_field;
    }
    if (gui_button_sprite(arg0 + gui_col_x(17), arg1 + gui_col_y(0.6), spr_gui_arrow_right))
    {
        var next_field = wrap(global.selected_plant_field, 1, 0, max_fields - 1);
        global.selected_plant_field = next_field;
    }
    if (is_unlocked_butterflies())
    {
        if (gui_button_sprite(arg0 + gui_col_x(20), arg1 + gui_col_y(0.6), spr_plant_primula, undefined, undefined, 
        {
            tooltip: __("Switch field")
        }))
        {
            global.selected_plant = undefined;
            change_area(global.areas.farm_field);
            gui_dialog_close();
            delay("nature_switch_fields", 10, function()
            {
                actions_dialog(o_shop.shop_items.event_nature_plants, o_shop.titles.event_nature_plants, 6, 
                {
                    dialog_id: "nature_plants",
                    can_toggle: true
                });
            });
        }
    }
    var lock_sprite = field.prop.bfly_locked ? spr_icon_lock : spr_icon_lock_open;
    if (gui_button_sprite(arg0 + gui_col_x(22.5), arg1 + gui_col_y(0.6), lock_sprite, undefined, undefined, 
    {
        tooltip: __("Locked fields can't be harvested/collected.")
    }))
    {
        field.prop.bfly_locked = !field.prop.bfly_locked;
    }
    var current_bonus = "-";
    if (field.has_butterfly && field.prop.bfly_progress >= 1)
    {
        current_bonus = format_upgrade_text(variable_struct_get(field.butterfly.upgrade_attributes_cache, field.index));
        if (variable_struct_get(field.butterfly.synergy_bonus_cache, field.index) != 0)
        {
            current_bonus += sprintf(" (%s)", number_format_percent(variable_struct_get(field.butterfly.synergy_bonus_cache, field.index)));
        }
    }
    var field_text = concatstr(__s("Field %s", "#" + string(global.selected_plant_field + 1)), " | ", field.has_butterfly ? field.butterfly.name : __("Empty"), " | ", __s("Progress: %s", number_format_percent(calc_percent(field.prop.bfly_progress, 1) / 100, 2)), "\n", __s("Current bonus: %s", current_bonus));
    arg1 += draw_description(arg0, arg1 + gui_col_y(0.25), field_text);
    arg1 += gui_col_y(0.5);
    var button_x = arg0;
    var button_x_padding = gui_col_x(4);
    var can_harvest = global.season_pass.nature.can_harvest(field, item_type);
    var harvest_text_below = "";
    if (field.has_butterfly)
    {
        var xp = global.season_pass.nature.get_plant_xp(field, undefined, undefined, item_type);
        harvest_text_below = sprintf("XP: %s", number_format(xp, 2));
    }
    var res_total = {};
    var xp_total = 0;
    var __struct = o_game.data.nature_season.fields;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        var loop_field = get_plant_field(__i);
        if (global.season_pass.nature.can_harvest(loop_field, item_type))
        {
            xp_total += global.season_pass.nature.get_plant_xp(field, undefined, undefined, item_type);
        }
        add_struct_to_struct(res_total, global.season_pass.nature.get_harvest_resources(loop_field, item_type));
    }
    var can_harvest_all = xp_total > 0;
    var harvest_text_all = sprintf("XP: %s", number_format(xp_total, 2));
    if (gui_button_tl(button_x, arg1, __("Collect"), can_harvest, gui_col_x(3), undefined, 
    {
        text_below: harvest_text_below,
        resources_mini: global.season_pass.nature.get_harvest_resources(field, item_type)
    }))
    {
        global.season_pass.nature.harvest(field, false, item_type);
    }
    button_x += button_x_padding;
    if (gui_button_tl(button_x, arg1, __("Collect all"), can_harvest_all, gui_col_x(3), undefined, 
    {
        text_below: harvest_text_all,
        resources_mini: res_total
    }))
    {
        var xp_harvested = 0;
        var seed_count = 0;
        var bfly_count = 0;
        var res_count = {};
        __struct = o_game.data.nature_season.fields;
        __prop_names = struct_get_names(__struct);
        __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var res = global.season_pass.nature.harvest(get_plant_field(__i), true, item_type);
            if (is_struct(res))
            {
                xp_harvested += res.xp;
                seed_count += res.seed_count;
                bfly_count += res.bfly_count;
                add_struct_to_struct(res_count, res.resources);
            }
        }
        var result_text = sprintf("%s XP.", xp_harvested);
        if (seed_count > 0)
        {
            result_text += ("\n" + __s("%s seeds harvested.", seed_count));
        }
        if (bfly_count > 0)
        {
            result_text += ("\n" + __s("%s %s collected.", bfly_count, pluralize(bfly_count, __("Butterfly"), __("Butterflies"))));
        }
        if (get_struct_length(res_count) > 0)
        {
            result_text += ("\n" + format_resources_text(res_count));
        }
        notify(result_text);
    }
    button_x += button_x_padding;
    var time_sphere_cost = global.season_pass.nature.get_time_skip_resources(field, item_type);
    var time_sphere_value = global.season_pass.nature.get_time_skip_value(field, item_type);
    var can_use_time_sphere = global.season_pass.nature.can_use_time_skip(field, item_type);
    var sphere_text_below = format_time(time_sphere_value, undefined, true);
    if (gui_button_tl(button_x, arg1, __s("Use Sphere"), can_use_time_sphere, gui_col_x(3), undefined, 
    {
        text_below: sphere_text_below,
        resources_mini: time_sphere_cost,
        tooltip: __s("Forwards the time for this field.")
    }))
    {
        global.season_pass.nature.forward_time(field, item_type);
    }
    button_x += button_x_padding;
    if (gui_button_sprite(arg0 + gui_col_x(21.3), arg1 + gui_col_y(0.55), spr_icon_cancel, field.has_butterfly, undefined, 
    {
        tooltip: __("Remove item from this field")
    }))
    {
        confirm_dialog(__("Do you really want to remove this item from the current field?"), function()
        {
            global.season_pass.nature.remove_plant(global.selected_plant_field, undefined, global.resource_types.butterfly);
        });
    }
    button_x += button_x_padding;
    var y_height = gui_col_y(4.5);
    if (global.is_mobile)
    {
        y_height += gui_col_y(1.8);
    }
    return y_height;
}

function season_pass_nature_gui_draw_item_actions_butterflies(arg0, arg1, arg2, arg3, arg4, arg5)
{
    var item_type = global.resource_types.butterfly;
    var y_start = arg1;
    var field = get_plant_field(global.selected_plant_field);
    var selected_field_item_key = variable_struct_get(o_game.data.nature_season.fields_butterflies, global.selected_plant_field);
    var selected_field_item = is_string(selected_field_item_key) ? variable_struct_get(global.resources, selected_field_item_key) : undefined;
    var grow_duration = format_time(global.season_pass.nature.get_grow_duration(arg2), false, true);
    var lock_sprite = arg2.data.locked ? spr_icon_lock : spr_icon_lock_open;
    if (gui_button_sprite(arg0 + gui_col_x(9.5), arg1 - gui_col_y(4.5), lock_sprite, undefined, undefined, 
    {
        tooltip: __("Locked items can't be salvaged.")
    }))
    {
        arg2.data.locked = !arg2.data.locked;
    }
    var can_plant = global.season_pass.nature.can_plant(arg2, field);
    if (gui_button_tl(arg0, arg1, __s("Breed"), can_plant, gui_col_x(3)))
    {
        global.season_pass.nature.plant(arg2, field);
    }
    var can_plant_all = arg2.data.count > 0;
    if (gui_button_tl(arg0 + gui_col_x(4), arg1, __("Breed all"), can_plant_all, gui_col_x(3), undefined, 
    {
        tooltip: __("Puts this item to all available fields")
    }))
    {
        var max_fields = global.season_pass.nature.get_max_fields();
        for (var i = 0; i < max_fields; i++)
        {
            field = get_plant_field(i);
            if (!global.season_pass.nature.can_plant(arg2, field))
            {
                continue;
            }
            global.season_pass.nature.plant(arg2, field);
        }
    }
    var key_modifier = get_key_modifier_item(arg2, undefined, true, undefined, undefined, true);
    var can_salvage = arg2.data.count > 0 && !arg2.data.locked;
    var salvage_resources = global.season_pass.nature.get_salvage_resources(arg2, key_modifier);
    if (gui_button_sprite(arg0 + gui_col_x(9.5), arg1 + gui_col_y(0.6), spr_icon_salvage, can_salvage, undefined, 
    {
        tooltip: __("Salvage"),
        resources_mini: salvage_resources,
        text_below: sprintf("%sx", key_modifier)
    }))
    {
        global.season_pass.nature.salvage(arg2, key_modifier);
    }
    arg1 += gui_col_y(2);
    var desc_array = [__s("Harvest XP: %s (%s)", number_format(arg2.xp_value, 2), number_format(global.season_pass.nature.get_plant_xp(field, 1, arg2.xp_value, item_type)), 2), __s("XP multiplier: %s", number_format_percent(arg2.xp_multiplier)), __s("Breed duration: %s", grow_duration), __s("Spawn chance: %s", number_format_percent(global.season_pass.nature.get_item_spawn_chance(arg2))), __s("Bonus: %s", format_upgrade_text(arg2.upgrade_attributes, 1))];
    if (get_upgrade_count(global.shops.event_nature.nature_bfly_synergy) > 0)
    {
        var syn_text = [];
        var __array = arg2.synergy;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            var syn_plant = variable_struct_get(global.plants_index_map, mitem.plant_index);
            var name = syn_plant.name;
            if (syn_plant.data.collected_total == 0)
            {
                name = "?";
            }
            array_push(syn_text, sprintf("%s: +%s", name, number_format_percent(mitem.synergy_bonus)));
        }
        array_push(desc_array, "");
        array_push(desc_array, __s("Synergy bonuses: %s", "\n" + implode("\n", syn_text)));
    }
    arg1 += draw_description(arg0, arg1, implode("\n", desc_array), arg3);
    var desc = get_default_struct_value(arg2, "description", "");
    if (!is_empty(desc))
    {
        arg1 += draw_description(arg0, arg1, desc, arg3);
    }
    var padding_end = global.is_mobile ? 4.5 : 3;
    return (arg1 - y_start) + gui_col_y(padding_end);
}
