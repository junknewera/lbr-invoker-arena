if (!instance_exists(o_game))
{
    instance_destroy();
    exit;
}
get_dlc_prices();
alarm[0] = refresh_duration;
