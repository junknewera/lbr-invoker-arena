function Mine_Item(arg0 = undefined) : Collectable_Usable_Object(arg0 == undefined) constructor
{
    name = "";
    description = "";
    key = "";
    sprite = spr_placeholder;
    data_defaults = 
    {
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
    game_item_type = UnknownEnum.Value_8;
    has_autouse = false;
    max_count = 10;
    is_usable = false;
    multiple_use = false;
    offline = false;
    paging_id = "mine_items";
    rarity = undefined;
    rarity_key = "common";
    type = undefined;
    type_key = "";
    upgrade_attributes = {};
    use_delay = 1;
    winnable = false;
    
    init = function()
    {
        self.rarity = variable_struct_get(global.mine_rarity, self.rarity_key);
        self.type = variable_struct_get(global.mine_items, self.type_key);
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
        self.type.activate(arg0, self);
        if (self.data.count == 0)
        {
            self.remove();
        }
    };
    
    add = function(arg0 = 1)
    {
        self.data.count += arg0;
        self.data.count = clamp(self.data.count, 0, self.get_max_count());
        self.update_upgrade_attributes();
    };
    
    after_salvage = function()
    {
        clear_selected_item(self.paging_id, self);
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
        var existing_item = get_mine_inventory_item(self.data.type_key, self.rarity.next_rarity.key);
        if (!is_undefined(existing_item))
        {
            existing_item.collect(1);
        }
        else
        {
            add_mine_inventory_item(self.data.type_key, self.rarity.next_rarity, 1);
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
        if (self.rarity.key == global.mine_rarity.legendary.key)
        {
            return false;
        }
        if (!has_enough_resources(self.get_ascend_cost()))
        {
            return false;
        }
        if (!is_undefined(self.rarity.next_rarity))
        {
            var existing_item = get_mine_inventory_item(self.data.type_key, self.rarity.next_rarity.key);
            if (!is_undefined(existing_item))
            {
                if (!existing_item.can_craft_count(1))
                {
                    return false;
                }
                return true;
            }
            else if ((array_length(global.mine_inventory) + 1) > get_mines_inventory_size())
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
        self.data.count = min(self.data.count, self.get_max_count());
        self.build_description();
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
    
    get_ascend_cost = function()
    {
        var cost = 
        {
            diamond_shiny: 5 + power(self.rarity.level - 1, 1.5)
        };
        cost.diamond_shiny *= self.get_rarity_cost_multiplier();
        cost.diamond_shiny = rround(cost.diamond_shiny);
        return cost;
    };
    
    get_bg_color = function()
    {
        return self.rarity.color;
    };
    
    get_craft_resources = function(arg0 = 1)
    {
        var multiply_value = self.get_rarity_cost_multiplier();
        var base_cost = global.costs.mines_craft_item_single;
        if (self.rarity.level >= 4)
        {
            base_cost = global.costs.mines_craft_item_single_t2;
        }
        var cost = multiply_struct_values(base_cost, multiply_value, true, 1);
        cost = multiply_struct_values(cost, arg0, true, 1);
        return cost;
    };
    
    get_info = function()
    {
        return self.get_name();
    };
    
    get_max_count = function()
    {
        var count = floor(self.max_count + get_upgrade_attribute_value(global.upgrade_attributes.mines_items_max_count));
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
        var value = 10 + ((self.rarity.level - 1) * 10);
        value = max(1, round(value));
        return value;
    };
    
    get_rarity_cost_multiplier = function()
    {
        if (self.rarity.level <= 3)
        {
            return 1 + ((self.rarity.level - 1) / 4);
        }
        else
        {
            return 1 + (self.rarity.level - 3);
        }
    };
    
    get_salvage_count = function()
    {
        var count = get_key_modifier_item(self, undefined, true, undefined, undefined, true);
        count = clamp(count, 1, self.data.count);
        return count;
    };
    
    get_scrap_resources = function(arg0 = 1)
    {
        var res = {};
        if (self.rarity.level <= 3)
        {
            var value = arg0 * (1 + ((self.rarity.level - 1) * 2));
            res.diamond_coal = rround(value);
        }
        else
        {
            var value = arg0 * (1 + ((self.rarity.level - 3) * 1));
            res.diamond_shiny = rround(value);
        }
        return res;
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
        remove_item_from_array_by_id(global.mine_inventory, self.data.id);
        global.selected_inventory_item.mine_items = undefined;
    };
    
    salvage = function(arg0 = 1)
    {
        return self.scrap(arg0);
    };
    
    salvage_confirm = function(arg0 = 1)
    {
        global.selected_inventory_item.inventory_item_count = arg0;
        global.selected_inventory_item.inventory_item = self;
        confirm_dialog_current_nav(__s("Do you want to salvage %s %s?", arg0, self.get_name()), function()
        {
            if (!is_struct(global.selected_inventory_item.inventory_item))
            {
                exit;
            }
            global.selected_inventory_item.inventory_item.salvage(global.selected_inventory_item.inventory_item_count);
        });
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
            global.selected_inventory_item.mine_items = undefined;
            remove_item_from_array_by_id(global.mine_inventory, self.data.id);
        }
    };
    
    set_id = function()
    {
        self.data.id = ++o_game.data.mines.item_id_counter;
    };
    
    update_upgrade_attributes = function()
    {
        if (!self.is_usable)
        {
            var upgrade_multiplier = self.rarity.upgrade_multiplier;
            upgrade_multiplier *= (1 + (sqrt(o_game.data.mines.drill_depth) / 5000));
            self.upgrade_attributes = multiply_struct_values(self.type.upgrade_attributes, upgrade_multiplier);
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
    Value_8 = 8
}
