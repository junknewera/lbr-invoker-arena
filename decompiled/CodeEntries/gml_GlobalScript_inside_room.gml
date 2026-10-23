function inside_room(arg0)
{
    if (!instance_exists(arg0))
    {
        return false;
    }
    return between(arg0.x, 0, room_width) && between(arg0.y, 0, room_height);
}
