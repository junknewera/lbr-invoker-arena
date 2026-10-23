function ez_init_timers()
{
    timers = ds_map_create();
    timers_ids = ds_list_create();
}

function ez_set_timer(arg0, arg1, arg2, arg3, arg4 = true, arg5 = undefined)
{
    var timer_object = 
    {
        duration: arg1,
        destroy_on_expire: arg4,
        func: arg3,
        instance: get_default_struct_value(arg5, "instance", undefined),
        instanceid: get_default_struct_value(arg5, "instanceid", undefined),
        is_active: false,
        loop: arg2,
        props: arg5,
        timer: 0,
        timer_id: arg0
    };
    if (timer_object.is_active)
    {
        timer_object.timer = timer_object.duration;
    }
    if (ds_exists(timers, ds_type_map))
    {
        if (ds_map_exists(timers, arg0))
        {
            ds_map_replace(timers, arg0, timer_object);
        }
        else
        {
            ds_map_add(timers, arg0, timer_object);
            ds_list_add(timers_ids, arg0);
        }
    }
    return timer_object;
}

function ez_activate_timer(arg0)
{
    var t = ez_get_timer(arg0);
    if (!is_struct(t))
    {
        exit;
    }
    if (t.is_active)
    {
        exit;
    }
    t.is_active = true;
    t.timer = t.duration;
}

function ez_activate_timer_instance(arg0, arg1)
{
    if (!instance_exists(arg0))
    {
        exit;
    }
    with (arg0)
    {
        ez_activate_timer(arg1);
    }
}

function ez_deactivate_timer(arg0)
{
    var t = ez_get_timer(arg0);
    if (!is_struct(t))
    {
        exit;
    }
    t.is_active = false;
    t.timer = 0;
}

function ez_deactivate_timer_instance(arg0, arg1)
{
    if (!instance_exists(arg0))
    {
        exit;
    }
    with (arg0)
    {
        ez_deactivate_timer(arg1);
    }
}

function ez_get_timer(arg0)
{
    if (!is_string(arg0))
    {
        return false;
    }
    if (!ds_exists(timers, ds_type_map))
    {
        ez_init_timers();
        return false;
    }
    if (!ds_map_exists(timers, arg0))
    {
        return false;
    }
    return ds_map_find_value(timers, arg0);
}

function ez_process_timers()
{
    if (!ds_exists(timers, ds_type_map))
    {
        exit;
    }
    if (!ds_exists(timers_ids, ds_type_list))
    {
        exit;
    }
    for (var i = 0; i < ds_list_size(timers_ids); i++)
    {
        var t = ds_map_find_value(timers, ds_list_find_value(timers_ids, i));
        if (!is_struct(t))
        {
            continue;
        }
        if (!t.is_active)
        {
            continue;
        }
        t.timer -= global.dtf;
        if (t.timer <= 0)
        {
            if (is_callable(t.func))
            {
                if (!is_undefined(t.instance))
                {
                    if (typeof(t.instance) == "ref" && instance_exists(t.instance))
                    {
                        t.func(t.props);
                    }
                    else
                    {
                        call_method(t.instance, t.func, t.props);
                    }
                }
                else if (instance_exists(t.instanceid))
                {
                    with (t.instanceid)
                    {
                        if (t.func == instance_destroy && is_struct(struct_get_from_hash(t, variable_get_hash("props"))) && is_numeric(struct_get_from_hash(t.props, variable_get_hash("instanceid"))))
                        {
                            t.func(t.props.instanceid);
                        }
                        else
                        {
                            t.func(t.props);
                        }
                    }
                }
                else if (!is_undefined(t.instanceid))
                {
                    ez_remove_timer(t.timer_id);
                    continue;
                }
                else
                {
                    call_method(t, t.func, t.props);
                }
            }
            if (t.loop)
            {
                t.timer = t.duration;
            }
            else
            {
                t.is_active = false;
            }
            if (t.destroy_on_expire)
            {
                ez_remove_timer(t.timer_id);
            }
        }
    }
}

function ez_pause_timer(arg0)
{
    var t = ez_get_timer(arg0);
    if (!t)
    {
        exit;
    }
    t.is_active = false;
}

function ez_remove_timer(arg0)
{
    with (o_timers)
    {
        if (!ds_exists(timers, ds_type_map))
        {
            exit;
        }
        var timer_list_pos = ds_list_find_index(timers_ids, arg0);
        ds_map_delete(timers, arg0);
        ds_list_delete(timers_ids, timer_list_pos);
    }
}

function ez_remove_instance_timer(arg0)
{
    with (o_timers)
    {
        var __dslist = timers;
        var __prop_len = ds_map_size(__dslist);
        var __ds_keys = _keys(__dslist);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = ds_map_find_value(__dslist, __ds_keys[__i]);
            if (is_undefined(mitem))
            {
                continue;
            }
            if (mitem.instanceid == _id && mitem.timer_id == arg0)
            {
                ez_remove_timer(mitem.timer_id);
            }
        }
    }
}

function ez_remove_all_timers()
{
    _map(timers, function(arg0)
    {
        ez_remove_timer(arg0.timer_id);
    });
}

function ez_remove_all_instance_timers(arg0 = id)
{
    with (o_timers)
    {
        var __dslist = timers;
        var __prop_len = ds_map_size(__dslist);
        var __ds_keys = _keys(__dslist);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = ds_map_find_value(__dslist, __ds_keys[__i]);
            if (is_undefined(mitem))
            {
                continue;
            }
            if (mitem.instanceid == arg0)
            {
                ez_remove_timer(mitem.timer_id);
            }
        }
    }
}

function ez_start_timer(arg0)
{
    var t = ez_get_timer(arg0);
    if (!t)
    {
        exit;
    }
    t.is_active = true;
    t.timer = t.duration;
}

function ez_stop_timer(arg0)
{
    var t = ez_get_timer(arg0);
    if (!t)
    {
        exit;
    }
    _ez_stop_timer(t);
}

function _ez_stop_timer(arg0)
{
    arg0.is_active = false;
    arg0.timer = 0;
}

function ez_stop_all_timers()
{
    for (var i = 0; i < ds_list_size(timers_ids); i++)
    {
        var t = ds_map_find_value(timers, ds_list_find_value(timers_ids, i));
        _ez_stop_timer(t);
    }
}

function ez_stop_all_instance_timers(arg0 = id)
{
    with (o_timers)
    {
        var __dslist = timers;
        var __prop_len = ds_map_size(__dslist);
        var __ds_keys = _keys(__dslist);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = ds_map_find_value(__dslist, __ds_keys[__i]);
            if (is_undefined(mitem))
            {
                continue;
            }
            if (mitem.instanceid == arg0)
            {
                _ez_stop_timer(mitem);
            }
        }
    }
}

function ez_clean_timers()
{
    if (variable_instance_exists(id, "timers") && ds_exists(timers, ds_type_map))
    {
        ds_map_destroy(timers);
    }
    if (variable_instance_exists(id, "timers_ids") && ds_exists(timers_ids, ds_type_list))
    {
        ds_list_destroy(timers_ids);
    }
}

function ez_clean_instance_timers()
{
    with (o_timers)
    {
        if (!instance_exists(id))
        {
            exit;
        }
        if (!variable_instance_exists(id, "timers") || !ds_exists(timers, ds_type_map))
        {
            exit;
        }
        var __dslist = timers;
        var __prop_len = ds_map_size(__dslist);
        var __ds_keys = _keys(__dslist);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = ds_map_find_value(__dslist, __ds_keys[__i]);
            if (is_undefined(mitem))
            {
                continue;
            }
            if (!is_struct(mitem))
            {
                continue;
            }
            if (!is_undefined(mitem.instanceid) && !instance_exists(mitem.instanceid))
            {
                ez_remove_timer(mitem.timer_id);
            }
        }
    }
}
