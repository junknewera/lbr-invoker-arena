if (live_auto_call_1())
{
    var lac_argc = argument_count;
    var lac_args = array_create(lac_argc);
    var lac_argk = 0;
    repeat (lac_argc)
    {
        lac_args[lac_argk] = argument[lac_argk];
        lac_argk++;
    }
    if (live_auto_call_2(lac_args))
    {
        return global.live_result;
    }
}
event_inherited();
refresh_actions_on_click = true;
titles = 
{
    title: "?",
    subtitle: ""
};
riddle_solved = o_game.data.flags.ff_prison_solved;
if (riddle_solved)
{
    instance_destroy();
}

init_actions = function()
{
    check_solution();
    actions = [];
    if (riddle_solved)
    {
        visible = false;
        exit;
    }
    
    init_actions = function()
    {
        actions_dialog_simple(gui_item_borb_jones_prison, titles);
    };
};

check_generate_solution = function()
{
    if (o_game.data.flags.ff_prison_solution != 0)
    {
        exit;
    }
    var min_value = power(10, global.game_settings.ff_prison_length - 1);
    var max_value = power(10, global.game_settings.ff_prison_length) - 1;
    o_game.data.flags.ff_prison_solution = irandom_range(min_value, max_value);
};

check_solution = function()
{
    if (o_game.data.flags.ff_prison_solved)
    {
        exit;
    }
    if (o_game.data.stats.borbcipherer == 0)
    {
        return false;
    }
    check_generate_solution();
    var user_value = "";
    for (var i = 0; i < global.game_settings.ff_prison_length; i++)
    {
        user_value += string(get_default_struct_value(o_game.data.flags.ff_prison_values, i, "0"));
    }
    if (string(user_value) == string(o_game.data.flags.ff_prison_solution))
    {
        notify(__s("Riddle solved!"));
        o_game.data.flags.ff_prison_solved = true;
        init_actions();
        destroy_dialog();
        delay("ff_prison_solved", sec(1), function()
        {
            if (!instance_exists(o_npc_borb_jones_prison))
            {
                exit;
            }
            repeat (10)
            {
                fx_slap(o_npc_borb_jones_prison.x, o_npc_borb_jones_prison.y);
            }
            with (o_npc_borb_jones_prison)
            {
                instance_destroy();
            }
        });
    }
};

init_actions();
