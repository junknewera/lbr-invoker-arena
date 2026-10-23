function spawn_collectable(arg0, arg1, arg2, arg3, arg4, arg5 = {})
{
    var o = instance_create_layer(arg0, arg1, arg2, arg3);
    o.item = arg4;
    apply_struct_to_instance(arg5, o);
    if (!instance_exists(o))
    {
        exit;
    }
    with (o)
    {
        init();
    }
    return o;
}

function spawn_collectable_quick(arg0, arg1, arg2)
{
    arg0 = is_undefined(arg0) ? random_range(120, room_width - 120) : arg0;
    arg1 = is_undefined(arg1) ? random_range(120, room_height - 120) : arg1;
    var o = instance_create_layer(arg0, arg1, global.layers.equipment, arg2);
    if (!instance_exists(o))
    {
        exit;
    }
    with (o)
    {
        init();
    }
    return o;
}

function spawn_random_collectable_resource(arg0 = undefined, arg1 = undefined, arg2 = global.resources_trades, arg3 = undefined)
{
    var resource = get_random_unlocked_resource(arg2);
    if (!is_struct(resource))
    {
        exit;
    }
    var resources;
    if (!is_undefined(arg3))
    {
        resources = build_resource_cost(resource, arg3);
    }
    else
    {
        if (resource.data.collected == 0)
        {
            resource = global.resources.leaves;
        }
        resources = get_leaf_reward(resource, 100);
    }
    var o = spawn_collectable(arg0, arg1, global.layers.equipment, o_collectable_resource, resource, 
    {
        resources: resources,
        show_pickup_fx: false
    });
    o.image_speed = 0;
    return o;
}

function spawn_random_collectable_event_resource(arg0 = undefined, arg1 = undefined)
{
    var res = {};
    var res_item = undefined;
    if (is_event_active(global.events.halloween) && get_upgrade_count(global.shops.event.borb_o_digs) > 0)
    {
        res.borb_o_lantern = get_upgrade_count(global.shops.event.borb_o_digs);
        res_item = global.resources.borb_o_lantern;
    }
    if (get_struct_length(res) == 0)
    {
        exit;
    }
    var o = spawn_collectable(arg0, arg1, global.layers.equipment, o_collectable_event_resource, res_item, 
    {
        resources: res,
        show_pickup_fx: false
    });
    o.image_speed = 0;
    return o;
}

function spawn_random_anniversary_event_resource(arg0 = undefined, arg1 = undefined)
{
    var res = {};
    var res_item = undefined;
    if (is_event_active(global.events.anniversary))
    {
        var base_amount = irandom_range(1, 3);
        var dig_bonus = get_upgrade_attribute_value(global.upgrade_attributes.party_tokens_dig_bonus);
        var total_amount = base_amount + dig_bonus;
        var multiplier = 1 + get_upgrade_attribute_value(global.upgrade_attributes.resources_multiplier.party_tokens);
        res.party_tokens = total_amount * multiplier;
        res_item = global.resources.party_tokens;
    }
    if (get_struct_length(res) == 0)
    {
        exit;
    }
    var o = spawn_collectable(arg0, arg1, global.layers.equipment, o_collectable_event_resource, res_item, 
    {
        resources: res,
        show_pickup_fx: false
    });
    o.image_speed = 0;
    return o;
}
