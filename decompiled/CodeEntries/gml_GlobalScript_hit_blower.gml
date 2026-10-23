function hit_blower(arg0, arg1 = __("Unknown"), arg2 = undefined)
{
    arg0 = rround(arg0);
    arg0 = apply_max_number(arg0);
    with (o_blower)
    {
        hp -= arg0;
        hp = rround(hp);
        hp = clamp(hp, 0, hp_max);
        global.player_hp = hp;
        if (hp <= 0)
        {
            if (get_upgrade_attribute_value(global.upgrade_attributes.persistent_boss_hp_regeneration) == 0)
            {
                var __array = o_game.area.enemy;
                var __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    mitem.reset_hp();
                }
            }
            var last_area = o_game.area;
            var area_name = o_game.area.name;
            var last_tower_floor = global.current_tower_floor;
            change_area(global.areas.garden);
            hp = 1;
            global.player_hp = hp;
            if (is_struct(arg2))
            {
                arg2.data.defeat_blower_counter++;
            }
            var lose_amount = 0.25;
            var lose_resource = array_random_item(global.resources_can_lose);
            if (last_area.type.key == global.area_types.tower.key)
            {
                lose_amount = 0;
                if (get_option(global.options.show_death_dialogs) && !is_dialog_visible())
                {
                    resource_dialog(sprintf(__("You were blown away on floor %s by %s (%s damage)."), last_tower_floor, arg1, number_format(arg0, 2)), {}, "", {}, true, 
                    {
                        title: __("Blown away")
                    });
                }
                tower_auto_teleport();
                exit;
            }
            check_taxi(last_area);
            var lose_resource_val = ceil(lose_resource.data.count * lose_amount);
            if (lose_resource_val == 0)
            {
                lose_resource = global.resources.leaves;
                lose_resource_val = ceil(lose_resource.data.count * lose_amount);
            }
            var dec_resources_obj = {};
            variable_struct_set(dec_resources_obj, lose_resource.key, lose_resource_val);
            dec_resources(dec_resources_obj, true, true);
            if (get_option(global.options.show_death_dialogs) && !is_dialog_visible())
            {
                resource_dialog(sprintf(__("You escaped %s. You lost the following resources:"), area_name), dec_resources_obj, "", {}, true, 
                {
                    title: __("Blown away")
                });
            }
        }
    }
}
