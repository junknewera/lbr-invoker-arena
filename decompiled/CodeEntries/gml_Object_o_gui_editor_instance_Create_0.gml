if (live_auto_call_1())
{
    var lac_argc = argument_count;
    var lac_args = array_create(lac_argc);
    var lac_argk = 0;
    repeat (lac_argc)
    {
        lac_args[lac_argk] = argument[lac_argk];
        lac_argk++;
    }
    if (live_auto_call_2(lac_args))
    {
        return global.live_result;
    }
}
dragging = false;
drag_diff_x = 0;
drag_diff_y = 0;
drag_offset_x = -10;
drag_offset_y = -10;
_id = real(id);
show_width = false;
text = "test button";
type = "unknown";
width = gui_col_x(3);

click = function()
{
    if (mouse_lastbutton == 1)
    {
        start_drag();
    }
    if (mouse_lastbutton == 2)
    {
        select();
    }
};

end_drag = function()
{
    dragging = false;
    global.gui_editor_vars.drag_instance = -1;
    update_editor_data();
};

is_selected = function()
{
    return global.gui_editor_vars.selected_instance == id;
};

select = function()
{
    if (global.gui_editor_vars.selected_instance == id)
    {
        global.gui_editor_vars.selected_instance = -1;
    }
    else
    {
        keyboard_string = text;
        global.gui_editor_vars.selected_instance = id;
    }
};

snap = function()
{
    if (!global.gui_editor_vars.snap)
    {
        exit;
    }
    x = round(x_to_col(x) * 2) * (global.gui_width / global.gui_settings.col_size / 2);
    y = round(y_to_col(y) * 2) * (global.gui_height / global.gui_settings.col_size / 2);
};

start_drag = function()
{
    if (global.gui_editor_vars.drag_instance != -1)
    {
        exit;
    }
    dragging = true;
    drag_diff_x = o_mouse.x - x;
    drag_diff_y = o_mouse.y - y;
    global.gui_editor_vars.drag_instance = id;
};

update_editor_data = function()
{
    if (!is_struct(variable_struct_get(global.gui_editor_vars.data, _id)))
    {
        variable_struct_set(global.gui_editor_vars.data, _id, {});
    }
    variable_struct_set(global.gui_editor_vars.data, _id, 
    {
        x: x,
        y: y,
        object_name: object_get_name(object_index),
        text: text,
        type: type,
        width: width
    });
};
