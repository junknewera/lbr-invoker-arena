function init_shop_silver_token()
{
    global.shops_prestige_levels.silver_token = global.prestige_levels.blc;
    var shop_resource = global.resources.silver_token;
    global.shops.silver_token = 
    {
        player_hp: build_shop_item("player_hp", shop_resource, 0, 
        {
            base_cost: 30,
            cost_exp: 1.5,
            value: 20
        }),
        player_hp_reg: build_shop_item("player_hp_reg", shop_resource, 20, 
        {
            cost_exp: 1.25,
            value: 5
        }),
        damage_resistance: build_shop_item("damage_resistance", shop_resource, 50, 
        {
            base_cost: 300,
            cost_exp: 1.5,
            value: 0.005
        }),
        blower_hit_damage: build_shop_item("blower_hit_damage", shop_resource, 100, 
        {
            base_cost: 500,
            cost_exp: 1.25,
            value: 5000
        }),
        blower_hit_damage_multiplier: build_shop_item("blower_hit_damage_multiplier", shop_resource, 105, 
        {
            base_cost: 20,
            cost_exp: 1.5,
            value: 0.25
        }),
        item_drop_chance: build_shop_item("item_drop_chance", shop_resource, 200, 
        {
            value: 0.001
        }),
        auto_restart_tower: 
        {
            index: 300,
            name: __("Borb Tower Taxi"),
            description: __("Automatically transports you back to the Leaf Tower when you get blown away at the cost of 100 Borbs."),
            sprite: spr_borb,
            cost: 
            {
                silver_token: 500
            },
            max_count: 1,
            is_toggle: true
        },
        auto_restart_tower_peak: 
        {
            index: 310,
            name: __("Borb Taxi End of Party"),
            description: __("Automatically transports you back to the Leaf Tower when you have reached the current tower peak."),
            sprite: spr_borb,
            cost: 
            {
                silver_token: 25000
            },
            max_count: 1,
            is_toggle: true
        },
        auto_restart_tower_enemy_count: 
        {
            index: 320,
            name: __("Borb Taxi Observer"),
            description: __("Your personal Borb Taxi Observer transports you back to the Leaf Tower when you're stuck on a single tower level for too long. The observer triggers if the defined number of enemies disappeared. Set to 0 to disable this option."),
            sprite: spr_borb,
            cost: 
            {
                silver_token: 250
            },
            max_count: 1,
            is_slider: true,
            slider_affix: sprintf(" %s", __("enemies")),
            slider_format_number: true,
            slider_min: 0,
            slider_max: 100,
            slider_step: 1,
            data: 
            {
                slider_value: 20
            }
        }
    };
}
