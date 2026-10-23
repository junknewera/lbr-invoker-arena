function Shadow_Enemy(arg0 = undefined) : Game_Object(arg0) constructor
{
    key = "";
    data = 
    {
        attack_counter: 0,
        dead: false,
        defeated: 0,
        defeat_counter: 0,
        highest_defeat_level: 0,
        hp: -1,
        last_damage: 0,
        last_reward: undefined,
        level: 1,
        level_cleared: false,
        respawn_timer: 0,
        safe_climbing: true,
        safe_level: 0,
        target_level: 0
    };
    map = undefined;
    upgrades = {};
    upgrade_refresh_duration = 100000000000000000000;
    
    init = function()
    {
    };
    
    attack = function(arg0 = global.shadow_player.get_attack_damage())
    {
        random_set_seed(o_game.data.random_num + self.data.attack_counter++);
        var player_attacks_first_chance = global.shadow_player.get_first_attack_chance();
        var player_attacks_first = percent_chance(player_attacks_first_chance * 100);
        var player_died = false;
        var shadow_died = false;
        if (player_attacks_first)
        {
            self.player_attack(arg0);
            shadow_died = self.check_dead();
            if (!shadow_died)
            {
                player_died = self.shadow_attack();
            }
        }
        else
        {
            player_died = self.shadow_attack();
            if (!player_died)
            {
                self.player_attack(arg0);
                shadow_died = self.check_dead();
            }
        }
        randomize();
        if (player_died)
        {
            self.data.safe_climbing = false;
            if (self.data.safe_level > 0)
            {
                self.data.safe_level = max(1, min(self.data.safe_level, self.data.level - 1));
            }
        }
        if (shadow_died)
        {
            if (self.data.safe_level == 0)
            {
                self.data.safe_level = self.data.level;
            }
            if (self.data.safe_climbing)
            {
                self.data.safe_level = self.data.level;
            }
        }
        if (shadow_died || player_died)
        {
            check_shadow_crystal_auto_advance();
        }
        return shadow_died;
    };
    
    check_dead = function()
    {
        if (self.data.hp > 0)
        {
            return false;
        }
        var result = self.get_reward();
        add_result_lite(result);
        self.data.dead = true;
        self.data.defeated++;
        self.data.hp = self.get_max_hp();
        self.data.last_reward = result;
        self.data.respawn_timer = o_game.data.stats.time_elapsed + self.get_respawn_timer();
        add_sc_log(__s("%s level %s defeated.", __("Shadow Crystal"), number_format(self.data.level)));
        if (self.data.level > self.data.highest_defeat_level)
        {
            var defeat_counter_level = self.get_max_defeat_counter();
            self.data.defeat_counter = clamp(++self.data.defeat_counter, 0, defeat_counter_level);
            if (self.data.defeat_counter >= defeat_counter_level)
            {
                self.data.defeat_counter = 0;
                self.data.highest_defeat_level = max(self.data.highest_defeat_level, self.data.level);
            }
        }
        global.shadow_player.regenerate();
        notify(concatstr_nl(__s("Defeated %s level %s!", __("Shadow Crystal"), self.data.level), format_result_text(result)));
        return true;
    };
    
    player_attack = function(arg0)
    {
        var resistance = max(1, self.get_resistance(self.data.level));
        var final_damage = max(1, round(divide_safe(arg0, resistance)));
        self.data.hp -= final_damage;
        self.data.hp = clamp(self.data.hp, 0, self.get_max_hp());
        self.data.last_damage = final_damage;
        global.shadow_player.data.stamina--;
        add_sc_log(__s("Hit %s for %s damage.", __("Shadow Crystal"), number_format(final_damage)));
    };
    
    shadow_attack = function()
    {
        var player_died = false;
        var damage = self.get_attack_damage();
        var final_damage = self.get_final_attack_damage(damage);
        add_sc_log(__s("Hit %s for %s damage.", __("Player"), number_format(final_damage)));
        global.shadow_player.data.hp -= final_damage;
        if (global.shadow_player.data.hp <= 0)
        {
            player_died = true;
            global.shadow_player.data.dead = true;
            global.shadow_player.data.stamina = 0;
            self.data.hp = self.get_max_hp();
            add_sc_log(__s("%s died.", __("Player")));
        }
        global.shadow_player.data.hp = max(0, global.shadow_player.data.hp);
        return player_died;
    };
    
    can_attack = function()
    {
        if (o_game.data.stats.time_elapsed < self.data.respawn_timer)
        {
            return false;
        }
        if (global.shadow_player.data.stamina < 1)
        {
            return false;
        }
        if (global.shadow_player.data.hp <= 0 || global.shadow_player.data.dead)
        {
            return false;
        }
        if (get_option(global.options.sc_auto_attack_safe))
        {
            var min_damage = self.get_final_attack_damage(self.get_attack_damage_max());
            if (min_damage >= global.shadow_player.data.hp)
            {
                return false;
            }
        }
        return true;
    };
    
    change_level = function(arg0 = 1)
    {
        self.set_level(self.data.level + arg0);
    };
    
    set_level = function(arg0)
    {
        self.data.level = arg0;
        self.data.level = clamp(self.data.level, 1, min(self.get_max_level(), self.data.highest_defeat_level + 1));
        self.data.hp = self.get_max_hp();
        self.data.target_level = 0;
    };
    
    get_max_defeat_counter = function()
    {
        var max_value = get_bm_value(global.game_settings.shadow_crystal_defeat_counter, "shadow_crystal_max_defeat_counter", undefined, undefined, undefined, -1);
        var value = max(1, max_value);
        return value;
    };
    
    get_hp = function()
    {
        self.data.hp = clamp(self.data.hp, 0, self.get_max_hp());
        return self.data.hp;
    };
    
    get_max_hp = function(arg0 = self.data.level)
    {
        var value = 5 + power((arg0 - 1) * 3, 1.7);
        value = get_bm_value(value, "shadow_crystal_hp_decrease", "shadow_crystal_hp_decrease_multiplier", rround, true, -1);
        value = max(1, value);
        return value;
    };
    
    get_max_level = function()
    {
        return global.game_settings.shadow_crystal_max_level;
    };
    
    get_resistance = function(arg0 = self.data.level)
    {
        var resistance = 1 + floor(power((arg0 - 1) / 10, 1.6));
        resistance = get_bm_value(resistance, "shadow_crystal_decrease_resistance", undefined, undefined, undefined, -1);
        resistance = max(1, resistance);
        return resistance;
    };
    
    get_respawn_timer = function()
    {
        var value = sec(60);
        value = get_bm_value(value, undefined, "shadow_crystal_respawn_timer_decrease_multiplier", undefined, true, -1);
        value = max(sec(1), value);
        if (global.debug)
        {
            value = 1;
        }
        return value;
    };
    
    get_reward = function(arg0 = self.data.level)
    {
        var essence_base_value = rround(1 + power(arg0 - 1, 1.2));
        var reward = 
        {
            materials: 
            {
                essence_shadow: get_bm_value(essence_base_value, "shadow_crystal_reward", "shadow_crystal_reward_multiplier", rround, true)
            }
        };
        return reward;
    };
    
    get_speed = function(arg0 = self.data.level)
    {
        var value = 1 + ((arg0 - 1) * 1.5);
        value = max(1, rround(value));
        return value;
    };
    
    get_attack_damage = function()
    {
        return irandom_range(self.get_attack_damage_min(), self.get_attack_damage_max());
    };
    
    get_attack_damage_min = function(arg0 = self.data.level)
    {
        var value = 1 + power(arg0 - 1, 1.5);
        value = rround(value);
        return value;
    };
    
    get_attack_damage_max = function(arg0 = self.data.level)
    {
        return rround(self.get_attack_damage_min(arg0) * 1.5);
    };
    
    get_final_attack_damage = function(arg0)
    {
        return max(1, round(divide_safe(arg0, global.shadow_player.get_resistance())));
    };
    
    is_spawned = function()
    {
        if (o_game.data.stats.time_elapsed >= self.data.respawn_timer)
        {
            self.data.dead = false;
        }
        return o_game.data.stats.time_elapsed >= self.data.respawn_timer;
    };
    
    rest = function()
    {
        self.data.hp += rround(self.get_max_hp() * 0.2);
        self.data.hp = clamp(self.data.hp, 0, self.get_max_hp());
    };
    
    set_local_vars(arg0);
    self._init();
}
