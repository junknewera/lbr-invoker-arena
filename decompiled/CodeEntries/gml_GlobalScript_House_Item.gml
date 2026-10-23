function House_Item(arg0) constructor
{
    name = __("Unknown Item");
    description = "";
    index = 0;
    key = "";
    max_count = 1;
    resource = false;
    scale = 1;
    sprite = spr_placeholder;
    sprite_animated = false;
    sprite_speed = 0.5;
    unlocked = false;
    grid_layer = global.house_layers.instances;
    grid_w = 1;
    grid_h = 1;
    cost = 
    {
        cp: 2
    };
    upgrade_attributes = {};
    data = 
    {
        build_data: [],
        count: 0,
        unlocked: false
    };
    
    init = function()
    {
        self.upgrade_attributes.leaf_hard_multiplier = 0.25;
        if (self.unlocked)
        {
            self.data.unlocked = true;
        }
        if (is_struct(self.resource) && is_struct(self.resource.house_item_cost))
        {
            self.cost = self.resource.house_item_cost;
        }
    };
    
    can_build = function()
    {
        return self.data.unlocked;
    };
    
    _can_buy = function()
    {
        if (!has_enough_resources(self.cost) || self.data.unlocked)
        {
            return false;
        }
        if (is_struct(self.resource))
        {
            if (!is_undefined(self.resource.house_item_can_buy) && is_callable(self.resource.house_item_can_buy))
            {
                return self.resource.house_item_can_buy();
            }
            else if (variable_struct_get(global.resources, self.resource.key).data.collected_total == 0)
            {
                return false;
            }
        }
        return self.can_buy();
    };
    
    can_buy = function()
    {
        return true;
    };
    
    add_item = function(arg0)
    {
        struct_apply_defaults(arg0, self.get_default_build_data());
        array_push(self.data.build_data, arg0);
    };
    
    get_build_data = function(arg0)
    {
        if (is_undefined(@@array_get@@(self.data.build_data, arg0)))
        {
            return self.get_default_build_data();
        }
        var build_data = @@array_get@@(self.data.build_data, arg0);
        struct_apply_defaults(build_data, self.get_default_build_data());
        return build_data;
    };
    
    get_default_build_data = function()
    {
        return 
        {
            _x: 0,
            _y: 0,
            img_angle: 0,
            img_index: 0,
            item_id: -1
        };
    };
    
    get_tooltip = function()
    {
        if (!self.data.unlocked)
        {
            var is_unlocked = false;
            if (is_struct(self.resource))
            {
                if (!is_undefined(self.resource.house_item_can_buy) && is_callable(self.resource.house_item_can_buy) && !self.resource.house_item_can_buy())
                {
                    return __("Unavailable: unlock this resource first");
                }
                if (variable_struct_get(global.resources, self.resource.key).data.collected_total <= 0)
                {
                    return __("Unavailable: unlock this resource first");
                }
            }
            return "?";
        }
        var text = [self.get_name()];
        var desc = self.get_description();
        if (desc != "")
        {
            array_push(text, desc);
        }
        return implode("\n", text);
    };
    
    can_apply_bonus = function()
    {
        return self.data.unlocked;
    };
    
    get_name = function()
    {
        return get_value_ext(self, self.name, false);
    };
    
    get_description = function()
    {
        return get_value_ext(self, self.description, false);
    };
    
    is_obfuscated = function()
    {
        return false;
    };
    
    set_local_vars(arg0);
    set_sprite_data(self);
    var spr_w = sprite_get_width(sprite);
    var spr_h = sprite_get_height(sprite);
    grid_w = max(8, floor(spr_w / 8) * 8 * scale);
    grid_h = max(8, floor(spr_h / 8) * 8 * scale);
    init();
}
