function load_nav_fav_resources(arg0)
{
    var __struct = global.resources;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        mitem.data.fav = false;
    }
    __struct = global.materials;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        mitem.data.fav = false;
    }
    var set = variable_struct_get(o_game.data.nav_fav_sets, arg0);
    if (!is_struct(set))
    {
        exit;
    }
    if (!is_struct(struct_get_from_hash(set, variable_get_hash("resources"))))
    {
        set = 
        {
            resources: set,
            materials: {}
        };
    }
    __struct = set.resources;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        var res = variable_struct_get(global.resources, mkey);
        if (!is_struct(res))
        {
            continue;
        }
        res.data.fav = true;
    }
    __struct = set.materials;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        var res = variable_struct_get(global.materials, mkey);
        if (!is_struct(res))
        {
            continue;
        }
        res.data.fav = true;
    }
}
