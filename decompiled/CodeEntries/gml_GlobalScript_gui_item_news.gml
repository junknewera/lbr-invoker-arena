function gui_item_news(arg0, arg1, arg2)
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
    var news_timeout_key = "get_news";
    var y_start = arg1;
    if (is_undefined(global.news) && !has_timeout(news_timeout_key))
    {
        get_news();
    }
    else
    {
        if (!is_array(global.news))
        {
            var text = __("No news.");
            if (has_timeout(news_timeout_key))
            {
                text = __("Getting news...");
            }
            draw_description(arg0, arg1, text);
            return 0;
        }
        var __array = global.news;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            var image_url = get_default_struct_value(mitem, "image_url", undefined);
            if (is_string(image_url) && is_undefined(variable_struct_get(global.image_cache_http, image_url)))
            {
                get_external_image(image_url);
            }
            if (has_external_image(image_url))
            {
                draw_sprite_contain(variable_struct_get(global.image_cache_http, image_url), 0, arg0, arg1 - 8, gui_col_x(5), undefined, undefined, undefined, undefined, false);
            }
            var title = get_default_struct_value(mitem, "title", "");
            arg1 += (draw_heading(arg0 + gui_col_x(6), arg1, title) - gui_col_y(0.8));
            var text = get_default_struct_value(mitem, "content", "");
            arg1 += draw_description(arg0 + gui_col_x(6), arg1, text, gui_col_x(17));
            if (!is_empty(get_default_struct_value(mitem, "link", "")))
            {
                if (gui_button_tl(arg0 + gui_col_x(6), arg1, __("Read more"), true, gui_col_x(3)))
                {
                    url_open_ext(mitem.link + "?ref=lbr", "_blank");
                }
                arg1 += gui_col_y(1.5);
            }
            arg1 += gui_col_y(2.5);
            variable_struct_set(o_game.data.news_seen, mitem.id, 1);
        }
    }
    return arg1 - y_start;
}

function gui_item_news_add_draw()
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
    var news_timeout_key = "get_news";
    if (gui_button_tl(add_button_base_x - gui_col_x(1), add_button_base_y, __("Refresh"), !has_timeout(news_timeout_key) || global.debug, gui_col_x(3)))
    {
        get_news();
        set_timeout(news_timeout_key, sec(30));
    }
}
