function get_key_modifier_item(arg0, arg1 = false, arg2 = false, arg3 = -1, arg4 = -1, arg5 = false)
{
    if (!is_struct(arg0))
    {
        return 1;
    }
    var ret_val = 1;
    if (global.is_mobile)
    {
        ret_val = get_option(global.options.selection_quantity_sign) * get_option(global.options.selection_quantity);
    }
    if (arg5)
    {
        ret_val = abs(ret_val);
    }
    var alt_pressed = keyboard_check(vk_alt);
    var ctrl_pressed = keyboard_check(vk_control);
    var shift_pressed = keyboard_check(vk_shift);
    if (alt_pressed)
    {
        ret_val = 100;
    }
    else if (ctrl_pressed)
    {
        ret_val = 25;
    }
    else if (shift_pressed)
    {
        ret_val = 10;
    }
    if (ret_val == 1)
    {
        return ret_val;
    }
    if (arg3 != -1 && arg4 != -1)
    {
        if (arg4 == 0)
        {
            return ret_val;
        }
        return min(arg4 - arg3, ret_val);
    }
    if (arg1)
    {
        var max_upgrade_level = arg0.get_max_upgrade_level();
        if (max_upgrade_level == 0)
        {
            return ret_val;
        }
        return min(max_upgrade_level - arg0.data.level, ret_val);
    }
    if (arg2)
    {
        return min(ret_val, arg0.data.count);
    }
    var max_count = get_shop_item_max_count(arg0);
    if (max_count == 0)
    {
        return ret_val;
    }
    if (max_count == 1)
    {
        return 1;
    }
    var max_buy_count = min(max_count - get_upgrade_count(arg0), ret_val);
    return max_buy_count;
}
