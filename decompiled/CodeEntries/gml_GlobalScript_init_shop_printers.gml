function init_shop_printers()
{
    global.shops_prestige_levels.printers = global.prestige_levels.prestige;
    global.shops.printers = {};
    _map(global.resources, function(arg0, arg1, arg2)
    {
        if (!arg0.printable)
        {
            exit;
        }
        var shop_key = "printer_" + arg1;
        var item_cost = 
        {
            coins: 5 + ((arg0.prestige_value - 1) * 5)
        };
        var resources_auto_collect = {};
        variable_struct_set(resources_auto_collect, arg1, 5);
        variable_struct_set(global.shops.printers, shop_key, 
        {
            index: arg0.index,
            
            name: function()
            {
                var name = sprintf(__("%s Printer"), self.resource.name);
                if (!self.resource.data.unlocked || self.resource.data.collected_total == 0)
                {
                    name = sprintf("[%s] ", __("Locked")) + name;
                }
                return name;
            },
            
            description: function()
            {
                var print_value = get_printer_value(self);
                return sprintf(__("Prints and collects %s %s leaves."), number_format(print_value, 2, false), self.resource.name_single);
            },
            
            sprite: arg0.sprite,
            cost: item_cost,
            cost_exp: 2 * arg0.print_cost_multiplier,
            max_count: 0,
            print_value_multiplier: arg0.print_value_multiplier,
            resource: arg0,
            
            is_obfuscated: function()
            {
                return self.resource.data.collected_total < 1;
            },
            
            is_printer: true
        });
    }, false);
}
