function init_cards_packs()
{
    global.cards_packs = 
    {
        common: new Card_Pack(
        {
            index: 0,
            sprite: spr_card_common,
            name: __("Common Pack"),
            name_full: __s("Common %s Pack", __("Cards")),
            cost: 
            {
                gems: 1
            },
            cost_parts: 
            {
                card_parts: 600
            },
            cards_count: 3,
            cards_rarity: [
            {
                type: global.cards_types.common,
                chance: 100
            }, 
            {
                type: global.cards_types.uncommon,
                chance: 25
            }, 
            {
                type: global.cards_types.rare,
                chance: 5
            }],
            cards_guarantee: 
            {
                uncommon: 1
            }
        }),
        rare: new Card_Pack(
        {
            index: 10,
            sprite: spr_card_rare,
            name: __("Rare Pack"),
            name_full: __s("Rare %s Pack", __("Cards")),
            cards_count: 4,
            cost: 
            {
                gems: 125
            },
            cost_parts: 
            {
                card_parts: 2000
            },
            cards_rarity: [
            {
                type: global.cards_types.uncommon,
                chance: 100
            }, 
            {
                type: global.cards_types.rare,
                chance: 25
            }, 
            {
                type: global.cards_types.epic,
                chance: 10
            }, 
            {
                type: global.cards_types.mythical,
                chance: 5
            }],
            cards_guarantee: 
            {
                epic: 1
            }
        }),
        legendary: new Card_Pack(
        {
            sprite: spr_card_legendary,
            index: 20,
            cost: 
            {
                gems: 1750
            },
            cost_parts: 
            {
                card_parts: 6000
            },
            name: __("Legendary Pack"),
            name_full: __s("Legendary %s Pack", __("Cards")),
            cards_count: 5,
            cards_rarity: [
            {
                type: global.cards_types.rare,
                chance: 100
            }, 
            {
                type: global.cards_types.epic,
                chance: 25
            }, 
            {
                type: global.cards_types.mythical,
                chance: 10
            }, 
            {
                type: global.cards_types.legendary,
                chance: 5
            }],
            cards_guarantee: 
            {
                mythical: 1
            }
        })
    };
    global.cards_packs_array = struct_to_sorted_array(global.cards_packs);
    var __struct = global.cards_packs;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        sort_array_by(mitem.cards_rarity, "chance");
    }
}
