function apply_enemy_cards_damage(arg0, arg1)
{
    if (!is_struct(arg1))
    {
        return arg0;
    }
    var cards_count = get_cache_sub("enemy_cards_count", arg1.key);
    if (!is_numeric(cards_count))
    {
        cards_count = 0;
        var __struct = arg1.cards;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            cards_count += mitem.data.count;
        }
        set_cache_sub("enemy_cards_count", arg1.key, cards_count);
    }
    var card_damage = cards_count * global.game_settings.cards_enemy_damage;
    arg0 *= (1 + card_damage);
    return arg0;
}

function can_spawn_card_part()
{
    if (!is_unlocked_cards())
    {
        return false;
    }
    if (instance_number(o_card_part) > 20)
    {
        return false;
    }
    return true;
}

function can_spawn_cards()
{
    if (!is_unlocked_cards())
    {
        return false;
    }
    if (instance_number(o_card) > 20)
    {
        return false;
    }
    return true;
}

function can_transcend_cards(arg0)
{
    var can_transcend = false;
    var __array = arg0;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (mitem.can_transcend())
        {
            can_transcend = true;
            break;
        }
    }
    return can_transcend;
}

function drop_random_card(arg0 = global.cards_array)
{
    if (!can_spawn_cards())
    {
        exit;
    }
    var item = array_random_item(arg0);
    if (!is_struct(item))
    {
        exit;
    }
    item.spawn();
}

function enemy_drop_card(arg0, arg1, arg2)
{
    if (!is_unlocked_cards(true))
    {
        exit;
    }
    var card_parts_drop_chance_success = percent_chance(get_card_parts_drop_chance(arg2) * 100);
    if (card_parts_drop_chance_success && can_spawn_card_part())
    {
        spawn_card_part(arg0, arg1);
    }
    if (!is_struct(arg2) || !is_struct(arg2.cards) || get_struct_length(arg2.cards) == 0)
    {
        exit;
    }
    if (!can_spawn_cards())
    {
        exit;
    }
    var drop_chance = get_cards_drop_chance(arg2) * 100;
    var drop_chance_success = percent_chance(drop_chance);
    if (!drop_chance_success)
    {
        exit;
    }
    var drop_count = 1;
    if (drop_chance > 100)
    {
        var multi_drop_chance = drop_chance - 100;
        drop_count += multi_chance(multi_drop_chance, 0, 100);
    }
    repeat (drop_count)
    {
        if (!can_spawn_cards() && !can_spawn_card_part())
        {
            break;
        }
        var type = get_random_card_type();
        var drop_item = variable_struct_get(arg2.cards, type.key);
        if (drop_item.data.count >= drop_item.max_count())
        {
            if (can_spawn_card_part())
            {
                spawn_card_part(arg0, arg1);
            }
        }
        else if (!can_spawn_cards())
        {
        }
        else
        {
            drop_item.spawn(arg0, arg1);
        }
    }
}

function get_boss_cards_drop_chance(arg0 = undefined)
{
    var base_chance = get_cards_base_drop_chance();
    base_chance += global.game_settings.cards_enemy_drop_chance_boss;
    base_chance += get_upgrade_attribute_value(global.upgrade_attributes.cards_boss_drop_chance);
    return base_chance;
}

function get_cards_base_drop_chance()
{
    var base_chance = global.game_settings.cards_enemy_drop_chance + get_upgrade_attribute_value(global.upgrade_attributes.cards_enemy_drop_chance);
    return base_chance;
}

function get_cards_drop_chance(arg0 = undefined)
{
    var base_chance = get_cards_base_drop_chance();
    if (is_struct(arg0))
    {
        if (arg0.is_boss && !enemy.tower)
        {
            base_chance = get_boss_cards_drop_chance(arg0);
        }
    }
    return base_chance;
}

function get_cards_max_count(arg0 = undefined)
{
    var value = global.game_settings.cards_max_count + get_upgrade_attribute_value(global.upgrade_attributes.cards_max_count);
    if (!is_undefined(arg0))
    {
        var type_transcension_count = get_default_struct_value(o_game.data.stats.cards_transcensions, arg0, 0);
        value += floor(type_transcension_count / global.game_settings.cards_transcension_increase_max_count);
    }
    return value;
}

function get_card_parts_drop_chance(arg0 = undefined)
{
    var base_chance = global.game_settings.card_parts_drop_chance + get_upgrade_attribute_value(global.upgrade_attributes.card_parts_drop_chance);
    return base_chance;
}

function get_cards_transcension_resources(arg0)
{
    var res = 
    {
        transcension_card_parts: 0
    };
    var __array = arg0;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (mitem.can_transcend())
        {
            res.transcension_card_parts += mitem.get_transcend_card_parts_count();
        }
    }
    return res;
}

function get_random_available_card(arg0 = undefined, arg1 = true, arg2 = false)
{
    return array_random_item(get_available_cards(arg0, arg1, arg2));
}

function get_available_cards(arg0 = undefined, arg1 = true, arg2 = false)
{
    var collection = global.cards_array;
    if (is_struct(arg0))
    {
        collection = variable_struct_get(global.cards_array_sorted_by_type, arg0.key);
    }
    var cards = [];
    var __array = collection;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (!arg2 && mitem.data.count >= mitem.get_max_count())
        {
            continue;
        }
        if (mitem.enemy.is_boss && !arg1)
        {
            continue;
        }
        if (mitem.enemy.get_current_defeat_counter() < 1)
        {
            continue;
        }
        array_push(cards, mitem);
    }
    return cards;
}

function get_random_card_type(arg0 = global.cards_types_rarity, arg1 = 0, arg2 = 0)
{
    var type = @@array_get@@(arg0, 0);
    var __array = arg0;
    var __prop_len = array_length(__array);
    var __i = __prop_len - 1;
    while (__i >= 0)
    {
        var mitem = __array[__i];
        var __ireal = __prop_len - 1 - __i;
        var spawn_chance = mitem.spawn_chance;
        spawn_chance *= (1 + arg2);
        spawn_chance += arg1;
        if (!percent_chance(spawn_chance))
        {
        }
        else
        {
            type = mitem;
        }
        __i--;
    }
    return type;
}

function open_all_card_packs()
{
    var res = {};
    var packs_opened = 0;
    var __array = global.cards_packs_array;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        packs_opened += mitem.data.count;
        var res_pack = mitem.open(mitem.data.count, false, true, true);
        add_struct_to_struct(res, res_pack);
    }
    var show_dialog = get_option(global.options.show_reward_dialogs);
    add_result(res, undefined, undefined, !show_dialog, undefined, "cards");
    if (show_dialog)
    {
        notify(__s("%s %s opened.", packs_opened, pluralize(packs_opened, __("item"), __("items"))));
    }
    save_game();
}

function spawn_card_part(arg0, arg1)
{
    if (!can_spawn_card_part())
    {
        exit;
    }
    spawn_collectable_quick(arg0, arg1, o_card_part);
}

function transcend_cards(arg0)
{
    if (!can_transcend_cards(arg0))
    {
        return false;
    }
    var transcension_resources = get_cards_transcension_resources(arg0);
    var transcend_count = 0;
    var __array = arg0;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (!mitem.can_transcend())
        {
            continue;
        }
        var transcended = mitem.transcend();
        if (transcended)
        {
            transcend_count++;
        }
    }
    notify(__s("%s %s transcended. Received %s.", transcend_count, pluralize(transcend_count, __("Card"), __("Cards")), format_resources_text(transcension_resources)));
}
