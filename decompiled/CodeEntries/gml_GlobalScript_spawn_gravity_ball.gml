function spawn_gravity_ball()
{
    var _x = room_width / 2;
    var _y = room_height / 2;
    var o = instance_create_layer(_x, _y, global.layers.fruits, o_artifact_gravity_ball);
    o.artifact = global.artifacts.gravity_ball;
    with (o)
    {
        init();
    }
}
