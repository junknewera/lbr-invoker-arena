logdsmap("async steam");
if (!ds_exists(async_load, ds_type_map))
{
    exit;
}
if (!ds_map_exists(async_load, "event_type"))
{
    exit;
}
handle_steam_iap_response(async_load);
