function check_taxi(arg0 = o_game.area)
{
    var taxi_cost = get_taxi_cost(arg0);
    if (!has_enough(taxi_cost))
    {
        return false;
    }
    var can_use_taxi = false;
    switch (arg0.key)
    {
        case global.areas.inner_pyramid.key:
            can_use_taxi = get_upgrade_count(global.shops.ancient.auto_restart_pyramid) > 0 && global.shops.ancient.auto_restart_pyramid.data.toggle;
            break;
        case global.areas.leafton_pit.key:
            can_use_taxi = get_upgrade_count(global.shops.leafton.auto_restart_leafton_pit) > 0 && global.shops.leafton.auto_restart_leafton_pit.data.toggle;
            break;
        case global.areas.soul_crypt.key:
            can_use_taxi = get_upgrade_count(global.shops.soul_entities.auto_restart_crypt) > 0 && global.shops.soul_entities.auto_restart_crypt.data.toggle;
            break;
    }
    if (!can_use_taxi)
    {
        return false;
    }
    dec_result(taxi_cost);
    change_area(arg0);
    return true;
}

function get_taxi_cost(arg0 = o_game.area)
{
    var taxi_cost = {};
    switch (arg0.key)
    {
        case global.areas.inner_pyramid.key:
            taxi_cost = global.costs.borb_taxi_pyramid;
            break;
        case global.areas.soul_crypt.key:
            taxi_cost = global.costs.borb_taxi_soul_crypt;
            break;
    }
    if (get_upgrade_count(global.shops.gems.free_borb_taxi) > 0)
    {
        taxi_cost = {};
    }
    if (arg0.key == global.areas.leafton_pit.key)
    {
        taxi_cost = global.areas.leafton_pit.get_entry_cost(global.areas.leafton_pit.data.selected_floor);
    }
    return taxi_cost;
}
