event_inherited();
plants = [];
plants_count = 100;
spawn_timer = sec(0.25);
refresh_surface = true;
surface = -1;
alarm[0] = sec(1);

init = function()
{
    if (!is_struct(global.season_pass) || is_undefined(struct_get_from_hash(global.season_pass.nature.data, variable_get_hash("level"))))
    {
        delay("npc_vial_init", 30, function()
        {
            with (o_npc_vial_of_life)
            {
                init();
            }
        });
        exit;
    }
    var padding = 200;
    plants_count = 50 + round((global.season_pass.nature.data.level / 100) * 3000);
    plants_count = clamp(plants_count, 50, 3000);
    refresh_surface = true;
    plants = [];
    if (is_undefined(global.vial_plants) || global.vial_plants_level != global.season_pass.nature.data.level)
    {
        var available_plants = array_filter_custom(global.resources_plants, function(arg0)
        {
            return arg0.data.collected_total > 0;
        });
        if (array_length(available_plants) == 0)
        {
            available_plants = [global.resources.plant_hyacinth];
        }
        var plants_length = array_length(available_plants);
        for (var i = 0; i < plants_count; i++)
        {
            var r = array_random_item(available_plants, plants_length);
            if (!is_struct(r))
            {
                r = global.resources.plant_hyacinth;
            }
            var _x = random_range(20, room_width - 20);
            var _y = random_range(20, room_height - 20);
            if (between(_x, (room_width / 2) - padding, (room_width / 2) + padding) && between(_y, (room_height / 2) - padding, (room_height / 2) + padding))
            {
                _x += (random_range(padding, 450) * ((_x < (room_width / 2)) ? -1 : 1));
                _y += (random_range(padding, 450) * ((_y < (room_height / 2)) ? -1 : 1));
            }
            array_push(plants, 
            {
                item: r,
                x: _x,
                y: _y,
                scale: random_range(0.5, 1.75),
                rot: random_range(-30, 30)
            });
        }
        global.vial_plants_level = global.season_pass.nature.data.level;
        global.vial_plants = plants;
    }
    else
    {
        plants = global.vial_plants;
    }
};
