scale = random_range(0.75, 1.5);
image_alpha = 0;
image_index = irandom(image_number - 1);
image_xscale = scale;
image_yscale = scale;
image_speed = 0;
_speed = 0;
target_direction = 0;
target_rotation = irandom_range(-180, 180);
target_x = x + irandom_range(-60, 60);
target_y = y + irandom_range(-60, 60);
target_xscale = choose(scale, -scale);
target_yscale = choose(scale, -scale);
step_update_counter = 0;
step_update_interval = sec(0.1);
leaves = [];
leaves_count = 10;
wind_blow_done = false;
wind_leaf_flip_duration = sec(random_range(0.5, 4));
wind_leaf_flip_timer = 0;

add_leaf = function()
{
    var _scale = random_range(0.75, 1.5);
    var leaf = 
    {
        alpha: 1,
        angle: irandom(359),
        offset_x: irandom_range(2, 16),
        offset_y: irandom_range(2, 16),
        xscale: _scale,
        yscale: _scale,
        _image_index: irandom(image_number - 1),
        _x: x,
        _y: y
    };
    array_push(leaves, leaf);
};
