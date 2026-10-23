function set_next_dialog_section(arg0 = 1, arg1 = 0)
{
    if (!instance_exists(o_dialog) || !instance_exists(o_shop))
    {
        exit;
    }
    if (is_undefined(o_shop.current_nav_key) || is_undefined(variable_struct_get(global.dialog_sections_array, o_shop.current_nav_key)))
    {
        exit;
    }
    if (arg1 >= 50)
    {
        exit;
    }
    var sections_length = array_length(variable_struct_get(global.dialog_sections_array, o_shop.current_nav_key));
    if (sections_length <= 1)
    {
        exit;
    }
    var section_position = o_dialog.current_section.position;
    var next_section_position = section_position + arg0 + (arg1 * sign(arg0));
    if (next_section_position >= sections_length)
    {
        next_section_position = 0;
    }
    else if (next_section_position < 0)
    {
        next_section_position = sections_length - 1;
    }
    var next_dialog_section = @@array_get@@(variable_struct_get(global.dialog_sections_array, o_shop.current_nav_key), next_section_position);
    var is_obfuscated = false;
    if (!is_undefined(struct_get_from_hash(next_dialog_section, variable_get_hash("is_obfuscated"))))
    {
        is_obfuscated = get_value_ext(next_dialog_section, next_dialog_section.is_obfuscated);
    }
    if (is_obfuscated)
    {
        return set_next_dialog_section(arg0, ++arg1);
    }
    var is_visible = true;
    if (!is_undefined(struct_get_from_hash(next_dialog_section, variable_get_hash("is_visible"))))
    {
        is_visible = get_value_ext(next_dialog_section, next_dialog_section.is_visible);
    }
    if (!is_visible)
    {
        return set_next_dialog_section(arg0, ++arg1);
    }
    set_dialog_section(next_dialog_section, true);
}
