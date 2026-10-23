function init_shop_void()
{
    global.shops_prestige_levels.void = global.prestige_levels.none;
    global.shops_resources.void = global.resources.void;
    var shop_resource = global.resources.void;
    global.shops.void = 
    {
        unlock_red_flask: 
        {
            index: -10,
            name: __("Unlock Red Flasks"),
            description: __("Red Flasks can be used for science research which are created with the Converter."),
            sprite: spr_flask_red,
            cost: 
            {
                void: 10000
            },
            max_count: 1,
            
            func: function()
            {
                global.resources.flask_red.data.unlocked = true;
            }
        },
        tree: 
        {
            index: -1,
            name: __("Tree"),
            description: __("More trees, more leaves. Simple as that."),
            sprite: spr_tree,
            cost: 
            {
                void: 10
            },
            upgrade_attributes: 
            {
                trees: 1
            },
            max_count: 30,
            
            func: function()
            {
                with (o_trees)
                {
                    add_tree();
                }
            }
        },
        fertilizer: build_shop_item("fertilizer", shop_resource, 0, 
        {
            base_cost: 10,
            max_count: 50
        }),
        leaf_marketing: 
        {
            index: 1,
            name: __("Void Marketing"),
            description: __("Receive more rewarded leaves by using void marketing techniques."),
            sprite: spr_icon_marketing,
            cost: 
            {
                void: 500
            },
            cost_exp: 3.5,
            upgrade_attributes: 
            {
                resources_leaf_add: 
                {
                    void: 1
                }
            },
            max_count: 5
        },
        auto_leaf_blower: 
        {
            index: 5,
            name: __("Auto Leaf Blower"),
            description: __("An automatic leaf blower also known as ALB."),
            sprite: spr_autoblower,
            cost: 
            {
                void: 200
            },
            cost_exp: 6,
            max_count: 3,
            
            func: function()
            {
                create_autoblower();
            }
        },
        void_apples: 
        {
            index: 20,
            name: __("Unlock Void Apples"),
            description: __("Eat some Void Apples to get void leaves instantly."),
            sprite: spr_fruit,
            sprite_image_index: 5,
            cost: 
            {
                void: 50
            },
            max_count: 1,
            upgrade_attributes: 
            {
                fruit_unlocked: 
                {
                    void: true
                }
            }
        },
        player_hp: 
        {
            index: 200,
            name: __("Player HP"),
            sprite: spr_icon_heart,
            description: __("Increases Player HP by +0.5 per level."),
            cost: 
            {
                void: 2500000000
            },
            cost_exp: 7,
            upgrade_attributes: 
            {
                player_hp: 0.5
            },
            max_count: 200,
            
            is_obfuscated: function()
            {
                return global.areas.volcano.data.count == 0;
            }
        },
        player_hp_reg: 
        {
            index: 201,
            name: __("Player HP Regeneration"),
            sprite: spr_icon_heart,
            description: __("Increases Player HP Regeneration by +0.1 per level."),
            cost: 
            {
                void: 10000000000
            },
            cost_exp: 7,
            upgrade_attributes: 
            {
                player_hp_reg: 0.1
            },
            max_count: 200,
            
            is_obfuscated: function()
            {
                return global.areas.volcano.data.count == 0;
            }
        }
    };
}
