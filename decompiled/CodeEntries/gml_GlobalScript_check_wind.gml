function check_wind()
{
    return false;
    var wind_chance = 40;
    var r = random(100);
    if (r < wind_chance)
    {
        wind_duration = sec(random_range(0.5, 5));
        wind_direction = random(359);
        wind_force = random_range(0.2, 5);
    }
}
