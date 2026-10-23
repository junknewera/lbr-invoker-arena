alarm[0] = sec(1.5);
repeat (30)
{
    if (instance_number(o_intro_leaf) > 500)
    {
        exit;
    }
    var _x = random_range(20, room_width - 20);
    var _y = random_range(20, room_height - 20);
    instance_create_layer(_x, _y, "Instances_1", o_intro_leaf);
}
