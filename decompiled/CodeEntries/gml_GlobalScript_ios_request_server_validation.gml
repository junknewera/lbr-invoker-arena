function ios_request_server_validation(arg0)
{
    var _data = {};
    variable_struct_set(_data, "receipt-data", arg0);
    _data.password = APP_SHARED_SECRET;
    variable_struct_set(_data, "exclude-old-transactions", true);
    var _jsonString = json_stringify(_data);
    var _requestId = http_post_string("https://sandbox.itunes.apple.com/verifyReceipt", _jsonString);
    return _requestId;
}

function ios_custom_server_validation(arg0)
{
    if (arg0 == "")
    {
        return false;
    }
    var _data = 
    {
        apple_receipt: arg0
    };
    var _json = json_stringify(_data);
    var _host = "0.0.0.0:8080";
    var _headers = ds_map_create();
    ds_map_add(_headers, "Host", _host);
    ds_map_add(_headers, "Content-Type", "application/json");
    ds_map_add(_headers, "Content-Length", string_length(_json));
    var url = "http://" + _host + "/apple-receipt-verify";
    requestId = http_request(url, "POST", _headers, _json);
    ds_map_destroy(_headers);
}
