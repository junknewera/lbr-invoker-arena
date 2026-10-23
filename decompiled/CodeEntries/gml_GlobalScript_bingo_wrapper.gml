function check_bingo_all_finished()
{
    var bingo_finished = true;
    for (var _y = 0; _y < 5; _y++)
    {
        for (var _x = 0; _x < 5; _x++)
        {
            var qnum = _x + (_y * 5);
            if (!check_bingo_quest(qnum))
            {
                bingo_finished = false;
                break;
            }
        }
    }
    for (var _x = 0; _x < 5; _x++)
    {
        for (var _y = 0; _y < 5; _y++)
        {
            var qnum = _x + (_y * 5);
            if (!check_bingo_quest(qnum))
            {
                bingo_finished = false;
                break;
            }
        }
    }
    for (var _x = 0; _x < 5; _x++)
    {
        var qnum = _x * 6;
        if (!check_bingo_quest(qnum))
        {
            bingo_finished = false;
            break;
        }
    }
    for (var _x = 1; _x <= 5; _x++)
    {
        var qnum = _x * 4;
        if (!check_bingo_quest(qnum))
        {
            bingo_finished = false;
            break;
        }
    }
    return bingo_finished;
}

function check_bingo_columns_finished()
{
    for (var _y = 0; _y < 5; _y++)
    {
        bingo_column = true;
        for (var _x = 0; _x < 5; _x++)
        {
            var qnum = _x + (_y * 5);
            if (!check_bingo_quest(qnum))
            {
                bingo_column = false;
                break;
            }
        }
        if (bingo_column)
        {
            return true;
        }
    }
    for (var _x = 0; _x < 5; _x++)
    {
        bingo_column = true;
        for (var _y = 0; _y < 5; _y++)
        {
            var qnum = _x + (_y * 5);
            if (!check_bingo_quest(qnum))
            {
                bingo_column = false;
                break;
            }
        }
        if (bingo_column)
        {
            return true;
        }
    }
    var bingo_column = true;
    for (var _x = 0; _x < 5; _x++)
    {
        var qnum = _x * 6;
        if (!check_bingo_quest(qnum))
        {
            bingo_column = false;
            break;
        }
    }
    if (bingo_column)
    {
        return true;
    }
    bingo_column = true;
    for (var _x = 1; _x <= 5; _x++)
    {
        var qnum = _x * 4;
        if (!check_bingo_quest(qnum))
        {
            bingo_column = false;
            break;
        }
    }
    if (bingo_column)
    {
        return true;
    }
    return false;
}

function check_bingo_quest(arg0)
{
    var qkey = sprintf("bingo_%s", iif(arg0 < 10, sprintf("0%s", arg0), arg0));
    var quest = variable_struct_get(global.bingo_quests, qkey);
    if (is_undefined(quest))
    {
        log("=== INVALID QUEST ===", qkey);
        return false;
    }
    return quest.is_finished();
}

function generate_bingo_quests(arg0)
{
    var single_quests = true;
    var available_quest_types = [];
    var __array = global.quest_types_generatable;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (mitem.min_difficulty > arg0)
        {
            continue;
        }
        array_push(available_quest_types, mitem);
    }
    var quests = array_random_items(available_quest_types, 25, false);
    __array = quests;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        var qkey = sprintf("bingo_%s", iif(__i < 10, sprintf("0%s", __i), __i));
        var qdata;
        if (__i == 12)
        {
            qdata = 
            {
                name: __("LEAF"),
                type_key: global.quest_types.freebie.key,
                stage_steps: [global.quest_types.freebie.get_random_data()]
            };
        }
        else if (single_quests)
        {
            qdata = get_random_quest_data(mitem);
        }
        else
        {
            qdata = get_random_quest_data();
        }
        qdata.key = qkey;
        qdata.questnum = __i;
        qdata.reward = undefined;
        variable_struct_set(global.globalstats.challenge_data.quests, qkey, qdata);
    }
    var __struct = global.globalstats.challenge_data.quests;
    var __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        mitem.auto_finish = true;
        mitem.auto_start = true;
    }
}

function init_bingo_challenge()
{
    global.game_settings.gem_upgrades_enabled = false;
    global.bingo_quests = {};
    var __struct = global.globalstats.challenge_data.quests;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        var q = new Quest(mitem);
        q.set_parent(mitem);
        variable_struct_set(global.bingo_quests, mitem.key, q);
    }
    __struct = global.areas;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        mitem.cost = 
        {
            cheese: 25
        };
    }
    array_push(global.areas.garden.npc, 
    {
        obj: o_npc_quests_bingo_challenge,
        _x: room_width / 2,
        _y: room_height / 2,
        text: __("Bingo Challenges"),
        xscale: 2,
        yscale: 2
    });
    change_area(global.areas.garden);
    add_to_struct_value(global.game_settings.resources_auto_collect, global.resources.cheese.key, 0.08333333333333333);
}
