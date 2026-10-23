function restrict_position_to_room()
{
    x = clamp(x, 0, room_width);
    y = clamp(y, 0, room_height);
}
