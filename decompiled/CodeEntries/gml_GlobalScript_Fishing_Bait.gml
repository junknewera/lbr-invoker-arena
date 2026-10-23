function Fishing_Bait(arg0 = undefined) : Savable_Object(arg0) constructor
{
    catch_chance = {};
    index = 0;
    name = "";
    description = "";
    description_bonus = "";
    length_multiplier = 0;
    rarity = undefined;
    sprite = spr_fish_quibble;
    tooltip_cache = undefined;
    data = 
    {
        collected: 0,
        count: 0,
        unlocked: true
    };
    
    init = function()
    {
        self.name = __s("%s Bait", self.rarity.name);
        self.length_multiplier = 0.2 + (0.05 * power(self.rarity.level, 2));
        self.level = self.rarity.level;
        self.sprite = self.rarity.sprite;
        var bonus_text_array = [];
        var __array = global.fishing_baits_rarity_array;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (is_undefined(variable_struct_get(self.rarity.catch_chance, mitem.key)))
            {
                continue;
            }
            array_push(bonus_text_array, sprintf("%s: %s", mitem.name, number_format_percent(variable_struct_get(self.rarity.catch_chance, mitem.key))));
        }
        array_push(bonus_text_array, "");
        array_push(bonus_text_array, format_upgrade_text(
        {
            fishing_min_fish_length_multiplier: self.length_multiplier
        }));
        self.description_bonus = implode("\n", bonus_text_array);
        self.description = concatstr_nl(__s("Additional catch chance") + ":", "", self.description_bonus);
    };
    
    can_use = function()
    {
        return self.data.count > 0;
    };
    
    collect = function(arg0 = 1)
    {
        self.data.collected += arg0;
        self.data.count += arg0;
    };
    
    get_length_multiplier = function()
    {
        return self.length_multiplier;
    };
    
    get_tooltip = function()
    {
        if (is_string(self.tooltip_cache))
        {
            return self.tooltip_cache;
        }
        self.tooltip_cache = concat([self.name, "--------", self.description_bonus]);
    };
    
    use = function()
    {
        self.data.count--;
    };
    
    set_local_vars(arg0);
}
