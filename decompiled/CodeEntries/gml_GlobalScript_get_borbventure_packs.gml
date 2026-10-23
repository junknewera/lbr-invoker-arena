function get_borbventure_packs()
{
    return 
    {
        common: new Borbventure_Pack(
        {
            index: 0,
            sprite: spr_card_common,
            name: __s("Common Pack"),
            name_full: __s("Common %s Pack", __("Borbventure")),
            cost: 
            {
                gems: 250
            },
            cost_parts: 
            {
                borb_token: 1000
            },
            items_count: 3,
            items_guarantee: 
            {
                uncommon: 1
            },
            items_rarity: [
            {
                rarity: global.borbventures.borb_levels.common,
                chance: 100
            }, 
            {
                rarity: global.borbventures.borb_levels.uncommon,
                chance: 25
            }, 
            {
                rarity: global.borbventures.borb_levels.rare,
                chance: 5
            }]
        }),
        rare: new Borbventure_Pack(
        {
            index: 10,
            sprite: spr_card_rare,
            name: __s("Rare Pack"),
            name_full: __s("Rare %s Pack", __("Borbventure")),
            cost: 
            {
                gems: 500
            },
            cost_parts: 
            {
                borb_token: 3000
            },
            items_count: 3,
            items_guarantee: 
            {
                rare: 1,
                epic: 1
            },
            items_rarity: [
            {
                rarity: global.borbventures.borb_levels.uncommon,
                chance: 100
            }, 
            {
                rarity: global.borbventures.borb_levels.rare,
                chance: 25
            }, 
            {
                rarity: global.borbventures.borb_levels.epic,
                chance: 10
            }, 
            {
                rarity: global.borbventures.borb_levels.mythical,
                chance: 5
            }]
        }),
        legendary: new Borbventure_Pack(
        {
            index: 20,
            sprite: spr_card_legendary,
            name: __s("Legendary Pack"),
            name_full: __s("Legendary %s Pack", __("Borbventure")),
            cost: 
            {
                gems: 1500
            },
            cost_parts: 
            {
                borb_token: 8000
            },
            items_count: 3,
            items_guarantee: 
            {
                epic: 1,
                mythical: 1
            },
            items_rarity: [
            {
                rarity: global.borbventures.borb_levels.rare,
                chance: 100
            }, 
            {
                rarity: global.borbventures.borb_levels.epic,
                chance: 25
            }, 
            {
                rarity: global.borbventures.borb_levels.mythical,
                chance: 10
            }, 
            {
                rarity: global.borbventures.borb_levels.legendary,
                chance: 5
            }]
        })
    };
}
