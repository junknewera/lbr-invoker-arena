function play_slots(arg0, arg1)
{
    if (!has_enough_resources(global.costs.slots) || global.tavern_games_playing.slots)
    {
        exit;
    }
    dec_resources(global.costs.slots);
    instance_destroy(o_minigame_slots);
    instance_create_layer(arg0, arg1, global.layers.gui, o_minigame_slots);
}

function get_slots_pool()
{
    var leaves = [
    {
        value: 0,
        sprite: spr_icon_cursed_cheese,
        is_leaf: false,
        leaf_value: 0
    }, 
    {
        value: 1,
        sprite: spr_artifact_orb,
        is_leaf: false,
        leaf_value: 0
    }, 
    {
        value: 3,
        sprite: spr_borb,
        is_leaf: false,
        leaf_value: 0
    }, 
    {
        value: 4,
        sprite: spr_icon_cheese,
        is_leaf: false,
        leaf_value: 0
    }];
    if (!in_challenge())
    {
        array_push(leaves, 
        {
            value: 2,
            sprite: spr_resource_gem,
            is_leaf: false,
            leaf_value: 0
        });
        if (comm_leaves_available() && has_locked_items(global.community_leaves))
        {
            var comm_leaf = get_random_locked_item(global.community_leaves);
            array_push(leaves, 
            {
                value: 101,
                sprite: spr_leaf_comm_happy,
                is_leaf: false,
                leaf_value: 0,
                item: comm_leaf
            });
        }
    }
    if (get_upgrade_count(global.shops.blc.unlock_scrolls) > 0)
    {
        var scroll = array_random_item(global.scrolls_sorted);
        array_push(leaves, 
        {
            value: 100,
            sprite: scroll.sprite,
            is_leaf: false,
            leaf_value: 0,
            item: scroll
        });
    }
    if (get_upgrade_count(global.shops.blc.unlock_materials) > 0)
    {
        var slot_item = array_random_item(global.materials_spawnable);
        array_push(leaves, 
        {
            value: 103,
            sprite: slot_item.sprite,
            is_leaf: false,
            leaf_value: 0,
            item: slot_item
        });
    }
    if (get_upgrade_count(global.artifacts.zoo) == 0)
    {
        array_push(leaves, 
        {
            value: -1,
            sprite: spr_artifact_zoo,
            is_leaf: false,
            leaf_value: 0
        });
    }
    var leaves_length = array_length(leaves);
    for (var i = 0; i < (leaves_length + 2); i++)
    {
        array_push(leaves, 
        {
            value: 2000 + leaves_length,
            sprite: spr_leaf,
            is_leaf: true,
            leaf_value: 1
        });
    }
    return leaves;
}

function apply_slots_pity(arg0, arg1)
{
    var _slot_num = array_length(arg0);
    var _pity_counter = get_upgrade_attribute_value(global.upgrade_attributes.slots_pity_counter);
    if (_pity_counter > 0 && o_game.data.stats.slots.played > 0 && (o_game.data.stats.slots.played % (50 - _pity_counter)) == 0)
    {
        var _slot_item = arg0[0];
        var __array = arg0;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            arg0[__i] = _slot_item;
        }
    }
    if (get_upgrade_count(global.artifacts.zoo) == 0 && o_game.data.stats.slots.played >= 49)
    {
        var _zoo_item = undefined;
        var __array = arg1;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (mitem.value == -1)
            {
                _zoo_item = mitem;
                break;
            }
        }
        if (!is_undefined(_zoo_item))
        {
            __array = arg0;
            __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                arg0[__i] = _zoo_item;
            }
        }
    }
    return arg0;
}

function play_slots_round(arg0 = false)
{
    if (!has_enough_resources(global.costs.slots))
    {
        return undefined;
    }
    dec_resources(global.costs.slots);
    var leaves = get_slots_pool();
    var slots = [];
    var slot_num = 3;
    for (var i = 0; i < slot_num; i++)
    {
        var _slot_item = array_random_item(leaves);
        var _slot_item_copy = {};
        var _keys = variable_struct_get_names(_slot_item);
        var __array2 = _keys;
        var __prop_len2 = array_length(__array2);
        for (var __i2 = 0; __i2 < __prop_len2; __i2++)
        {
            var mitem2 = __array2[__i2];
            variable_struct_set(_slot_item_copy, mitem2, variable_struct_get(_slot_item, mitem2));
        }
        if (_slot_item_copy.is_leaf)
        {
            var r = get_random_unlocked_resource(global.resources_leaves);
            _slot_item_copy.leaf_value = r.prestige_value;
            _slot_item_copy.sprite = r.sprite;
        }
        array_push(slots, _slot_item_copy);
    }
    slots = apply_slots_pity(slots, leaves);
    var win_result = get_slots_win_result(slots, arg0);
    win_result.slots = slots;
    if (arg0)
    {
        if (win_result.win)
        {
            o_game.data.stats.slots.last_offline_win = win_result.text;
        }
        else
        {
            o_game.data.stats.slots.last_offline_win = __("No win.");
        }
    }
    return win_result;
}
