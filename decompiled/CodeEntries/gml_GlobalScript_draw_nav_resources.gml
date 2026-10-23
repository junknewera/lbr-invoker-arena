function draw_nav_sidebar()
{
    var _x = gui_col_x(28.75);
    var _y = gui_col_y(2);
    var height = gui_col_y(26);
    var draw_type = get_option(global.options.resource_draw_selection);
    var res_draw_items = [];
    var res_index_loop = 0;
    var _ycol = 0;
    if (draw_type == UnknownEnum.Value_0)
    {
        var __array = global.resource_types_array;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            var __array2 = variable_struct_get(global.resources_sorted_types, mitem.key);
            var __prop_len2 = array_length(__array2);
            for (var __i2 = 0; __i2 < __prop_len2; __i2++)
            {
                var mitem2 = __array2[__i2];
                if (!mitem2.show_in_nav || !mitem2.data.unlocked || !get_value_ext(mitem2, mitem2.show_in_nav_check, true))
                {
                    continue;
                }
                if (is_same_key(mitem2.nav_type, global.resource_types.event))
                {
                    continue;
                }
                array_push(res_draw_items, mitem2);
            }
        }
        draw_nav_resources(_x, _y, height, res_draw_items);
    }
    else if (draw_type == UnknownEnum.Value_4)
    {
        draw_nav_resources(_x, _y, height, global.resources_sorted_nav_types.event);
    }
    else if (draw_type == UnknownEnum.Value_1)
    {
        var __array = global.materials_sorted;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            res_index_loop++;
            if (resource_nav_page_index >= res_index_loop)
            {
                continue;
            }
            resource_nav_items_remaining = false;
            var y_add = gui_col_y(1 + _ycol);
            if (y_add > height)
            {
                resource_nav_items_remaining = true;
                resource_nav_page_next = _ycol;
                exit;
            }
            draw_materials(_x, _y + y_add, build_resource_cost(mitem, mitem.data.count), 1);
            _ycol++;
        }
    }
    else if (draw_type == UnknownEnum.Value_2)
    {
        var __array = global.resources_sorted_types.leaf;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (!mitem.is_leaf)
            {
                continue;
            }
            for (var level = 1; level <= global.game_settings.leafscend_max_level; level++)
            {
                res_index_loop++;
                if (resource_nav_page_index >= res_index_loop)
                {
                    continue;
                }
                resource_nav_items_remaining = false;
                var y_add = gui_col_y(1 + _ycol);
                if (y_add > height)
                {
                    resource_nav_items_remaining = true;
                    resource_nav_page_next = _ycol;
                    exit;
                }
                var leafscend_count = get_default_struct_value(mitem.data.leafscend_count, level, undefined);
                if (is_undefined(leafscend_count))
                {
                    continue;
                }
                draw_resources(_x, _y + y_add, build_resource_cost(mitem, leafscend_count), 1, 
                {
                    leafscend_level: level
                });
                _ycol++;
            }
        }
    }
    else if (draw_type == UnknownEnum.Value_3)
    {
        set_default_font(f_gui_small, 0);
        var __array = global.areas_array;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (!mitem.has_boss)
            {
                continue;
            }
            if ((@@array_get@@(mitem.enemy, 0)).get_current_defeat_counter() == 0)
            {
                continue;
            }
            res_index_loop++;
            if (resource_nav_page_index >= res_index_loop)
            {
                continue;
            }
            resource_nav_items_remaining = false;
            var y_add = gui_col_y(2 + (_ycol * 1.5));
            if (y_add > height)
            {
                resource_nav_items_remaining = true;
                resource_nav_page_next = _ycol;
                exit;
            }
            var boss = @@array_get@@(mitem.enemy, 0);
            draw_sprite_contain(boss.sprite, 0, _x, _y + y_add, 32);
            draw_text(_x + 36, (_y + y_add) - 14, mitem.get_boss_spawn_text(true));
            _ycol++;
        }
    }
    if (draw_type == UnknownEnum.Value_5)
    {
        var __array = global.resource_types_array;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            var __array2 = variable_struct_get(global.resources_sorted_types, mitem.key);
            var __prop_len2 = array_length(__array2);
            for (var __i2 = 0; __i2 < __prop_len2; __i2++)
            {
                var mitem2 = __array2[__i2];
                if (!mitem2.data.fav)
                {
                    continue;
                }
                array_push(res_draw_items, mitem2);
            }
        }
        __array = global.materials_sorted;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (!mitem.data.fav)
            {
                continue;
            }
            array_push(res_draw_items, mitem);
        }
        set_default_font(f_gui_default, 0, 0);
        __array = res_draw_items;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            res_index_loop++;
            if (resource_nav_page_index >= res_index_loop)
            {
                continue;
            }
            resource_nav_items_remaining = false;
            var y_add = gui_col_y(1 + _ycol);
            if (y_add > height)
            {
                resource_nav_items_remaining = true;
                resource_nav_page_next = _ycol;
                exit;
            }
            mitem = @@array_get@@(res_draw_items, __i);
            var resource_draw = {};
            variable_struct_set(resource_draw, mitem.key, mitem.decimal ? mitem.data.count : floor(mitem.data.count));
            if (mitem.game_item_type == UnknownEnum.Value_11)
            {
                draw_resources(_x, _y + y_add, resource_draw);
            }
            else if (mitem.game_item_type == UnknownEnum.Value_7)
            {
                draw_materials(_x, _y + y_add, resource_draw);
            }
            _ycol++;
        }
    }
}

function draw_nav_resources(arg0, arg1, arg2, arg3)
{
    var res_index_loop = 0;
    var _ycol = 0;
    set_default_font(f_gui_default, 0, 0);
    var __array = arg3;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        res_index_loop++;
        if (resource_nav_page_index >= res_index_loop)
        {
            continue;
        }
        resource_nav_items_remaining = false;
        var y_add = gui_col_y(1 + _ycol);
        if (y_add > arg2)
        {
            resource_nav_items_remaining = true;
            resource_nav_page_next = _ycol;
            exit;
        }
        mitem = @@array_get@@(arg3, __i);
        var resource_draw = {};
        variable_struct_set(resource_draw, mitem.key, mitem.decimal ? mitem.data.count : floor(mitem.data.count));
        draw_resources(arg0, arg1 + y_add, resource_draw);
        _ycol++;
    }
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_7 = 7,
    Value_11 = 11
}
