function init_dialog_actions()
{
    global.dialog_actions = 
    {
        account: [new Gui_Item(UnknownEnum.Value_18, -1, 
        {
            func: gui_item_account
        })],
        claim_rewards: [],
        cloud_saves: [new Gui_Item(UnknownEnum.Value_18, -1, 
        {
            func: gui_item_cloud_saves
        })],
        guilds: [new Gui_Item(UnknownEnum.Value_6, -1, 
        {
            button_text: __("Create Guild"),
            
            is_visible: function()
            {
                return is_undefined(global.cloud_data.guild);
            },
            
            func: function()
            {
                open_dialog("guilds_create");
            }
        }), new Gui_Item(UnknownEnum.Value_6, -1, 
        {
            button_text: __("Join Guild"),
            
            is_visible: function()
            {
                return is_undefined(global.cloud_data.guild);
            },
            
            func: function()
            {
                open_dialog("guilds_join");
            }
        }), new Gui_Item(UnknownEnum.Value_6, -1, 
        {
            button_text: __("Guild info"),
            
            is_visible: function()
            {
                return !is_undefined(global.cloud_data.guild);
            },
            
            func: function()
            {
                open_dialog("guilds_info");
            }
        }), new Gui_Item(UnknownEnum.Value_6, -1, 
        {
            button_text: __("Members"),
            
            is_visible: function()
            {
                return !is_undefined(global.cloud_data.guild);
            },
            
            func: function()
            {
                open_dialog("guilds_members");
            }
        }), new Gui_Item(UnknownEnum.Value_6, -1, 
        {
            button_text: __("Upgrades"),
            
            is_visible: function()
            {
                return !is_undefined(global.cloud_data.guild);
            },
            
            func: function()
            {
                open_dialog("guilds_upgrades");
            }
        }), new Gui_Item(UnknownEnum.Value_6, -1, 
        {
            button_text: __("Toggle Public Status"),
            
            text_below: function()
            {
                return __s("Current status: %s", get_default_struct_value(global.cloud_data.guild.data, "private", false) ? __("Private") : __("Public"));
            },
            
            check: function()
            {
                return is_undefined(get_async_data_by_name("guild_toggle_status")) && !has_timeout("guild_toggle_status");
            },
            
            is_visible: function()
            {
                return is_guild_owner();
            },
            
            func: function()
            {
                guild_toggle_status();
            }
        }), new Gui_Item(UnknownEnum.Value_51, -1, 
        {
            height: 60
        }), new Gui_Item(UnknownEnum.Value_6, -1, 
        {
            button_text: __("Search Guild"),
            
            func: function()
            {
                open_dialog("guilds_search");
            }
        }), new Gui_Item(UnknownEnum.Value_6, -1, 
        {
            button_text: __("Search open Guilds"),
            
            func: function()
            {
                open_dialog("guilds_search_open");
            }
        }), new Gui_Item(UnknownEnum.Value_51, -1, 
        {
            height: 60
        }), new Gui_Item(UnknownEnum.Value_6, -1, 
        {
            button_text: __("Leave Guild"),
            
            is_visible: function()
            {
                return !is_undefined(global.cloud_data.guild);
            },
            
            check: function()
            {
                return global.cloud_data.user_id != global.cloud_data.guild.owner_id;
            },
            
            func: function()
            {
                confirm_dialog(__("Do you really want to leave the guild?"), function()
                {
                    text_dialog(__("Leaving the guild..."));
                    post_to_cloud("guild", "leave", {}, function(arg0)
                    {
                        global.cloud_data.guild = undefined;
                        text_dialog(__("You have left the guild. Bye!"));
                    }, function(arg0)
                    {
                        notify_error(arg0);
                    });
                });
            },
            
            text_below: function()
            {
                return (global.cloud_data.user_id == global.cloud_data.guild.owner_id) ? __("You can't leave your own guild.") : "";
            }
        })],
        guilds_create: [new Gui_Item(UnknownEnum.Value_27, -1, 
        {
            label_id: "guild_name",
            label: __("Guild name"),
            tab_index: 0,
            max_length: 32,
            allow_special_chars: false
        }), new Gui_Item(UnknownEnum.Value_54, -1, 
        {
            text: __("Please only use appropriate names. Check the website or discord for naming conventions. Any violation of guild names results in a permanent ban.")
        }), new Gui_Item(UnknownEnum.Value_54, -1, 
        {
            text: function()
            {
                return global.await_async_action_text;
            }
        }), new Gui_Item(UnknownEnum.Value_5, -1, 
        {
            label_id: "create",
            
            button_text: function()
            {
                return __s("Create guild (%s)", format_resources_text(global.cloud_data.guild_settings.create_guild_costs));
            },
            
            button_options: 
            {
                icon: spr_resource_honor
            },
            
            check: function()
            {
                return is_undefined(get_async_data_by_name("guild_create")) && !is_undefined(struct_get_from_hash(global.cloud_data.guild_settings, variable_get_hash("create_guild_costs"))) && has_enough_resources(global.cloud_data.guild_settings.create_guild_costs);
            },
            
            func: function()
            {
                dec_resources(global.cloud_data.guild_settings.create_guild_costs);
                post_to_cloud("guild", "create", 
                {
                    guild_name: get_gui_input_value("guild_name")
                }, function(arg0)
                {
                    global.cloud_data.guild = new Guild(arg0.guild);
                    open_dialog("guilds");
                    set_async_response_text("");
                    notify(__("You have created your guild!"));
                    global.await_async_actions.guild_creating = undefined;
                }, function(arg0)
                {
                    add_resources(global.cloud_data.guild_settings.create_guild_costs);
                    set_async_response_text(arg0);
                    global.await_async_actions.guild_creating = undefined;
                });
            }
        }), new Gui_Item(UnknownEnum.Value_5, -1, 
        {
            button_text: __("Back"),
            func: [open_dialog, "guilds"]
        })],
        guilds_info: [new Gui_Item(UnknownEnum.Value_18, -1, 
        {
            func: function(arg0, arg1)
            {
                if (!is_struct(global.cloud_data.guild) || !is_struct(struct_get_from_hash(global.cloud_data.guild, variable_get_hash("cache"))) || !is_struct(struct_get_from_hash(global.cloud_data.guild, variable_get_hash("data"))))
                {
                    exit;
                }
                draw_heading(arg0, arg1, __("Guild Info"));
                set_default_font(f_gui_small, 0, 0);
                var info_array = [__s("Name: %s", global.cloud_data.guild.name), __s("ID: %s", global.cloud_data.guild.id), __s("Level: %s | XP: %s/%s", global.cloud_data.guild.level, number_format(global.cloud_data.guild.data.xp), number_format(global.cloud_data.guild.next_level_xp)), __s("Members: %s/%s", get_default_struct_value(global.cloud_data.guild.cache, "members_count", "?"), global.cloud_data.guild_settings.max_members)];
                var text1 = implode("\n", info_array);
                draw_text_ext(arg0, arg1 + gui_col_y(1), text1, global.gui_text_line_height, gui_col_x(12));
                draw_heading(arg0, arg1 + gui_col_y(6), __("Current Guild Bonus"));
                set_default_font(f_gui_small, 0, 0);
                var bonus_text = [];
                var __struct = global.cloud_data.guild.upgrade_attributes_items;
                var __prop_names = struct_get_names(__struct);
                var __prop_len = array_length(__prop_names);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mkey = __prop_names[__i];
                    var mitem = variable_struct_get(__struct, mkey);
                    array_push(bonus_text, format_upgrade_text(mitem.upgrade_attributes, mitem.data.count));
                }
                quicksort(bonus_text, true);
                var text2 = implode("\n", bonus_text);
                draw_text_ext(arg0, arg1 + gui_col_y(7), text2, global.gui_text_line_height, gui_col_x(12));
                draw_heading(arg0 + gui_col_x(10), arg1, __("Guild Log"));
                set_default_font(f_gui_small, 0, 0);
                draw_text(arg0 + gui_col_x(10), arg1 + gui_col_y(1), __("Note: new logs may take up to 1 hour to appear in this list."));
                var text3 = global.cloud_data.guild.cache.log;
                draw_text_ext(arg0 + gui_col_x(10), arg1 + gui_col_y(2), text3, global.gui_text_line_height, gui_col_x(15));
                return gui_col_y(15);
            }
        }), new Gui_Item(UnknownEnum.Value_5, -1, 
        {
            button_text: __("Back"),
            func: [open_dialog, "guilds"]
        })],
        guilds_join: [new Gui_Item(UnknownEnum.Value_27, -1, 
        {
            label_id: "guild_id",
            label: __("Guild ID"),
            tab_index: 0,
            max_length: 32,
            allow_special_chars: false
        }), new Gui_Item(UnknownEnum.Value_54, -1, 
        {
            text: function()
            {
                return global.await_async_action_text;
            }
        }), new Gui_Item(UnknownEnum.Value_5, -1, 
        {
            label_id: "joining",
            
            button_text: function()
            {
                return __s("Join guild");
            },
            
            button_options: 
            {
                icon: spr_resource_honor
            },
            
            check: function()
            {
                return is_undefined(get_async_data_by_name("guild_join")) && has_enough_resources(global.cloud_data.guild_settings.join_guild_costs);
            },
            
            func: function()
            {
                join_guild(get_gui_input_value("guild_id"));
            }
        }), new Gui_Item(UnknownEnum.Value_5, -1, 
        {
            button_text: __("Back"),
            func: [open_dialog, "guilds"]
        })],
        guilds_members: [new Gui_Item(UnknownEnum.Value_18, -1, 
        {
            is_visible: function()
            {
                return !is_undefined(global.cloud_data.guild);
            },
            
            section: global.dialog_sections.guilds_members.general,
            
            func: function(arg0, arg1)
            {
                if (!is_struct(struct_get_from_hash(global.cloud_data.guild, variable_get_hash("cache"))))
                {
                    exit;
                }
                var player_is_guild_owner = global.cloud_data.user_id == global.cloud_data.guild.owner_id;
                set_default_font(f_gui_small, 0);
                var member_count = 0;
                if (is_struct(struct_get_from_hash(global.cloud_data.guild.cache, variable_get_hash("members"))))
                {
                    member_count = get_struct_length(global.cloud_data.guild.cache.members);
                    var __struct = global.cloud_data.guild.cache.members;
                    var __prop_names = struct_get_names(__struct);
                    var __prop_len = array_length(__prop_names);
                    for (var __i = 0; __i < __prop_len; __i++)
                    {
                        var mkey = __prop_names[__i];
                        var mitem = variable_struct_get(__struct, mkey);
                        var name = mitem.username;
                        var loop_member_is_guild_owner = mitem.wp_user_id == global.cloud_data.guild.owner_id;
                        if (loop_member_is_guild_owner)
                        {
                            name += sprintf(" (%s)", __("Owner"));
                        }
                        var player_honor_invested_guild = real(get_default_struct_value(mitem, "honor_invested_guild", 0));
                        var member_text = __s("ID: %s | Name: %s | Honor invested: %s", mitem.wp_user_id, name, number_format(player_honor_invested_guild));
                        draw_text_ext(arg0, arg1 + (gui_col_y(2) * __i), member_text, global.gui_text_line_height, gui_col_x(20));
                        if (player_is_guild_owner && !loop_member_is_guild_owner)
                        {
                            if (gui_button_tl(arg0 + gui_col_x(9), (arg1 - gui_col_y(0.25)) + (gui_col_y(2) * __i), __("Kick"), true))
                            {
                                global.guild_kick_member_id = mitem.wp_user_id;
                                global.guild_kick_member_name = mitem.username;
                                confirm_dialog(__s("Do you really want to kick member %s from your guild?", global.guild_kick_member_name), function()
                                {
                                    notify(__s("Kicking guild member %s...", global.guild_kick_member_name));
                                    kick_guild_member(global.guild_kick_member_id);
                                });
                            }
                        }
                    }
                }
                return (gui_col_y(1) * member_count) + 100;
            }
        }), new Gui_Item(UnknownEnum.Value_5, -1, 
        {
            button_text: __("Back"),
            func: [open_dialog, "guilds"],
            section: global.dialog_sections.guilds_members.general
        })],
        guilds_search: [new Gui_Item(UnknownEnum.Value_27, -1, 
        {
            label_id: "name",
            label: __s("Guild name (min %s chars)", 3),
            tab_index: 0,
            max_length: 32,
            allow_special_chars: false
        }), new Gui_Item(UnknownEnum.Value_54, -1, 
        {
            text: function()
            {
                return global.await_async_action_text;
            }
        }), new Gui_Item(UnknownEnum.Value_6, -1, 
        {
            label_id: "searching",
            button_text: __("Search"),
            
            check: function()
            {
                return is_undefined(get_async_data_by_name("guild_search")) && string_length(get_gui_input_value("name")) >= 3;
            },
            
            func: function()
            {
                post_to_cloud("guild", "search", 
                {
                    name: get_gui_input_value("name")
                }, function(arg0)
                {
                    global.cloud_data.guild_search_cache = struct_get_from_hash(arg0, variable_get_hash("guilds"));
                    set_async_response_text("");
                }, function(arg0)
                {
                    set_async_response_text(arg0);
                });
            }
        }), new Gui_Item(UnknownEnum.Value_6, -1, 
        {
            button_text: __("Back"),
            func: [open_dialog, "guilds"]
        }), new Gui_Item(UnknownEnum.Value_51, -1, 
        {
            height: 60
        }), new Gui_Item(UnknownEnum.Value_18, -1, 
        {
            func: function(arg0, arg1)
            {
                if (!is_array(global.cloud_data.guild_search_cache) || array_length(global.cloud_data.guild_search_cache) == 0)
                {
                    draw_text(arg0, arg1, __("No guilds found."));
                    exit;
                }
                draw_heading(arg0, arg1, __("Search results"));
                set_default_font(f_gui_small, 0, 0);
                return list_guilds(arg0, arg1 + gui_col_y(1), global.cloud_data.guild_search_cache);
            }
        })],
        guilds_search_open: [new Gui_Item(UnknownEnum.Value_54, -1, 
        {
            text: function()
            {
                return global.await_async_action_text;
            }
        }), new Gui_Item(UnknownEnum.Value_6, -1, 
        {
            label_id: "searching",
            button_text: __("Search open Guilds"),
            
            check: function()
            {
                return is_undefined(get_async_data_by_name("guild_search_open")) && !has_timeout("guild_search_open");
            },
            
            func: function()
            {
                post_to_cloud("guild", "search_open", undefined, function(arg0)
                {
                    global.cloud_data.guild_search_random_cache = struct_get_from_hash(arg0, variable_get_hash("guilds"));
                    set_async_response_text("");
                }, function(arg0)
                {
                    set_async_response_text(arg0);
                }, undefined, sec(3));
            }
        }), new Gui_Item(UnknownEnum.Value_6, -1, 
        {
            button_text: __("Back"),
            func: [open_dialog, "guilds"]
        }), new Gui_Item(UnknownEnum.Value_51, -1, 
        {
            height: 60
        }), new Gui_Item(UnknownEnum.Value_18, -1, 
        {
            func: function(arg0, arg1)
            {
                if (!is_array(global.cloud_data.guild_search_random_cache) || array_length(global.cloud_data.guild_search_random_cache) == 0)
                {
                    draw_text(arg0, arg1, "-");
                    exit;
                }
                draw_heading(arg0, arg1, __("Search results"));
                set_default_font(f_gui_small, 0, 0);
                return list_guilds(arg0, arg1 + gui_col_y(1), global.cloud_data.guild_search_random_cache);
            }
        })],
        guilds_upgrades: [new Gui_Item(UnknownEnum.Value_54, -1, 
        {
            text: __("Invest Honor in exchange for Guild XP. Honor can be earned by claiming the daily reward or by defeating area bosses.")
        }), new Gui_Item(UnknownEnum.Value_6, -1, 
        {
            button_text: function()
            {
                return __s("Invest %s Honor (%s xp)", 1, get_honor_xp(1));
            },
            
            button_options: 
            {
                icon: spr_resource_honor
            },
            
            check: function()
            {
                return has_enough_resources(
                {
                    honor: 1
                }) && is_undefined(get_async_data_by_name("guild_invest_honor"));
            },
            
            func: function()
            {
                guild_invest_honor(1);
            }
        }), new Gui_Item(UnknownEnum.Value_6, -1, 
        {
            button_text: function()
            {
                return __s("Invest %s Honor (%s xp)", 5, get_honor_xp(5));
            },
            
            button_options: 
            {
                icon: spr_resource_honor
            },
            
            check: function()
            {
                return has_enough_resources(
                {
                    honor: 5
                }) && is_undefined(get_async_data_by_name("guild_invest_honor"));
            },
            
            func: function()
            {
                guild_invest_honor(5);
            }
        }), new Gui_Item(UnknownEnum.Value_6, -1, 
        {
            button_text: function()
            {
                return __s("Invest %s Honor (%s xp)", 10, get_honor_xp(10));
            },
            
            button_options: 
            {
                icon: spr_resource_honor
            },
            
            check: function()
            {
                return has_enough_resources(
                {
                    honor: 10
                }) && is_undefined(get_async_data_by_name("guild_invest_honor"));
            },
            
            func: function()
            {
                guild_invest_honor(10);
            }
        }), new Gui_Item(UnknownEnum.Value_6, -1, 
        {
            button_text: function()
            {
                return __s("Invest %s Honor (%s xp)", 25, get_honor_xp(25));
            },
            
            button_options: 
            {
                icon: spr_resource_honor
            },
            
            check: function()
            {
                return has_enough_resources(
                {
                    honor: 25
                }) && is_undefined(get_async_data_by_name("guild_invest_honor"));
            },
            
            func: function()
            {
                guild_invest_honor(25);
            }
        }), new Gui_Item(UnknownEnum.Value_51, -1, 
        {
            height: 60
        }), new Gui_Item(UnknownEnum.Value_54, -1, 
        {
            text: function()
            {
                if (is_undefined(global.cloud_data.guild))
                {
                    return __("You are not in a guild.");
                }
                var text = [__s("Name: %s", global.cloud_data.guild.name), __s("Level: %s | XP: %s/%s", global.cloud_data.guild.level, number_format(global.cloud_data.guild.data.xp), number_format(global.cloud_data.guild.next_level_xp)), __s("Player Honor investments today: %s/%s", global.cloud_data.guild.player_settings.invest_count_today, global.cloud_data.guild_settings.invest_honor_count_per_day), __s("Guild Honor investments today: %s/%s", global.cloud_data.guild.guild_invest_count_today, global.cloud_data.guild_settings.invest_honor_guild_count_per_day)];
                return implode("\n", text);
            }
        }), new Gui_Item(UnknownEnum.Value_51, -1, 
        {
            height: 60
        }), new Gui_Item(UnknownEnum.Value_5, -1, 
        {
            button_text: __("Back"),
            func: [open_dialog, "guilds"]
        })],
        login_gateway: [new Gui_Item(UnknownEnum.Value_5, -1, 
        {
            button_text: function()
            {
                if (global.is_android)
                {
                    return GooglePlayServices_IsSignedIn() ? __s("Sign out of %s", "Google Play") : __s("Sign in to %s", "Google Play");
                }
                else if (global.is_ios)
                {
                    return is_apple_signed_in() ? __s("Sign out of %s", "Apple") : __s("Sign in to %s", "Apple");
                }
            },
            
            func: function()
            {
                if (global.is_android)
                {
                    if (GooglePlayServices_IsSignedIn())
                    {
                        GooglePlayServices_SignOut();
                    }
                    else
                    {
                        GooglePlayServices_StartSignInIntent();
                    }
                }
                else if (global.is_ios)
                {
                    if (is_apple_signed_in())
                    {
                        global.ios_account = undefined;
                    }
                    else
                    {
                        extension_stubfunc_real();
                        extension_stubfunc_real("\"email\"");
                        extension_stubfunc_real();
                    }
                }
            },
            
            is_visible: global.is_mobile
        }), new Gui_Item(UnknownEnum.Value_5, -1, 
        {
            button_text: __("Sign in to Humble North"),
            
            func: function()
            {
                actions_dialog(global.dialog_actions.login, 
                {
                    title: __("Sign in"),
                    subtitle: __("Sign in to your Humble North account.")
                }, 20);
            }
        }), new Gui_Item(UnknownEnum.Value_51, -1, 
        {
            height: 60
        }), new Gui_Item(UnknownEnum.Value_5, -1, 
        {
            button_text: __("Register"),
            
            func: function()
            {
                actions_dialog(global.dialog_actions.register, 
                {
                    title: __("Register Account"),
                    subtitle: __("Register a Humble North account to take part in multiplayer events, (future) cross-play saves and more!")
                }, 20);
            }
        }), new Gui_Item(UnknownEnum.Value_5, -1, 
        {
            button_text: __("Manage account"),
            
            func: function()
            {
                url_open("https://lbr.humblenorth.de/lbr/wp2/wp-admin/profile.php");
            }
        }), new Gui_Item(UnknownEnum.Value_5, -1, 
        {
            button_text: __("Delete account"),
            
            func: function()
            {
                url_open("https://lbr.humblenorth.de/lbr/wp2/wp-admin/profile.php");
            }
        })],
        login: [new Gui_Item(UnknownEnum.Value_27, -1, 
        {
            label_id: "username_email",
            label: __("Email or username"),
            tab_index: 0,
            max_length: 128,
            allow_special_chars: true
        }), new Gui_Item(UnknownEnum.Value_27, -1, 
        {
            label_id: "password",
            label: __("Password"),
            tab_index: 1,
            obfuscated: true,
            max_length: 128,
            allow_special_chars: true
        }), new Gui_Item(UnknownEnum.Value_54, -1, 
        {
            text: function()
            {
                return global.await_async_action_text;
            }
        }), new Gui_Item(UnknownEnum.Value_5, -1, 
        {
            label_id: "login",
            
            button_text: function()
            {
                return !is_undefined(get_async_data_by_name("user_login")) ? __("Logging in...") : __("Log in");
            },
            
            check: function()
            {
                return is_undefined(get_async_data_by_name("user_login"));
            },
            
            func: function()
            {
                hn_login(get_gui_input_value("username_email"), get_gui_input_value("password"));
            }
        }), new Gui_Item(UnknownEnum.Value_5, -1, 
        {
            button_text: __("Back"),
            func: [open_dialog, "login_gateway"]
        }), new Gui_Item(UnknownEnum.Value_51, -1, 
        {
            height: 60
        }), new Gui_Item(UnknownEnum.Value_54, -1, 
        {
            text: __("Forgot your password?"),
            link: "https://lbr.humblenorth.de/lbr/wp2/wp-login.php?action=lostpassword"
        })],
        redeem_code: [new Gui_Item(UnknownEnum.Value_18, -1, 
        {
            func: gui_item_redeem_code
        })],
        register: [new Gui_Item(UnknownEnum.Value_27, -1, 
        {
            label_id: "username",
            label: __("Username"),
            tab_index: 0,
            max_length: 128,
            allow_special_chars: false
        }), new Gui_Item(UnknownEnum.Value_27, -1, 
        {
            label_id: "email",
            label: __("Email"),
            tab_index: 1,
            max_length: 128,
            allow_special_chars: true
        }), new Gui_Item(UnknownEnum.Value_27, -1, 
        {
            label_id: "password",
            label: __("Password"),
            tab_index: 2,
            obfuscated: true,
            max_length: 128,
            allow_special_chars: true
        }), new Gui_Item(UnknownEnum.Value_10, -1, 
        {
            label_id: "terms",
            label: __("I agree to the terms, conditions and the privacy policy.")
        }), new Gui_Item(UnknownEnum.Value_54, -1, 
        {
            text: function()
            {
                return global.await_async_action_text;
            }
        }), new Gui_Item(UnknownEnum.Value_6, -1, 
        {
            button_text: function()
            {
                return !is_undefined(get_async_data_by_name("user_register")) ? __("Creating account...") : __("Register");
            },
            
            check: function()
            {
                return is_undefined(get_async_data_by_name("user_register")) && get_gui_input_value("terms");
            },
            
            func: function()
            {
                post_to_cloud("user", "register", 
                {
                    username: get_gui_input_value("username"),
                    email: get_gui_input_value("email"),
                    password: get_gui_input_value("password")
                }, function(arg0)
                {
                    text_dialog(__("Registration was successful! Please verify your email address."));
                }, set_async_response_text);
            }
        }), new Gui_Item(UnknownEnum.Value_6, -1, 
        {
            button_text: __("Back"),
            func: [open_dialog, "login_gateway"]
        }), new Gui_Item(UnknownEnum.Value_51, -1, 
        {
            height: 5
        }), new Gui_Item(UnknownEnum.Value_54, -1, 
        {
            text: __("View terms and privacy policy"),
            link: "https://humblenorth.de/privacy-policy"
        }), new Gui_Item(UnknownEnum.Value_18, -1, 
        {
            func: function(arg0, arg1)
            {
                if (!global.is_ios || !is_apple_signed_in() || is_undefined(struct_get_from_hash(global.ios_account, variable_get_hash("email"))))
                {
                    exit;
                }
                var by = global.is_mobile ? 18 : 12.5;
                if (gui_button_tl(arg0 + gui_col_x(8.25), arg1 - gui_col_y(by), __("Use Apple email"), true))
                {
                    set_gui_input_value("email", struct_get_from_hash(global.ios_account, variable_get_hash("email")));
                }
            }
        })],
        seasons_challenges_gateway: [new Gui_Item(UnknownEnum.Value_43, -1, 
        {
            season_type: "challenge",
            parent_nav: "seasons_challenges_gateway"
        }), new Gui_Item(UnknownEnum.Value_5, -1, 
        {
            button_text: __("Back"),
            func: [open_dialog, "seasons"]
        })],
        seasons: [new Gui_Item(UnknownEnum.Value_18, -1, 
        {
            func: gui_item_seasons_wrapper
        })],
        show_cloud_saves: [new Gui_Item(UnknownEnum.Value_54, -1, 
        {
            text: function()
            {
                post_to_cloud("user", "show_cloud_saves", {}, function(arg0)
                {
                });
            }
        }), new Gui_Item(UnknownEnum.Value_54, -1, 
        {
            text: function()
            {
                return global.await_async_action_text;
            }
        })]
    };
    global.dialog_settings = 
    {
        account: 
        {
            titles: 
            {
                title: __("Account"),
                subtitle: __("Manage your account, play with your season character or redeem a code. Check the social channels to find new codes!")
            }
        },
        claim_rewards: 
        {
            titles: 
            {
                title: __("Claimable Rewards"),
                subtitle: __("You may find claimable rewards here.")
            }
        },
        cloud_saves: 
        {
            titles: 
            {
                title: __("Cloud Saves"),
                subtitle: __("Save and load your progress from the Humble North cloud server.")
            }
        },
        guilds: 
        {
            titles: 
            {
                title: __("Guilds Headquarter"),
                subtitle: __("Manage your guild here.")
            }
        },
        guilds_join: 
        {
            titles: 
            {
                title: __("Join a Guild")
            }
        },
        guilds_members: 
        {
            titles: 
            {
                title: __("Guild members"),
                subtitle: ""
            }
        },
        guilds_search: 
        {
            titles: 
            {
                title: __("Search Guilds"),
                subtitle: ""
            }
        },
        guilds_search_open: 
        {
            titles: 
            {
                title: __("Search Open Guilds"),
                subtitle: ""
            }
        },
        guilds_upgrades: 
        {
            titles: 
            {
                title: __("Guild Upgrades"),
                subtitle: ""
            }
        },
        login_gateway: 
        {
            titles: 
            {
                title: __("Sign in"),
                subtitle: __("Sign in to your Humble North account.")
            }
        },
        redeem_code: 
        {
            titles: 
            {
                title: __("Redeem code")
            }
        },
        seasons: 
        {
            titles: 
            {
                title: __("Seasons"),
                subtitle: __("Play with your season character and compete with other leaf blowers!")
            }
        },
        seasons_challenges_gateway: 
        {
            titles: 
            {
                title: __("Challenges"),
                subtitle: __("Play with your season character and compete with other leaf blowers!")
            }
        }
    };
}

enum UnknownEnum
{
    Value_5 = 5,
    Value_6,
    Value_10 = 10,
    Value_18 = 18,
    Value_27 = 27,
    Value_43 = 43,
    Value_51 = 51,
    Value_54 = 54
}
