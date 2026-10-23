function Dice_Enemy(arg0) : Game_Object(arg0) constructor
{
    data = 
    {
        count: 0,
        defeated: 0,
        difficulty: 1,
        hp: 0,
        seen: false
    };
    hp_max = 1;
    base_level = 1;
    enemy_level = 1;
    level = 1;
    loop_level = 1;
    name = "";
    next_enemy_level = undefined;
    next_enemy_rarity = undefined;
    previous_enemy_level = undefined;
    previous_enemy_rarity = undefined;
    rarity = undefined;
    rarity_level = undefined;
    resource = undefined;
    reward = undefined;
    sprite = spr_placeholder;
    dice = 1;
    sides = 6;
    last_roll_kill = false;
    sort_value = 0;
    upgrade_attributes = {};
    upgrade_attributes_cache = undefined;
    upgrade_attributes_text = "";
    upgrade_multiplier = 1;
    upgrade_multiplier_max = 100;
    
    init = function()
    {
        self.level = self.enemy_level;
        if (!is_struct(self.rarity))
        {
            self.rarity = global.dice_enemies_rarity.normal;
        }
        self.level *= self.rarity.level;
        self.rarity_level = self.rarity.level;
        self.name = sprintf("%s %s", self.rarity.name, self.resource.name_single);
        self.sprite = self.resource.sprite;
        self.dice = 1 + floor(self.level / 3);
        self.sides = 6 + (self.level % 3);
        self.hp_max = 10 + (5 * power(self.level, 2));
        if (self.data.hp <= 0)
        {
            self.data.hp = self.hp_max;
        }
        self.upgrade_attributes.dice_drop_value = 1;
        self.upgrade_attributes.resources_multiplier = build_resource_cost(self.resource, 0.01);
        self.refresh_cache();
        self.sort_value = self.base_level + (self.loop_level * 10000);
    };
    
    get_bonus_value = function()
    {
        if (self.data.defeated <= 0)
        {
            return 0;
        }
        var value = ((self.upgrade_multiplier * min(self.data.defeated, self.get_max_upgrade_multiplier())) / 25) * self.rarity.level;
        return value;
    };
    
    get_kill_count = function()
    {
        return self.data.defeated;
    };
    
    get_max_upgrade_multiplier = function()
    {
        return self.upgrade_multiplier_max;
    };
    
    get_reward = function()
    {
        var value = 1 + power(self.level, 1.2);
        var final_value = round(get_bm_value(value, undefined, "dice_battlefield_reward_multiplier", undefined, true));
        return 
        {
            resources: build_resource_cost(global.resources.dice, final_value)
        };
    };
    
    get_unlock_next_enemy_count = function()
    {
        if ((self.loop_level - 2) >= global.dice_enemies_ordered_length)
        {
            return 0;
        }
        var value = 10 + ((self.rarity.level - 1) * 10);
        return value;
    };
    
    get_unlock_next_difficulty_count = function()
    {
        if (is_undefined(get_default_struct_value(self.rarity, "next_rarity_type", undefined)))
        {
            return 0;
        }
        var value = 50 + ((self.rarity.level - 1) * 10);
        return value;
    };
    
    get_upgrade_attributes = function()
    {
        if (is_undefined(self.upgrade_attributes_cache))
        {
            self.refresh_cache();
        }
        return self.upgrade_attributes_cache;
    };
    
    hit = function(arg0, arg1 = true)
    {
        self.data.hp -= arg0;
        self.last_roll_kill = false;
        if (self.data.hp <= 0)
        {
            self.data.hp = self.hp_max;
            self.data.defeated++;
            self.refresh_cache();
            self.last_roll_kill = true;
            o_game.data.dice.battlefield_level_max = max(o_game.data.dice.battlefield_level_max, self.base_level);
            var add_text = "";
            var die_drop_chance = get_battlefield_die_drop_chance() * 100;
            if (percent_chance(die_drop_chance))
            {
                var d = create_battlefield_die(self.enemy_level);
                if (is_struct(d))
                {
                    add_text = "\n" + __s("%s has dropped.", d.get_name());
                }
                else if (is_string(d))
                {
                    add_text = "\n" + d;
                }
            }
            add_result(self.reward, undefined, undefined, true, true);
            if (arg1)
            {
                notify(__s("%s was defeated for %s.", self.name, format_result_text(self.reward, "")) + add_text);
            }
        }
        return arg0;
    };
    
    is_unlocked = function(arg0)
    {
        if (self.enemy_level <= 1)
        {
            return true;
        }
        if (self.data.defeated > 0 || self.data.seen)
        {
            return true;
        }
        if (arg0 == "level")
        {
            var previous_level = self.loop_level - 2;
            if (previous_level < 0)
            {
                return true;
            }
            var previous_enemy_level_raw = global.dice_enemies_struct.normal[previous_level];
            if (is_struct(previous_enemy_level_raw) && previous_enemy_level_raw.data.defeated < previous_enemy_level_raw.get_unlock_next_enemy_count())
            {
                return false;
            }
        }
        else if (arg0 == "rarity")
        {
            if (is_struct(self.previous_enemy_rarity) && self.previous_enemy_rarity.data.defeated < self.previous_enemy_rarity.get_unlock_next_difficulty_count())
            {
                return false;
            }
            return true;
        }
        if (!is_unlocked_resource(self.resource))
        {
            return false;
        }
        return true;
    };
    
    is_unlocked_gui = function()
    {
        return self.data.seen || self.data.defeated > 0 || (self.is_unlocked("rarity") && self.is_unlocked("level"));
    };
    
    refresh_cache = function()
    {
        self.upgrade_attributes_cache = multiply_struct_values(self.upgrade_attributes, self.get_bonus_value());
        if (self.data.defeated > 0)
        {
            self.upgrade_attributes_cache.dice_drop_value = 1;
            self.upgrade_attributes_text = format_upgrade_text(self.upgrade_attributes_cache, undefined, true, undefined, "\n");
        }
        else
        {
            self.upgrade_attributes_text = "-";
        }
        self.reward = self.get_reward();
    };
    
    roll = function(arg0 = self.dice, arg1 = self.sides, arg2 = 1)
    {
        var value = roll_dice(arg0, arg1, arg2);
        return value;
    };
    
    set_local_vars(arg0);
    self.init();
}
