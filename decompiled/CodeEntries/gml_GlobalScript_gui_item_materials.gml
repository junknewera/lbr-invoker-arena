function gui_item_materials(arg0, arg1)
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
    arg1 += gui_item_selection(arg0, arg1, 
    {
        list_props: 
        {
            columns: global.is_mobile ? 8 : 10,
            display_count: true,
            display_materials: true,
            display_resources: true,
            
            is_unlocked_func: function(arg0)
            {
                return arg0.data.unlocked;
            },
            
            items: global.materials,
            items_array: global.materials_sorted,
            width: gui_col_x(14),
            
            button_func: function(arg0)
            {
                global.selected_inventory_item.material = arg0;
                if (global.debug)
                {
                    if (keyboard_check(vk_control))
                    {
                        arg0.data.count = 0;
                    }
                    if (keyboard_check(vk_shift))
                    {
                        arg0.data.count = get_material_max_count(arg0);
                    }
                    if (keyboard_check(vk_alt))
                    {
                        arg0.data.count += 500;
                    }
                    arg0.data.collected = arg0.data.count;
                }
            }
        },
        
        selected_item: function()
        {
            return struct_get_from_hash(global.selected_inventory_item, variable_get_hash("material"));
        },
        
        selected_item_draw_props: 
        {
            draw_use_button: false,
            draw_below_func: gui_item_material_selected
        },
        
        selected_item_is_unlocked_func: function(arg0)
        {
            return arg0.data.unlocked;
        }
    });
}

function gui_item_material_selected(arg0, arg1, arg2)
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
    var y_start = arg1;
    arg1 += draw_description(arg0, arg1, arg2.get_spawn_description(), gui_col_x(8));
    arg1 += gui_col_y(1);
    if (arg2.is_spawnable() && has_bought_shop_item_safe(global.shops.blc.material_inspector) && is_struct(arg2.spawn_area))
    {
        if (gui_button_tl(arg0, arg1, __("Teleport to spawn area"), arg2.spawn_area.check(), gui_col_x(5)))
        {
            change_area(arg2.spawn_area);
        }
    }
    if (global.debug)
    {
        arg1 += gui_col_y(2);
        if (gui_button_tl(arg0, arg1, "=0"))
        {
            arg2.data.count = 0;
        }
        if (gui_button_tl(arg0 + 80, arg1, "+1"))
        {
            arg2.collect(get_key_modifier());
        }
    }
    return arg1 - y_start;
}

function gui_item_materials_add_draw()
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
    var material_autocollect = get_upgrade_attribute_value(global.upgrade_attributes.material_autocollect);
    var text = [__s("Max storage: %s", number_format(get_material_max_count()))];
    if (material_autocollect > 0)
    {
        var material_autocollect_display = floor(material_autocollect * 60);
        array_push(text, __s("Auto collect materials: %s/minute", material_autocollect_display));
    }
    draw_description(add_text_base_x, add_text_base_y, text, undefined, undefined, undefined, undefined, " | ");
}
