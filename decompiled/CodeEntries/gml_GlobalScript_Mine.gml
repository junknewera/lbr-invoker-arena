function Mine(arg0 = undefined) : Game_Object(arg0) constructor
{
    name = "";
    key = "";
    level = 1;
    difficulty = 1;
    caves_count = 0;
    rarity = undefined;
    selected_cave = undefined;
    type = undefined;
    cache = {};
    data = 
    {
        caves: [],
        caves_mined: 0,
        depleted: false,
        drilling: false,
        drill_depletion: 0,
        drill_progress: 0,
        id: undefined,
        level: undefined,
        locked: false,
        rarity_key: undefined,
        sprite: undefined
    };
    
    init = function()
    {
        self.data.id = ++o_game.data.mines.id_counter;
        self.data.level = self.level;
        self.set_rarity(self.rarity);
        self.init_after();
    };
    
    init_after = function()
    {
        self.key = self.data.id;
        self.set_rarity(self.data.rarity_key);
        self.difficulty = self.get_difficulty();
        if (array_length(self.data.caves) == 0)
        {
            self.generate_caves();
        }
        self.get_active_caves(true);
        self.caves_count = array_length(self.data.caves);
        self.name = sprintf("%s %s L%s", self.rarity.name, __("Mine"), self.data.level);
    };
    
    can_claim_all = function()
    {
        if (self.get_claimable_caves_count() == 0)
        {
            return false;
        }
        return true;
    };
    
    can_claim_cave = function(arg0)
    {
        if (arg0.progress < 1)
        {
            return false;
        }
        if (arg0.claimed)
        {
            return false;
        }
        return true;
    };
    
    can_mine_all = function()
    {
        if (!has_enough(self.get_mine_cave_cost()))
        {
            return false;
        }
        if (self.get_mineable_caves_count() == 0)
        {
            return false;
        }
        return true;
    };
    
    can_mine_cave = function(arg0, arg1 = true)
    {
        if (arg0.claimed || arg0.active)
        {
            return false;
        }
        if (arg1 && !has_enough(self.get_mine_cave_cost()))
        {
            return false;
        }
        if (self.get_active_caves() >= get_max_active_caves())
        {
            return false;
        }
        return true;
    };
    
    can_use_time_sphere = function(arg0, arg1 = 1)
    {
        if (self.can_claim_cave(arg0))
        {
            return false;
        }
        if (!arg0.active)
        {
            return false;
        }
        if (!has_enough(
        {
            resources: 
            {
                coal_time_sphere: arg1
            }
        }))
        {
            return false;
        }
        return true;
    };
    
    change_level = function(arg0)
    {
        self.level = arg0;
        self.data.level = arg0;
    };
    
    check = function()
    {
        var has_auto_claim = false;
        var progress_value = self.get_mine_progress_value();
        var refresh = false;
        var __array = self.data.caves;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (mitem.active)
            {
                mitem.progress += progress_value;
                if (mitem.progress >= 1)
                {
                    refresh = true;
                }
                mitem.progress = clamp(mitem.progress, 0, 1);
            }
            var type = get_cave_type(mitem.type_key);
            if (mitem.progress >= 1 && (has_auto_claim || get_default_struct_value(type, "auto_claim", false)))
            {
                self.claim_cave(mitem);
            }
        }
        if (self.is_drilling())
        {
            self.drill();
        }
        self.cache.claimable_caves_count = undefined;
        if (refresh)
        {
            self.refresh_cache();
        }
    };
    
    claim_cave = function(arg0, arg1 = true)
    {
        if (!self.can_claim_cave(arg0))
        {
            exit;
        }
        var type = get_cave_type(arg0.type_key);
        if (arg0.type_key == "upgrade")
        {
            add_struct_to_struct(o_game.data.mines.upgrade_attributes, arg0.result.upgrades);
        }
        add_result_lite(arg0.result);
        arg0.active = false;
        arg0.claimed = true;
        self.data.caves_mined++;
        o_game.data.mines.caves_claimed++;
        reduce_struct_value(self.cache, "active_caves", 1);
        if (!is_undefined(struct_get_from_hash(type, variable_get_hash("on_claim"))))
        {
            type.on_claim(arg0, self);
        }
        if (arg1)
        {
            self.refresh_cache();
        }
    };
    
    drill = function(arg0 = 1)
    {
        var drill_value = self.get_drill_value(arg0);
        self.data.drill_progress += drill_value;
        if (self.data.drill_progress >= 1)
        {
            var reward_count = floor(self.data.drill_progress);
            self.data.drill_progress -= reward_count;
            var drill_reward = self.get_drill_reward(reward_count);
            add_result_lite(drill_reward);
            self.data.drill_depletion += 0.05 * reward_count;
            if (self.data.drill_depletion >= 0.99)
            {
                self.data.depleted = true;
            }
            self.data.drill_depletion = clamp(self.data.drill_depletion, 0, 0.99);
        }
    };
    
    generate_caves = function()
    {
        self.data.caves = [];
        var cave_count = self.get_max_caves();
        for (var i = 0; i < cave_count; i++)
        {
            array_push(self.data.caves, self.generate_cave(i));
        }
        return self.data.caves;
    };
    
    generate_cave = function(arg0)
    {
        var type = self.get_random_cave_type();
        if (!is_struct(type))
        {
            return log("invalid mine type");
        }
        var rarity = self.get_random_cave_rarity();
        var cave = 
        {
            active: false,
            btn_bg_color: 16777215,
            claimed: false,
            id: ++o_game.data.mines.caves_id_counter,
            index: arg0,
            progress: 0,
            rarity_key: rarity.key,
            result: undefined,
            type_key: type.key,
            value: 0
        };
        var type_method = method(type, type.get_result);
        cave.result = type_method(cave, self, self.get_mine_multiplier());
        return cave;
    };
    
    get_active_caves = function(arg0 = false)
    {
        if (!arg0 && is_numeric(struct_get_from_hash(self.cache, variable_get_hash("active_caves"))))
        {
            return self.cache.active_caves;
        }
        var count = 0;
        var __array = self.data.caves;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (mitem.active && mitem.progress < 1)
            {
                count++;
            }
        }
        self.cache.active_caves = count;
        return count;
    };
    
    get_claimable_caves_count = function()
    {
        if (!is_undefined(struct_get_from_hash(self.cache, variable_get_hash("claimable_caves_count"))))
        {
            return self.cache.claimable_caves_count;
        }
        var count = 0;
        var __array = self.data.caves;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (self.can_claim_cave(mitem))
            {
                count++;
            }
        }
        self.cache.claimable_caves_count = count;
        return count;
    };
    
    get_difficulty = function()
    {
        var base_value = 20 + (self.data.level * 40 * (1 + power(self.rarity.level, 1.25)));
        var value = get_bm_value(base_value, undefined, "mines_difficulty_reduction_multiplier", undefined, true);
        return value;
    };
    
    get_drill_reward = function(arg0 = 1)
    {
        var drill_depletion_value = 1 - self.data.drill_depletion;
        drill_depletion_value = max(0.01, drill_depletion_value);
        var bar_coal_value = get_bm_value(((50 * self.data.level) / 2) * power(self.rarity.level, 1.5), undefined, "mines_drill_reward_multiplier", undefined, true);
        bar_coal_value *= drill_depletion_value;
        bar_coal_value *= arg0;
        bar_coal_value = max(1, rround(bar_coal_value));
        var result = 
        {
            materials: 
            {
                bar_coal: bar_coal_value
            },
            resources: {}
        };
        if (has_bought_shop_item_safe(global.shops.mines.mines_drill_cd))
        {
            var cd_value = get_bm_value(((5 * self.data.level) / 5) * power(self.rarity.level, 1.2), undefined, "mines_drill_reward_multiplier", undefined, true);
            cd_value *= drill_depletion_value;
            cd_value = max(1, rround(cd_value));
            result.resources.diamond_coal = cd_value;
        }
        if (has_bought_shop_item_safe(global.shops.mines.mines_drill_sd) && self.data.level >= 10 && self.rarity.level >= 4)
        {
            var sd_value = get_bm_value(((1 * self.data.level) / 20) * power(self.rarity.level, 1.2), undefined, "mines_drill_reward_multiplier", undefined, true);
            sd_value *= drill_depletion_value;
            sd_value = max(1, rround(sd_value));
            result.resources.diamond_shiny = sd_value;
        }
        return result;
    };
    
    get_drill_value = function(arg0 = 1)
    {
        var base_value = divide_safe(1, self.difficulty);
        var value = get_bm_value(base_value, undefined, "mines_drill_progress_multiplier", undefined, true);
        value *= arg0;
        return value;
    };
    
    get_cave_color = function(arg0)
    {
        if (arg0.progress >= 1 && arg0.type_key == "item")
        {
            return arg0.btn_bg_color;
        }
        return 16777215;
    };
    
    get_icon = function(arg0)
    {
        if (arg0.progress >= 1)
        {
            var type = get_cave_type(arg0.type_key);
            if (type.key == "item")
            {
                if (arg0.claimed && !is_undefined(arg0.sprite))
                {
                    return get_default_struct_value(variable_struct_get(global.mine_items, arg0.sprite), "sprite", spr_icon_question);
                }
                return spr_icon_question;
            }
            return get_default_struct_value(type, "sprite", spr_icon_question);
        }
        if (arg0.active)
        {
            return spr_icon_mine;
        }
        if (arg0.progress == 0)
        {
            return spr_solid;
        }
        return spr_solid;
    };
    
    get_mini_icon = function(arg0)
    {
        if (arg0.claimed)
        {
            return spr_icon_check;
        }
        if (arg0.progress >= 1)
        {
            return spr_icon_clock;
        }
        return spr_solid;
    };
    
    get_max_caves = function()
    {
        var value = get_bm_value(global.game_settings.mines_max_caves, "mines_max_caves");
        return value;
    };
    
    get_mine_all_cost = function()
    {
        if (is_struct(struct_get_from_hash(self.cache, variable_get_hash("mine_all_cost"))))
        {
            return self.cache.mine_all_cost;
        }
        var count = self.get_mineable_caves_count();
        self.cache.mine_all_cost = self.get_mine_cave_cost(count);
        return self.cache.mine_all_cost;
    };
    
    get_mine_cave_cost = function(arg0 = 1)
    {
        var cost_value = 25 * power(1.4, self.data.level - 1) * arg0;
        var cost = 
        {
            materials: 
            {
                bar_coal: cost_value
            }
        };
        return cost;
    };
    
    get_mineable_caves_count = function()
    {
        if (!is_undefined(struct_get_from_hash(self.cache, variable_get_hash("mineable_caves_count"))))
        {
            return self.cache.mineable_caves_count;
        }
        var count = 0;
        var __array = self.data.caves;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (self.can_mine_cave(mitem, false))
            {
                count++;
            }
        }
        self.cache.mineable_caves_count = count;
        return count;
    };
    
    get_mine_multiplier = function()
    {
        var base_value = (self.data.level * (1 + power(self.rarity.level, 1.6))) / 2;
        var value = get_bm_value(base_value, undefined, "mines_reward_multiplier", undefined, true);
        return value;
    };
    
    get_mine_progress_value = function()
    {
        var value = divide_safe(get_cache_numeric("mine_power", 0), self.difficulty);
        value *= global.game_settings.mines_mine_progress_value_multiplier;
        return value;
    };
    
    get_random_cave_rarity = function()
    {
        var rarity = struct_random_chance_level(global.mine_rarity, undefined, self.data.level);
        if (!is_struct(rarity))
        {
            rarity = global.mine_rarity.common;
        }
        return rarity;
    };
    
    get_random_cave_type = function()
    {
        var type = struct_random_chance_level(global.mine_cave_types, undefined, self.data.level);
        if (!is_struct(type))
        {
            type = global.mine_cave_types.resource;
        }
        return type;
    };
    
    get_random_mine_rarity = function()
    {
        var rarity = array_random_chance_level(global.mine_rarity_sorted, undefined, self.data.level, undefined, undefined, undefined, 
        {
            chance_multiplier: global.upgrade_attributes.mines_rarity_multiplier
        });
        if (!is_struct(rarity))
        {
            rarity = global.mine_rarity.common;
        }
        return rarity;
    };
    
    is_drilling = function()
    {
        return self.data.drilling;
    };
    
    claim_all_caves = function()
    {
        var __array = self.data.caves;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (!self.can_claim_cave(mitem))
            {
                continue;
            }
            self.claim_cave(mitem, false);
        }
        self.refresh_cache();
    };
    
    mine_all_caves = function()
    {
        var __array = self.data.caves;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (!self.can_mine_cave(mitem))
            {
                continue;
            }
            self.mine_cave(mitem, false);
        }
        self.refresh_cache();
    };
    
    mine_cave = function(arg0, arg1 = true)
    {
        var cost = self.get_mine_cave_cost();
        if (!has_enough(cost))
        {
            return false;
        }
        arg0.active = true;
        dec_result(cost);
        add_to_struct_value(self.cache, "active_caves", 1);
        if (arg1)
        {
            self.refresh_cache();
        }
        return true;
    };
    
    get_cave_description = function(arg0)
    {
        var type = variable_struct_get(global.mine_cave_types, arg0.type_key);
        var remaining_time = divide_safe(1 - arg0.progress, self.get_mine_progress_value());
        var text = [__s("Progress: %s", number_format_percent(arg0.progress)), __s("Progress/s: %s", number_format_percent(self.get_mine_progress_value())), __s("Ready in: %s", format_time(remaining_time, undefined, true, "-")), "", __s("Reward") + ":"];
        if (arg0.progress >= 1 && type.key == "item" && !arg0.claimed)
        {
            array_push(text, "?");
        }
        if (global.debug)
        {
            array_append_flat(text, ["", sprintf("mine multi: %s", number_format(self.get_mine_multiplier())), sprintf("mine difficulty: %s", number_format(self.difficulty)), sprintf("mine power: %s", number_format(get_mine_power()))]);
        }
        return implode("\n", text);
    };
    
    refresh_cache = function()
    {
        self.cache = {};
    };
    
    remove = function()
    {
        if (get_default_struct_value_data(struct_get_from_hash(global.selected_inventory_item, variable_get_hash("mine")), "id", -1) == self.data.id)
        {
            global.selected_inventory_item.mine = undefined;
        }
        remove_item_from_array_by_id(global.mines, self.data.id);
    };
    
    set_rarity = function(arg0 = undefined)
    {
        var rarity;
        if (is_struct(arg0))
        {
            rarity = arg0;
        }
        else if (is_string(arg0))
        {
            rarity = variable_struct_get(global.mine_rarity, arg0);
        }
        else
        {
            rarity = self.get_random_mine_rarity();
        }
        self.data.rarity_key = rarity.key;
        self.rarity = rarity;
    };
    
    start_drill = function()
    {
        if (self.is_drilling())
        {
            exit;
        }
        self.data.drilling = true;
    };
    
    stop_drill = function()
    {
        if (!self.is_drilling())
        {
            exit;
        }
        self.data.drilling = false;
    };
    
    toggle_drill = function()
    {
        if (self.is_drilling())
        {
            self.stop_drill();
        }
        else
        {
            self.start_drill();
        }
    };
    
    use_time_sphere = function(arg0, arg1 = 1)
    {
        var value = get_bm_value(0.1, "mines_coal_time_sphere_efficiency");
        if (arg1 == "all")
        {
            arg1 = ceil(divide_safe(1 - arg0.progress, value));
            log("count div", arg1);
            arg1 = min(global.resources.coal_time_sphere.data.count, arg1);
            log("count min", arg1);
        }
        value *= arg1;
        arg0.progress += value;
        arg0.progress = clamp(arg0.progress, 0, 1);
        dec_result(
        {
            resources: 
            {
                coal_time_sphere: arg1
            }
        });
    };
    
    get_name = function()
    {
        return format_text_numbers(self.name, self.get_active_caves(), self.get_claimable_caves_count(), " | ");
    };
    
    load_data = function(arg0)
    {
        apply_struct_to_struct(self.data, arg0);
        self.init_after();
    };
    
    set_local_vars(arg0);
    set_sprite_data(self);
    init();
}
