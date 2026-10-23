if (x < xmin)
{
    direction = 0;
}
else if (x > xmax)
{
    direction = 180;
}
if (y < ymin)
{
    direction = 270;
}
else if (y > ymax)
{
    direction = 90;
}
speed = lerp(speed, speed_final, 0.05);
t++;
