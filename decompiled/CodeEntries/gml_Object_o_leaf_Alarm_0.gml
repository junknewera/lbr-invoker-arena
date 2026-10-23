can_draw_leaf_flag = can_draw_leaf_check();
can_draw_shadow_flag = can_draw_shadow_check();
if (type.crumble)
{
    crumble_timer++;
    if (crumble_timer >= crumble_duration)
    {
        add_reward_flag = false;
        destroy();
        exit;
    }
    var crumble_index = round((crumble_timer / crumble_duration) * image_number) - 1;
    _image_index = crumble_index;
}
alarm[0] = sec(1);
