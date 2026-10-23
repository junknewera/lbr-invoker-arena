function save_nav_fav_resources(arg0)
{
    var set = 
    {
        resources: {},
        materials: {}
    };
    var __struct = global.resources;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (!mitem.data.fav)
        {
            continue;
        }
        variable_struct_set(set.resources, mkey, true);
    }
    __struct = global.materials;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (!mitem.data.fav)
        {
            continue;
        }
        variable_struct_set(set.materials, mkey, true);
    }
    variable_struct_set(o_game.data.nav_fav_sets, arg0, set);
}
