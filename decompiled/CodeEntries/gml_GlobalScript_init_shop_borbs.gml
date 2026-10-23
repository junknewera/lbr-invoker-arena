function init_shop_borbs()
{
    global.shops_prestige_levels.borbs = global.prestige_levels.inf;
    global.shops.borbs = 
    {
        leaf_marketing: 
        {
            index: 1,
            name: __("Borb borb"),
            description: __("Borb borb borb borb, borb borb borb borb. Borb borb. BORB!"),
            sprite: spr_borb,
            cost: 
            {
                borbs: 10
            },
            cost_exp: 3.5,
            upgrade_attributes: 
            {
                borb_spawn_chance: 1
            },
            max_count: 100
        }
    };
}
