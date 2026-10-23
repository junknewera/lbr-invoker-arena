function gui_item_bot_control_panel(arg0, arg1, arg2)
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
    var add_y = global.is_mobile ? gui_col_y(1) : 0;
    var y_start = arg1;
    if (is_current_dialog_section(global.dialog_sections.bot_control_panel.autobuy))
    {
        arg1 += draw_description(arg0, arg1, __s("Manage your bots in this panel. The highest autobuy priority is %s. Upgrades with a lower priority number will be bought first.", sprintf("'%s'", __("On"))));
        arg1 += gui_col_y(0.5);
        if (gui_button_tl(arg0 + gui_col_x(0), arg1, __("Enable all autobuyers"), true))
        {
            set_all_autobuyers(true);
            notify(__("All autobuyers enabled."));
        }
        if (gui_button_tl(arg0 + gui_col_x(6), arg1, __("Disable all autobuyers"), true))
        {
            set_all_autobuyers(false);
            notify(__("All autobuyers disabled."));
        }
        if (gui_button_tl(arg0 + gui_col_x(19), arg1, __("Reset autobuyers"), true))
        {
            var warning_text = __s("Do you want to reset all autobuy settings? %s Resetting the autobuy settings will start all bots immediately.", "\n\n!!" + __("Warning") + "!!" + "\n" + "\n");
            confirm_dialog(warning_text, function()
            {
                reset_all_autobuyers();
                notify(__("All autobuyers reset."));
            });
        }
        if (global.is_mobile)
        {
            arg1 += gui_col_y(0.5);
        }
        global.options.autobuy_resource_threshold.draw(arg0, arg1 + gui_col_y(3));
        arg1 += gui_col_y(0.5);
        draw_heading(arg0, arg1 + gui_col_y(5), __("Priorities"));
        var size = 3;
        draw_button_list(arg0, arg1 + gui_col_y(6), __("Load priorities %s"), size, function(arg0)
        {
            load_autobuy_priorities(arg0 + 1);
            notify(sprintf(__("Autobuy priorities #%s loaded."), arg0 + 1));
        }, undefined, undefined, gui_col_x(4));
        draw_button_list(arg0 + gui_col_x(6), arg1 + gui_col_y(6), __("Save priorities %s"), size, function(arg0)
        {
            save_autobuy_priorities(arg0 + 1);
            notify(sprintf(__("Autobuy priorities #%s saved."), arg0 + 1));
        }, undefined, undefined, gui_col_x(4));
        set_default_font(f_gui_small);
        draw_text_list(arg0 + gui_col_x(11), arg1 + gui_col_y(6.25), o_game.data.priority_names, size, undefined, gui_col_x(8));
        draw_button_list(arg0 + gui_col_x(20), arg1 + gui_col_y(6), __("Rename"), size, function(arg0)
        {
            global.selected_priority_slot = arg0 + 1;
            input_dialog(__("Autobuy Priorities"), function(arg0)
            {
                variable_struct_set(o_game.data.priority_names, global.selected_priority_slot, arg0);
            }, sprintf(__("Rename priorities %s"), global.selected_priority_slot), 
            {
                parent_nav: o_shop.current_nav_key
            }, 
            {
                max_length: 32
            });
        }, undefined, undefined, gui_col_x(3));
    }
    else if (is_current_dialog_section(global.dialog_sections.bot_control_panel.artifacts))
    {
        arg1 += draw_heading(arg0, arg1, global.artifacts.wings.name);
        arg1 += draw_description(arg0, arg1, __s("Select bosses where %s will teleport you when available.", global.artifacts.wings.name));
        gui_item_collectable_list(arg0, arg1, 
        {
            button_func: function(arg0)
            {
                if (!arg0.is_unlocked())
                {
                    exit;
                }
                arg0.data.ww = !arg0.data.ww;
            },
            
            columns: 13,
            
            get_btn_bg_sprite: function(arg0)
            {
                return arg0.data.ww ? spr_textbox_square_active : spr_textbox_square_inactive;
            },
            
            items: global.enemies,
            items_array: global.enemies_death_book,
            
            tooltip: function(arg0)
            {
                return arg0.is_unlocked() ? arg0.name : "?";
            },
            
            width: gui_col_x(16)
        }, 0);
    }
    else if (is_current_dialog_section(global.dialog_sections.bot_control_panel.loadouts))
    {
        var bx_padding = global.is_mobile ? 1.75 : 1;
        var by_padding = global.is_mobile ? 3 : 2;
        var selected_slot = get_default_struct_value(global.selected_inventory_item, "loadout_slot");
        var size = 3 + get_upgrade_attribute_value(global.upgrade_attributes.loadout_sets_size);
        arg1 += draw_heading_description(arg0, arg1, __("Loadouts"), __("Loadouts include the current tool, pets, unique leaves, scrolls, crafted leaves and autobuy priorities. Active scrolls won't be cancelled."));
        var col_y1 = arg1;
        var col_x2 = arg0 + gui_col_x(5);
        var col_y2 = arg1;
        for (var i = 0; i < size; i++)
        {
            var slot = i + 1;
            var loadout_name = get_default_struct_value(o_game.data.loadouts_names, slot, "-");
            draw_description(arg0, col_y1, sprintf("#%s: %s", slot, loadout_name), gui_col_x(4));
            if (gui_button_tl(arg0, col_y1, sprintf("#%s: %s", slot, loadout_name), undefined, gui_col_x(4), undefined, 
            {
                selected: selected_slot == slot
            }))
            {
                global.selected_inventory_item.loadout_slot = slot;
            }
            col_y1 += global.ui_gaps.button_y;
        }
        if (is_numeric(selected_slot))
        {
            var loadout_name = get_default_struct_value(o_game.data.loadouts_names, selected_slot, "-");
            col_y2 += draw_description(col_x2, col_y2, __s("Selected loadout: %s", loadout_name));
            if (gui_button_tl(col_x2, col_y2, __("Load"), undefined, gui_col_x(3), undefined, 
            {
                icon: spr_icon_load
            }))
            {
                load_loadout(selected_slot);
                notify(__s("Loadout %s loaded.", sprintf("#%s", selected_slot)));
            }
            if (gui_button_tl(col_x2 + gui_col_x(4), col_y2, __("Save"), undefined, gui_col_x(3), undefined, 
            {
                icon: spr_icon_save
            }))
            {
                save_loadout(selected_slot);
                notify(__s("Loadout %s saved.", sprintf("#%s", selected_slot)));
            }
            if (gui_button_tl(col_x2 + gui_col_x(8), col_y2, __("Rename"), undefined, gui_col_x(3), undefined, 
            {
                icon: spr_icon_pencil
            }))
            {
                global.selected_priority_slot = selected_slot;
                input_dialog(__("Loadout"), function(arg0)
                {
                    variable_struct_set(o_game.data.loadouts_names, global.selected_priority_slot, arg0);
                }, __s("Rename %s", sprintf("%s #%s", __("Loadout"), global.selected_priority_slot)), 
                {
                    parent_nav: o_shop.current_nav_key
                }, 
                {
                    input: loadout_name,
                    max_length: 32
                });
            }
            col_y2 += global.ui_gaps.button_y_lg;
            if (is_undefined(variable_struct_get(o_game.data.loadouts_options, selected_slot)))
            {
                variable_struct_set(o_game.data.loadouts_options, selected_slot, {});
            }
            var __array = global.loadouts.options;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                if (gui_button_sprite_tl(col_x2 + gui_col_x(bx_padding * __i) + gui_col_x(0.1), col_y2, mitem.sprite, undefined, undefined, 
                {
                    tooltip: mitem.tooltip,
                    btn_bg_sprite: get_default_struct_value(variable_struct_get(o_game.data.loadouts_options, selected_slot), mitem.key, true) ? spr_textbox_square_active : spr_textbox_square_inactive
                }))
                {
                    variable_struct_set(variable_struct_get(o_game.data.loadouts_options, selected_slot), mitem.key, !get_default_struct_value(variable_struct_get(o_game.data.loadouts_options, selected_slot), mitem.key, true));
                }
            }
            arg1 = max(col_y1, col_y2);
        }
        return arg1 - y_start;
    }
    else if (is_current_dialog_section(global.dialog_sections.bot_control_panel.mirrors))
    {
        var active_mirrors = get_struct_length(o_game.data.mirrors);
        var can_drop_fragments = has_bought_shop_item_safe(global.shops.energy_electrical.mirror_drop_relic_fragments);
        var has_material_upgrade = has_bought_shop_item_safe(global.shops.energy_electrical.mirror_enable_materials);
        var y_padding = global.is_mobile ? 3.5 : 3;
        var y_padding_mats = global.is_mobile ? 1.4 : 1;
        if (gui_button_tl(arg0 + gui_col_x(7), arg1, __("Place mirror"), can_place_mirror(), gui_col_x(3)))
        {
            global.artifacts.mirror._func();
        }
        arg1 += draw_heading(arg0, arg1, __s("Active mirrors: %s/%s", active_mirrors, get_max_mirrors()), undefined, undefined, undefined, undefined, false);
        var next_collection = format_time(get_mirror_collect_duration() - o_game.data.mirror_timer, undefined, undefined, "-");
        var text = concatstr(__s("Next mirror collection in %s.", next_collection), "\n", __s("Mirror efficiency %s", number_format_percent(get_mirror_efficiency())));
        if (can_drop_fragments)
        {
            text += ("\n" + __s("%s drop chance: %s", global.materials.relic_fragment.name_plural, number_format_percent(get_mirror_relic_fragment_drop_chance())));
            text += ("\n" + __s("%s drop count: %s", global.materials.relic_fragment.name_plural, get_mirror_relic_fragment_drop_count()));
        }
        arg1 += draw_description(arg0, arg1, text, gui_col_x(11));
        arg1 += gui_col_y(1);
        var area_list = [];
        var __struct = o_game.data.mirrors;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var area = variable_struct_get(global.areas, mkey);
            if (!is_struct(area))
            {
                continue;
            }
            array_push(area_list, 
            {
                area: area,
                index: area.get_index()
            });
        }
        sort_array_by_index(area_list, true);
        var __array = area_list;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (gui_button_sprite_tl(arg0 + gui_col_x(0), arg1 - gui_col_y(0.2), spr_icon_trash_can, undefined, undefined, 
            {
                tooltip: __("Remove")
            }))
            {
                variable_struct_remove(o_game.data.mirrors, mitem.area.key);
                if (is_current_area(mitem.area))
                {
                    instance_destroy(o_artifact_mirror);
                }
            }
            draw_description(arg0 + gui_col_x(1.5), arg1, mitem.area.name, gui_col_x(5));
            if (mitem.area.key == global.areas.vial_of_life.key)
            {
                draw_description(arg0 + gui_col_x(7), arg1 - gui_col_y(0.5), __("Random plant seeds"));
            }
            else
            {
                draw_resources_array(arg0 + gui_col_x(7), arg1 - gui_col_y(0.5), mitem.area.get_mirror_display_resources());
            }
            if (has_material_upgrade)
            {
                if (mitem.area.key == global.areas.dark_glade.key)
                {
                    draw_description(arg0 + gui_col_x(7), (arg1 - gui_col_y(0.5)) + gui_col_y(y_padding_mats), __("Random spawnable materials"));
                }
                else
                {
                    draw_materials_array(arg0 + gui_col_x(7), (arg1 - gui_col_y(0.5)) + gui_col_y(y_padding_mats), mitem.area.get_mirror_display_materials());
                }
            }
            arg1 += gui_col_y(y_padding);
        }
        var row_x = arg0 + gui_col_x(14);
        var row_y = y_start;
        draw_heading(row_x, row_y, __("Resources"));
        row_y += draw_heading(row_x + gui_col_x(5), row_y, __("Materials"));
        var tmp_y1 = draw_resources(row_x, row_y, get_cache("last_mirror_resources"));
        var tmp_y2 = draw_materials(row_x + gui_col_x(5), row_y, get_cache("last_mirror_materials"));
        row_y += max(tmp_y1, tmp_y2);
        return arg1 - y_start;
    }
    else if (is_current_dialog_section(global.dialog_sections.bot_control_panel.navigation))
    {
        draw_description(arg0, arg1, __("Show or hide navigation items."));
        gui_item_collectable_list(arg0, arg1 + add_y, 
        {
            add_draw_list: function(arg0, arg1, arg2)
            {
                if (arg2.has_badge)
                {
                    gui_draw_sprite(arg0 + 18, arg1 - 16, spr_icon_exclamation_mark, undefined, 1);
                }
            },
            
            button_func: function(arg0)
            {
                if (!arg0.check())
                {
                    return false;
                }
                variable_struct_set(o_game.data.nav_items, arg0.key, !get_default_struct_value(o_game.data.nav_items, arg0.key, true));
            },
            
            get_btn_bg_sprite: function(arg0)
            {
                return get_default_struct_value(o_game.data.nav_items, arg0.key, true) ? spr_textbox_square_active : spr_textbox_square_inactive;
            },
            
            gui_id: "fav_nav",
            
            is_unlocked_func: function(arg0)
            {
                return arg0.check();
            },
            
            items: o_shop.nav_items,
            items_array: o_shop.nav_items_array_cp,
            display_count: false,
            columns: 13,
            
            tooltip: function(arg0)
            {
                return arg0.check() ? arg0.name : "?";
            },
            
            width: gui_col_x(14)
        });
        var qa_x = arg0 + gui_col_x(16);
        var qa_y = arg1 + gui_col_y(2);
        if (gui_button_tl(qa_x + gui_col_x(0), qa_y + gui_col_y(0), __("Show all"), undefined, gui_col_x(3)))
        {
            var __array = o_shop.nav_items_array_cp;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                variable_struct_set(o_game.data.nav_items, mitem.key, true);
            }
        }
        if (gui_button_tl(qa_x + gui_col_x(4), qa_y + gui_col_y(0), __("Hide all"), undefined, gui_col_x(3)))
        {
            var __array = o_shop.nav_items_array_cp;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                variable_struct_set(o_game.data.nav_items, mitem.key, false);
            }
        }
        if (gui_button_tl(qa_x + gui_col_x(0), qa_y + gui_col_y(3), __s("Toggle %s", __("Shops")), undefined, gui_col_x(3)))
        {
            var tags = ["shop"];
            var __array = o_shop.nav_items_array_cp;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                if (array_key_in_array(tags, mitem.tags))
                {
                    variable_struct_set(o_game.data.nav_items, mitem.key, global.bcp_nav_state);
                }
            }
            global.bcp_nav_state = !global.bcp_nav_state;
        }
        if (gui_button_tl(qa_x + gui_col_x(4), qa_y + gui_col_y(3), __s("Toggle %s", __("Prestige")), undefined, gui_col_x(3)))
        {
            var tags = ["prestige"];
            var __array = o_shop.nav_items_array_cp;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                if (array_key_in_array(tags, mitem.tags))
                {
                    variable_struct_set(o_game.data.nav_items, mitem.key, global.bcp_nav_state);
                }
            }
            global.bcp_nav_state = !global.bcp_nav_state;
        }
        if (gui_button_tl(qa_x + gui_col_x(0), qa_y + gui_col_y(6), __s("Other %s", __("top")), undefined, gui_col_x(3)))
        {
            var tags = ["other", "top"];
            var __array = o_shop.nav_items_array_cp;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                if (all_array_keys_present(tags, mitem.tags))
                {
                    variable_struct_set(o_game.data.nav_items, mitem.key, global.bcp_nav_state);
                }
            }
            global.bcp_nav_state = !global.bcp_nav_state;
        }
        if (gui_button_tl(qa_x + gui_col_x(4), qa_y + gui_col_y(6), __s("Other %s", __("bottom")), undefined, gui_col_x(3)))
        {
            var tags = ["other", "bottom"];
            var __array = o_shop.nav_items_array_cp;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                if (all_array_keys_present(tags, mitem.tags))
                {
                    variable_struct_set(o_game.data.nav_items, mitem.key, global.bcp_nav_state);
                }
            }
            global.bcp_nav_state = !global.bcp_nav_state;
        }
    }
    else if (is_current_dialog_section(global.dialog_sections.bot_control_panel.resource_panel))
    {
        draw_text_ext_default(arg0, arg1, __("Add or remove resources to the favorites resource panel."));
        if (gui_button_tl(arg0, arg1 + gui_col_y(1), __("Resources"), undefined, gui_col_x(3)))
        {
            global.gui_item_bot_control_panel_selection = "resources";
            instance_destroy(o_gui_scrollable_items_inline);
        }
        if (gui_button_tl(arg0 + gui_col_x(4), arg1 + gui_col_y(1), __("Materials"), undefined, gui_col_x(3)))
        {
            global.gui_item_bot_control_panel_selection = "materials";
            instance_destroy(o_gui_scrollable_items_inline);
        }
        switch (global.gui_item_bot_control_panel_selection)
        {
            case "resources":
                gui_item_collectable_list(arg0, arg1 + gui_col_y(1) + add_y, 
                {
                    button_func: function(arg0)
                    {
                        if (!arg0.data.unlocked)
                        {
                            return false;
                        }
                        arg0.data.fav = !arg0.data.fav;
                    },
                    
                    get_btn_bg_sprite: function(arg0)
                    {
                        return arg0.data.fav ? spr_textbox_square_active : spr_textbox_square_inactive;
                    },
                    
                    gui_id: "fav_res",
                    items: global.resources,
                    items_array: global.resources_nav_desc,
                    display_count: false,
                    columns: 13,
                    
                    tooltip: function(arg0)
                    {
                        return arg0.data.unlocked ? arg0.name_plural : "?";
                    },
                    
                    width: gui_col_x(14)
                });
                break;
            case "materials":
                gui_item_collectable_list(arg0, arg1 + gui_col_y(1) + add_y, 
                {
                    button_func: function(arg0)
                    {
                        if (!arg0.data.unlocked)
                        {
                            return false;
                        }
                        arg0.data.fav = !arg0.data.fav;
                    },
                    
                    get_btn_bg_sprite: function(arg0)
                    {
                        return arg0.data.fav ? spr_textbox_square_active : spr_textbox_square_inactive;
                    },
                    
                    items: global.materials,
                    items_array: global.materials_sorted,
                    display_count: false,
                    columns: 13,
                    
                    tooltip: function(arg0)
                    {
                        return arg0.data.unlocked ? arg0.name_plural : "?";
                    },
                    
                    width: gui_col_x(14)
                });
                break;
        }
        draw_button_list(arg0 + gui_col_x(16), arg1 + gui_col_y(3), __("Load %s"), 3, function(arg0)
        {
            load_nav_fav_resources(arg0);
            notify(__s("Slot %s loaded", arg0 + 1));
        }, undefined, undefined, gui_col_x(2.5));
        draw_button_list(arg0 + gui_col_x(20), arg1 + gui_col_y(3), __("Save %s"), 3, function(arg0)
        {
            save_nav_fav_resources(arg0);
            notify(__s("Slot %s saved", arg0 + 1));
        }, undefined, undefined, gui_col_x(2.5));
        var height = gui_content_height - gui_col_y(4);
        return height;
    }
}
