if (point_distance(x, y, other.x, other.y) > pickup_distance)
{
    exit;
}
collect();
if (show_pickup_fx)
{
    fx_sprite(sprite_index, item_text, true);
}
instance_destroy();
