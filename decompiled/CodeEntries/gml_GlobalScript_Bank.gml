function Bank(arg0) : Game_Object(arg0) constructor
{
    data = 
    {
        auto_deposit: 0,
        auto_deposit_duration_decrease: 0,
        auto_deposit_timer: 0,
        auto_deposit_rss: 0,
        auto_deposit_toggle: false,
        auto_deposit_rss_toggle: false,
        bc_cost_decrease: 0,
        bc_count: 0,
        bc_duration_decrease: 0,
        bc_enabled: true,
        bc_fallback: 0,
        bc_fallback_toggle: 0,
        bc_rarity: 0,
        bc_timer: 0,
        count: 0,
        count_total: 0,
        count_rss: 0,
        count_rss_total: 0,
        offline: 0,
        rss_boost: 0,
        rss_boost_active: true,
        rss_boost_level: 1,
        rss_boost_multiplier: 0,
        storage: 0,
        unlocked: false
    };
    key = "";
    name = "";
    current_amount = 
    {
        resources: {},
        materials: {}
    };
    current_amount_rss = 
    {
        materials: 
        {
            refined_soul_stone: 0
        }
    };
    galaxy = undefined;
    has_material = false;
    has_resource = false;
    last_cards_collected = [];
    material = undefined;
    resource = undefined;
    upgrades = 
    {
        storage: 
        {
            index: 0,
            name: __("Storage"),
            description: __s("Increases bank and boost storage by %s.", number_format_percent(1)),
            value: 1,
            max_level: 0,
            base_cost: 150,
            cost_exp: 1.1,
            cost_material: global.materials.raw_soul_stone
        },
        auto_deposit: 
        {
            index: 5,
            name: __("Auto Deposit"),
            description: __s("Automatically deposits materials and resources to the bank.", global.resources.soul_particles.name_plural),
            value: 1,
            max_level: 1,
            base_cost: 300,
            cost_material: global.materials.refined_soul_stone,
            toggle: true
        },
        auto_deposit_duration_decrease: 
        {
            index: 6,
            name: __("Deposit Duration"),
            description: __s("Decreases auto deposit duration by %s.", number_format_percent(0.05)),
            value: 0.05,
            max_level: 10,
            base_cost: 350,
            cost_exp: 1.2,
            cost_material: global.materials.raw_soul_stone
        },
        bc_cost_decrease: 
        {
            index: 10,
            name: __("Drop Cost"),
            description: __s("Decreases boss card cost by %s.", number_format_percent(0.05)),
            value: 0.05,
            max_level: 10,
            base_cost: 300,
            cost_exp: 1.4,
            cost_material: global.materials.raw_soul_stone
        },
        bc_duration_decrease: 
        {
            index: 20,
            name: __("Drop Duration"),
            description: __s("Decreases boss card drop duration by %s.", number_format_percent(0.05)),
            value: 0.05,
            max_level: 10,
            base_cost: 350,
            cost_exp: 1.3,
            cost_material: global.materials.raw_soul_stone
        },
        bc_rarity: 
        {
            index: 30,
            name: __("Card Rarity"),
            description: __s("Multiplies boss card rarity by %s.", number_format_percent(0.5)),
            value: 0.5,
            max_level: 50,
            base_cost: 25,
            cost_exp: 1.1,
            cost_material: global.materials.refined_soul_stone
        },
        bc_fallback: 
        {
            index: 31,
            name: __("Rarity Fallback"),
            description: __s("Lowers the card rarity if it reached its max count."),
            value: 1,
            max_level: 1,
            base_cost: 666,
            cost_material: global.materials.refined_soul_stone,
            toggle: true
        },
        bc_count: 
        {
            index: 40,
            name: __("Card Count"),
            description: __s("Increases boss card drop count by %s.", 1),
            value: 1,
            max_level: 10,
            base_cost: 150,
            cost_exp: 1.5,
            cost_material: global.materials.refined_soul_stone
        },
        offline: 
        {
            index: 45,
            name: __s("Offline"),
            description: __s("Makes this bank work offline."),
            value: 1,
            max_level: 1,
            base_cost: 5000,
            cost_material: global.materials.refined_soul_stone
        },
        rss_boost: 
        {
            index: 50,
            name: __s("Boost"),
            description: concatstr(__s("Deposit %s to multiply boss card drops.", global.materials.refined_soul_stone.name_plural), " ", __s("Increases max boost level by %s.", 1)),
            value: 1,
            max_level: 10,
            base_cost: 400,
            cost_exp: 1.5,
            cost_material: global.materials.refined_soul_stone
        },
        rss_boost_multiplier: 
        {
            index: 52,
            name: __s("Boost Multiplier"),
            description: __s("Multiplies boost multiplier by %s.", number_format_percent(0.1)),
            value: 0.1,
            max_level: 10,
            base_cost: 1000,
            cost_exp: 1.5,
            cost_material: global.materials.refined_soul_stone,
            
            is_obfuscated: function()
            {
                return self.data.rss_boost == 0;
            }
        },
        auto_deposit_rss: 
        {
            index: 53,
            name: __s("Auto Deposit %s", global.materials.refined_soul_stone.name_plural),
            description: __s("Automatically deposits %s.", global.materials.refined_soul_stone.name_plural),
            value: 1,
            max_level: 1,
            base_cost: 7500,
            cost_material: global.materials.refined_soul_stone,
            toggle: true,
            
            is_obfuscated: function()
            {
                return self.data.rss_boost == 0;
            }
        }
    };
    upgrade_max_level = 10;
    add_keys_to_struct(self.upgrades);
    upgrades_array = struct_to_sorted_array(self.upgrades);
    
    init = function()
    {
        self.has_material = is_struct(self.material);
        self.has_resource = is_struct(self.resource);
        if (!self.has_material && !self.has_resource)
        {
            log("Invalid bank mat/res", self.key);
            exit;
        }
        self.name = sprintf("%s %s", self.galaxy.name, __("Bank"));
        self.update_amount();
    };
    
    can_boost = function()
    {
        if (self.data.rss_boost == 0)
        {
            return false;
        }
        if (!self.data.rss_boost_active)
        {
            return false;
        }
        if (self.data.count_rss < self.get_boost_cost_value())
        {
            return false;
        }
        return true;
    };
    
    can_deposit = function(arg0 = 1)
    {
        if ((self.data.count + arg0) > self.get_storage_size())
        {
            return false;
        }
        if (self.has_material && !has_enough_materials_single(self.material, arg0))
        {
            return false;
        }
        if (self.has_resource && !has_enough_resources_single(self.resource, arg0))
        {
            return false;
        }
        return true;
    };
    
    can_deposit_rss = function(arg0 = 1)
    {
        if ((self.data.count_rss + arg0) > self.get_storage_size_rss())
        {
            return false;
        }
        if (!has_enough_materials_single(global.materials.refined_soul_stone, arg0))
        {
            return false;
        }
        return true;
    };
    
    change_rss_boost_level = function(arg0 = 1)
    {
        self.data.rss_boost_level += arg0;
        self.data.rss_boost_level = clamp(self.data.rss_boost_level, 1, self.data.rss_boost);
    };
    
    check = function(arg0 = o_game.data.stats.time_elapsed, arg1 = false)
    {
        if (!self.is_unlocked())
        {
            return 0;
        }
        if (self.data.auto_deposit_timer == 0)
        {
            self.data.auto_deposit_timer = arg0 + self.get_auto_deposit_duration();
        }
        if (self.data.bc_timer == 0)
        {
            self.data.bc_timer = arg0 + self.get_boss_card_timer_duration();
        }
        var auto_deposit_timer = self.data.auto_deposit_timer;
        var boss_card_cost = self.get_boss_card_cost();
        if (self.data.auto_deposit > 0 && self.data.auto_deposit_toggle && arg0 >= auto_deposit_timer && self.can_deposit(boss_card_cost))
        {
            self.deposit(boss_card_cost);
            self.data.auto_deposit_timer = arg0 + self.get_auto_deposit_duration();
        }
        var rss_cost = self.get_boost_cost_value();
        if (self.data.auto_deposit_rss > 0 && self.data.auto_deposit_rss_toggle && arg0 >= auto_deposit_timer && self.can_deposit_rss(rss_cost))
        {
            self.deposit_rss(rss_cost);
            self.data.auto_deposit_timer = arg0 + self.get_auto_deposit_duration();
        }
        var collect_count_total = 0;
        if (arg0 >= self.data.bc_timer && self.data.bc_enabled)
        {
            self.data.bc_timer = arg0 + self.get_boss_card_timer_duration();
            if (self.data.count >= boss_card_cost)
            {
                var boss = array_random_item(self.get_available_bosses());
                if (is_struct(boss))
                {
                    var type = get_random_card_type(undefined, self.get_boss_card_rarity_adder(), self.get_boss_card_rarity_multiplier());
                    var card_key = sprintf("%s_%s", type.key, boss.key);
                    var card = variable_struct_get(global.cards, card_key);
                    if (is_struct(card))
                    {
                        if (self.data.bc_fallback_toggle && self.get_upgrade_value("bc_fallback") > 0 && !card.can_collect_count() && is_struct(card.type.previous_rarity_type))
                        {
                            var card_previous_rarity = card.get_previous_rarity_type_collectable();
                            if (is_struct(card_previous_rarity))
                            {
                                card = card_previous_rarity;
                            }
                        }
                        var collect_count = 1 + self.get_upgrade_value("bc_count");
                        if (self.can_boost())
                        {
                            collect_count *= (1 + self.get_boss_card_drop_multiplier());
                            collect_count = round(collect_count);
                            self.data.count_rss -= self.get_boost_cost_value();
                        }
                        card.collect(collect_count);
                        collect_count_total += collect_count;
                        self.data.count -= boss_card_cost;
                        self.update_amount();
                        array_push(self.last_cards_collected, sprintf("%sx %s", collect_count, card.name_full));
                        limit_log(self.last_cards_collected, 10);
                    }
                }
            }
        }
        return collect_count_total;
    };
    
    deposit = function(arg0)
    {
        var max_deposit_count = self.get_max_deposit_count();
        arg0 = min(arg0, max_deposit_count);
        self.data.count += arg0;
        self.data.count_total += arg0;
        var result = {};
        if (self.has_resource)
        {
            result.resources = build_resource_cost(self.resource, arg0);
        }
        if (self.has_material)
        {
            result.materials = build_resource_cost(self.material, arg0);
        }
        dec_result(result);
        self.update_amount();
    };
    
    deposit_rss = function(arg0)
    {
        var max_deposit_count = self.get_max_deposit_count_rss();
        arg0 = min(arg0, max_deposit_count);
        self.data.count_rss += arg0;
        self.data.count_rss_total += arg0;
        var result = 
        {
            materials: 
            {
                refined_soul_stone: arg0
            }
        };
        dec_result(result);
        self.update_amount();
    };
    
    draw_current_amount = function(arg0, arg1)
    {
        if (self.has_resource)
        {
            draw_resources(arg0, arg1, build_resource_cost(self.resource, self.resource.data.count));
        }
        if (self.has_material)
        {
            draw_materials(arg0, arg1, build_resource_cost(self.material, self.material.data.count));
        }
    };
    
    draw_boss_card_cost = function(arg0, arg1)
    {
        var boss_card_cost = self.get_boss_card_cost();
        if (self.has_resource)
        {
            draw_resources(arg0, arg1, build_resource_cost(self.resource, boss_card_cost));
        }
        if (self.has_material)
        {
            draw_materials(arg0, arg1, build_resource_cost(self.material, boss_card_cost));
        }
    };
    
    get_auto_deposit_duration = function()
    {
        var value = sec(300);
        value *= (1 - self.get_upgrade_value("auto_deposit_duration_decrease"));
        return value;
    };
    
    get_current_amount_value = function()
    {
        if (self.has_material)
        {
            return variable_struct_get(self.current_amount.materials, self.material.key);
        }
        if (self.has_resource)
        {
            return variable_struct_get(self.current_amount.resources, self.resource.key);
        }
        return 0;
    };
    
    get_current_amount_value_rss = function()
    {
        return self.current_amount_rss.materials.refined_soul_stone;
    };
    
    get_available_bosses = function()
    {
        return _filter(self.galaxy.enemy, function(arg0)
        {
            return arg0.get_current_defeat_counter() > 0 && arg0.has_card;
        });
    };
    
    get_boost_cost_value = function()
    {
        var value = 100 * self.data.rss_boost_level;
        value = max(100, value);
        return value;
    };
    
    get_boss_card_drop_multiplier = function()
    {
        var value = self.data.rss_boost_level * (1 + self.get_upgrade_value("rss_boost_multiplier"));
        return value;
    };
    
    get_boss_card_cost = function()
    {
        var value = 1000 + (1500 * power(self.galaxy.level - 1, 2));
        if (self.galaxy.level >= 7)
        {
            value = 25 + (50 * power(self.galaxy.level - 7, 2));
        }
        value *= (1 - self.get_upgrade_value("bc_cost_decrease"));
        value = max(1, value);
        return value;
    };
    
    get_boss_card_rarity_adder = function()
    {
        var value = 0;
        return value;
    };
    
    get_boss_card_rarity_multiplier = function()
    {
        var value = self.get_upgrade_value("bc_rarity");
        value += (get_cache("banks_boss_card_rarity_multiplier", 1) - 1);
        return value;
    };
    
    get_boss_card_timer_duration = function()
    {
        var duration = sec(300);
        duration *= (1 - self.get_upgrade_value("bc_duration_decrease"));
        duration = max(sec(10), duration);
        if (global.debug)
        {
            duration = sec(2);
        }
        return duration;
    };
    
    get_max_deposit_count = function()
    {
        return self.get_storage_size() - self.data.count;
    };
    
    get_max_deposit_count_rss = function()
    {
        return self.get_storage_size_rss() - self.data.count_rss;
    };
    
    get_storage_size = function()
    {
        var value = 1000 + (1500 * power(self.galaxy.level - 1, 2));
        return value * (1 + self.get_upgrade_value("storage"));
    };
    
    get_storage_size_rss = function()
    {
        var value = 100;
        return value * (1 + self.get_upgrade_value("storage"));
    };
    
    get_unlock_cost = function()
    {
        var material, value;
        if (self.galaxy.level < 4)
        {
            material = global.materials.raw_soul_stone;
            value = 1000 + ((self.galaxy.level - 1) * 3000);
        }
        else if (self.galaxy.level < 7)
        {
            material = global.materials.refined_soul_stone;
            value = 100 + ((self.galaxy.level - 4) * 300);
        }
        else
        {
            material = global.materials.shadow_crystal;
            value = 25 + ((self.galaxy.level - 7) * 50);
        }
        return 
        {
            materials: build_resource_cost(material, value)
        };
    };
    
    is_unlocked = function()
    {
        return self.data.unlocked;
    };
    
    unlock = function()
    {
        dec_result(self.get_unlock_cost());
        self.data.unlocked = true;
    };
    
    update_amount = function()
    {
        if (self.has_material)
        {
            variable_struct_set(self.current_amount.materials, self.material.key, self.data.count);
        }
        if (self.has_resource)
        {
            variable_struct_set(self.current_amount.resources, self.resource.key, self.data.count);
        }
        self.current_amount_rss.materials.refined_soul_stone = self.data.count_rss;
    };
    
    can_upgrade = function(arg0, arg1 = 1)
    {
        var item_level = get_default_struct_value(self.data, arg0, 0);
        var cost = self.get_upgrade_cost(arg0, arg1);
        var max_level = self.get_max_upgrade_level(arg0);
        if (max_level > 0 && item_level >= max_level)
        {
            return false;
        }
        if (!is_undefined(cost) && !has_enough(cost))
        {
            return false;
        }
        return true;
    };
    
    get_max_upgrade_level = function(arg0 = undefined)
    {
        var value = self.upgrade_max_level;
        if (!is_undefined(arg0))
        {
            value = get_default_struct_value(variable_struct_get(self.upgrades, arg0), "max_level", value);
        }
        return value;
    };
    
    get_upgrade_cost = function(arg0, arg1 = 1)
    {
        var upgrade_struct = variable_struct_get(self.upgrades, arg0);
        var base_cost = get_default_struct_value(upgrade_struct, "base_cost", 1);
        var cost_exp = get_default_struct_value(upgrade_struct, "cost_exp", 2);
        var upgrade_level_name = get_default_struct_value(upgrade_struct, "data_name", arg0);
        var upgrade_level = variable_struct_get(self.data, upgrade_level_name);
        var material = get_default_struct_value(upgrade_struct, "cost_material", self.material);
        var value = calculate_item_cost_lite(base_cost, cost_exp, arg1, upgrade_level + 1);
        value *= (self.galaxy.level / 3);
        value = rround(value);
        var cost = 
        {
            materials: build_resource_cost(material, value)
        };
        return cost;
    };
    
    get_upgrade_data = function(arg0)
    {
        var upgrade_struct = variable_struct_get(self.upgrades, arg0);
        var data_name = get_default_struct_value(upgrade_struct, "data_name", arg0);
        return variable_struct_get(self.data, data_name);
    };
    
    self.get_upgrade_name = function(arg0)
    {
        var upgrade_struct = variable_struct_get(self.upgrades, arg0);
        var data_name = get_default_struct_value(upgrade_struct, "data_name", upgrade_struct);
        var name = sprintf("%s [%s/%s]", variable_struct_get(self.upgrades, arg0).name, self.get_upgrade_data(arg0), self.get_max_upgrade_level(arg0));
        if (self.get_max_upgrade_level(arg0) == 0)
        {
            name = sprintf("%s [%s]", variable_struct_get(self.upgrades, arg0).name, self.get_upgrade_data(arg0));
        }
        return name;
    };
    
    get_upgrade_value = function(arg0)
    {
        if (is_undefined(variable_struct_get(self.upgrades, arg0)))
        {
            return 0;
        }
        return variable_struct_get(self.upgrades, arg0).value * self.get_upgrade_data(arg0);
    };
    
    upgrade = function(arg0, arg1 = 1)
    {
        var cost = self.get_upgrade_cost(arg0, arg1);
        dec_result(cost);
        var upgrade_struct = variable_struct_get(self.upgrades, arg0);
        var data_name = get_default_struct_value(upgrade_struct, "data_name", arg0);
        variable_struct_set(self.data, data_name, variable_struct_get(self.data, data_name) + arg1);
    };
    
    set_local_vars(arg0);
    self._init();
}
