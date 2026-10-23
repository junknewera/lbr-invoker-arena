function spawn_seeds(arg0)
{
    if (!arg0 && !can_spawn_seeds())
    {
        exit;
    }
    var available_seeds = get_available_seeds();
    var i = 0;
    var len = array_length(available_seeds);
    while (i < len)
    {
        var seed = available_seeds[i];
        var rr = random_range(0, 100);
        if (rr >= variable_struct_get(global.spawn_chances_seed, seed.resource.key))
        {
        }
        else
        {
            spawn_seed(seed);
        }
        i++;
    }
}
