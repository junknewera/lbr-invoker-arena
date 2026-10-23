function GUI_LayoutManager(arg0 = {}) constructor
{
    margin = gui_col_x(0.5);
    padding = gui_col_x(0.25);
    spacing = gui_col_y(0.5);
    current_breakpoint = "desktop";
    available_width = gui_content_width;
    available_height = gui_content_height;
    
    init = function()
    {
    };
    
    layout_vertical = function(arg0, arg1, arg2, arg3 = undefined)
    {
        var dx = arg1;
        var dy = arg2;
        var max_w = arg3 ?? available_width;
        for (var i = 0; i < array_length(arg0); i++)
        {
            var comp = arg0[i];
            if (!comp.visible)
            {
                continue;
            }
            comp.dx = dx;
            comp.dy = dy;
            if (comp.width == 0)
            {
                comp.width = max_w;
            }
            dy += (comp.height + spacing);
        }
        return dy - arg2;
    };
    
    layout_horizontal = function(arg0, arg1, arg2, arg3 = undefined)
    {
        var dx = arg1;
        var dy = arg2;
        var max_h = arg3 ?? available_height;
        for (var i = 0; i < array_length(arg0); i++)
        {
            var comp = arg0[i];
            if (!comp.visible)
            {
                continue;
            }
            comp.dx = dx;
            comp.dy = dy;
            if (comp.height == 0)
            {
                comp.height = max_h;
            }
            dx += (comp.width + spacing);
        }
        return dx - arg1;
    };
    
    layout_grid = function(arg0, arg1, arg2, arg3, arg4 = undefined)
    {
        var dx = arg1;
        var dy = arg2;
        var max_w = arg4 ?? available_width;
        var cell_width = (max_w - ((arg3 - 1) * spacing)) / arg3;
        var comp;
        for (var i = 0; i < array_length(arg0); i++)
        {
            comp = arg0[i];
            if (!comp.visible)
            {
                continue;
            }
            var row = i div arg3;
            var col = i % arg3;
            comp.dx = dx + (col * (cell_width + spacing));
            comp.dy = dy + (row * (comp.height + spacing));
            comp.width = cell_width;
        }
        var rows = ceil(array_length(arg0) / arg3);
        return (rows * (comp.height + spacing)) - spacing;
    };
    
    center_horizontal = function(arg0, arg1)
    {
        arg0.dx = (arg1 - arg0.width) / 2;
    };
    
    center_vertical = function(arg0, arg1)
    {
        arg0.dy = (arg1 - arg0.height) / 2;
    };
    
    center = function(arg0, arg1, arg2)
    {
        center_horizontal(arg0, arg1);
        center_vertical(arg0, arg2);
    };
    
    set_local_vars(arg0);
    init();
}

function gui_layout_vertical(arg0, arg1, arg2, arg3 = undefined)
{
    return global.gui_layout_manager.layout_vertical(arg0, arg1, arg2, arg3);
}

function gui_layout_horizontal(arg0, arg1, arg2, arg3 = undefined)
{
    return global.gui_layout_manager.layout_horizontal(arg0, arg1, arg2, arg3);
}

function gui_layout_grid(arg0, arg1, arg2, arg3, arg4 = undefined)
{
    return global.gui_layout_manager.layout_grid(arg0, arg1, arg2, arg3, arg4);
}
