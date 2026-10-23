// Minimal test framework for running GML tests inside the real GameMaker runner.

function inv_t_fail(_msg)
{
    throw { inv_test_failure: true, message: _msg };
}

function inv_t_eq(_actual, _expected, _label)
{
    if (typeof(_actual) != typeof(_expected) || _actual != _expected)
    {
        inv_t_fail(_label + ": expected " + string(_expected) + ", got " + string(_actual));
    }
}

function inv_t_near(_actual, _expected, _eps, _label)
{
    if (!is_numeric(_actual) || abs(_actual - _expected) > _eps)
    {
        inv_t_fail(_label + ": expected ~" + string(_expected) + ", got " + string(_actual));
    }
}

function inv_t_true(_cond, _label)
{
    if (!_cond)
    {
        inv_t_fail(_label);
    }
}

function inv_t_arr(_actual, _expected, _label)
{
    if (!is_array(_actual) || !array_equals(_actual, _expected))
    {
        inv_t_fail(_label + ": expected " + string(_expected) + ", got " + string(_actual));
    }
}

function inv_test_register(_name, _fn)
{
    if (!variable_global_exists("inv_tests"))
    {
        global.inv_tests = [];
    }
    array_push(global.inv_tests, { name: _name, fn: _fn });
}

function inv_test_error_text(_e)
{
    if (is_struct(_e) && variable_struct_exists(_e, "message"))
    {
        return _e.message;
    }
    return string(_e);
}

function inv_test_run_all(_path)
{
    var _passed = 0;
    var _failed = 0;
    var _lines = [];
    var _tests = variable_global_exists("inv_tests") ? global.inv_tests : [];
    for (var i = 0; i < array_length(_tests); i++)
    {
        var _t = _tests[i];
        try
        {
            _t.fn();
            array_push(_lines, "PASS " + _t.name);
            _passed++;
        }
        catch (_e)
        {
            array_push(_lines, "FAIL " + _t.name + ": " + inv_test_error_text(_e));
            _failed++;
        }
    }
    array_push(_lines, "DONE passed=" + string(_passed) + " failed=" + string(_failed));
    inv_test_write_lines(_path, _lines);
}

function inv_test_write_lines(_path, _lines)
{
    var _f = file_text_open_write(_path);
    for (var i = 0; i < array_length(_lines); i++)
    {
        file_text_write_string(_f, _lines[i]);
        file_text_writeln(_f);
    }
    file_text_close(_f);
}
