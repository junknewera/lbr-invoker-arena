function Shadow_Player(arg0 = undefined) : Game_Object(arg0) constructor
{
    key = "";
    data = 
    {
        dead: false,
        hp: -1,
        rest_timer: 0,
        revive_timer: 0,
        stamina: -1
    };
    
    can_rest = function()
    {
        if (self.data.dead)
        {
            return false;
        }
        if (o_game.data.stats.time_elapsed < self.data.rest_timer)
        {
            return false;
        }
        if (self.data.stamina >= self.get_max_stamina() && self.data.hp >= self.get_max_hp())
        {
            return false;
        }
        return true;
    };
    
    can_revive = function()
    {
        if (!self.data.dead)
        {
            return false;
        }
        return o_game.data.stats.time_elapsed >= self.data.revive_timer;
    };
    
    get_first_attack_chance = function(arg0 = 1)
    {
        var player_speed = self.get_speed();
        var total = player_speed + arg0;
        if (total <= 0)
        {
            return 0.5;
        }
        var chance = player_speed / total;
        return chance;
    };
    
    get_max_hp = function()
    {
        var value = get_bm_value(5, "shadow_crystal_player_hp", "shadow_crystal_player_hp_multiplier", rround, true);
        return rround(value);
    };
    
    get_rest_hp_value = function()
    {
        var value = get_bm_value(2, "shadow_crystal_player_rest_hp_value", "shadow_crystal_player_rest_hp_value_multiplier", undefined, true);
        return rround(value);
    };
    
    get_rest_stamina_value = function()
    {
        var pct_value = get_bm_value(0.1, "shadow_crystal_player_rest_stamina_value");
        var value = max(1, rround(self.get_max_stamina() * pct_value));
        return rround(value);
    };
    
    get_speed = function()
    {
        var value = get_bm_value(1, "shadow_crystal_player_speed", "shadow_crystal_player_speed_multiplier", undefined, true);
        return rround(value);
    };
    
    get_stamina = function()
    {
        var value = clamp(self.data.stamina, 0, self.get_max_stamina());
        return rround(value);
    };
    
    get_max_stamina = function()
    {
        var value = get_bm_value(5, "shadow_crystal_player_stamina", "shadow_crystal_player_stamina_multiplier", undefined, true);
        return rround(value);
    };
    
    get_attack_damage = function()
    {
        var damage_min = self.get_base_damage();
        var damage_max = rround(damage_min * self.get_attack_max_multiplier());
        var value = irandom_range(damage_min, damage_max);
        return value;
    };
    
    get_attack_max_multiplier = function()
    {
        var value = get_bm_value(2, "shadow_crystal_attack_max_multiplier");
        return value;
    };
    
    get_base_damage = function()
    {
        var damage = get_bm_value(1, "shadow_crystal_attack_damage", "shadow_crystal_attack_damage_multiplier", undefined, true);
        damage = rround(damage);
        return damage;
    };
    
    get_resistance = function()
    {
        var value = get_bm_value(1, "shadow_crystal_player_resistance");
        return value;
    };
    
    regenerate = function()
    {
        self.data.hp = self.get_max_hp();
        self.data.stamina = self.get_max_stamina();
    };
    
    rest = function(arg0 = 1)
    {
        var hp_value = self.get_rest_hp_value() * arg0;
        var stamina_value = self.get_rest_stamina_value() * arg0;
        self.data.hp = min(self.data.hp + hp_value, self.get_max_hp());
        self.data.stamina = min(self.data.stamina + stamina_value, self.get_max_stamina());
        add_sc_log(__s("%s rests %s for %s.", __("Player"), number_format(arg0) + "x", sprintf("%s %s, %s %s", stamina_value, __("Stamina"), hp_value, __("HP"))));
        global.shadow_crystal.rest();
    };
    
    auto_rest = function()
    {
        var max_hp = self.get_max_hp();
        var hp_value = self.get_rest_hp_value();
        var max_stamina = self.get_max_stamina();
        var stamina_value = self.get_rest_stamina_value();
        var rest_count = max(ceil((max_hp - self.data.hp) / hp_value), ceil((max_stamina - self.data.stamina) / stamina_value));
        self.rest(rest_count);
    };
    
    revive = function()
    {
        if (!self.data.dead)
        {
            exit;
        }
        self.data.dead = false;
        self.data.hp = 1;
        var revive_timeout = sec(60);
        if (global.debug)
        {
            revive_timeout = sec(5);
        }
        self.data.revive_timer = revive_timeout;
        add_sc_log(__s("%s revived.", __("Player")));
    };
    
    set_local_vars(arg0);
    self._init();
}
