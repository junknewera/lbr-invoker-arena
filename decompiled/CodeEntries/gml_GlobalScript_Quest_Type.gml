function Quest_Type(arg0) constructor
{
    name = "";
    description = "";
    index = 0;
    key = "";
    sprite = spr_placeholder;
    compare_with_start_value = false;
    display_materials = false;
    display_resources = false;
    generatable = true;
    include_in_daily_quests = false;
    is_daily = false;
    min_difficulty = 0;
    quest_value_min = 5;
    requirements = [];
    tracker = undefined;
    tracker_key = undefined;
    
    init = function()
    {
    };
    
    finish = function(arg0)
    {
        switch (self.key)
        {
            case global.quest_types.have_materials.key:
                dec_materials(arg0.materials);
                break;
            case global.quest_types.have_clovers.key:
            case global.quest_types.have_resources.key:
                dec_resources(arg0.resources);
                break;
        }
    };
    
    get_compare_value = function(arg0, arg1 = undefined)
    {
        if (is_undefined(arg1))
        {
            arg1 = arg0.current_stage_step;
        }
        var compare_value = 1;
        if (is_struct(arg1) && is_numeric(struct_get_from_hash(arg1, variable_get_hash("count"))))
        {
            compare_value = arg1.count;
        }
        return compare_value;
    };
    
    get_current_quest_value = function(arg0)
    {
        var value = 0;
        switch (self.key)
        {
            case global.quest_types.area_time.key:
                value = variable_struct_get(o_game.data.stats.areas_time, arg0.item_key);
                break;
            case global.quest_types.blow_leaves.key:
                value = o_game.data.stats.leaves_blown_total;
                break;
            case global.quest_types.borbventures_finished.key:
                value = o_game.data.stats.borbventures_finished;
                break;
            case global.quest_types.collect_artifacts.key:
                value = o_game.data.stats.artifacts_collected;
                break;
            case global.quest_types.collect_fruits.key:
                value = variable_struct_get(global.resources, arg0.tracker_key).data.count;
                break;
            case global.quest_types.collect_seeds.key:
                value = variable_struct_get(global.resources, arg0.tracker_key).data.count;
                break;
            case global.quest_types.combo_high.key:
                value = o_game.data.stats.combo_high;
                break;
            case global.quest_types.convert_crits.key:
                value = get_struct_sum(global.converters, "data", "converted_crits");
                break;
            case global.quest_types.convert_loops.key:
                value = get_struct_sum(global.converters, "data", "converted_loops");
                break;
            case global.quest_types.craft_leaves.key:
                value = o_game.data.stats.crafted_leaves;
                break;
            case global.quest_types.curses.key:
                value = o_game.data.stats.cursed_count;
                break;
            case global.quest_types.dig.key:
                value = o_game.data.stats.digs;
                break;
            case global.quest_types.enemies_defeated.key:
                value = get_defeated_enemies_count();
                break;
            case global.quest_types.freebie.key:
                value = 0;
                break;
            case global.quest_types.get_artifact.key:
                value = variable_struct_get(global.artifacts, arg0.item_key).data.collected;
                break;
            case global.quest_types.get_unique_leaf.key:
                value = variable_struct_get(global.unique_leaves, arg0.item_key).data.count;
                break;
            case global.quest_types.have_materials.key:
                var __struct = arg0.materials;
                var __prop_names = struct_get_names(__struct);
                var __prop_len = array_length(__prop_names);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mkey = __prop_names[__i];
                    var mitem = variable_struct_get(__struct, mkey);
                    value = variable_struct_get(global.materials, mkey).data.count;
                }
                break;
            case global.quest_types.have_printers.key:
                o_game.data.stats.max_printer_count = max(o_game.data.stats.max_printer_count, get_data_count_sum(global.shops.printers));
                value = o_game.data.stats.max_printer_count;
                break;
            case global.quest_types.have_clovers.key:
                value = 0;
                break;
            case global.quest_types.have_resources.key:
                var __struct = arg0.resources;
                var __prop_names = struct_get_names(__struct);
                var __prop_len = array_length(__prop_names);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mkey = __prop_names[__i];
                    var mitem = variable_struct_get(__struct, mkey);
                    value = variable_struct_get(global.resources, mkey).data.count;
                }
                break;
            case global.quest_types.mine_veins.key:
                value = o_game.data.mines.veins_mined;
                break;
            case global.quest_types.petpet.key:
                value = o_game.data.stats.pets_pet;
                break;
            case global.quest_types.prestige_prestige.key:
                value = o_game.data.stats.prestige;
                break;
            case global.quest_types.prestige_crunch.key:
                value = o_game.data.stats.prestige_crunch;
                break;
            case global.quest_types.prestige_mlc.key:
                value = o_game.data.stats.prestige_mlc;
                break;
            case global.quest_types.print_leaf_type.key:
                value = get_default_struct_value(o_game.data.stats.prints_total_type, arg0.item_key, 0);
                break;
            case global.quest_types.print_leaves.key:
                value = o_game.data.stats.prints_total;
                break;
            case global.quest_types.pyramid_floor.key:
                value = 0;
                break;
            case global.quest_types.tower_floor.key:
                value = 0;
                break;
            case global.quest_types.trades.key:
                value = o_game.data.stats.trades_finished;
                break;
            case global.quest_types.unlock_area.key:
                value = get_upgrade_count(variable_struct_get(global.areas, arg0.item_key));
                break;
            case global.quest_types.unlock_pet.key:
                value = get_upgrade_count(variable_struct_get(global.pets, arg0.item_key));
                break;
            case global.quest_types.win_claw.key:
                value = o_game.data.stats.borb_claw_machine.won;
                break;
            case global.quest_types.win_slots.key:
                value = o_game.data.stats.slots.won;
                break;
        }
        return value;
    };
    
    get_current_value = function(arg0, arg1 = undefined)
    {
        if (is_undefined(arg1) && is_struct(struct_get_from_hash(arg0, variable_get_hash("current_stage_step"))))
        {
            arg1 = arg0.current_stage_step;
        }
        if (!is_struct(arg1))
        {
            return 0;
        }
        var value = self.get_current_quest_value(arg1);
        if (is_struct(arg0) && self.compare_with_start_value)
        {
            if (!is_numeric(struct_get_from_hash(arg1, variable_get_hash("start_value"))))
            {
                arg1.start_value = self.get_start_value(arg0, arg1);
            }
            value -= arg1.start_value;
        }
        return value;
    };
    
    get_start_value = function(arg0, arg1 = undefined)
    {
        if (is_undefined(arg1))
        {
            arg1 = arg0.current_stage_step;
        }
        var value = 0;
        switch (self.key)
        {
            case global.quest_types.area_time.key:
                value = variable_struct_get(o_game.data.stats.areas_time, arg1.item_key);
                break;
            case global.quest_types.blow_leaves.key:
                value = o_game.data.stats.leaves_blown_total;
                break;
            case global.quest_types.borbventures_finished.key:
                value = o_game.data.stats.borbventures_finished;
                break;
            case global.quest_types.collect_artifacts.key:
                value = o_game.data.stats.artifacts_collected;
                break;
            case global.quest_types.collect_fruits.key:
                value = variable_struct_get(global.resources, arg1.tracker_key).data.count;
                break;
            case global.quest_types.collect_seeds.key:
                value = variable_struct_get(global.resources, arg1.tracker_key).data.count;
                break;
            case global.quest_types.combo_high.key:
                value = 0;
                break;
            case global.quest_types.convert_crits.key:
                value = get_struct_sum(global.converters, "data", "converted_crits");
                break;
            case global.quest_types.convert_loops.key:
                value = get_struct_sum(global.converters, "data", "converted_loops");
                break;
            case global.quest_types.craft_leaves.key:
                value = o_game.data.stats.crafted_leaves;
                break;
            case global.quest_types.curses.key:
                value = o_game.data.stats.cursed_count;
                break;
            case global.quest_types.dig.key:
                value = o_game.data.stats.digs;
                break;
            case global.quest_types.enemies_defeated.key:
                value = get_defeated_enemies_count();
                break;
            case global.quest_types.freebie.key:
                value = 0;
                break;
            case global.quest_types.get_artifact.key:
                value = variable_struct_get(global.artifacts, arg1.item_key).data.collected;
                break;
            case global.quest_types.get_unique_leaf.key:
                value = variable_struct_get(global.unique_leaves, arg1.item_key).data.count;
                break;
            case global.quest_types.have_materials.key:
                value = 0;
                break;
            case global.quest_types.have_printers.key:
                value = 0;
                break;
            case global.quest_types.have_clovers.key:
            case global.quest_types.have_resources.key:
                value = 0;
                break;
            case global.quest_types.mine_veins.key:
                value = o_game.data.mines.veins_mined;
                break;
            case global.quest_types.petpet.key:
                value = o_game.data.stats.pets_pet;
                break;
            case global.quest_types.prestige_prestige.key:
                value = o_game.data.stats.prestige;
                break;
            case global.quest_types.prestige_crunch.key:
                value = o_game.data.stats.prestige_crunch;
                break;
            case global.quest_types.prestige_mlc.key:
                value = o_game.data.stats.prestige_mlc;
                break;
            case global.quest_types.print_leaf_type.key:
                value = get_default_struct_value(o_game.data.stats.prints_total_type, arg1.item_key, 0);
                break;
            case global.quest_types.print_leaves.key:
                value = o_game.data.stats.prints_total;
                break;
            case global.quest_types.pyramid_floor.key:
                value = 0;
                break;
            case global.quest_types.tower_floor.key:
                value = 0;
                break;
            case global.quest_types.trades.key:
                value = o_game.data.stats.trades_finished;
                break;
            case global.quest_types.unlock_area.key:
                value = get_upgrade_count(variable_struct_get(global.areas, arg1.item_key));
                break;
            case global.quest_types.unlock_pet.key:
                value = get_upgrade_count(variable_struct_get(global.pets, arg1.item_key));
                break;
            case global.quest_types.win_claw.key:
                value = o_game.data.stats.borb_claw_machine.won;
                break;
            case global.quest_types.win_slots.key:
                value = o_game.data.stats.slots.won;
                break;
        }
        return value;
    };
    
    is_stage_step_fulfilled = function(arg0, arg1 = undefined)
    {
        if (is_undefined(arg1))
        {
            arg1 = arg0.current_stage_step;
        }
        var compare_value = self.get_compare_value(arg0, arg1);
        var fulfilled = false;
        if (self.compare_with_start_value)
        {
            if (!is_numeric(struct_get_from_hash(arg1, variable_get_hash("start_value"))))
            {
                arg1.start_value = self.get_start_value(arg0, arg1);
            }
            fulfilled = (self.get_start_value(arg0, arg1) - arg1.start_value) >= compare_value;
        }
        else
        {
            switch (self.key)
            {
                case global.quest_types.blow_leaves.key:
                    fulfilled = o_game.data.stats.leaves_blown_total >= compare_value;
                    break;
                case global.quest_types.collect_artifacts.key:
                    fulfilled = o_game.data.stats.artifacts_collected >= compare_value;
                    break;
                case global.quest_types.collect_fruits.key:
                    fulfilled = variable_struct_get(global.resources, arg1.tracker_key).data.count >= compare_value;
                    break;
                case global.quest_types.collect_seeds.key:
                    fulfilled = variable_struct_get(global.resources, arg1.tracker_key).data.count >= compare_value;
                    break;
                case global.quest_types.combo_high.key:
                    fulfilled = o_game.data.stats.combo_high >= compare_value;
                    break;
                case global.quest_types.convert_crits.key:
                    fulfilled = get_struct_sum(global.converters, "data", "converted_crits") >= compare_value;
                    break;
                case global.quest_types.convert_loops.key:
                    fulfilled = get_struct_sum(global.converters, "data", "converted_loops") >= compare_value;
                    break;
                case global.quest_types.craft_leaves.key:
                    fulfilled = o_game.data.stats.crafted_leaves >= compare_value;
                    break;
                case global.quest_types.curses.key:
                    fulfilled = o_game.data.stats.cursed_count >= compare_value;
                    break;
                case global.quest_types.enemies_defeated.key:
                    fulfilled = get_defeated_enemies_count() >= compare_value;
                    break;
                case global.quest_types.freebie.key:
                    fulfilled = true;
                    break;
                case global.quest_types.get_artifact.key:
                    fulfilled = variable_struct_get(global.artifacts, arg1.item_key).data.collected >= 1;
                    break;
                case global.quest_types.get_unique_leaf.key:
                    fulfilled = variable_struct_get(global.unique_leaves, arg1.item_key).data.count >= 1;
                    break;
                case global.quest_types.have_materials.key:
                    fulfilled = has_enough_materials(arg1.materials);
                    break;
                case global.quest_types.have_printers.key:
                    fulfilled = get_data_count_sum(global.shops.printers) >= compare_value;
                    break;
                case global.quest_types.have_clovers.key:
                case global.quest_types.have_resources.key:
                    fulfilled = has_enough_resources(arg1.resources);
                    break;
                case global.quest_types.prestige_prestige.key:
                    fulfilled = o_game.data.stats.prestige >= compare_value;
                    break;
                case global.quest_types.prestige_crunch.key:
                    fulfilled = o_game.data.stats.prestige_crunch >= compare_value;
                    break;
                case global.quest_types.prestige_mlc.key:
                    fulfilled = o_game.data.stats.prestige_mlc >= compare_value;
                    break;
                case global.quest_types.print_leaf_type.key:
                    fulfilled = get_default_struct_value(o_game.data.stats.prints_total_type, arg1.item_key, 0) >= compare_value;
                    break;
                case global.quest_types.print_leaves.key:
                    fulfilled = o_game.data.stats.prints_total >= compare_value;
                    break;
                case global.quest_types.pyramid_floor.key:
                    fulfilled = global.areas.inner_pyramid.get_highest_floor_current_run() >= compare_value;
                    break;
                case global.quest_types.tower_floor.key:
                    fulfilled = global.areas.tower.get_highest_floor_current_run() >= compare_value;
                    break;
                case global.quest_types.unlock_area.key:
                    fulfilled = get_upgrade_count(variable_struct_get(global.areas, arg1.item_key)) >= 1;
                    break;
                case global.quest_types.unlock_pet.key:
                    fulfilled = get_upgrade_count(variable_struct_get(global.pets, arg1.item_key)) >= 1;
                    break;
            }
        }
        return fulfilled;
    };
    
    get_random_data = function(arg0 = 0, arg1 = undefined)
    {
        var data = {};
        var difficulty_value = arg0 + 1;
        if (is_empty(self.key))
        {
            return data;
        }
        data.count = 0;
        data.start_value = 0;
        switch (self.key)
        {
            case global.quest_types.area_time.key:
                var cmin = difficulty_value * 180;
                var cmax = cmin;
                var items = global.quest_available_areas;
                var area = array_random_item(items);
                data.count = irandom_range(cmin, cmax);
                data.item_key = area.key;
                break;
            case global.quest_types.blow_leaves.key:
                var cmin = difficulty_value * 1000;
                var cmax = cmin * 2;
                data.count = irandom_range(cmin, cmax);
                break;
            case global.quest_types.collect_artifacts.key:
                var cmin = difficulty_value * 3;
                var cmax = cmin * 2;
                data.count = irandom_range(cmin, cmax);
                break;
            case global.quest_types.collect_fruits.key:
                var cmin = difficulty_value * 30;
                var cmax = cmin * 2;
                data.count = irandom_range(cmin, cmax);
                data.tracker_key = self.tracker.key;
                break;
            case global.quest_types.collect_seeds.key:
                var cmin = difficulty_value * 3;
                var cmax = cmin * 2;
                data.count = irandom_range(cmin, cmax);
                data.tracker_key = self.tracker.key;
                break;
            case global.quest_types.combo_high.key:
                var cmin = difficulty_value * 100;
                var cmax = cmin * 2;
                data.count = irandom_range(cmin, cmax);
                break;
            case global.quest_types.convert_crits.key:
                var cmin = difficulty_value * 10;
                var cmax = cmin * 2;
                data.count = irandom_range(cmin, cmax);
                break;
            case global.quest_types.convert_loops.key:
                var cmin = difficulty_value * 300;
                var cmax = cmin * 2;
                data.count = irandom_range(cmin, cmax);
                break;
            case global.quest_types.craft_leaves.key:
                var cmin = difficulty_value * 20;
                var cmax = cmin * 2;
                data.count = irandom_range(cmin, cmax);
                break;
            case global.quest_types.curses.key:
                var cmin = difficulty_value * 3;
                var cmax = cmin * 2;
                data.count = irandom_range(cmin, cmax);
                break;
            case global.quest_types.enemies_defeated.key:
                var cmin = difficulty_value * 20;
                var cmax = cmin * 2;
                data.count = irandom_range(cmin, cmax);
                break;
            case global.quest_types.freebie.key:
                data.count = 1;
                break;
            case global.quest_types.get_artifact.key:
                var artifact = array_random_item(global.artifacts_generatable);
                data.item_key = artifact.key;
                break;
            case global.quest_types.get_unique_leaf.key:
                var uleaf = array_random_item(global.unique_leaves_sorted);
                data.item_key = uleaf.key;
                break;
            case global.quest_types.have_clovers.key:
                if (is_struct(arg1))
                {
                    data.resources = arg1.requirements.resources;
                }
                else
                {
                    var items = array_random_items([global.resources.clover_basic3, global.resources.clover_basic4], 1, true);
                    data.resources = {};
                    var __array = items;
                    var __prop_len = array_length(__array);
                    for (var __i = 0; __i < __prop_len; __i++)
                    {
                        var mitem = __array[__i];
                        var res_count_min = 1;
                        var res_count_max = 10;
                        variable_struct_set(data.resources, mitem.key, irandom_range(res_count_min, res_count_max));
                    }
                }
                break;
            case global.quest_types.have_materials.key:
                var mat_count = 1 + min(3, floor(arg0 / 2));
                var mat_count_min = 2 + (arg0 * 2);
                var mat_count_max = mat_count_min * 2;
                var mat_items = array_random_items(global.materials_generatable_in_quests, mat_count, true);
                data.materials = {};
                var __array = mat_items;
                var __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    variable_struct_set(data.materials, mitem.key, irandom_range(mat_count_min, mat_count_max));
                }
                break;
            case global.quest_types.have_printers.key:
                var cmin = difficulty_value * 30;
                var cmax = cmin * 2;
                data.count = irandom_range(cmin, cmax);
                break;
            case global.quest_types.have_resources.key:
                var count = 1 + floor(arg0 / 2);
                var count_min = 10 * power(10, difficulty_value * 5);
                var count_max = count_min * 5;
                var items = array_random_items(global.resources_array_quests, count, true);
                data.resources = {};
                var __array = items;
                var __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    var res_count_min = count_min * mitem.print_value_multiplier;
                    var res_count_max = count_min * mitem.print_value_multiplier;
                    variable_struct_set(data.resources, mitem.key, irandom_range(res_count_min, res_count_max));
                }
                break;
            case global.quest_types.prestige_prestige.key:
                var cmin = difficulty_value * 5;
                var cmax = cmin * 2;
                data.count = irandom_range(cmin, cmax);
                break;
            case global.quest_types.prestige_crunch.key:
                var cmin = difficulty_value * 3;
                var cmax = cmin * 2;
                data.count = irandom_range(cmin, cmax);
                break;
            case global.quest_types.prestige_mlc.key:
                var cmin = difficulty_value * 1;
                var cmax = cmin * 2;
                data.count = irandom_range(cmin, cmax);
                break;
            case global.quest_types.print_leaf_type.key:
                var cmin = difficulty_value * 100;
                var cmax = cmin * 2;
                var item = array_random_item(global.resources_printable);
                data.count = irandom_range(cmin, cmax);
                data.item_key = item.key;
                break;
            case global.quest_types.print_leaves.key:
                var cmin = difficulty_value * 400;
                var cmax = cmin * 2;
                data.count = irandom_range(cmin, cmax);
                break;
            case global.quest_types.pyramid_floor.key:
                var cmin = 2 + arg0;
                var cmax = cmin + 1;
                data.count = irandom_range(cmin, cmax);
                break;
            case global.quest_types.tower_floor.key:
                var cmin = difficulty_value * 10;
                var cmax = cmin * 2;
                data.count = irandom_range(cmin, cmax);
                break;
            case global.quest_types.unlock_area.key:
                var items = global.quest_available_areas;
                var item = array_random_item(items);
                data.item_key = item.key;
                break;
            case global.quest_types.unlock_pet.key:
                var item = array_random_item(global.pets_sorted);
                data.item_key = item.key;
                break;
            default:
                var cmin = difficulty_value * self.quest_value_min;
                var cmax = cmin * 2;
                data.count = irandom_range(cmin, cmax);
                break;
        }
        return data;
    };
    
    get_name = function()
    {
        var name = get_value_ext(self, self.name, false);
        return name;
    };
    
    get_description = function(arg0, arg1)
    {
        if (is_undefined(arg1))
        {
            return log("=== INVALID QUEST ===");
        }
        var compare_value_final = 1;
        var current_value = self.get_current_value(arg0, arg1);
        var desc = get_value_ext(self, self.description, false);
        var use_auto_desc = self.compare_with_start_value;
        if (is_struct(arg0))
        {
            compare_value_final = self.get_compare_value(arg0, arg1);
        }
        switch (self.key)
        {
            case global.quest_types.area_time.key:
                desc += format_text_numbers(__s("Spend time at %s", variable_struct_get(global.areas, arg1.item_key).name), format_time(current_value, undefined, true, 0), format_time(compare_value_final, undefined, true, "-"), undefined, false);
                use_auto_desc = false;
                break;
            case global.quest_types.blow_leaves.key:
                desc += __s("Blow %s leaves", number_format(arg1.count));
                break;
            case global.quest_types.collect_artifacts.key:
                desc += __s("Collect %s Artifacts", number_format(arg1.count));
                break;
            case global.quest_types.collect_fruits.key:
                desc += __s("Collect %s fruits", number_format(arg1.count));
                break;
            case global.quest_types.collect_seeds.key:
                desc += __s("Collect %s seeds", number_format(arg1.count));
                break;
            case global.quest_types.combo_high.key:
                desc += __s("Reach combo: %s", number_format(arg1.count));
                break;
            case global.quest_types.convert_crits.key:
                desc += __s("Convert %s crits", number_format(arg1.count));
                break;
            case global.quest_types.convert_loops.key:
                desc += __s("%s Converter loops", number_format(arg1.count));
                break;
            case global.quest_types.craft_leaves.key:
                desc += __s("Craft %s leaves", number_format(arg1.count));
                break;
            case global.quest_types.curses.key:
                desc += __s("Get Cursed %sx", number_format(arg1.count));
                break;
            case global.quest_types.enemies_defeated.key:
                desc += __s("Defeat %s enemies", number_format(arg1.count));
                break;
            case global.quest_types.freebie.key:
                desc += __("LEAF");
                break;
            case global.quest_types.get_artifact.key:
                desc += __s("Obtain %s", variable_struct_get(global.artifacts, arg1.item_key).name);
                break;
            case global.quest_types.get_unique_leaf.key:
                desc += __s("Obtain %s", variable_struct_get(global.unique_leaves, arg1.item_key).name);
                break;
            case global.quest_types.have_clovers.key:
                desc += __s("Obtain %s", format_resources_text(arg1.resources));
                break;
            case global.quest_types.have_materials.key:
                desc += __s("Obtain %s", format_materials_text(arg1.materials));
                break;
            case global.quest_types.have_printers.key:
                desc += __s("Have %s printers", number_format(arg1.count));
                break;
            case global.quest_types.have_resources.key:
                desc += __s("Obtain %s", format_resources_text(arg1.resources));
                break;
            case global.quest_types.prestige_prestige.key:
                desc += __s("Prestige %sx", number_format(arg1.count));
                break;
            case global.quest_types.prestige_crunch.key:
                desc += __s("Big Leaf Crunch %sx", number_format(arg1.count));
                break;
            case global.quest_types.prestige_mlc.key:
                desc += __s("Mega Leaf Crunch %sx", arg1.count);
                break;
            case global.quest_types.print_leaf_type.key:
                desc += __s("Print %s %s", arg1.count, variable_struct_get(global.resources, arg1.item_key).name_plural);
                break;
            case global.quest_types.print_leaves.key:
                desc += __s("%s leaves printed", number_format(arg1.count));
                break;
            case global.quest_types.pyramid_floor.key:
                desc += __s("Clear Pyramid floor %s", arg1.count);
                break;
            case global.quest_types.tower_floor.key:
                desc += __s("Reach Tower floor %s", arg1.count);
                break;
            case global.quest_types.unlock_area.key:
                desc += __s("Unlock: %s", variable_struct_get(global.areas, arg1.item_key).name);
                break;
            case global.quest_types.unlock_pet.key:
                desc += __s("Unlock: %s", variable_struct_get(global.pets, arg1.item_key).name);
                break;
        }
        if (use_auto_desc)
        {
            desc = format_text_numbers(desc, current_value, compare_value_final);
        }
        return desc;
    };
    
    set_local_vars(arg0);
    set_sprite_data(self);
    init();
}
