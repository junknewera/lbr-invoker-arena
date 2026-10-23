function Harbor_Ship(arg0 = undefined) : Savable_Object(arg0) constructor
{
    index = 0;
    name = __("Ship");
    sprite = spr_icon_ship;
    data = 
    {
        embarkments: 0,
        embark_route: undefined,
        routes: [],
        route_index: -1,
        status: UnknownEnum.Value_0,
        time_end: 0
    };
    current_route = undefined;
    last_reward = undefined;
    min_travel_count = 100;
    route = undefined;
    route_type_keys = [];
    
    init = function()
    {
        if (array_length(self.data.routes) == 0)
        {
            self.generate_routes();
        }
    };
    
    can_assign = function()
    {
        if (self.data.status != UnknownEnum.Value_0)
        {
            return false;
        }
        return true;
    };
    
    can_cancel = function()
    {
        return self.data.status == UnknownEnum.Value_1;
    };
    
    can_claim = function()
    {
        return (self.data.status == UnknownEnum.Value_1 || self.data.status == UnknownEnum.Value_2) && o_game.data.stats.time_elapsed >= self.data.time_end;
    };
    
    can_embark = function()
    {
        if (self.data.status != UnknownEnum.Value_0)
        {
            return false;
        }
        var selected_route = self.get_selected_route();
        if (!is_struct(selected_route))
        {
            return false;
        }
        if (!has_enough(selected_route.fuel))
        {
            return false;
        }
        return true;
    };
    
    check = function()
    {
        if (self.data.status == UnknownEnum.Value_1 && o_game.data.stats.time_elapsed >= self.data.time_end)
        {
            self.data.status = UnknownEnum.Value_2;
        }
    };
    
    claim = function()
    {
        if (!is_struct(self.current_route))
        {
            self.reset();
            exit;
        }
        if (percent_chance(self.current_route.item_chance * 100))
        {
            var item = global.harbor_inventory.get_random_item();
            if (is_struct(item))
            {
                var harbor_items = get_default_struct_value(self.current_route.reward, "harbor_items", {});
                add_to_struct_value(harbor_items, get_default_struct_value(item, "key", ""), 1);
                self.current_route.reward.harbor_items = harbor_items;
            }
        }
        self.last_reward = self.current_route.reward;
        add_to_struct_value(o_game.data.harbor, "shipments_completed", 1);
        add_result_lite(self.current_route.reward);
        self.reset();
        struct_remove(global.harbor_ships_delivery, self.index);
    };
    
    embark = function()
    {
        var selected_route = self.get_selected_route();
        dec_result(selected_route.fuel);
        self.current_route = selected_route;
        self.data.route_index = selected_route.index;
        self.data.status = UnknownEnum.Value_1;
        self.data.time_end = o_game.data.stats.time_elapsed + selected_route.duration;
        self.data.embarkments += 1;
        variable_struct_set(global.harbor_ships_delivery, self.index, self);
    };
    
    generate_reward = function(arg0 = undefined)
    {
        var reward = 
        {
            resources: 
            {
                water_crystal: irandom_range(10, 20)
            },
            harbor_items: {},
            journey_xp: {}
        };
        var reward_multiplier = 1 + global.upgrade_attributes.harbor_ship_reward_multiplier;
        if (is_struct(arg0))
        {
            reward_multiplier *= (1 + get_default_struct_value(get_default_struct_value(arg0, "upgrade_attributes", {}), "harbor_ship_reward_multiplier", 0));
        }
        if (reward_multiplier != 1)
        {
            reward = multiply_struct_values(reward, reward_multiplier, true, 1);
        }
        var xp = self.get_xp_reward();
        if (is_struct(arg0))
        {
            xp *= (1 + get_default_struct_value(arg0, "xp_multiplier", 0));
        }
        reward.journey_xp.harbor = xp;
        return reward;
    };
    
    add_route = function(arg0)
    {
        arg0.index = array_length(self.data.routes);
        array_push(self.data.routes, arg0);
        array_push(self.route_type_keys, arg0.type_key);
    };
    
    generate_routes = function()
    {
        self.data.routes = [];
        self.route_type_keys = [];
        var route_count = 3;
        for (var i = 0; i < route_count; i++)
        {
            self.add_route(self.generate_route());
        }
    };
    
    generate_route = function()
    {
        var item_chance_min = 0.01;
        var item_chance_max = 0.5;
        var type = array_random_chance_level(global.harbor_route_types_array_sorted, undefined, undefined, undefined, undefined, self.route_type_keys);
        if (!is_struct(type))
        {
            type = global.harbor_route_types.regular;
        }
        var route = 
        {
            duration: self.get_travel_duration(type),
            fuel: self.generate_ship_fuel(type),
            item_chance: random_range(item_chance_min, item_chance_max),
            reward: self.generate_reward(type),
            type_key: type.key
        };
        return route;
    };
    
    generate_ship_fuel = function(arg0 = undefined)
    {
        var result = 
        {
            resources: 
            {
                ship_fuel: 5
            }
        };
        if (is_struct(arg0))
        {
            result.resources.ship_fuel *= get_default_struct_value(arg0, "fuel_multiplier", 1);
        }
        result.resources.ship_fuel *= 1 - global.upgrade_attributes.harbor_ship_fuel_efficiency;
        result.resources.ship_fuel = max(1, round(result.resources.ship_fuel));
        return result;
    };
    
    get_max_count = function()
    {
        return 100;
    };
    
    get_route_type = function(arg0)
    {
        if (!is_string(arg0))
        {
            exit;
        }
        return variable_struct_get(global.harbor_route_types, arg0);
    };
    
    get_selected_route = function()
    {
        if (self.data.route_index < 0 || self.data.route_index >= array_length(self.data.routes))
        {
            exit;
        }
        var route = self.data.routes[self.data.route_index];
        return route;
    };
    
    get_selected_route_type = function()
    {
        var route = self.get_selected_route();
        if (!is_struct(route))
        {
            exit;
        }
        return self.get_route_type(route.type_key);
    };
    
    get_status_text = function()
    {
        var text = "";
        switch (self.data.status)
        {
            case UnknownEnum.Value_0:
                text = __("Idle");
                break;
            case UnknownEnum.Value_1:
                text = __("Delivering");
                break;
            case UnknownEnum.Value_2:
                text = __("Finished");
                break;
        }
        return text;
    };
    
    get_travel_duration = function(arg0 = undefined)
    {
        var base_duration = global.game_settings.harbor_ships_travel_duration;
        base_duration *= power(0.5, global.upgrade_attributes.harbor_ship_speed_multiplier);
        var speed_multiplier = 0;
        if (is_struct(arg0))
        {
            speed_multiplier = get_default_struct_value(get_default_struct_value(arg0, "upgrade_attributes", {}), "harbor_ship_delivery_speed", 0);
        }
        base_duration *= (1 - speed_multiplier);
        base_duration = max(sec(1), base_duration);
        return base_duration;
    };
    
    get_xp_reward = function()
    {
        var value = irandom_range(3, 5);
        value *= (1 + global.upgrade_attributes.harbor_ship_xp_multiplier);
        return value;
    };
    
    refresh_route_fuel = function()
    {
        if (self.data.status != UnknownEnum.Value_0)
        {
            exit;
        }
        var __array = self.data.routes;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            var type = self.get_route_type(mitem.type_key);
            mitem.fuel = self.generate_ship_fuel(type);
        }
    };
    
    reset = function()
    {
        self.current_route = undefined;
        self.data.route_index = -1;
        self.data.status = UnknownEnum.Value_0;
        self.data.time_end = 0;
        self.generate_routes();
    };
    
    select_route = function(arg0)
    {
        self.data.route_index = clamp(arg0, 0, array_length(self.data.routes) - 1);
        self.current_route = self.data.routes[self.data.route_index];
        var type_key = get_default_struct_value(self.current_route, "type_key", "regular");
        self.route = variable_struct_get(global.harbor_route_types, type_key);
    };
    
    load_data_before = function()
    {
        self.data.routes = [];
        self.route_type_keys = [];
    };
    
    load_data_after = function()
    {
        if (self.data.route_index > -1)
        {
            self.select_route(self.data.route_index);
        }
        if (self.data.status == UnknownEnum.Value_1)
        {
            variable_struct_set(global.harbor_ships_delivery, self.index, self);
        }
    };
    
    set_local_vars(arg0);
    self.init();
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2
}
