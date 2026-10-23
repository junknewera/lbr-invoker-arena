function Area(arg0) constructor
{
    name = __("Unknown Area");
    description = __("The developer was too lazy to provide a description. Blame him.");
    description_locked = "?";
    sprite = spr_placeholder;
    sprite_orig = spr_placeholder;
    attribute = 
    {
        key: "unknown",
        value: 1
    };
    bgcolor = 5609803;
    bgcolor_blend = undefined;
    bgsprite = -1;
    bgsprite_stretch = -1;
    boss_spawned = false;
    boss_spawn_delay_duration = global.game_settings.boss_spawn_delay_duration;
    cache = {};
    can_autoteleport = true;
    can_dig = true;
    can_draw_resources = true;
    can_merge = true;
    can_spawn_albs = __return_true;
    can_spawn_area_leaves = true;
    can_use_artifacts = true;
    charge_energy = false;
    cost = 
    {
        coins: 10
    };
    cost_materials = undefined;
    data_start = 
    {
        auto_teleport: false,
        boss_spawn_delay: 0,
        count: 0,
        fav: false,
        floors_bought: 0,
        floors_skipped: 0,
        floors_stats: {},
        highest_floor: 1,
        highest_floor_run: -1,
        highest_floor_stats: 1,
        selected_floor: 1
    };
    data = struct_clone(self.data_start);
    enemy = [];
    enemy_defeat_counter = 0;
    enemy_reward_counter = 0;
    equipment_droppable = [];
    floor_entered = 0;
    galaxy = undefined;
    generatable_in_quests = false;
    has_boss = false;
    hp_drain = 0;
    hp_drain_types = undefined;
    init_once_flag = false;
    is_buyable = true;
    is_horde = false;
    key = "";
    last_horde_result = undefined;
    last_horde_run = undefined;
    level = 1;
    materials = [];
    max_count = 1;
    max_enemies = 5;
    mirror_resources = [];
    npc = [];
    persist_prestige = false;
    player_visible = true;
    quark_level = 0;
    resources = [global.resources.leaves];
    resources_droppable = [global.resources.leaves];
    resources_unlock = [];
    section = global.dialog_sections.areas.leaf_galaxy;
    show_leaves_visibility_text = false;
    spawn_chance_custom = -1;
    self.spawn_seeds = true;
    teleport_disabled = false;
    time_end = 0;
    time_entered = 0;
    trees = true;
    type = global.area_types.def;
    unlocked_start = false;
    width = 960;
    height = 540;
    index = 0;
    set_sprite_data(self);
    
    init = function()
    {
        struct_apply_defaults(self.data, self.data_start);
        if (self.unlocked_start)
        {
            self.data.count = 1;
            self.data.unlocked = true;
        }
        if (get_upgrade_count(self) > 0)
        {
            self.unlock();
        }
        self.has_boss = _any(self.enemy, function(arg0)
        {
            return arg0.is_boss;
        });
        if (!self.init_once_flag)
        {
            self.init_once_flag = true;
            if (!is_undefined(self.galaxy) && self.has_boss)
            {
                var __array = self.enemy;
                var __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    if (mitem.is_boss)
                    {
                        array_push(self.galaxy.enemy, mitem);
                    }
                    mitem.galaxy = self.galaxy;
                }
            }
            if (is_same_key(self.type, global.area_types.tower))
            {
                var __array = global.enemies_tower_bosses;
                var __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    array_push(self.galaxy.enemy, mitem);
                    mitem.galaxy = self.galaxy;
                }
            }
            else if (is_same_key(self.type, global.area_types.horde))
            {
                self.is_horde = true;
            }
        }
    };
    
    area_init = function()
    {
        if (in_array(self.type.key, [global.area_types.dungeon.key, global.area_types.tower.key]))
        {
            global.current_tower_floor = self.data.selected_floor;
        }
        if (self.boss_spawned)
        {
            self.spawn_boss(false);
        }
        self.equipment_droppable = [];
        var __struct = global.equipment;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            if (array_key_in_array([self.key], mitem.drop_areas))
            {
                array_push(self.equipment_droppable, mitem);
            }
        }
    };
    
    button_text = function()
    {
        var has_upgrade = get_upgrade_count(self) > 0;
        if (self._is_buyable() && !has_upgrade)
        {
            return __("Buy");
        }
        return iif(o_game.area.key == self.key, __("You're here"), __("Teleport"));
    };
    
    buy = function()
    {
        if (!self._is_buyable())
        {
            return false;
        }
        var dec_func = dec_resources;
        if (is_struct(self.cost_materials))
        {
            dec_func = dec_materials;
        }
        dec_func(self.get_unlock_cost());
        self.data.count++;
        self.data.collected++;
        self.buy_after();
    };
    
    buy_after = __void;
    
    _can_spawn_borbs = function()
    {
        return get_upgrade_count(global.shops.benitoite.unlock_borbs) > 0 && instance_number(o_borb) <= 10 && self.type.can_spawn_borbs && self.can_spawn_borbs();
    };
    
    can_spawn_borbs = __return_true;
    
    can_spawn_boss = function()
    {
        if (instance_exists(o_enemy_boss) || self.boss_spawned || o_game.data.stats.time_elapsed < self.data.boss_spawn_delay)
        {
            return false;
        }
        return true;
    };
    
    can_teleport = function()
    {
        if (self.teleport_disabled)
        {
            return false;
        }
        if (self.is_obfuscated())
        {
            return false;
        }
        if (!self.is_buyable)
        {
            if (!self.check())
            {
                return false;
            }
        }
        if (self.is_buyable && self.data.count == 0)
        {
            return false;
        }
        return true;
    };
    
    check = function()
    {
        if (self._is_buyable() && get_upgrade_count(self) == 0)
        {
            return false;
        }
        return true;
    };
    
    check_gui = function()
    {
        var has_upgrade = get_upgrade_count(self) > 0;
        if (self._is_buyable() && !has_upgrade)
        {
            var check_func = has_enough_resources;
            if (is_struct(self.cost_materials))
            {
                check_func = has_enough_materials;
            }
            return check_func(self.get_unlock_cost());
        }
        if (o_game.area.key == self.key)
        {
            return false;
        }
        if (!global.can_teleport)
        {
            return false;
        }
        if (self.teleport_disabled)
        {
            return false;
        }
        return get_value_ext(self, self.check);
    };
    
    check_spawn_enemy = function()
    {
        if (!can_spawn_enemy())
        {
            exit;
        }
        var spawn_chance = 5 + global.upgrade_attributes.enemy_spawn_chance;
        if (self.type.spawn_chance_custom != -1)
        {
            spawn_chance = self.type.spawn_chance_custom;
        }
        if (!percent_chance(spawn_chance))
        {
            exit;
        }
        if (self.type.key == global.area_types.tower.key)
        {
            spawn_random_tower_enemy();
        }
        else if (self.type.key == global.area_types.dungeon.key)
        {
            if (!global.current_dungeon_boss_spawned)
            {
                if (global.current_tower_floor_enemies_defeated >= global.current_tower_floor_enemies_proceed)
                {
                    instance_destroy(o_enemy);
                    global.current_dungeon_boss_spawned = true;
                    spawn_enemy(array_random_item(global.enemies_tower_bosses), true);
                }
                else if (!instance_exists(o_enemy_boss))
                {
                    spawn_random_area_enemy();
                }
            }
        }
        else if (self.type.key == global.area_types.boss.key)
        {
            if (self.can_spawn_boss())
            {
                self.spawn_boss();
            }
        }
        else if (self.type.key == global.area_types.horde.key)
        {
            var max_enemies = self.max_enemies;
            var spawn_count = 1 + floor(global.upgrade_attributes.leafton_pit_enemy_spawn_count);
            spawn_random_area_enemy(spawn_count);
        }
        else if (array_length(self.enemy) > 0)
        {
            spawn_random_area_enemy();
        }
    };
    
    check_tower = function()
    {
        var borb_taxi_enemy_value = global.shops.silver_token.auto_restart_tower_enemy_count.data.slider_value;
        if (global.current_tower_floor_enemies_defeated >= global.current_tower_floor_enemies_proceed)
        {
            tower_advance_floor();
        }
        else if (get_upgrade_count(global.shops.silver_token.auto_restart_tower) > 0 && global.shops.silver_token.auto_restart_tower.data.toggle && get_upgrade_count(global.shops.silver_token.auto_restart_tower_enemy_count) > 0 && borb_taxi_enemy_value > 0 && global.current_tower_floor_enemies_disappeared >= borb_taxi_enemy_value)
        {
            tower_auto_teleport();
        }
    };
    
    decrease_boss_delay = function(arg0)
    {
        self.data.boss_spawn_delay -= arg0;
        self.data.boss_spawn_delay = max(0, self.data.boss_spawn_delay);
    };
    
    draw_hud = function()
    {
        var text = "";
        if (self.type.key == global.area_types.tower.key)
        {
            text = __s("Floor: %s (%s/%s)", number_format(global.current_tower_floor), global.current_tower_floor_enemies_defeated, global.current_tower_floor_enemies_proceed);
        }
        else if (self.type.count_defeated_enemies)
        {
            if (is_same_key(self.type, global.area_types.horde))
            {
                var time = format_remaining_time(self.time_end, false, true);
                text = concatstr(__s("Enemies: %s", self.enemy_defeat_counter), "\n", __s("Time: %s", time));
            }
            else
            {
                text = __s("Enemies: %s/%s", global.current_tower_floor_enemies_defeated, global.current_tower_floor_enemies_proceed);
            }
        }
        if (is_empty(text))
        {
            exit;
        }
        draw_text(global.gui_width / 2, 125, text);
    };
    
    end_horde_run = function()
    {
        global.check_milestones_flag = true;
        self.prepare_horde_stats(self.floor_entered);
        variable_struct_get(self.data.floors_stats, self.floor_entered).max = max(variable_struct_get(self.data.floors_stats, self.floor_entered).max, self.enemy_defeat_counter);
        variable_struct_get(self.data.floors_stats, self.floor_entered).runs++;
        variable_struct_get(self.data.floors_stats, self.floor_entered).total = variable_struct_get(self.data.floors_stats, self.floor_entered).total + self.enemy_defeat_counter;
        self.last_horde_run = 
        {
            floor_entered: self.floor_entered,
            defeat_counter: self.enemy_defeat_counter,
            reward_counter: self.enemy_reward_counter
        };
        self.last_horde_result = self.get_horde_result(self.enemy_reward_counter, self.floor_entered);
        var run_result_text = [__s("Run ended.")];
        if (self.enemy_defeat_counter == 0)
        {
            array_push(run_result_text, __s("No enemies defeated. Oof."));
        }
        else
        {
            array_push(run_result_text, add_result(self.last_horde_result, __s("Defeated enemies: %s", self.enemy_defeat_counter) + "\n", global.titles.run_result, true, true));
        }
        if (!check_taxi())
        {
            change_area(global.areas.ante_leafton);
        }
        notify(implode("\n", run_result_text));
    };
    
    enemy_dies = function(arg0)
    {
        if (is_same_key(self.type, global.area_types.tower))
        {
            self.check_tower();
        }
        else if (self.is_horde)
        {
            self.enemy_defeat_counter++;
            var reward_counter = 1;
            if (arg0.quark_boost)
            {
                reward_counter *= 2;
            }
            self.enemy_reward_counter += reward_counter;
        }
    };
    
    enemy_disappears = function(arg0)
    {
        if (is_same_key(self.type, global.area_types.tower))
        {
            self.check_tower();
        }
    };
    
    _enter = function()
    {
        self.enemy_defeat_counter = 0;
        self.floor_entered = self.data.selected_floor;
        self.time_entered = o_game.data.stats.time_elapsed;
        self.time_end = o_game.data.stats.time_elapsed + sec(15) + sec(get_upgrade_attribute_value(global.upgrade_attributes.leafton_pit_duration));
        self.enemy_defeat_counter = 0;
        self.enemy_reward_counter = 0;
        self.spawn_npc();
        self.enter();
    };
    
    enter = __void;
    
    _func = function()
    {
        change_area(self);
        self.func();
    };
    
    func = function()
    {
    };
    
    func_gui = function()
    {
        if (self._is_buyable() && get_upgrade_count(self) == 0)
        {
            self.buy();
            exit;
        }
        if (!self._is_buyable() && !get_value_ext(self, self.check))
        {
            exit;
        }
        if (!global.can_teleport)
        {
            return false;
        }
        self._func();
        snd_play(snd_teleport);
    };
    
    _func_second = function()
    {
        if (is_struct(self.charge_energy) && self.charge_energy.energy.data.unlocked)
        {
            var energy_value = get_charge_energy_value(self.charge_energy.energy, self.charge_energy.value);
            add_energy(self.charge_energy.energy, energy_value);
        }
        self.func_second();
    };
    
    func_second = __void;
    
    get_boss_delay_duration = function()
    {
        var duration = self.boss_spawn_delay_duration * (1 - get_upgrade_attribute_value(global.upgrade_attributes.area_boss_spawn_delay_decrease));
        duration = duration * (1 - get_upgrade_attribute_value(variable_struct_get(global.upgrade_attributes.area_boss_spawn_delay_decrease_area, self.key)));
        duration = max(sec(1), duration);
        return o_game.data.stats.time_elapsed + duration;
    };
    
    get_boss_spawn_text = function(arg0 = false)
    {
        var text = arg0 ? __("Spawned") : (__("Boss spawned") + "\n" + sprintf("(%s)", pluck_implode(self.enemy, "name")));
        if (self.data.boss_spawn_delay > o_game.data.stats.time_elapsed)
        {
            text = self.get_hud_info_text(arg0);
        }
        return text;
    };
    
    get_button_text = function()
    {
        return get_value_ext(self, self.button_text);
    };
    
    get_damage_timer = function(arg0)
    {
        var damage = 1;
        if (self.type.key == global.area_types.dungeon.key)
        {
            damage = 100000 * power(10, 1 + global.current_tower_floor);
        }
        else if (self.type.key == global.area_types.boss.key)
        {
            damage = max(100000, self.level / 10000000000000000000000000);
        }
        else
        {
            damage = 350 + power(10, 1 + floor(log10(global.current_tower_floor))) + (global.current_tower_floor * 40);
        }
        if (self.quark_level > 0)
        {
            damage = get_blower_max_hp() * 0.1;
        }
        damage *= power(1.5, arg0);
        damage = rround(damage);
        return damage;
    };
    
    get_description = function()
    {
        var desc = [get_value_ext(self, self.description)];
        var hp_drain = get_hp_drain_area(self);
        if (self.hp_drain > 0 || is_struct(self.hp_drain_types))
        {
            if (hp_drain > 0)
            {
                var hp_drain_pct_value = hp_drain / get_blower_max_hp();
                var hp_drain_pct = (hp_drain_pct_value > 1) ? ">100%" : number_format_percent(hp_drain_pct_value);
                var hp_drain_text = sprintf("%s (%s)", number_format(hp_drain), hp_drain_pct);
                array_push(desc, __s("%s Warning: you lose %s HP per second %s", "!!!", hp_drain_text, "!!!"));
            }
        }
        if (is_struct(self.hp_drain_types))
        {
            var __struct = self.hp_drain_types;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                var hp_drain_type = variable_struct_get(global.damage_types_environment, mkey);
                array_push(desc, __s("Environmental damage: %s (%s of max HP)", hp_drain_type.name, number_format_percent(mitem)));
            }
        }
        if (is_struct(self.charge_energy))
        {
            var energy_value = get_charge_energy_value(self.charge_energy.energy, self.charge_energy.value);
            var text_verb = (energy_value >= 0) ? __("Recharges") : __("Drains");
            array_push(desc, __s("%s %s %s each second.", text_verb, number_format(abs(self.charge_energy.value)), self.charge_energy.energy.name_single));
        }
        return implode("\n", desc);
    };
    
    get_enemy_damage = function()
    {
        var damage = self.get_damage_timer(1);
        return damage;
    };
    
    get_enemy_level = function()
    {
        var level = self.level;
        if (self.type.key == global.area_types.tower.key)
        {
            level = get_enemy_tower_level(global.current_tower_floor);
        }
        else
        {
            switch (self.key)
            {
                case global.areas.inner_pyramid.key:
                    level = self.level * power(2, global.current_tower_floor);
                    break;
                case global.areas.soul_crypt.key:
                    level = self.level * power(1.5, global.current_tower_floor);
                    break;
                case global.areas.leafton_pit.key:
                    level *= (1 + power(20, self.floor_entered));
                    break;
            }
        }
        level = apply_max_number(level);
        return level;
    };
    
    get_enemy_quark_level = function()
    {
        var quark_level = self.quark_level;
        if (self.key == global.areas.leafton_pit.key && self.floor_entered > 1)
        {
            quark_level += ((self.floor_entered - 1) * 0.25);
        }
        quark_level = apply_max_number(rround(quark_level));
        return quark_level;
    };
    
    get_enemy_proceed_count = function()
    {
        var count = global.current_tower_floor_enemies_proceed_base;
        switch (self.type.key)
        {
            case global.area_types.dungeon.key:
                count = global.game_settings.dungeon_enemies_proceed_base_count;
                break;
            case global.area_types.horde.key:
                return 0;
                break;
            case global.area_types.tower.key:
                count = global.current_tower_floor_enemies_proceed_base - get_upgrade_attribute_value(global.upgrade_attributes.tower_floor_enemies_decrease);
                break;
        }
        count -= get_upgrade_attribute_value(variable_struct_get(global.upgrade_attributes.area_enemies_decrease, self.key));
        return max(1, count);
    };
    
    get_entry_cost = function(arg0)
    {
        var cost = 
        {
            resources: 
            {
                energy_quark: 25 * power(arg0, 2),
                quark: 500 * power(arg0, 3)
            }
        };
        return cost;
    };
    
    get_highest_floor_current_run = function()
    {
        return self.data.highest_floor_run;
    };
    
    get_horde_result = function(arg0, arg1)
    {
        var leafton_value = get_bm_value(arg0 * arg1, undefined, "leafton_pit_reward_multiplier", undefined, true);
        var quark_blob_value = floor(arg0 * arg1 * 0.05 * (1 + get_upgrade_attribute_value(global.upgrade_attributes.leafton_pit_reward_quark_blob)));
        var quark_structure_value = floor(arg0 * arg1 * 0.8 * (1 + get_upgrade_attribute_value(global.upgrade_attributes.leafton_pit_reward_quark_structure)));
        var quantum_blob_value = floor(arg0 * arg1 * 0.03 * (1 + get_upgrade_attribute_value(global.upgrade_attributes.leafton_pit_reward_quantum_blob)));
        var result = 
        {
            resources: 
            {
                leafton: leafton_value,
                quark_blob: quark_blob_value,
                quark_structure: quark_structure_value,
                quantum_blob: quantum_blob_value
            }
        };
        return result;
    };
    
    get_horde_stats = function(arg0)
    {
        self.prepare_horde_stats(arg0);
        return variable_struct_get(self.data.floors_stats, arg0);
    };
    
    get_hud_info_text = function(arg0 = false)
    {
        var text = "";
        if (!self.boss_spawned && self.data.boss_spawn_delay > o_game.data.stats.time_elapsed)
        {
            var spawn_text = arg0 ? format_time(secr(self.data.boss_spawn_delay - o_game.data.stats.time_elapsed), false, true) : __s("Boss spawns in: %s", format_time(secr(self.data.boss_spawn_delay - o_game.data.stats.time_elapsed)));
            text += spawn_text;
        }
        if (self.type.key == global.area_types.idle.key && instance_exists(o_game))
        {
            if (!is_empty(text))
            {
                text += "\n";
            }
            text += __s("Next offline reward in %s", format_time(60 - o_game.offline_reward_counter, false, true));
        }
        if (self.show_leaves_visibility_text && !get_option(global.options.draw_other_leaves))
        {
            if (!is_empty(text))
            {
                text += "\n";
            }
            text += __s("Note: %s", __("Leaves are not visible. Enable this in the options to see them."));
        }
        return text;
    };
    
    get_index = function()
    {
        var index = self.index;
        if (is_struct(self.galaxy))
        {
            index += (self.galaxy.index * 10000000);
        }
        else
        {
            index += 100000000000000000000000000000000000000000000000000;
        }
        return index;
    };
    
    get_materials = function()
    {
        if (is_undefined(struct_get_from_hash(self.cache, variable_get_hash("materials"))))
        {
            self.cache.materials = [];
            var __array = global.materials_spawnable;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                if ((!is_undefined(mitem.spawn_area) && mitem.spawn_area.key == self.key) || self.key == global.areas.dark_glade.key)
                {
                    array_push(self.cache.materials, mitem);
                }
            }
            if (self.key == global.areas.coal_mine.key)
            {
                array_push(self.cache.materials, global.materials.bar_coal);
            }
        }
        return self.cache.materials;
    };
    
    get_max_floor = function()
    {
        var count = 1;
        if (self.type.key == global.area_types.tower.key)
        {
            count = 100 + get_upgrade_attribute_value(global.upgrade_attributes.tower_floor);
            count *= (1 + get_upgrade_attribute_value(global.upgrade_attributes.tower_floor_pct));
            count = min(global.max_tower_floor, count);
        }
        else
        {
            switch (self.key)
            {
                case global.areas.inner_pyramid.key:
                    count = 100 + get_upgrade_attribute_value(global.upgrade_attributes.pyramid_floors);
                    count *= (1 + get_upgrade_attribute_value(global.upgrade_attributes.pyramid_floors_pct));
                    count = min(global.max_pyramid_floor, count);
                    break;
                case global.areas.soul_crypt.key:
                    count = get_bm_value(20, "soul_crypt_floors");
                    break;
                case global.areas.leafton_pit.key:
                    count = 20;
                    break;
                default:
                    count = 100;
                    break;
            }
        }
        return ceil(count);
    };
    
    get_mirror_display_materials = function()
    {
        return self.get_materials();
    };
    
    get_mirror_display_resources = function()
    {
        if (is_undefined(struct_get_from_hash(self.cache, variable_get_hash("mirror_display_resources"))))
        {
            var res_array = self.get_resources();
            if (self.key == global.areas.cursed_halloween.key)
            {
                var reward = get_halloween_cursed_cheese_reward();
                var __struct = reward.resources;
                var __prop_names = struct_get_names(__struct);
                var __prop_len = array_length(__prop_names);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mkey = __prop_names[__i];
                    var mitem = variable_struct_get(__struct, mkey);
                    array_push(res_array, variable_struct_get(global.resources, mkey));
                }
            }
            if (self.key == global.areas.vial_of_life.key && is_event_active(global.events.nature_season))
            {
                array_append_flat(res_array, global.resources_plants);
            }
            if (self.key == global.areas.soul_crypt.key)
            {
                var reward = dungeon_get_reward(global.areas.soul_crypt, 1, false);
                var __struct = reward.resources;
                var __prop_names = struct_get_names(__struct);
                var __prop_len = array_length(__prop_names);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mkey = __prop_names[__i];
                    var mitem = variable_struct_get(__struct, mkey);
                    array_push(res_array, variable_struct_get(global.resources, mkey));
                }
            }
            self.cache.mirror_display_resources = res_array;
        }
        return self.cache.mirror_display_resources;
    };
    
    get_mirror_materials = function()
    {
        var count = get_mirror_collect_material_count();
        var mats = {};
        var mats_added = 0;
        var max_count = 2;
        var __array = self.get_materials();
        var __prop_len = array_length(__array);
        var __prop_order = array_fill_index(__prop_len);
        __prop_order = array_shuffle(__prop_order);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var __sindex = __prop_order[__i];
            var mitem = __array[__sindex];
            if (mats_added >= max_count)
            {
                break;
            }
            add_to_struct_value(mats, mitem.key, count, false);
            mats_added++;
        }
        return mats;
    };
    
    get_mirror_resources = function()
    {
        var res = {};
        var __array = self.get_resources();
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (!is_unlocked_resource(mitem))
            {
                continue;
            }
            var value = 0;
            if (mitem.is_energy)
            {
                value = get_charge_energy_value(mitem);
            }
            else if (mitem == global.resources.dice)
            {
                value = get_dice_drop_value(true);
            }
            else
            {
                value = get_leaf_reward_offline_value(mitem);
            }
            add_to_struct_value(res, mitem.key, value, false);
        }
        if (self.key == global.areas.cursed_halloween.key && is_event_active(global.events.halloween))
        {
            var reward = get_halloween_cursed_cheese_reward();
            add_struct_to_struct(res, reward.resources);
        }
        if (self.key == global.areas.vial_of_life.key && is_event_active(global.events.nature_season))
        {
            var seed = global.season_pass.nature.get_random_plant_seed();
            add_to_struct_value(res, seed.key, global.season_pass.nature.get_vial_seed_spawn_count(), false);
        }
        if (self.key == global.areas.soul_crypt.key)
        {
            var reward = dungeon_get_reward(global.areas.soul_crypt, global.areas.soul_crypt.data.highest_floor, false);
            add_struct_to_struct(res, reward.resources);
        }
        return res;
    };
    
    get_name = function()
    {
        var name = self.name;
        if (self.hp_drain > 0 || get_struct_length(self.hp_drain_types) > 0)
        {
            name += " (!)";
        }
        return name;
    };
    
    get_name_spoiler = function()
    {
        return self.name;
    };
    
    get_resources = function()
    {
        if (is_undefined(struct_get_from_hash(self.cache, variable_get_hash("resources"))))
        {
            self.cache.resources = [];
            var __array = self.resources;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                array_push(self.cache.resources, mitem);
            }
            __array = self.mirror_resources;
            __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                if (in_array(self.cache.resources, mitem))
                {
                    continue;
                }
                array_push(self.cache.resources, mitem);
            }
        }
        return self.cache.resources;
    };
    
    get_unlock_cost = function()
    {
        var unlock_cost = self.cost;
        if (is_struct(self.cost_materials))
        {
            unlock_cost = self.cost_materials;
        }
        return unlock_cost;
    };
    
    _is_buyable = function()
    {
        return get_value_ext(self, self.is_buyable);
    };
    
    is_generatable_in_quests = function()
    {
        return self.generatable_in_quests;
    };
    
    is_obfuscated = function()
    {
        if (self._is_buyable() && get_upgrade_count(self) > 0)
        {
            return false;
        }
        if (!self._is_buyable() && self.check())
        {
            return false;
        }
        return true;
    };
    
    leave = function()
    {
        self.boss_spawned = false;
        if (instance_exists(o_blower))
        {
            o_blower.use_fixed_damage = false;
        }
    };
    
    prepare_horde_stats = function(arg0)
    {
        if (!is_struct(variable_struct_get(self.data.floors_stats, arg0)))
        {
            variable_struct_set(self.data.floors_stats, arg0, 
            {
                max: 0,
                runs: 0,
                total: 0
            });
        }
    };
    
    prestige = function(arg0)
    {
        if (self.persist_prestige)
        {
            exit;
        }
        if (arg0 == global.prestige_levels.mlc.level)
        {
            if (!has_bought_shop_item_safe(global.shops.mlc.areas_persist_mlc) && !has_bought_shop_item_safe(global.shops.ulc.areas_persist_ulc))
            {
                self.data.count = get_cloned_struct_value(self.data_start, "count");
            }
            if (self.type.key == global.area_types.tower.key)
            {
                var tower_start_floor = get_upgrade_attribute_value(global.upgrade_attributes.tower_floor_persist);
                if (tower_start_floor > 0)
                {
                    var highest_floor_max_select = clamp((floor((self.data.highest_floor - 1) / 10) * 10) + 1, 1, self.data.highest_floor);
                    self.data.highest_floor = max(1, min(highest_floor_max_select, tower_start_floor - 9));
                    self.data.selected_floor = self.data.highest_floor;
                }
                else
                {
                    self.data.highest_floor = 1;
                    self.data.selected_floor = 1;
                }
            }
        }
        else if (arg0 == global.prestige_levels.ulc.level)
        {
            if (!has_bought_shop_item_safe(global.shops.ulc.areas_persist_ulc))
            {
                if (!self.unlocked_start)
                {
                    self.data.count = 0;
                    self.data.unlocked = false;
                }
            }
            self.data.highest_floor = 1;
            self.data.highest_floor_run = 1;
            self.data.selected_floor = 1;
            if (self.key == global.areas.inner_pyramid.key)
            {
                self.data.highest_floor = max(1, global.upgrade_attributes.pyramid_floors_persist);
                self.data.highest_floor_run = max(1, global.upgrade_attributes.pyramid_floors_persist);
                self.data.selected_floor = max(1, global.upgrade_attributes.pyramid_floors_persist);
            }
        }
    };
    
    reduce_boss_delay = function(arg0)
    {
        self.data.boss_spawn_delay -= arg0;
        self.data.boss_spawn_delay = max(0, self.data.boss_spawn_delay);
    };
    
    set_boss_delay = function()
    {
        self.boss_spawned = false;
        self.data.boss_spawn_delay = self.get_boss_delay_duration();
    };
    
    set_floor = function(arg0)
    {
        var max_floor = self.get_max_floor();
        global.current_tower_floor = clamp(arg0, 0, max_floor + 1);
        global.current_tower_floor_enemies_defeated = 0;
        self.set_max_floor_stats(global.current_tower_floor);
    };
    
    set_max_floor_stats = function(arg0)
    {
        var max_floor = self.get_max_floor();
        arg0 = clamp(arg0, 0, max_floor + 1);
        self.data.highest_floor = max(self.data.highest_floor, arg0);
        self.data.highest_floor_run = max(self.data.highest_floor_run, arg0);
        self.data.highest_floor_stats = max(self.data.highest_floor_stats, arg0);
    };
    
    spawn_boss = function(arg0 = true)
    {
        spawn_enemy(array_random_item(self.enemy), true);
        self.boss_spawned = true;
    };
    
    spawn_npc = function()
    {
        if (array_length(self.npc) == 0)
        {
            exit;
        }
        var __array = self.npc;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (is_undefined(mitem))
            {
                continue;
            }
            var o = instance_create_layer(mitem._x, mitem._y, global.layers.npc, mitem.obj);
            apply_struct_to_instance(mitem, o);
            with (o)
            {
                init();
            }
        }
    };
    
    step = function()
    {
        if (self.is_horde && o_game.data.stats.time_elapsed >= self.time_end)
        {
            self.end_horde_run();
        }
    };
    
    unlock = function()
    {
        var __array = self.resources_unlock;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            mitem.data.unlocked = true;
        }
    };
    
    load_data = function(arg0)
    {
        apply_struct_to_struct(self.data, arg0);
        self.init();
    };
    
    after_load_game_data = function()
    {
        if (self.data.highest_floor_run == -1)
        {
            self.data.highest_floor_run = self.data.highest_floor_stats;
        }
    };
    
    set_local_vars(arg0);
    self.init();
}
