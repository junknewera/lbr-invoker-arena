if (click_timeout_flag || !can_place_house_item(x, y, item) || global.is_mobile)
{
    exit;
}
place_house_item(item, x, y, img_angle, img_index, true);
if (!keyboard_check(vk_shift))
{
    instance_destroy();
}
