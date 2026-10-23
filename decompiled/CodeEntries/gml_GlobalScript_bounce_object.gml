function bounce_object(arg0)
{
    var dir = point_direction(x, y, arg0.x, arg0.y);
    var xnew = x - lengthdir_x(0.25, dir);
    var ynew = y - lengthdir_y(0.25, dir);
    x = xnew;
    y = ynew;
}
