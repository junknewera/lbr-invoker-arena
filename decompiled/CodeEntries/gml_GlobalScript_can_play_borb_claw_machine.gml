function can_play_borb_claw_machine()
{
    return has_enough_resources(global.costs.borb_claw_machine) && !global.tavern_games_playing.claw;
}
