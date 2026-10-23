function init_damage_types()
{
    var strong = global.game_settings.damage_type_strong;
    var weak = global.game_settings.damage_type_weak;
    global.damage_types = 
    {
        ancient: new Damage_Type(
        {
            name: __("Ancient"),
            resistance_types: 
            {
                ancient: strong,
                cosmic: strong,
                exotic: strong,
                gold: strong,
                ice: strong,
                lava: strong,
                platinum: strong
            }
        }),
        cosmic: new Damage_Type(
        {
            name: __("Cosmic"),
            craftable: true,
            resistance_types: 
            {
                exotic: strong,
                gold: strong,
                lava: strong,
                ice: weak,
                platinum: weak
            }
        }),
        cursed: new Damage_Type(
        {
            name: __("Cursed"),
            resistance_types: 
            {
                cursed: strong
            }
        }),
        exotic: new Damage_Type(
        {
            name: __("Exotic"),
            craftable: true,
            resistance_types: 
            {
                cosmic: weak,
                gold: weak,
                lava: weak,
                ice: strong,
                platinum: strong
            }
        }),
        gold: new Damage_Type(
        {
            name: __("Gold"),
            craftable: true,
            resistance_types: 
            {
                cosmic: weak,
                exotic: strong,
                ice: strong,
                lava: weak,
                platinum: weak
            }
        }),
        ice: new Damage_Type(
        {
            name: __("Ice"),
            craftable: true,
            resistance_types: 
            {
                cosmic: strong,
                exotic: strong,
                gold: weak,
                lava: strong,
                platinum: weak
            }
        }),
        lava: new Damage_Type(
        {
            name: __("Lava"),
            craftable: true,
            resistance_types: 
            {
                cosmic: strong,
                exotic: weak,
                gold: strong,
                ice: weak,
                platinum: strong
            }
        }),
        platinum: new Damage_Type(
        {
            name: __("Platinum"),
            craftable: true,
            resistance_types: 
            {
                cosmic: strong,
                exotic: weak,
                gold: weak,
                lava: weak,
                ice: strong
            }
        }),
        regular: new Damage_Type(
        {
            name: __("Regular")
        })
    };
    global.damage_types_environment = 
    {
        cold: 
        {
            name: __("Cold")
        },
        heat: 
        {
            name: __("Heat")
        }
    };
    add_keys_to_struct(global.damage_types_environment);
    global.damage_types_keys = get_struct_keys(global.damage_types);
    var __array = global.damage_types_keys;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (mitem == "regular")
        {
            continue;
        }
        var type_value = get_default_struct_value(variable_struct_get(global.damage_types, mitem), "default_value", weak);
        variable_struct_set(global.damage_types.regular.resistance_types, mitem, type_value);
    }
    global.damage_types.ancient.resistance_types.cursed = weak;
    var __struct = global.damage_types;
    var __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        mitem.key = mkey;
        mitem.setup_resistances();
    }
    global.damage_types_sorted = struct_to_sorted_array_by(global.damage_types, "name", true);
    global.damage_types_not_craftable = _filter(global.damage_types, function(arg0)
    {
        return !arg0.craftable;
    });
    global.damage_types_not_craftable_keys = pluck(global.damage_types_not_craftable, "key");
}
