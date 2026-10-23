function __bignum_explode(arg0)
{
    var num = __bignum_format(arg0);
    var neg = string_char_at(num, 1) == "-";
    var len = string_length(num) - neg;
    var arr = array_create(len + 1);
    if (neg)
    {
        num = string_delete(num, 1, 1);
    }
    array_set(arr, 0, neg);
    while (len)
    {
        array_set(arr, len, real(string_char_at(num, len)));
        len--;
    }
    return arr;
}

function __bignum_format(arg0)
{
    var num = string(arg0);
    var neg = string_char_at(num, 1) == "-";
    var ind = 1;
    num = string_digits(num);
    while (string_char_at(num, ind) == "0")
    {
        ind++;
    }
    if (ind > string_length(num))
    {
        return "0";
    }
    num = string_delete(num, 1, ind - 1);
    if (neg)
    {
        num = "-" + num;
    }
    return num;
}

function __bignum_pair_add(arg0, arg1)
{
    var a = arg0;
    var b = arg1;
    var na = string_char_at(a, 1) == "-";
    var nb = string_char_at(b, 1) == "-";
    var sum = "";
    var tmp = 0;
    if (na)
    {
        a = string_delete(a, 1, 1);
    }
    if (nb)
    {
        b = string_delete(b, 1, 1);
    }
    if (na & !nb)
    {
        return bignum_subtract(b, a);
    }
    if (!na & nb)
    {
        return bignum_subtract(a, b);
    }
    var i = string_length(a);
    var j = string_length(b);
    while (i || j)
    {
        if (i)
        {
            tmp += real(string_char_at(a, i--));
        }
        if (j)
        {
            tmp += real(string_char_at(b, j--));
        }
        sum = string(tmp % 10) + sum;
        tmp = tmp div 10;
    }
    if (tmp)
    {
        sum = "1" + sum;
    }
    if (na)
    {
        sum = "-" + sum;
    }
    return sum;
}

function bignum_abs(arg0)
{
    var num = __bignum_format(arg0);
    return (string_char_at(num, 1) == "-") ? string_delete(num, 1, 1) : num;
}

function bignum_add(arg0, arg1)
{
    var a_arr = bignumber_get_array(arg0);
    var b_arr = bignumber_get_array(arg1);
    var a_value = real(a_arr[0]);
    var b_value = real(b_arr[0]);
    var a_e = real(a_arr[1]);
    var b_e = real(b_arr[1]);
    var e_diff = abs(a_e - b_e);
    var e_max = max(a_e, b_e);
    if (e_diff > 24)
    {
        return iif(a_e >= b_e, arg0, arg1);
    }
    var a_quot = 1;
    var b_quot = 1;
    if (a_e > b_e)
    {
        b_quot = power(10, a_e - b_e);
    }
    else if (a_e < b_e)
    {
        a_quot = power(10, b_e - a_e);
    }
    var result = (a_value / a_quot) + (b_value / b_quot);
    if (result >= 10)
    {
        e_max++;
        result /= 10;
    }
    var result_value = string_format(result, 1, 24);
    var result_string = result_value + "e" + string(e_max);
    return result_string;
}

function __bignum_pair_multiply(arg0, arg1)
{
    var a = arg0;
    var b = arg1;
    var na = string_char_at(a, 1) == "-";
    var nb = string_char_at(b, 1) == "-";
    var prd = "0";
    var p = "";
    if (na)
    {
        a = string_delete(a, 1, 1);
    }
    if (nb)
    {
        b = string_delete(b, 1, 1);
    }
    var db = __bignum_explode(b);
    var la = string_length(a);
    var lb = array_length_1d(db);
    for (var i = 0; i < la; i++)
    {
        var da = real(string_char_at(a, la - i));
        var tmp = 0;
        p = "";
        var j = lb;
        while (--j)
        {
            tmp += (da * db[j]);
            p = string(tmp % 10) + p;
            tmp = tmp div 10;
        }
        p = string(tmp) + p;
        repeat (i)
        {
            p += "0";
        }
        prd = bignum_add(prd, p);
    }
    if (na ^ nb)
    {
        prd = "-" + prd;
    }
    return prd;
}

function bignum_add_safe(arg0, arg1, arg2)
{
    if (is_infinity(arg0) || is_string(arg0))
    {
        return global.max_num;
    }
    if (is_infinity(arg1) || is_string(arg1))
    {
        return global.max_num;
    }
    var tmp_num = arg0 + arg1;
    if (is_infinity(tmp_num) || is_string(tmp_num))
    {
        return global.max_num;
    }
    return tmp_num;
    var add_bignum = false;
    if (is_bignum(arg0) || is_bignum(arg1))
    {
        add_bignum = true;
    }
    var tmp_value;
    if (!add_bignum)
    {
        var addnum1 = arg0;
        var addnum2 = arg1;
        if (!is_undefined(arg2) && is_method(arg2))
        {
            addnum1 = arg2(arg0);
            addnum2 = arg2(arg1);
        }
        tmp_value = addnum1 + addnum2;
        if (is_infinity(tmp_value))
        {
            add_bignum = true;
        }
    }
    if (add_bignum)
    {
        tmp_value = bignum_add(arg0, arg1);
    }
    return tmp_value;
}

function bignum_compare(arg0, arg1)
{
    var a = __bignum_format(arg0);
    var b = __bignum_format(arg1);
    var na = string_char_at(a, 1) == "-";
    var nb = string_char_at(b, 1) == "-";
    if (na & !nb)
    {
        return -1;
    }
    if (!na & nb)
    {
        return 1;
    }
    if (na)
    {
        a = string_delete(a, 1, 1);
    }
    if (nb)
    {
        b = string_delete(b, 1, 1);
    }
    var da = string_length(a);
    var db = string_length(b);
    if (da != db)
    {
        return (((da < db) * 2) - 1) * ((na * 2) - 1);
    }
    var i = 0;
    while (i++ < da)
    {
        var ta = real(string_char_at(a, i));
        var tb = real(string_char_at(b, i));
        if (ta != tb)
        {
            return (((ta < tb) * 2) - 1) * ((na * 2) - 1);
        }
    }
    return 0;
}

function bignum_digits()
{
    var num = __bignum_format(argument[0]);
    var str = (argument_count > 1) ? argument[1] : 0;
    var len = string_length(num) - (string_char_at(num, 1) == "-");
    return str ? string(len) : len;
}

function bignum_divide(arg0, arg1)
{
    var a = new Bignumber(arg0);
    var b = new Bignumber(arg1);
    var a_e = a.get_e();
    var b_e = b.get_e();
    var a_value = a.get_value();
    var b_value = b.get_value();
    var e = a_e - b_e;
    if (b_value == 0)
    {
        return 0;
    }
    var result = a_value / b_value;
    if ((a.raw_was_big && !b.raw_was_big) || (!a.raw_was_big && b.raw_was_big))
    {
        e += 1;
    }
    log("div", "a val", a_value, "ae", a_e, "b val", b_value, "b e", b_e, "res = ", result, "e = ", e);
    var result_value = string_format(result, 1, 24);
    var result_string = result_value + "e" + string(e);
    return result_string;
}

function bignum_max()
{
    var i = argument_count - 1;
    var mx = __bignum_format(argument[i]);
    while (i--)
    {
        var num = __bignum_format(argument[i]);
        if (bignum_compare(num, mx))
        {
            mx = num;
        }
    }
    return mx;
}

function bignum_min(arg0, arg1)
{
    var a_arr = bignumber_get_array(arg0);
    var b_arr = bignumber_get_array(arg1);
    var a_value = real(a_arr[0]);
    var b_value = real(b_arr[0]);
    var a_e = real(a_arr[1]);
    var b_e = real(b_arr[1]);
    var e_diff = abs(a_e - b_e);
    var e_max = max(a_e, b_e);
    if (a_e == b_e)
    {
        return iif(a_value > b_value, arg0, arg1);
    }
    return iif(a_e > b_e, arg0, arg1);
}

function bignum_mod()
{
    var a = __bignum_format(argument[0]);
    var b = argument[1];
    var str = (argument_count > 2) ? argument[2] : 0;
    var na = string_char_at(a, 1) == "-";
    var nb = b < 0;
    var ans = 0;
    var i = 0;
    if (na)
    {
        a = string_delete(a, 1, 1);
    }
    if (nb)
    {
        b = -b;
    }
    var la = string_length(a);
    while (i++ < la)
    {
        ans = ((ans * 10) + real(string_char_at(a, i))) % b;
    }
    if (na)
    {
        ans = -ans;
    }
    if (str)
    {
        ans = string(ans);
    }
    return ans;
}

function bignum_multiply(arg0, arg1)
{
    var a = new Bignumber(arg0);
    var b = new Bignumber(arg1);
    var a_e = a.get_e();
    var b_e = b.get_e();
    var e = a_e + b_e;
    var result = a.get_value() * b.get_value();
    var result_e = floor(log10(result));
    var result_before = result;
    result = result / power(10, result_e);
    e += result_e;
    if ((a.raw_was_big && !b.raw_was_big) || (!a.raw_was_big && b.raw_was_big))
    {
        e -= 1;
    }
    var result_value = string_format(result, 1, 24);
    var result_string = result_value + "e" + string(e);
    return result_string;
}

function bignum_power(arg0, arg1)
{
    if (arg1 == 0)
    {
        return 1;
    }
    var result = 1;
    var f = frac(arg1);
    if (arg1 >= 100)
    {
        var tmp_res = 1;
    }
    else
    {
        for (var i = 0; i < arg1; i++)
        {
            result = bignum_multiply(result, arg0);
        }
    }
    if (f != 0)
    {
        var pow_frac = bignum_multiply(arg0, f);
        result = bignum_add(result, pow_frac);
    }
    return result;
}

function bignum_sign(arg0)
{
    var num = __bignum_format(string(arg0));
    return (num != "0") * (((string_char_at(num, 1) != "-") * 2) - 1);
}

function bignum_subtract(arg0, arg1)
{
    var a = __bignum_format(arg0);
    var b = __bignum_format(arg1);
    var c = "";
    var na = string_char_at(a, 1) == "-";
    var nb = string_char_at(b, 1) == "-";
    var sub = "";
    var carry = 0;
    if (na)
    {
        a = string_delete(a, 1, 1);
    }
    if (nb)
    {
        b = string_delete(b, 1, 1);
    }
    if (na & !nb)
    {
        return "-" + bignum_add(a, b);
    }
    if (!na & nb)
    {
        return bignum_add(a, b);
    }
    if (bignum_compare(a, b) < 0)
    {
        c = a;
        a = b;
        b = c;
    }
    var i = string_length(a);
    var j = string_length(b);
    while (i || j)
    {
        var diff;
        if (i)
        {
            diff = real(string_char_at(a, i--)) - carry;
        }
        if (j)
        {
            diff -= real(string_char_at(b, j--));
        }
        if (diff < 0)
        {
            diff += 10;
            carry = 1;
        }
        sub = string(diff % 10) + sub;
    }
    if (c != "")
    {
        sub = "-" + sub;
    }
    return __bignum_format(sub);
}

function bignumber_get_array(arg0)
{
    var arr = explode("e", arg0);
    if (array_length(arr) == 1)
    {
        arr = [string_copy(arg0, 0, 24), max(1, string_length(arg0) - 24 - 2)];
    }
    return arr;
}

function is_bignum(arg0)
{
    return false;
    return is_string(arg0) || arg0 > global.max_num;
}

function nth_root(arg0, arg1, arg2)
{
    var n = arg1 || 2;
    var prec = arg2 || 12;
    var r = 1;
    for (var i = 0; i < prec; i++)
    {
        var a = arg0 / bignum_power(r, n - 1);
        r = (1 / n) * (((n - 1) * r) + a);
    }
    return r;
}
