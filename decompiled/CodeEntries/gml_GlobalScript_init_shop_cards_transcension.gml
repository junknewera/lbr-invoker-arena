function init_shop_cards_transcension()
{
    global.shops_prestige_levels.cards_transcension = global.prestige_levels.inf;
    var shop_resource = global.resources.transcension_card_parts;
    global.shops.cards_transcension = 
    {
        cards_max_count: 
        {
            index: 0,
            name: __("Max Cards"),
            description: __s("Increases max cards count by %s.", 1),
            sprite: spr_card_uncommon,
            cost: build_resource_cost(shop_resource, 6),
            cost_exp: 1.5,
            max_count: 0,
            upgrade_attributes: 
            {
                cards_max_count: 1
            }
        },
        cards_enemy_drop_chance: build_shop_item("cards_enemy_drop_chance", shop_resource, 10, 
        {
            base_cost: 6,
            cost_exp: 1.85,
            max_count: 0,
            value: 0.02
        }),
        cards_boss_drop_chance: build_shop_item("cards_boss_drop_chance", shop_resource, 20, 
        {
            base_cost: 6,
            cost_exp: 1.85,
            max_count: 0,
            value: 0.05
        }),
        card_parts_drop_chance: build_shop_item("card_parts_drop_chance", shop_resource, 30, 
        {
            base_cost: 6,
            cost_exp: 1.85,
            max_count: 0,
            value: 0.01
        }),
        cards_transcension_card_parts_count: 
        {
            index: 100,
            name: __("TCP++"),
            description: __s("Increases %s received by Transcending Cards by %s.", global.resources.transcension_card_parts.name_plural, 1),
            sprite: spr_resource_card_part_transcend,
            cost: build_resource_cost(shop_resource, 6),
            cost_exp: 2.25,
            max_count: 0,
            upgrade_attributes: 
            {
                cards_transcension_card_parts_count: 1
            }
        }
    };
}
