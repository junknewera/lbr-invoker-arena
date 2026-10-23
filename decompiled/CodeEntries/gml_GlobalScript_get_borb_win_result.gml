function get_borb_win_result(arg0, arg1 = undefined, arg2 = false)
{
    var _sprite = spr_solid;
    var _text = "";
    var _text_pre = "";
    var count = 1;
    var win_add_result = get_empty_result_struct();
    var win_resources = false;
    if (arg0 > 0)
    {
        o_game.data.stats.borb_claw_machine.won++;
        _sprite = spr_solid;
        _text_pre = __("You won:");
        switch (arg0)
        {
            case 1:
                var cursed_count = 1 + get_upgrade_attribute_value(global.upgrade_attributes.claw_curses);
                cursed_count = floor(cursed_count);
                _sprite = spr_icon_cursed_cheese;
                _text = "- C U R S E D -";
                _text_pre = "";
                if (cursed_count > 1)
                {
                    _text = sprintf("- %sx - C U R S E D -", cursed_count);
                }
                o_game.data.stats.cursed_count += cursed_count;
                break;
            case 2:
                var artifact = array_random_item(global.artifacts_winnable);
                _sprite = artifact.sprite;
                _text = artifact.name;
                artifact.collect(true);
                if (!arg2)
                {
                    gui_dialog_close();
                    fx_artifact(artifact);
                }
                break;
            case 3:
                win_resources = 
                {
                    gems: 1
                };
                break;
            case 4:
                win_resources = 
                {
                    borbs: 100
                };
                break;
            case 5:
                win_resources = 
                {
                    cheese: 20
                };
                break;
            case 6:
                var offline_rewards = get_offline_rewards(random_range(60, 180), undefined, undefined, undefined, true);
                var win_res_key = global.resources.leaves.key;
                if (get_struct_length(offline_rewards) > 0)
                {
                    win_res_key = struct_random_key(offline_rewards.resources);
                }
                win_resources = {};
                variable_struct_set(win_resources, win_res_key, variable_struct_get(offline_rewards.resources, win_res_key));
                break;
            case 100:
                add_to_struct_value(win_add_result.scrolls, arg1.key, 1);
                break;
            case 101:
                add_to_struct_value(win_add_result.community_leaves, arg1.key, 1);
                break;
            case 102:
                add_to_struct_value(win_add_result.chests, arg1.key, 1);
                break;
            case 103:
                count = round(get_bm_value(1, "claw_materials", "claw_materials_multiplier", undefined, true));
                add_to_struct_value(win_add_result.materials, arg1.key, count);
                break;
            case 104:
                count = round(get_bm_value(1, "claw_equipment"));
                add_to_struct_value(win_add_result.equipment, arg1.key, count);
                break;
            case 10000:
                count = floor((global.enemies.boss_cursed_cheese.data.defeated + 3) / 3);
                count = max(1, count);
                win_resources = {};
                add_to_struct_value(win_resources, global.resources.borb_o_lantern.key, count);
                break;
        }
        win_add_result.resources = win_resources;
        var res_text = add_result(win_add_result, undefined, undefined, true);
        if (_text == "")
        {
            _text = res_text;
        }
        if (is_undefined(variable_struct_get(o_game.data.stats.borb_claw_machine.values, arg0)))
        {
            variable_struct_set(o_game.data.stats.borb_claw_machine.values, arg0, 0);
        }
        variable_struct_set_post(o_game.data.stats.borb_claw_machine.values, arg0, variable_struct_get(o_game.data.stats.borb_claw_machine.values, arg0) + 1);
    }
    return 
    {
        resources: win_resources,
        sprite: _sprite,
        text: _text_pre + " " + _text,
        win: arg0 > 0
    };
}
