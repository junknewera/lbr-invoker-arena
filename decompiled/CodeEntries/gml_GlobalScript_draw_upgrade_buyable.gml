function draw_upgrades_buyable(arg0, arg1, arg2, arg3 = undefined, arg4 = undefined)
{
    if (!is_struct(arg2))
    {
        return 0;
    }
    if (!is_array(struct_get_from_hash(arg2, variable_get_hash("upgrades_array"))))
    {
        return 0;
    }
    var y_start = arg1;
    var __array = arg2.upgrades_array;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        arg1 += draw_upgrade_buyable(arg0, arg1, arg3, mitem.name, struct_get_from_hash(mitem, variable_get_hash("description")), 
        {
            add_upgrade_description: get_default_struct_value(arg4, "add_upgrade_description", true),
            cost_result: true,
            count_key_modifier: true,
            item: arg2,
            upgrade_name: mitem.key
        });
    }
    return arg1 - y_start;
}

function draw_upgrade_buyable(arg0, arg1, arg2 = gui_col_x(8), arg3 = "", arg4 = "", arg5 = undefined)
{
    var _y_start = arg1;
    var button_y = arg1;
    var item = get_default_struct_value(arg5, "item", undefined);
    var sprite = undefined;
    var toggle = false;
    var upgrade_name = get_default_struct_value(arg5, "upgrade_name", "empty");
    if (is_undefined(arg4))
    {
        arg4 = "";
    }
    var count = get_default_struct_value(arg5, "count", 1);
    if (get_default_struct_value(arg5, "count_key_modifier", true))
    {
        count = get_key_modifier();
    }
    count = clamp(count, 1, 100);
    var can_upgrade_func = get_default_struct_value(arg5, "can_upgrade", __return_true);
    var can_upgrade = can_upgrade_func(item, count);
    var cost_materials = undefined;
    var cost_resources = undefined;
    var cost_result = undefined;
    var item_level = get_default_struct_value(item.data, upgrade_name, 0);
    var upgrade_max_level = get_default_struct_value(item, "upgrade_max_level", 0);
    var is_obfuscated;
    if (is_struct(item))
    {
        is_obfuscated = false;
        var upgrade_row = variable_struct_get(item.upgrades, upgrade_name);
        if (is_struct(struct_get_from_hash(item, variable_get_hash("upgrades"))) && is_struct(upgrade_row))
        {
            var is_visible = get_default_struct_value_ext(upgrade_row, "is_visible", true, item);
            if (!is_visible)
            {
                return 0;
            }
            is_obfuscated = get_default_struct_value_ext(upgrade_row, "is_obfuscated", false, item);
            var is_unlocked = get_default_struct_value_ext(upgrade_row, "is_unlocked", undefined, item);
            if (is_callable(is_unlocked))
            {
                is_obfuscated = !is_unlocked();
            }
            sprite = get_default_struct_value(upgrade_row, "sprite", undefined);
            toggle = get_default_struct_value(upgrade_row, "toggle", false);
            upgrade_max_level = get_default_struct_value(upgrade_row, "max_level", upgrade_max_level);
        }
        if (upgrade_max_level > 0)
        {
            count = _clamp(count, 1, upgrade_max_level - item_level);
        }
        if (!is_undefined(struct_get_from_hash(item, variable_get_hash("can_upgrade"))))
        {
            can_upgrade = item.can_upgrade(upgrade_name, count);
        }
        if (!is_undefined(struct_get_from_hash(arg5, variable_get_hash("cost_materials"))))
        {
            cost_materials = item.get_upgrade_cost(upgrade_name, count);
        }
        if (!is_undefined(struct_get_from_hash(arg5, variable_get_hash("cost_resources"))))
        {
            cost_resources = item.get_upgrade_cost(upgrade_name, count);
        }
        if (!is_undefined(struct_get_from_hash(arg5, variable_get_hash("cost_result"))))
        {
            cost_result = item.get_upgrade_cost(upgrade_name, count);
        }
        if (!is_undefined(struct_get_from_hash(item, variable_get_hash("get_upgrade_name"))))
        {
            arg3 = struct_get_from_hash(item, variable_get_hash("get_upgrade_name"))(upgrade_name);
        }
        if (!is_undefined(struct_get_from_hash(item, variable_get_hash("get_upgrade_description"))) && get_default_struct_value(arg5, "add_upgrade_description", true) && get_default_struct_value(upgrade_row, "add_upgrade_description", true))
        {
            if (!is_empty(arg4))
            {
                arg4 += "\n";
            }
            arg4 += item.get_upgrade_description(upgrade_name);
        }
    }
    else
    {
        var cost_materials_func = get_default_struct_value(arg5, "cost_materials_func", __void);
        var cost_resources_func = get_default_struct_value(arg5, "cost_resources_func", __void);
        if (!is_undefined(cost_materials_func))
        {
            cost_materials = cost_materials_func(item, count);
        }
        if (!is_undefined(cost_resources_func))
        {
            cost_resources = cost_materials_func(item, count);
        }
    }
    var upgrade_text = (count > 1) ? __s("Upgrade %s", count) : __s("Upgrade");
    if (is_obfuscated)
    {
        arg3 = "?";
    }
    if (!is_undefined(sprite))
    {
        draw_sprite_contain(sprite, -1, arg0 + 16, arg1 + 16, 32);
        arg0 += gui_col_x(1);
    }
    arg1 += draw_heading(arg0, arg1, arg3, arg2 - gui_col_x(3.5), undefined, undefined, undefined, false);
    if (is_obfuscated)
    {
        return (arg1 - _y_start) + gui_col_y(1);
    }
    var button_props = {};
    if (!is_undefined(cost_materials))
    {
        button_props.materials_mini = cost_materials;
    }
    if (!is_undefined(cost_resources))
    {
        button_props.resources_mini = cost_resources;
    }
    if (!is_undefined(cost_result))
    {
        button_props.result_mini = cost_result;
    }
    if (upgrade_max_level == 0 || (upgrade_max_level > 0 && item_level < upgrade_max_level))
    {
        if (gui_button_tl(arg0 + (arg2 / 2) + gui_col_x(2), button_y - gui_col_y(0.25), upgrade_text, can_upgrade, gui_col_x(2.5), undefined, button_props))
        {
            if (is_struct(item) && !is_undefined(struct_get_from_hash(item, variable_get_hash("upgrade"))))
            {
                item.upgrade(upgrade_name, count);
            }
            else if (!is_undefined(struct_get_from_hash(arg5, variable_get_hash("upgrade_func"))))
            {
                arg5.upgrade_func(upgrade_name, count, item);
            }
        }
    }
    arg1 -= gui_col_y(0.4);
    arg1 += draw_description(arg0, arg1, arg4, arg2 * 0.6);
    if (item_level > 0 && toggle)
    {
        var toggle_key = sprintf("%s_toggle", upgrade_name);
        var toggle_state = get_default_struct_value(item.data, toggle_key, true);
        var toggle_text = toggle_state ? __("Enabled") : __("Disabled");
        if (gui_button_toggle(arg0 + gui_col_x(0.35), arg1 + gui_col_y(0.6), toggle_state, true, 
        {
            text: toggle_text
        }))
        {
            variable_struct_set(item.data, toggle_key, !toggle_state);
        }
        arg1 += gui_col_y(1.25);
    }
    if (global.debug && keyboard_check(vk_control) && is_struct(item))
    {
        if (gui_button_tl(arg0, arg1 - 30, "=0"))
        {
            variable_struct_set(item.data, upgrade_name, 0);
        }
        if (gui_button_tl(arg0 + 40, arg1 - 30, "-1"))
        {
            variable_struct_set(item.data, upgrade_name, max(variable_struct_set_pre(item.data, upgrade_name, variable_struct_get(item.data, upgrade_name) - 1), 0));
        }
        if (gui_button_tl(arg0 + 80, arg1 - 30, "+1"))
        {
            variable_struct_set_post(item.data, upgrade_name, variable_struct_get(item.data, upgrade_name) + 1);
        }
        if (gui_button_tl(arg0 + 120, arg1 - 30, "=max"))
        {
            variable_struct_set(item.data, upgrade_name, get_default_struct_value(variable_struct_get(item.upgrades, upgrade_name), "max_level", 100));
        }
        if (gui_button_tl(arg0 + 200, arg1 - 30, "refresh"))
        {
            item.refresh_upgrade_attributes();
            init_game_vars(true);
        }
    }
    return (arg1 - _y_start) + gui_col_y(1.25);
}
