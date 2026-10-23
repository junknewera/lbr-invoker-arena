function check_soul_forge_count()
{
    var time_spent = get_default_struct_value(o_game.data.stats.areas_time, global.areas.soul_forge.key, 0);
    if (time_spent == 0)
    {
        exit;
    }
    var next_count = get_next_soul_forge_count();
    var count_inc = get_soul_forge_complete_count();
    if (global.resources.soul_empty.data.count >= next_count)
    {
        var soul_inc_count = max(1, floor(global.resources.soul_empty.data.count / next_count));
        var soul_inc_count_add = soul_inc_count * count_inc;
        dec_resources(
        {
            soul_empty: next_count * soul_inc_count
        });
        add_resources(
        {
            soul: soul_inc_count_add
        });
        o_game.data.soul_forge_counter += soul_inc_count;
    }
}

function get_next_soul_forge_count()
{
    var value = global.game_settings.soul_forge_fill_count - get_upgrade_attribute_value(global.upgrade_attributes.soul_forge_counter_decrease);
    value = max(1, value);
    return value;
}

function get_soul_forge_complete_count()
{
    var value = get_default_struct_value(global.cache, "soul_forge_complete_count", 1);
    return value;
}

function get_soul_forge_count_inc(arg0 = 1)
{
    var base_value = get_default_struct_value(global.upgrade_attributes.resources_auto_collect, "soul_empty", 0);
    var value = get_bm_value(base_value, "soul_forge_count", "soul_forge_count_multiplier", undefined, true);
    value *= (1 + get_upgrade_attribute_value(struct_get_from_hash(global.upgrade_attributes.resources_multiplier, variable_get_hash("soul_empty"))));
    value *= arg0;
    return value;
}

function get_soul_forge_upgrade_cost()
{
    var res = {};
    return res;
}

function soul_forge_inc(arg0 = 1, arg1 = false)
{
    var count_inc = get_soul_forge_count_inc(arg0);
    if (count_inc <= 0)
    {
        exit;
    }
    add_resources(
    {
        soul_empty: rround(count_inc)
    });
    var soul_leaves_before = global.resources.soul.data.count;
    check_soul_forge_count();
    var soul_leaves_after = global.resources.soul.data.count;
    if (!arg1)
    {
        exit;
    }
    return implode("\n", [sprintf("[%s]", __s("%s progression", __("Soul Forge"))), sprintf("%s: +%s", global.resources.soul_empty.name_plural, number_format(count_inc)), sprintf("%s: %s -> %s", global.resources.soul.name_plural, number_format(soul_leaves_before), number_format(soul_leaves_after))]);
}
