function init_transmuters()
{
    global.transmuters = 
    {
        fish_trash_to_fish_credits: new Transmuter(
        {
            index: 0,
            input: 
            {
                resources: 
                {
                    fish_trash: 100
                }
            },
            output: 
            {
                resources: 
                {
                    fish_credits: 10
                }
            },
            section: "fishing"
        }),
        fish_credits_to_tide_crystal: new Transmuter(
        {
            index: 10,
            input: 
            {
                resources: 
                {
                    fish_credits: 1000
                }
            },
            output: 
            {
                materials: 
                {
                    tide_crystal: 1
                }
            },
            section: "fishing"
        }),
        tide_crystal_to_tide_crystal_advanced: new Transmuter(
        {
            index: 20,
            input: 
            {
                materials: 
                {
                    tide_crystal: 1000
                }
            },
            output: 
            {
                materials: 
                {
                    tide_crystal_advanced: 1
                }
            },
            section: "fishing"
        }),
        fish_credits_to_tide_crystal_advanced: new Transmuter(
        {
            index: 30,
            input: 
            {
                resources: 
                {
                    fish_credits: 1000000
                }
            },
            output: 
            {
                materials: 
                {
                    tide_crystal_advanced: 1
                }
            },
            reverse_ratio: 0.25,
            section: "fishing"
        }),
        coal_bar_to_coal_diamond: new Transmuter(
        {
            index: 0,
            input: 
            {
                materials: 
                {
                    bar_coal: 100
                }
            },
            output: 
            {
                resources: 
                {
                    diamond_coal: 1
                }
            },
            section: "mines"
        }),
        diamond_coal_to_diamond_shiny: new Transmuter(
        {
            index: 1,
            input: 
            {
                resources: 
                {
                    diamond_coal: 2500
                }
            },
            output: 
            {
                resources: 
                {
                    diamond_shiny: 5
                }
            },
            section: "mines"
        }),
        diamond_coal_to_fuel: new Transmuter(
        {
            index: 2,
            input: 
            {
                resources: 
                {
                    diamond_coal: 50
                }
            },
            output: 
            {
                resources: 
                {
                    fuel: 150
                }
            },
            section: "mines"
        }),
        diamond_coal_to_cts: new Transmuter(
        {
            index: 3,
            input: 
            {
                resources: 
                {
                    diamond_coal: 500
                }
            },
            output: 
            {
                resources: 
                {
                    coal_time_sphere: 1
                }
            },
            section: "mines"
        }),
        relic_fragments_to_power_fragments: new Transmuter(
        {
            index: 0,
            input: 
            {
                materials: 
                {
                    relic_fragment: 100
                }
            },
            output: 
            {
                materials: 
                {
                    power_fragment: 1
                }
            },
            section: "relics"
        }),
        shadow_essences_to_shadow_crystals: new Transmuter(
        {
            index: 0,
            input: 
            {
                materials: 
                {
                    essence_shadow: 50
                }
            },
            output: 
            {
                materials: 
                {
                    shadow_crystal: 1
                }
            },
            section: "shadow"
        }),
        shadow_crystals_to_light_rods: new Transmuter(
        {
            index: 10,
            input: 
            {
                materials: 
                {
                    shadow_crystal: 100
                }
            },
            output: 
            {
                materials: 
                {
                    light_rod: 1
                }
            },
            section: "shadow"
        })
    };
    var __struct = global.transmuters;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        var key_reverse = sprintf("%s_reverse", mkey);
        variable_struct_set(global.transmuters, key_reverse, new Transmuter(
        {
            index: mitem.index + 0.1,
            input: mitem.output,
            is_reverse: true,
            output: mitem.input,
            parent: mitem,
            reverse_ratio: mitem.reverse_ratio,
            section: mitem.section
        }));
        mitem.child = variable_struct_get(global.transmuters, key_reverse);
    }
    init_game_object_struct(global.transmuters);
    global.transmuters_array = struct_to_sorted_array(global.transmuters);
    global.transmuters_sections = {};
    global.transmuters_sections_reverse = {};
    var __array = global.transmuters_array;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (!is_array(variable_struct_get(global.transmuters_sections, mitem.section)))
        {
            variable_struct_set(global.transmuters_sections, mitem.section, []);
        }
        if (!is_array(variable_struct_get(global.transmuters_sections_reverse, mitem.section)))
        {
            variable_struct_set(global.transmuters_sections_reverse, mitem.section, []);
        }
        if (mitem.is_reverse)
        {
            array_push(variable_struct_get(global.transmuters_sections_reverse, mitem.section), mitem);
        }
        else
        {
            array_push(variable_struct_get(global.transmuters_sections, mitem.section), mitem);
        }
    }
}

function check_transmuters(arg0 = undefined)
{
    var transmuters = global.transmuters_array;
    if (is_string(arg0))
    {
        transmuters = variable_struct_get(global.transmuters_sections, arg0);
    }
    var __array = transmuters;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        mitem.check();
    }
    if (is_string(arg0))
    {
        var transmuters_reverse = variable_struct_get(global.transmuters_sections_reverse, arg0);
        __array = transmuters_reverse;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            mitem.check();
        }
    }
}
