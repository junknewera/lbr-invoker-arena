function init_shop_prestige()
{
    global.shops_prestige_levels.prestige = global.prestige_levels.none;
    global.shops_resources.prestige = global.resources.leaves;
    global.shops.prestige = 
    {
        prestige: 
        {
            index: 0,
            name: __("Leaf Portal"),
            
            description: function()
            {
                return __("Enter the Leaf Portal to restart your blowing adventure with some coins.");
            },
            
            cost: 
            {
                gold: 10000
            },
            max_count: 1,
            
            func: function()
            {
                confirm_dialog("Confirm prestige", function()
                {
                    prestige_exec(global.prestige_levels.prestige);
                    instance_destroy(o_dialog_confirm);
                });
            },
            
            is_static: true,
            is_usable: true
        }
    };
}
