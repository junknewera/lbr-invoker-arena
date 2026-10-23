function EaseLinear(arg0, arg1, arg2, arg3)
{
    return ((arg1 * arg0) / arg3) + arg3;
}

function EaseInQuad(arg0, arg1, arg2, arg3)
{
    arg0 /= arg3;
    return (arg1 * arg0 * arg0) + arg3;
}

function EaseOutQuad(arg0, arg1, arg2, arg3)
{
    arg0 /= arg3;
    return (-arg1 * arg0 * (arg0 - 2)) + arg3;
}

function EaseInOutQuad(arg0, arg1, arg2, arg3)
{
    arg0 /= (arg3 * 0.5);
    if (arg0 < 1)
    {
        return (arg1 * 0.5 * arg0 * arg0) + arg3;
    }
    return (arg1 * -0.5 * ((--arg0 * (arg0 - 2)) - 1)) + arg3;
}

function EaseInCubic(arg0, arg1, arg2, arg3)
{
    return (arg1 * power(arg0 / arg3, 3)) + arg3;
}

function EaseOutCubic(arg0, arg1, arg2, arg3)
{
    return (arg1 * (power((arg0 / arg3) - 1, 3) + 1)) + arg3;
}

function EaseInOutCubic(arg0, arg1, arg2, arg3)
{
    arg0 /= (arg3 * 0.5);
    if (arg0 < 1)
    {
        return (arg1 * 0.5 * power(arg0, 3)) + arg3;
    }
    return (arg1 * 0.5 * (power(arg0 - 2, 3) + 2)) + arg3;
}

function EaseInQuart(arg0, arg1, arg2, arg3)
{
    return (arg1 * power(arg0 / arg3, 4)) + arg3;
}

function EaseOutQuart(arg0, arg1, arg2, arg3)
{
    return (-arg1 * (power((arg0 / arg3) - 1, 4) - 1)) + arg3;
}

function EaseInOutQuart(arg0, arg1, arg2, arg3)
{
    arg0 /= (arg3 * 0.5);
    if (arg0 < 1)
    {
        return (arg1 * 0.5 * power(arg0, 4)) + arg3;
    }
    return (arg1 * -0.5 * (power(arg0 - 2, 4) - 2)) + arg3;
}

function EaseInQuint(arg0, arg1, arg2, arg3)
{
    return (arg1 * power(arg0 / arg3, 5)) + arg3;
}

function EaseOutQuint(arg0, arg1, arg2, arg3)
{
    return (arg1 * (power((arg0 / arg3) - 1, 5) + 1)) + arg3;
}

function EaseInOutQuint(arg0, arg1, arg2, arg3)
{
    arg0 /= (arg3 * 0.5);
    if (arg0 < 1)
    {
        return (arg1 * 0.5 * power(arg0, 5)) + arg3;
    }
    return (arg1 * 0.5 * (power(arg0 - 2, 5) + 2)) + arg3;
}

function EaseInSine(arg0, arg1, arg2, arg3)
{
    return (arg1 * (1 - cos((arg0 / arg3) * 1.5707963267948966))) + arg3;
}

function EaseOutSine(arg0, arg1, arg2, arg3)
{
    return (arg1 * sin((arg0 / arg3) * 1.5707963267948966)) + arg3;
}

function EaseInOutSine(arg0, arg1, arg2, arg3)
{
    return (arg1 * 0.5 * (1 - cos((pi * arg0) / arg3))) + arg3;
}

function EaseInCirc(arg0, arg1, arg2, arg3)
{
    arg0 /= arg3;
    return (arg1 * (1 - sqrt(1 - (arg0 * arg0)))) + arg3;
}

function EaseOutCirc(arg0, arg1, arg2, arg3)
{
    arg0 = (arg0 / arg3) - 1;
    return (arg1 * sqrt(1 - (arg0 * arg0))) + arg3;
}

function EaseInOutCirc(arg0, arg1, arg2, arg3)
{
    arg0 /= (arg3 * 0.5);
    if (arg0 < 1)
    {
        return (arg1 * 0.5 * (1 - sqrt(1 - (arg0 * arg0)))) + arg3;
    }
    arg0 -= 2;
    return (arg1 * 0.5 * (sqrt(1 - (arg0 * arg0)) + 1)) + arg3;
}

function EaseInExpo(arg0, arg1, arg2, arg3)
{
    return (arg1 * power(2, 10 * ((arg0 / arg3) - 1))) + arg3;
}

function EaseOutExpo(arg0, arg1, arg2, arg3)
{
    return (arg1 * (-power(2, (-10 * arg0) / arg3) + 1)) + arg3;
}

function EaseInOutExpo(arg0, arg1, arg2, arg3)
{
    arg0 /= (arg3 * 0.5);
    if (arg0 < 1)
    {
        return (arg1 * 0.5 * power(2, 10 * --arg0)) + arg3;
    }
    return (arg1 * 0.5 * (-power(2, -10 * --arg0) + 2)) + arg3;
}

function EaseInElastic(arg0, arg1, arg2, arg3)
{
    var _s = 1.70158;
    var _p = 0;
    var _a = arg1;
    if (arg0 == 0 || _a == 0)
    {
        return arg3;
    }
    arg0 /= arg3;
    if (arg0 == 1)
    {
        return arg3 + arg1;
    }
    if (_p == 0)
    {
        _p = arg3 * 0.3;
    }
    if (_a < abs(arg1))
    {
        _a = arg1;
        _s = _p * 0.25;
    }
    else
    {
        _s = (_p / (2 * pi)) * arcsin(arg1 / _a);
    }
    return -(_a * power(2, 10 * --arg0) * sin((((arg0 * arg3) - _s) * (2 * pi)) / _p)) + arg3;
}

function EaseOutElastic(arg0, arg1, arg2, arg3)
{
    var _s = 1.70158;
    var _p = 0;
    var _a = arg1;
    if (arg0 == 0 || _a == 0)
    {
        return arg3;
    }
    arg0 /= arg3;
    if (arg0 == 1)
    {
        return arg3 + arg1;
    }
    if (_p == 0)
    {
        _p = arg3 * 0.3;
    }
    if (_a < abs(arg1))
    {
        _a = arg1;
        _s = _p * 0.25;
    }
    else
    {
        _s = (_p / (2 * pi)) * arcsin(arg1 / _a);
    }
    return (_a * power(2, -10 * arg0) * sin((((arg0 * arg3) - _s) * (2 * pi)) / _p)) + arg1 + arg3;
}

function EaseInOutElastic(arg0, arg1, arg2, arg3)
{
    var _s = 1.70158;
    var _p = 0;
    var _a = arg1;
    if (arg0 == 0 || _a == 0)
    {
        return arg3;
    }
    arg0 /= (arg3 * 0.5);
    if (arg0 == 2)
    {
        return arg3 + arg1;
    }
    if (_p == 0)
    {
        _p = arg3 * 0.44999999999999996;
    }
    if (_a < abs(arg1))
    {
        _a = arg1;
        _s = _p * 0.25;
    }
    else
    {
        _s = (_p / (2 * pi)) * arcsin(arg1 / _a);
    }
    if (arg0 < 1)
    {
        return (-0.5 * (_a * power(2, 10 * --arg0) * sin((((arg0 * arg3) - _s) * (2 * pi)) / _p))) + arg3;
    }
    return (_a * power(2, -10 * --arg0) * sin((((arg0 * arg3) - _s) * (2 * pi)) / _p) * 0.5) + arg1 + arg3;
}

function EaseInBack(arg0, arg1, arg2, arg3)
{
    var _s = 1.70158;
    arg0 /= arg3;
    return (arg1 * arg0 * arg0 * (((_s + 1) * arg0) - _s)) + arg3;
}

function EaseOutBack(arg0, arg1, arg2, arg3)
{
    var _s = 1.70158;
    arg0 = (arg0 / arg3) - 1;
    return (arg1 * ((arg0 * arg0 * (((_s + 1) * arg0) + _s)) + 1)) + arg3;
}

function EaseInOutBack(arg0, arg1, arg2, arg3)
{
    var _s = 1.70158;
    arg0 = (arg0 / arg3) * 2;
    if (arg0 < 1)
    {
        _s *= 1.525;
        return (arg1 * 0.5 * (arg0 * arg0 * (((_s + 1) * arg0) - _s))) + arg3;
    }
    arg0 -= 2;
    _s *= 1.525;
    return (arg1 * 0.5 * ((arg0 * arg0 * (((_s + 1) * arg0) + _s)) + 2)) + arg3;
}

function EaseInBounce(arg0, arg1, arg2, arg3)
{
    return (arg1 - EaseOutBounce(arg3 - arg0, 0, arg1, arg3)) + arg3;
}

function EaseOutBounce(arg0, arg1, arg2, arg3)
{
    arg0 /= arg3;
    if (arg0 < 0.36363636363636365)
    {
        return (arg1 * 7.5625 * arg0 * arg0) + arg3;
    }
    else if (arg0 < 0.7272727272727273)
    {
        arg0 -= 0.5454545454545454;
        return (arg1 * ((7.5625 * arg0 * arg0) + 0.75)) + arg3;
    }
    else if (arg0 < 0.9090909090909091)
    {
        arg0 -= 0.8181818181818182;
        return (arg1 * ((7.5625 * arg0 * arg0) + 0.9375)) + arg3;
    }
    else
    {
        arg0 -= 0.9545454545454546;
        return (arg1 * ((7.5625 * arg0 * arg0) + 0.984375)) + arg3;
    }
}

function EaseInOutBounce(arg0, arg1, arg2, arg3)
{
    if (arg0 < (arg3 * 0.5))
    {
        return (EaseInBounce(arg0 * 2, 0, arg1, arg3) * 0.5) + arg3;
    }
    return (EaseOutBounce((arg0 * 2) - arg3, 0, arg1, arg3) * 0.5) + (arg1 * 0.5) + arg3;
}
