function leaf_step()
{
    if (x != target_x && y != target_y)
    {
        if (instance_exists(o_artifact_gravity_ball))
        {
            target_x = o_artifact_gravity_ball.x;
            target_y = o_artifact_gravity_ball.y;
        }
        x = lerp(x, target_x, 0.03);
        y = lerp(y, target_y, 0.03);
        if (can_draw_leaf_flag)
        {
            image_angle = lerp(image_angle, target_rotation, 0.03);
            image_alpha = lerp(image_alpha, 1, 0.1);
            image_xscale = lerp(image_xscale, target_xscale, 0.1);
            image_yscale = lerp(image_yscale, target_yscale, 0.1);
        }
    }
    if (++step_update_counter < step_update_interval)
    {
        exit;
    }
    step_update_counter = 0;
    if (x < 8 || x > (room_width - 8) || y < 8 || y > (room_height - 8))
    {
        add_reward_flag = true;
        destroy();
        exit;
    }
    if (instance_exists(o_blower) && distance_to_object(o_blower) < o_blower.size_leaf_distance)
    {
        blow_leaf_from_blower(o_blower);
        if (o_blower.blower.can_blow)
        {
            exit;
        }
    }
    if (instance_exists(o_autoblower) && distance_to_object(o_autoblower) < o_autoblower.size_leaf_distance)
    {
        var blower = instance_nearest(x, y, o_autoblower);
        if (blower != -4 && blower.state == UnknownEnum.Value_6)
        {
            blow_leaf_from_blower(blower);
        }
    }
}

enum UnknownEnum
{
    Value_6 = 6
}
