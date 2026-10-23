if (o_game.data.nature_season.vial_charges >= 1 && instance_number(o_flower_seed) < 50)
{
    var seed_res = global.season_pass.nature.get_random_plant_seed();
    var spawn_count = global.season_pass.nature.get_vial_seed_spawn_count();
    var crit_chance = get_upgrade_attribute_value(global.upgrade_attributes.nature_vial_seed_spawn_crit_chance);
    if (percent_chance(crit_chance * 100))
    {
        spawn_count *= 2;
    }
    repeat (spawn_count)
    {
        var res = build_resource_cost(seed_res, 1);
        var o = spawn_collectable(room_width / 2, room_height / 2, global.layers.equipment, o_flower_seed, seed_res, 
        {
            persist_area: true,
            resources: res
        });
    }
    if (percent_chance(global.season_pass.nature.get_vial_clover3_spawn_chance() * 100))
    {
        var clover_res = global.resources.clover_basic3;
        spawn_collectable(room_width / 2, room_height / 2, global.layers.equipment, o_collectable_resource, clover_res, 
        {
            persist_area: true,
            resources: build_resource_cost(clover_res, 1)
        });
    }
    if (percent_chance(global.season_pass.nature.get_vial_clover4_spawn_chance() * 100))
    {
        var clover_res = global.resources.clover_basic4;
        spawn_collectable(room_width / 2, room_height / 2, global.layers.equipment, o_collectable_resource, clover_res, 
        {
            persist_area: true,
            resources: build_resource_cost(clover_res, 1)
        });
    }
    o_game.data.nature_season.vial_charges -= 1;
}
alarm[0] = spawn_timer;
