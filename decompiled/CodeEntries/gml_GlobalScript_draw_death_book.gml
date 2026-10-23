function draw_death_book(arg0, arg1, arg2, arg3 = gui_col_x(7), arg4 = gui_col_y(14), arg5 = false, arg6 = gui_col_x(8), arg7 = undefined, arg8 = false)
{
    if (!is_struct(arg2))
    {
        return 0;
    }
    var _y_start = arg1;
    if (global.debug && keyboard_check(vk_shift))
    {
        draw_set_color(c_red);
        draw_rectangle(arg0, arg1, arg0 + arg3, arg1 + arg4, true);
        draw_set_color(c_white);
    }
    var unlocked = arg2.is_unlocked();
    draw_heading(arg0 + (arg3 / 2), arg1, arg2.name, arg3, undefined, 1);
    var sprite_color = unlocked ? 16777215 : 0;
    if (unlocked && arg2.blend_color != undefined)
    {
        sprite_color = arg2.blend_color;
    }
    draw_sprite_contain(arg2.sprite, -1, arg0 + (arg3 / 2), arg1 + gui_col_y(4.5), ceil(arg3 / 3), 0, sprite_color);
    var text_height = 0;
    var db_header_y;
    if (unlocked && arg5)
    {
        var action_padding_y = gui_col_y(2.5);
        db_header_y = arg1 + gui_col_y(9.5);
        var count = 1;
        set_default_font(f_gui_small, 0, 0);
        var text = "";
        var description = [];
        var kill_count = (arg2.data.db_level > 0) ? arg2.get_offline_kills_count() : 0;
        var next_reward = "-";
        if (arg2.data.db_level > 0)
        {
            var next_reward_counter = (1 - arg2.get_offline_counter()) / arg2.get_offline_step_value();
            next_reward = format_time(next_reward_counter, undefined, true);
        }
        text += __s("Next reward in: %s", next_reward);
        text += ("\n" + __("Last reward") + ": ");
        text += (!is_empty(arg2.last_reward_text) ? arg2.last_reward_text : "-");
        var offline_count_value = arg2.get_offline_step_value();
        var offline_counter = arg2.get_offline_counter();
        var kpm = offline_count_value * 60 * kill_count;
        var kph = kpm * 60;
        text += "\n";
        text += implode("\n", [__s("Total passive kills: %s", arg2.data.defeated_offline), __s("Kills per hour: %s", kph), __s("Kills per minute: %s", kpm)]);
        if (arg2.db_multiplier != 1)
        {
            text += ("\n" + __s("Reward multiplier: %s", number_format_percent(arg2.db_multiplier)));
        }
        array_push(description, text);
        var description_final = implode("\n", description);
        draw_text_ext(arg0, db_header_y, description_final, global.gui_text_line_height, arg6);
        db_header_y += (string_height_ext(description_final, global.gui_text_line_height, arg6) + (action_padding_y / 2));
        var upgrade_name = "db_level";
        var reward_time_f = "-";
        if (arg2.data.db_level > 0)
        {
            var reward_time = 1 / arg2.get_offline_step_value();
            reward_time_f = format_time(reward_time, undefined, true);
        }
        var header_desc = __s("Unlocks passive kills for this enemy.") + "\n" + "\n" + __s("Time per kill: %s", reward_time_f);
        db_header_y += draw_upgrade_buyable(arg0, db_header_y, arg3, "", header_desc, 
        {
            cost_materials: true,
            count_key_modifier: false,
            item: arg2,
            upgrade_name: upgrade_name
        });
        upgrade_name = "db_kpr_level";
        header_desc = __s("Kills per cycle: %s", kill_count);
        header_desc += "\n";
        db_header_y += draw_upgrade_buyable(arg0, db_header_y, arg3, "", header_desc, 
        {
            cost_materials: true,
            count_key_modifier: false,
            item: arg2,
            upgrade_name: upgrade_name
        });
        upgrade_name = "db_souls_chance_level";
        header_desc = __s("Chance to spawn soul-boosted bosses. These bosses are stronger but drop %s.", global.materials.raw_soul_stone.name_plural);
        header_desc += "\n";
        db_header_y += draw_upgrade_buyable(arg0, db_header_y, arg3, "", header_desc, 
        {
            cost_materials: true,
            count_key_modifier: false,
            item: arg2,
            toggle: true,
            upgrade_name: upgrade_name
        });
        upgrade_name = "db_souls_count_level";
        header_desc = __s("Soul-boosted bosses drop %s after being defeated.", global.materials.raw_soul_stone.name_plural);
        header_desc += ("\n\n" + __s("Drop count: %s", arg2.get_raw_soul_stone_drop_count()));
        db_header_y += draw_upgrade_buyable(arg0, db_header_y, arg3, "", header_desc, 
        {
            cost_materials: true,
            count_key_modifier: false,
            item: arg2,
            upgrade_name: upgrade_name
        });
        upgrade_name = "db_souls_offline_level";
        var souls_level_ua = get_default_struct_value(arg2.upgrade_attributes, upgrade_name, 0);
        var total_souls_offline_chance = souls_level_ua * get_default_struct_value(arg2.upgrade_attributes, "db_souls_chance_level", 0);
        header_desc = __s("Increases the chance to kill a passive soul-boosted boss by %s. This chance is relative to the base soul boost chance.", number_format_percent(arg2.upgrades.db_souls_offline_level.value));
        header_desc += ("\n\n" + __s("Total chance: %s", number_format_percent(total_souls_offline_chance)));
        db_header_y += draw_upgrade_buyable(arg0, db_header_y, arg3, "", header_desc, 
        {
            cost_materials: true,
            count_key_modifier: false,
            item: arg2,
            upgrade_name: upgrade_name
        });
        upgrade_name = "db_souls_pity_counter_level";
        var pity_counter = arg2.get_pity_counter();
        var next_pity_counter = arg2.get_next_pity_counter();
        header_desc = __s("Adds a pity counter to this enemy. Every time this enemy was not soul boosted, the pity counter increases by %s. If the pity counter is full, the next spawn will be soul boosted. Scales with %s.", arg2.get_pity_counter_inc(), arg2.upgrades.db_souls_chance_level.name);
        header_desc += ("\n\n" + __s("Pity counter: %s/%s", number_format(pity_counter), number_format(next_pity_counter)));
        db_header_y += draw_upgrade_buyable(arg0, db_header_y, arg3, "", header_desc, 
        {
            cost_materials: true,
            count_key_modifier: false,
            item: arg2,
            upgrade_name: upgrade_name
        });
    }
    return arg4 + text_height + (db_header_y - arg4 - _y_start);
}
