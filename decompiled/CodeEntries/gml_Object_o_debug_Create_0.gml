if (!global.debug)
{
    instance_destroy();
    exit;
}
if (single_object())
{
    exit;
}
instance_create_layer(x, y, global.layers.control, obj_gmlive);
_id = id;
check_input = false;
debug_draw = true;
debug_draw_gm = false;
debug_history = [];
debug_history_index = 0;
debug_input = "";
debug_result = "";
grid = false;
portrait = false;
td = 0;
fps_avg = 0;
fps_count = 0;
titles = 
{
    title: "",
    subtitle: ""
};
gui_dialog_pre_init();
gui_dialog_init();
save_string_to_file("debug active!", "debug.txt");
alarm[0] = sec(1);

init_actions = function()
{
    actions = [new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "debugfunc",
        
        func: function()
        {
            debugfunc();
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Load config",
        
        func: function()
        {
            load_debug_config();
        }
    }), gui_inline_button("Unlock all", function()
    {
        debug_unlock_all();
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Toggle auto save",
        
        func: function()
        {
            global.autosave = !global.autosave;
            if (global.autosave)
            {
                notify("Autosave enabled");
            }
            else
            {
                notify_error("Autosave disabled");
            }
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Save game",
        
        func: function()
        {
            save_game();
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Upload game save",
        
        func: function()
        {
            upload_save_to_cloud();
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Ping Server",
        
        func: function()
        {
            ping_server();
        }
    }), gui_inline_button("test request", function()
    {
        log("test request...");
        http_post_string(global.web_base_url, "test=123");
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Show purchases data",
        
        func: function()
        {
            if (!instance_exists(o_mobile_helper))
            {
                exit;
            }
            logf(o_mobile_helper.purchasesData);
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Load default profile",
        
        func: function()
        {
            change_profile(global.profile_types.def);
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Load challenge profile",
        
        func: function()
        {
            change_profile(global.profile_types.challenge);
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Show profile data",
        
        func: function()
        {
            var __struct = global.profiles;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                logd();
                log("PROFILE DATA", mkey, mitem);
                logd();
            }
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Show upgrade attributes",
        
        func: function()
        {
            logd();
            log("Runtime", "2024.14.3.260");
            var atts = [];
            var __struct = global.upgrade_attributes;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                array_push(atts, 
                {
                    key: mkey,
                    val: mitem
                });
            }
            sort_array_by_key(atts, true);
            var __array = atts;
            __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                var num = mitem.val;
                if (is_struct(num))
                {
                    var __struct2 = num;
                    var __prop_names2 = struct_get_names(__struct2);
                    var __prop_len2 = array_length(__prop_names2);
                    for (var __i2 = 0; __i2 < __prop_len2; __i2++)
                    {
                        var mkey2 = __prop_names2[__i2];
                        var mitem2 = variable_struct_get(__struct2, mkey2);
                        log(mitem.key, mkey2, number_format(mitem2, 8));
                    }
                }
                else if (is_numeric(num))
                {
                    log(mitem.key, number_format(mitem.val, 8));
                }
                else
                {
                    log(mitem.key, mitem.val);
                }
            }
            logd();
        }
    }), gui_inline_button("Show UA sections", function()
    {
        var output = "";
        var __array = global.upgrade_sections_array;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            var output_name = (mitem == "weapon") ? "tool" : mitem;
            output += (string_upper(output_name) + "\n==============================\n");
            output += format_upgrade_text(variable_struct_get(global.upgrade_sections_values, mitem), undefined, true, undefined, "\n", true);
            output += "\n\n\n";
        }
        log(output);
    }), gui_inline_button("Show UA damage", function()
    {
        var output = "";
        var __array = global.upgrade_sections_array;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            output += ("---" + string(mitem) + "---");
            var section_array = [];
            var __struct2 = variable_struct_get(global.upgrade_sections_values, mitem);
            var __prop_names2 = struct_get_names(__struct2);
            var __prop_len2 = array_length(__prop_names2);
            for (var __i2 = 0; __i2 < __prop_len2; __i2++)
            {
                var mkey2 = __prop_names2[__i2];
                var mitem2 = variable_struct_get(__struct2, mkey2);
                if (string_pos("blower_enemy_damage", mkey2) == 0)
                {
                    continue;
                }
                if (mitem2 == 0)
                {
                    continue;
                }
                array_push(section_array, 
                {
                    key: mkey2,
                    value: mitem2
                });
            }
            sort_array_by_key(section_array, true);
            var __array2 = section_array;
            __prop_len2 = array_length(__array2);
            for (var __i2 = 0; __i2 < __prop_len2; __i2++)
            {
                var mitem2 = __array2[__i2];
                output += (sprintf("%s | %s", mitem2.key, number_format(mitem2.value, 2)) + "\n");
            }
        }
        log(output);
        clipboard_set_text(output);
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Clear async actions",
        
        func: function()
        {
            global.await_async_actions = {};
        }
    }), gui_inline_button("apple info", function()
    {
        log(global.ios_account);
    }), gui_inline_button("clear redeem codes", function()
    {
        o_game.data.codes_redeemed = {};
    }), gui_inline_button("game restart", function()
    {
        game_restart();
    }), gui_inline_button("init game vars", function()
    {
        init_game_vars();
    }), gui_inline_button("gui editor", function()
    {
        gui_dialog_close();
        delay(undefined, 2, gui_editor);
    }), gui_inline_button("init o_debug", function()
    {
        instance_destroy(o_debug);
        instance_create_layer(0, 0, global.layers.control, o_debug);
    }), gui_inline_button("PHP Lists", function()
    {
        var plain_text = "";
        var text = "<?php\n\n";
        plain_text += ("Areas: " + pluck_implode(global.areas_array, "name") + "\n" + "\n");
        text += ("public $areas = array(" + pluck_implode(global.areas_array, "key", undefined, undefined, undefined, undefined, "\"", "\"") + ");\n\n");
        text += ("public $areas_generatable = array(" + pluck_implode(global.quest_available_areas, "key", undefined, undefined, undefined, undefined, "\"", "\"") + ");\n\n");
        plain_text += ("Artifacts: " + pluck_implode(global.artifacts_sorted, "name") + "\n" + "\n");
        text += ("public $artifacts = array(" + pluck_implode(global.artifacts_sorted, "key", undefined, undefined, undefined, undefined, "\"", "\"") + ");\n\n");
        text += ("public $artifacts_generatable = array(" + pluck_implode(global.artifacts_generatable, "key", undefined, undefined, undefined, undefined, "\"", "\"") + ");\n\n");
        plain_text += ("Materials: " + pluck_implode(global.materials_sorted, "name") + "\n" + "\n");
        text += ("public $materials = array(" + pluck_implode(global.materials_sorted, "key", undefined, undefined, undefined, undefined, "\"", "\"") + ");\n\n");
        text += ("public $materials_generatable = array(" + pluck_implode(global.materials_generatable_in_quests, "key", undefined, undefined, undefined, undefined, "\"", "\"") + ");\n\n");
        plain_text += ("Pets: " + pluck_implode(global.pets_sorted, "name") + "\n" + "\n");
        text += ("public $pets = array(" + pluck_implode(global.pets_sorted, "key", undefined, undefined, undefined, undefined, "\"", "\"") + ");\n\n");
        text += ("public $pets_generatable = array(" + pluck_implode(global.pets_generatable, "key", undefined, undefined, undefined, undefined, "\"", "\"") + ");\n\n");
        plain_text += ("Resources: " + pluck_implode(global.resources_array, "name") + "\n" + "\n");
        text += ("public $resources = array(" + pluck_implode(global.resources_array, "key", undefined, undefined, undefined, undefined, "\"", "\"") + ");\n\n");
        text += ("public $resources_array_quests = array(" + pluck_implode(global.resources_array_quests, "key", undefined, undefined, undefined, undefined, "\"", "\"") + ");\n\n");
        text += ("public $resources_printable = array(" + pluck_implode(global.resources_printable, "key", undefined, undefined, undefined, undefined, "\"", "\"") + ");\n\n");
        plain_text += ("Unique Leaves: " + pluck_implode(global.artifacts_sorted, "name") + "\n" + "\n");
        text += ("public $unique_leaves = array(" + pluck_implode(global.unique_leaves_sorted, "key", undefined, undefined, undefined, undefined, "\"", "\"") + ");\n\n");
        text += ("public $unique_leaves_generatable = array(" + pluck_implode(global.unique_leaves_generatable, "key", undefined, undefined, undefined, undefined, "\"", "\"") + ");\n\n");
        plain_text += ("Tools: " + pluck_implode(global.weapons_sorted, "name") + "\n" + "\n");
        text += ("public $weapons = array(" + pluck_implode(global.weapons_sorted, "key", undefined, undefined, undefined, undefined, "\"", "\"") + ");");
        save_string_to_file(plain_text, "items.txt");
        save_string_to_file(text, "items.php");
        log("File written to items.php");
        var json = 
        {
            areas: pluck(global.areas_array, "key"),
            areas_generatable: pluck(global.quest_available_areas, "key"),
            artifacts: pluck(global.artifacts_sorted, "key"),
            materials: pluck(global.materials_sorted, "key"),
            materials_generatable: pluck(global.materials_generatable_in_quests, "key"),
            pets: pluck(global.pets_sorted, "key"),
            pets_generatable: pluck(global.pets_generatable, "key"),
            resources: pluck(global.resources_array, "key"),
            resources_array_quests: pluck(global.resources_array_quests, "key"),
            resources_printable: pluck(global.resources_printable, "key"),
            unique_leaves: pluck(global.unique_leaves_sorted, "key"),
            weapons: pluck(global.weapons_sorted, "key")
        };
        save_string_to_file(json_stringify(json), "items.json");
    }), new Gui_Item(UnknownEnum.Value_51, -1, 
    {
        height: 60
    }), new Gui_Item(UnknownEnum.Value_54, id, 
    {
        text: "Cursed Cheese"
    }), gui_inline_button("cursed cheese defeat = 0", function()
    {
        global.enemies.boss_cursed_cheese.data.defeated = 0;
    }), gui_inline_button("cursed cheese defeat += 25", function()
    {
        global.enemies.boss_cursed_cheese.data.defeated += 25;
    }), gui_inline_button("cursed cheese defeat += 200", function()
    {
        global.enemies.boss_cursed_cheese.data.defeated += 200;
    }), gui_inline_button("cursed cheese equipment += 10000", function()
    {
        global.equipment.cursed_cheese.data.count += 10000;
    }), gui_inline_button("curses += 1k", function()
    {
        o_game.data.stats.cursed_count += 1000;
    }), gui_inline_button("curses += 100k", function()
    {
        o_game.data.stats.cursed_count += 100000;
    }), gui_inline_button("curses += 1m", function()
    {
        o_game.data.stats.cursed_count += 1000000;
    }), gui_inline_button("curses += 10m", function()
    {
        o_game.data.stats.cursed_count += 10000000;
    }), new Gui_Item(UnknownEnum.Value_51, -1, 
    {
        height: 60
    }), new Gui_Item(UnknownEnum.Value_54, id, 
    {
        text: "Server"
    }), gui_inline_button("Local", function()
    {
        global.web_base_url = "http://cheesetor/humblenorth/report/router.php";
        log("web base url", global.web_base_url);
    }), gui_inline_button("Debug Main", function()
    {
        global.web_base_url = "http://cheesetor/humblenorth/report/router.php";
        log("web base url", global.web_base_url);
    }), gui_inline_button("Invalid", function()
    {
        global.web_base_url = "http://192.168.0.0";
        log("web base url", global.web_base_url);
    }), gui_inline_button("Prod", function()
    {
        global.web_base_url = "https://lbr.humblenorth.de/lbr/report/router.php";
        log("web base url", global.web_base_url);
    }), gui_inline_button("Test (report3)", function()
    {
        global.web_base_url = "https://lbr.humblenorth.de/lbr/report3/router.php";
        log("web base url", global.web_base_url);
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Switch Server",
        
        func: function()
        {
            if (global.web_base_url == "https://lbr.humblenorth.de/lbr/report/router.php")
            {
                global.web_base_url = "http://cheesetor/humblenorth/report/router.php";
            }
            else if (global.web_base_url == "http://cheesetor/humblenorth/report/router.php")
            {
                global.web_base_url = "http://cheesetor/humblenorth/report/router.php";
            }
            else if (global.web_base_url == "http://cheesetor/humblenorth/report/router.php")
            {
                global.web_base_url = "http://192.168.0.0/";
            }
            else
            {
                global.web_base_url = "https://lbr.humblenorth.de/lbr/report/router.php";
            }
            log(global.web_base_url);
        }
    }), new Gui_Item(UnknownEnum.Value_51, -1, 
    {
        height: 60
    }), new Gui_Item(UnknownEnum.Value_54, id, 
    {
        text: "Seasons"
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Show season info",
        
        func: function()
        {
            log("player id", o_game.data.player_id);
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Season handler",
        
        func: function()
        {
            season_handler_check();
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Update guild cache",
        
        func: function()
        {
            post_to_cloud("guild", "update_cache");
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Clear salvage",
        
        func: function()
        {
            o_game.data.stats.salvaged_seasons = [];
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Clear claim",
        
        func: function()
        {
            o_game.data.stats.claimed_seasons = [];
        }
    }), new Gui_Item(UnknownEnum.Value_51, -1, 
    {
        height: 60
    }), new Gui_Item(UnknownEnum.Value_54, id, 
    {
        text: "Visuals"
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Visuals off",
        
        func: function()
        {
            global.options.alb_visible.data.checked = false;
            global.options.draw_leaves.data.value = false;
            global.options.draw_other_leaves.data.value = false;
            global.options.draw_trees.data.value = false;
            global.options.draw_shadows.data.value = false;
            global.options.draw_borbs.data.value = false;
            global.options.draw_enemy.data.value = false;
            global.options.draw_resource_text_rewards.data.value = false;
            var __struct = global.options;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                mitem.change();
            }
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Visuals on",
        
        func: function()
        {
            global.options.alb_visible.data.checked = true;
            global.options.draw_leaves.data.value = true;
            global.options.draw_other_leaves.data.value = true;
            global.options.draw_trees.data.value = true;
            global.options.draw_shadows.data.value = true;
            global.options.draw_borbs.data.value = true;
            global.options.draw_enemy.data.value = true;
            global.options.draw_resource_text_rewards.data.value = true;
            var __struct = global.options;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                mitem.change();
            }
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Toggle is mobile",
        
        func: function()
        {
            global.is_mobile = !global.is_mobile;
            init_fonts();
            set_gui_size();
        }
    }), gui_inline_button("GUI Size", function()
    {
        var gui_sizes = [
        {
            w: 1280,
            h: 720
        }, 
        {
            w: 1366,
            h: 768
        }, 
        {
            w: 1600,
            h: 900
        }, 
        {
            w: 1920,
            h: 1080
        }, 
        {
            w: 3840,
            h: 2160
        }];
        if (!variable_global_exists("debugguisize"))
        {
            global.debugguisize = 0;
        }
        log("gui size set", gui_sizes[global.debugguisize].w, gui_sizes[global.debugguisize].h);
        set_gui_size(gui_sizes[global.debugguisize].w, gui_sizes[global.debugguisize].h);
        global.debugguisize++;
        if (global.debugguisize >= array_length(gui_sizes))
        {
            global.debugguisize = 0;
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Test Notification",
        
        func: function()
        {
            var text = string_repeat("leaf ", irandom_range(1, 40));
            notify(text);
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Debug Draw (shift+f7)",
        
        func: function()
        {
            o_debug.debug_draw = !o_debug.debug_draw;
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Toggle Portrait",
        
        func: function()
        {
            o_debug.portrait = !o_debug.portrait;
        }
    }), gui_inline_button("GUI Sprite+", function()
    {
        global.gui_sprite_scale++;
    }), gui_inline_button("GUI Sprite-", function()
    {
        global.gui_sprite_scale = max(--global.gui_sprite_scale, 1);
    }), new Gui_Item(UnknownEnum.Value_51, -1, 
    {
        height: 60
    }), new Gui_Item(UnknownEnum.Value_54, id, 
    {
        text: "Resources"
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Clear all Resources",
        
        func: function()
        {
            var __struct = global.resources;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                mitem.data.count = 0;
                mitem.data.collected = 0;
                mitem.data.collected_total = 0;
            }
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Max all Resources",
        
        func: function()
        {
            var __struct = global.resources;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                var res = {};
                variable_struct_set(res, mkey, global.max_num);
                add_resources(res);
            }
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "All Resources = 100",
        
        func: function()
        {
            var __struct = global.resources;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                variable_struct_get(__struct, mkey).data.count = 100;
            }
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Unlock all Resources",
        
        func: function()
        {
            var __struct = global.resources;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                mitem.data.unlocked = true;
            }
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Unlock Community Leaves",
        
        func: function()
        {
            var __struct = global.community_leaves;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                mitem.collect();
            }
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Unlock Unique Leaves",
        
        func: function()
        {
            var __struct = global.unique_leaves;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                mitem.collect();
            }
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Seed resource test",
        
        func: function()
        {
            global.resources.leaves.data.count = 1000;
            repeat (10)
            {
                var res = collect_seed(global.resources.leaves, true);
            }
            var before = global.resources.leaves.data.count;
            log("default", number_format(before));
            global.resources.leaves.data.count = 1000;
            var val = get_seed_value(global.resources.leaves, 10);
            log("new", number_format(val));
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Unlock CP",
        
        func: function()
        {
            global.resources.cp.data.unlocked = true;
            add_resources(
            {
                cp: 100
            });
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Unlock all areas",
        
        func: function()
        {
            var __struct = global.areas;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                mitem.data.count = 1;
            }
            global.areas.tower.data.highest_floor = 120;
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Unlock all Pets",
        
        func: function()
        {
            var __struct = global.pets;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                mitem.data.count = 1;
            }
            __struct = global.shops.pets;
            __prop_names = struct_get_names(__struct);
            __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                mitem.data.count = 1;
            }
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Lock all Pets",
        
        func: function()
        {
            var __struct = global.pets;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                mitem.data.count = 0;
            }
            __struct = global.shops.pets;
            __prop_names = struct_get_names(__struct);
            __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                mitem.data.count = 0;
            }
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Reset all shop items",
        
        func: function()
        {
            var __array = global.shops_items_array;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                mitem.data.count = 0;
            }
            init_game_vars();
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Max all shop items",
        
        func: function()
        {
            var __array = global.shops_items_array;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                mitem.data.count = get_shop_item_max_count(mitem);
                if (get_shop_item_max_count(mitem) == 0)
                {
                    mitem.data.count = 100;
                }
                mitem.func();
            }
            init_game_vars();
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Init Shops",
        
        func: function()
        {
            init_shops();
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "text dialog",
        
        func: function()
        {
            text_dialog(__("Random text dialog. If you can read this, please send me a beer. Thanks!"));
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Spawn Gravity Ball",
        
        func: function()
        {
            spawn_gravity_ball();
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Reset all Equipment",
        
        func: function()
        {
            var __struct = global.equipment;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                mitem.data.count = 0;
                mitem.data.collected = 0;
            }
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Reset all Uniques",
        
        func: function()
        {
            var __struct = global.unique_leaves;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                mitem.data.count = 0;
                mitem.data.collected = 0;
            }
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Reset Daily Rewards",
        
        func: function()
        {
            o_game.data.daily_rewards_claimed = [];
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Unclaim DLC items",
        
        func: function()
        {
            var __struct = global.shops.dlc;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                variable_struct_get(__struct, mkey).data.claimed_os = {};
            }
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Unlock all house items",
        
        func: function()
        {
            var __struct = global.house_items;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                mitem.data.unlocked = true;
            }
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Lock all house items",
        
        func: function()
        {
            var __struct = global.house_items;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                mitem.data.unlocked = false;
            }
        }
    }), new Gui_Item(UnknownEnum.Value_51, -1, 
    {
        height: 60
    }), new Gui_Item(UnknownEnum.Value_54, id, 
    {
        text: "Artifacts"
    }), gui_inline_button("Collect all Artifacts x1", function()
    {
        var __struct = global.artifacts;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            mitem.collect(true, 1);
        }
    }), gui_inline_button("Collect all Artifacts x100", function()
    {
        var __struct = global.artifacts;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            mitem.collect(true, 100);
        }
    }), gui_inline_button("Reset all Artifacts", function()
    {
        var __struct = global.artifacts;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            mitem.data.count = 0;
            mitem.data.collected = 0;
            mitem.generate_spawn_time(true);
        }
    }), gui_inline_button("Reduce spawn time absolute", function()
    {
        var __struct = global.artifacts;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            mitem.reduce_spawn_time_seconds(9999999);
        }
    }), gui_inline_button("Reduce spawn time relative 99%", function()
    {
        var __struct = global.artifacts;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            mitem.reduce_spawn_time_relative(0.99);
        }
    }), new Gui_Item(UnknownEnum.Value_51, -1, 
    {
        height: 60
    }), new Gui_Item(UnknownEnum.Value_54, id, 
    {
        text: "Equipment"
    }), gui_inline_button("equipment = 0", function()
    {
        var __struct = global.equipment;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            mitem.data.count = 0;
            mitem.data.level = 0;
        }
    }), gui_inline_button("equipment += 1", function()
    {
        var __struct = global.equipment;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            mitem.collect(1);
        }
    }), gui_inline_button("equipment += 1000", function()
    {
        var __struct = global.equipment;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            mitem.collect(1000);
        }
    }), gui_inline_button("equipment += 1m", function()
    {
        var __struct = global.equipment;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            mitem.collect(1000000);
        }
    }), gui_inline_button("equipment level = max", function()
    {
        var __struct = global.equipment;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            mitem.data.level = mitem.get_max_upgrade_level();
        }
    }), new Gui_Item(UnknownEnum.Value_51, -1, 
    {
        height: 60
    }), new Gui_Item(UnknownEnum.Value_54, id, 
    {
        text: "Trades"
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Clear trades",
        
        func: function()
        {
            global.trades = [];
            generate_trades(true);
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Refresh trade timer",
        
        func: function()
        {
            refresh_trades_refresh_timer();
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Expire timer",
        
        func: function()
        {
            o_game.data.stats.trades_refresh = get_time_object_from_datetime(date_current_datetime());
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Trade timers 100%",
        
        func: function()
        {
            var __array = global.trades;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                mitem.delivery_time = date_current_datetime();
            }
        }
    }), new Gui_Item(UnknownEnum.Value_51, -1, 
    {
        height: 60
    }), new Gui_Item(UnknownEnum.Value_54, id, 
    {
        text: "Tower/Pyramid"
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Set high Tower/Pyramid floors",
        
        func: function()
        {
            global.areas.tower.data.highest_floor = 10000;
            global.areas.tower.data.highest_floor_stats = 10000;
            global.areas.inner_pyramid.data.highest_floor = 100;
            global.areas.inner_pyramid.data.highest_floor_stats = 100;
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Set Tower Floor +1",
        
        func: function()
        {
            tower_advance_floor(1);
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Set Tower Floor +10",
        
        func: function()
        {
            tower_advance_floor(10);
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Set Tower Floor = 10",
        
        func: function()
        {
            global.current_tower_floor = 9;
            tower_advance_floor(1);
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Set Tower Floor = 40",
        
        func: function()
        {
            global.current_tower_floor = 39;
            tower_advance_floor(1);
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Set Tower Floor = 70",
        
        func: function()
        {
            global.current_tower_floor = 69;
            tower_advance_floor(1);
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Set Tower Floor = 100",
        
        func: function()
        {
            global.current_tower_floor = 99;
            tower_advance_floor(1);
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Set Tower Floor = 110",
        
        func: function()
        {
            global.current_tower_floor = 109;
            tower_advance_floor(1);
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Set Tower Floor = 200",
        
        func: function()
        {
            global.current_tower_floor = 199;
            tower_advance_floor(1);
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Unlock Milestones",
        
        func: function()
        {
            var __struct = global.milestones;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                var __struct2 = mitem.milestones;
                var __prop_names2 = struct_get_names(__struct2);
                var __prop_len2 = array_length(__prop_names2);
                for (var __i2 = 0; __i2 < __prop_len2; __i2++)
                {
                    var mkey2 = __prop_names2[__i2];
                    var mitem2 = variable_struct_get(__struct2, mkey2);
                    mitem2.data.count = 1;
                }
            }
        }
    }), new Gui_Item(UnknownEnum.Value_51, -1, 
    {
        height: 60
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Spawn unique leaf",
        
        func: function()
        {
            spawn_unique_leaf(global.unique_leaves.bone);
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Spawn random equipment item",
        
        func: function()
        {
            drop_random_equipment(room_width / 2, room_height / 2);
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Spawn all equipment items",
        
        func: function()
        {
            var __struct = global.equipment;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                spawn_equipment_item(room_width / 2, room_height / 2, mitem);
            }
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Spawn random scroll",
        
        func: function()
        {
            drop_random_scroll();
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Spawn all scrolls",
        
        func: function()
        {
            var __struct = global.scrolls;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                spawn_scroll(mitem);
            }
        }
    }), new Gui_Item(UnknownEnum.Value_51, -1, 
    {
        height: 60
    }), new Gui_Item(UnknownEnum.Value_54, id, 
    {
        text: "Crafting"
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Delete all crafted",
        
        func: function()
        {
            delete_all_crafted_leaves();
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Craft all types",
        
        func: function()
        {
            var __array = global.craft_leaf_types_rarity_array;
            var __prop_len = array_length(__array);
            var __i = __prop_len - 1;
            while (__i >= 0)
            {
                var mitem = __array[__i];
                var __ireal = __prop_len - 1 - __i;
                craft_leaf_type(mitem, 
                {
                    quality_base: 95
                });
                __i--;
            }
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Craft 6x 90%",
        
        func: function()
        {
            repeat (6)
            {
                craft_leaf(
                {
                    quality_base: 90
                });
            }
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Craft 6x 100% Ancient",
        
        func: function()
        {
            repeat (6)
            {
                craft_leaf_type(global.craft_leaf_types.ancient, 
                {
                    quality_base: 100,
                    quality: 100
                });
            }
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Craft 6x 100% Biotite",
        
        func: function()
        {
            repeat (6)
            {
                craft_leaf_type(global.craft_leaf_types.biotite, 
                {
                    quality_base: 100,
                    quality: 100
                });
            }
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Craft 6x 100% Malachite",
        
        func: function()
        {
            repeat (6)
            {
                craft_leaf_type(global.craft_leaf_types.malachite, 
                {
                    quality_base: 100,
                    quality: 100
                });
            }
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Craft 6x 100% Hematite",
        
        func: function()
        {
            repeat (6)
            {
                craft_leaf_type(global.craft_leaf_types.hematite, 
                {
                    quality_base: 100,
                    quality: 100
                });
            }
        }
    }), new Gui_Item(UnknownEnum.Value_51, -1, 
    {
        height: 60
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Blower Test",
        
        func: function()
        {
            o_blower.x = (room_width / 2) - 30;
            o_blower.y = room_height / 2;
            create_leaf((room_width / 2) + 30, room_height / 2, global.resources.leaves);
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Blower Max HP",
        
        func: function()
        {
            hit_blower(-o_blower.hp_max);
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Blower dmg override",
        
        func: function()
        {
            global.game_settings.blower_enemy_damage_override = !global.game_settings.blower_enemy_damage_override;
            log("Blower enemy damage override = ", global.game_settings.blower_enemy_damage_override);
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Blower dmg = max",
        
        func: function()
        {
            global.game_settings.blower_enemy_damage_override_value = global.max_num;
            log("Blower enemy damage = ", global.game_settings.blower_enemy_damage_override_value);
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Disable All House Items",
        
        func: function()
        {
            var __struct = global.house_items;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                variable_struct_get(__struct, mkey).data.unlocked = false;
            }
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Enable All House Items",
        
        func: function()
        {
            var __struct = global.house_items;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                variable_struct_get(__struct, mkey).data.unlocked = true;
            }
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "All challenges incomplete",
        
        func: function()
        {
            var __struct = global.challenges;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                variable_struct_get(__struct, mkey).data.finished = 0;
            }
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "All challenges complete",
        
        func: function()
        {
            var __struct = global.challenges;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                variable_struct_get(__struct, mkey).data.finished = 1;
            }
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Cursed Count = 0 | 10",
        
        func: function()
        {
            o_game.data.stats.cursed_count = (o_game.data.stats.cursed_count > 0) ? 0 : 10;
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "GC Stats",
        
        func: function()
        {
            log(gc_get_stats());
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "GC Target Frame Time",
        
        func: function()
        {
            if (!variable_global_exists("gctft"))
            {
                global.gctft = 100;
            }
            if (global.gctft == 100)
            {
                global.gctft = 200;
            }
            else if (global.gctft == 200)
            {
                global.gctft = 500;
            }
            else if (global.gctft == 500)
            {
                global.gctft = 10;
            }
            else if (global.gctft == 10)
            {
                global.gctft = 50;
            }
            else if (global.gctft == 50)
            {
                global.gctft = 100;
            }
            gc_target_frame_time(global.gctft);
            log("gctft", global.gctft);
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Change lang DE",
        
        func: function()
        {
            load_i18n("de");
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Change player ID",
        
        func: function()
        {
            o_game.data.player_id = "test 123";
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Go to afk room",
        
        func: function()
        {
            room_goto(r_afk);
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Spawn 100 enemies",
        
        func: function()
        {
            repeat (100)
            {
                check_spawn_enemy();
            }
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Spawn Debug Boss",
        
        func: function()
        {
            log("Spawn debug boss level", global.debug_value);
            spawn_enemy(global.enemies.boss_centaur, true, global.debug_value);
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Spawn 100 borbs",
        
        func: function()
        {
            repeat (100)
            {
                check_spawn_borbs();
            }
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Spawn 100 gem leaves",
        
        func: function()
        {
            repeat (100)
            {
                create_leaf(400, 400, global.resources.ruby, true);
            }
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Unlock/Add Scrolls",
        
        func: function()
        {
            var __struct = global.scrolls;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                variable_struct_get(__struct, mkey).data.unlocked = true;
                variable_struct_get(__struct, mkey).data.count = 10;
                variable_struct_get(__struct, mkey).data.collected = 10;
            }
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Clear dungeon",
        
        func: function()
        {
            dungeon_clear();
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Add 10 random Chests",
        
        func: function()
        {
            repeat (10)
            {
                var chest = array_random_item(global.chests_array);
                chest.collect();
            }
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Add 1000 all Chests",
        
        func: function()
        {
            var __struct = global.chests;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                mitem.collect(1000);
            }
        }
    }), new Gui_Item(UnknownEnum.Value_51, -1, 
    {
        height: 60
    }), new Gui_Item(UnknownEnum.Value_54, id, 
    {
        text: "Relics"
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Reset Relics",
        
        func: function()
        {
            var __struct = global.relics;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                mitem.data.count = 0;
            }
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "All Relics +1",
        
        func: function()
        {
            var __struct = global.relics;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                mitem.collect();
            }
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "All Relics +10",
        
        func: function()
        {
            var __struct = global.relics;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                mitem.collect(10);
            }
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "All Common Relics +10",
        
        func: function()
        {
            var __array = global.relics_rarity_array.common;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                mitem.collect(10);
            }
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Drop Random Relic",
        
        func: function()
        {
            var relic = get_random_relic();
            relic.spawn();
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Drop Common Relic",
        
        func: function()
        {
            var relic = get_random_relic(global.relic_types.common.key);
            relic.spawn();
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Drop Uncommon Relic",
        
        func: function()
        {
            var relic = get_random_relic(global.relic_types.uncommon.key);
            relic.spawn();
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Drop Rare Relic",
        
        func: function()
        {
            var relic = get_random_relic(global.relic_types.rare.key);
            relic.spawn();
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Drop Epic Relic",
        
        func: function()
        {
            var relic = get_random_relic(global.relic_types.epic.key);
            relic.spawn();
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Drop Mythical Relic",
        
        func: function()
        {
            var relic = get_random_relic(global.relic_types.mythical.key);
            relic.spawn();
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Drop Legendary Relic",
        
        func: function()
        {
            var relic = get_random_relic(global.relic_types.legendary.key);
            relic.spawn();
        }
    }), new Gui_Item(UnknownEnum.Value_51, -1, 
    {
        height: 60
    }), new Gui_Item(UnknownEnum.Value_54, id, 
    {
        text: "Cards"
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "All Cards = 0",
        
        func: function()
        {
            var __struct = global.cards;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                mitem.data.count = 0;
            }
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "All Cards +1",
        
        func: function()
        {
            var __struct = global.cards;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                mitem.collect();
            }
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "All Cards +[1-3]",
        
        func: function()
        {
            var __struct = global.cards;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                mitem.collect(irandom_range(1, 3));
            }
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "All Cards +10",
        
        func: function()
        {
            var __struct = global.cards;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                mitem.collect(10);
            }
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Drop random card",
        
        func: function()
        {
            repeat (get_key_modifier())
            {
                drop_random_card();
            }
        }
    }), gui_inline_button("+10 Vulture", function()
    {
        global.cards.common_vulture.collect(10);
        global.cards.uncommon_vulture.collect(10);
        global.cards.rare_vulture.collect(10);
        global.cards.epic_vulture.collect(10);
        global.cards.legendary_vulture.collect(10);
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Drop super terror",
        
        func: function()
        {
            drop_random_card([global.cards.common_boss_terror_super]);
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Card Packs = 0",
        
        func: function()
        {
            var __struct = global.cards_packs;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                mitem.data.count = 0;
            }
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Card Packs +1",
        
        func: function()
        {
            var __struct = global.cards_packs;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                mitem.data.count += 1;
            }
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Card Packs +10",
        
        func: function()
        {
            var __struct = global.cards_packs;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                mitem.data.count += 10;
            }
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Card Packs +100",
        
        func: function()
        {
            var __struct = global.cards_packs;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                mitem.data.count += 100;
            }
        }
    }), new Gui_Item(UnknownEnum.Value_51, -1, 
    {
        height: 60
    }), gui_inline_button("Spawn area materials", function()
    {
        spawn_random_material();
    }), new Gui_Item(UnknownEnum.Value_51, -1, 
    {
        height: 60
    }), new Gui_Item(UnknownEnum.Value_54, id, 
    {
        text: "Cards"
    }), gui_inline_button("Add die", function()
    {
        create_battlefield_die(irandom_range(1, 100));
    }), new Gui_Item(UnknownEnum.Value_51, -1, 
    {
        height: 60
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Reset Leafscended",
        
        func: function()
        {
            var __struct = global.resources;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                if (!mitem.is_leaf)
                {
                    continue;
                }
                mitem.data.leafscend_count = {};
            }
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "All Leafscend +1",
        
        func: function()
        {
            var __array = global.resources_leaves;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                for (var i = 1; i <= global.game_settings.leafscend_max_level; i++)
                {
                    add_to_struct_value(mitem.data.leafscend_count, i, 1);
                }
            }
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Dig Benchmark",
        
        func: function()
        {
            var digs = {};
            var __array = global.dig_items;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                variable_struct_set(digs, mitem.key, 0);
            }
            var action_timeout = max(0.1, o_blower.blower.action_timeout * (1 - get_upgrade_attribute_value(global.upgrade_attributes.dig_reduce_timeout)));
            var count = (o_blower.blower.get_dig_count() + get_upgrade_attribute_value(global.upgrade_attributes.dig_count)) * (1 + get_upgrade_attribute_value(global.upgrade_attributes.dig_count_multiplier));
            var digs_per_minute = sec(60) / action_timeout;
            var digs_per_hour = digs_per_minute * 60;
            repeat (digs_per_hour)
            {
                repeat (count)
                {
                    __array = global.dig_items;
                    __prop_len = array_length(__array);
                    for (var __i = 0; __i < __prop_len; __i++)
                    {
                        var mitem = __array[__i];
                        var r = random(100);
                        r *= (1 - get_upgrade_attribute_value(global.upgrade_attributes.dig_item_chance_reduction));
                        if (r > mitem.chance)
                        {
                            continue;
                        }
                        variable_struct_set_post(digs, mitem.key, variable_struct_get(digs, mitem.key) + 1);
                    }
                }
            }
            log("==== DIGS RESULT ====");
            log(digs);
            log("---");
            log("digs per minute", digs_per_minute);
            log("digs per hour", digs_per_hour);
            var __struct = digs;
            var __prop_names = struct_get_names(__struct);
            __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                log(mkey, "per minute = ", mitem / 60, "per hour = ", mitem);
            }
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Relic Benchmark",
        
        func: function()
        {
            var relics = {};
            var __struct = global.relic_types;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                variable_struct_set(relics, mitem.key, 0);
            }
            var action_timeout = global.areas.exalted_bridge.boss_spawn_delay_duration;
            var count = 1;
            var actions_per_minute = sec(60) / action_timeout;
            var actions_per_hour = actions_per_minute * 60;
            repeat (actions_per_hour)
            {
                repeat (count)
                {
                    var relic = get_random_relic_by_type();
                    add_to_struct_value(relics, relic.type.key, 1);
                }
            }
            log("==== RELICS RESULT ====");
            log(relics);
            log("---");
            log("actions per minute", actions_per_minute);
            log("actions per hour", actions_per_hour);
            __struct = relics;
            __prop_names = struct_get_names(__struct);
            __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                log(mkey, "per minute = ", mitem / 60, "per hour = ", mitem);
            }
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Craft Benchmark",
        
        func: function()
        {
            var crafted = {};
            var __struct = global.craft_leaf_types;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                variable_struct_set(crafted, mkey, 0);
            }
            repeat (10000)
            {
                var type = get_random_craft_leaf_type();
                variable_struct_set_post(crafted, type.key, variable_struct_get(crafted, type.key) + 1);
            }
            log(crafted);
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Craft Benchmark Mod",
        
        func: function()
        {
            var crafted = {};
            var __struct = global.craft_leaf_types;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                variable_struct_set(crafted, mkey, 0);
            }
            var before = global.upgrade_attributes.craft_min_chance;
            global.upgrade_attributes.craft_min_chance = 50;
            repeat (10000)
            {
                var type = get_random_craft_leaf_type();
                variable_struct_set_post(crafted, type.key, variable_struct_get(crafted, type.key) + 1);
            }
            global.upgrade_attributes.craft_min_chance = before;
            log(crafted);
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Reset fps avg",
        
        func: function()
        {
            o_debug.fps_sum = 0;
            o_debug.fps_count = 0;
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Clear riddles",
        
        func: function()
        {
            o_game.data.stats.pub_lore_text_riddle_solved = false;
            o_game.data.stats.riddles = {};
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Unique Leaves Table",
        
        func: function()
        {
            var __array = global.unique_leaves_sorted;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                log(sprintf("%s\t\t%s\t\t%s", mitem.name, mitem.spawn_area.name));
            }
        }
    }), new Gui_Item(UnknownEnum.Value_6, id, 
    {
        button_text: "Shop Items List",
        
        func: function()
        {
            var shops = {};
            var __struct = global.shops;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                variable_struct_set(shops, mkey, {});
                var __struct2 = mitem;
                var __prop_names2 = struct_get_names(__struct2);
                var __prop_len2 = array_length(__prop_names2);
                for (var __i2 = 0; __i2 < __prop_len2; __i2++)
                {
                    var mkey2 = __prop_names2[__i2];
                    var mitem2 = variable_struct_get(__struct2, mkey2);
                    variable_struct_set(variable_struct_get(shops, mkey), mkey2, 
                    {
                        index: mitem2.index,
                        name: mitem2.name,
                        description: mitem2.description,
                        cost: mitem2.cost,
                        cost_exp: mitem2.cost_exp,
                        max_count: mitem2.max_count,
                        upgrade_attributes: mitem2.upgrade_attributes
                    });
                }
            }
            var shops_json = json_stringify(shops);
            save_string_to_file(shops_json, "shops.json");
            log("Shops written to file shops.json");
        }
    }), gui_inline_button("Borbcipherer solved", function()
    {
        o_game.data.flags.ff_prison_solved = true;
    })];
};

init_actions();

enum UnknownEnum
{
    Value_6 = 6,
    Value_51 = 51,
    Value_54 = 54
}
