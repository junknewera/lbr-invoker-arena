function slap(arg0 = x, arg1 = y)
{
    var enemies = get_instances_in_range(o_enemy, o_blower.blower.action_distance);
    var crit = percent_chance(get_cache("critical_slap_chance", 0) * 100);
    var __dslist = enemies;
    var __prop_len = ds_list_size(__dslist);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        if (is_undefined(ds_list_find_value(__dslist, __i)))
        {
            continue;
        }
        var mitem = ds_list_find_value(__dslist, __i);
        slap_enemy(mitem, crit);
    }
    ds_list_destroy(enemies);
    if (get_option(global.options.show_action_particles))
    {
        fx_slap(undefined, undefined, crit);
    }
}

function slap_enemy(arg0, arg1 = false)
{
    var damage = get_blower_enemy_slap_damage(arg0.enemy, arg1);
    o_game.data.stats.enemies_slapped++;
    hit_enemy(arg0, damage);
}

function pet_slap()
{
    if (instance_number(o_enemy) == 0)
    {
        exit;
    }
    if (has_bought_shop_item_safe(global.shops.gems.trouto_slap_all))
    {
        with (o_enemy)
        {
            slap_enemy(id);
        }
    }
    else
    {
        var enemy = instance_find(o_enemy, irandom(instance_number(o_enemy) - 1));
        slap_enemy(enemy);
    }
    if (get_option(global.options.show_action_particles))
    {
        var _x = 0;
        var _y = 0;
        if (instance_exists(o_pet))
        {
            _x = o_pet.x;
            _y = o_pet.y;
        }
        fx_slap(_x, _y);
    }
}
