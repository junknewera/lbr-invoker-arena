function Inventory(arg0 = undefined) constructor
{
    backpack = [];
    backpack_map = {};
    backpack_size = 10;
    game_data_key = "";
    has_backpack = true;
    inventory = [];
    inventory_map = {};
    inventory_size = 10;
    item_types_array = [];
    item_types = {};
    items = {};
    items_rarity_array = {};
    paging_id = "";
    rarity_types = {};
    rarity_types_array = [];
    ua_id = "";
    ua_keys = 
    {
        backpack_size: "",
        inventory_size: ""
    };
    ua_section = "";
    upgrade_attributes_cache = undefined;
    data = 
    {
        backpack: {},
        inventory: {}
    };
    
    init = function()
    {
        self.paging_id = sprintf("%s_items", self.ua_section);
        self.ua_keys.backpack_size = sprintf("%s_backpack_size", self.ua_id);
        self.ua_keys.inventory_size = sprintf("%s_inventory_size", self.ua_id);
        init_rarities(self.rarity_types);
        self.rarity_types_array = struct_to_sorted_array_by(self.rarity_types, "level", true);
        add_keys_to_struct(self.item_types);
        self.item_types_array = struct_to_sorted_array_key(self.item_types);
        var __array = self.item_types_array;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            mitem.sort_order = __i;
        }
        __array = self.rarity_types_array;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            variable_struct_set(self.items_rarity_array, mitem.key, []);
            var __array2 = self.item_types_array;
            var __prop_len2 = array_length(__array2);
            for (var __i2 = 0; __i2 < __prop_len2; __i2++)
            {
                var mitem2 = __array2[__i2];
                var key = sprintf("%s_%s", mitem.key, mitem2.key);
                var item = new Inventory_Item();
                item.key = key;
                item.data.id = key;
                item.data.key = key;
                item.set_rarity(mitem);
                item.set_type(mitem2);
                item.init();
                variable_struct_set(self.items, key, item);
                array_push(variable_struct_get(self.items_rarity_array, mitem.key), item);
            }
        }
    };
    
    add_item = function(arg0, arg1 = 1, arg2 = undefined)
    {
        var add_count = 0;
        var existing_item = self.get_item(arg0.key);
        if (is_struct(existing_item))
        {
            add_count = existing_item.add(arg1);
        }
        else
        {
            arg0.inventory = self;
            if ((arg2 == undefined && array_length(self.inventory) < self.get_inventory_size()) || arg2 == "inventory")
            {
                array_push(self.inventory, arg0);
                variable_struct_set(self.inventory_map, arg0.key, arg0);
                add_count = arg0.add(arg1);
                arg0.data.bag = "inventory";
            }
            else if ((arg2 == undefined && self.has_backpack && array_length(self.backpack) < self.get_backpack_size()) || arg2 == "backpack")
            {
                array_push(self.backpack, arg0);
                variable_struct_set(self.backpack_map, arg0.key, arg0);
                add_count = arg0.add(arg1);
                arg0.data.bag = "backpack";
            }
        }
        var overflow_count = arg1 - add_count;
        if (overflow_count > 0)
        {
            var salvage_result = arg0.get_salvage_result(overflow_count);
            var pending_result = variable_struct_get(o_game.data, self.game_data_key).pending_inventory_result;
            add_struct_to_struct(pending_result, salvage_result);
        }
        refresh_ua_section(self.ua_section);
        return add_count;
    };
    
    add_random_item = function()
    {
        var item = self.get_random_item();
        if (!is_struct(item))
        {
            exit;
        }
        self.add_item(item);
        return item;
    };
    
    self.get_available_items = function(arg0)
    {
        var pool = variable_struct_get(self.items_rarity_array, arg0.key);
        if (!is_array(pool) || array_length(pool) == 0)
        {
            return [];
        }
        var pool_valid = array_filter(pool, function(arg0)
        {
            if (is_struct(struct_get_from_hash(arg0, variable_get_hash("type"))) && is_callable(struct_get_from_hash(arg0.type, variable_get_hash("can_generate"))))
            {
                return arg0.type.can_generate();
            }
            return true;
        });
        return pool_valid;
    };
    
    get_backpack_size = function()
    {
        return self.backpack_size + variable_struct_get(global.upgrade_attributes, self.ua_keys.backpack_size);
    };
    
    get_inventory_size = function()
    {
        return self.inventory_size + variable_struct_get(global.upgrade_attributes, self.ua_keys.inventory_size);
    };
    
    get_item = function(arg0)
    {
        if (is_struct(variable_struct_get(self.inventory_map, arg0)))
        {
            return variable_struct_get(self.inventory_map, arg0);
        }
        if (is_struct(variable_struct_get(self.backpack_map, arg0)))
        {
            return variable_struct_get(self.backpack_map, arg0);
        }
        return undefined;
    };
    
    get_random_item = function(arg0 = undefined, arg1 = 1)
    {
        var rarity = undefined;
        if (is_struct(arg0))
        {
            rarity = arg0;
        }
        else if (is_string(arg0) && is_struct(variable_struct_get(self.rarity_types, arg0)))
        {
            rarity = variable_struct_get(self.rarity_types, arg0);
        }
        else
        {
            rarity = self.get_random_rarity();
        }
        if (!is_struct(rarity))
        {
            rarity = self.rarity_types.common;
        }
        var available_items = self.get_available_items(rarity);
        var item;
        if (arg1 > 1)
        {
            item = array_random_items(available_items, arg1);
        }
        else
        {
            item = array_random_item(available_items);
        }
        return item;
    };
    
    get_random_items = function(arg0 = undefined, arg1 = 1)
    {
        var rarity = undefined;
        if (is_struct(arg0))
        {
            rarity = arg0;
        }
        else if (is_string(arg0) && is_struct(variable_struct_get(self.rarity_types, arg0)))
        {
            rarity = variable_struct_get(self.rarity_types, arg0);
        }
        else
        {
            rarity = self.get_random_rarity();
        }
        if (!is_struct(rarity))
        {
            rarity = self.rarity_types.common;
        }
        var available_items = self.get_available_items(rarity);
        var picks = array_random_items(available_items, arg1, false);
        if (!is_array(picks))
        {
            return {};
        }
        var items = {};
        var __array = picks;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            add_to_struct_value(items, mitem.key, 1);
        }
        return items;
    };
    
    get_random_rarity = function()
    {
        var rarity = array_random_chance_level(self.rarity_types_array);
        return rarity;
    };
    
    get_upgrade_attributes = function(arg0 = false)
    {
        if (!is_struct(self.upgrade_attributes_cache) || arg0)
        {
            self.refresh_upgrade_attributes();
        }
        return self.upgrade_attributes_cache;
    };
    
    is_backpack_full = function()
    {
        return array_length(self.backpack) >= self.get_backpack_size();
    };
    
    is_inventory_full = function()
    {
        return array_length(self.inventory) >= self.get_inventory_size();
    };
    
    is_item_unlocked = function(arg0)
    {
        if (!is_struct(arg0))
        {
            return false;
        }
        if (!is_struct(variable_struct_get(o_game.data, self.game_data_key)) || !is_struct(struct_get_from_hash(variable_struct_get(o_game.data, self.game_data_key), variable_get_hash("types_seen"))))
        {
            return false;
        }
        return !is_undefined(variable_struct_get(variable_struct_get(o_game.data, self.game_data_key).types_seen, arg0.key));
    };
    
    move_item = function(arg0, arg1 = true)
    {
        if (arg0.data.bag == "inventory" && (!arg1 || !self.is_backpack_full()))
        {
            move_array_item(arg0, self.inventory, self.backpack);
            arg0.data.bag = "backpack";
        }
        else if (arg0.data.bag == "backpack" && (!arg1 || !self.is_inventory_full()))
        {
            move_array_item(arg0, self.backpack, self.inventory);
            arg0.data.bag = "inventory";
        }
        refresh_ua_section(self.ua_section);
    };
    
    remove_item = function(arg0)
    {
        arg0.data.count = 0;
        remove_from_array_by_key(self.backpack, arg0.key);
        remove_from_array_by_key(self.inventory, arg0.key);
        variable_struct_remove(self.backpack_map, arg0.key);
        variable_struct_remove(self.inventory_map, arg0.key);
        self.refresh_upgrade_attributes();
    };
    
    refresh_upgrade_attributes = function()
    {
        self.upgrade_attributes_cache = {};
        var __array = self.inventory;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            var ua_item = mitem.get_upgrade_attributes();
            add_struct_to_struct(self.upgrade_attributes_cache, ua_item);
        }
    };
    
    swap = function(arg0, arg1)
    {
        swap_array_items(self.inventory, self.backpack, arg0, arg1);
        self.refresh_upgrade_attributes();
        refresh_ua_section(self.ua_section);
    };
    
    self.get_save_data = function()
    {
        var data = 
        {
            inventory: [],
            backpack: []
        };
        var __array = self.inventory;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            array_push(data.inventory, mitem.data);
        }
        __array = self.backpack;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            array_push(data.backpack, mitem.data);
        }
        return data;
    };
    
    load_data = function(arg0)
    {
        if (!is_struct(arg0))
        {
            exit;
        }
        if (is_array(struct_get_from_hash(arg0, variable_get_hash("inventory"))))
        {
            var __array = arg0.inventory;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                var item = variable_struct_get(self.items, mitem.key);
                if (!is_struct(item))
                {
                    continue;
                }
                self.add_item(item, mitem.count, "inventory");
            }
        }
        if (is_array(struct_get_from_hash(arg0, variable_get_hash("backpack"))))
        {
            var __array = arg0.backpack;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                var item = variable_struct_get(self.items, mitem.key);
                if (!is_struct(item))
                {
                    continue;
                }
                self.add_item(item, mitem.count, "backpack");
            }
        }
    };
    
    set_local_vars(arg0);
    self.init();
}
