function get_available_seeds(arg0 = false)
{
    var seeds = [];
    for (var i = 0; i < array_length(global.shops_sorted.farming); i++)
    {
        var seed = @@array_get@@(global.shops_sorted.farming, i);
        var resource = seed.resource;
        if (get_upgrade_count(seed) == 0 || !resource.data.unlocked || !resource.has_seeds)
        {
            continue;
        }
        array_push(seeds, seed);
    }
    if (arg0)
    {
        var res = {};
        var __array = seeds;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            variable_struct_set(res, mitem.resource.key, mitem.resource);
        }
        return res;
    }
    return seeds;
}

function get_available_seed_keys()
{
    return get_available_seeds(true);
}
