function get_plant_field(arg0)
{
    var field_key = variable_struct_get(o_game.data.nature_season.fields, arg0);
    var field_item = is_string(field_key) ? variable_struct_get(global.resources, field_key) : undefined;
    var field_has_plant = is_struct(field_item);
    var bfly_key = variable_struct_get(o_game.data.nature_season.fields_butterflies, arg0);
    var bfly = is_string(bfly_key) ? variable_struct_get(global.resources, bfly_key) : undefined;
    var has_butterfly = is_struct(bfly);
    var field_prop = variable_struct_get(o_game.data.nature_season.field_props, arg0);
    var field = 
    {
        butterfly: bfly,
        has_butterfly: has_butterfly,
        has_plant: field_has_plant,
        key: field_key,
        index: arg0,
        item: field_item,
        prop: field_prop
    };
    return field;
}
