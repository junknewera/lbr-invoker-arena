function init_chests()
{
    global.chests = 
    {
        common: new Chest(
        {
            index: 10,
            rarity_index: 1,
            name: __("Common Chest"),
            description: sprintf(__("Get offline rewards for %s random leaf resources, %s random [beer, borbs, cheese, gems] resources, %s random equipment."), 2, 1, 1),
            sprite: spr_chest_common,
            chance: 100,
            reward: [
            {
                type: "resources_leaves",
                collection: global.resources_leaves,
                count: 2,
                offline_count: 5
            }, 
            {
                type: "resources_misc",
                collection: [global.resources.beer, global.resources.cheese, global.resources.borbs, global.resources.mulch],
                count: 1
            }, 
            {
                type: "other",
                collection: [global.equipment_array],
                count: 1
            }]
        }),
        uncommon: new Chest(
        {
            index: 20,
            rarity_index: 2,
            name: __("Uncommon Chest"),
            description: sprintf(__("Get offline rewards for %s random leaf resources, %s random [beer, borbs, cheese, gems] resources, [silver/gold] tokens, %s random artifacts, %s random equipment, %s random scroll."), 4, 2, 3, 1, 1),
            sprite: spr_chest_uncommon,
            chance: 33.333,
            reward: [
            {
                type: "resources_leaves",
                collection: global.resources_leaves,
                count: 4,
                offline_count: 30
            }, 
            {
                type: "resources_misc",
                collection: [global.resources.beer, global.resources.cheese, global.resources.borbs, global.resources.mulch],
                count: 2
            }, 
            {
                type: "resources_misc",
                collection: global.resources_tower,
                count: 1
            }, 
            {
                type: "other",
                collection: [global.artifacts_winnable],
                count: 2
            }, 
            {
                type: "other",
                collection: [global.equipment_array],
                count: 3
            }, 
            {
                type: "other",
                collection: [global.scrolls_sorted],
                count: 1
            }]
        }),
        rare: new Chest(
        {
            index: 30,
            rarity_index: 3,
            name: __("Rare Chest"),
            description: sprintf(__("Get offline rewards for %s random leaf resources, %s random [beer, borbs, cheese, gems] resources, silver/gold tokens, %s random artifacts, %s random equipment, %s random scrolls."), 6, 3, 3, 5, 2),
            sprite: spr_chest_rare,
            chance: 10,
            reward: [
            {
                type: "resources_leaves",
                collection: global.resources_leaves,
                count: 6,
                offline_count: 60
            }, 
            {
                type: "resources_gem_leaves",
                collection: global.resources_gem_leaves,
                count: 1,
                offline_count: 6
            }, 
            {
                type: "resources_misc",
                collection: [global.resources.beer, global.resources.cheese, global.resources.borbs, global.resources.mulch, global.resources.gems],
                count: 3
            }, 
            {
                type: "resources_misc",
                collection: global.resources_tower,
                count: 2
            }, 
            {
                type: "other",
                collection: [global.artifacts_winnable],
                count: 3
            }, 
            {
                type: "other",
                collection: [global.equipment_array],
                count: 5
            }, 
            {
                type: "other",
                collection: [global.scrolls_sorted],
                count: 2
            }, 
            {
                type: "other",
                collection: [global.community_leaves_array],
                count: 1
            }]
        }),
        epic: new Chest(
        {
            index: 40,
            rarity_index: 4,
            name: __("Epic Chest"),
            description: sprintf(__("Get offline rewards for %s random leaf resources, %s random [beer, borbs, cheese, gems] resources, silver/gold tokens, %s random artifacts, %s random equipment, %s random scrolls."), 8, 4, 5, 10, 3),
            sprite: spr_chest_epic,
            chance: 1,
            reward: [
            {
                type: "resources_leaves",
                collection: global.resources_leaves,
                count: 8,
                offline_count: 120
            }, 
            {
                type: "resources_gem_leaves",
                collection: global.resources_gem_leaves,
                count: 2,
                offline_count: 8
            }, 
            {
                type: "resources_misc",
                collection: [global.resources.beer, global.resources.cheese, global.resources.borbs, global.resources.mulch, global.resources.gems],
                count: 4
            }, 
            {
                type: "resources_misc",
                collection: global.resources_tower,
                count: 2
            }, 
            {
                type: "other",
                collection: [global.artifacts_winnable],
                count: 5
            }, 
            {
                type: "other",
                collection: [global.equipment_array],
                count: 10
            }, 
            {
                type: "other",
                collection: [global.scrolls_sorted],
                count: 3
            }, 
            {
                type: "other",
                collection: [global.community_leaves_array],
                count: 1
            }]
        }),
        legendary: new Chest(
        {
            index: 50,
            rarity_index: 5,
            name: __("Legendary Chest"),
            description: sprintf(__("Get offline rewards for %s random leaf resources, %s random [beer, borbs, cheese, gems] resources, silver/gold tokens, %s random artifacts, %s random equipment, %s random scrolls."), 10, 4, 10, 20, 5),
            sprite: spr_chest_legendary,
            chance: 0.1,
            reward: [
            {
                type: "resources_leaves",
                collection: global.resources_leaves,
                count: 10,
                offline_count: 240
            }, 
            {
                type: "resources_gem_leaves",
                collection: global.resources_gem_leaves,
                count: 3,
                offline_count: 10
            }, 
            {
                type: "resources_misc",
                collection: [global.resources.beer, global.resources.cheese, global.resources.borbs, global.resources.mulch, global.resources.gems],
                count: 5
            }, 
            {
                type: "resources_misc",
                collection: global.resources_tower,
                count: 2
            }, 
            {
                type: "other",
                collection: [global.artifacts_winnable],
                count: 10
            }, 
            {
                type: "other",
                collection: [global.equipment_array],
                count: 20
            }, 
            {
                type: "other",
                collection: [global.scrolls_sorted],
                count: 5
            }, 
            {
                type: "other",
                collection: [global.community_leaves_array],
                count: 2
            }]
        })
    };
    add_keys_to_struct(global.chests);
    global.chests_array = struct_to_sorted_array(global.chests);
    global.chests_sorted_rarity = struct_to_sorted_array(global.chests);
    sort_array_by(global.chests_sorted_rarity, "chance", true);
}

function get_dungeon_chest(arg0)
{
    var r = random_range(0, 100);
    r /= power(1 + get_upgrade_attribute_value(global.upgrade_attributes.chest_rarity_increase), 1.5);
    var available_chests = [
    {
        min: 0,
        max: 4,
        chests: [global.chests.common, global.chests.uncommon]
    }, 
    {
        min: 5,
        max: 9,
        chests: [global.chests.common, global.chests.uncommon, global.chests.rare]
    }, 
    {
        min: 10,
        max: 14,
        chests: [global.chests.uncommon, global.chests.rare, global.chests.epic]
    }, 
    {
        min: 15,
        max: 999999,
        chests: [global.chests.rare, global.chests.epic, global.chests.legendary]
    }];
    var __array = available_chests;
    var __prop_len = array_length(__array);
    var chest_row;
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (mitem.min > arg0 || mitem.max < arg0)
        {
            continue;
        }
        chest_row = mitem;
        sort_array_by(mitem.chests, "rarity_index", false);
        var __array2 = mitem.chests;
        var __prop_len2 = array_length(__array2);
        for (var __i2 = 0; __i2 < __prop_len2; __i2++)
        {
            var mitem2 = __array2[__i2];
            if (r <= mitem2.chance)
            {
                return mitem2;
            }
        }
    }
    if (!is_undefined(chest_row))
    {
        return array_last(chest_row.chests);
    }
    return global.chests.common;
}

function get_random_chest(arg0 = global.chests_sorted_rarity)
{
    var r = random_range(0, 100);
    var __array = arg0;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (r <= mitem.chance)
        {
            return mitem;
        }
    }
    return global.chests.common;
}

function open_all_chests(arg0 = false)
{
    var result = get_empty_result_struct();
    var chests_opened = 0;
    var __struct = global.chests;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        var count = mitem.data.count;
        if (count == 0)
        {
            continue;
        }
        mitem.activate(count, false, result);
        chests_opened += count;
        mitem.data.count -= count;
    }
    var title = 
    {
        title: __("Chests")
    };
    add_result(result, "", title, arg0);
    if (arg0)
    {
        exit;
    }
    if (mp_is_season())
    {
        notify(sprintf(__("%s chests opened. Next chest(s) available in %s."), chests_opened, format_time(global.cloud_data.season_upload_delay)));
    }
    else
    {
        notify(sprintf(__("%s chests opened."), chests_opened));
    }
}
