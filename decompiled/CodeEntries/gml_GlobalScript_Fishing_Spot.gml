function Fishing_Spot(arg0 = undefined) : Savable_Object(arg0) constructor
{
    data = 
    {
        bait: undefined,
        buffs: {},
        casts: 0,
        cast_time_start: 0,
        cast_time_end: 0,
        catch_chance: 0,
        catches: 0,
        id: 0,
        index: -1,
        last_catch_success: undefined,
        level: 1,
        lure_time_end: 0,
        quality: random_range(0.01, 1),
        rarity_key: "",
        reel_time_start: 0,
        reel_time_end: 0,
        reward: undefined,
        rods: [],
        status: "idle",
        type_key: "regular"
    };
    bait = undefined;
    catch_rarities = [];
    description = "";
    has_any_rod_cache = undefined;
    name = __("Fishing Spot");
    rarity = global.fishing_spots_rarity.common;
    refresh_upgrade_attributes_flag = false;
    spot_type_ua = {};
    spot_type_ua_text = "";
    spot_ua = {};
    spot_ua_text = {};
    type = global.fishing_spot_types.regular;
    buff_types = 
    {
        fish_credits_multiplier: 
        {
            value: 0.3
        },
        fish_length_multiplier: 
        {
            value: 0.2
        },
        lure_value_multiplier: 
        {
            value: 0.5
        },
        xp_multiplier: 
        {
            value: 0.1
        }
    };
    add_keys_to_struct(self.buff_types);
    
    init = function()
    {
        if (self.data.id == 0)
        {
            self.data.id = guid();
        }
        self.set_quality();
        self.set_rarity();
        self.set_type();
        self.refresh_name();
        self.data.catch_chance = self.get_catch_chance();
        self.catch_rarities = [];
        var __array = global.fishing_spots_rarity_array;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            array_push(self.catch_rarities, mitem);
        }
        sort_array_by(self.catch_rarities, "chance");
    };
    
    add_buff = function(arg0)
    {
        var buff_value = self.get_buff_value(arg0);
        add_to_struct_value(self.data.buffs, arg0.key, buff_value);
    };
    
    add_random_buff = function()
    {
        var buff = struct_random(self.buff_types);
        self.add_buff(buff);
    };
    
    can_reel = function()
    {
        if (self.data.status != "cast" || o_game.data.stats.time_elapsed < self.data.cast_time_end)
        {
            return false;
        }
        if (!self.has_any_rod())
        {
            return false;
        }
        return true;
    };
    
    can_cast = function()
    {
        if (self.data.status != "idle")
        {
            return false;
        }
        if (self.data.reel_time_end > o_game.data.stats.time_elapsed)
        {
            return false;
        }
        if (!self.has_any_rod())
        {
            return false;
        }
        return true;
    };
    
    can_change_rod = function()
    {
        if (self.data.status != "idle")
        {
            return false;
        }
        return true;
    };
    
    can_lure_manual = function()
    {
        if (self.data.status != "cast")
        {
            return false;
        }
        return true;
    };
    
    cast_rod = function()
    {
        if (!self.can_cast())
        {
            exit;
        }
        self.data.casts++;
        self.data.cast_time_start = o_game.data.stats.time_elapsed;
        self.data.cast_time_end = self.data.cast_time_start + sec(1);
        self.data.status = "cast";
    };
    
    change_bait = function(arg0 = get_click_dir(true))
    {
        var index = self.has_bait() ? self.bait.index : -1;
        if (index == -1 && arg0 < 0)
        {
            index = array_length(global.fishing_baits_array);
        }
        var bait = get_next_array_item(global.fishing_baits_array, index, arg0, true);
        self.set_bait(bait);
    };
    
    change_rod = function(arg0, arg1 = get_click_dir(true))
    {
        self.has_any_rod_cache = undefined;
        var slot_rod = undefined;
        var rod_index = 0;
        var rods_length = array_length(global.fishing_rods);
        if (is_string(self.data.rods[arg0]))
        {
            var __array = global.fishing_rods;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                if (mitem.data.id == self.data.rods[arg0])
                {
                    rod_index = __i;
                    slot_rod = mitem;
                    break;
                }
            }
        }
        else if (rod_index == 0 && arg1 == -1)
        {
            rod_index = rods_length - 1;
        }
        for (var i = rod_index; i < rods_length && i >= 0; i += arg1)
        {
            var rod = global.fishing_rods[i];
            if (rod.is_available())
            {
                self.set_rod(rod, arg0);
                if (is_struct(slot_rod))
                {
                    slot_rod.remove_from_spot();
                }
                exit;
            }
        }
        if (is_struct(slot_rod))
        {
            slot_rod.remove_from_spot();
        }
        self.data.rods[arg0] = undefined;
        self.refresh_upgrade_attributes_flag = true;
    };
    
    check = function()
    {
        if (self.data.status == "cast")
        {
            self.lure();
        }
        if (self.refresh_upgrade_attributes_flag)
        {
            self.refresh_upgrade_attributes(true);
        }
    };
    
    check_auto = function()
    {
        if (self.data.status == "idle" && self.can_cast())
        {
            self.cast_rod();
        }
        else if (self.data.status == "cast" && self.can_reel() && (self.data.catch_chance * 100) >= get_option(global.options.auto_fishing_threshold) && has_bought_shop_item_safe(global.shops.fish.auto_fishing_reel_threshold))
        {
            self.reel();
        }
    };
    
    get_buff_value = function(arg0)
    {
        var value = arg0.value + (arg0.value * power(2, self.rarity.level));
        return value;
    };
    
    get_catch_chance = function()
    {
        return random_range(self.get_catch_chance_min(), self.get_catch_chance_max());
    };
    
    get_catch_chance_min = function()
    {
        return 0.05;
    };
    
    get_catch_chance_max = function()
    {
        return 0.1;
    };
    
    get_catch_rarity_multiplier = function()
    {
        var value = global.upgrade_attributes.fishing_catch_rarity_multiplier + get_default_struct_value(self.spot_ua, "fishing_catch_rarity_multiplier", 0);
        return value;
    };
    
    get_lure_value = function()
    {
        var value = global.game_settings.fishing_lure_value + (0.1 * (1 - sqrt(self.data.catch_chance)));
        value *= (1 + self.data.quality);
        return value;
    };
    
    get_min_length = function()
    {
        var length = _sum(self.data.rods, function(arg0)
        {
            var rod = variable_struct_get(global.fishing_rods_map, arg0);
            if (!is_struct(rod))
            {
                return 0;
            }
            return rod.get_min_length();
        });
        length *= (1 + get_default_struct_value(self.spot_ua, "fishing_min_fish_length_multiplier", 0));
        return length;
    };
    
    get_max_length = function()
    {
        var length = _sum(self.data.rods, function(arg0)
        {
            var rod = variable_struct_get(global.fishing_rods_map, arg0);
            if (!is_struct(rod))
            {
                return 0;
            }
            return rod.get_max_length();
        });
        return length;
    };
    
    get_reward = function(arg0, arg1)
    {
        var credits_value = ceil(arg1 * 2 * arg0.rarity.level);
        credits_value = get_bm_value(credits_value, undefined, "fishing_catch_credits_multiplier", undefined, true);
        credits_value *= (1 + get_default_struct_value(self.spot_ua, "fishing_catch_credits_multiplier", 0));
        var xp_base = arg0.rarity.level;
        var xp_value = get_bm_value(xp_base, undefined, "fishing_xp_multiplier");
        var reward = 
        {
            fish: {},
            journey_xp: 
            {
                fishing: xp_value
            },
            materials: {},
            resources: 
            {
                fish_credits: credits_value
            }
        };
        variable_struct_set(reward.fish, arg0.key, arg1);
        var tide_crystal_chance = global.upgrade_attributes.fishing_catch_tide_crystal_chance + get_default_struct_value(self.spot_ua, "fishing_catch_tide_crystal_chance", 0);
        if (percent_chance(tide_crystal_chance * 100))
        {
            var tide_crystal_value = arg0.rarity.level;
            reward.materials.tide_crystal = tide_crystal_value;
        }
        return reward;
    };
    
    get_rods = function()
    {
        return self.data.rods;
    };
    
    get_trash_reward = function()
    {
        var reward = 
        {
            resources: 
            {
                fish_trash: 1 + (10 * (self.rarity.level - 1))
            }
        };
        return reward;
    };
    
    get_wait_duration = function()
    {
        var duration = get_bm_value(sec(global.game_settings.fishing_wait_duration), "fishing_wait_duration_reduction", "fishing_wait_duration_reduction_multiplier", undefined, undefined, -1);
        duration *= (1 - get_default_struct_value(self.spot_ua, "fishing_wait_duration_reduction_multiplier", 0));
        duration = max(duration, sec(0.5));
        return duration;
    };
    
    has_any_rod = function(arg0 = false)
    {
        if (arg0 || is_undefined(self.has_any_rod_cache))
        {
            self.has_any_rod_cache = _any(self.data.rods, function(arg0)
            {
                if (is_undefined(arg0))
                {
                    return false;
                }
                return is_struct(variable_struct_get(global.fishing_rods_map, arg0));
            });
        }
        return self.has_any_rod_cache;
    };
    
    has_bait = function()
    {
        return is_string(self.data.bait);
    };
    
    lure = function(arg0 = 1)
    {
        if (self.data.status != "cast")
        {
            exit;
        }
        self.data.catch_chance += self.get_lure_value() * arg0;
        self.data.catch_chance = clamp(self.data.catch_chance, 0, 1);
    };
    
    lure_manual = function()
    {
        var lure_duration = sec(5);
        var multiplier = 5;
        self.lure(multiplier);
    };
    
    reel = function()
    {
        self.data.reward = undefined;
        var success = percent_chance(self.data.catch_chance * 100);
        if (success)
        {
            var bait_add_chance = undefined;
            var bait_length_multiplier = 0;
            var use_bait = false;
            if (self.has_bait() && self.bait.can_use())
            {
                bait_add_chance = self.bait.rarity.catch_chance;
                bait_length_multiplier = self.bait.get_length_multiplier();
                use_bait = true;
            }
            var catch_rarity_multiplier = self.get_catch_rarity_multiplier();
            var catch_rarity = get_random_rarity(self.catch_rarities, catch_rarity_multiplier, undefined, bait_add_chance);
            var length = random_range(self.get_min_length(), self.get_max_length());
            length *= (1 + bait_length_multiplier);
            var fish = get_random_fish(catch_rarity, self.rarity);
            self.data.catches++;
            self.data.last_catch_success = true;
            self.data.reward = self.get_reward(fish, length);
            if (use_bait)
            {
                self.bait.use();
            }
        }
        else
        {
            self.data.last_catch_success = false;
            if (percent_chance(self.data.catch_chance * 100))
            {
                self.data.reward = self.get_trash_reward();
            }
        }
        add_result_lite(self.data.reward);
        array_push(global.fishing_rewards_last, 
        {
            success: success,
            reward: self.data.reward
        });
        limit_array(global.fishing_rewards_last, 8);
        self.data.reel_time_end = o_game.data.stats.time_elapsed + self.get_wait_duration();
        self.data.catch_chance = self.get_catch_chance();
        self.data.status = "idle";
        return self.data.reward;
    };
    
    refresh_name = function()
    {
        self.name = sprintf("#%s | %s | %s", self.data.index, self.rarity.name, self.type.name);
    };
    
    refresh_upgrade_attributes = function(arg0 = false)
    {
        self.refresh_upgrade_attributes_flag = true;
        if (is_struct(self.spot_type_ua) && is_struct(self.spot_ua) && !arg0)
        {
            exit;
        }
        self.refresh_upgrade_attributes_flag = false;
        self.spot_type_ua = multiply_struct_values(self.type.get_upgrade_attributes(), self.rarity.level);
        self.spot_ua = multiply_struct_values(self.type.get_upgrade_attributes(), self.rarity.level);
        if (!is_struct(self.spot_ua))
        {
            self.spot_ua = {};
        }
        var __array = self.data.rods;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            var rod = variable_struct_get(global.fishing_rods_map, mitem);
            if (!is_struct(rod))
            {
                continue;
            }
            add_struct_to_struct(self.spot_ua, rod.get_upgrade_attributes());
        }
        self.spot_type_ua_text = format_upgrade_text(self.spot_type_ua);
        self.spot_ua_text = format_upgrade_text(self.spot_ua);
    };
    
    remove = function()
    {
        var __array = self.data.rods;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            var rod = variable_struct_get(global.fishing_rods_map, mitem);
            if (!is_struct(rod))
            {
                continue;
            }
            rod.remove_from_spot();
        }
        variable_struct_set(global.fishing_spots_map, self.data.id, undefined);
        remove_item_from_array_by_id(global.fishing_spots, self.data.id);
    };
    
    remove_all_buffs = function()
    {
        self.data.buffs = {};
    };
    
    set_bait = function(arg0)
    {
        if (is_string(arg0) && !is_empty(arg0))
        {
            arg0 = variable_struct_get(global.fishing_baits, arg0);
        }
        if (!is_struct(arg0))
        {
            self.data.bait = undefined;
            self.bait = undefined;
            exit;
        }
        self.data.bait = arg0.key;
        self.bait = arg0;
    };
    
    set_index = function(arg0)
    {
        self.data.index = arg0;
        self.refresh_name();
    };
    
    set_quality = function(arg0 = self.data.quality)
    {
        self.data.quality = arg0;
        self.update_buffs();
        self.refresh_upgrade_attributes_flag = true;
    };
    
    set_rarity = function(arg0 = self.data.rarity_key)
    {
        if (is_string(arg0))
        {
            self.rarity = variable_struct_get(global.fishing_spots_rarity, arg0);
        }
        else if (is_struct(arg0))
        {
            self.rarity = arg0;
        }
        if (!is_struct(self.rarity))
        {
            self.rarity = global.fishing_spots_rarity.common;
        }
        self.data.rarity_key = self.rarity.key;
        self.data.rods = [];
        var rod_data_length = array_length(self.data.rods);
        if (rod_data_length < self.rarity.rod_count)
        {
            for (var i = rod_data_length; i < self.rarity.rod_count; i++)
            {
                array_push(self.data.rods, undefined);
            }
        }
        self.refresh_upgrade_attributes_flag = true;
    };
    
    set_rod = function(arg0, arg1)
    {
        self.has_any_rod_cache = undefined;
        if (is_string(arg0))
        {
            arg0 = variable_struct_get(global.fishing_rods_map, arg0);
        }
        if (is_undefined(arg0))
        {
            self.data.rods[arg1] = undefined;
            exit;
        }
        if (!arg0.is_available())
        {
            exit;
        }
        var existing_rod_id = self.data.rods[arg1];
        if (!is_undefined(existing_rod_id))
        {
            var rod = variable_struct_get(global.fishing_rods_map, existing_rod_id);
            if (is_struct(rod))
            {
                rod.remove_from_spot();
            }
        }
        self.data.rods[arg1] = arg0.data.id;
        arg0.set_spot(self.data.id);
        self.refresh_upgrade_attributes_flag = true;
    };
    
    set_rods = function(arg0)
    {
        var __array = arg0;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            self.set_rod(mitem, __i);
        }
    };
    
    set_type = function(arg0 = self.data.type_key)
    {
        var type = arg0;
        if (is_string(arg0))
        {
            type = variable_struct_get(global.fishing_spot_types, arg0);
        }
        self.type = type;
        self.data.type_key = type.key;
        self.refresh_name();
        self.refresh_upgrade_attributes_flag = true;
    };
    
    spawn_fish = function()
    {
        self.data.fish_spawned = true;
    };
    
    update_buffs = function()
    {
        var __struct = self.data.buffs;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var buff = variable_struct_get(self.buff_types, mkey);
            variable_struct_set(self.data.buffs, mkey, self.get_buff_value(buff));
        }
    };
    
    get_name = function()
    {
        return self.name;
    };
    
    get_description = function()
    {
        self.description = " ";
        if (self.type.is_special)
        {
            self.description = self.spot_type_ua_text;
        }
        return self.description;
    };
    
    get_info = self.get_name;
    
    load_data_after = function()
    {
        self.set_bait(self.data.bait);
        self.set_index(self.data.index);
        self.set_type(self.data.type_key);
        if (self.data.status != "idle" && !self.has_any_rod(true))
        {
            self.data.status = "idle";
        }
    };
    
    set_local_vars(arg0);
}

function Fishing_Spot_Type(arg0) : Type_Object(arg0) constructor
{
    is_special = true;
    set_local_vars(arg0);
}
