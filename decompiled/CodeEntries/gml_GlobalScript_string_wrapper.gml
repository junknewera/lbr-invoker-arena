function concat_list()
{
    var argument_arr = array_create(argument_count);
    var str = "";
    for (var i = 0; i < argument_count; i++)
    {
        str += ("- " + string(argument[i]));
        if (i < (argument_count - 1))
        {
            str += "\n";
        }
    }
    return str;
}

function concatstr()
{
    var argument_arr = array_create(argument_count);
    var str = "";
    for (var i = 0; i < argument_count; i++)
    {
        str += string(argument[i]);
    }
    return str;
}

function concatstr_nl()
{
    var argument_arr = array_create(argument_count);
    var str = "";
    for (var i = 0; i < argument_count; i++)
    {
        str += string(argument[i]);
        if (i < (argument_count - 1))
        {
            str += "\n";
        }
    }
    return str;
}

function convert_to_string(arg0, arg1 = "\n")
{
    if (is_string(arg0))
    {
        return arg0;
    }
    if (is_array(arg0))
    {
        return implode(arg1, arg0);
    }
    if (is_numeric(arg0))
    {
        return string(arg0);
    }
    return "";
}

function cursed_speech(arg0)
{
    var text = "-";
    var len = string_length(arg0);
    for (var i = 1; i <= len; i++)
    {
        text += " ";
        var char = string_char_at(arg0, i);
        if (char == " ")
        {
            text += "-";
        }
        else
        {
            text += string_upper(char);
        }
        text += " ";
    }
    text += "-";
    return text;
}

function string_rpad(arg0, arg1, arg2)
{
    var padsize = string_length(arg2);
    var padding = max(0, arg1 - string_length(arg0));
    var out = arg0;
    out += string_repeat(arg2, padding div padsize);
    out += string_copy(arg2, 1, padding % padsize);
    out = string_copy(out, 1, arg1);
    return out;
}

function string_shuffle(arg0, arg1 = "")
{
    var out = "";
    if (!is_string(arg1) || is_empty(arg1))
    {
        arg1 = arg0;
    }
    var letters_length = string_length(arg1);
    var text_length = string_length(arg0);
    for (var i = 0; i < text_length; i++)
    {
        var r = irandom_range(0, letters_length);
        out += string_char_at(arg1, r);
    }
    return out;
}

function string_to_number(arg0, arg1 = 128)
{
    var seed = 0;
    var text_length = min(arg1, string_byte_length(arg0));
    for (var i = 1; i <= text_length; i++)
    {
        seed += (string_ord_at(arg0, i) / (10 * power(10, i)));
    }
    return seed;
}
