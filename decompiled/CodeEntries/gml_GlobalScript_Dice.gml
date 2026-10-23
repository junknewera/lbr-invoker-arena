function Dice(arg0 = undefined) : Game_Object(arg0) constructor
{
    data = 
    {
        avg: 0,
        avg_high: 0,
        color_id: "def",
        count: 1,
        dice: 0,
        id: undefined,
        level: 1,
        locked: false,
        power_rolls: 0,
        rarity_key: "",
        roll: 0,
        roll_count: 0,
        roll_high: 0,
        rolls: [],
        sides: 0,
        timeout: 0,
        type_key: ""
    };
    bag = "inventory";
    cost_cache = undefined;
    cost_cache_power_roll = undefined;
    index = 0;
    info_cache = undefined;
    key = 0;
    name = "";
    name_prefix = "";
    paging_id = "dice";
    rarity = undefined;
    rolls_cache = "";
    sprite = spr_placeholder;
    type = undefined;
    upgrade_attributes = undefined;
    upgrade_attributes_cache = undefined;
    upgrade_attributes_text = "";
    upgrade_max_level = 10;
    upgrade_multiplier = 1;
    upgrades = 
    {
        dice: 
        {
            name: __("Dice count"),
            value: 1,
            base_cost: 60,
            cost_exp: 3
        },
        sides: 
        {
            name: __("Side count"),
            value: 1,
            base_cost: 30,
            cost_exp: 2.5
        }
    };
    
    init = function()
    {
        self.key = self.index;
        self.name = sprintf("%s %s", self.name_prefix, __("Die"));
        if (!is_empty(self.data.rarity_key))
        {
            self.rarity = variable_struct_get(global.dice_rarity, self.data.rarity_key);
        }
        if (!is_struct(self.rarity))
        {
            self.rarity = global.dice_rarity.common;
        }
        self.data.rarity_key = self.rarity.key;
        if (is_undefined(self.type))
        {
            if (!is_empty(self.data.type_key))
            {
                self.type = variable_struct_get(global.dice_types, self.data.type_key);
            }
            if (!is_struct(variable_struct_get(global.dice_types, self.data.type_key)))
            {
                self.type = global.dice_types.leaf;
            }
        }
        self.data.type_key = self.type.key;
        init_item_upgrades(self);
        if (is_undefined(self.data.id))
        {
            self.data.id = guid();
        }
        if (is_undefined(self.upgrade_attributes))
        {
            self.upgrade_attributes = {};
            self.upgrade_attributes.dice_drop_value = 1;
            add_struct_to_struct(self.upgrade_attributes, self.type.get_upgrade_attributes());
        }
        self.refresh_cache();
    };
    
    can_equip = __return_false;
    
    can_roll = function()
    {
        if (o_game.data.stats.time_elapsed < self.data.timeout)
        {
            return false;
        }
        if (!has_enough(self.get_roll_cost()))
        {
            return false;
        }
        return true;
    };
    
    can_power_roll = function()
    {
        if (!has_enough(self.get_power_roll_cost()))
        {
            return false;
        }
        if (self.data.count <= 1)
        {
            return false;
        }
        return true;
    };
    
    can_salvage = function()
    {
        return !self.is_locked() && self.data.count >= 0;
    };
    
    can_upgrade = function(arg0, arg1 = 1)
    {
        var item_level = get_default_struct_value(self.data, arg0, 0);
        var cost = self.get_upgrade_cost(arg0, arg1);
        if (self.upgrade_max_level > 0 && item_level >= self.upgrade_max_level)
        {
            return false;
        }
        if (!is_undefined(cost) && !has_enough(cost))
        {
            return false;
        }
        return true;
    };
    
    collect = function(arg0 = 1)
    {
        self.data.count += arg0;
    };
    
    get_bonus_min_rolls = function()
    {
        return 5;
    };
    
    get_bonus_value = function()
    {
        if (!self.has_enough_upgrade_rolls())
        {
            return 0;
        }
        var value = self.upgrade_multiplier * self.data.avg_high;
        return value;
    };
    
    get_bg_color = function()
    {
        return self.rarity.color;
    };
    
    get_bg_sprite = function()
    {
        var color = variable_struct_get(global.custom_colors, self.data.color_id);
        if (is_undefined(color))
        {
            return global.custom_colors.def.sprite;
        }
        return color.sprite;
    };
    
    get_dice_count = function()
    {
        return round(get_dice() + self.data.dice);
    };
    
    get_sides_count = function()
    {
        return round(get_dice_sides() + self.data.sides);
    };
    
    get_info = function()
    {
        var name = sprintf("%sx %s", self.data.count, self.get_name());
        return name;
    };
    
    get_max_bonus_level = function()
    {
        var value = get_bm_value(100, "dice_max_bonus_level");
        value += ((self.rarity.level - 1) * 50);
        return value;
    };
    
    get_max_upgrade_level = function(arg0 = undefined)
    {
        var value = 10;
        if (!is_undefined(arg0))
        {
            value = get_default_struct_value(variable_struct_get(self.upgrades, arg0), "max_level", value);
        }
        return value;
    };
    
    get_name = function()
    {
        var dice_name_formatted = sprintf("%sd%s", self.get_dice_count(), self.get_sides_count());
        return sprintf("%s %s %s (%s)", self.rarity.name, self.type.name, __("Die"), dice_name_formatted);
    };
    
    get_die_name = function()
    {
        return sprintf("%s %s %s", self.rarity.name, self.type.name, __("Die"));
    };
    
    get_roll_cost = function()
    {
        if (is_undefined(self.cost_cache))
        {
            var value = get_bm_value(10 + (20 * (self.rarity.level - 1)), "dice_roll_cost_reduction", "dice_roll_cost_reduction_multiplier", undefined, true, -1);
            self.cost_cache = 
            {
                resources: 
                {
                    dice: value
                }
            };
        }
        return self.cost_cache;
    };
    
    get_power_roll_cost = function()
    {
        if (is_undefined(self.cost_cache_power_roll))
        {
            var value = get_bm_value(25 + (50 * (self.rarity.level - 1)), "dice_roll_cost_reduction", "dice_roll_cost_reduction_multiplier", undefined, true, -1);
            self.cost_cache_power_roll = 
            {
                resources: 
                {
                    power_dice: value
                }
            };
        }
        return self.cost_cache_power_roll;
    };
    
    get_salvage_count = function()
    {
        var count = get_key_modifier_item(self, undefined, true, undefined, undefined, true);
        if (self.data.count <= 1)
        {
            return 1;
        }
        if (count >= self.data.count)
        {
            count = self.data.count - 1;
        }
        return count;
    };
    
    get_salvage_resources = function(arg0 = 1)
    {
        return self.rarity.get_salvage_resources(arg0);
    };
    
    get_sort_value = function()
    {
        var value;
        switch (get_option(global.options.borbventures_inventory_sort_type))
        {
            case UnknownEnum.Value_1:
                value = (string_to_number(self.type.key) * 1000000000000) + self.rarity.level;
                break;
            default:
                value = (self.rarity.level * 1000000000000) + string_to_number(self.type.key);
                break;
        }
        return value;
    };
    
    get_sprite = function()
    {
        return self.type.sprite;
    };
    
    get_timeout_duration = function()
    {
        var timeout = sec(30);
        timeout -= sec(get_upgrade_attribute_value(global.upgrade_attributes.dice_timeout_reduction));
        timeout = max(sec(1), timeout);
        if (self.data.roll_count < self.get_bonus_min_rolls())
        {
            timeout = sec(1);
        }
        if (global.debug)
        {
            timeout = 1;
        }
        return timeout;
    };
    
    get_timeout_formatted = function()
    {
        return format_remaining_time(self.data.timeout, undefined, true);
    };
    
    get_upgrade_attributes = function()
    {
        if (is_undefined(self.upgrade_attributes_cache))
        {
            self.refresh_cache();
        }
        return self.upgrade_attributes_cache;
    };
    
    get_upgrade_cost = function(arg0, arg1 = 1)
    {
        var upgrade_struct = variable_struct_get(self.upgrades, arg0);
        var base_cost = get_default_struct_value(upgrade_struct, "base_cost", 1);
        var cost_exp = get_default_struct_value(upgrade_struct, "cost_exp", 2);
        var upgrade_level_name = get_default_struct_value(upgrade_struct, "data_name", arg0);
        var upgrade_level = variable_struct_get(self.data, upgrade_level_name);
        var cost = 
        {
            resources: 
            {
                dice: calculate_item_cost_lite(base_cost, cost_exp, upgrade_level + 1, arg1)
            }
        };
        return cost;
    };
    
    get_upgrade_data = function(arg0)
    {
        var upgrade_struct = variable_struct_get(self.upgrades, arg0);
        var data_name = get_default_struct_value(upgrade_struct, "data_name", arg0);
        return variable_struct_get(self.data, data_name);
    };
    
    get_upgrade_description = function(arg0)
    {
        var desc = "";
        return desc;
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
    
    has_enough_upgrade_rolls = function()
    {
        return array_length(self.data.rolls) >= self.get_bonus_min_rolls();
    };
    
    is_locked = function()
    {
        return self.data.locked;
    };
    
    power_roll = function()
    {
        var power_roll_count = get_power_roll_count();
        self.roll(power_roll_count, true);
        self.data.count -= 1;
        self.data.power_rolls++;
    };
    
    refresh_cache = function()
    {
        var bonus_value = self.get_bonus_value();
        var bonus_value_final = 4 * sqrt(bonus_value);
        bonus_value_final *= self.rarity.upgrade_multiplier;
        self.upgrade_attributes_cache = multiply_struct_values(self.upgrade_attributes, bonus_value_final);
        self.upgrade_attributes_cache.dice_drop_value = 1;
        self.rolls_cache = implode(", ", self.data.rolls, true);
        if (!self.has_enough_upgrade_rolls())
        {
            self.upgrade_attributes_text = __s("%s more rolls needed.", self.get_bonus_min_rolls() - array_length(self.data.rolls));
        }
        else
        {
            self.upgrade_attributes_text = format_upgrade_text(self.upgrade_attributes_cache, undefined, true, undefined, "\n");
        }
    };
    
    refresh_info_text = function()
    {
        self.info_cache = self.get_name();
    };
    
    reset_rolls = function()
    {
        self.data.roll_high = 0;
        self.data.rolls = [];
        self.data.avg = 0;
        self.data.avg_high = 0;
    };
    
    roll = function(arg0 = 1, arg1 = false)
    {
        var dice = self.get_dice_count();
        var sides = self.get_sides_count();
        var value = 0;
        repeat (arg0)
        {
            repeat (dice)
            {
                value += irandom_range(1, sides);
            }
        }
        var timeout = self.get_timeout_duration();
        var timeout_text = sprintf("dice_roll_%s", self.index);
        self.data.timeout = o_game.data.stats.time_elapsed + timeout;
        self.data.roll_count++;
        self.data.roll = value;
        self.data.roll_high = max(self.data.roll_high, value);
        if (!is_array(self.data.rolls))
        {
            self.data.rolls = [];
        }
        array_push(self.data.rolls, value);
        limit_log(self.data.rolls, 5);
        self.data.avg = calc_avg(self.data.rolls);
        if (self.has_enough_upgrade_rolls())
        {
            self.data.avg_high = max(self.data.avg, self.data.avg_high);
            refresh_ua_section("dice");
        }
        self.refresh_cache();
        if (arg1)
        {
            dec_result(self.get_power_roll_cost());
        }
        else
        {
            dec_result(self.get_roll_cost());
        }
        return value;
    };
    
    salvage = function(arg0 = 1)
    {
        if (self.data.count > 0)
        {
            add_result(self.get_salvage_resources(arg0), undefined, undefined, true, true);
            notify(__s("%s %s salvaged.", arg0, self.get_name()));
            self.data.count -= arg0;
        }
        else
        {
            notify(__s("%s removed.", self.get_name()));
        }
        if (self.data.count <= 0)
        {
            remove_item_from_array_by_id(global.dice_backpack, self.data.id);
            remove_item_from_array_by_id(global.dice_inventory, self.data.id);
        }
        refresh_ua_section("dice");
        clear_selected_item(self.paging_id, self);
        return self.data.count;
    };
    
    salvage_confirm = function(arg0 = 1)
    {
        global.selected_inventory_item.dice = self;
        global.selected_inventory_item.dice_count = arg0;
        confirm_dialog_current_nav(__s("Do you want to salvage %s %s?", arg0, self.get_name()), function()
        {
            if (!is_struct(global.selected_inventory_item.dice))
            {
                exit;
            }
            global.selected_inventory_item.dice.salvage(global.selected_inventory_item.dice_count);
            clear_selected_item("dice", struct_get_from_hash(global.selected_inventory_item, variable_get_hash("dice")));
        });
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
    self.init();
}

enum UnknownEnum
{
    Value_1 = 1
}
