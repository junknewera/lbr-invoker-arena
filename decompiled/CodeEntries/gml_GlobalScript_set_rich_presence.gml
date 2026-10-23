function set_rich_presence()
{
    if (steam_initialised())
    {
        var area_name_rich = o_game.area.name;
        if (o_game.area.type.key == global.area_types.tower.key || o_game.area.type.key == global.area_types.dungeon.key)
        {
            var tf = number_format(global.current_tower_floor);
            if (o_game.area.key == global.areas.inner_pyramid.key)
            {
                tf = "-" + tf;
            }
            area_name_rich = sprintf("%s - %s: %s", o_game.area.name, __("Floor"), tf);
        }
        else if (o_game.area.key == global.areas.cheese_pub.key)
        {
            var minigame_name = undefined;
            if (instance_exists(o_minigame_borb_claw_machine))
            {
                minigame_name = __("Borb Claw Machine");
            }
            else if (instance_exists(o_minigame_curse))
            {
                minigame_name = __("Curse Machine");
            }
            else if (instance_exists(o_minigame_slots))
            {
                minigame_name = __("Slots");
            }
            if (!is_undefined(minigame_name))
            {
                area_name_rich += sprintf(" - %s: %s", __("playing"), minigame_name);
            }
        }
        area_name_rich += sprintf(" - %s", o_blower.blower.name);
        steam_set_rich_presence("steam_display", "#area");
        steam_set_rich_presence("area", area_name_rich);
    }
}
