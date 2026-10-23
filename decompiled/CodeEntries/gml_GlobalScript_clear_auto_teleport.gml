function clear_auto_teleport()
{
    _map(global.areas, function(arg0)
    {
        arg0.data.auto_teleport = false;
    }, false);
}
