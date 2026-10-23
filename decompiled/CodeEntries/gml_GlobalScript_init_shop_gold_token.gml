function init_shop_gold_token()
{
    global.shops_prestige_levels.gold_token = global.prestige_levels.blc;
    var shop_resource = global.resources.gold_token;
    global.shops.gold_token = 
    {
        alb_tower: 
        {
            index: 0,
            name: __("Tower ALBs"),
            description: __("You can bring your ALBs to The Leaf Tower."),
            sprite: spr_autoblower,
            cost: 
            {
                gold_token: 20
            },
            max_count: 1,
            upgrade_attributes: 
            {
                alb_tower: 1
            },
            
            buy_after: function()
            {
                init_game_vars();
                create_autoblowers();
            }
        },
        alb_can_collect_equipment: 
        {
            index: 10,
            name: __("ALBs <3 Equipment Items"),
            description: __("ALBs can collect equipment items for you now. Should they also clean your house?"),
            sprite: spr_autoblower,
            cost: 
            {
                gold_token: 10
            },
            max_count: 1
        },
        alb_can_collect_scrolls: 
        {
            index: 11,
            name: __("ALBs <3 Scrolls"),
            description: __("ALBs can collect scrolls for you now. Should they also do your homework?"),
            sprite: spr_autoblower,
            cost: 
            {
                gold_token: 25
            },
            max_count: 1
        },
        enemy_multiplier_rewards: 
        {
            index: 50,
            name: __("More Tower Rewards"),
            description: __("Enemy rewards are applied in The Leaf Tower."),
            sprite: spr_icon_marketing,
            cost: 
            {
                gold_token: 50
            },
            max_count: 1
        },
        player_hp: build_shop_item("player_hp", shop_resource, 100, 
        {
            base_cost: 30,
            value: 200
        }),
        player_hp_reg: build_shop_item("player_hp_reg", shop_resource, 200, 
        {
            value: 50
        }),
        blower_hit_damage: build_shop_item("blower_hit_damage", shop_resource, 300, 
        {
            base_cost: 500,
            cost_exp: 1.25,
            value: 200000
        }),
        blower_hit_damage_multiplier: build_shop_item("blower_hit_damage_multiplier", shop_resource, 400, 
        {
            base_cost: 20,
            cost_exp: 1.5,
            value: 0.5
        })
    };
}
