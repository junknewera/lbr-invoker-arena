function init_upgrade_attributes_late()
{
    var __struct = global.artifacts;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(global.upgrade_attributes.artifact_max_count_add, mkey, 0);
    }
    __struct = global.materials;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(global.upgrade_attributes.material_max_count_single, mkey, 0);
        variable_struct_set(global.upgrade_attributes.material_spawn_chance_add_base_single, mkey, 0);
    }
    __struct = global.craft_leaf_types;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(global.upgrade_attributes.craft_leaf_type_manual, mkey, 0);
    }
    if (is_undefined(global.upgrade_attributes_start))
    {
        global.upgrade_attributes_start = struct_clone(global.upgrade_attributes);
    }
}
