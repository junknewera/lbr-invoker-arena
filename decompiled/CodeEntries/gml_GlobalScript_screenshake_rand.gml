function screenshake_rand()
{
    var intensity = 1;
    if ((screenshake_counter % 4) == 0)
    {
        screenshake_x = random_range(-intensity, intensity);
        screenshake_y = random_range(-intensity, intensity);
    }
}
