function save_pet_team(arg0)
{
    var team = get_pet_team_array();
    variable_struct_set(o_game.data.pet_teams, arg0, team);
    o_game.data.current_pet_team = arg0;
    notify(sprintf(__("Pet team #%s saved."), arg0 + 1));
}
