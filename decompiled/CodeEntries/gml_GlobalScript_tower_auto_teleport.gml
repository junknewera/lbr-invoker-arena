function tower_auto_teleport()
{
    var teleport_cost = 
    {
        borbs: 100
    };
    if (get_upgrade_count(global.shops.gems.free_borb_taxi) > 0 && global.game_settings.gem_upgrades_enabled)
    {
        teleport_cost = {};
    }
    if (get_upgrade_count(global.shops.silver_token.auto_restart_tower) > 0 && global.shops.silver_token.auto_restart_tower.data.toggle && has_enough_resources(teleport_cost))
    {
        dec_resources(teleport_cost);
        change_area(global.areas.tower);
    }
}
