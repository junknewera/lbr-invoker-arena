function drop_random_relic(arg0 = undefined)
{
    var item = get_random_relic(arg0);
    return item.spawn();
}
