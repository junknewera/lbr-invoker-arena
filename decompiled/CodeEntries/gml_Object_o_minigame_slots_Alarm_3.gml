playing = false;
play_ended = true;
global.tavern_games_playing.slots = false;
slots = apply_slots_pity(slots, leaves);
win_result = get_slots_win_result(slots);
if (get_option(global.options.slots_auto_play))
{
    alarm[4] = iif(global.debug, sec(0.5), sec(2));
}
