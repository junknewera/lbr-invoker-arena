function Crafted_Leaf_Upgrade(arg0 = undefined) constructor
{
    key = "";
    collection = undefined;
    collection_exclude_keys = [];
    collection_items = {};
    has_resources = false;
    resource_check_var = undefined;
    resources = {};
    value_func = undefined;
    
    _init = function()
    {
        if (self.has_resources)
        {
            var __array = global.resources_leaves;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                if (!is_undefined(self.resource_check_var) && !variable_struct_get(mitem, self.resource_check_var))
                {
                    continue;
                }
                var add_value = self.value;
                var min_rarity = self.min_rarity;
                if (mitem.is_gem_leaf)
                {
                    add_value = add_value / 100;
                    min_rarity = 5;
                }
                variable_struct_set(self.resources, mitem.key, 
                {
                    value: add_value,
                    min_rarity: min_rarity,
                    key: mitem.key
                });
            }
        }
        if (!is_undefined(self.collection))
        {
            var __struct = self.collection;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                variable_struct_set(self.collection_items, mitem.key, 
                {
                    value: self.value,
                    min_rarity: self.min_rarity,
                    key: mitem.key
                });
            }
        }
    };
    
    is_obfuscated = function()
    {
        return is_undefined(variable_struct_get(o_game.data.stats.crafted_vars_transform_unlocked, self.key));
    };
    
    is_obfuscated_filter = function()
    {
        return is_undefined(variable_struct_get(o_game.data.stats.crafted_vars_seen, self.key));
    };
    
    set_local_vars(arg0);
    self._init();
}
