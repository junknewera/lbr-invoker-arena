function add_resources_to_avg(arg0)
{
    _map(arg0, function(arg0, arg1)
    {
        variable_struct_set(o_game.data.stats.resources_collected_count, arg1, variable_struct_get(o_game.data.stats.resources_collected_count, arg1) + arg0);
    }, false);
}
