function init_leafscenders()
{
    global.leafscenders = {};
    global.leafscenders_level = {};
    global.leafscenders_array = [];
    for (var level = 1; level <= global.game_settings.leafscend_max_level; level++)
    {
        var section_key = sprintf("%s_%s", "level", level);
        variable_struct_set(global.dialog_sections.leafscension, section_key, 
        {
            name: sprintf(__("Level %s"), level),
            index: level
        });
        variable_struct_set(global.leafscenders, level, {});
        variable_struct_set(global.leafscenders_level, level, []);
        var __array = global.resources_leaves;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (!mitem.has_relic)
            {
                continue;
            }
            var index = (level * 10000) + mitem.index;
            var leafscender = new Leafscender(
            {
                index: index,
                key: mitem.key,
                level: level,
                resource: mitem,
                section: variable_struct_get(global.dialog_sections.leafscension, section_key)
            });
            variable_struct_set(variable_struct_get(global.leafscenders, level), mitem.key, leafscender);
            array_push(variable_struct_get(global.leafscenders_level, level), leafscender);
            array_push(global.leafscenders_array, leafscender);
        }
    }
    global.leafscenders_array_shuffled = _clone_array(global.leafscenders_array);
    array_shuffle(global.leafscenders_array_shuffled);
}
