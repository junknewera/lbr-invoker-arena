function screenshake_step()
{
    if (screenshake_type == UnknownEnum.Value_0)
    {
        exit;
    }
    screenshake_counter++;
    if (screenshake_counter >= screenshake_duration)
    {
        screenshake_counter = 0;
        screenshake_duration = 0;
        screenshake_type = UnknownEnum.Value_0;
        exit;
    }
    switch (screenshake_type)
    {
        case UnknownEnum.Value_1:
            screenshake_rand();
            break;
    }
    cam_x = lerp(cam_x, cam_x + screenshake_x, 0.2);
    cam_y = lerp(cam_y, cam_y + screenshake_y, 0.2);
}

enum UnknownEnum
{
    Value_0,
    Value_1
}
