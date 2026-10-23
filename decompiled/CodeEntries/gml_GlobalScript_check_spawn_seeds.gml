function check_spawn_seeds()
{
    var spawn_chance = 1 + (get_upgrade_attribute_value(global.upgrade_attributes.seed_spawn_chance) * 100);
    var spawn_count = 1 + get_upgrade_attribute_value(global.upgrade_attributes.seed_spawn_count);
    var r = random(100);
    if (r < spawn_chance)
    {
        for (var i = 0; i < spawn_count; i++)
        {
            spawn_seeds();
        }
    }
}
