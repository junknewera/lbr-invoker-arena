function tower_set_floor(arg0)
{
    global.areas.tower.set_floor(floor(arg0));
    var max_floor = floor(global.areas.tower.get_max_floor());
    instance_destroy(o_enemy);
    if (global.current_tower_floor > max_floor)
    {
        if (global.areas.tower.data.highest_floor == 101 && !o_game.data.tower_floor_peak_flag)
        {
            change_area(global.areas.garden);
            o_game.data.tower_floor_peak_flag = true;
            text_dialog(__("Evil Bob was finally defeated! A shiny, green portal has appeared. I wonder where it leads to..."));
        }
        else
        {
            if (get_upgrade_count(global.shops.silver_token.auto_restart_tower_peak) > 0 && global.shops.silver_token.auto_restart_tower_peak.data.toggle)
            {
                change_area(global.areas.tower);
                exit;
            }
            change_area(global.areas.garden);
            text_dialog(__("You have reached the peak of the tower. Have you really...?"));
        }
    }
}
