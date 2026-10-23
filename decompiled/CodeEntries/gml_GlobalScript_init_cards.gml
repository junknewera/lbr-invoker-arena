function init_cards()
{
    global.cards = {};
    global.cards_array_sorted_by_type = {};
    global.transcension_types = 
    {
        regular: 
        {
            name: __("Regular Transcension"),
            cards: [],
            transcension_card_parts_multiplier: 1
        },
        boss: 
        {
            name: __("Boss Transcension"),
            cards: [],
            transcension_card_parts_multiplier: 50
        }
    };
    add_keys_to_struct(global.transcension_types);
    init_cards_packs();
    var __struct = global.cards_types;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(global.cards_array_sorted_by_type, mkey, []);
        var __struct2 = global.enemies;
        var __prop_names2 = struct_get_names(__struct2);
        var __prop_len2 = array_length(__prop_names2);
        for (var __i2 = 0; __i2 < __prop_len2; __i2++)
        {
            var mkey2 = __prop_names2[__i2];
            var mitem2 = variable_struct_get(__struct2, mkey2);
            if (!mitem2.has_card)
            {
                continue;
            }
            var key = sprintf("%s_%s", mitem.key, mitem2.key);
            var index = (mitem.level * 10000000) + mitem2.index;
            var transcension_type = (mitem2.is_boss && !mitem2.tower) ? global.transcension_types.boss : global.transcension_types.regular;
            var card = new Card(
            {
                key: key,
                name: mitem2.name,
                index: index,
                sprite: mitem2.sprite,
                enemy: mitem2,
                sections_key: mitem.key,
                transcension_type: transcension_type,
                transcension_type_key: transcension_type.key,
                type: mitem,
                type_key: mitem.key
            });
            variable_struct_set(global.cards, key, card);
            variable_struct_set(mitem2.cards, mkey, card);
            if (card.transcension_type_key == global.transcension_types.boss.key)
            {
                array_push(global.transcension_types.boss.cards, card);
            }
            else
            {
                array_push(global.transcension_types.regular.cards, card);
            }
            array_push(variable_struct_get(global.cards_array_sorted_by_type, mkey), card);
        }
    }
    global.cards_array = struct_to_sorted_array(global.cards);
    var __array = global.cards_types_array;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        variable_struct_set(global.dialog_sections.cards, mitem.key, 
        {
            name: mitem.name,
            index: __i,
            type_key: mitem.key
        });
    }
}

function init_cards_types()
{
    global.cards_types = 
    {
        common: new Card_Type(
        {
            level: 1,
            name: __("Common"),
            sprite: spr_card_common,
            spawn_chance: 100
        }),
        uncommon: new Card_Type(
        {
            level: 2,
            name: __("Uncommon"),
            sprite: spr_card_uncommon,
            spawn_chance: 25
        }),
        rare: new Card_Type(
        {
            level: 3,
            name: __("Rare"),
            sprite: spr_card_rare,
            spawn_chance: 5
        }),
        epic: new Card_Type(
        {
            level: 4,
            name: __("Epic"),
            sprite: spr_card_epic,
            spawn_chance: 1
        }),
        mythical: new Card_Type(
        {
            level: 5,
            name: __("Mythical"),
            sprite: spr_card_mythical,
            spawn_chance: 0.2
        }),
        legendary: new Card_Type(
        {
            level: 6,
            name: __("Legendary"),
            sprite: spr_card_legendary,
            spawn_chance: 0.05
        })
    };
    add_keys_to_struct(global.cards_types);
    global.cards_types_array = struct_to_sorted_array(global.cards_types);
    global.cards_types_rarity = struct_to_sorted_array_by(global.cards_types, "level", false);
    var cards_types_length = array_length(global.cards_types_array);
    var __array = global.cards_types_array;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (__i > 0)
        {
            mitem.previous_rarity_type = @@array_get@@(global.cards_types_array, __i - 1);
        }
        if (__i < (cards_types_length - 1))
        {
            mitem.next_rarity_type = @@array_get@@(global.cards_types_array, __i + 1);
        }
    }
}

function check_cards()
{
    if (!is_unlocked_cards())
    {
        exit;
    }
    var check_auto_ascend = false;
    var check_auto_transcend = false;
    var ascend_type = get_option(global.options.cards_auto_ascend_type);
    var transcension_type_key = get_option(global.options.cards_auto_transcend_type);
    if (get_option(global.options.cards_auto_transcend) && has_bought_shop_item_safe(global.shops.coal.unlock_cards_auto_transcend))
    {
        check_auto_transcend = true;
    }
    if (get_option(global.options.cards_auto_ascend) && has_bought_shop_item_safe(global.shops.coal.unlock_cards_auto_ascend))
    {
        check_auto_ascend = true;
    }
    var __array = global.cards_array;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (check_auto_transcend && (mitem.transcension_type_key == transcension_type_key || transcension_type_key == "all") && mitem.can_transcend())
        {
            mitem.transcend();
        }
        if (check_auto_ascend && mitem.can_auto_ascend())
        {
            var can_ascend_option = false;
            switch (ascend_type)
            {
                case "full":
                    can_ascend_option = mitem.data.count >= mitem.max_count();
                    break;
                case "50":
                    can_ascend_option = mitem.data.count >= (mitem.max_count() * 0.5);
                    break;
                case "95":
                    can_ascend_option = mitem.data.count >= (mitem.max_count() * 0.95);
                    break;
                case "max-10":
                    can_ascend_option = mitem.data.count > (mitem.max_count() - 10);
                    break;
                case "asap":
                    can_ascend_option = true;
                    break;
            }
            if (!can_ascend_option)
            {
            }
            else
            {
                mitem.ascend();
            }
        }
    }
}
