if (appearing)
{
    alpha += 0.1;
    if (alpha > alpha_max)
    {
        alpha = alpha_max;
        appearing = false;
    }
}
else if (disappearing)
{
    alpha -= 0.05;
}
if (mouse_click_in_gui_range(x1, y1, x2, y2) || y <= gui_col_y(2) || alpha <= 0)
{
    instance_destroy();
}
