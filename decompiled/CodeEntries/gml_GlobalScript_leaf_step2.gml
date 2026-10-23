function leaf_step2()
{
    if (can_draw_leaf_flag)
    {
        image_angle = lerp(image_angle, target_rotation, 0.03);
        image_alpha = lerp(image_alpha, 1, 0.1);
        image_xscale = lerp(image_xscale, target_xscale, 0.1);
        image_yscale = lerp(image_yscale, target_yscale, 0.1);
    }
    else
    {
        image_angle = target_rotation;
        image_alpha = 1;
        image_xscale = target_xscale;
        image_yscale = target_yscale;
    }
    if (++step_update_counter < step_update_interval || bouncing)
    {
        exit;
    }
    step_update_counter = 0;
    if (instance_exists(o_artifact_gravity_ball))
    {
        direction = point_to_object(o_artifact_gravity_ball);
        speed = 5;
    }
    if (x < 8 || x > (room_width - 8) || y < 8 || y > (room_height - 8))
    {
        if (o_game.area.type == global.area_types.closed)
        {
            bounce_room_edges(8);
            restrict_position_to_room();
            speed = 6;
            exit;
        }
        else if (min_blow_speed > 0 && speed < min_blow_speed)
        {
            bounce_room_edges(8);
            restrict_position_to_room();
        }
        else
        {
            add_reward_flag = true;
            destroy();
            exit;
        }
    }
    if (instance_exists(o_blower) && distance_to_object(o_blower) < o_blower.size_leaf_distance)
    {
        blow_leaf_from_blower2(o_blower);
        if (o_blower.blower.can_blow && o_blower.damage > 0)
        {
            exit;
        }
    }
    if (instance_exists(o_autoblower) && distance_to_object(o_autoblower) < o_autoblower.size_leaf_distance)
    {
        var blower = instance_nearest(x, y, o_autoblower);
        if (blower != -4 && blower.state == UnknownEnum.Value_6)
        {
            blow_leaf_from_blower2(blower);
        }
    }
}

enum UnknownEnum
{
    Value_6 = 6
}
