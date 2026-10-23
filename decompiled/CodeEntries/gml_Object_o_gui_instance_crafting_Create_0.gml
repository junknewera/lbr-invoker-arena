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
global.tavern_games_playing.crafting = true;
autocraft = get_option(global.options.autocraft);
can_press_hotkey = false;
craft_stop_timeout = true;
crafted = false;
difficulty = 8;
ub = random(100);
ubspeed_base = 0.15;
ubspeed = ubspeed_base;
width = 0;
alarm[2] = sec(0.1);

init = function()
{
    ubspeed = ubspeed_base * (1 - (get_upgrade_attribute_value(global.upgrade_attributes.craft_ub_speed_decrease_multiplier) * 100));
    ubspeed = max(0.1, ubspeed);
    if (global.debug && keyboard_check(vk_shift))
    {
        ubspeed = 0.01;
    }
    if (autocraft)
    {
        alarm[4] = sec(get_autocraft_delay());
    }
};

init();
