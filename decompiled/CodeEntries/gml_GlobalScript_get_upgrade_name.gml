function get_upgrade_name(arg0, arg1 = undefined)
{
    if (!is_string(arg0) || is_empty(arg0))
    {
        return "";
    }
    var text = "-";
    var text_upgrade = variable_struct_get(global.texts_upgrade_attributes, arg0);
    if (is_struct(text_upgrade.text))
    {
        if (is_string(arg1) && !is_undefined(variable_struct_get(text_upgrade.text, arg1)))
        {
            text = variable_struct_get(text_upgrade.text, arg1);
        }
        else
        {
            text = text_upgrade.text_neutral;
        }
    }
    else
    {
        text = text_upgrade.text;
    }
    return text;
}
