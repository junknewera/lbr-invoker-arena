function spawn_random_seed(arg0 = undefined, arg1 = undefined)
{
    if (!can_spawn_seeds())
    {
        exit;
    }
    var seeds = get_available_seeds();
    if (array_length(seeds) == 0)
    {
        exit;
    }
    var seed = array_random_item(seeds);
    return spawn_seed(seed);
}
