function Borbventurer(arg0 = undefined) constructor
{
    name = "Borb";
    description = "";
    index = 0;
    key = "";
    bonus = undefined;
    bonus_text = undefined;
    rarity = undefined;
    sprite = spr_borb;
    type = undefined;
    data = 
    {
        adventures: 0,
        completed: 0,
        failed: 0,
        id: -1,
        level: 1,
        locked: false,
        prestige_level: 0,
        rarity_key: global.borbventures.borb_levels.common.key,
        started: false,
        type_key: undefined,
        xp: 0
    };
    
    init = function()
    {
        if (is_undefined(self.data.rarity_key))
        {
            self.data.rarity_key = global.borbventures.borb_levels.common.key;
        }
        self.rarity = variable_struct_get(global.borbventures.borb_levels, self.data.rarity_key);
        if (is_undefined(self.data.type_key))
        {
            self.data.type_key = global.borbventures.borb_types.common.key;
        }
        self.type = variable_struct_get(global.borbventures.borb_types, self.data.type_key);
        self.sprite = self.type.sprite;
        self.bonus_text = format_upgrade_text(self.type.bonus, undefined, undefined, undefined, "\n", true);
    };
    
    add_xp = function(arg0)
    {
        self.data.xp += arg0;
    };
    
    ascend = function()
    {
        var next_rarity = self.rarity.next_rarity;
        if (is_undefined(next_rarity))
        {
            exit;
        }
        dec_resources(self.get_ascend_cost());
        self.data.level = 1;
        self.data.rarity_key = next_rarity.key;
        self.rarity = next_rarity;
    };
    
    can_ascend = function()
    {
        if (self.data.level < self.get_max_level())
        {
            return false;
        }
        if (self.rarity.key == global.borbventures.borb_levels.legendary.key)
        {
            return false;
        }
        if (!has_enough_resources(self.get_ascend_cost()))
        {
            return false;
        }
        return true;
    };
    
    can_dismiss = function()
    {
        if (self.data.locked)
        {
            return false;
        }
        if (self.is_on_adventure())
        {
            return false;
        }
        return true;
    };
    
    can_prestige = function()
    {
        if (self.data.level < self.get_max_level())
        {
            return false;
        }
        if (!is_undefined(self.rarity.next_rarity))
        {
            return false;
        }
        if (!has_enough_resources(self.get_prestige_cost()))
        {
            return false;
        }
        return true;
    };
    
    can_upgrade = function(arg0 = 1)
    {
        if ((self.data.level + arg0) > self.get_max_level())
        {
            return false;
        }
        if (!self.can_upgrade_xp(arg0))
        {
            return false;
        }
        if (!has_enough_resources(self.get_upgrade_cost(arg0)))
        {
            return false;
        }
        return true;
    };
    
    can_upgrade_xp = function(arg0 = 1)
    {
        if ((self.data.level + arg0) > self.get_max_level())
        {
            return false;
        }
        if (self.data.xp < self.get_next_level_xp(arg0))
        {
            return false;
        }
        return true;
    };
    
    check_levelup = function()
    {
        var next_xp = self.get_next_level_xp();
        if (self.data.xp >= next_xp)
        {
            self.levelup();
            self.check_levelup();
        }
    };
    
    create = function()
    {
        self.data.id = o_game.data.borbventurer_id_counter;
        o_game.data.borbventurer_id_counter++;
    };
    
    dismiss = function()
    {
        var __array = global.borbventures.items.borbventures;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            remove_item_from_array_by_id(mitem.borbs, self.data.id, true);
        }
        remove_item_from_array_by_id(global.borbventures.items.borbs, self.data.id);
    };
    
    finish = function(arg0, arg1)
    {
        self.data.adventures++;
        self.data.started = false;
        if (arg0)
        {
            self.data.completed++;
            self.add_xp(arg1.get_xp());
        }
        else
        {
            self.data.failed++;
        }
    };
    
    get_ascend_cost = function()
    {
        var cost = 
        {
            borb_ascension_juice: 10 + power(self.rarity.level - 1, 2.5)
        };
        return cost;
    };
    
    get_bonus = function(arg0, arg1 = 0)
    {
        if (!is_struct(struct_get_from_hash(self.type, variable_get_hash("bonus"))))
        {
            return arg1;
        }
        return get_default_struct_value(self.type.bonus, arg0, arg1);
    };
    
    get_borbventure_success_chance = function()
    {
        var chance = ((self.rarity.level - 1) * 10) + (self.data.level / 3);
        chance *= (1 + self.get_bonus("borbventure_increase_success_chance", 0));
        return chance;
    };
    
    get_borbventure_duration = function()
    {
        return self.get_bonus("borbventure_increase_time", 0);
    };
    
    get_id = function()
    {
        return self.data.id;
    };
    
    get_max_level = function()
    {
        return 10;
    };
    
    get_next_level_xp = function(arg0 = 1)
    {
        var xp_sum = 0;
        for (var i = 0; i < arg0; i++)
        {
            xp_sum += ceil(5 + (1.5 * power(self.data.level + i + ((self.rarity.level - 1) * 10), 1.1)));
        }
        return xp_sum;
    };
    
    get_prestige_cost = function()
    {
        var cost = 
        {
            borb_ascension_juice: 100
        };
        return cost;
    };
    
    get_upgrade_cost = function(arg0 = 1)
    {
        var cost_value = 0;
        for (var i = 0; i < arg0; i++)
        {
            cost_value += (100 + power((self.data.level - 1) + i, 1.75));
        }
        var cost = 
        {
            borb_juice: cost_value
        };
        return cost;
    };
    
    is_on_adventure = function()
    {
        return self.data.started;
    };
    
    levelup = function(arg0 = true, arg1 = 1)
    {
        if (arg0)
        {
            self.data.xp -= self.get_next_level_xp(arg1);
        }
        var old_level = self.data.level;
        self.data.level += arg1;
        var text = sprintf("%s!\n%s -> %s", __s("%s has leveled up", "Borb"), old_level, self.data.level);
        notify(text);
    };
    
    start = function()
    {
        self.data.started = true;
    };
    
    upgrade = function(arg0 = 1)
    {
        dec_resources(self.get_upgrade_cost(arg0));
        self.levelup(true, arg0);
    };
    
    get_level = function()
    {
        return self.data.level;
    };
    
    get_name = function()
    {
        var borb_name = self.type.name;
        var name_final = sprintf("[%s] %s %s", self.data.level, self.rarity.name, borb_name);
        if (global.debug)
        {
            name_final += sprintf(" ID=%s", self.data.id);
        }
        return name_final;
    };
    
    get_description = function(arg0 = 1)
    {
        var desc_final = get_value_ext(self, self.description, false);
        if (!is_empty(desc_final))
        {
            desc_final += "\n";
        }
        var status = self.is_on_adventure() ? __("On a borbventure") : __("Available");
        if (!self.can_upgrade_xp() && has_enough_resources(self.get_upgrade_cost()))
        {
            if (self.data.level < self.get_max_level())
            {
                desc_final += (__s("More experience required to upgrade this Borb.") + "\n" + "\n");
            }
            else if (!is_undefined(self.rarity.next_rarity))
            {
                desc_final += (__s("Max level reached. Ascend this Borb to upgrade it further.") + "\n" + "\n");
            }
        }
        var experience_text = sprintf("%s: %s", __("Experience"), number_format(self.data.xp));
        if (self.data.level < self.get_max_level())
        {
            experience_text += sprintf("/%s", number_format(self.get_next_level_xp(arg0)));
        }
        desc_final += concat([sprintf("%s: %s", __("Rarity"), self.rarity.name), sprintf("%s: %s/%s", __("Level"), self.data.level, self.get_max_level()), experience_text, sprintf("%s: %s", __("Status"), status), sprintf("%s: %s", __("Completed"), number_format(self.data.completed)), "", self.bonus_text]);
        return desc_final;
    };
    
    get_tooltip = function()
    {
        return sprintf("%s\n\n%s", self.get_name(), self.bonus_text);
    };
    
    is_obfuscated = function()
    {
        return false;
    };
    
    load_data = function(arg0)
    {
        apply_struct_to_struct(self.data, arg0);
        self.init();
    };
    
    apply_struct_to_struct(self.data, arg0);
    init();
}
