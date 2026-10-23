function gui_can_open_dialog(arg0)
{
    if (!is_struct(arg0) || is_undefined(struct_get_from_hash(arg0, variable_get_hash("dialog_id"))))
    {
        return true;
    }
    if (instance_exists(o_dialog))
    {
        if (variable_instance_exists(o_dialog.id, "dialog_id") && o_dialog.dialog_id == arg0.dialog_id && o_dialog.dialog_id != "npc")
        {
            gui_dialog_toggle(global.dialog_instance);
            return false;
        }
    }
    return true;
}
