function collect_seed(arg0, arg1 = false, arg2 = 1)
{
    var seed_upgrade_value = variable_struct_get(global.upgrade_attributes.seed_value_add, arg0.key) + global.upgrade_attributes.seed_value_add_global;
    var seed_value = max(1, ceil(arg0.data.count * seed_upgrade_value));
    add_resources_cache(arg0, seed_value);
    add_resources_cache(global.resources.seeds, arg2);
    if (arg1)
    {
        return seed_value;
    }
    fx_resources_single(arg0, seed_value);
    snd_play(choose(snd_pickup_01, snd_pickup_02, snd_pickup_03));
    instance_destroy();
    return seed_value;
}
