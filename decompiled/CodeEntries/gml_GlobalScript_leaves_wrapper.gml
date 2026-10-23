function create_leaf(arg0, arg1, arg2, arg3 = false)
{
    if (ds_list_size(o_game.leaves_inactive) == 0)
    {
        if (arg3)
        {
            var fo = ds_list_find_value(o_game.leaves_active, 0);
            ds_list_add(o_game.leaves_inactive, fo);
            ds_list_delete(o_game.leaves_active, ds_list_find_index(o_game.leaves_active, fo));
        }
        else
        {
            exit;
        }
    }
    var obj = o_leaf_resource;
    var o = ds_list_find_value(o_game.leaves_inactive, 0);
    ds_list_add(o_game.leaves_active, o);
    ds_list_delete(o_game.leaves_inactive, 0);
    instance_activate_object(o);
    o.x = arg0;
    o.y = arg1;
    o.sprite_index = arg2.sprite;
    o.speed = 1 + random(3);
    o.direction = random(360);
    with (o)
    {
        event_perform(ev_create, 0);
    }
    o.type = arg2;
    with (o)
    {
        init();
    }
}

function destroy_leaves()
{
    var len = ds_list_size(o_game.leaves_active);
    repeat (len)
    {
        destroy_leaf(ds_list_find_value(o_game.leaves_active, 0));
    }
    instance_destroy(o_leaf_community);
    instance_destroy(o_leaf_unique);
}

function destroy_leaf(arg0 = id)
{
    var destroy_leaf_index = ds_list_find_index(o_game.leaves_active, arg0);
    if (destroy_leaf_index == -1)
    {
        instance_destroy();
        exit;
    }
    ds_list_add(o_game.leaves_inactive, arg0);
    ds_list_delete(o_game.leaves_active, destroy_leaf_index);
    instance_deactivate_object_hook(arg0);
    if (instance_exists(o_artifact_wind))
    {
        spawn_leaf_queue();
    }
}

function spawn_leaf()
{
    if (!can_spawn_leaves())
    {
        exit;
    }
    var len = array_length(o_game.area.resources_sorted);
    for (var i = 0; i < len; i++)
    {
        var resource = o_game.area.resources_sorted[i];
        if (!resource.data.unlocked)
        {
            continue;
        }
        var rr = random_range(0, 100);
        if (rr >= variable_struct_get(global.spawn_chances, resource.key))
        {
            continue;
        }
        var _x = random_range(20, room_width - 20);
        var _y = random_range(20, room_height - 20);
        if (instance_exists(o_enemy) && position_meeting(_x, _y, o_enemy))
        {
            _x += ((o_enemy.sprite_width + irandom_range(100, 300)) * choose(1, -1));
            _y += ((o_enemy.sprite_height + irandom_range(100, 300)) * choose(1, -1));
        }
        create_leaf(_x, _y, resource);
    }
}

function spawn_leaf_queue()
{
    o_game.leaves_spawn_queue++;
}

function spawn_leaves(arg0)
{
    repeat (arg0)
    {
        spawn_leaf();
    }
    check_spawn_comm_leaf();
}
