function is_current_dialog_section(arg0)
{
    if (!instance_exists(o_dialog))
    {
        return false;
    }
    var current_dialog_section = get_current_dialog_section();
    if (!is_struct(current_dialog_section))
    {
        return false;
    }
    if (is_array(arg0))
    {
        return in_array(current_dialog_section, arg0);
    }
    return current_dialog_section.key == arg0.key;
}
