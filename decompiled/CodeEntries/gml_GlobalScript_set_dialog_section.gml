function set_dialog_section(arg0, arg1 = false)
{
    if (!instance_exists(o_shop))
    {
        exit;
    }
    with (o_dialog)
    {
        destroy_gui_instances();
        if (is_undefined(arg0))
        {
            if (array_length(actions) > 0)
            {
                current_section = actions[0].section;
            }
        }
        else if (!is_string(arg0) || is_undefined(variable_struct_get(global.dialog_sections_array, arg0)))
        {
            current_section = arg0;
        }
        else if (!is_undefined(o_shop.current_nav_key) && !is_undefined(variable_struct_get(global.dialog_sections_array, o_shop.current_nav_key)))
        {
            current_section = @@array_get@@(variable_struct_get(global.dialog_sections_array, o_shop.current_nav_key), 0);
        }
        if (!is_struct(current_section))
        {
            current_section = global.dialog_sections.general.general;
        }
        if (!is_undefined(variable_struct_get(actions_sections, current_section.value)))
        {
            actions = variable_struct_get(actions_sections, current_section.value);
        }
        if (arg1)
        {
            if (!is_undefined(variable_struct_get(global.dialog_sections_array, o_shop.current_nav_key)))
            {
                var __array = variable_struct_get(global.dialog_sections_array, o_shop.current_nav_key);
                var __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    mitem.selected = false;
                }
            }
            current_section.selected = true;
            dialog_click_delay();
        }
        shop_index = 0;
        scroll_y = 0;
        scroll_y_fx = 0;
    }
}
