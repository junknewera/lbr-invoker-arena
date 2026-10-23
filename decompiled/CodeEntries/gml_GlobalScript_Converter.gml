function Converter(arg0) : Game_Object(arg0) constructor
{
    name = __("Unknown Converter");
    description = __("The developer was too lazy to provide a description. Blame him.");
    index = 0;
    key = "";
    data = 
    {
        auto_start: false,
        converted_crits: 0,
        converted_loops: 0,
        converted_res_from: 0,
        converted_res_to: 0,
        started: false,
        version: 0,
        unlocked: false
    };
    fixed = false;
    is_process = true;
    static_resources = false;
    time_resistant = false;
    unlocked = false;
    resource_from = global.resources.leaves;
    resource_to = global.resources.gold;
    cost = 
    {
        leaves: 100
    };
    reward = 
    {
        gold: 1
    };
    input_key = undefined;
    reward_key = undefined;
    
    init = function()
    {
        self.check_unlock();
        self.input_key = self.resource_from.key;
        self.reward_key = get_first_key_from_struct(self.reward);
        var res_name = variable_struct_get(global.resources, self.reward_key).name_plural;
        self.name = sprintf("%s %s", res_name, __("Converter"));
    };
    
    can_crit = function()
    {
        return !self.static_resources && !self.fixed;
    };
    
    check_unlock = function()
    {
        self.data.unlocked = get_value_ext(self, self.unlocked);
    };
    
    get_name = function()
    {
        var name = get_value_ext(self, self.name);
        if (self.static_resources)
        {
            name += sprintf(" [%s]", __("static"));
        }
        return name;
    };
    
    get_description = function()
    {
        var convert_string = __("Converts %s %s to %s %s.");
        var from_text = iif(self.resource_from.is_leaf, self.resource_from.name_single, self.resource_from.name);
        var to_text = iif(self.resource_to.is_leaf, self.resource_to.name_single, self.resource_to.name);
        var text;
        if (self.resource_from.is_leaf)
        {
            text = sprintf(convert_string, number_format(variable_struct_get(self.cost, self.resource_from.key), 2), from_text, variable_struct_get(self.reward, self.resource_to.key), to_text);
        }
        else
        {
            text = sprintf(convert_string, number_format(variable_struct_get(self.cost, self.resource_from.key), 2), from_text, variable_struct_get(self.reward, self.resource_to.key), to_text);
        }
        text += "\n";
        if (self.time_resistant)
        {
            text += (__("Not affected by time travel.") + "\n");
        }
        if (!self.can_crit())
        {
            text += __s("Loops: %s", number_format(self.data.converted_loops, 2));
        }
        else
        {
            text += concatstr(__s("Loops: %s", number_format(self.data.converted_loops, 2)), " | ", __s("Crits: %s", number_format(self.data.converted_crits, 2)));
        }
        return text;
    };
    
    get_crit_resources = function()
    {
        var crit_multiplier = 1.25 + global.upgrade_attributes.converter_crit_value;
        crit_multiplier *= (1 + global.upgrade_attributes.converter_crit_value_multiplier);
        crit_multiplier *= (1 + global.upgrade_attributes.converter_crit_value_multiplier_dice);
        var res = get_converter_input_resources(self);
        return multiply_struct_values(res.to, crit_multiplier, true);
    };
    
    get_input_value = function(arg0 = 1)
    {
        var input_resources = get_converter_input_resources(self);
        variable_struct_set(input_resources.from, self.input_key, variable_struct_get(input_resources.from, self.input_key) * arg0);
        return variable_struct_get(input_resources.from, self.input_key);
    };
    
    get_reward_value = function(arg0 = 1)
    {
        var reward_final = get_converter_input_resources(self);
        variable_struct_set(reward_final.to, self.reward_key, variable_struct_get(reward_final.to, self.reward_key) * arg0);
        return variable_struct_get(reward_final.to, self.reward_key);
    };
    
    is_obfuscated = function()
    {
        return !self.resource_to.data.unlocked || !self.data.unlocked;
    };
    
    prestige = function(arg0)
    {
        self.check_unlock();
    };
    
    set_local_vars(arg0);
    self.sprite = self.resource_to.sprite;
    set_sprite_data(self);
}
