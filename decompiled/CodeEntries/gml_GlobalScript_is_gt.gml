function is_gt(arg0, arg1)
{
    if (is_bignum(arg0) || is_bignum(arg1))
    {
        return bignum_compare(arg0, arg1) == -1;
    }
    return arg0 > arg1;
}
