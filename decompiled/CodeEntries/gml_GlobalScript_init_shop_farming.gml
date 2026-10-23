function init_shop_farming()
{
    global.shops_prestige_levels.farming = global.prestige_levels.blc;
    global.shops.farming = {};
    _map(global.resources, function(arg0, arg1, arg2)
    {
        if (!arg0.has_seeds)
        {
            exit;
        }
        var shop_key = "farming_" + arg1;
        var cost = 1000000000 * power(arg0.prestige_value, 3) * arg0.seed_cost_multiplier;
        var item_cost = build_resource_cost(arg0, cost);
        variable_struct_set(global.shops.farming, shop_key, 
        {
            index: arg0.index,
            
            name: function()
            {
                var name = sprintf(__("%s Seeds"), self.resource.name);
                return name;
            },
            
            description: sprintf(__("Increases seed rewards by %s% per level."), 1),
            sprite: arg0.sprite_seed,
            data: 
            {
                level: 0
            },
            cost: item_cost,
            cost_exp: arg0.seed_cost_exp,
            max_count: 100,
            
            get_max_count: function()
            {
                return self.max_count + get_upgrade_attribute_value(global.upgrade_attributes.seed_max_count);
            },
            
            resource: arg0,
            upgrade_attributes: 
            {
                seed_value_add: {}
            },
            
            is_obfuscated: function()
            {
                if (self.resource.seed_unlocked)
                {
                    return false;
                }
                return get_upgrade_attribute_value(variable_struct_get(global.upgrade_attributes.seed_unlocked, self.resource.key)) == 0;
            }
        });
        variable_struct_set(variable_struct_get(global.shops.farming, shop_key).upgrade_attributes.seed_value_add, arg1, 0.01);
    }, false);
    global.shops.farming.farming_mulch.name = __("Meeds");
}
