function Card(arg0) : Collectable_Usable_Object(arg0) constructor
{
    name = "";
    name_full = "";
    name_plural = "";
    description = "";
    enemy = undefined;
    has_enemy = false;
    index = 0;
    key = "";
    last_transcension_count = 0;
    last_transcension_count_pack = 0;
    rarity_index = 0;
    sprite = spr_placeholder;
    transcend_resources = 
    {
        transcension_card_parts: 1
    };
    type = undefined;
    upgrade_attributes = {};
    data_defaults = 
    {
        collected: 0,
        count: 0,
        level: 0,
        locked: false,
        lockedaa: false,
        transcended: 0,
        unlocked: false
    };
    
    init = function()
    {
        if (!is_struct(self.enemy))
        {
            return log("Invalid Card", self.key);
        }
        self.name_full = sprintf("%s %s", self.type.name, self.name);
        self.rarity_index = self.type.level;
        self.has_enemy = is_struct(self.enemy);
    };
    
    ascend = function()
    {
        var next_card = self.get_next_card();
        if (is_undefined(next_card))
        {
            return log("Invalid next rarity type", self.key, next_key);
        }
        self.data.count -= global.game_settings.cards_min_ascend_count;
        dec_resources(self.get_ascend_cost());
        next_card.collect();
    };
    
    can_ascend = function()
    {
        var ascend_cost = self.get_ascend_cost();
        if (is_undefined(self.type.next_rarity_type))
        {
            return false;
        }
        if (!has_enough_resources(ascend_cost))
        {
            return false;
        }
        if (self.data.count < global.game_settings.cards_min_ascend_count)
        {
            return false;
        }
        var next_card = self.get_next_card();
        if (is_undefined(next_card))
        {
            return false;
        }
        if (next_card.data.count >= next_card.max_count())
        {
            return false;
        }
        return true;
    };
    
    can_auto_ascend = function()
    {
        if (self.data.lockedaa)
        {
            return false;
        }
        if (!self.can_ascend())
        {
            return false;
        }
        return true;
    };
    
    can_collect_count = function()
    {
        return self.data.count < self.max_count();
    };
    
    can_transcend = function(arg0 = false)
    {
        var count = self.get_transcend_cards_count();
        if (self.data.count < count)
        {
            return false;
        }
        if (arg0)
        {
            return true;
        }
        if (self.data.locked)
        {
            return false;
        }
        if (!get_option(global.options.enable_salvage_cards))
        {
            return false;
        }
        return true;
    };
    
    can_salvage = function(arg0 = 1)
    {
        if (self.data.count < arg0)
        {
            return false;
        }
        if (!get_option(global.options.enable_salvage_cards))
        {
            return false;
        }
        return true;
    };
    
    collect_before = function(arg0 = 1, arg1 = undefined)
    {
        var compensate = global.is_season_salvage;
        if (is_struct(arg1) && !is_undefined(struct_get_from_hash(arg1, variable_get_hash("compensate"))))
        {
            compensate = arg1.compensate;
        }
        if (compensate)
        {
            var diff = (self.data.count + arg0) - self.max_count();
            if (diff > 0)
            {
                var res = self.get_salvage_resources(diff);
                add_result(res, undefined, undefined, true, true);
            }
        }
    };
    
    get_ascend_cost = function()
    {
        var ascend_cost = 
        {
            card_parts: global.game_settings.cards_ascend_cost_base + (global.game_settings.cards_ascend_cost_multiplier_base * power(global.game_settings.cards_ascend_cost_multiplier, self.type.level))
        };
        if (self.type.level >= global.cards_types.epic.level)
        {
            ascend_cost.ascension_shards = power(self.type.level - 3, 2);
        }
        return ascend_cost;
    };
    
    get_blend_color = function()
    {
        return self.enemy.blend_color;
    };
    
    get_next_card = function()
    {
        var next_key = sprintf("%s_%s", self.type.next_rarity_type.key, self.enemy.key);
        var next_card = variable_struct_get(global.cards, next_key);
        return next_card;
    };
    
    get_previous_card = function()
    {
        if (is_undefined(self.type.previous_rarity_type))
        {
            exit;
        }
        var previous_key = sprintf("%s_%s", self.type.previous_rarity_type.key, self.enemy.key);
        var previous_card = variable_struct_get(global.cards, previous_key);
        return previous_card;
    };
    
    get_previous_rarity_type_collectable = function()
    {
        if (self.can_collect_count())
        {
            return self;
        }
        var previous_card = self.get_previous_card();
        if (is_struct(previous_card))
        {
            return previous_card.get_previous_rarity_type_collectable();
        }
        return undefined;
    };
    
    get_salvage_resources = function(arg0 = 1)
    {
        var resources = {};
        resources.card_parts = 5 + (5 * power(global.game_settings.cards_ascend_cost_multiplier, self.type.level - 1));
        if (self.enemy.is_boss && !self.enemy.tower)
        {
            resources.card_parts *= 1.5;
        }
        resources.card_parts = floor(resources.card_parts);
        resources.card_parts *= arg0;
        return resources;
    };
    
    collect_after = function()
    {
        global.upgrade_sections_cache_refresh.cards = true;
    };
    
    get_upgrade_attributes = function()
    {
        if (!self.data.unlocked)
        {
            return undefined;
        }
        var diminishing_count_start = 5000;
        var upgrade_value = self.data.count;
        if (self.data.count >= diminishing_count_start)
        {
            upgrade_value = 70.71 * sqrt(self.data.count);
        }
        var boss_multiplier = self.enemy.is_boss ? global.game_settings.cards_boss_multiplier : 1;
        boss_multiplier *= (1 + self.enemy.card_level);
        var type_multiplier = power(global.game_settings.cards_type_multiplier, self.type.level - 1);
        self.upgrade_attributes.leaf_multiplier = upgrade_value * global.game_settings.cards_leaf_multiplier * boss_multiplier * type_multiplier;
        if (self.enemy.is_boss)
        {
            self.upgrade_attributes.cards_boss_drop_chance = global.game_settings.cards_boss_drop_chance_upgrade;
        }
        if (self.type.level >= global.cards_types.uncommon.level)
        {
            self.upgrade_attributes.enemy_drop_multiplier_cards = upgrade_value * global.game_settings.cards_enemy_drop_multiplier * boss_multiplier * type_multiplier;
        }
        if (self.type.level >= global.cards_types.rare.level)
        {
            self.upgrade_attributes.blower_enemy_damage_multiplier_cards = upgrade_value * global.game_settings.cards_damage_multiplier * boss_multiplier * type_multiplier;
        }
        if (self.type.level >= global.cards_types.epic.level)
        {
            self.upgrade_attributes.slap_multiplier_cards = upgrade_value * global.game_settings.cards_slap_multiplier * boss_multiplier * type_multiplier;
        }
        if (is_struct(self.enemy.card_upgrades))
        {
            var __struct = self.enemy.card_upgrades;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                if (is_struct(self.enemy.card_upgrades_min_type) && self.type.level < self.enemy.card_upgrades_min_type.level)
                {
                    continue;
                }
                if (is_array(self.enemy.card_upgrades_check) && !is_unlocked_array(self.enemy.card_upgrades_check))
                {
                    continue;
                }
                if (is_struct(mitem))
                {
                    variable_struct_set(self.upgrade_attributes, mkey, {});
                    var __struct2 = mitem;
                    var __prop_names2 = struct_get_names(__struct2);
                    var __prop_len2 = array_length(__prop_names2);
                    for (var __i2 = 0; __i2 < __prop_len2; __i2++)
                    {
                        var mkey2 = __prop_names2[__i2];
                        var mitem2 = variable_struct_get(__struct2, mkey2);
                        variable_struct_set(variable_struct_get(self.upgrade_attributes, mkey), mkey2, upgrade_value * mitem2 * boss_multiplier * type_multiplier);
                    }
                }
                else
                {
                    variable_struct_set(self.upgrade_attributes, mkey, upgrade_value * mitem * boss_multiplier * type_multiplier);
                }
            }
        }
        return self.upgrade_attributes;
    };
    
    get_tooltip = function()
    {
        return "";
    };
    
    get_header_text = function()
    {
        var text = sprintf("%s\n%s", self.type.name, self.get_name());
        return text;
    };
    
    get_name = function()
    {
        if (!self.is_unlocked())
        {
            return "?";
        }
        return get_value_ext(self, self.name, false);
    };
    
    get_description = function()
    {
        var desc = get_value_ext(self, self.description, false);
        if (is_array(self.enemy.card_upgrades_check))
        {
            var unlock_description = get_unlock_description(self.enemy.card_upgrades_check, true);
            if (!is_empty(unlock_description))
            {
                desc += "\n";
                desc += (__("Locked upgrades") + ":");
                desc += "\n";
                desc += unlock_description;
                desc += "\n";
            }
        }
        if (self.has_enemy && !self.enemy.has_special_damage)
        {
            desc += "\n";
            var add_damage = self.data.count * global.game_settings.cards_enemy_damage;
            var add_damage_total = apply_enemy_cards_damage(1, self.enemy) - 1;
            desc += __s("Additional enemy damage (this tier): %s", number_format_percent(add_damage));
            desc += "\n";
            desc += __s("Additional enemy damage (all tiers): %s", number_format_percent(add_damage_total));
        }
        desc += "\n\n";
        var spawn_areas_text = [];
        var __array = enemy.spawn_areas;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            var area = variable_struct_get(global.areas, mitem);
            if (is_undefined(area))
            {
                continue;
            }
            if (call_method(area, area.is_obfuscated))
            {
                array_push(spawn_areas_text, "?");
            }
            else
            {
                array_push(spawn_areas_text, area.name);
            }
        }
        desc += __s("Spawn areas: %s", implode(", ", spawn_areas_text));
        if (is_struct(self.enemy.galaxy))
        {
            desc += ("\n" + __s("Galaxy: %s", self.enemy.galaxy.name));
        }
        return desc;
    };
    
    get_full_description = function(arg0 = false)
    {
        var text = "";
        if (arg0)
        {
            text += (self.name_full + "\n" + "\n");
        }
        text += format_upgrade_text(self.get_upgrade_attributes(), undefined, undefined, undefined, "\n");
        var card_description = self.get_description();
        if (!is_empty(card_description))
        {
            text += "\n\n";
            text += card_description;
        }
        return text;
    };
    
    is_obfuscated = function()
    {
        return false;
    };
    
    max_count = function()
    {
        var count = get_cards_max_count(self.type.key);
        return count;
    };
    
    salvage = function(arg0 = 1)
    {
        if (!self.can_salvage(arg0))
        {
            return false;
        }
        var salvage_resources = self.get_salvage_resources(arg0);
        self.data.count -= arg0;
        add_resources(salvage_resources);
        notify(__s("%s %s %s salvaged for %s.", arg0, self.name_full, pluralize(arg0, __("was"), __("were")), format_resources_text(salvage_resources)));
        return true;
    };
    
    spawn = function(arg0 = undefined, arg1 = undefined)
    {
        arg0 = is_undefined(arg0) ? random_range(120, room_width - 120) : arg0;
        arg1 = is_undefined(arg1) ? random_range(120, room_height - 120) : arg1;
        var o = instance_create_layer(arg0, arg1, global.layers.leaves, o_card);
        o.item = self;
        o.sprite_index = self.sprite;
        with (o)
        {
            init();
        }
        return o;
    };
    
    get_max_transcend_count = function(arg0 = 0)
    {
        var cards_count = self.data.count + arg0;
        var transcend_count_max = 0;
        var transcend_cards_count_sum = 0;
        for (var i = 0; i < 500; i++)
        {
            var next_transcension_count = self.get_transcend_cards_count(self.data.transcended + i);
            var transcend_cards_count_sum_next = transcend_cards_count_sum + next_transcension_count;
            if (cards_count < transcend_cards_count_sum_next)
            {
                break;
            }
            transcend_cards_count_sum += next_transcension_count;
            transcend_count_max++;
        }
        return transcend_count_max;
    };
    
    get_transcend_cards_count = function(arg0 = self.data.transcended)
    {
        var base_value = global.game_settings.cards_transcension_count + arg0;
        var value = base_value - global.upgrade_attributes.cards_decrease_transcension_count;
        value *= (1 - global.upgrade_attributes.cards_decrease_transcension_count_multiplier);
        value = max(1, rround(value));
        return value;
    };
    
    get_transcend_card_parts_count = function(arg0 = 1)
    {
        var base_value = 1 + get_upgrade_attribute_value(global.upgrade_attributes.cards_transcension_card_parts_count);
        var value = base_value + (base_value * power(self.type.level - 1, global.game_settings.cards_transcension_resources_level_multiplier));
        if (self.enemy.is_boss && !self.enemy.tower)
        {
            value *= 3;
        }
        value = floor(value) * arg0;
        return value;
    };
    
    get_transcend_resources = function(arg0 = 1)
    {
        self.transcend_resources.transcension_card_parts = self.get_transcend_card_parts_count(arg0);
        return self.transcend_resources;
    };
    
    transcend = function(arg0 = 1, arg1 = false)
    {
        var res_add = {};
        var transcend_count = 0;
        repeat (arg0)
        {
            var count = self.get_transcend_cards_count();
            self.data.count -= count;
            self.data.transcended++;
            add_struct_to_struct(res_add, self.get_transcend_resources());
            transcend_count++;
        }
        add_to_struct_value(o_game.data.stats.cards_transcensions, self.type.key, transcend_count);
        add_resources(res_add, undefined, undefined, undefined, undefined, true);
        self.last_transcension_count = transcend_count;
        if (arg1)
        {
            self.last_transcension_count_pack = transcend_count;
        }
        return transcend_count > 0;
    };
    
    set_local_vars(arg0);
    set_sprite_data(self);
    _init();
}
