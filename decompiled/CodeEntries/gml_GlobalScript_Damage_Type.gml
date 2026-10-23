function Damage_Type(arg0 = undefined) constructor
{
    key = "";
    sprite = spr_placeholder;
    craftable = false;
    resistance = 0;
    resistance_types = {};
    _resistance_types = {};
    
    init = function()
    {
    };
    
    get_resistance = function(arg0)
    {
        var damage_key_victim = arg0.key;
        var resistance = get_default_struct_value(self._resistance_types, damage_key_victim, 0);
        return resistance;
    };
    
    setup_resistances = function()
    {
        var __array = global.damage_types_keys;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            variable_struct_set(self._resistance_types, mitem, 0);
        }
        var __struct = self.resistance_types;
        var __prop_names = struct_get_names(__struct);
        __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            variable_struct_set(self._resistance_types, mkey, variable_struct_get(self._resistance_types, mkey) + mitem);
        }
    };
    
    set_local_vars(arg0);
    set_sprite_data(self);
    init();
}
