function _clamp(arg0, arg1, arg2)
{
    if (arg2 < arg1)
    {
        return clamp(arg0, arg2, arg1);
    }
    return clamp(arg0, arg1, arg2);
}

function _multiply(arg0, arg1)
{
    if (is_struct(arg0))
    {
        var __struct = arg0;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            if (is_struct(mitem))
            {
                _multiply(mitem, arg1);
            }
            else
            {
                variable_struct_set(__struct, mkey, mitem * arg1);
            }
        }
    }
    else if (is_numeric(arg0))
    {
        return arg0 * arg1;
    }
}

function add_safe(arg0, arg1)
{
    if (!is_numeric(arg1))
    {
        return arg0;
    }
    return arg0 + arg1;
}

function apply_max_number(arg0)
{
    if (is_infinity(arg0) || is_string(arg0))
    {
        return global.max_num;
    }
    return arg0;
}

function between(arg0, arg1, arg2)
{
    return arg0 >= arg1 && arg0 <= arg2;
}

function cardinal_direction(arg0, arg1 = false)
{
    var _dir = UnknownEnum.Value_0;
    if (arg1)
    {
        if (between(arg0, 0, 90) || between(arg0, 270, 360))
        {
            _dir = UnknownEnum.Value_0;
        }
        else
        {
            _dir = UnknownEnum.Value_2;
        }
        return _dir;
    }
    if (between(arg0, 0, 45) || between(arg0, 315, 360))
    {
        _dir = UnknownEnum.Value_0;
    }
    else if (between(arg0, 46, 134))
    {
        _dir = UnknownEnum.Value_1;
    }
    else if (between(arg0, 135, 235))
    {
        _dir = UnknownEnum.Value_2;
    }
    else if (between(arg0, 236, 314))
    {
        _dir = UnknownEnum.Value_3;
    }
    return _dir;
}

function divide_safe(arg0, arg1)
{
    if (arg1 == 0)
    {
        return 0;
    }
    return arg0 / arg1;
}

function get_max_num()
{
    var num = 310;
    var max_num = power(10, num);
    while (is_infinity(max_num))
    {
        num--;
        max_num = power(10, num);
    }
    return max_num;
}

function init_number_notations()
{
    global.number_notation = 
    {
        def: 
        {
            key: "def",
            value: __("Default")
        },
        e: 
        {
            key: "e",
            value: __("Scientific")
        },
        engineering: 
        {
            key: "engineering",
            value: __("Engineering")
        },
        alt: 
        {
            key: "alt",
            value: __("Alternative")
        },
        leaf: 
        {
            key: "leaf",
            value: __("Leaf")
        }
    };
    global.number_notation_suffices = ["K", "M", "B", "T", "Qa", "Qi", "Sx", "Sp", "Oc", "No", "Dc", "Ud", "Dd", "Td", "Qad", "Qid", "Sxd", "Spd", "Ocd", "Nod", "Vg", "Uvg", "Dvg", "Tvg", "Qavg", "Qivg", "Sxvg", "Spvg", "Ocvg", "Novg", "Tg", "Utg", "Dtg", "Ttg", "Qatg", "Qitg", "Sxtg", "Sptg", "Octg", "Notg", "Qg", "Uqg", "Dqg", "Tqg", "Qaqg", "Qiqg", "Sxqg", "Spqg", "Ocqg", "Noqg", "Qq", "Uqq", "Dqq", "Tqq", "Qaqq", "Qiqq", "Sxqq", "Spqq", "Ocqq", "Noqq", "Sg", "Usg", "Dsg", "Tsg", "Qasg", "Qisg", "Sxsg", "Spsg", "Ocsg", "Nosg", "St", "Ust", "Dst", "Tst", "Qast", "Qist", "Sxst", "Spst", "Ocst", "Nost", "Og", "Uog", "Dog", "Tog", "Qaog", "Qiog", "Sxog", "Spog", "Ocog", "Noog", "Nn", "Unn", "Dnn", "Tnn", "Qann", "Qinn", "Sxnn", "Spnn", "Ocnn", "Nonn", "Ct"];
    global.number_notation_suffices_length = array_length(global.number_notation_suffices);
    global.number_notation_current = global.number_notation.def.value;
}

function num_diff(arg0, arg1)
{
    return abs(arg0 - arg1);
}

function num_tolerance(arg0, arg1, arg2)
{
    return num_diff(arg0, arg1) <= arg2;
}

function number_format(arg0, arg1 = 2, arg2 = false, arg3 = false, arg4 = false)
{
    if (is_infinity(arg0) || is_string(arg0) || is_bignum(arg0))
    {
        return "Infinity";
        if (is_struct(arg0))
        {
            return arg0.format();
        }
        return arg0;
    }
    if (!is_numeric(arg0))
    {
        return arg0;
    }
    if (!is_numeric(arg1))
    {
        arg1 = 2;
    }
    var is_positive = arg0 >= 0;
    var num_abs = abs(arg0);
    var sign_letter = "";
    if (arg2)
    {
        if (arg0 > 0)
        {
            sign_letter = "+";
        }
    }
    if (num_abs >= 0 && num_abs < 1000)
    {
        var places_frac_number = (arg1 > 0) ? (1 / power(10, arg1)) : 0.01;
        if (frac(num_abs) < places_frac_number)
        {
            arg1 = 0;
        }
        if (arg3 && !arg4)
        {
            arg1 = 0;
        }
        number = string_format(arg0, 0, arg1);
        if (num_abs > 0)
        {
            return sign_letter + number;
        }
        else
        {
            return number;
        }
    }
    if (!is_positive)
    {
        arg0 = num_abs;
    }
    var lg10 = log10(arg0);
    var number_exponent = floor(floor(lg10) / 3);
    var letter_exponent = number_exponent;
    var number = arg0 / power(1000, number_exponent);
    var frac_number = frac(number);
    var e = floor(lg10);
    var value_first = arg0 / power(10, e);
    if (global.number_notation_current == global.number_notation.leaf.value)
    {
        return sign_letter + string(string_format(value_first, 0, 2)) + " leaf" + string(e);
    }
    else if (global.number_notation_current == global.number_notation.e.value)
    {
        if (frac(value_first) < 0.01)
        {
            arg1 = 0;
        }
        return sign_letter + string(string_format(value_first, 0, arg1)) + " e" + string(e);
    }
    else if (global.number_notation_current == global.number_notation.alt.value)
    {
        if (letter_exponent < global.number_notation_suffices_length)
        {
            if (frac_number == 0)
            {
                arg1 = 0;
            }
            output = sign_letter + string_format(number, 0, arg1) + " " + global.number_notation_suffices[letter_exponent - 1];
            return output;
        }
        return sign_letter + string(string_format(value_first, 0, 2)) + " e" + string(e);
    }
    else if (global.number_notation_current == global.number_notation.engineering.value)
    {
        var engr_exponent = lg10 - (lg10 % 3);
        var z = arg0 / power(10, engr_exponent);
        if (frac(z) < 0.01)
        {
            arg1 = 0;
        }
        return sign_letter + string(string_format(z, 0, arg1)) + " e" + string(engr_exponent);
    }
    if (letter_exponent > 46)
    {
        return sign_letter + string(string_format(value_first, 0, 2)) + " e" + string(e);
    }
    var letter = string_char_at("kmbtaAcCdDeEfFgGhHiIjJnNoOpPqQrRsSuUvVwWxXyYzZ", letter_exponent);
    if (frac_number == 0)
    {
        arg1 = 0;
    }
    if (arg0 >= 1000 && arg1 == 0)
    {
        number = floor(number);
    }
    var output = sign_letter + string_format(number, 0, arg1) + " " + string(letter);
    return string(output);
}

function number_format_percent(arg0, arg1 = undefined, arg2 = undefined, arg3 = undefined)
{
    if (!is_numeric(arg0))
    {
        return arg0;
    }
    var num_f = $"{number_format(arg0 * 100, arg1, arg2, arg3)}%";
    return num_f;
}

function rround(arg0)
{
    if (arg0 >= global.max_round_number)
    {
        return arg0;
    }
    return round(arg0);
}

function str_to_int(arg0)
{
    arg0 = string_lower(arg0);
    var _first = 98;
    var numbers = "";
    var i = 0;
    var l = string_length(arg0);
    while (i < l)
    {
        numbers += string(ord(string_char_at(argument0, i + 1)) - _first);
        i++;
    }
    return real(numbers);
}

function wrap(arg0, arg1, arg2, arg3)
{
    var next_value = arg0 + arg1;
    if (next_value > arg3)
    {
        next_value = arg2;
    }
    else if (next_value < arg2)
    {
        next_value = arg3;
    }
    return next_value;
}

function calc_avg(arg0)
{
    if (!is_array(arg0) || array_length(arg0) == 0)
    {
        return 0;
    }
    var value = 0;
    var __array = arg0;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        value += mitem;
    }
    var avg = value / array_length(arg0);
    return avg;
}

function calc_percent(arg0, arg1)
{
    if (arg0 == 0 || arg1 == 0)
    {
        return 0;
    }
    return (arg0 / arg1) * 100;
}

function mmin()
{
    var val = 0;
    for (var i = 0; i < argument_count; i++)
    {
        if (!is_numeric(argument[i]))
        {
            continue;
        }
        val = min(val, argument[i]);
    }
    return val;
}

function min1(arg0)
{
    return max(1, arg0);
}

function multi_chance(arg0, arg1 = 0, arg2 = 0, arg3 = 100)
{
    if (!is_numeric(arg1))
    {
        arg1 = 0;
    }
    if (arg0 >= 100 && arg2 == 100)
    {
        var count = floor(arg0 / 100);
        count += percent_chance(arg0 % 100);
        return count;
    }
    if (arg1 >= arg3)
    {
        return arg1;
    }
    if (percent_chance(arg0))
    {
        arg0 -= arg2;
        return multi_chance(arg0, ++arg1, arg2, arg3);
    }
    return arg1;
}

function percent_chance(arg0)
{
    return random(100) <= arg0;
}

function random_value_range(arg0, arg1)
{
    return irandom_range(arg0 * ((100 - arg1) / 100), arg0 * ((100 + arg1) / 100));
}

function random_weighted(arg0 = 1, arg1 = 100, arg2 = 2)
{
    var range = arg1 - arg0;
    var bias_factor = random(1);
    var weighted_value = power(bias_factor, arg2);
    return arg0 + (weighted_value * range);
}

function random_weighted_average(arg0 = 1, arg1 = 100, arg2 = 2)
{
    var range = arg1 - arg0;
    var expected_weighted_value = divide_safe(1, arg2 + 1);
    return arg0 + (expected_weighted_value * range);
}

function get_progressive_value(arg0, arg1 = 50, arg2 = 3, arg3 = 2)
{
    var value_min = arg1 * power(arg2 * arg3, arg0);
    var value_max = value_min * arg2;
    return 
    {
        min: value_min,
        max: value_max
    };
}

function get_random_level_by_chance(arg0 = 1, arg1 = 100, arg2 = 2)
{
    var r = random(1);
    if (arg0 > arg1)
    {
        var tmp = arg1;
        arg0 = arg1;
        arg1 = tmp;
    }
    var level = arg0 + round(power(r, arg2) * arg1);
    return level;
}

function max_safe(arg0, arg1)
{
    if (!is_numeric(arg0) && !is_numeric(arg1))
    {
        return 0;
    }
    if (!is_numeric(arg0))
    {
        return arg1;
    }
    if (!is_numeric(arg1))
    {
        return arg0;
    }
    return 0;
}

function roundmax(arg0, arg1 = 1)
{
    return max(arg1, round(arg0));
}

function sqrt0(arg0, arg1 = 0)
{
    return (arg0 < 0) ? arg1 : sqrt(arg0);
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3
}
