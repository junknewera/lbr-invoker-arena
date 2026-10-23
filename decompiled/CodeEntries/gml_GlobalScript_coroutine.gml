function coroutine(arg0, arg1 = __void, arg2 = undefined)
{
    var co_item = variable_struct_get(global.coroutines, arg0);
    if (!is_undefined(co_item))
    {
        exit;
    }
    variable_struct_set(global.coroutines, co_item, new Coroutine_Item(arg0, arg1, arg2));
}
