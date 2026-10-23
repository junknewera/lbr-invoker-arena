if (is_undefined(await_string_id))
{
    exit;
}
var async_id = ds_map_find_value(async_load, "id");
if (await_string_id != async_id)
{
    exit;
}
input = ds_map_find_value(async_load, "result");
await_string_id = undefined;
