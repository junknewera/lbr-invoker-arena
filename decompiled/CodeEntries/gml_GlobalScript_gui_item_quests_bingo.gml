function gui_item_quests_bingo(arg0, arg1, arg2 = undefined)
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
    if (!is_array(arg2) && is_struct(global.bingo_quests))
    {
        arg2 = struct_to_sorted_array_key(global.bingo_quests);
    }
    var xcol = 0;
    var ycol = 0;
    set_default_font(f_gui_small);
    var __array = arg2;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        var bx = arg0 + (gui_col_x(4.5) * xcol);
        var by = arg1 + (gui_col_y(3.5) * ycol);
        var quest_is_finished = mitem.is_finished();
        var col = iif(quest_is_finished, 32768, 255);
        var description = mitem.get_description(true);
        if (quest_is_finished)
        {
            if (!global.is_mobile)
            {
                description += "\n\n";
            }
            else
            {
                description += " ";
            }
            description += ("[" + string_upper(__s("Completed")) + "]");
        }
        draw_set_alpha(0.5);
        draw_set_color(col);
        draw_rectangle(bx, by, bx + gui_col_x(4.5), by + gui_col_y(3.5), false);
        draw_set_alpha(1);
        draw_set_color(c_white);
        draw_text(bx + 4, by + 4, mitem.get_name(true));
        var by_add = global.is_mobile ? 1 : 0.4;
        draw_text_ext(bx + 4, by + 4 + gui_col_y(by_add), description, global.gui_text_line_height, gui_col_x(4));
        xcol++;
        if ((xcol % 5) == 0 && xcol > 0)
        {
            xcol = 0;
            ycol++;
        }
    }
}
