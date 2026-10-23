function gui_col_x(arg0 = 1)
{
    return (global.gui_width / global.gui_settings.col_size) * arg0;
}

function gui_col_y(arg0 = 1)
{
    return (global.gui_height / global.gui_settings.col_size) * arg0;
}

function x_to_col(arg0)
{
    return arg0 / (global.gui_width / global.gui_settings.col_size);
}

function y_to_col(arg0)
{
    return arg0 / (global.gui_height / global.gui_settings.col_size);
}
