for (var i = 0; i < min(1000, array_length(leaves)); i++)
{
    var leaf = @@array_get@@(leaves, i);
    draw_sprite_ext(sprite_index, leaf._image_index, leaf._x, leaf._y, leaf._scale, leaf._scale, leaf._image_angle, c_white, 1);
}
