function can_spawn_fruit()
{
    return instance_number(o_fruit) < 50 && global.game_settings.fruits_enabled;
}
