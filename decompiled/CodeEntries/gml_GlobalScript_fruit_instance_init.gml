function fruit_instance_init()
{
    fruit_image_index = clamp(resource.fruit_image_index, 0, image_number - 1);
    player_has_magnet = get_upgrade_count(global.shops.blc.fruit_magnet) > 0;
}
