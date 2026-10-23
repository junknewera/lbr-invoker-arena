function get_current_dialog_section()
{
    if (!instance_exists(o_dialog))
    {
        return undefined;
    }
    return o_dialog.current_section;
}

function get_current_dialog_section_key()
{
    var section = get_current_dialog_section();
    if (!is_struct(section))
    {
        return "";
    }
    return section.key;
}
