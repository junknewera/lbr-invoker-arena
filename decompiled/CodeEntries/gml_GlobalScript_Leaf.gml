function Leaf() constructor
{
    static step = function()
    {
        _x = lerp(_x, _target_x, 0.03);
        _y = lerp(_y, _target_y, 0.03);
        _image_angle = lerp(_image_angle, _rotation, 0.03);
        _image_alpha = lerp(_image_alpha, 1, 0.1);
    };
    
    _x = irandom_range(20, room_width - 20);
    _y = irandom_range(20, room_height - 20);
    _target_x = _x;
    _target_y = _y;
    _image_angle = 0;
    _image_alpha = 0;
    _image_index = irandom(2);
    _rotation = irandom_range(-180, 180);
    _scale = 1.5 + (random_range(-20, 20) / 100);
}
