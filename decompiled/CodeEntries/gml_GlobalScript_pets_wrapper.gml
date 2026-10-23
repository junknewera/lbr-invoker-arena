function check_pet_limits()
{
    var current_active = ds_list_size(global.active_pets);
    var max_allowed = get_max_active_pets_size();
    if (current_active > max_allowed)
    {
        var active_pets_to_sort = [];
        for (var i = 0; i < ds_list_size(global.active_pets); i++)
        {
            array_push(active_pets_to_sort, ds_list_find_value(global.active_pets, i));
        }
        array_sort(active_pets_to_sort, function(arg0, arg1)
        {
            return arg0.data.prio - arg1.data.prio;
        });
        for (var sort_idx = 0; ds_list_size(global.active_pets) > max_allowed && sort_idx < array_length(active_pets_to_sort); sort_idx++)
        {
            var pet = active_pets_to_sort[sort_idx];
            pet.deactivate(false, false);
        }
    }
    else if (current_active < max_allowed)
    {
        var pets_to_activate = [];
        var __struct = global.pets;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            if (mitem.data.active && mitem.data.count > 0)
            {
                var already_active = false;
                var __dslist2 = global.active_pets;
                var __prop_len2 = ds_list_size(__dslist2);
                for (var __i2 = 0; __i2 < __prop_len2; __i2++)
                {
                    if (is_undefined(ds_list_find_value(__dslist2, __i2)))
                    {
                        continue;
                    }
                    var mitem2 = ds_list_find_value(__dslist2, __i2);
                    if (mitem.key == mitem2.key)
                    {
                        already_active = true;
                        break;
                    }
                }
                if (!already_active)
                {
                    array_push(pets_to_activate, mitem);
                }
            }
        }
        array_sort(pets_to_activate, function(arg0, arg1)
        {
            return arg0.data.prio - arg1.data.prio;
        });
        var __array = pets_to_activate;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (ds_list_size(global.active_pets) >= max_allowed)
            {
                break;
            }
            mitem.activate(true, true);
        }
    }
}

function confirm_save_pet_team(arg0)
{
    global.selected_set_confirm = arg0;
    confirm_dialog(sprintf(__("Overwrite set #%s?"), global.selected_set_confirm + 1), function()
    {
        o_game.data.current_pet_team = global.selected_set_confirm;
        save_pet_team(global.selected_set_confirm);
        open_nav("pets", global.dialog_sections.pets.teams);
    }, undefined, undefined, undefined, function()
    {
        open_nav("pets", global.dialog_sections.pets.teams);
    });
}

function create_pets()
{
    ds_list_clear(global.active_pets);
    instance_destroy(o_pet);
    sort_pets_by_prio();
    var __array = global.pets_sorted_prio;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (!mitem.data.active)
        {
            continue;
        }
        mitem.activate(false, true);
    }
    check_pet_limits();
}

function deactivate_all_pets()
{
    var __struct = global.pets;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        mitem.deactivate();
    }
}

function get_active_pets_count()
{
    return _sum(global.pets_sorted, function(arg0)
    {
        return arg0.is_active();
    });
}

function get_max_active_pets_size()
{
    var pets = global.game_settings.pet_active_base_size + global.upgrade_attributes.max_pets;
    pets = floor(pets);
    return pets;
}

function get_pets_sets_size()
{
    return 3 + get_upgrade_attribute_value(global.upgrade_attributes.pets_sets_size);
}

function sort_pets_by_prio()
{
    array_sort(global.pets_sorted_prio, function(arg0, arg1)
    {
        return arg0.data.prio - arg1.data.prio;
    });
}

function upgrade_all_pets()
{
    var __array = global.pets_sorted;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        mitem.upgrade(mitem.get_max_upgrade_level());
    }
}
