function __zip()
{
    if (argument_count == 0)
    {
        return array_create(0);
    }
    var result = [];
    var len = array_length(argument[0]);
    for (i = 1; i < argument_count; i++)
    {
        len = max(len, array_length(argument[i]));
    }
    result = array_create(argument_count);
    var i = len - 1;
    while (i >= 0)
    {
        var j = argument_count - 1;
        while (j >= 0)
        {
            var arr = argument[j];
            if (i >= array_length(arr))
            {
                result[i][j] = 0;
            }
            else
            {
                result[i][j] = arr[i];
            }
            j--;
        }
        i--;
    }
    return result;
}

function _and(arg0, arg1)
{
    return arg0 && arg1;
}

function _array_of()
{
    var result = [];
    i = argument_count - 1;
    while (i >= 0)
    {
        result[i] = argument[i];
        i--;
    }
    return result;
}

function _backward(arg0)
{
    var result = [];
    var len = array_length(arg0);
    var i = len - 1;
    while (i >= 0)
    {
        result[i] = @@array_get@@(arg0, len - 1 - i);
        i--;
    }
    return result;
}

function _chunk(arg0, arg1)
{
    if (argument_count != 2)
    {
        return false;
    }
    var result = [];
    if (arg1 == 0)
    {
        return array_create(0);
    }
    var len = array_length(arg0);
    var i = len - 1;
    while (i >= 0)
    {
        result[i / arg1][i % arg1] = arg0[i];
        i--;
    }
    return result;
}

function _clone_array(arg0)
{
    var result = [];
    array_copy(result, 0, arg0, 0, array_length(arg0));
    return result;
}

function _collect(arg0)
{
    var result = [];
    var i = instance_number(arg0);
    while (i >= 0)
    {
        array_set(result, i, instance_find(arg0, i));
        i--;
    }
    return result;
}

function _concat(arg0, arg1)
{
    var n = array_length(arg0);
    var arr = _clone_array(arg0);
    var i = array_length(arg1) - 1;
    while (i >= 0)
    {
        array_set(arr, n + i, @@array_get@@(arg1, i));
        i--;
    }
    return arr;
}

function _contains()
{
    var collection = argument[0];
    var target = argument[1];
    var fromIndex = (argument_count > 2) ? argument[2] : 0;
    var dsType = (argument_count > 3) ? argument[3] : 2;
    var collectionType = typeof(collection);
    if (fromIndex != 0)
    {
        if (collectionType == "array")
        {
            if (fromIndex > array_length(collection))
            {
                return false;
            }
            collection = _slice(collection, fromIndex);
        }
        else if (collectionType == "number" && dsType == 2)
        {
            if (fromIndex > ds_list_size(collection))
            {
                return false;
            }
            var inCollection = collection;
            collection = ds_list_create();
            ds_list_copy(collection, inCollection);
            for (var i = 0; i < fromIndex; i++)
            {
                ds_list_delete(collection, 0);
            }
        }
        else if (collectionType == "string")
        {
            if (fromIndex > string_length(collection))
            {
                return false;
            }
            collection = string_delete(collection, 1, fromIndex);
        }
    }
    if (collectionType == "string")
    {
        return string_count(string(target), collection) > 0;
    }
    else if (collectionType == "array")
    {
        var asList = _to_list(collection);
        var found = ds_list_find_index(asList, target);
        ds_list_destroy(asList);
        return found != -1;
    }
    else if (collectionType == "number")
    {
        if (dsType == 1)
        {
            var keys = _keys(collection);
            var n = array_length(keys);
            if (fromIndex > n)
            {
                return false;
            }
            for (var i = fromIndex; i < n; i++)
            {
                var thisValue = ds_map_find_value(collection, @@array_get@@(keys, i));
                if (typeof(thisValue) == typeof(target) && thisValue == target)
                {
                    return true;
                }
            }
            return false;
        }
        else if (dsType == 2)
        {
            var found = ds_list_find_index(collection, target) != -1;
            if (fromIndex != 0)
            {
                ds_list_destroy(collection);
            }
            return found;
        }
        else
        {
            show_error("Cannot look for value in ds type: " + string(dsType) + "\nIf using _contains with a data structure, it must be a list or map.", false);
            return false;
        }
    }
    else if (is_undefined(collection))
    {
        return false;
    }
    else
    {
        show_error("Cannot look for value in type: " + typeof(collection) + "\nCollection must be a string, array, map or list.", false);
        return false;
    }
    return false;
}

function _destroy(arg0)
{
    with (arg0)
    {
        instance_destroy();
    }
}

function _difference()
{
    if (argument_count == 0)
    {
        return array_create(0);
    }
    if (argument_count == 1)
    {
        return argument[0];
    }
    var result = [];
    var tempSet = ds_map_create();
    for (var i = 1; i < argument_count; i++)
    {
        arr = argument[i];
        len = array_length(arr);
        for (var j = 0; j < len; j++)
        {
            if (ds_map_find_value(tempSet, @@array_get@@(arr, j)) != 1)
            {
                ds_map_set(tempSet, @@array_get@@(arr, j), 1);
            }
        }
    }
    var n = 0;
    var arr = argument[0];
    var len = array_length(arr);
    result = array_create(0);
    for (var i = 0; i < len; i++)
    {
        if (ds_map_find_value(tempSet, @@array_get@@(arr, i)) != 1)
        {
            result[n++] = arr[i];
        }
    }
    ds_map_destroy(tempSet);
    return result;
}

function _difference_by()
{
    if (argument_count == 0)
    {
        return array_create(0);
    }
    if (argument_count == 1)
    {
        return argument[0];
    }
    var result = [];
    var iter = argument[argument_count - 1];
    var tempSet = ds_map_create();
    for (var i = 1; i < argument_count; i++)
    {
        arr = argument[i];
        len = array_length(arr);
        for (var j = 0; j < len; j++)
        {
            var crit = script_execute(iter, arr[j]);
            if (ds_map_find_value(tempSet, crit) != 1)
            {
                ds_map_set(tempSet, crit, 1);
            }
        }
    }
    var n = 0;
    var arr = argument[0];
    var len = array_length(arr);
    result = array_create(0);
    for (var i = 0; i < len; i++)
    {
        var crit = script_execute(iter, arr[i]);
        if (ds_map_find_value(tempSet, crit) != 1)
        {
            result[n++] = arr[i];
        }
    }
    ds_map_destroy(tempSet);
    return result;
}

function _drop(arg0, arg1)
{
    var result = [];
    if (arg1 == 0)
    {
        return arg0;
    }
    var n = 0;
    var len = array_length(arg0);
    result = array_create(clamp(len - arg1, 0, len));
    for (var i = arg1; i < len; i++)
    {
        result[n++] = arg0[i];
    }
    return result;
}

function _drop_right(arg0, arg1)
{
    var result = [];
    if (arg1 == 0)
    {
        return arg0;
    }
    var n = 0;
    var len = array_length(arg0) - arg1;
    result = array_create(max(len, 0));
    for (var i = 0; i < len; i++)
    {
        result[n++] = arg0[i];
    }
    return result;
}

function _error()
{
    var message = argument[0];
    var fatal = (argument_count > 1) ? argument[1] : false;
    if (fatal || debug_mode)
    {
        show_error(message, fatal);
    }
    else
    {
        _log("ERROR: " + message);
    }
}

function _fill()
{
    var i, last;
    if (argument_count == 2)
    {
        i = 0;
        last = array_length(argument[0]);
    }
    else if (argument_count == 4)
    {
        i = argument[2];
        last = argument[3];
    }
    else
    {
        return false;
    }
    var arr = argument[0];
    while (i < last)
    {
        array_set(arr, i, argument[1]);
        i++;
    }
    return arr;
}

function _filter(arg0, arg1)
{
    var result = [];
    var j = 0;
    var type = _type_of(arg0);
    if (is_struct(arg0))
    {
        var __struct = arg0;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            if (arg1(mitem))
            {
                array_set(result, j, mitem);
                j++;
            }
        }
    }
    else if (is_array(arg0))
    {
        var length = array_length(arg0);
        for (var i = 0; i < length; i++)
        {
            if (arg1(@@array_get@@(arg0, i)))
            {
                array_set(result, j, @@array_get@@(arg0, i));
                j++;
            }
        }
    }
    else if (type == "real")
    {
        var length = ds_list_size(arg0);
        result = ds_list_create();
        for (var i = 0; i < length; i++)
        {
            if (arg1(ds_list_find_value(arg0, i)))
            {
                ds_list_set(result, j, ds_list_find_value(arg0, i));
                j++;
            }
        }
    }
    else
    {
        show_error("Cannot filter type: " + type + "\nCollection must be an array or ds_list", false);
    }
    return result;
}

function _filteri(arg0, arg1, arg2)
{
    var result = [];
    var j = 0;
    var type = _type_of(arg0);
    var filterMethod = method(arg1, arg2);
    if (type == "real")
    {
        var length = ds_list_size(arg0);
        result = ds_list_create();
        for (var i = 0; i < length; i++)
        {
            if (filterMethod(ds_list_find_value(arg0, i)))
            {
                ds_list_set(result, j, ds_list_find_value(arg0, i));
                j++;
            }
        }
    }
    else if (type == "array")
    {
        var length = array_length(arg0);
        for (var i = 0; i < length; i++)
        {
            if (filterMethod(@@array_get@@(arg0, i)))
            {
                result[j] = @@array_get@@(arg0, i);
                j++;
            }
        }
    }
    else
    {
        show_error("Cannot filter type: " + type + "\nCollection must be an array or ds_list", false);
    }
    return result;
}

function _find(arg0, arg1)
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
            if (arg1(mitem, mkey))
            {
                return mitem;
            }
        }
    }
    else if (is_array(arg0))
    {
        var n = array_length(arg0);
        for (var i = 0; i < n; i++)
        {
            if (arg1(@@array_get@@(arg0, i)))
            {
                return @@array_get@@(arg0, i);
            }
        }
    }
    return undefined;
}

function _free()
{
    var dsId = argument[0];
    var type;
    if (argument_count == 1)
    {
        type = 1;
    }
    else
    {
        type = argument[1];
    }
    if (_is_equal(type, "partial"))
    {
        type = 1;
    }
    switch (type)
    {
        case 1:
            ds_map_destroy(dsId);
            break;
        case 2:
            ds_list_destroy(dsId);
            break;
    }
}

function _get(arg0, arg1)
{
    var locationArray = _split(arg1, ".");
    var n = array_length(locationArray);
    for (var i = 0; i < n; i++)
    {
        var thisLoc = @@array_get@@(locationArray, i);
        if (ds_map_exists(arg0, thisLoc))
        {
            arg0 = ds_map_find_value(arg0, thisLoc);
        }
        else
        {
            return undefined;
        }
    }
    return arg0;
}

function _index_of(arg0, arg1)
{
    if (is_real(arg0))
    {
        return ds_list_find_index(arg0, arg1);
    }
    var n = array_length(arg0);
    for (var i = 0; i < n; i++)
    {
        if (_is_equal(@@array_get@@(arg0, i), arg1))
        {
            return i;
        }
    }
    return -1;
}

function _intersection()
{
    if (argument_count == 0)
    {
        return array_create(0);
    }
    if (argument_count == 1)
    {
        return argument[0];
    }
    var result = [];
    var tempSet = ds_map_create();
    for (var i = 1; i < argument_count; i++)
    {
        arr = argument[i];
        len = array_length(arr);
        for (var j = 0; j < len; j++)
        {
            if (i == 1 || ds_map_find_value(tempSet, @@array_get@@(arr, j)) == (i - 1))
            {
                ds_map_set(tempSet, @@array_get@@(arr, j), i);
            }
        }
    }
    var n = 0;
    var arr = argument[0];
    var len = array_length(arr);
    result = array_create(0);
    for (var i = 0; i < len; i++)
    {
        if (ds_map_find_value(tempSet, @@array_get@@(arr, i)) == (argument_count - 1))
        {
            ds_map_set_post(tempSet, @@array_get@@(arr, i), ds_map_find_value(tempSet, @@array_get@@(arr, i)) + 1);
            result[n++] = arr[i];
        }
    }
    ds_map_destroy(tempSet);
    return result;
}

function _intersection_by()
{
    if (argument_count == 0)
    {
        return array_create(0);
    }
    if (argument_count == 1)
    {
        return argument[0];
    }
    var result = [];
    var iter = argument[argument_count - 1];
    var tempSet = ds_map_create();
    for (var i = 1; i < argument_count; i++)
    {
        arr = argument[i];
        len = array_length(arr);
        for (var j = 0; j < len; j++)
        {
            var crit = script_execute(iter, arr[j]);
            if (i == 1 || ds_map_find_value(tempSet, crit) == (i - 1))
            {
                ds_map_set(tempSet, crit, i);
            }
        }
    }
    var n = 0;
    var arr = argument[0];
    var len = array_length(arr);
    result = array_create(0);
    for (var i = 0; i < len; i++)
    {
        var crit = script_execute(iter, arr[i]);
        if (ds_map_find_value(tempSet, crit) == (argument_count - 2))
        {
            ds_map_set_post(tempSet, crit, ds_map_find_value(tempSet, crit) + 1);
            result[n++] = arr[i];
        }
    }
    ds_map_destroy(tempSet);
    return result;
}

function _is_equal()
{
    var compareA = argument[0];
    var compareB = argument[1];
    var type;
    if (argument_count == 3)
    {
        type = argument[2];
    }
    else if (_type_of(compareA) != _type_of(compareB))
    {
        return false;
    }
    else if (_type_of(compareA) == "array")
    {
        if (array_length(compareA) != array_length(compareB))
        {
            return false;
        }
        var i = array_length(compareA) - 1;
        while (i >= 0)
        {
            if (!_is_equal(@@array_get@@(compareA, i), @@array_get@@(compareB, i)))
            {
                return false;
            }
            i--;
        }
        return true;
    }
    else
    {
        return compareA == compareB;
    }
    if (type == 1)
    {
        var aKeys = _keys(compareA);
        var bKeys = _keys(compareB);
        if (!_is_equal(aKeys, bKeys))
        {
            return false;
        }
        var i = array_length(aKeys) - 1;
        while (i >= 0)
        {
            if (!_is_equal(ds_map_find_value(compareA, aKeys[i]), ds_map_find_value(compareB, aKeys[i])))
            {
                return false;
            }
            i--;
        }
        return true;
    }
    else if (type == 2)
    {
        if (ds_list_size(compareA) != ds_list_size(compareB))
        {
            return false;
        }
        var i = ds_list_size(compareA);
        while (i >= 0)
        {
            if (!_is_equal(ds_list_find_value(compareA, i), ds_list_find_value(compareB, i)))
            {
                return false;
            }
            i--;
        }
        return true;
    }
}

function _join(arg0, arg1)
{
    var outString = "";
    var inArray = arg0;
    var joiner = arg1;
    var arrLength = array_length(inArray);
    var maxIndex = arrLength - 1;
    var stringJoiner = string(joiner);
    for (var i = 0; i < arrLength; i++)
    {
        outString += string(@@array_get@@(inArray, i));
        if (i != maxIndex)
        {
            outString += stringJoiner;
        }
    }
    return outString;
}

function _keys(arg0)
{
    var nextKey = ds_map_find_first(arg0);
    var nextInd = 0;
    var keys = [];
    while (!is_undefined(nextKey))
    {
        keys[nextInd++] = nextKey;
        nextKey = ds_map_find_next(arg0, nextKey);
    }
    return keys;
}

function _list_of()
{
    var list = ds_list_create();
    for (var i = 0; i < argument_count; i++)
    {
        ds_list_add(list, argument[i]);
    }
    return list;
}

function _log()
{
    var toshow = "";
    for (var i = 0; i < argument_count; i++)
    {
        if (i != 0)
        {
            toshow += ", ";
        }
        if (is_array(argument[i]))
        {
            toshow += ("[" + _join(argument[i], ", ") + "]");
        }
        else
        {
            toshow += string(argument[i]);
        }
    }
    show_debug_message(toshow);
}

function _map(arg0, arg1, arg2 = undefined)
{
    var result = [];
    var type = typeof(arg0);
    if (is_array(arg0))
    {
        for (var i = 0; i < array_length(arg0); i++)
        {
            array_set(result, i, arg1(@@array_get@@(arg0, i), i, arg2));
        }
    }
    else if (is_struct(arg0))
    {
        var prop_names = variable_struct_get_names(arg0);
        var len = array_length(prop_names);
        for (var i = 0; i < len; i++)
        {
            array_set(result, i, arg1(variable_struct_get(arg0, prop_names[i]), prop_names[i], i, arg2));
        }
    }
    else if (type == "number" && ds_exists(arg0, ds_type_map))
    {
        var keys = _keys(arg0);
        var i = array_length(keys) - 1;
        while (i >= 0)
        {
            array_set(result, i, _run(arg1, ds_map_find_value(arg0, keys[i]), keys[i], i, arg2));
            i--;
        }
    }
    else if (type == "number" && ds_exists(arg0, ds_type_list))
    {
        var i = ds_list_size(arg0) - 1;
        while (i >= 0)
        {
            array_set(result, i, _run(arg1, ds_list_find_value(arg0, i), i, arg2));
            i--;
        }
    }
    return result;
}

function _map_of()
{
    if ((argument_count % 2) != 0)
    {
        _error("_map_of must take an even number of arguments. This call will return an empty map.", false);
        return ds_map_create();
    }
    for (var i = 0; i < argument_count; i += 2)
    {
        var key = argument[i];
        var type = typeof(key);
        if (type != "number" && type != "string")
        {
            _error("_map_of must take keys that are strings or integers. This call will return an empty map.\nOffending key: " + string(key), false);
            return ds_map_create();
        }
    }
    var map = ds_map_create();
    for (var i = 0; i < argument_count; i++)
    {
        var key = argument[i++];
        var value = argument[i];
        ds_map_set(map, key, value);
    }
    return map;
}

function _mapi(arg0, arg1, arg2, arg3)
{
    var result = [];
    var mfunc = method(arg1, arg2);
    if (is_struct(arg0))
    {
        var prop_names = variable_struct_get_names(arg0);
        for (var i = 0; i < array_length(prop_names); i++)
        {
            array_set(result, i, mfunc(variable_struct_get(arg0, @@array_get@@(prop_names, i)), @@array_get@@(prop_names, i), i, arg3));
        }
    }
    else if (is_array(arg0))
    {
        for (var i = 0; i < array_length(arg0); i++)
        {
            array_set(result, i, mfunc(@@array_get@@(arg0, i), i, arg3));
        }
    }
    else
    {
        exit;
    }
    return result;
}

function _none(arg0, arg1, arg2)
{
    var result = _map(arg0, arg1, arg2);
    for (var i = 0; i < array_length(result); i++)
    {
        if (result[i])
        {
            return false;
        }
    }
    return true;
}

function _nth(arg0, arg1)
{
    var n = arg1;
    var type = _type_of(arg0);
    if (type == "real")
    {
        if (n >= 0)
        {
            return ds_list_find_value(arg0, n);
        }
        else
        {
            return ds_list_find_value(arg0, ds_list_size(arg0) + n);
        }
    }
    else if (type == "array")
    {
        if (n >= 0)
        {
            return @@array_get@@(arg0, n);
        }
        else
        {
            return @@array_get@@(arg0, array_length(arg0) + n);
        }
    }
    else
    {
        show_error("Trying to return nth element of an incorrect type: " + type + "\nCollection must be a ds_list or array.", false);
    }
}

function _or(arg0, arg1)
{
    return arg0 || arg1;
}

function _partial()
{
    array_set(arr, array_length(arr), value);
    return arr;
}

function _reduce()
{
    var collection = argument[0];
    var func = argument[1];
    var result = (argument_count > 2) ? argument[2] : undefined;
    var type = _type_of(collection);
    if (type == "real")
    {
        var length = ds_list_size(collection);
        for (var i = 0; i < length; i++)
        {
            result = _run(func, result, ds_list_find_value(collection, i));
        }
    }
    else if (type == "array")
    {
        var length = array_length(collection);
        for (var i = 0; i < length; i++)
        {
            result = _run(func, result, @@array_get@@(collection, i));
        }
    }
    else
    {
        show_error("Cannot reduce type: " + type + "\nCollection must be an array or ds_list", false);
    }
    return result;
}

function _reverse(arg0)
{
    var len = array_length(arg0);
    var half = len div 2;
    for (var i = 0; i < half; i++)
    {
        var tmp = @@array_get@@(arg0, i);
        array_set(arg0, i, @@array_get@@(arg0, len - 1 - i));
        array_set(arg0, len - 1 - i, tmp);
    }
    return arg0;
}

function _run()
{
    var func = argument[0];
    var args = undefined;
    var i = argument_count - 1;
    while (i >= 1)
    {
        args[i - 1] = argument[i];
        i--;
    }
    if (_type_of(func) == "real" && ds_exists(func, ds_type_map) && _is_equal(ds_map_find_value(func, "partial"), "partial"))
    {
        var partialId = func;
        func = ds_map_find_value(partialId, "function");
        args = _concat(ds_map_find_value(partialId, "args"), args);
    }
    return _spread(func, args);
}

function _set()
{
    var map = argument[0];
    var location = argument[1];
    var value = argument[2];
    var type = -10;
    if (argument_count > 3)
    {
        type = argument[3];
    }
    var locationArray = _split(location, ".");
    var n = array_length(locationArray);
    var finalLocation = locationArray[n - 1];
    for (var i = 0; i < (n - 1); i++)
    {
        var thisLoc = locationArray[i];
        var prev = map;
        map = ds_map_find_value(map, thisLoc);
        if (is_undefined(map))
        {
            ds_map_add_map(prev, thisLoc, ds_map_create());
            map = ds_map_find_value(prev, thisLoc);
        }
    }
    if (type == -10)
    {
        ds_map_set(map, finalLocation, value);
    }
    else if (type == 1)
    {
        ds_map_add_map(map, finalLocation, value);
    }
    else if (type == 2)
    {
        ds_map_add_list(map, finalLocation, value);
    }
    else
    {
        show_error("Unknown type for _set: " + string(type), false);
    }
}

function _slice()
{
    var result = [];
    var array = argument[0];
    var starti = argument[1];
    var endi = 0;
    if (argument_count == 3)
    {
        endi = argument[2];
    }
    else
    {
        endi = array_length(array);
    }
    var i = endi - 1;
    while (i >= starti)
    {
        result[i - starti] = @@array_get@@(array, i);
        i--;
    }
    return result;
}

function _split(arg0, arg1)
{
    var splitterLength = string_length(arg1);
    var result = [];
    var count = 0;
    while (string_pos(arg1, arg0) > 0)
    {
        var splitterLocation = string_pos(arg1, arg0);
        var part = string_copy(arg0, 1, splitterLocation - 1);
        result[count] = part;
        count++;
        arg0 = string_delete(arg0, 1, (splitterLocation + splitterLength) - 1);
    }
    result[count] = arg0;
    return result;
}

function _spread()
{
    var func = argument[0];
    if (is_undefined(argument[1]))
    {
        return script_execute(func);
    }
    var args = argument[1];
    switch (array_length(args))
    {
        case 1:
            return func(@@array_get@@(args, 0));
        case 2:
            return func(@@array_get@@(args, 0), @@array_get@@(args, 1));
        case 3:
            return func(@@array_get@@(args, 0), @@array_get@@(args, 1), @@array_get@@(args, 2));
        case 4:
            return func(@@array_get@@(args, 0), @@array_get@@(args, 1), @@array_get@@(args, 2), @@array_get@@(args, 3));
        case 5:
            return func(@@array_get@@(args, 0), @@array_get@@(args, 1), @@array_get@@(args, 2), @@array_get@@(args, 3), @@array_get@@(args, 4));
        case 6:
            return func(@@array_get@@(args, 0), @@array_get@@(args, 1), @@array_get@@(args, 2), @@array_get@@(args, 3), @@array_get@@(args, 4), @@array_get@@(args, 5));
        case 7:
            return func(@@array_get@@(args, 0), @@array_get@@(args, 1), @@array_get@@(args, 2), @@array_get@@(args, 3), @@array_get@@(args, 4), @@array_get@@(args, 5), @@array_get@@(args, 6));
        case 8:
            return func(@@array_get@@(args, 0), @@array_get@@(args, 1), @@array_get@@(args, 2), @@array_get@@(args, 3), @@array_get@@(args, 4), @@array_get@@(args, 5), @@array_get@@(args, 6), @@array_get@@(args, 7));
        case 9:
            return func(@@array_get@@(args, 0), @@array_get@@(args, 1), @@array_get@@(args, 2), @@array_get@@(args, 3), @@array_get@@(args, 4), @@array_get@@(args, 5), @@array_get@@(args, 6), @@array_get@@(args, 7), @@array_get@@(args, 8));
        case 10:
            return func(@@array_get@@(args, 0), @@array_get@@(args, 1), @@array_get@@(args, 2), @@array_get@@(args, 3), @@array_get@@(args, 4), @@array_get@@(args, 5), @@array_get@@(args, 6), @@array_get@@(args, 7), @@array_get@@(args, 8), @@array_get@@(args, 9));
        case 11:
            return func(@@array_get@@(args, 0), @@array_get@@(args, 1), @@array_get@@(args, 2), @@array_get@@(args, 3), @@array_get@@(args, 4), @@array_get@@(args, 5), @@array_get@@(args, 6), @@array_get@@(args, 7), @@array_get@@(args, 8), @@array_get@@(args, 9), @@array_get@@(args, 10));
        case 12:
            return func(@@array_get@@(args, 0), @@array_get@@(args, 1), @@array_get@@(args, 2), @@array_get@@(args, 3), @@array_get@@(args, 4), @@array_get@@(args, 5), @@array_get@@(args, 6), @@array_get@@(args, 7), @@array_get@@(args, 8), @@array_get@@(args, 9), @@array_get@@(args, 10), @@array_get@@(args, 11));
        case 13:
            return func(@@array_get@@(args, 0), @@array_get@@(args, 1), @@array_get@@(args, 2), @@array_get@@(args, 3), @@array_get@@(args, 4), @@array_get@@(args, 5), @@array_get@@(args, 6), @@array_get@@(args, 7), @@array_get@@(args, 8), @@array_get@@(args, 9), @@array_get@@(args, 10), @@array_get@@(args, 11), @@array_get@@(args, 12));
        case 14:
            return func(@@array_get@@(args, 0), @@array_get@@(args, 1), @@array_get@@(args, 2), @@array_get@@(args, 3), @@array_get@@(args, 4), @@array_get@@(args, 5), @@array_get@@(args, 6), @@array_get@@(args, 7), @@array_get@@(args, 8), @@array_get@@(args, 9), @@array_get@@(args, 10), @@array_get@@(args, 11), @@array_get@@(args, 12), @@array_get@@(args, 13));
        case 15:
            return func(@@array_get@@(args, 0), @@array_get@@(args, 1), @@array_get@@(args, 2), @@array_get@@(args, 3), @@array_get@@(args, 4), @@array_get@@(args, 5), @@array_get@@(args, 6), @@array_get@@(args, 7), @@array_get@@(args, 8), @@array_get@@(args, 9), @@array_get@@(args, 10), @@array_get@@(args, 11), @@array_get@@(args, 12), @@array_get@@(args, 13), @@array_get@@(args, 14));
    }
}

function _sum(arg0, arg1, arg2 = undefined)
{
    var result = _map(arg0, arg1, arg2);
    var value = 0;
    for (var i = 0; i < array_length(result); i++)
    {
        value = bignum_add_safe(value, result[i]);
    }
    return value;
}

function _times(arg0, arg1)
{
    var arr;
    arr[arg0 - 1] = 0;
    for (var i = 0; i < arg0; i++)
    {
        array_set(arr, i, _run(arg1, i));
    }
    return arr;
}

function _to_array(arg0)
{
    var listSize = ds_list_size(arg0);
    var array;
    array[0] = undefined;
    var i = listSize - 1;
    while (i >= 0)
    {
        array_set(array, i, ds_list_find_value(arg0, i));
        i--;
    }
    if (is_undefined(array[0]))
    {
        return undefined;
    }
    return array;
}

function _to_list(arg0)
{
    var arrSize = array_length(arg0);
    var list = ds_list_create();
    for (var i = 0; i < arrSize; i++)
    {
        ds_list_add(list, @@array_get@@(arg0, i));
    }
    return list;
}

function _type_of(arg0)
{
    var type = typeof(arg0);
    return (type == "number") ? "real" : type;
}

function _union()
{
    if (argument_count == 0)
    {
        return array_create(0);
    }
    if (argument_count == 1)
    {
        return argument[0];
    }
    var result = [];
    var n = 0;
    var tempSet = ds_map_create();
    result = array_create(0);
    for (var i = 0; i < argument_count; i++)
    {
        var arr = argument[i];
        var len = array_length(arr);
        for (var j = 0; j < len; j++)
        {
            if (ds_map_find_value(tempSet, @@array_get@@(arr, j)) != 1)
            {
                ds_map_set(tempSet, @@array_get@@(arr, j), 1);
                result[n++] = arr[j];
            }
        }
    }
    ds_map_destroy(tempSet);
    return result;
}

function _union_by()
{
    if (argument_count == 0)
    {
        return array_create(0);
    }
    if (argument_count == 1)
    {
        return argument[0];
    }
    var result = [];
    var n = 0;
    var iter = argument[argument_count - 1];
    var tempSet = ds_map_create();
    result = array_create(0);
    for (var i = 0; i < argument_count; i++)
    {
        var arr = argument[i];
        var len = array_length(arr);
        for (var j = 0; j < len; j++)
        {
            var crit = script_execute(iter, arr[j]);
            if (ds_map_find_value(tempSet, crit) != 1)
            {
                ds_map_set(tempSet, crit, 1);
                result[n++] = arr[j];
            }
        }
    }
    ds_map_destroy(tempSet);
    return result;
}

function _uniq(arg0)
{
    var n = array_length(arg0);
    var j = 0;
    var result = undefined;
    var seenMap = ds_map_create();
    if (array_length(arg0) <= 1)
    {
        return arg0;
    }
    for (var i = 0; i < n; i++)
    {
        var val = @@array_get@@(arg0, i);
        if (is_undefined(ds_map_find_value(seenMap, val)))
        {
            ds_map_set(seenMap, val, true);
            result[j++] = val;
        }
    }
    ds_map_destroy(seenMap);
    return result;
}

function _unzip(arg0)
{
    if (argument_count != 1)
    {
        return array_create(0);
    }
    var result = [];
    var len = array_length(arg0);
    var num = array_length(arg0[0]);
    result = array_create(num, 0);
    var i = num - 1;
    while (i >= 0)
    {
        result[i] = array_create(len, 0);
        var j = len - 1;
        while (j >= 0)
        {
            result[i][j] = arg0[j][i];
            j--;
        }
        i--;
    }
    return result;
}

function _without()
{
    if (argument_count == 0)
    {
        return array_create(0);
    }
    if (argument_count == 1)
    {
        return argument[0];
    }
    var result = [];
    var n = 0;
    var arr = argument[0];
    var len = array_length(arr);
    result = array_create(0);
    for (var i = 0; i < len; i++)
    {
        var match = false;
        for (var j = 1; j < argument_count; j++)
        {
            if (@@array_get@@(arr, i) == argument[j])
            {
                match = true;
            }
        }
        if (!match)
        {
            result[n++] = @@array_get@@(arr, i);
        }
    }
    return result;
}

function quicksum(arg0)
{
    var value = 0;
    if (is_struct(arg0))
    {
        var __struct = arg0;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            if (is_struct(mitem) || is_array(mitem))
            {
                value += quicksum(mitem);
            }
            else if (is_numeric(mitem))
            {
                value += mitem;
            }
        }
    }
    else if (is_array(arg0))
    {
        var __array = arg0;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (is_struct(mitem) || is_array(mitem))
            {
                value += quicksum(mitem);
            }
            else if (is_numeric(mitem))
            {
                value += mitem;
            }
        }
    }
    return value;
}
