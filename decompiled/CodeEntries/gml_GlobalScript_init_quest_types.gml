function init_quest_types()
{
    global.quest_types = 
    {
        area_time: new Quest_Type(
        {
            name: __("Area Time"),
            compare_with_start_value: true,
            include_in_daily_quests: true
        }),
        blow_leaves: new Quest_Type(
        {
            name: __("Blow Leaves"),
            compare_with_start_value: true,
            include_in_daily_quests: true
        }),
        borbventures_finished: new Quest_Type(
        {
            name: __("Borbventures"),
            description: __("Finish Borbventures"),
            compare_with_start_value: true,
            include_in_daily_quests: true,
            quest_value_min: 5
        }),
        collect_artifacts: new Quest_Type(
        {
            name: __("Collect Artifacts")
        }),
        collect_fruits: new Quest_Type(
        {
            name: __("FRUITS"),
            tracker: global.resources.fruits
        }),
        collect_seeds: new Quest_Type(
        {
            name: __("SEEDS"),
            tracker: global.resources.seeds
        }),
        combo_high: new Quest_Type(
        {
            name: __("Combo High")
        }),
        convert_crits: new Quest_Type(
        {
            name: __("Converter Crits")
        }),
        convert_loops: new Quest_Type(
        {
            name: __("Converter Loops")
        }),
        craft_leaves: new Quest_Type(
        {
            name: __("Craft Leaves")
        }),
        curses: new Quest_Type(
        {
            name: __("Curses"),
            compare_with_start_value: true,
            include_in_daily_quests: true
        }),
        dig: new Quest_Type(
        {
            name: __("Dig"),
            description: __("Dig"),
            compare_with_start_value: true,
            include_in_daily_quests: true,
            quest_value_min: 10
        }),
        enemies_defeated: new Quest_Type(
        {
            name: __("Enemies")
        }),
        freebie: new Quest_Type(
        {
            name: __("Freebie"),
            generatable: false
        }),
        get_artifact: new Quest_Type(
        {
            name: __("Get Artifact")
        }),
        get_unique_leaf: new Quest_Type(
        {
            name: __("Get Unique Leaf")
        }),
        have_clovers: new Quest_Type(
        {
            name: __("Have Clovers"),
            display_resources: true,
            generatable: false
        }),
        have_materials: new Quest_Type(
        {
            name: __("Have Materials"),
            display_materials: true
        }),
        have_printers: new Quest_Type(
        {
            name: __("Have Printers")
        }),
        have_resources: new Quest_Type(
        {
            name: __("Have Resources"),
            display_resources: true
        }),
        mine_veins: new Quest_Type(
        {
            name: __("Vein Miner"),
            description: __("Mine veins"),
            compare_with_start_value: true,
            include_in_daily_quests: true,
            quest_value_min: 5
        }),
        petpet: new Quest_Type(
        {
            name: __("Pet"),
            description: __("Pet pets"),
            compare_with_start_value: true,
            include_in_daily_quests: true,
            quest_value_min: 15
        }),
        prestige_prestige: new Quest_Type(
        {
            name: __("Prestiges")
        }),
        prestige_crunch: new Quest_Type(
        {
            name: __("Big Leaf Crunches")
        }),
        prestige_mlc: new Quest_Type(
        {
            name: __("Mega Leaf Crunches"),
            min_difficulty: 3
        }),
        print_leaves: new Quest_Type(
        {
            name: __("Print Leaves")
        }),
        print_leaf_type: new Quest_Type(
        {
            name: __("Print Leaves")
        }),
        pyramid_floor: new Quest_Type(
        {
            name: __("Pyramid Floor"),
            min_difficulty: 3
        }),
        tower_floor: new Quest_Type(
        {
            name: __("Tower Floor")
        }),
        trades: new Quest_Type(
        {
            name: __("Trades"),
            description: __("Finish trades"),
            compare_with_start_value: true,
            include_in_daily_quests: true,
            quest_value_min: 5
        }),
        unlock_area: new Quest_Type(
        {
            name: __("Unlock Area")
        }),
        unlock_pet: new Quest_Type(
        {
            name: __("Unlock Pet")
        }),
        win_claw: new Quest_Type(
        {
            name: __("Borb Claw Machine"),
            description: __("Win at the Borb Claw Machine"),
            compare_with_start_value: true,
            include_in_daily_quests: true,
            quest_value_min: 6
        }),
        win_slots: new Quest_Type(
        {
            name: __("Slots"),
            description: __("Win at the Slots Machine"),
            compare_with_start_value: true,
            include_in_daily_quests: true,
            quest_value_min: 3
        })
    };
    add_keys_to_struct(global.quest_types);
    global.quest_types_array = [];
    global.quest_types_daily = [];
    global.quest_types_generatable = [];
    var __struct = global.quest_types;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        array_push(global.quest_types_array, mitem);
        if (mitem.generatable)
        {
            array_push(global.quest_types_generatable, mitem);
        }
        if (mitem.include_in_daily_quests)
        {
            array_push(global.quest_types_daily, mitem);
        }
    }
    global.quest_types_shuffled = [];
    array_copy(global.quest_types_shuffled, 0, global.quest_types_array, 0, array_length(global.quest_types_array));
    global.quest_available_areas = array_filter_custom(global.areas_array, "is_generatable_in_quests");
}

function check_quests()
{
    var daily_data = get_daily_data_today();
    if (is_undefined(struct_get_from_hash(daily_data.data, variable_get_hash("quests"))))
    {
        generate_daily_quests(true);
    }
    var __array = global.active_quests;
    var __prop_len = array_length(__array);
    var __i = __prop_len - 1;
    while (__i >= 0)
    {
        var mitem = __array[__i];
        var __ireal = __prop_len - 1 - __i;
        if (mitem.is_active())
        {
            mitem.check_stage();
        }
        __i--;
    }
}

function create_quests_from_requirements(arg0 = [])
{
    var quest_array = [];
    if (!is_array(arg0))
    {
        return quest_array;
    }
    var __array = arg0;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        var type = variable_struct_get(global.quest_types, mitem.key);
        if (!is_struct(type))
        {
            log("invalid quest type", mitem.key);
        }
        else
        {
            var quests = [new Quest_Type(
            {
                key: type.key,
                stage_steps: [mitem]
            })];
            var quest_row = new Quest(
            {
                type_key: type.key,
                quests: quests,
                repeatable: false,
                stage_steps: [mitem]
            });
            array_push(quest_array, quest_row);
        }
    }
    return quest_array;
}

function get_quest_description(arg0)
{
    var desc = "";
    try
    {
        var quest_value = 0;
        if (is_numeric(struct_get_from_hash(arg0, variable_get_hash("count"))))
        {
            quest_value = arg0.count;
        }
        switch (arg0.key)
        {
            case global.quest_types.area_time.key:
                desc += sprintf("%s: %s", __s("Spend time at %s", variable_struct_get(global.areas, arg0.item_key).name), format_time(quest_value, undefined, true, 0));
                break;
            case global.quest_types.blow_leaves.key:
                desc += __s("Blow %s leaves", number_format(quest_value));
                break;
            case global.quest_types.collect_artifacts.key:
                desc += __s("Collect %s Artifacts", number_format(quest_value));
                break;
            case global.quest_types.collect_fruits.key:
                desc += __s("Collect %s fruits", number_format(quest_value));
                break;
            case global.quest_types.collect_seeds.key:
                desc += __s("Collect %s seeds", number_format(quest_value));
                break;
            case global.quest_types.combo_high.key:
                desc += __s("Combo: %s", number_format(quest_value));
                break;
            case global.quest_types.convert_crits.key:
                desc += __s("Convert %s crits", number_format(quest_value));
                break;
            case global.quest_types.convert_loops.key:
                desc += __s("Convert %s loops", number_format(quest_value));
                break;
            case global.quest_types.craft_leaves.key:
                desc += __s("Craft %s leaves", number_format(quest_value));
                break;
            case global.quest_types.curses.key:
                desc += __s("Get Cursed %sx", number_format(quest_value));
                break;
            case global.quest_types.enemies_defeated.key:
                desc += __s("Defeat %s enemies", number_format(quest_value));
                break;
            case global.quest_types.freebie.key:
                desc += __("LEAF");
                break;
            case global.quest_types.get_artifact.key:
                desc += __s("Obtain %s", variable_struct_get(global.artifacts, arg0.item_key).name);
                break;
            case global.quest_types.get_unique_leaf.key:
                desc += __s("Obtain %s", variable_struct_get(global.unique_leaves, arg0.item_key).name);
                break;
            case global.quest_types.have_clovers.key:
                desc += __s("Obtain %s", format_resources_text(arg0.resources));
                break;
            case global.quest_types.have_materials.key:
                desc += __s("Obtain %s", format_materials_text(arg0.materials));
                break;
            case global.quest_types.have_printers.key:
                desc += __s("Have %s printers", number_format(quest_value));
                break;
            case global.quest_types.have_resources.key:
                desc += __s("Obtain %s", format_resources_text(arg0.resources));
                break;
            case global.quest_types.prestige_prestige.key:
                desc += __s("Prestige %sx", number_format(quest_value));
                break;
            case global.quest_types.prestige_crunch.key:
                desc += __s("Big Leaf Crunch %sx", number_format(quest_value));
                break;
            case global.quest_types.prestige_mlc.key:
                desc += __s("Mega Leaf Crunch %sx", quest_value);
                break;
            case global.quest_types.print_leaf_type.key:
                desc += __s("Print %s %s", quest_value, variable_struct_get(global.resources, arg0.item_key).name_plural);
                break;
            case global.quest_types.print_leaves.key:
                desc += __s("Print %s loops", quest_value);
                break;
            case global.quest_types.pyramid_floor.key:
                desc += __s("Clear Pyramid floor %s", quest_value);
                break;
            case global.quest_types.tower_floor.key:
                desc += __s("Reach Tower floor %s", quest_value);
                break;
            case global.quest_types.unlock_area.key:
                desc += __s("Unlock %s", variable_struct_get(global.areas, arg0.item_key).name);
                break;
            case global.quest_types.unlock_pet.key:
                desc += __s("Unlock %s", variable_struct_get(global.pets, arg0.item_key).name);
                break;
        }
    }
    catch (e)
    {
    }
    return desc;
}

function get_random_quest_data(arg0 = array_random_item(global.quest_types_generatable))
{
    var quest_data = 
    {
        name: arg0.get_name(),
        reward: 
        {
            cheese: 10
        },
        stage_steps: [arg0.get_random_data()],
        type_key: arg0.key
    };
    return quest_data;
}
