function draw_house_item(arg0, arg1, arg2)
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
    if (!is_struct(arg2))
    {
        return 0;
    }
    var y_start = arg1;
    var _width = gui_col_x(5);
    var _height = gui_col_y(5);
    var text_height = 0;
    var unlocked = arg2.data.unlocked;
    var name = unlocked ? arg2.name : "?";
    arg1 += draw_heading(arg0 + (_width / 2), arg1, name, _width, undefined, 1);
    arg1 += global.ui_gaps.md;
    var sprite_color = unlocked ? 16777215 : 0;
    draw_sprite_contain(arg2.sprite, 0, arg0 + (_width / 2), arg1, 128, 0, sprite_color);
    arg1 += 128;
    if (!unlocked)
    {
        if (gui_button(arg0 + (_width / 2), arg1, __("Unlock"), arg2._can_buy(), gui_col_x(4), undefined, 
        {
            resources_mini: arg2.cost
        }))
        {
            dec_resources(arg2.cost);
            arg2.data.unlocked = true;
            instance_destroy(o_tooltip);
        }
    }
    else if (gui_button(arg0 + (_width / 2), arg1, __("Build"), arg2.can_build(), gui_col_x(4)))
    {
        if (instance_number(o_house_item) > global.max_house_items)
        {
            return notify(__("House capacity reached. Please remove some items before placing new ones."));
        }
        house_set_build(arg2);
        gui_dialog_toggle();
    }
    arg1 += global.ui_gaps.button_y;
    if (unlocked)
    {
        arg1 += draw_description(arg0, arg1, arg2.get_description(), _width);
    }
    else
    {
        arg1 += draw_description(arg0, arg1, arg2.get_tooltip(), _width);
    }
    return arg1 - y_start;
}
