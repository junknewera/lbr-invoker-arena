function get_instance_top_position(arg0, arg1, arg2)
{
    var _top_instance = -1;
    var _list = ds_list_create();
    var _num = collision_point_list(arg0, arg1, arg2, false, true, _list, false);
    if (_num > 0)
    {
        for (var i = 0; i < _num; i++)
        {
            _top_instance = ds_list_find_value(_list, ds_list_size(_list) - 1);
        }
    }
    ds_list_destroy(_list);
    return _top_instance;
}
