function init_options()
{
    global.options = 
    {
        language: new Option(id, 
        {
            index: 1002,
            name: __("Language"),
            
            description: function()
            {
                return __s("Requires game restart to apply all text changes. Press %s to restart the game. If you would like to help translate the game, please join the discord server for further information. Thank you!", "Shift+Alt+R");
            },
            
            section: global.dialog_sections.options.gameplay,
            data: 
            {
                value: 0
            },
            options: [
            {
                value: "en",
                text: "English"
            }, 
            {
                value: "fr",
                text: "Francais"
            }, 
            {
                value: "de",
                text: "Deutsch"
            }, 
            {
                value: "pl",
                text: "Polski"
            }, 
            {
                value: "ru",
                text: "Русский",
                has_special_chars: true
            }, 
            {
                value: "es",
                text: "Espanol"
            }, 
            {
                value: "sl",
                text: "Slovenscina"
            }],
            
            change: function(arg0)
            {
            },
            
            add_draw: function(arg0, arg1)
            {
                if (global.debug || global.testers)
                {
                    if (get_option(global.options.language) != "en")
                    {
                        var can_download_i18n = !has_timeout("i18n_download_live");
                        if (gui_button(arg0 + gui_col_x(9), arg1 + gui_col_y(0.5), __("Download Live Translation"), can_download_i18n, gui_col_x(4.5)))
                        {
                            notify("Downloading live version, please wait...");
                            set_timeout("i18n_download_live", sec(30));
                            post_to_cloud("tester", "get_i18n", 
                            {
                                lang: get_option(global.options.language)
                            }, function(arg0)
                            {
                                var content = get_default_struct_value(arg0, "data", undefined);
                                if (!is_string(content))
                                {
                                    return notify_error("Translation error.");
                                }
                                var filename = sprintf("lang/%s.txt", get_option(global.options.language));
                                save_string_to_file(base64_decode(content), filename);
                                notify("Translations downloaded, please restart the game (Shift+Alt+R).", "important");
                            });
                        }
                    }
                }
                if (!self.changed)
                {
                    exit;
                }
                if (gui_button(arg0 + gui_col_x(21), arg1 + gui_col_y(0.5), __("Restart"), true, gui_col_x(2.5)))
                {
                    save_game();
                    game_restart_adv();
                }
            }
        }),
        enable_alb: new Option(id, 
        {
            index: 1003,
            name: __("ALBs enabled"),
            section: global.dialog_sections.options.gameplay,
            toggle: true,
            data: 
            {
                value: true
            },
            
            check: function()
            {
                return !has_timeout("option_enable_alb");
            },
            
            change: function()
            {
                if (!self.data.value)
                {
                    instance_destroy(o_autoblower);
                }
                else
                {
                    create_autoblowers();
                }
                set_timeout("option_enable_alb", sec(3));
            }
        }),
        enable_alb_bumping: new Option(id, 
        {
            index: 1003.1,
            name: __("ALB Bumper"),
            
            description: function()
            {
                return __s("All ALBs can bump into enemies to damage them. Ouch. Requires an upgrade in the %s shop.", __("Bismuth"));
            },
            
            section: global.dialog_sections.options.gameplay,
            toggle: true,
            data: 
            {
                value: true
            }
        }),
        enable_autobuy: new Option(id, 
        {
            index: 1004,
            name: __("Autobuy enabled"),
            section: global.dialog_sections.options.gameplay,
            toggle: true,
            data: 
            {
                value: true
            }
        }),
        move_player: new Option(id, 
        {
            index: 1005,
            name: __("Move Player"),
            section: global.dialog_sections.options.gameplay,
            toggle: true,
            data: 
            {
                value: true
            }
        }),
        number_notation: new Option(id, 
        {
            index: 1006,
            name: __("Number notation"),
            section: global.dialog_sections.options.gameplay,
            data: 
            {
                value: 0
            },
            
            button_text: function()
            {
                return self.options[self.data.value];
            },
            
            change: function()
            {
                global.number_notation_current = get_option(global.options.number_notation);
            },
            
            options: [global.number_notation.def.value, global.number_notation.alt.value, global.number_notation.e.value, global.number_notation.engineering.value, global.number_notation.leaf.value]
        }),
        enable_gems_upgrades: new Option(id, 
        {
            index: 1007,
            name: __("Enable Gem Upgrades"),
            section: global.dialog_sections.options.gameplay,
            toggle: true,
            data: 
            {
                value: true
            },
            
            change: function()
            {
                global.game_settings.gem_upgrades_enabled = self.data.value;
                init_game_vars();
                apply_challenge();
            },
            
            visible_in_options: false
        }),
        enable_supporter_upgrades: new Option(id, 
        {
            index: 1007.1,
            name: __("Enable Supporter Upgrades"),
            section: global.dialog_sections.options.gameplay,
            toggle: true,
            data: 
            {
                value: true
            },
            
            change: function()
            {
                init_game_vars();
                refresh_dlc_shop();
                apply_challenge();
            }
        }),
        enable_events: new Option(id, 
        {
            index: 1007.2,
            name: __("Enable Events"),
            section: global.dialog_sections.options.gameplay,
            toggle: true,
            data: 
            {
                value: true
            },
            
            change: function()
            {
                init_game_vars();
            }
        }),
        reset_scroll_position_after_prestige: new Option(id, 
        {
            index: 1008,
            name: __("Reset scroll position after prestige"),
            section: global.dialog_sections.options.gameplay,
            toggle: true,
            data: 
            {
                value: true
            }
        }),
        player_controls: new Option(id, 
        {
            index: 1009,
            name: __("Player control"),
            section: global.dialog_sections.options.gameplay,
            data: 
            {
                value: 0
            },
            
            button_text: function()
            {
                return self.options[self.data.value];
            },
            
            options: [global.player_controls.mouse.value, global.player_controls.keyboard.value, global.player_controls.dpad.value],
            
            change: function()
            {
                if (!instance_exists(o_game))
                {
                    exit;
                }
                o_game.can_draw_vstick = get_option(global.options.player_controls) == global.player_controls.dpad.value;
            }
        }),
        player_rc_lock: new Option(id, 
        {
            index: 10010,
            name: __("Right click locks player"),
            section: global.dialog_sections.options.gameplay,
            toggle: true,
            data: 
            {
                value: false
            },
            
            change: function()
            {
                if (!self.data.value && instance_exists(o_blower))
                {
                    o_blower.locked = false;
                }
            },
            
            visible_in_options: !global.is_mobile
        }),
        show_death_dialogs: new Option(id, 
        {
            index: 10011,
            name: __("Display Blown-Away dialogs"),
            section: global.dialog_sections.options.gameplay,
            toggle: true,
            data: 
            {
                value: true
            }
        }),
        show_reward_dialogs: new Option(id, 
        {
            index: 10011.5,
            name: __("Display reward dialogs"),
            section: global.dialog_sections.options.gameplay,
            toggle: true,
            data: 
            {
                value: true
            }
        }),
        show_autocollected_materials: new Option(id, 
        {
            index: 10012,
            name: __("Display Auto-Collected Materials"),
            section: global.dialog_sections.options.gameplay,
            toggle: true,
            data: 
            {
                value: false
            }
        }),
        confirm_buy_max_shop_items: new Option(id, 
        {
            index: 10013,
            name: __("Confirm buy max shop items"),
            section: global.dialog_sections.options.gameplay,
            toggle: true,
            data: 
            {
                value: true
            }
        }),
        show_salvage_confirm_dialog: new Option(id, 
        {
            index: 10014,
            name: __("Confirm salvage leaves"),
            section: global.dialog_sections.options.gameplay,
            toggle: true,
            data: 
            {
                value: false
            }
        }),
        salvage_locked_leaves: new Option(id, 
        {
            index: 10014.1,
            name: __("Salvage locked leaves"),
            description: __("If this option is enabled, locked crafted leaves can be salvaged."),
            section: global.dialog_sections.options.gameplay,
            toggle: true,
            data: 
            {
                value: false
            }
        }),
        reroll_locked_leaves: new Option(id, 
        {
            index: 10015,
            name: __("Reroll locked leaves"),
            description: __("If this option is enabled, locked crafted leaves can be rerolled."),
            section: global.dialog_sections.options.gameplay,
            toggle: true,
            data: 
            {
                value: false
            }
        }),
        restrictive_max_buy: new Option(id, 
        {
            index: 10016,
            name: __("Restrictive Max Buy"),
            description: __s("If this option is enabled, the %s button in shops checks for the autobuy max count.", __("Buy max")),
            section: global.dialog_sections.options.gameplay,
            toggle: true,
            data: 
            {
                value: false
            }
        }),
        close_dialog_on_teleport: new Option(id, 
        {
            index: 10017,
            name: __("Close Dialog on Teleport"),
            description: "",
            section: global.dialog_sections.options.gameplay,
            toggle: true,
            data: 
            {
                value: false
            }
        }),
        gfx_quality: new Option(id, 
        {
            index: 10010,
            name: __("Quality"),
            section: global.dialog_sections.options.graphics,
            data: 
            {
                value: 1
            },
            options: [
            {
                text: __("Low"),
                value: UnknownEnum.Value_0
            }, 
            {
                text: __("High"),
                value: UnknownEnum.Value_1
            }],
            
            change: function(arg0 = false)
            {
                if (!arg0)
                {
                    exit;
                }
                var value = get_option(global.options.gfx_quality);
                var set_value = (value == UnknownEnum.Value_0) ? false : true;
                global.options.alb_visible.data.checked = set_value;
                global.options.draw_leaves.set(set_value);
                global.options.draw_other_leaves.set(set_value);
                global.options.draw_trees.set(set_value);
                global.options.draw_borbs.set(set_value);
                global.options.draw_fruits.set(set_value);
                global.options.draw_seeds.set(set_value);
                global.options.draw_enemy.set(set_value);
                global.options.draw_equipment.set(set_value);
                global.options.draw_pet.set(set_value);
                global.options.draw_materials_option.set(set_value);
                global.options.draw_dig_items.set(set_value);
                global.options.draw_resource_text_rewards.set(set_value);
                global.options.draw_shadows.set(set_value);
                global.options.draw_weapon.set(set_value);
            }
        }),
        fullscreen: new Option(id, 
        {
            index: 10012,
            name: __("Fullscreen"),
            section: global.dialog_sections.options.graphics,
            toggle: true,
            data: 
            {
                value: false
            },
            
            change: function(arg0)
            {
                window_enable_borderless_fullscreen(get_option(global.options.borderless_fullscreen));
                window_set_fullscreen(self.data.value);
                if (arg0)
                {
                    camera_init();
                }
            },
            
            visible_in_options: !global.is_mobile
        }),
        borderless_fullscreen: new Option(id, 
        {
            index: 10012.1,
            name: __("Borderless Fullscreen"),
            description: __("Fullscreen needs to be enabled for this option to take effect."),
            section: global.dialog_sections.options.graphics,
            toggle: true,
            data: 
            {
                value: false
            },
            
            func_after: function(arg0, arg1)
            {
                if (arg0)
                {
                    global.options.fullscreen.change();
                }
            },
            
            visible_in_options: !global.is_mobile
        }),
        save_window_settings: new Option(id, 
        {
            index: 10012.2,
            name: __("Save Window Settings"),
            description: __("Restores the game window to the last saved position."),
            section: global.dialog_sections.options.graphics,
            toggle: true,
            data: 
            {
                value: true
            },
            visible_in_options: global.is_pc && !global.is_opera
        }),
        restrain_window_settings: new Option(id, 
        {
            index: 10012.3,
            name: __("Restrain Window Settings"),
            
            description: function()
            {
                return __s("If this option is enabled, the window will be restrained to the current display. If you would like to play on a different monitor or if the window doesn't resize correctly, try toggling this option off. Note that the game window might disappear. Press %s to toggle fullscreen.", "Alt+Enter");
            },
            
            section: global.dialog_sections.options.graphics,
            toggle: true,
            data: 
            {
                value: true
            },
            visible_in_options: global.is_pc && !global.is_opera
        }),
        enable_aa: new Option(id, 
        {
            index: 10012.4,
            name: __("Enable Smooth Graphics"),
            
            description: function()
            {
                return __s("Enables smooth rendering of graphics. Turn this option off if you like pixel art!");
            },
            
            section: global.dialog_sections.options.graphics,
            toggle: true,
            data: 
            {
                value: false
            },
            
            change: function(arg0 = false)
            {
                if (arg0)
                {
                    set_gui_size();
                }
            }
        }),
        fixed_nav: new Option(id, 
        {
            index: 10012.5,
            name: __("Fixed Navigation"),
            
            description: function()
            {
                return __s("Enables fixed navigation for the top and bottom bar. Comes with 100% improved muscle memory.");
            },
            
            section: global.dialog_sections.options.graphics,
            toggle: true,
            data: 
            {
                value: false
            }
        }),
        alternative_font: new Option(id, 
        {
            index: 10013,
            name: __("Font"),
            section: global.dialog_sections.options.graphics,
            data: 
            {
                value: global.is_mobile ? 2 : 0
            },
            options: [
            {
                text: __("Default"),
                value: "def"
            }, 
            {
                text: __("Alternative"),
                value: "alt"
            }, 
            {
                text: __("Pikzel"),
                value: "pikzel"
            }],
            
            change: function(arg0 = false)
            {
                var font_key = get_option(global.options.alternative_font);
                global.current_font = variable_struct_get(global.fonts, font_key);
                if (is_undefined(global.current_font))
                {
                    global.current_font = global.fonts.def;
                }
                if (arg0)
                {
                    set_gui_size();
                }
            }
        }),
        alb_visible: new Option(id, 
        {
            index: 10014,
            name: __("Draw ALBs"),
            section: global.dialog_sections.options.graphics,
            data: 
            {
                value: 100,
                checked: true
            },
            
            button_text: function()
            {
                return sprintf("%s%", self.data.value);
            },
            
            has_checkbox: true,
            has_slider: true,
            checkbox_text: __("Visible")
        }),
        draw_leaves: new Option(id, 
        {
            index: 10015,
            name: __("Draw basic leaves"),
            section: global.dialog_sections.options.graphics,
            toggle: true,
            data: 
            {
                value: true
            }
        }),
        draw_other_leaves: new Option(id, 
        {
            index: 10016,
            name: __("Draw other leaves"),
            section: global.dialog_sections.options.graphics,
            toggle: true,
            data: 
            {
                value: true
            }
        }),
        draw_trees: new Option(id, 
        {
            index: 10017,
            name: __("Draw trees"),
            section: global.dialog_sections.options.graphics,
            toggle: true,
            data: 
            {
                value: true
            }
        }),
        draw_borbs: new Option(id, 
        {
            index: 10018,
            name: __("Draw Borbs"),
            section: global.dialog_sections.options.graphics,
            toggle: true,
            data: 
            {
                value: true
            }
        }),
        draw_fruits: new Option(id, 
        {
            index: 10019,
            name: __("Draw fruits"),
            section: global.dialog_sections.options.graphics,
            toggle: true,
            data: 
            {
                value: true
            }
        }),
        draw_seeds: new Option(id, 
        {
            index: 10020,
            name: __("Draw seeds"),
            section: global.dialog_sections.options.graphics,
            toggle: true,
            data: 
            {
                value: true
            },
            
            change: function()
            {
                var option_value = self.data.value;
                with (o_seed)
                {
                    can_draw = option_value;
                }
            }
        }),
        draw_cards: new Option(id, 
        {
            index: 10020.1,
            name: __("Draw cards"),
            section: global.dialog_sections.options.graphics,
            toggle: true,
            data: 
            {
                value: true
            },
            
            change: function()
            {
                var option_value = self.data.value;
                with (o_card)
                {
                    can_draw = option_value;
                }
            }
        }),
        draw_other_items: new Option(id, 
        {
            index: 10020.2,
            name: __("Draw other items"),
            section: global.dialog_sections.options.graphics,
            toggle: true,
            data: 
            {
                value: true
            }
        }),
        draw_enemy: new Option(id, 
        {
            index: 10021,
            name: __("Draw enemies"),
            section: global.dialog_sections.options.graphics,
            toggle: true,
            data: 
            {
                value: true
            },
            
            change: function()
            {
                var option_value = self.data.value;
                with (o_enemy)
                {
                    can_draw = option_value;
                }
            }
        }),
        enemy_hit_color: new Option(id, 
        {
            index: 10021.1,
            name: __s("Enemy hit color"),
            section: global.dialog_sections.options.graphics,
            data: 
            {
                value: 0
            },
            options: [
            {
                value: global.colors.red,
                text: __("Red")
            }, 
            {
                value: global.colors.green,
                text: __("Green")
            }, 
            {
                value: global.colors.blue,
                text: __("Blue")
            }, 
            {
                value: global.colors.slight_red,
                text: __("Subtle")
            }, 
            {
                value: 16777215,
                text: __("None")
            }],
            
            change: function()
            {
                var col = get_option(global.options.enemy_hit_color);
                with (o_enemy)
                {
                    enemy_hit_color = col;
                }
            }
        }),
        draw_equipment: new Option(id, 
        {
            index: 10025,
            name: __("Draw equipment"),
            section: global.dialog_sections.options.graphics,
            toggle: true,
            data: 
            {
                value: true
            },
            
            change: function()
            {
                var option_value = self.data.value;
                with (o_equipment_item)
                {
                    visible = option_value;
                }
            }
        }),
        draw_pet: new Option(id, 
        {
            index: 10030,
            name: __("Draw pet"),
            section: global.dialog_sections.options.graphics,
            toggle: true,
            data: 
            {
                value: true
            }
        }),
        draw_materials_option: new Option(id, 
        {
            index: 10050,
            name: __("Draw materials"),
            section: global.dialog_sections.options.graphics,
            toggle: true,
            data: 
            {
                value: true
            },
            
            change: function()
            {
                var option_value = self.data.value;
                with (o_material)
                {
                    visible = option_value;
                }
            }
        }),
        draw_dig_items: new Option(id, 
        {
            index: 10100,
            name: __("Draw dig items"),
            section: global.dialog_sections.options.graphics,
            toggle: true,
            data: 
            {
                value: true
            }
        }),
        draw_resource_text_rewards: new Option(id, 
        {
            index: 10323,
            name: __("Draw resource text rewards"),
            section: global.dialog_sections.options.graphics,
            toggle: true,
            data: 
            {
                value: true
            }
        }),
        draw_resource_text_rewards_leaf: new Option(id, 
        {
            index: 10323.1,
            name: __("Draw leaf resource text rewards"),
            section: global.dialog_sections.options.graphics,
            toggle: true,
            data: 
            {
                value: true
            }
        }),
        draw_shadows: new Option(id, 
        {
            index: 10324,
            name: __("Draw shadows"),
            section: global.dialog_sections.options.graphics,
            toggle: true,
            data: 
            {
                value: iif(global.is_mobile, false, true)
            }
        }),
        draw_shop_notification: new Option(id, 
        {
            index: 10325,
            name: __("Draw shop notification"),
            section: global.dialog_sections.options.graphics,
            toggle: true,
            data: 
            {
                value: true
            }
        }),
        draw_weapon: new Option(id, 
        {
            index: 10326,
            name: __("Draw player tool"),
            section: global.dialog_sections.options.graphics,
            toggle: true,
            data: 
            {
                value: true
            }
        }),
        draw_alb_tool: new Option(id, 
        {
            index: 10327,
            name: __("Draw ALB tool"),
            section: global.dialog_sections.options.graphics,
            toggle: true,
            data: 
            {
                value: true
            }
        }),
        hide_maxed_shops: new Option(id, 
        {
            index: 10327.5,
            name: __("Hide Maxed Shops"),
            section: global.dialog_sections.options.graphics,
            toggle: true,
            data: 
            {
                value: false
            }
        }),
        enable_tooltips: new Option(id, 
        {
            index: 10328,
            name: __("Enable tooltips"),
            section: global.dialog_sections.options.graphics,
            toggle: true,
            data: 
            {
                value: true
            }
        }),
        enable_notifications: new Option(id, 
        {
            index: 10328.1,
            name: __("Enable notifications"),
            tooltip: __("Toggle notifications"),
            section: global.dialog_sections.options.graphics,
            toggle: true,
            data: 
            {
                value: true
            },
            sprite: [spr_gui_arrow_down, spr_gui_arrow_up],
            
            change: function(arg0, arg1)
            {
                with (o_notification)
                {
                    if (type != "error")
                    {
                        visible = arg1;
                    }
                }
            }
        }),
        notification_behind_menu: new Option(id, 
        {
            index: 10328.2,
            name: __("Notifications behind menu"),
            section: global.dialog_sections.options.graphics,
            toggle: true,
            data: 
            {
                value: false
            }
        }),
        enable_autocraft_notifications: new Option(id, 
        {
            index: 10329.01,
            name: __("Autocraft notifications"),
            section: global.dialog_sections.options.graphics,
            toggle: true,
            data: 
            {
                value: true
            }
        }),
        enable_borbventure_notifications: new Option(id, 
        {
            index: 10329.02,
            name: __s("%s notifications", __("Borbventure")),
            section: global.dialog_sections.options.graphics,
            toggle: true,
            data: 
            {
                value: true
            }
        }),
        enable_brew_notifications: new Option(id, 
        {
            index: 10329.03,
            name: __("Brew notifications"),
            section: global.dialog_sections.options.graphics,
            toggle: true,
            data: 
            {
                value: true
            }
        }),
        enable_card_notifications: new Option(id, 
        {
            index: 10329.04,
            name: __("Card notifications"),
            section: global.dialog_sections.options.graphics,
            toggle: true,
            data: 
            {
                value: true
            }
        }),
        enable_salvage_notifications: new Option(id, 
        {
            index: 10329.1,
            name: __("Salvage notifications"),
            section: global.dialog_sections.options.graphics,
            toggle: true,
            data: 
            {
                value: true
            }
        }),
        enable_trade_notifications: new Option(id, 
        {
            index: 10329.2,
            name: __("Trade notifications"),
            section: global.dialog_sections.options.graphics,
            toggle: true,
            data: 
            {
                value: true
            }
        }),
        show_prestige_animation: new Option(id, 
        {
            index: 10350,
            name: __("Show prestige animation"),
            description: __("Deactivating this option will not cancel the prestige animation time."),
            section: global.dialog_sections.options.graphics,
            toggle: true,
            data: 
            {
                value: true
            }
        }),
        show_action_particles: new Option(id, 
        {
            index: 10360,
            name: __("Show action particles"),
            description: __("Whether action particles (after digging/slapping) should be shown or not."),
            section: global.dialog_sections.options.graphics,
            toggle: true,
            data: 
            {
                value: true
            }
        }),
        menu_transparency: new Option(id, 
        {
            index: 10500,
            name: __("Menu transparency"),
            section: global.dialog_sections.options.graphics,
            data: 
            {
                value: 100,
                checked: false
            },
            has_slider: true,
            slider_min: 30,
            button_text_affix: "%",
            
            func: function(arg0, arg1)
            {
                with (o_dialog)
                {
                    alpha = arg1 / 100;
                }
            }
        }),
        notification_transparency: new Option(id, 
        {
            index: 10500.1,
            name: __("Notification transparency"),
            section: global.dialog_sections.options.graphics,
            data: 
            {
                value: 100,
                checked: false
            },
            has_slider: true,
            slider_min: 10,
            button_text_affix: "%",
            
            func: function(arg0, arg1)
            {
                with (o_notification)
                {
                    set_alpha_max(arg1 / 100);
                }
            }
        }),
        dark_dialog_bg: new Option(id, 
        {
            index: 10501,
            name: __("Dark Dialog Background"),
            description: __("Darkens the background if a dialog is visible."),
            section: global.dialog_sections.options.graphics,
            toggle: true,
            data: 
            {
                value: true
            }
        }),
        single_click_nav: new Option(id, 
        {
            index: 10502,
            name: __("Single-Click Navigation"),
            description: __("Opens navigation items with a single click if a dialog is visible. This is not recommended on the mobile version."),
            section: global.dialog_sections.options.graphics,
            toggle: true,
            data: 
            {
                value: !global.is_mobile
            }
        }),
        disable_app_surface: new Option(id, 
        {
            index: 11000,
            name: __("Alternative Rendering"),
            description: __("Enable this option if you encounter any fps drops or memory leak issues."),
            section: global.dialog_sections.options.graphics,
            toggle: true,
            data: 
            {
                value: false
            },
            
            change: function(arg0)
            {
                application_surface_enable(!self.data.value);
                if (arg0)
                {
                    camera_init();
                }
            },
            
            visible_in_options: !global.is_mobile
        }),
        font_size: new Option(id, 
        {
            index: 12000,
            name: __("Font size"),
            description: __("Experimental feature. Some texts may overlap."),
            section: global.dialog_sections.options.graphics,
            data: 
            {
                value: 0
            },
            has_slider: true,
            slider_min: -5,
            slider_max: 10,
            slider_step: 1,
            
            change: function(arg0 = false)
            {
                if (!arg0)
                {
                    exit;
                }
                init_fonts();
                set_gui_size();
                global.options.alternative_font.change();
            }
        }),
        arachnophobia: new Option(id, 
        {
            index: 12001,
            name: __("Arachnophobia"),
            
            description: function()
            {
                return __("Replaces all spider sprites with a cake. A cakephobia option? No, I'm sorry.") + "\n" + __("Requires game restart.");
            },
            
            section: global.dialog_sections.options.graphics,
            data: 
            {
                value: false
            },
            toggle: true
        }),
        fancy_titles: new Option(id, 
        {
            index: 12002,
            name: __("Fancy Titles"),
            section: global.dialog_sections.options.graphics,
            data: 
            {
                value: true
            },
            toggle: true
        }),
        volume_master: new Option(id, 
        {
            index: 30031,
            name: __("Master volume"),
            section: global.dialog_sections.options.sound,
            data: 
            {
                value: 80,
                checked: false
            },
            
            button_text: function()
            {
                return self.data.value;
            },
            
            change: function()
            {
                var value = self.data.value / 100;
                if (self.data.checked)
                {
                    value = 0;
                }
                audio_master_gain(value);
            },
            
            has_slider: true,
            has_checkbox: true,
            checkbox_text: __("Mute")
        }),
        volume_sfx: new Option(id, 
        {
            index: 30032,
            name: __("SFX volume"),
            section: global.dialog_sections.options.sound,
            data: 
            {
                value: 80,
                checked: false
            },
            
            button_text: function()
            {
                return self.data.value;
            },
            
            has_slider: true,
            has_checkbox: true,
            checkbox_text: __("Mute")
        }),
        volume_music: new Option(id, 
        {
            index: 30033,
            name: __("Music volume"),
            section: global.dialog_sections.options.sound,
            data: 
            {
                value: 80,
                checked: false
            },
            
            button_text: function()
            {
                return self.data.value;
            },
            
            change: function()
            {
                if (!audio_is_playing(o_options.track))
                {
                    exit;
                }
                var value = self.data.value / 100;
                if (self.data.checked)
                {
                    value = 0;
                }
                audio_sound_gain(o_options.track_res, value, 0);
            },
            
            has_slider: true,
            has_checkbox: true,
            checkbox_text: __("Mute")
        }),
        mute_when_afk: new Option(id, 
        {
            index: 30100,
            name: __("Mute when AFK"),
            description: __("Mute game sounds and music when AFK mode is activated."),
            section: global.dialog_sections.options.sound,
            toggle: true,
            data: 
            {
                value: false
            },
            
            change: function()
            {
                if (get_option(global.options.mute_when_afk) && is_afk())
                {
                    audio_stop_all();
                }
            }
        }),
        hotkeys_reset: new Option(id, 
        {
            index: 49999,
            name: __("Reset Hotkeys"),
            section: global.dialog_sections.options.hotkeys,
            toggle: true,
            data: 
            {
                value: false
            },
            button_text: __("Reset"),
            
            change: function(arg0)
            {
                if (!arg0)
                {
                    exit;
                }
                confirm_dialog("Do you really want to reset all hotkeys?", function()
                {
                    var __struct = global.hotkeys;
                    var __prop_names = struct_get_names(__struct);
                    var __prop_len = array_length(__prop_names);
                    for (var __i = 0; __i < __prop_len; __i++)
                    {
                        var mkey = __prop_names[__i];
                        var mitem = variable_struct_get(__struct, mkey);
                        var opt_key = sprintf("hotkey_%s", mitem.key);
                        if (!is_undefined(variable_struct_get(global.options, opt_key)))
                        {
                            (variable_struct_get(global.options, opt_key)).reset();
                        }
                    }
                    init_nav_items();
                    return -1;
                });
            }
        }),
        afk_mode: new Option(id, 
        {
            index: 50003,
            name: __("AFK Mode"),
            description: __("Activates a dark screen overlay to reduce screen burning and improve battery life. Frame rate will be reduced drastically. This does not affect gameplay frames."),
            section: global.dialog_sections.options.misc,
            data: 
            {
                value: 0
            },
            
            change: function(arg0)
            {
                if (!arg0)
                {
                    exit;
                }
                if (instance_exists(o_overlay))
                {
                    exit;
                }
                instance_create_layer(0, 0, global.layers.overlay, o_overlay);
            },
            
            visible_in_options: true
        }),
        afk_mode_lost_focus: new Option(id, 
        {
            index: 50003.1,
            name: __("AFK Mode Lost Focus"),
            
            description: function()
            {
                return __s("Activates %s when the game window lost focus.", __("AFK Mode"));
            },
            
            section: global.dialog_sections.options.misc,
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: global.is_pc
        }),
        autosave_interval: new Option(id, 
        {
            index: 50005,
            name: __("Autosave interval"),
            section: global.dialog_sections.options.misc,
            data: 
            {
                value: 2
            },
            options: [
            {
                value: 60,
                text: format_time(60, false, true)
            }, 
            {
                value: 120,
                text: format_time(120, false, true)
            }, 
            {
                value: 300,
                text: format_time(300, false, true)
            }, 
            {
                value: 600,
                text: format_time(600, false, true)
            }, 
            {
                value: 1800,
                text: format_time(1800, false, true)
            }, 
            {
                value: 3600,
                text: format_time(3600, false, true)
            }],
            
            change: function()
            {
                with (o_game)
                {
                    alarm[2] = sec(get_option(global.options.autosave_interval));
                }
            }
        }),
        autoupgrade_count: new Option(id, 
        {
            index: 50010,
            name: __("Autoupgrade Count"),
            description: __("The Autoupgrade Bot's max bought items per cycle. Reduce this value if your game stutters every second. Default: 300."),
            section: global.dialog_sections.options.misc,
            data: 
            {
                value: global.is_mobile ? 100 : 300
            },
            has_slider: true,
            slider_min: 100,
            slider_max: 1000,
            slider_step: 100
        }),
        apply_ua_timer: new Option(id, 
        {
            index: 50011,
            name: __("Apply upgrades interval"),
            
            description: function()
            {
                return concatstr(__s("All upgrades and bonuses are applied at this interval. Reducing this timer may reduce performance but upgrades and bonuses are applied faster."), " ", __s("Default: %s", "5s"));
            },
            
            section: global.dialog_sections.options.misc,
            data: 
            {
                value: 2
            },
            options: [
            {
                value: 1,
                text: format_time(1, undefined, true)
            }, 
            {
                value: 3,
                text: format_time(3, undefined, true)
            }, 
            {
                value: 5,
                text: format_time(5, undefined, true)
            }, 
            {
                value: 15,
                text: format_time(15, undefined, true)
            }, 
            {
                value: 30,
                text: format_time(30, undefined, true)
            }, 
            {
                value: 60,
                text: format_time(60, undefined, true)
            }],
            
            change: function()
            {
                global.next_ua_apply_timer = o_game.data.stats.time_elapsed + sec(get_option(global.options.apply_ua_timer));
                init_game_vars(true);
            }
        }),
        skip_to_start: new Option(id, 
        {
            index: 50020,
            name: __("Skip to start"),
            description: __("Automatically load the main game file without showing the menu. If you play on Steam, the main menu will always show if the local and cloud save files are different."),
            section: global.dialog_sections.options.misc,
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: global.is_pc
        }),
        upload_save: new Option(id, 
        {
            index: 50100,
            name: __("Upload Save to Cloud"),
            section: global.dialog_sections.options.misc,
            description: __("Automatically upload the save game to your Humble North account. This option also needs to be enabled for multiplayer/cloud services. More info: humblenorth.de/privacy-police"),
            toggle: true,
            data: 
            {
                value: true
            },
            visible_in_options: !global.is_ios
        }),
        upload_save_android: new Option(id, 
        {
            index: 50101,
            name: __("Upload Save to Google"),
            section: global.dialog_sections.options.misc,
            description: __("Automatically upload the save game to your Google Play account."),
            toggle: true,
            data: 
            {
                value: true
            },
            visible_in_options: global.is_android || global.debug,
            
            add_draw: function(arg0, arg1)
            {
                var bx = arg0 + gui_col_x(11);
                if (GooglePlayServices_IsSignedIn())
                {
                    if (gui_button_tl(bx, arg1, __("Log out"), gui_col_x(2.75)))
                    {
                        notify(__("Signing out..."));
                        GooglePlayServices_SignOut();
                    }
                }
                else if (gui_button_tl(bx, arg1, __("Log in"), gui_col_x(2.75)))
                {
                    GooglePlayServices_StartSignInIntent();
                }
            }
        }),
        hard_reset: new Option(id, 
        {
            index: 50200,
            name: __("Hard reset"),
            section: global.dialog_sections.options.misc,
            description: __("This will delete both your local and steam save file."),
            toggle: true,
            data: 
            {
                value: false
            },
            
            button_text: function()
            {
                return "Reset";
            },
            
            change: function(arg0)
            {
                if (!arg0)
                {
                    exit;
                }
                confirm_dialog("Do you really want to reset the game?", function()
                {
                    delete_game();
                    game_restart_adv();
                    return -1;
                }, undefined, undefined, 
                {
                    force_confirm: true
                });
            },
            
            visible_in_options: function()
            {
                return !global.cloud_data.is_season;
            }
        }),
        send_game_report: new Option(id, 
        {
            index: 50300,
            
            name: function()
            {
                var text = __("Send game report");
                if (!is_empty(o_game.data.last_report_id))
                {
                    text += sprintf(" [ID: %s]", o_game.data.last_report_id);
                }
                return text;
            },
            
            section: global.dialog_sections.options.misc,
            description: __("Creates and sends a game report so I can analyse it if something goes wrong."),
            button_text: __("Send report"),
            
            change: function(arg0)
            {
                if (!arg0)
                {
                    exit;
                }
                if ((o_game.data.last_report_upload + sec(300)) > o_game.data.stats.time_elapsed)
                {
                    return false;
                }
                o_game.data.last_report_upload = o_game.data.stats.time_elapsed;
                notify(__("Creating game report..."));
                var save_data_wrapper = get_empty_wrapper_data();
                var save_data_string = get_save_data(save_data_wrapper);
                var stats_text_array = [];
                var __array = variable_struct_get(o_shop.shop_items, UnknownEnum.Value_90);
                var __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    array_push(stats_text_array, get_value_ext(mitem, mitem.text));
                }
                var stats_text = implode("\n\n", stats_text_array);
                var google_account_info = undefined;
                if (global.is_android)
                {
                    google_account_info = o_mobile_helper.accountInfo;
                }
                var data = 
                {
                    connected_to_google: GooglePlayServices_IsSignedIn(),
                    google_account_info: google_account_info,
                    daily_reward: get_daily_reward_resources(),
                    dlc_shop: get_shop_data(global.shops.dlc),
                    gems_shop: get_shop_data(global.shops.gems),
                    logged_in: mp_is_logged_in(),
                    options: get_options_data(true),
                    stats: stats_text,
                    upgrade_attributes: get_upgrade_attributes_data(),
                    version: global.game_version
                };
                if (global.is_android)
                {
                    data.google_purchase_data = o_mobile_helper.purchasesData;
                }
                if (global.is_ios)
                {
                    data.ios_purchase_data = o_mobile_helper.purchasesData;
                }
                var data_final = 
                {
                    report_data: base64_encode(json_stringify(data)),
                    save_data: save_data_string
                };
                post_to_cloud("misc", "game_report", data_final, function(arg0)
                {
                    notify(__s("Report sent. ID: %s", arg0.id));
                    o_game.data.last_report_id = arg0.id;
                }, function(arg0)
                {
                    notify_error(__("Unable to send report, please try again later."));
                });
            },
            
            check: function()
            {
                if (!instance_exists(o_game))
                {
                    return false;
                }
                return (o_game.data.last_report_upload + sec(300)) < o_game.data.stats.time_elapsed;
            }
        }),
        force_season_save: new Option(id, 
        {
            index: 55000,
            name: __("Force Season Save"),
            section: global.dialog_sections.options.misc,
            description: __("This will force-try season saving. Only use this if you can't save your season progress regularly."),
            toggle: true,
            data: 
            {
                value: false
            },
            button_text: __("Force save"),
            
            change: function(arg0)
            {
                if (!arg0)
                {
                    exit;
                }
                if (!can_upload_season_save())
                {
                    return notify(__("Can't force-upload season save yet. Please wait a few minutes."));
                }
                reset_cloud_save();
                global.cloud_data.last_season_upload_manual = get_time_object();
                save_game();
            },
            
            check: function()
            {
                return can_upload_season_save();
            },
            
            visible_in_options: function()
            {
                return mp_is_season();
            }
        }),
        window_data: new Option(id, 
        {
            index: -1,
            data: 
            {
                value: 
                {
                    width: -1,
                    height: -1,
                    x: -1,
                    y: -1
                }
            },
            visible_in_options: false
        }),
        autocraft: new Option(id, 
        {
            index: 5000039,
            name: __("Auto craft"),
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: false
        }),
        auto_salvage_crafted_leaf: new Option(id, 
        {
            index: 5000040,
            name: __("Auto salvage"),
            data: 
            {
                value: 0
            },
            options: [
            {
                text: __("Off"),
                value: "off"
            }, 
            {
                text: __("Backpack"),
                value: "backpack"
            }, 
            {
                text: __("All"),
                value: "all"
            }],
            visible_in_options: false,
            
            click: function()
            {
                set_timeout("auto_salvage_timeout", sec(5));
            }
        }),
        auto_salvage_crafted_leaf_type: new Option(id, 
        {
            index: 5000041,
            name: __("Salvage rarity"),
            data: 
            {
                value: 0
            },
            
            init_late: function()
            {
                var options = [];
                var __array = global.craft_leaf_types_rarity_array;
                var __prop_len = array_length(__array);
                var __i = __prop_len - 1;
                while (__i >= 0)
                {
                    var mitem = __array[__i];
                    var __ireal = __prop_len - 1 - __i;
                    array_push(options, 
                    {
                        value: mitem.key,
                        text: mitem.name
                    });
                    __i--;
                }
                self.options = options;
            },
            
            visible_in_options: false,
            
            click: function()
            {
                set_timeout("auto_salvage_timeout", sec(5));
            }
        }),
        cards_auto_ascend: new Option(id, 
        {
            index: 5000038,
            name: __s("Auto %s", __("Ascend")),
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: false
        }),
        cards_auto_ascend_type: new Option(id, 
        {
            index: 5000038,
            name: "",
            data: 
            {
                value: 0
            },
            visible_in_options: false,
            options: [
            {
                value: "full",
                text: __("Full")
            }, 
            {
                value: "asap",
                text: __("ASAP")
            }, 
            {
                value: "50",
                text: "50%"
            }, 
            {
                value: "95",
                text: "95%"
            }, 
            {
                value: "max-10",
                text: __s("Max -%s", 10)
            }]
        }),
        cards_auto_transcend: new Option(id, 
        {
            index: 5000038,
            name: __s("Auto %s", __("Transcend")),
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: false
        }),
        cards_auto_transcend_type: new Option(id, 
        {
            index: 5000038,
            name: "",
            data: 
            {
                value: 0
            },
            visible_in_options: false,
            options: [
            {
                value: "regular",
                text: __("Regular")
            }, 
            {
                value: "boss",
                text: __("Boss")
            }, 
            {
                value: "all",
                text: __("All")
            }]
        }),
        cards_packs_open_multiplier: new Option(id, 
        {
            index: 5000038,
            name: __("Open multiplier"),
            data: 
            {
                value: 0
            },
            visible_in_options: false,
            options: [
            {
                value: 1,
                text: "1x"
            }, 
            {
                value: 10,
                text: "10x"
            }, 
            {
                value: 100,
                text: "100x"
            }, 
            {
                value: 1000,
                text: "1kx"
            }, 
            {
                value: 10000,
                text: "10kx"
            }, 
            {
                value: 100000,
                text: "100kx"
            }, 
            {
                value: 1000000,
                text: "1mx"
            }, 
            {
                value: 10000000,
                text: "10mx"
            }, 
            {
                value: 100000000,
                text: "100mx"
            }]
        }),
        cards_packs_buy_multiplier: new Option(id, 
        {
            index: 5000038,
            name: __("Buy multiplier"),
            data: 
            {
                value: 0
            },
            visible_in_options: false,
            options: [
            {
                value: 1,
                text: "1x"
            }, 
            {
                value: 10,
                text: "10x"
            }, 
            {
                value: 100,
                text: "100x"
            }, 
            {
                value: 1000,
                text: "1kx"
            }, 
            {
                value: 10000,
                text: "10kx"
            }, 
            {
                value: 100000,
                text: "100kx"
            }, 
            {
                value: 1000000,
                text: "1mx"
            }, 
            {
                value: 10000000,
                text: "10mx"
            }, 
            {
                value: 100000000,
                text: "100mx"
            }]
        }),
        borbventure_packs_open_multiplier: new Option(id, 
        {
            index: 5000038,
            name: __("Open multiplier"),
            data: 
            {
                value: 0
            },
            visible_in_options: false,
            options: [
            {
                value: 1,
                text: "1x"
            }, 
            {
                value: 10,
                text: "10x"
            }, 
            {
                value: 100,
                text: "100x"
            }, 
            {
                value: 1000,
                text: "1kx"
            }, 
            {
                value: 10000,
                text: "10kx"
            }, 
            {
                value: 100000,
                text: "100kx"
            }, 
            {
                value: 1000000,
                text: "1mx"
            }, 
            {
                value: 10000000,
                text: "10mx"
            }, 
            {
                value: 100000000,
                text: "100mx"
            }]
        }),
        borbventure_packs_buy_multiplier: new Option(id, 
        {
            index: 5000038,
            name: __("Buy multiplier"),
            data: 
            {
                value: 0
            },
            visible_in_options: false,
            options: [
            {
                value: 1,
                text: "1x"
            }, 
            {
                value: 10,
                text: "10x"
            }, 
            {
                value: 100,
                text: "100x"
            }, 
            {
                value: 1000,
                text: "1kx"
            }, 
            {
                value: 10000,
                text: "10kx"
            }, 
            {
                value: 100000,
                text: "100kx"
            }, 
            {
                value: 1000000,
                text: "1mx"
            }, 
            {
                value: 10000000,
                text: "10mx"
            }, 
            {
                value: 100000000,
                text: "100mx"
            }]
        }),
        claw_auto_play: new Option(id, 
        {
            index: 5000038,
            name: __("Auto play"),
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: false
        }),
        converter_batch_enabled: new Option(id, 
        {
            index: 5000036,
            name: __("Converter batch enabled"),
            toggle: true,
            data: 
            {
                value: true
            },
            visible_in_options: false
        }),
        craft_autofuse: new Option(id, 
        {
            name: __("Autofuse enabled"),
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: false
        }),
        craft_autofuse_type: new Option(id, 
        {
            name: __("Autofuse type"),
            data: 
            {
                value: 0
            },
            
            init_late: function()
            {
                var options = [];
                var __array = global.craft_leaf_types_rarity_array;
                var __prop_len = array_length(__array);
                var __i = __prop_len - 1;
                while (__i >= 0)
                {
                    var mitem = __array[__i];
                    var __ireal = __prop_len - 1 - __i;
                    array_push(options, 
                    {
                        value: mitem.key,
                        text: mitem.name
                    });
                    __i--;
                }
                self.options = options;
            },
            
            visible_in_options: false
        }),
        slots_auto_play: new Option(id, 
        {
            index: 5000037,
            name: __("Auto play"),
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: false
        }),
        slots_auto_play_closed: new Option(id, 
        {
            index: 50000371,
            name: __("Auto passive play"),
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: false
        }),
        claw_auto_play_closed: new Option(id, 
        {
            index: 50000381,
            name: __("Auto passive play"),
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: false
        }),
        trades_auto_refresh: new Option(id, 
        {
            index: 5000038,
            name: __("Auto refresh"),
            toggle: true,
            data: 
            {
                value: true
            },
            visible_in_options: false
        }),
        borbventures_auto_start: new Option(id, 
        {
            index: 5000038,
            name: __("Auto start"),
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: false
        }),
        borbventures_auto_start_min_chance: new Option(id, 
        {
            name: __("Min chance"),
            has_slider: true,
            slider_min: 0,
            slider_max: 100,
            slider_step: 5,
            button_text_affix: "%",
            data: 
            {
                value: 0
            },
            visible_in_options: false
        }),
        borbventures_auto_finish: new Option(id, 
        {
            name: __("Auto finish"),
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: false
        }),
        daily_quest_auto_claim: new Option(id, 
        {
            name: __("Auto claim"),
            toggle: true,
            data: 
            {
                value: true
            },
            visible_in_options: false
        }),
        borbventures_auto_salvage: new Option(id, 
        {
            name: __("Auto salvage"),
            description: __("If the inventory is full, the item reward is salvaged when a Borbventure is finished."),
            toggle: true,
            data: 
            {
                value: true
            },
            visible_in_options: false
        }),
        borbventures_detailed_info: new Option(id, 
        {
            index: 5000038,
            name: __("Detailed"),
            toggle: true,
            data: 
            {
                value: true
            },
            visible_in_options: false
        }),
        borbventures_inventory_padding: new Option(id, 
        {
            options: [
            {
                value: "default",
                text: __("Default")
            }, 
            {
                value: "compact",
                text: __("Compact")
            }],
            data: 
            {
                value: 0
            },
            visible_in_options: false
        }),
        borbventures_inventory_sort_type: new Option(id, 
        {
            options: [
            {
                value: UnknownEnum.Value_0,
                text: __("Rarity")
            }, 
            {
                value: UnknownEnum.Value_1,
                text: __("Type")
            }],
            visible_in_options: false
        }),
        borbventures_inventory_sort_dir: new Option(id, 
        {
            options: [
            {
                value: "asc",
                text: __("Ascending")
            }, 
            {
                value: "desc",
                text: __("Descending")
            }],
            visible_in_options: false
        }),
        fishing_fish_sort_dir: new Sort_Dir_Option(id),
        fishing_fish_sort_type: new Sort_Type_Option(id),
        trades_detailed_info: new Option(id, 
        {
            index: 5000038,
            name: __("Detailed"),
            toggle: true,
            data: 
            {
                value: true
            },
            visible_in_options: false
        }),
        leafscenders_autouse_bot: new Option(id, 
        {
            index: 5000038,
            name: __("Auto leafscend enabled"),
            toggle: true,
            data: 
            {
                value: true
            },
            visible_in_options: false
        }),
        leafscenders_safe_mode: new Option(id, 
        {
            index: 5000038,
            name: __("Safe mode"),
            description: __s("Automatic leafscensions keep %s %s in reserve.", 1, pluralize(1, __("leaf"), __("leaves"))),
            toggle: true,
            data: 
            {
                value: true
            },
            visible_in_options: false
        }),
        selection_quantity: new Option(id, 
        {
            index: 5000039,
            name: "",
            reset_at_startup: true,
            data: 
            {
                value: 0
            },
            options: [
            {
                text: "1x",
                value: 1
            }, 
            {
                text: "10x",
                value: 10
            }, 
            {
                text: "25x",
                value: 25
            }, 
            {
                text: "100x",
                value: 100
            }, 
            {
                text: "250x",
                value: 250
            }, 
            {
                text: "500x",
                value: 500
            }, 
            {
                text: "1000x",
                value: 1000
            }, 
            {
                text: "2500x",
                value: 2500
            }, 
            {
                text: "25000x",
                value: 25000
            }],
            visible_in_options: false
        }),
        selection_quantity_sign: new Option(id, 
        {
            index: 5000040,
            name: "",
            reset_at_startup: true,
            data: 
            {
                value: 0
            },
            options: [
            {
                text: "+",
                value: 1
            }, 
            {
                text: "-",
                value: -1
            }],
            visible_in_options: false
        }),
        resource_draw_selection: new Option(id, 
        {
            index: 5000050,
            name: "",
            data: 
            {
                value: 0
            },
            options: [
            {
                text: __("Resources"),
                sprite: spr_leaf_basic,
                value: UnknownEnum.Value_0,
                is_visible: __return_true
            }, 
            {
                text: __("Materials"),
                sprite: spr_material_copper_bar,
                value: UnknownEnum.Value_1,
                
                is_visible: function()
                {
                    return get_upgrade_count(global.shops.blc.unlock_materials) > 0;
                }
            }, 
            {
                text: __("Leafscended Leaves"),
                sprite: spr_icon_leafscension,
                value: UnknownEnum.Value_2,
                
                is_visible: function()
                {
                    return get_upgrade_count(global.shops.sacred.unlock_relics) > 0;
                }
            }, 
            {
                text: __("Boss Timers"),
                sprite: spr_boss_witch,
                value: UnknownEnum.Value_3,
                
                is_visible: function()
                {
                    return get_upgrade_count(global.shops.gems.show_boss_area_timer) > 0 && global.areas.kokkaupunki_cursed.data.count > 0;
                }
            }, 
            {
                text: __("Event"),
                sprite: spr_icon_event,
                value: UnknownEnum.Value_4,
                
                is_visible: function()
                {
                    return is_any_event_active();
                }
            }, 
            {
                text: __("Favorites"),
                sprite: spr_star,
                value: UnknownEnum.Value_5,
                
                is_visible: function()
                {
                    return get_upgrade_count(global.shops.blc.autobuy_priority) > 0;
                }
            }, 
            {
                text: __("None"),
                sprite: spr_solid,
                value: UnknownEnum.Value_6,
                is_visible: __return_true
            }],
            visible_in_options: false,
            
            change: function()
            {
                if (!instance_exists(o_game))
                {
                    exit;
                }
                o_game.refresh_surface = true;
                o_game.resource_nav_items_remaining = false;
                o_game.resource_nav_page_index = 0;
                o_game.resource_nav_page_next = 0;
            }
        }),
        house_action: new Option(id, 
        {
            index: 5000050,
            name: "",
            data: 
            {
                value: 0
            },
            reset_at_startup: true,
            options: [
            {
                text: __("Place"),
                sprite: spr_gui_arrow_down_double,
                value: UnknownEnum.Value_0,
                is_visible: __return_true
            }, 
            {
                text: __("Move"),
                sprite: spr_gui_move,
                value: UnknownEnum.Value_1,
                is_visible: __return_true
            }, 
            {
                text: __("Erase"),
                sprite: spr_icon_cancel,
                value: UnknownEnum.Value_2,
                is_visible: __return_true
            }],
            visible_in_options: false,
            
            change: function()
            {
            }
        }),
        autobuy_resource_threshold: new Option(id, 
        {
            index: 5000050,
            name: __("Autobuy Resource Threshold"),
            data: 
            {
                value: 100
            },
            
            button_text: function()
            {
                return sprintf("%s%", self.data.value);
            },
            
            has_slider: true,
            visible_in_options: false
        }),
        enable_salvage_cards: new Option(id, 
        {
            index: 5000050,
            name: __("Enable salvage/transcension"),
            toggle: true,
            data: 
            {
                value: true
            },
            visible_in_options: false
        }),
        borbventure_scale_min_level: new Option(id, 
        {
            index: 5000050,
            name: __("Scale min level"),
            toggle: true,
            data: 
            {
                value: true
            },
            visible_in_options: false
        }),
        auto_roll: new Option(id, 
        {
            index: 5000050,
            name: __s("Auto roll"),
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: false
        }),
        auto_power_roll: new Option(id, 
        {
            index: 5000050,
            name: __s("Auto power roll"),
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: false
        }),
        auto_roll_inventory: new Option(id, 
        {
            index: 5000050,
            name: __s("Auto roll %s", __("inventory")),
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: false
        }),
        auto_roll_backpack: new Option(id, 
        {
            index: 5000050,
            name: __s("Auto roll %s", __("backpack")),
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: false
        }),
        dice_battlefield_auto_roll: new Option(id, 
        {
            index: 5000050,
            name: __("Auto roll"),
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: false
        }),
        dice_battlefield_auto_progress: new Option(id, 
        {
            index: 5000051,
            name: __("Auto progress"),
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: false
        }),
        dice_battlefield_auto_progress_type: new Option(id, 
        {
            index: 5000052,
            name: __("Progress"),
            data: 
            {
                value: 0
            },
            options: [
            {
                value: "level",
                text: __("Level")
            }, 
            {
                value: "max_level",
                text: __("Max level")
            }, 
            {
                value: "rarity",
                text: __("Difficulty")
            }],
            visible_in_options: false
        }),
        dice_cursed_auto_roll: new Option(id, 
        {
            index: 5000060,
            name: __("Auto roll"),
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: false
        }),
        dice_cursed_auto_save: new Option(id, 
        {
            index: 5000061,
            name: __("Auto save"),
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: false
        }),
        dice_cursed_auto_save_value: new Option(id, 
        {
            index: 5000062,
            name: __("Auto save value"),
            data: 
            {
                value: 0
            },
            has_slider: true,
            slider_min: 0,
            slider_max: undefined,
            slider_step: 1,
            visible_in_options: false
        }),
        dice_inventory_show_count: new Option(id, 
        {
            index: 5000050,
            name: __("Show count"),
            toggle: true,
            data: 
            {
                value: true
            },
            visible_in_options: false
        }),
        mines_scale_min_level: new Option(id, 
        {
            index: 5000050,
            name: __("Scale min level"),
            toggle: true,
            data: 
            {
                value: true
            },
            visible_in_options: false
        }),
        mines_auto_search_mine: new Option(id, 
        {
            index: 5000050,
            name: __("Auto search"),
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: false
        }),
        mines_auto_mine_cave: new Option(id, 
        {
            index: 5000050,
            name: __("Auto mine"),
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: false
        }),
        mines_auto_claim_cave: new Option(id, 
        {
            index: 5000050,
            name: __("Auto claim"),
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: false
        }),
        mines_auto_remove_cave: new Option(id, 
        {
            index: 5000050,
            name: __("Auto remove"),
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: false
        }),
        mines_auto_start_drill: new Option(id, 
        {
            index: 5000050,
            name: __("Auto drill"),
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: false
        }),
        mines_auto_mine_vein: new Option(id, 
        {
            index: 5000050,
            name: __("Auto mine"),
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: false
        }),
        mines_auto_search_vein: new Option(id, 
        {
            index: 5000050,
            name: __("Auto search"),
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: false
        }),
        mines_auto_remove_vein: new Option(id, 
        {
            index: 5000050,
            name: __("Auto remove"),
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: false
        }),
        mines_auto_enhance_vein: new Option(id, 
        {
            index: 5000050,
            name: __("Auto enhance"),
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: false
        }),
        mines_depth_drill_active: new Option(id, 
        {
            index: 5000050,
            name: __("Drill active"),
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: false
        }),
        transmute_count: new Option(id, 
        {
            index: 5000050,
            name: __("Auto transmute count"),
            options: [
            {
                value: 1,
                text: "1"
            }, 
            {
                value: "max",
                text: __("Max")
            }],
            data: 
            {
                value: 0
            },
            visible_in_options: false
        }),
        sc_auto_attack: new Option(id, 
        {
            name: __s("Auto attack"),
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: false
        }),
        sc_auto_attack_safe: new Option(id, 
        {
            name: __s("Safe attack"),
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: false,
            tooltip: __("Only attack when HP is higher than the opponent's min damage.")
        }),
        sc_auto_rest: new Option(id, 
        {
            name: __s("Auto rest"),
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: false
        }),
        sc_auto_revive: new Option(id, 
        {
            name: __s("Auto revive"),
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: false
        }),
        sc_auto_advance: new Option(id, 
        {
            name: __s("Auto advance"),
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: false
        }),
        sc_auto_advance_safe: new Option(id, 
        {
            name: __s("Safe advance"),
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: false,
            
            change: function()
            {
                global.shadow_crystal.data.safe_climbing = true;
                global.shadow_crystal.data.safe_level = 0;
            }
        }),
        sp_auto_throw_dusk: new Option(id, 
        {
            index: 5000050,
            name: __s("Auto"),
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: false
        }),
        sp_auto_throw_se: new Option(id, 
        {
            index: 5000050,
            name: __s("Auto"),
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: false
        }),
        sp_auto_throw_sc: new Option(id, 
        {
            index: 5000050,
            name: __s("Auto"),
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: false
        }),
        quark_reactor_auto_add: new Option(id, 
        {
            index: 5001000,
            name: __s("Auto add %s", __("Quarks")),
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: false
        }),
        quark_reactor_auto_add_settings: new Option(id, 
        {
            index: 5001000,
            name: __s("Add chance threshold"),
            data: 
            {
                value: 0
            },
            visible_in_options: false,
            options: [
            {
                value: "full",
                text: __("Full")
            }, 
            {
                value: 0.5,
                text: "50%"
            }, 
            {
                value: 1,
                text: "100%"
            }, 
            {
                value: 2,
                text: "200%"
            }, 
            {
                value: 3,
                text: "300%"
            }, 
            {
                value: 4,
                text: "400%"
            }, 
            {
                value: 5,
                text: "500%"
            }]
        }),
        quark_reactor_auto_quarkstige: new Option(id, 
        {
            index: 5001010,
            name: __s("Auto %s", __("Quarkstige")),
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: false
        }),
        quark_auto_funnel: new Option(id, 
        {
            name: __s("Auto %s", __("Funnel")),
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: false
        }),
        quark_auto_structurize: new Option(id, 
        {
            name: __s("Auto %s", __("Structurize")),
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: false
        }),
        quark_auto_structurize_value: new Option(id, 
        {
            name: "",
            data: 
            {
                value: 0
            },
            visible_in_options: false,
            options: [
            {
                value: "asap",
                text: ">=1"
            }, 
            {
                value: 0.25,
                text: "25%"
            }, 
            {
                value: 0.5,
                text: "50%"
            }, 
            {
                value: 0.75,
                text: "75%"
            }, 
            {
                value: "full",
                text: __("Full")
            }]
        }),
        quark_auto_quantify: new Option(id, 
        {
            name: __s("Auto %s", __("Quantify")),
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: false
        }),
        quark_auto_leaftonify: new Option(id, 
        {
            name: __s("Auto %s", __("Leaftonify")),
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: false
        }),
        harbor_container_auto_add_job_leaves: new Option(id, 
        {
            name: __("Auto add leaves"),
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: false
        }),
        harbor_jobs_auto_start: new Option(id, 
        {
            name: __("Auto start"),
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: false
        }),
        harbor_jobs_auto_claim: new Option(id, 
        {
            name: __("Auto claim"),
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: false
        }),
        harbor_jobs_auto_refresh: new Option(id, 
        {
            name: __("Auto refresh"),
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: false
        }),
        harbor_ships_auto_embark: new Option(id, 
        {
            name: __("Auto embark"),
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: false
        }),
        harbor_ships_auto_claim: new Option(id, 
        {
            name: __("Auto claim"),
            toggle: true,
            data: 
            {
                value: false
            },
            visible_in_options: false
        }),
        artifact_list_padding: new Option(id, 
        {
            name: __("Detailed"),
            options: [
            {
                value: "default",
                text: __("Default")
            }, 
            {
                value: "compact",
                text: __("Compact")
            }],
            data: 
            {
                value: 0
            },
            visible_in_options: false
        }),
        alchemy_autobrew_enabled: new Option(id, 
        {
            name: __("Autobrew"),
            data: 
            {
                value: true
            },
            toggle: true,
            visible_in_options: false
        }),
        relics_transmute_all_count: new Option(id, 
        {
            name: __("Count"),
            data: 
            {
                value: 0
            },
            tooltip: __("How often leafscended leaves should be transmuted."),
            visible_in_options: false,
            options: [
            {
                value: 1,
                text: "1"
            }, 
            {
                value: "max",
                text: "max"
            }]
        }),
        relics_transmute_all_rarity: new Option(id, 
        {
            name: __("Rarity"),
            data: 
            {
                value: 0
            },
            visible_in_options: false,
            tooltip: __("If 'current' is selected, only the Relics from the currently selected rarity will be transmuted."),
            options: [
            {
                value: "current",
                text: __("Current")
            }, 
            {
                value: "all",
                text: __("All")
            }]
        }),
        hide_completed_achievements: new Option(id, 
        {
            name: __("Hide completed achievements"),
            data: 
            {
                value: false
            },
            toggle: true,
            visible_in_options: false
        }),
        auto_boosters_enabled: new Option(id, 
        {
            name: __("Auto boost"),
            data: 
            {
                value: false
            },
            toggle: true,
            visible_in_options: false
        }),
        auto_play_boostergame: new Option(id, 
        {
            name: __("Auto play"),
            data: 
            {
                value: false
            },
            toggle: true,
            visible_in_options: false
        }),
        auto_craft_bv_items: new Option(id, 
        {
            name: __("Auto craft"),
            data: 
            {
                value: false
            },
            toggle: true,
            visible_in_options: false
        }),
        auto_fishing: new Option(id, 
        {
            name: __("Auto fishing"),
            data: 
            {
                value: false
            },
            toggle: true,
            visible_in_options: false
        }),
        auto_fishing_threshold: new Option(id, 
        {
            name: __("Min chance"),
            data: 
            {
                value: 100
            },
            has_slider: true,
            slider_step: 5,
            slider_max: 100,
            button_text_affix: "%",
            visible_in_options: false
        }),
        auto_fertilize_baits: new Option(id, 
        {
            name: __("Auto fertilize"),
            data: 
            {
                value: false
            },
            toggle: true,
            visible_in_options: false
        }),
        auto_collect_baits: new Option(id, 
        {
            name: __("Auto collect"),
            data: 
            {
                value: false
            },
            toggle: true,
            visible_in_options: false
        }),
        auto_advance_candle_minigame: new Option(id, 
        {
            name: __("Auto advance/restart"),
            data: 
            {
                value: false
            },
            toggle: true,
            visible_in_options: false,
            
            func: function(arg0, arg1)
            {
                if (instance_exists(o_minigame_candle))
                {
                    o_minigame_candle.auto_advance_enabled = arg1;
                }
            }
        }),
        auto_blow_candle_minigame: new Option(id, 
        {
            name: __("Auto blow"),
            data: 
            {
                value: false
            },
            toggle: true,
            visible_in_options: false
        }),
        minigame_cursed_upgrades_enabled: new Option(id, 
        {
            name: __("Upgrades enabled"),
            data: 
            {
                value: true
            },
            toggle: true,
            visible_in_options: false
        }),
        auto_journey_finish: new Option(id, 
        {
            name: __("Auto claim/finish"),
            data: 
            {
                value: true
            },
            toggle: true,
            visible_in_options: false
        })
    };
    add_keys_to_struct(global.options);
    global.options_sorted = struct_to_sorted_array(global.options);
    init_hotkeys();
}

function init_options_late()
{
    init_hotkeys_late();
    var __struct = global.options;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        call_method(mitem, mitem.init_late);
        call_method(mitem, mitem.init_late_after);
    }
    add_keys_to_struct(global.options);
    global.options_sorted = struct_to_sorted_array(global.options);
    global.options_sections = {};
    var __array = global.options_sorted;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (is_undefined(variable_struct_get(global.options_sections, mitem.section.key)))
        {
            variable_struct_set(global.options_sections, mitem.section.key, []);
        }
        array_push(variable_struct_get(global.options_sections, mitem.section.key), mitem);
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
    Value_6,
    Value_90 = 90
}
