function add_energy(arg0, arg1 = 1)
{
    var max_energy_storage_type = get_max_energy_storage(arg0);
    arg0.data.count = bignum_add_safe(arg0.data.count, arg1);
    arg0.data.count = clamp(arg0.data.count, 0, max_energy_storage_type);
    arg0.data.collected = bignum_add_safe(arg0.data.collected, arg1);
    arg0.data.collected_total = bignum_add_safe(arg0.data.collected_total, arg1);
}
