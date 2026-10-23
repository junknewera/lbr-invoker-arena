function init_banks()
{
    global.banks = {};
    var __struct = global.galaxies;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        var material = undefined;
        var resource = global.resources.soul_particles;
        if (mkey == "umbral_cluster")
        {
            material = global.materials.shadow_crystal;
            resource = undefined;
        }
        variable_struct_set(global.banks, mkey, new Bank(
        {
            key: mkey,
            index: mitem.index,
            galaxy: mitem,
            material: material,
            resource: resource
        }));
    }
    global.banks_array = struct_to_sorted_array(global.banks);
}

function check_banks()
{
    if (!is_unlocked_banks())
    {
        exit;
    }
    var __struct = global.banks;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        mitem.check();
    }
}
