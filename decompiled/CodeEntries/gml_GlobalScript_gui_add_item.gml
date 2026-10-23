function gui_add_item(arg0)
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
    if (!is_array(actions) || arg0 >= array_length(actions) || arg0 < 0)
    {
        exit;
    }
    var action = actions[arg0];
    var item_shown = true;
    current_gui_item = action;
    if (!is_struct(action))
    {
        exit;
    }
    if (action.instance != -1 && !instance_exists(action.instance))
    {
        log("invalid instance", action);
        destroy();
        exit;
    }
    if (!get_value_ext(action, action._is_visible, action))
    {
        exit;
    }
    var add_gui_x_value = 0;
    var add_gui_y_value = 0;
    var add_gui_y_value_base = global.gui_items_margin;
    set_default_font(f_gui_small);
    action._button_text = get_value_ext(action, action.button_text, action.button_args);
    var button_height_add;
    switch (action.type)
    {
        case UnknownEnum.Value_0:
            add_gui_y_value = gui_item_achievements(gui_x, gui_y);
            break;
        case UnknownEnum.Value_1:
            add_gui_y_value = gui_item_area(gui_x, gui_y, action);
            break;
        case UnknownEnum.Value_2:
            add_gui_y_value = gui_item_areas(gui_x, gui_y);
            break;
        case "blowers":
            add_gui_y_value = gui_item_blowers(gui_x, gui_y);
            break;
        case "blower":
            add_gui_y_value = gui_item_blower(gui_x, gui_y, action);
            break;
        case UnknownEnum.Value_3:
            add_gui_y_value = gui_item_borbventure(gui_x, gui_y, action);
            break;
        case UnknownEnum.Value_4:
            add_gui_y_value = gui_item_bot_control_panel(gui_x, gui_y, action);
            break;
        case UnknownEnum.Value_5:
            add_gui_y_value = gui_item_button(gui_x + 20, gui_y + 20, action);
            add_gui_y_value += (global.is_mobile ? 36 : 24);
            break;
        case UnknownEnum.Value_6:
            var row_width = gui_width - 80;
            var columns = 4;
            var button_spacing = 15;
            var button_width = (row_width / columns) - button_spacing;
            var btn_x = gui_x + (button_width / 2) + button_spacing + (((button_inline_counter * row_width) / columns) + (button_inline_counter * button_spacing));
            button_height_add = global.is_mobile ? 24 : 0;
            action.button_center = false;
            set_struct_value(action.button_options, "height", 24 + button_height_add);
            var add_gui_y_value_button = gui_item_button(btn_x, gui_y + 16, action);
            add_gui_y_value_base = 0;
            button_inline_counter++;
            if (button_inline_counter > 0 && (button_inline_counter % 4) == 0)
            {
                button_inline_counter = 0;
                add_gui_y_value = 46 + button_height_add;
                add_gui_y_value += add_gui_y_value_button;
            }
            break;
        case UnknownEnum.Value_7:
            add_gui_y_value = gui_item_cards(gui_x, gui_y, action);
            break;
        case UnknownEnum.Value_9:
            add_gui_y_value = gui_item_challenges(gui_x, gui_y, action);
            break;
        case UnknownEnum.Value_8:
            add_gui_y_value = gui_item_challenge(gui_x, gui_y, action);
            break;
        case UnknownEnum.Value_10:
            gui_item_checkbox(gui_x, gui_y, action);
            add_gui_y_value = global.gui_items_default_height;
            break;
        case UnknownEnum.Value_12:
            gui_item_collectable_list(gui_x, gui_y, action);
            add_gui_y_value = global.gui_items_default_height;
            break;
        case UnknownEnum.Value_13:
            if (is_struct(struct_get_from_hash(action, variable_get_hash("__item"))))
            {
                if (get_value_ext(action.__item, action.__item.is_visible))
                {
                    add_gui_y_value = gui_item_collectable_usable_item(gui_x, gui_y, action);
                }
                else
                {
                    item_shown = false;
                }
            }
            else
            {
                item_shown = false;
            }
            break;
        case UnknownEnum.Value_14:
            add_gui_y_value = gui_item_collectable_usable_item_list(gui_x, gui_y, action);
            break;
        case UnknownEnum.Value_16:
            add_gui_y_value = gui_item_converter(gui_x, gui_y, action);
            break;
        case "converters":
            add_gui_y_value = gui_item_converters(gui_x, gui_y);
            break;
        case UnknownEnum.Value_11:
            add_gui_y_value = gui_item_crafting(gui_x, gui_y);
            break;
        case UnknownEnum.Value_17:
            add_gui_y_value = gui_item_death_book(gui_x, gui_y, action);
            break;
        case UnknownEnum.Value_18:
            add_gui_y_value = gui_item_dynamic(gui_x, gui_y, action);
            break;
        case UnknownEnum.Value_19:
            add_gui_y_value = gui_item_editor(gui_x, gui_y, action);
            break;
        case UnknownEnum.Value_20:
            gui_item_equipment(gui_x, gui_y, action);
            add_gui_y_value = global.gui_items_default_height;
            break;
        case "equipment_wrapper":
            add_gui_y_value = gui_item_equipment_wrapper(gui_x, gui_y);
            break;
        case "func":
            add_gui_y_value = action(gui_x, gui_y);
            break;
        case UnknownEnum.Value_21:
            gui_item_game_borb_claw_machine(gui_x, gui_y, action);
            add_gui_y_value = 200;
            break;
        case UnknownEnum.Value_22:
            gui_item_game_curse(gui_x, gui_y, action);
            add_gui_y_value = 200;
            break;
        case UnknownEnum.Value_23:
            add_gui_y_value = gui_item_game_leaf_counter(gui_x, gui_y, action);
            break;
        case UnknownEnum.Value_24:
            gui_item_game_slots(gui_x, gui_y, action);
            add_gui_y_value = 200;
            break;
        case UnknownEnum.Value_25:
            add_gui_y_value = gui_item_guide(gui_x, gui_y, action);
            break;
        case UnknownEnum.Value_26:
            gui_item_house_item(gui_x, gui_y, action);
            break;
        case UnknownEnum.Value_27:
            gui_item_input(gui_x, gui_y, action);
            add_gui_y_value = global.gui_items_default_height;
            break;
        case UnknownEnum.Value_28:
            add_gui_y_value = gui_item_leafscension(gui_x, gui_y, action);
            break;
        case UnknownEnum.Value_30:
            add_gui_y_value = gui_item_lore(gui_x, gui_y, action);
            break;
        case UnknownEnum.Value_31:
            add_gui_y_value = gui_item_lore_wrapper(gui_x, gui_y);
            break;
        case UnknownEnum.Value_32:
            add_gui_y_value = gui_item_milestones(gui_x, gui_y, action);
            break;
        case UnknownEnum.Value_33:
            add_gui_y_value = gui_item_news(gui_x, gui_y, action);
            break;
        case UnknownEnum.Value_34:
            break;
        case UnknownEnum.Value_35:
            gui_item_option(gui_x, gui_y, action);
            add_gui_y_value = 32;
            break;
        case UnknownEnum.Value_36:
            add_gui_y_value = gui_item_options(gui_x, gui_y, action);
            break;
        case UnknownEnum.Value_37:
            add_gui_y_value = gui_item_pets(gui_x, gui_y, action);
            break;
        case UnknownEnum.Value_38:
            add_gui_y_value = gui_item_quests(gui_x, gui_y, action);
            break;
        case UnknownEnum.Value_39:
            gui_item_quests_bingo(gui_x, gui_y, action);
            add_gui_y_value = global.gui_items_default_height;
            break;
        case UnknownEnum.Value_41:
            add_gui_y_value = gui_item_action_result(gui_x, gui_y, action);
            break;
        case UnknownEnum.Value_40:
            var res_x = gui_x + (((res_inline_counter * gui_width) / 6) + (res_inline_counter * 50));
            gui_item_resources(res_x, gui_y, action);
            add_gui_y_value_base = 0;
            res_inline_counter++;
            if (res_inline_counter > 0 && (res_inline_counter % 5) == 0)
            {
                res_inline_counter = 0;
                add_gui_y_value = 46;
            }
            break;
        case UnknownEnum.Value_44:
            add_gui_y_value = gui_item_season_pass(gui_x, gui_y, action);
            break;
        case UnknownEnum.Value_43:
            add_gui_y_value = gui_item_seasons(gui_x, gui_y, action);
            break;
        case UnknownEnum.Value_45:
            add_gui_y_value = gui_item_selection(gui_x, gui_y, action);
            break;
        case UnknownEnum.Value_46:
            add_gui_y_value = gui_item_shop(gui_x, gui_y, action);
            break;
        case UnknownEnum.Value_47:
            add_gui_y_value = gui_item_shop_item(gui_x, gui_y, action);
            break;
        case UnknownEnum.Value_48:
            add_gui_y_value = gui_item_shop_item_dlc(gui_x, gui_y, action);
            break;
        case UnknownEnum.Value_49:
            add_gui_y_value = gui_item_shops(gui_x, gui_y, action);
            break;
        case UnknownEnum.Value_50:
            gui_item_simple_action(gui_x, gui_y, action);
            break;
        case UnknownEnum.Value_51:
            add_gui_y_value = get_default_struct_value(action, "height", 12);
            if (button_inline_counter > 0)
            {
                add_gui_y_value += (46 + global.gui_button_height);
            }
            button_inline_counter = 0;
            break;
        case UnknownEnum.Value_52:
            button_inline_counter++;
            if (button_inline_counter > 0 && (button_inline_counter % 4) == 0)
            {
                button_inline_counter = 0;
                add_gui_y_value = 46 + button_height_add;
                add_gui_y_value += (global.gui_button_height + 5);
            }
            break;
        case UnknownEnum.Value_53:
            gui_item_sprite_text(gui_x, gui_y, action);
            add_gui_y_value = 24;
            break;
        case UnknownEnum.Value_54:
        case UnknownEnum.Value_55:
        case UnknownEnum.Value_56:
            var item_text = get_value_ext(action, action._text, action);
            if (!is_string(item_text) || item_text == "")
            {
                break;
            }
            set_default_font(f_gui_small);
            if (action.type == UnknownEnum.Value_56)
            {
                set_default_font(f_gui_default);
            }
            gui_item_text(gui_x, gui_y, action);
            if (action.type == UnknownEnum.Value_55)
            {
                add_gui_y_value = 16;
            }
            else
            {
                add_gui_y_value = string_height_ext(item_text, global.gui_text_line_height, gui_content_width);
            }
            break;
        case UnknownEnum.Value_57:
            add_gui_y_value = gui_item_trades(gui_x, gui_y, action);
            break;
        case UnknownEnum.Value_58:
            gui_item_unique_leaf(gui_x, gui_y, action);
            add_gui_y_value = global.gui_items_default_height;
            break;
        default:
            gui_item_simple_action(gui_x, gui_y, action);
            break;
    }
    if (!is_numeric(add_gui_x_value))
    {
        add_gui_x_value = 0;
    }
    if (!is_numeric(add_gui_y_value))
    {
        add_gui_y_value = 0;
    }
    if (!is_numeric(add_gui_y_value_base))
    {
        add_gui_y_value_base = 0;
    }
    if (!is_numeric(add_gui_y_value))
    {
        add_gui_y_value = 0;
    }
    add_gui_y_value += round(add_gui_y_value_base);
    if (item_shown)
    {
        gui_x += add_gui_x_value;
        gui_y += add_gui_y_value;
    }
    return 
    {
        height: add_gui_y_value,
        item_shown: item_shown
    };
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_7,
    Value_8,
    Value_9,
    Value_10,
    Value_11,
    Value_12,
    Value_13,
    Value_14,
    Value_16 = 16,
    Value_17,
    Value_18,
    Value_19,
    Value_20,
    Value_21,
    Value_22,
    Value_23,
    Value_24,
    Value_25,
    Value_26,
    Value_27,
    Value_28,
    Value_30 = 30,
    Value_31,
    Value_32,
    Value_33,
    Value_34,
    Value_35,
    Value_36,
    Value_37,
    Value_38,
    Value_39,
    Value_40,
    Value_41,
    Value_43 = 43,
    Value_44,
    Value_45,
    Value_46,
    Value_47,
    Value_48,
    Value_49,
    Value_50,
    Value_51,
    Value_52,
    Value_53,
    Value_54,
    Value_55,
    Value_56,
    Value_57,
    Value_58
}
