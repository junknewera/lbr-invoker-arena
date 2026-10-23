function Inventory_Item(arg0 = undefined) constructor
{
    bag = "inventory";
    can_generate = __return_true;
    chance = 1;
    inventory = undefined;
    key = "";
    max_count = 99;
    name = "";
    rarity = undefined;
    rarity_key = "";
    scrap_result = 
    {
        resources: 
        {
            water_crystal: 1
        }
    };
    sprite = spr_placeholder;
    type = undefined;
    type_key = "";
    ua_text = undefined;
    upgrade_attributes_cache = undefined;
    data = 
    {
        count: 0,
        id: "",
        locked: false,
        rarity_key: "",
        type_key: ""
    };
    
    init = function()
    {
        self.name = sprintf("%s %s", self.rarity.name, self.type.name);
        self.sprite = self.type.sprite;
    };
    
    add = function(arg0 = 1)
    {
        var add_count = max(0, min(self.get_max_count() - self.data.count, arg0));
        self.data.count += add_count;
        refresh_ua_section(self.inventory.ua_section);
        self.refresh_upgrade_attributes();
        self.inventory.refresh_upgrade_attributes();
        variable_struct_set(variable_struct_get(o_game.data, self.inventory.game_data_key).types_seen, self.type_key, true);
        return add_count;
    };
    
    after_salvage = function()
    {
        clear_selected_item(self.inventory.paging_id, self);
    };
    
    can_equip = function()
    {
        if (self.data.bag == "inventory")
        {
            return !self.inventory.is_backpack_full();
        }
        else if (self.data.bag == "backpack")
        {
            return !self.inventory.is_inventory_full();
        }
        return true;
    };
    
    can_salvage = function()
    {
        return !self.is_locked() && self.data.count >= 0;
    };
    
    equip = function()
    {
        if (self.data.bag == "inventory" && !self.inventory.is_backpack_full())
        {
            self.data.bag = "backpack";
            move_array_item(self, self.inventory.inventory, self.inventory.backpack);
        }
        else if (self.data.bag == "backpack" && !self.inventory.is_inventory_full())
        {
            self.data.bag = "inventory";
            move_array_item(self, self.inventory.backpack, self.inventory.inventory);
        }
        refresh_ua_section(self.inventory.ua_section);
        self.refresh_upgrade_attributes();
        self.inventory.refresh_upgrade_attributes();
    };
    
    get_bg_color = function()
    {
        return self.rarity.color;
    };
    
    get_info = function()
    {
        return self.name;
    };
    
    get_max_count = function()
    {
        return self.max_count;
    };
    
    get_name = function()
    {
        return self.name;
    };
    
    get_salvage_count = function()
    {
        var count = get_key_modifier_item(self, undefined, true, undefined, undefined, true);
        count = clamp(count, 1, self.data.count);
        return count;
    };
    
    get_salvage_result = function(arg0 = 1)
    {
        var multiplier = arg0 * round(power(2, self.rarity.level - 1));
        multiplier = max(1, multiplier);
        return multiply_struct_values(self.scrap_result, multiplier);
    };
    
    get_sort_value = function()
    {
        var value;
        switch (get_option(global.options.borbventures_inventory_sort_type))
        {
            case UnknownEnum.Value_1:
                value = (self.type.sort_order * 10000) + (1000 - self.rarity.level);
                break;
            default:
                value = ((1000 - self.rarity.level) * 10000) + self.type.sort_order;
                break;
        }
        return value;
    };
    
    get_sprite = function()
    {
        return self.sprite;
    };
    
    get_upgrade_attributes = function(arg0 = false)
    {
        if (!is_struct(self.upgrade_attributes_cache) || arg0)
        {
            self.refresh_upgrade_attributes();
        }
        return self.upgrade_attributes_cache;
    };
    
    is_locked = function()
    {
        return self.data.locked;
    };
    
    refresh_upgrade_attributes = function()
    {
        var multiplier = sqrt0(self.data.count, 1) * self.rarity.upgrade_multiplier;
        self.upgrade_attributes_cache = multiply_struct_values(self.type.upgrade_attributes, multiplier);
        self.ua_text = format_upgrade_text(self.upgrade_attributes_cache, undefined, undefined, undefined, "\n");
    };
    
    salvage = function(arg0 = 1)
    {
        if (self.data.count > 0)
        {
            add_result(self.get_salvage_result(arg0), undefined, undefined, true, true);
            notify(__s("%s %s salvaged.", arg0, self.get_name()));
            self.data.count -= arg0;
        }
        else
        {
            notify(__s("%s removed.", self.get_name()));
        }
        if (self.data.count <= 0)
        {
            self.inventory.remove_item(self);
        }
        self.refresh_upgrade_attributes();
        refresh_ua_section(self.inventory.ua_section);
        variable_struct_set(global.selected_inventory_item, self.inventory.paging_id, undefined);
        return self.data.count;
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
    
    set_rarity = function(arg0)
    {
        self.rarity = arg0;
        self.rarity_key = arg0.key;
        self.data.rarity_key = arg0.key;
    };
    
    set_type = function(arg0)
    {
        self.type = arg0;
        self.type_key = arg0.key;
        self.data.type_key = arg0.key;
    };
    
    set_local_vars(arg0);
}

enum UnknownEnum
{
    Value_1 = 1
}
