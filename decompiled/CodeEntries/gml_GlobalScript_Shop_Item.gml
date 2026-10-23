function Shop_Item(arg0, arg1) : Game_Object(arg0, arg1) constructor
{
    key = arg0;
    name = __("Shop Item");
    description = "";
    sprite = spr_placeholder;
    sprite_image_index = 0;
    sprite_seed = spr_placeholder;
    can_buy_max = true;
    consumable = false;
    cost = {};
    cost_cache_current = undefined;
    cost_cache_current_count = -1;
    cost_cache_highest = 0;
    cost_cache_reduced_price = -1;
    cost_cache_reduced_price_ua_count = -1;
    cost_exp = 1.5;
    cost_qty_count = -1;
    cost_qty_1 = -1;
    cost_qty_5 = -1;
    cost_qty_10 = -1;
    cost_qty_25 = -1;
    cost_qty_100 = -1;
    cost_qty_array = [];
    cost_qty_buy_max = -1;
    cost_qty_map = {};
    cost_qty_max = -1;
    cost_qty_tmp_count = 0;
    cost_resource_key = "";
    data = {};
    data_start = 
    {
        auto_upgrade_enabled: false,
        auto_upgrade_prio_user: 1,
        collected: 0,
        count: 0,
        inventory: 0,
        max_buy_user: -1,
        slider_value: 0,
        toggle: false,
        upgrade_level: 0
    };
    dlc_id = "";
    func = false;
    has_auto_upgrade = false;
    is_autobuyer = false;
    is_buyable = true;
    is_dlc = false;
    is_free = false;
    is_gem_upgrade = false;
    is_obfuscated = false;
    is_skin = false;
    is_slider = false;
    is_static = false;
    is_toggle = false;
    is_upgradable = false;
    is_usable = false;
    is_visible = true;
    max_count = 1;
    maxed = false;
    add_to_inventory = false;
    auto_upgrade = "";
    auto_upgrade_check = __return_true;
    auto_upgrade_parent = [];
    auto_upgrade_shop = "";
    auto_upgrade_item_cache = false;
    auto_upgrade_sorted_items_cache = undefined;
    auto_upgrade_prio = 0;
    can_buy = false;
    has_upgrade_attributes = false;
    options = [];
    prestige_level = 0;
    qty_set = [1, 5, 10, 25, 100];
    resources = [];
    resources_sorted = [];
    result = undefined;
    section = undefined;
    section_key = "general";
    shop = undefined;
    shop_key = "";
    slider_prefix = "";
    slider_affix = "";
    slider_format_number = false;
    slider_format_number_dec = 2;
    slider_min = 0;
    slider_max = 100;
    slider_step = 1;
    supporters_only = false;
    supporters_tier = UnknownEnum.Value_0;
    tag = global.shop_item_tags.unknown;
    upgrade_attributes = undefined;
    upgrade_attributes_apply_early = false;
    value = 0;
    
    _init = function()
    {
        self.is_gem_upgrade = self.key == "gems";
        if (!is_undefined(self.upgrade_attributes))
        {
            self.has_upgrade_attributes = true;
        }
        if (self.supporters_tier != UnknownEnum.Value_0)
        {
            self.is_buyable = false;
        }
        struct_apply_defaults(self.data, self.data_start, true);
        set_sprite_data(self);
        self.cost_resource_key = get_first_key_from_struct(self.cost);
    };
    
    init = __void;
    
    add = function(arg0 = 1)
    {
        self.data.count += arg0;
        self.data.collected += arg0;
        if (self.add_to_inventory)
        {
            self.data.inventory += arg0;
        }
        if (is_struct(self.result))
        {
            add_result_lite(self.result, arg0);
        }
    };
    
    clear_cache = function()
    {
        self.auto_upgrade_sorted_items_cache = undefined;
        self.cost_cache_highest = 0;
        self.refresh_parents();
    };
    
    get_cost_value = function(arg0, arg1 = 1, arg2 = _item.data.count, arg3 = false)
    {
        if (arg3)
        {
            return calculate_item_cost(self, arg0, arg1, arg2);
        }
        if (arg2 == self.cost_qty_count)
        {
            if (arg1 == 1)
            {
                return self.cost_qty_1;
            }
            if (arg1 == 5)
            {
                return self.cost_qty_5;
            }
            if (arg1 == 10)
            {
                return self.cost_qty_10;
            }
            if (arg1 == 25)
            {
                return self.cost_qty_25;
            }
            if (arg1 == 100)
            {
                return self.cost_qty_100;
            }
            if (arg1 == self.cost_qty_tmp_count)
            {
                return self.cost_qty_tmp;
            }
        }
        self.cost_qty_count = get_upgrade_count(self);
        self.cost_qty_buy_max = calculate_max_item_buy_count(self, arg0);
        self.cost_qty_max = calculate_max_item_cost(self, arg0);
        var qty = [1, 5, 10, 25, 100];
        self.cost_qty_array = [];
        self.cost_qty_map = {};
        var __array = qty;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            var key = "cost_qty_" + string(qty);
            var cost = calculate_item_cost(self, arg0, mitem, arg2);
            variable_struct_set(self, key, cost);
            variable_struct_set(self.cost_qty_map, mitem, cost);
            array_push(self.cost_qty_array, 
            {
                qty: mitem,
                cost: cost
            });
        }
        self.cost_qty_tmp = calculate_item_cost(self, arg0, arg1);
        self.cost_qty_tmp_count = arg1;
        if (arg1 == 1)
        {
            return self.cost_qty_1;
        }
        if (arg1 == 5)
        {
            return self.cost_qty_5;
        }
        if (arg1 == 10)
        {
            return self.cost_qty_10;
        }
        if (arg1 == 25)
        {
            return self.cost_qty_25;
        }
        if (arg1 == 100)
        {
            return self.cost_qty_100;
        }
        return self.cost_qty_tmp;
    };
    
    get_max_buy_count = function()
    {
    };
    
    get_max_count = function()
    {
        return self.max_count;
    };
    
    get_upgrade_attributes = undefined;
    
    refresh_cache = function()
    {
        if (!self.has_upgrade_attributes)
        {
            exit;
        }
        if (is_callable(self.upgrade_attributes))
        {
            self.upgrade_attributes_cache = self.upgrade_attributes();
        }
        else
        {
            self.upgrade_attributes_cache = self.upgrade_attributes;
        }
    };
    
    refresh_cost = function(arg0 = self.data.count)
    {
        self.cost_qty_count = -1;
    };
    
    refresh_parents = function()
    {
        var __array = self.auto_upgrade_parent;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            mitem.clear_cache();
        }
    };
    
    sort_items = function()
    {
        self.auto_upgrade_sorted_items_cache = sort_shop_items_by_user(self.auto_upgrade_item_cache);
    };
    
    set_local_vars(arg1);
}

enum UnknownEnum
{
    Value_0
}
