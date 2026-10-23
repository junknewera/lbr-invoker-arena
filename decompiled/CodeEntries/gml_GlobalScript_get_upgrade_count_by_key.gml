function get_upgrade_count_by_key(arg0)
{
    var sum = _sum(global.shops, function(arg0, arg1, arg2, arg3)
    {
        return _sum(arg0, function(arg0, arg1, arg2, arg3)
        {
            if (arg1 == arg3._find_key)
            {
                return arg0.data.count;
            }
            return 0;
        }, 
        {
            _find_key: arg3._find_key
        });
    }, 
    {
        _find_key: arg0
    });
    return sum;
}
