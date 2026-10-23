function get_slots_win_result(arg0, arg1 = false)
{
    var _sprite = spr_solid;
    var _text = "";
    var _text_pre = "";
    var _win = true;
    var win_add_result = get_empty_result_struct();
    var win_resources = false;
    var first_val = arg0[0].value;
    var __array = arg0;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (mitem.value != first_val)
        {
            _win = false;
            break;
        }
    }
    var slot_value = arg0[0].value;
    o_game.data.stats.slots.played++;
    if (_win)
    {
        o_game.data.stats.slots.won++;
        _sprite = arg0[0].sprite;
        _text_pre = __("You won:");
        switch (slot_value)
        {
            case -1:
                var artifact = global.artifacts.zoo;
                _sprite = artifact.sprite;
                _text = artifact.name;
                artifact.collect(true);
                if (!arg1)
                {
                    gui_dialog_close();
                    fx_artifact(artifact);
                }
                break;
            case 0:
                var cursed_count = 30 + get_upgrade_attribute_value(global.upgrade_attributes.claw_curses);
                cursed_count = floor(cursed_count);
                _text = "- C U R S E D -";
                _text_pre = "";
                if (cursed_count > 1)
                {
                    _text = sprintf("- %sx - C U R S E D -", cursed_count);
                }
                o_game.data.stats.cursed_count += cursed_count;
                break;
            case 1:
                var artifact = array_random_item(global.artifacts_winnable);
                _sprite = artifact.sprite;
                _text = artifact.name;
                artifact.collect(true);
                break;
            case 2:
                win_resources = 
                {
                    gems: 10
                };
                break;
            case 3:
                win_resources = 
                {
                    borbs: 50000
                };
                break;
            case 4:
                win_resources = 
                {
                    cheese: 200
                };
                break;
            case 100:
                add_to_struct_value(win_add_result.scrolls, arg0[0].item.key, 1);
                break;
            case 101:
                add_to_struct_value(win_add_result.community_leaves, arg0[0].item.key, 1);
                break;
            case 103:
                add_to_struct_value(win_add_result.materials, arg0[0].item.key, 1);
                break;
            default:
                var offline_rewards = get_offline_rewards(random_range(300, 600), undefined, undefined, undefined, true);
                if (!is_undefined(struct_get_from_hash(offline_rewards, variable_get_hash("resources"))) && get_struct_length(offline_rewards.resources) > 0)
                {
                    var win_res_key = struct_random_key(offline_rewards.resources);
                    win_resources = {};
                    variable_struct_set(win_resources, win_res_key, variable_struct_get(offline_rewards.resources, win_res_key));
                    win_resources.cheese = 10;
                }
                break;
        }
        win_add_result.resources = win_resources;
        var res_text = add_result(win_add_result, undefined, undefined, true);
        if (_text == "")
        {
            _text = res_text;
        }
        if (is_undefined(variable_struct_get(o_game.data.stats.slots.slot_values, slot_value)))
        {
            variable_struct_set(o_game.data.stats.slots.slot_values, slot_value, 0);
        }
        variable_struct_set_post(o_game.data.stats.slots.slot_values, slot_value, variable_struct_get(o_game.data.stats.slots.slot_values, slot_value) + 1);
    }
    return 
    {
        resources: win_resources,
        slot_value: slot_value,
        sprite: _sprite,
        text: _text_pre + " " + _text,
        win: _win
    };
}
