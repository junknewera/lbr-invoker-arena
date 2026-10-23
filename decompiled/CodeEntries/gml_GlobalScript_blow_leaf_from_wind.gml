function blow_leaf_from_wind()
{
    if (wind_leaf_flip_timer >= wind_leaf_flip_duration)
    {
        target_xscale *= choose(1, -1);
        if (target_xscale == image_xscale)
        {
            target_yscale *= choose(1, -1);
        }
        wind_leaf_flip_timer += irandom_range(0, 5);
    }
    target_x += (lengthdir_x(o_game.wind_force, o_game.wind_direction) * random_range(0.2, 1.8));
    target_y += (lengthdir_y(o_game.wind_force, o_game.wind_direction) * random_range(0.2, 1.8));
    target_rotation += (random_range(5, 30) * choose(1, -1));
}
