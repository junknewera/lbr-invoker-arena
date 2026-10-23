function init_area_types()
{
    global.area_types = 
    {
        boss: new Area_Type(
        {
            auto_crunch_enabled: false,
            can_spawn_borbs: false,
            check_spawn_enemy: true,
            enemy_damage_player: true,
            spawn_chance_custom: 100,
            value: "Boss"
        }),
        closed: new Area_Type(
        {
            borders_closed: true,
            value: "Closed"
        }),
        def: new Area_Type(),
        dungeon: new Area_Type(
        {
            auto_crunch_enabled: false,
            can_spawn_borbs: false,
            check_spawn_enemy: true,
            count_defeated_enemies: true,
            enemy_damage_player: true,
            spawn_chance_custom: 100,
            value: "Dungeon"
        }),
        horde: new Area_Type(
        {
            auto_crunch_enabled: false,
            can_spawn_borbs: false,
            check_spawn_enemy: true,
            count_defeated_enemies: true,
            enemy_damage_player: true,
            spawn_chance_custom: 100,
            value: "Horde"
        }),
        idle: new Area_Type(
        {
            auto_crunch_enabled: false,
            can_spawn_borbs: false,
            spawn_chance_custom: 0,
            spawn_leaves: false,
            value: "Idle"
        }),
        tower: new Area_Type(
        {
            auto_crunch_enabled: false,
            can_spawn_borbs: false,
            check_spawn_enemy: true,
            count_defeated_enemies: true,
            enemy_damage_player: true,
            spawn_chance_custom: 100,
            value: "Tower"
        })
    };
    add_keys_to_struct(global.area_types);
}
