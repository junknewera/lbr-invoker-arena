function Crafted_Leaf_Type(arg0, arg1) constructor
{
    if (is_undefined(arg1))
    {
        arg1 = {};
    }
    name = __("Common");
    description = __("");
    index = 0;
    key = arg0;
    sprite = spr_placeholder;
    craftable = true;
    craftable_manual = false;
    craft_bonus = 1;
    craft_chance = 0;
    craft_duration = 30;
    craft_level = 0;
    prop_count = 1;
    rarity = 0;
    resource = undefined;
    
    init = function()
    {
        self.resource = variable_struct_get(global.resources, self.key);
        if (self.key == "basic")
        {
            self.resource = global.resources.leaves;
        }
        else if (is_undefined(self.resource))
        {
            log("Unknown craft leaf type resource", self.key);
        }
    };
    
    can_craft = function()
    {
        if (get_upgrade_attribute_value(global.upgrade_attributes.craft_level) < self.craft_level)
        {
            return false;
        }
        if (!get_value_ext(self, self.craftable))
        {
            return false;
        }
        if (self.craftable_manual && get_default_struct_value(global.upgrade_attributes.craft_leaf_type_manual, self.key, 0) == 0)
        {
            return false;
        }
        return true;
    };
    
    get_craft_chance = function()
    {
        return self.craft_chance;
    };
    
    get_name = function()
    {
        return get_value_ext(self, self.name);
    };
    
    set_local_vars(arg1);
    set_sprite_data(self);
    init();
}
