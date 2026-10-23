if (show_borders)
{
    var border_width = 8;
    draw_set_color(#6C4D2C);
    draw_rectangle(xmin - border_width, ymin - border_width, xmax + border_width, ymin, false);
    draw_rectangle(xmin - border_width, ymin - border_width, xmin, ymax + border_width, false);
    draw_rectangle(xmax, ymin, xmax + border_width, ymax, false);
    draw_rectangle(xmin - border_width, ymax, xmax + border_width, ymax + border_width, false);
}
set_default_font(f_gui_small);
if (is_struct(current_stats))
{
    var texts = [__("Curse: %s"), __("Current hit: %s"), __("Current streak: %s"), __("Current time: %s | Real time: %s")];
    var texts2 = [__("Best streak: %s"), __("Hit min/max: %s/%s"), __("Played: %s"), __("Won: %s (%s)"), __("Fastest: %s | %s")];
    var won_pct_text = "-";
    if (current_stats.played > 0)
    {
        won_pct_text = number_format_percent(current_stats.won / current_stats.played);
    }
    var text = sprintf(implode(" | ", texts), global.tavern_games_curse_level, current_stats.hit, current_stats.win_streak, (level_timer == 0) ? "-" : format_time(secr(level_timer), true, true), (level_timer_real == 0) ? "-" : format_time(level_timer_real / 1000000, true, true));
    var text2 = sprintf(implode(" | ", texts2), current_stats.win_streak_max, current_stats.hit_min, current_stats.hit_max, current_stats.played, current_stats.won, won_pct_text, (current_stats.time_min == -1) ? "-" : format_time(secr(current_stats.time_min), true, true), (current_stats.time_real_min == -1) ? "-" : format_time(current_stats.time_real_min / 1000000, true, true));
    draw_text(x, y + height + 20, text);
    draw_text(x, y + height + 40, text2);
}
if (global.debug)
{
    var le_y = y - 100;
    if (gui_button_sprite(x + 100, le_y, spr_icon_cheese))
    {
        le_selection = o_minigame_curse_ball;
    }
    if (gui_button_sprite(x + 150, le_y, spr_icon_beer))
    {
        le_selection = o_minigame_curse_goal;
    }
    if (gui_button_sprite(x + 200, le_y, spr_icon_cursed_cheese))
    {
        le_selection = o_minigame_curse_obstacle;
    }
    if (gui_button_sprite(x + 250, le_y, spr_borb))
    {
        le_selection = o_minigame_curse_key_green;
    }
    if (gui_button_sprite(x + 300, le_y, spr_minigame_curse_wall))
    {
        le_selection = o_minigame_curse_wall_default;
    }
    if (gui_button_sprite(x + 350, le_y, spr_house_color_green))
    {
        le_selection = o_minigame_curse_wall_key_green;
    }
    if (gui_button_tl(x + 500, le_y, "LE On"))
    {
        is_random_level = false;
        state = UnknownEnum.Value_5;
    }
    if (gui_button_tl(x + 600, le_y, "LE Play"))
    {
        state = UnknownEnum.Value_0;
        trigger();
    }
    if (gui_button_tl(x + 700, le_y, "LE Off"))
    {
        is_random_level = true;
        state = UnknownEnum.Value_2;
    }
    if (gui_button_tl(x + 800, le_y, "Borders"))
    {
        show_borders = !show_borders;
    }
    if (gui_button_tl(x + 900, le_y, "Clear"))
    {
        destroy_minigame_instances();
    }
    if (gui_button_tl(x + 1000, le_y, "Save"))
    {
        var data = {};
        var __array = instance_list;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (mitem == o_minigame_curse_wall)
            {
                continue;
            }
            var obj_name = object_get_name(mitem);
            variable_struct_set(data, obj_name, []);
            with (mitem)
            {
                array_push(variable_struct_get(data, obj_name), 
                {
                    x: x,
                    y: y
                });
            }
        }
        var level_final = json_stringify(data);
        var _hmac_hash = sha1_string_utf8_hmac("ke03m!5ng93nan7p24lyg343nml2o591", level_final);
        level_final += ("#" + _hmac_hash + "#");
        var len = string_length(level_final);
        var buf = buffer_create(len, buffer_fixed, 1);
        buffer_write(buf, buffer_text, level_final);
        var save_data_string_final = buffer_base64_encode(buf, 0, buffer_get_size(buf));
        buffer_delete(buf);
        save_string_to_file(save_data_string_final, sprintf("curse_game_levels/%s.dat", global.tavern_games_curse_level));
        log("saved level", global.tavern_games_curse_level, level_final);
    }
    if (gui_button_tl(x + 1100, le_y, "Load level test"))
    {
        load_curse_game_level("test");
    }
    if (gui_button_tl(x + 1200, le_y, "Load level"))
    {
        load_curse_game_level(global.tavern_games_curse_level);
    }
    if (gui_button_tl(x + 1300, le_y, "Set name"))
    {
        global.tavern_games_curse_level = get_string_async("curse level", global.tavern_games_curse_level);
    }
    for (var i = 1; i <= 12; i++)
    {
        if (gui_button_tl(x + gui_col_x(6) + (i * 40), le_y + 60, i))
        {
            global.tavern_games_curse_level = i;
            state = UnknownEnum.Value_0;
            trigger();
        }
    }
    if (is_state(UnknownEnum.Value_5))
    {
        var place_x = floor(o_mouse.x / 16) * 16;
        var place_y = floor(o_mouse.y / 16) * 16;
        var le_sprite = object_get_sprite(le_selection);
        draw_sprite(le_sprite, 0, place_x, place_y);
        if (mouse_in_gui_range(xmin, ymin, xmax, ymax))
        {
            if (mouse_check_button_pressed(mb_left) || (keyboard_check(vk_shift) && mouse_check_button(mb_left)))
            {
                var __array = instance_list;
                var __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    if (position_meeting(place_x, place_y, mitem))
                    {
                        exit;
                    }
                }
                instance_create_layer(place_x, place_y, global.layers.gui_items_1, le_selection);
            }
            if (mouse_check_button_pressed(mb_right) || (keyboard_check(vk_shift) && mouse_check_button(mb_right)))
            {
                var __array = instance_list;
                var __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    var instance_at_place = instance_position(place_x, place_y, mitem);
                    if (instance_at_place == -4)
                    {
                        continue;
                    }
                    instance_destroy(instance_at_place);
                }
            }
        }
    }
}

enum UnknownEnum
{
    Value_0,
    Value_2 = 2,
    Value_5 = 5
}
