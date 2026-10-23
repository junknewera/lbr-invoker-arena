function Area_Type(arg0 = undefined) constructor
{
    auto_crunch_enabled = true;
    borders_closed = false;
    self.can_spawn_borbs = true;
    check_spawn_enemy = false;
    count_defeated_enemies = false;
    enemy_damage_player = false;
    spawn_after_load = true;
    spawn_chance_custom = -1;
    self.spawn_leaves = true;
    value = "Default";
    
    init = function()
    {
    };
    
    set_local_vars(arg0);
    self.init();
}
