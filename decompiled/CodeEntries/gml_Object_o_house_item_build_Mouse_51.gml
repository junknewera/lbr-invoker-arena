if (!destroy_timeout_flag || keyboard_check(vk_shift))
{
    exit;
}
o_game.house_item_selected = -1;
instance_destroy();
