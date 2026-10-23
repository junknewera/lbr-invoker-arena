function init_dig_items()
{
    global.dig_items = [
    {
        key: "artifacts",
        name: __("Artifacts"),
        check: [can_spawn_artifact],
        dig_level: 2,
        chance: 0.2,
        
        spawn: function(arg0, arg1)
        {
            return spawn_random_artifact(arg0, arg1);
        }
    }, 
    {
        key: "borbs",
        name: __("Borbs"),
        
        check: function()
        {
            return o_game.area._can_spawn_borbs();
        },
        
        dig_level: 2,
        chance: 2,
        
        spawn: function(arg0, arg1)
        {
            return spawn_borb(arg0, arg1);
        }
    }, 
    {
        key: "cheese",
        name: __("Cheese"),
        check: [is_current_area, global.areas.moon],
        dig_level: 2,
        chance: 2,
        
        spawn: function(arg0, arg1)
        {
            return spawn_random_collectable_resource(arg0, arg1, [global.resources.cheese], irandom_range(1, 3));
        }
    }, 
    {
        key: "curses",
        name: __("Curses"),
        check: [__return_true],
        dig_level: 3,
        chance: 0.2,
        
        spawn: function(arg0, arg1)
        {
            o_game.data.stats.cursed_count++;
            notify(__("- C U R S E D -"));
        }
    }, 
    {
        key: "community_leaves",
        name: __("Community Leaves"),
        check: [can_spawn_comm_leaf],
        dig_level: 2,
        chance: 0.01,
        
        spawn: function(arg0, arg1)
        {
            return spawn_random_comm_leaf(arg0, arg1);
        }
    }, 
    {
        key: "equipment",
        name: __("Equipment Items"),
        check: [can_dig_equipment],
        dig_level: 2,
        chance: 0.5,
        
        spawn: function(arg0, arg1)
        {
            return drop_random_equipment(arg0, arg1);
        }
    }, 
    {
        key: "fruits",
        name: __("Fruits"),
        check: [can_spawn_fruit],
        dig_level: 1,
        chance: 15,
        
        spawn: function(arg0, arg1)
        {
            return spawn_fruit(arg0, arg1);
        }
    }, 
    {
        key: "materials",
        name: __("Materials"),
        check: [can_spawn_material],
        dig_level: 2,
        chance: 0.75,
        
        spawn: function(arg0, arg1)
        {
            return spawn_random_material(undefined, arg0, arg1);
        }
    }, 
    {
        key: "resources",
        name: __("Resources"),
        check: [can_spawn_resource],
        dig_level: 1,
        chance: 95,
        
        spawn: function(arg0, arg1)
        {
            return spawn_random_collectable_resource(arg0, arg1);
        }
    }, 
    {
        key: "resources_cursed_halloween",
        name: "",
        check: [can_spawn_halloween_event_resource],
        dig_level: 1,
        chance: 2,
        
        spawn: function(arg0, arg1)
        {
            return spawn_random_collectable_event_resource(arg0, arg1);
        }
    }, 
    {
        key: "resources_soul",
        name: "",
        check: [can_spawn_soul_resource],
        dig_level: 4,
        chance: 0.5,
        
        spawn: function(arg0, arg1)
        {
            return spawn_random_collectable_resource(arg0, arg1, [global.resources.soul_particles], 1);
        }
    }, 
    {
        key: "scrolls",
        name: __("Scrolls"),
        check: [can_drop_scroll],
        dig_level: 2,
        chance: 0.1,
        
        spawn: function(arg0, arg1)
        {
            return drop_random_scroll(arg0, arg1);
        }
    }, 
    {
        key: "seeds",
        name: __("Seeds"),
        check: [can_spawn_seeds],
        dig_level: 1,
        chance: 1,
        
        spawn: function(arg0, arg1)
        {
            return spawn_random_seed(arg0, arg1);
        }
    }];
}

function can_dig_equipment()
{
    return is_unlocked_equipment() && can_spawn_equipment();
}

function can_dig_items()
{
    if (!o_game.area.can_dig || !global.game_settings.dig_enabled)
    {
        return false;
    }
    return true;
}

function can_spawn_soul_resource()
{
    if (!can_spawn_resource())
    {
        return false;
    }
    return global.areas.soul_crypt.check();
}

function dig_ground()
{
    if (!can_dig_items())
    {
        return false;
    }
    var count = (o_blower.blower.get_dig_count() + get_upgrade_attribute_value(global.upgrade_attributes.dig_count)) * (1 + get_upgrade_attribute_value(global.upgrade_attributes.dig_count_multiplier));
    o_game.data.stats.digs++;
    o_blower.can_blow_tmp = true;
    delay("blower_can_blow_tmp", sec(0.1), function()
    {
        if (!instance_exists(o_blower))
        {
            exit;
        }
        o_blower.can_blow_tmp = false;
    });
    var dig_items_visible = get_option(global.options.draw_dig_items);
    repeat (count)
    {
        var __array = global.dig_items;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            var r = random(100);
            r *= (1 - get_upgrade_attribute_value(global.upgrade_attributes.dig_item_chance_reduction));
            if (r > mitem.chance || o_blower.blower.dig_level < mitem.dig_level || !get_value_ext(mitem, mitem.check))
            {
                continue;
            }
            var pos = get_random_position_around_instance(o_blower);
            o_game.data.stats.digs_items_count++;
            add_to_struct_value(o_game.data.stats.digs_items, mitem.key, 1);
            var instance = mitem.spawn(pos.x, pos.y);
            if (!is_undefined(instance) && instance_exists(instance))
            {
                instance.direction = point_direction(o_blower.x, o_blower.y, pos.x, pos.y);
                instance.visible = dig_items_visible;
                instance.can_draw = dig_items_visible;
                if (get_upgrade_attribute_value(global.upgrade_attributes.dig_auto) > 0)
                {
                    instance.player_has_magnet = true;
                }
            }
        }
    }
    if (get_option(global.options.show_action_particles))
    {
        fx_dig();
    }
}
