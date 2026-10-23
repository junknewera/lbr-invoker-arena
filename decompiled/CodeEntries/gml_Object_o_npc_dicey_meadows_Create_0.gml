event_inherited();
max_instances = 20;

custom_func = function()
{
    open_nav("dice");
};

can_spawn_dice = function()
{
    return charges >= 1 && instance_number(o_die) < max_instances;
};

set_dice_vars = function()
{
    drop_delay = get_dice_drop_delay();
    max_charges = get_dice_drop_charges();
    var min_drop_timer_value = o_game.data.stats.time_elapsed - (drop_delay * max_charges);
    if (o_game.data.dice.drop_timer < min_drop_timer_value)
    {
        o_game.data.dice.drop_timer = min(o_game.data.stats.time_elapsed, min_drop_timer_value);
    }
    charges = min((o_game.data.stats.time_elapsed - o_game.data.dice.drop_timer) / drop_delay, max_charges);
};

set_dice_vars();
spawn_timer = sec(1);
alarm[0] = spawn_timer;
