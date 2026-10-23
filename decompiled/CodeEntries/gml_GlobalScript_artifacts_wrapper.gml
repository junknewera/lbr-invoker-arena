function can_place_mirror()
{
    if (instance_exists(o_artifact_mirror))
    {
        return false;
    }
    if (!instance_exists(o_blower))
    {
        return false;
    }
    if (global.artifacts.mirror.data.count <= 0)
    {
        return false;
    }
    if (get_struct_length(o_game.data.mirrors) >= get_max_mirrors())
    {
        return false;
    }
    return true;
}

function can_spawn_artifact()
{
    if (!is_unlocked_artifacts())
    {
        return false;
    }
    return instance_number(o_artifact) == 0;
}

function check_artifacts()
{
    var artifact_autouse_timer_delay = get_artifact_autouse_timer_delay();
    artifact_autouse_timer++;
    if (artifact_autouse_timer < artifact_autouse_timer_delay)
    {
        exit;
    }
    artifact_autouse_timer = 0;
    if (get_upgrade_count(global.shops.mlc.auto_use_artifacts) == 0 || !global.shops.mlc.auto_use_artifacts.data.toggle)
    {
        exit;
    }
    var __struct = global.artifacts;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (has_timeout(mitem.destroy_time_key))
        {
            continue;
        }
        mitem.check();
    }
}

function check_mirrors()
{
    check_transmuters("relics");
    var mirror_time_duration = get_mirror_collect_duration();
    o_game.data.mirror_timer += 1;
    if (o_game.data.mirror_timer < mirror_time_duration)
    {
        exit;
    }
    o_game.data.mirror_timer -= mirror_time_duration;
    var has_material_upgrade = has_bought_shop_item_safe(global.shops.energy_electrical.mirror_enable_materials);
    var has_relic_fragments_upgrade = has_bought_shop_item_safe(global.shops.energy_electrical.mirror_drop_relic_fragments);
    var mirror_efficiency = get_mirror_efficiency();
    var relic_fragments_drop_chance = get_mirror_relic_fragment_drop_chance();
    var relic_fragments_drop_count = get_mirror_relic_fragment_drop_count();
    var mats_total = {};
    var res_total = {};
    var __struct = o_game.data.mirrors;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        var area = variable_struct_get(global.areas, mitem.area_key);
        if (!is_struct(area) || !area.check())
        {
            continue;
        }
        var resources = area.get_mirror_resources();
        multiply_struct_values_ref(resources, mirror_efficiency, true, 1);
        add_struct_to_struct(res_total, resources);
        if (has_material_upgrade)
        {
            var materials = area.get_mirror_materials();
            multiply_struct_values_ref(materials, mirror_efficiency * 5, true, 1);
            add_struct_to_struct(mats_total, materials);
        }
        if (has_relic_fragments_upgrade && percent_chance(relic_fragments_drop_chance * 100))
        {
            add_to_struct_value(mats_total, global.materials.relic_fragment.key, relic_fragments_drop_count);
        }
    }
    add_resources(res_total);
    add_materials(mats_total);
    set_cache("last_mirror_resources", res_total);
    set_cache("last_mirror_materials", mats_total);
}

function check_spawn_artifacts()
{
    if (!can_spawn_artifact())
    {
        exit;
    }
    var __struct = global.artifacts;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (!mitem.check_spawn())
        {
            continue;
        }
        mitem.spawn();
    }
}

function get_artifact_autouse_timer_delay()
{
    var timer = global.game_settings.artifact_autouse_timer_delay;
    timer *= (1 - get_upgrade_attribute_value(global.upgrade_attributes.artifact_autouse_timer_delay_reduction_multiplier));
    timer = max(1, timer);
    return timer;
}

function get_droppable_artifacts()
{
    var drop_array = [];
    var __array = global.artifacts_winnable;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (mitem.data.collected == 0)
        {
            continue;
        }
        array_push(drop_array, mitem);
    }
    return drop_array;
}

function get_leafscension_exploit_max_level()
{
    var level = 1 + floor(global.enemies.boss_cursed_cheese.data.defeated / 25);
    level = clamp(level, 1, 6);
    return level;
}

function get_max_mirrors()
{
    var value = get_bm_value(1, "max_mirrors");
    return value;
}

function get_mirror_collect_duration()
{
    var value = 60;
    if (global.debug)
    {
        value = 5;
    }
    return value;
}

function get_mirror_collect_material_count()
{
    var value = get_bm_value(10, "mirror_material_collect_count", "mirror_material_collect_count_multiplier", undefined, true);
    return value;
}

function get_mirror_efficiency()
{
    var value = get_bm_value(0.1, "mirror_efficiency");
    return value;
}

function get_mirror_relic_fragment_drop_chance()
{
    var value = get_bm_value(0.01, "mirror_drop_relic_fragments_chance");
    return value;
}

function get_mirror_relic_fragment_drop_count()
{
    var value = get_bm_value(1, "mirror_drop_relic_fragments_count");
    return value;
}

function get_random_droppable_artifact()
{
    var artifacts = get_droppable_artifacts();
    var artifact = array_random_item(artifacts);
    return artifact;
}

function load_mirror(arg0)
{
    instance_create_layer(arg0.x, arg0.y, global.layers.sub_items, o_artifact_mirror);
}

function place_mirror()
{
    var mirror = 
    {
        area_key: o_game.area.key,
        x: o_blower.x,
        y: o_blower.y
    };
    variable_struct_set(o_game.data.mirrors, o_game.area.key, mirror);
    load_mirror(mirror);
}

function spawn_artifact_wind()
{
    var _x = room_width / 2;
    var _y = room_height / 2;
    var o = instance_create_layer(_x, _y, global.layers.fruits, o_artifact_wind);
    with (o)
    {
        init();
    }
}

function spawn_random_artifact(arg0 = undefined, arg1 = undefined)
{
    var artifact = get_random_droppable_artifact();
    if (!is_struct(artifact))
    {
        exit;
    }
    return artifact.spawn(arg0, arg1);
}

function transmute_all_leafscended_leaves_to_power_fragments()
{
    var transmuted_count = 0;
    var pf_before = global.materials.power_fragment.data.count;
    var t_count = get_option(global.options.relics_transmute_all_count);
    var t_type = get_option(global.options.relics_transmute_all_rarity);
    var t_func = "transmute_power_fragments";
    if (t_count == "max")
    {
        t_func = "transmute_power_fragments_max";
    }
    if (t_type == "all")
    {
        var __array = global.relics_array;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            transmuted_count += variable_struct_get(mitem, t_func)();
        }
    }
    else
    {
        var rarity_key = get_default_struct_value(global.selected_inventory_item, "transmute_relics_rarity_key", "common");
        var __array = variable_struct_get(global.relics_rarity_array, rarity_key);
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            transmuted_count += variable_struct_get(mitem, t_func)();
        }
    }
    var pf_gain = global.materials.power_fragment.data.count - pf_before;
    var pf_text = sprintf("%s %s", number_format(pf_gain), pluralize(pf_gain, global.materials.power_fragment.name, global.materials.power_fragment.name_plural));
    notify(__s("%s transmuted for %s.", transmuted_count, pf_text));
}
