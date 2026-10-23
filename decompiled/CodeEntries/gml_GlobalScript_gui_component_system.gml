function GUI_Component(arg0 = {}) constructor
{
    x = 0;
    y = 0;
    width = 0;
    height = 0;
    visible = true;
    enabled = true;
    margin = 
    {
        top: 0,
        right: 0,
        bottom: 0,
        left: 0
    };
    padding = 
    {
        top: 0,
        right: 0,
        bottom: 0,
        left: 0
    };
    align = "left";
    valign = "top";
    background_color = undefined;
    border_color = undefined;
    border_width = 0;
    parent = undefined;
    children = [];
    
    init = function()
    {
    };
    
    draw = function()
    {
        if (!visible)
        {
            exit;
        }
        if (!is_undefined(background_color))
        {
            draw_set_color(background_color);
            draw_rectangle(x, y, x + width, y + height, false);
        }
        if (border_width > 0 && !is_undefined(border_color))
        {
            draw_set_color(border_color);
            draw_rectangle(x, y, x + width, y + height, true);
        }
        for (var i = 0; i < array_length(children); i++)
        {
            children[i].draw();
        }
    };
    
    add_child = function(arg0)
    {
        arg0.parent = self;
        array_push(children, arg0);
        return arg0;
    };
    
    remove_child = function(arg0)
    {
        var index = array_indexof(children, arg0);
        if (index >= 0)
        {
            array_delete(children, index, 1);
            arg0.parent = undefined;
        }
    };
    
    update_layout = function()
    {
        for (var i = 0; i < array_length(children); i++)
        {
            children[i].update_layout();
        }
    };
    
    get_content_x = function()
    {
        return x + padding.left;
    };
    
    get_content_y = function()
    {
        return y + padding.top;
    };
    
    get_content_width = function()
    {
        return width - padding.left - padding.right;
    };
    
    get_content_height = function()
    {
        return height - padding.top - padding.bottom;
    };
    
    set_local_vars(arg0);
    init();
}

function GUI_Container(arg0 = {}) : GUI_Component(arg0) constructor
{
    direction = "vertical";
    spacing = gui_col_y(0.5);
    wrap = false;
    
    init = function()
    {
    };
    
    update_layout = function()
    {
        var content_x = get_content_x();
        var content_y = get_content_y();
        var content_width = get_content_width();
        var content_height = get_content_height();
        var current_x = content_x;
        var current_y = content_y;
        var row_height = 0;
        for (var i = 0; i < array_length(children); i++)
        {
            var child = children[i];
            if (!child.visible)
            {
                continue;
            }
            child.x = current_x;
            child.y = current_y;
            child.update_layout();
            if (direction == "vertical")
            {
                current_y += (child.height + spacing);
                row_height = max(row_height, child.width);
            }
            else
            {
                current_x += (child.width + spacing);
                row_height = max(row_height, child.height);
                if (wrap && (current_x + child.width) > (content_x + content_width))
                {
                    current_x = content_x;
                    current_y += (row_height + spacing);
                    row_height = 0;
                }
            }
        }
        if (direction == "vertical")
        {
            height = (current_y - y) + padding.bottom;
        }
        else
        {
            width = (current_x - x) + padding.right;
        }
    };
}

function GUI_Button(arg0 = {}) : GUI_Component(arg0) constructor
{
    text = "";
    on_click = undefined;
    button_style = "default";
    icon = undefined;
    tooltip = undefined;
    
    init = function()
    {
        if (width == 0)
        {
            width = gui_col_x(3);
        }
        if (height == 0)
        {
            height = global.gui_button_height;
        }
    };
    
    draw = function()
    {
        if (!visible)
        {
            exit;
        }
        var button_options = 
        {
            tooltip: tooltip,
            icon: icon
        };
        var clicked = gui_button_tl(x, y, text, enabled, width, false, button_options);
        if (clicked && !is_undefined(on_click))
        {
            on_click();
        }
    };
}

function GUI_Label(arg0 = {}) : GUI_Component(arg0) constructor
{
    text = "";
    font = f_gui_default;
    color = 16777215;
    halign = 0;
    valign = 0;
    wrap = false;
    
    init = function()
    {
        set_default_font(font);
        if (width == 0)
        {
            width = string_width(text);
        }
        if (height == 0)
        {
            height = string_height(text);
        }
    };
    
    draw = function()
    {
        if (!visible)
        {
            exit;
        }
        set_default_font(font);
        draw_set_color(color);
        draw_set_halign(halign);
        draw_set_valign(valign);
        if (wrap)
        {
            draw_text_ext(x, y, text, height, width);
        }
        else
        {
            draw_text(x, y, text);
        }
    };
}

function GUI_Panel(arg0 = {}) : GUI_Container(arg0) constructor
{
    title = "";
    title_font = f_gui_small;
    title_color = 16777215;
    
    draw = function()
    {
        if (!visible)
        {
            exit;
        }
        if (!is_undefined(background_color))
        {
            draw_set_color(background_color);
            draw_rectangle(x, y, x + width, y + height, false);
        }
        if (title != "")
        {
            set_default_font(title_font);
            draw_set_color(title_color);
            draw_text(x + padding.left, y + padding.top, title);
        }
        for (var i = 0; i < array_length(children); i++)
        {
            children[i].draw();
        }
    };
}

function GUI_Grid(arg0 = {}) : GUI_Component(arg0) constructor
{
    columns = 1;
    cell_spacing = gui_col_x(0.5);
    cell_padding = gui_col_x(0.25);
    
    init = function()
    {
    };
    
    update_layout = function()
    {
        var content_x = get_content_x();
        var content_y = get_content_y();
        var content_width = get_content_width();
        var cell_width = (content_width - ((columns - 1) * cell_spacing)) / columns;
        for (var i = 0; i < array_length(children); i++)
        {
            var child = children[i];
            if (!child.visible)
            {
                continue;
            }
            var row = i div columns;
            var col = i % columns;
            child.x = content_x + (col * (cell_width + cell_spacing));
            child.y = content_y + (row * (child.height + cell_spacing));
            child.width = cell_width;
            child.update_layout();
        }
    };
}
