function init_relics()
{
    global.relic_types = 
    {
        common: new Relic_Type(
        {
            level: 1,
            name: __("Common"),
            sprite: spr_relic_common,
            spawn_chance: 100
        }),
        uncommon: new Relic_Type(
        {
            level: 2,
            name: __("Uncommon"),
            sprite: spr_relic_uncommon,
            spawn_chance: 25
        }),
        rare: new Relic_Type(
        {
            level: 3,
            name: __("Rare"),
            sprite: spr_relic_rare,
            spawn_chance: 5
        }),
        epic: new Relic_Type(
        {
            level: 4,
            name: __("Epic"),
            sprite: spr_relic_epic,
            spawn_chance: 1
        }),
        mythical: new Relic_Type(
        {
            level: 5,
            name: __("Mythical"),
            sprite: spr_relic_mythical,
            spawn_chance: 0.2
        }),
        legendary: new Relic_Type(
        {
            level: 6,
            name: __("Legendary"),
            sprite: spr_relic_legendary,
            spawn_chance: 0.05
        })
    };
    add_keys_to_struct(global.relic_types);
    global.relic_types_array = struct_to_sorted_array(global.relic_types);
    global.relic_types_rarity = struct_to_sorted_array_by(global.relic_types, "level", false);
    global.relics = {};
    global.relics_rarity_array = {};
    var __struct = global.relic_types;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(global.relics_rarity_array, mkey, []);
        var __array2 = global.resources_leaves;
        var __prop_len2 = array_length(__array2);
        for (var __i2 = 0; __i2 < __prop_len2; __i2++)
        {
            var mitem2 = __array2[__i2];
            if (!mitem2.has_relic)
            {
                continue;
            }
            var relic_key = sprintf("%s_%s", mitem.key, mitem2.key);
            var relic_name = sprintf("%s %s %s", mitem.name, mitem2.name_single, __("Relic"));
            var index = (mitem.level * 10000) + mitem2.index;
            variable_struct_set(global.relics, relic_key, new Relic(
            {
                index: index,
                key: relic_key,
                name: relic_name,
                level: mitem.level,
                resource: mitem2,
                sections_key: mitem.key,
                type: mitem,
                type_key: mitem.key
            }));
            array_push(variable_struct_get(global.relics_rarity_array, mkey), variable_struct_get(global.relics, relic_key));
        }
        sort_array_by(variable_struct_get(global.relics_rarity_array, mkey), "level", false);
    }
    global.relics_array = struct_to_sorted_array(global.relics);
    global.relics_shuffled = struct_to_shuffled_array(global.relics);
    var __array = global.relic_types_array;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        variable_struct_set(global.dialog_sections.relics, mitem.key, 
        {
            name: mitem.name,
            index: __i
        });
    }
    init_master_relics();
}

function init_master_relics()
{
    global.master_relics = {};
    var __struct = global.relic_types;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(global.master_relics, mkey, new Master_Relic(
        {
            index: mitem.level,
            level: mitem.level,
            type: mitem,
            type_key: mkey
        }));
    }
    init_game_object_struct(global.master_relics);
    global.master_relics_array = struct_to_sorted_array(global.master_relics);
}

function reset_relics_transmute_count()
{
    var __array = global.relics_array;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        mitem.data.transmute_count = 0;
    }
    dec_result(global.costs.reset_relics);
}
