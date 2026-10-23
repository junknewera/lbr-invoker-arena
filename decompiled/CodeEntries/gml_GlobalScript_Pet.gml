function Pet(arg0) : Upgradable_Item(arg0) constructor
{
    name = __("Unknown Pet");
    add_upgrade_description = false;
    description = __("The developer was too lazy to provide a description. Blame him.");
    description_cache = undefined;
    description_locked = "";
    index = 0;
    instance = -1;
    is_buyable = true;
    offline_reward = undefined;
    pet_timeout = global.game_settings.pet_timeout;
    scale = 1;
    scale_sign = 1;
    scale_sign_x = 1;
    scale_sign_y = 1;
    sprite = spr_placeholder;
    sprite_orig = spr_placeholder;
    sprite_walk = spr_placeholder;
    data_defaults = 
    {
        pet_count: 0,
        pet_delay: 0,
        prio: 0,
        skin: undefined
    };
    add_bonus_upgrade_multiplier = true;
    add_upgrade_multiplier = true;
    fractional = false;
    generatable_in_quests = true;
    max_upgrade_level = global.game_settings.pet_max_upgrade_level_base;
    max_upgrade_multiplier = 10;
    upgrade_attributes_apply_early = false;
    upgrade_material = global.materials.essence_leaf;
    upgrade_multiplier = global.game_settings.pet_upgrade_multiplier;
    unlock_cost_base = global.game_settings.pet_unlock_cost_base;
    upgrade_cost_base = global.game_settings.pet_upgrade_cost_base;
    upgrade_cost_exp = global.game_settings.pet_upgrade_cost_exp;
    upgrade_cost_special_divider = 70;
    upgrade_cost_special_level = 10;
    set_sprite_data(self);
    
    init = function()
    {
        if (self.sprite_walk == spr_placeholder)
        {
            self.sprite_walk = self.sprite;
        }
    };
    
    activate = function(arg0 = false, arg1 = false)
    {
        if (!self.can_activate_max_count())
        {
            exit;
        }
        self.destroy();
        self.data.active = true;
        if (!arg1)
        {
            var max_prio = 0;
            var __struct = global.pets;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                if (mitem.data.prio > max_prio)
                {
                    max_prio = mitem.data.prio;
                }
            }
            self.data.prio = max_prio + 1;
        }
        ds_list_add(global.active_pets, self);
        var o = instance_create_layer(room_width / 2, room_height / 2, global.layers.pets, o_pet);
        self.instance = o;
        o.type = self;
        self.refresh_skin();
        if (!arg0)
        {
            refresh_ua_section("pets");
        }
        self.func();
        global.force_pet_limits = true;
        sort_pets_by_prio();
    };
    
    can_activate_max_count = function()
    {
        var current_count = ds_list_size(global.active_pets);
        var max_count = get_max_active_pets_size();
        return current_count < max_count;
    };
    
    deactivate = function(arg0 = true, arg1 = false)
    {
        if (arg1 || arg0)
        {
            self.data.active = false;
        }
        if (arg0)
        {
            self.data.prio = 0;
        }
        self.destroy();
        var __dslist = global.active_pets;
        var __prop_len = ds_list_size(__dslist);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            if (is_undefined(ds_list_find_value(__dslist, __i)))
            {
                continue;
            }
            var mitem = ds_list_find_value(__dslist, __i);
            if (mitem.key == self.key)
            {
                ds_list_delete(global.active_pets, __i);
                break;
            }
        }
        refresh_ua_section("pets");
        self.func();
        global.force_pet_limits = true;
        sort_pets_by_prio();
    };
    
    click = function()
    {
        sort_pets_by_prio();
    };
    
    destroy = function()
    {
        if (self.instance != -1)
        {
            instance_destroy(self.instance);
        }
    };
    
    func = __void;
    
    _game_loop_second = function()
    {
        return self.game_loop_second();
    };
    
    game_loop_second = __void;
    
    get_name_suffix = function()
    {
        if (!self.is_active())
        {
            return "";
        }
        return sprintf(" (%s)", __("active"));
    };
    
    get_bonus_upgrade_attributes = function()
    {
        if (!self.is_upgrade_unlocked())
        {
            exit;
        }
        var level = self.get_upgrade_level();
        var upgrade_attributes = self.upgrade_attributes_upgrade;
        if (level >= 10)
        {
            upgrade_attributes.blower_enemy_damage_multiplier_blower = floor(level / 2) * (1 + get_upgrade_attribute_value(global.upgrade_attributes.pet_damage_upgrade));
        }
        else
        {
            upgrade_attributes.blower_enemy_damage_multiplier_blower = undefined;
        }
        return upgrade_attributes;
    };
    
    build_description = function()
    {
        if (!is_undefined(self.description_cache))
        {
            return self.description_cache;
        }
        var desc = get_value_ext(self, self.description);
        if (self.add_upgrade_description)
        {
            desc += ("\n" + format_upgrade_text(self.upgrade_attributes));
        }
        if (!is_undefined(self.offline_reward))
        {
            desc += ("\n" + __s("Has offline reward."));
        }
        self.description_cache = desc;
    };
    
    get_description = function()
    {
        if (get_value_ext(self, self.is_obfuscated))
        {
            return self.description_locked;
        }
        self.build_description();
        return self.description_cache;
    };
    
    get_max_upgrade_level = function()
    {
        return self.max_upgrade_level + get_upgrade_attribute_value(global.upgrade_attributes.pet_max_upgrade_level);
    };
    
    get_offline_reward = function(arg0 = 1)
    {
        if (is_undefined(self.offline_reward))
        {
            exit;
        }
        return self.offline_reward(arg0);
    };
    
    get_upgrade_attributes = function()
    {
        return self.upgrade_attributes;
    };
    
    is_active = function()
    {
        return self.data.active;
    };
    
    is_obfuscated = function()
    {
        return !get_value_ext(self, self.is_buyable);
    };
    
    is_pettable = function()
    {
        return o_game.data.stats.time_elapsed >= self.data.pet_delay;
    };
    
    is_upgrade_unlock_visible = function()
    {
        return self.data.count > 0;
    };
    
    petpet = function()
    {
        if (!self.is_pettable())
        {
            exit;
        }
        var count = get_default_struct_value(global.cache, "pet_auto_pet_count", 1);
        self.data.pet_count += count;
        self.data.pet_delay = o_game.data.stats.time_elapsed + self.pet_timeout;
        o_game.data.stats.pets_pet += count;
    };
    
    refresh_skin = function()
    {
        if (!self.data.active)
        {
            exit;
        }
        if (!instance_exists(self.instance))
        {
            exit;
        }
        var use_default_skin = true;
        if (is_string(self.data.skin))
        {
            var skin = variable_struct_get(global.shops.skins, self.data.skin);
            if (is_struct(skin))
            {
                use_default_skin = false;
                self.instance.sprite = skin.sprite;
                self.instance.sprite_walk = is_numeric(skin.sprite_walk) ? skin.sprite_walk : skin.sprite;
                self.instance.scale = get_default_struct_value(skin, "scale", 1);
                self.instance.scale_sign = get_default_struct_value(skin, "scale_sign", 1);
                self.instance.scale_sign_x = get_default_struct_value(skin, "scale_sign_x", 1);
                self.instance.scale_sign_y = get_default_struct_value(skin, "scale_sign_y", 1);
            }
        }
        if (use_default_skin)
        {
            self.instance.sprite = self.sprite;
            self.instance.sprite_walk = self.sprite_walk;
            self.instance.scale = self.scale;
            self.instance.scale_sign = self.scale_sign;
            self.instance.scale_sign_x = self.scale_sign_x;
            self.instance.scale_sign_y = self.scale_sign_y;
        }
        with (self.instance)
        {
            init();
        }
    };
    
    set_local_vars(arg0);
    _init();
}
