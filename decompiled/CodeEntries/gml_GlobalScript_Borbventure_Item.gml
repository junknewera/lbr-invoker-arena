function Borbventure_Item(arg0 = undefined) : Collectable_Usable_Object(arg0) constructor
{
    name = "";
    description = "";
    key = "";
    sprite = spr_placeholder;
    data_defaults = 
    {
        auto_craft: false,
        collected: 0,
        count: 0,
        id: -1,
        locked: false,
        rarity_key: "common",
        type_key: undefined
    };
    bonus_text = "";
    can_ascend_text = "";
    count_overflow = true;
    description_cache_item_ascend_count = 0;
    game_item_type = UnknownEnum.Value_2;
    has_autouse = false;
    max_count = 10;
    is_usable = false;
    multiple_use = false;
    offline = false;
    rarity = undefined;
    rarity_key = "common";
    type = undefined;
    type_key = "";
    upgrade_attributes = {};
    use_delay = 1;
    winnable = false;
    
    init = function()
    {
        self.rarity = variable_struct_get(global.borbventures.borb_levels, self.rarity_key);
        self.type = variable_struct_get(global.borbventures.borbventure_items, self.type_key);
        self.is_usable = get_default_struct_value(self.type, "is_usable", false);
        self.name = self.type.name;
        self.data.rarity_key = self.rarity_key;
        self.data.type_key = self.type_key;
        self.data.unlocked = true;
        self.sprite = self.type.sprite;
        self.update_upgrade_attributes();
    };
    
    activate = function(arg0)
    {
        if (is_undefined(struct_get_from_hash(self.type, variable_get_hash("activate"))))
        {
            exit;
        }
        var result = self.type.activate(arg0, self);
        if (self.data.count == 0)
        {
            self.remove();
        }
        return result;
    };
    
    ascend = function()
    {
        var next_rarity = self.rarity.next_rarity;
        if (is_undefined(next_rarity))
        {
            exit;
        }
        dec_resources(self.get_ascend_cost());
        self.data.count -= self.get_next_ascend_count();
        var existing_item = global.borbventures.find_item(self.data.type_key, self.rarity.next_rarity.key);
        if (!is_undefined(existing_item))
        {
            existing_item.collect(1);
        }
        else
        {
            global.borbventures.add_item(self.data.type_key, 1, self.rarity.next_rarity, true);
        }
        self.update_upgrade_attributes();
    };
    
    build_description = function()
    {
        var desc_array = [sprintf("%s: %s", __("Rarity"), self.rarity.name)];
        if (self.is_usable)
        {
            array_push(desc_array, "");
            array_push(desc_array, get_value_ext(self, self.type.description));
        }
        else
        {
            if (!is_undefined(self.rarity.next_rarity))
            {
                array_push(desc_array, sprintf("%s: %s/%s", __("Required count for next ascension"), self.data.count, self.get_next_ascend_count()));
            }
            array_push(desc_array, "");
            array_push(desc_array, format_upgrade_text(self.upgrade_attributes, self.data.count, undefined, undefined, undefined, true));
        }
        self.description = concat(desc_array);
        self.description_cache_item_ascend_count = self.get_next_ascend_count();
    };
    
    can_activate = function(arg0)
    {
        if (is_undefined(struct_get_from_hash(self.type, variable_get_hash("can_activate"))))
        {
            return true;
        }
        return self.type.can_activate(arg0);
    };
    
    can_ascend = function()
    {
        if (self.data.count < self.get_next_ascend_count())
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
        if (!is_undefined(self.rarity.next_rarity))
        {
            var existing_item = global.borbventures.find_item(self.data.type_key, self.rarity.next_rarity.key);
            if (!is_undefined(existing_item))
            {
                if (!existing_item.can_craft_count(1))
                {
                    return false;
                }
                return true;
            }
            else if ((array_length(global.borbventures.items.inventory) + 1) > global.borbventures.get_inventory_size())
            {
                return false;
            }
        }
        return true;
    };
    
    can_craft = function(arg0 = 1)
    {
        if (self.is_usable)
        {
            return false;
        }
        if (!has_enough_resources(self.get_craft_resources(arg0)))
        {
            return false;
        }
        if (!self.can_craft_count(arg0))
        {
            return false;
        }
        return true;
    };
    
    can_craft_count = function(arg0 = 1)
    {
        return (self.data.count + arg0) <= self.get_max_count();
    };
    
    can_scrap = function(arg0 = 1)
    {
        if (self.data.locked)
        {
            return false;
        }
        return arg0 <= self.data.count && arg0 > 0;
    };
    
    collect_after = function()
    {
        self.build_description();
        variable_struct_set(o_game.data.borbventure_types_seen, self.type.key, true);
    };
    
    craft = function(arg0 = 1)
    {
        if (!self.can_craft(arg0))
        {
            exit;
        }
        dec_resources(self.get_craft_resources(arg0));
        self.collect(arg0);
    };
    
    create = function()
    {
        self.data.id = o_game.data.borbventure_item_id_counter;
        o_game.data.borbventure_item_id_counter++;
    };
    
    get_ascend_cost = function()
    {
        var cost;
        if (self.rarity.level <= 2)
        {
            cost = 
            {
                borb_rune: 25 + power(self.rarity.level - 1, 2.25)
            };
            cost.borb_rune *= self.get_rarity_cost_multiplier();
        }
        else
        {
            cost = 
            {
                borb_ascension_rune: 5 + power(self.rarity.level - 1, 1.5)
            };
            cost.borb_ascension_rune *= self.get_rarity_cost_multiplier();
        }
        struct_map(cost, rround);
        return cost;
    };
    
    get_bg_color = function()
    {
        return self.rarity.color;
    };
    
    get_craft_resources = function(arg0 = 1)
    {
        var multiply_value = self.get_rarity_cost_multiplier() * (1 + get_upgrade_attribute_value(global.upgrade_attributes.borbventure_craft_cost_multiplier));
        var cost = multiply_struct_values(global.costs.borbventure_craft_item_single, multiply_value, true, 1);
        cost = multiply_struct_values(cost, arg0, true, 1);
        return cost;
    };
    
    get_info = function()
    {
        return self.get_name();
    };
    
    get_max_count = function()
    {
        var count = floor(self.max_count + get_upgrade_attribute_value(global.upgrade_attributes.borbventure_items_max_count));
        return count;
    };
    
    get_name = function(arg0 = true)
    {
        var _name = get_value_ext(self, self.name);
        var name_final;
        if (arg0)
        {
            name_final = sprintf("[%s/%s] %s %s", number_format(self.data.count), number_format(self.get_max_count()), self.rarity.name, _name);
        }
        else
        {
            name_final = sprintf("%s %s", self.rarity.name, _name);
        }
        return name_final;
    };
    
    get_next_ascend_count = function()
    {
        var value = 10 + ((self.rarity.level - 1) * 2);
        value += get_upgrade_attribute_value(global.upgrade_attributes.borbventure_items_ascend_count);
        value = max(1, rround(value));
        return value;
    };
    
    get_rarity_cost_multiplier = function()
    {
        return 1 + ((self.rarity.level - 1) / 4);
    };
    
    get_rarity_multiplier = function()
    {
        return self.rarity.upgrade_multiplier;
    };
    
    get_scrap_resources = function(arg0 = 1)
    {
        return global.borbventures.get_scrap_resources(arg0, self.rarity);
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
        return self.sprite;
    };
    
    remove = function()
    {
        remove_item_from_array_by_id(global.borbventures.items.inventory, self.data.id);
        global.selected_inventory_item.borbventure_items = undefined;
    };
    
    scrap = function(arg0 = 1)
    {
        if (self.data.count == 0)
        {
            exit;
        }
        self.data.count -= arg0;
        var scrap_res = self.get_scrap_resources(arg0);
        add_resources(scrap_res);
        self.update_upgrade_attributes();
        if (self.data.count == 0)
        {
            global.selected_inventory_item.borbventure_items = undefined;
            remove_item_from_array_by_id(global.borbventures.items.inventory, self.data.id);
        }
    };
    
    update_upgrade_attributes = function()
    {
        if (!self.is_usable)
        {
            self.upgrade_attributes = multiply_struct_values(self.type.upgrade_attributes, self.get_rarity_multiplier());
        }
        self.build_description();
    };
    
    get_description = function()
    {
        if (self.description_cache_item_ascend_count != self.get_next_ascend_count())
        {
            self.build_description();
        }
        return self.description;
    };
    
    set_local_vars(arg0);
    _init();
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_2
}
