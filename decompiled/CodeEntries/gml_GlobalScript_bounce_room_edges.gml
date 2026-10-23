function bounce_room_edges(arg0 = 4)
{
    if (x <= arg0 || x >= (room_width - arg0) || y <= arg0 || y >= (room_height - arg0))
    {
        if (x <= arg0)
        {
            direction = choose(irandom_range(0, 89), irandom_range(271, 359));
        }
        else if (x >= (room_width - arg0))
        {
            direction = irandom_range(91, 269);
        }
        else if (y <= arg0)
        {
            direction = irandom_range(181, 359);
        }
        else if (y >= (room_height - arg0))
        {
            direction = irandom_range(1, 179);
        }
    }
}
