function gui_item_resources(arg0, arg1, arg2)
{
    if (live_auto_call_1())
    {
        var lac_argc = argument_count;
        var lac_args = array_create(lac_argc);
        var lac_argk = 0;
        repeat (lac_argc)
        {
            lac_args[lac_argk] = argument[lac_argk];
            lac_argk++;
        }
        if (live_auto_call_2(lac_args))
        {
            return global.live_result;
        }
    }
    var materials = get_value_ext(arg2.instance, struct_get_from_hash(arg2, variable_get_hash("materials")), false);
    var resources = get_value_ext(arg2.instance, struct_get_from_hash(arg2, variable_get_hash("resources")), false);
    var y_height = 0;
    var current_x = arg0;
    if (!is_undefined(struct_get_from_hash(arg2, variable_get_hash("result"))))
    {
        var result = get_value_ext(arg2, arg2.result);
        materials = get_default_struct_value(result, "materials", undefined);
        materials = get_value_ext(arg2, materials);
        resources = get_default_struct_value(result, "resources", undefined);
        resources = get_value_ext(arg2, resources);
    }
    if (is_struct(resources))
    {
        y_height = max(draw_resources(current_x, arg1, resources, 1, struct_get_from_hash(arg2, variable_get_hash("resources_options"))), y_height);
        current_x += gui_col_x(4);
    }
    if (is_struct(materials))
    {
        y_height += max(draw_materials(current_x, arg1, materials, 1, struct_get_from_hash(arg2, variable_get_hash("materials_options"))), y_height);
        current_x += gui_col_x(4);
    }
    return y_height;
}
