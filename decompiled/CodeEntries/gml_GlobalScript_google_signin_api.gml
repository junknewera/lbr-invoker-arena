function google_signin_function()
{
    throw "gml_Script_google_signin_function" + " :: script cannnot be call as a function";
}

function __google_signin_url_encode(arg0)
{
    static _output_buffer = buffer_create(1, buffer_grow, 1);
    static _hex = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"];
    
    buffer_seek(_output_buffer, buffer_seek_start, 0);
    var _i = 1;
    repeat (string_length(arg0))
    {
        var _char = string_char_at(arg0, _i++);
        var _code = ord(_char);
        if ((_code >= 65 && _code <= 90) || (_code >= 97 && _code <= 122) || (_code >= 48 && _code <= 57) || _code == 45 || _code == 46 || _code == 95 || _code == 126)
        {
            buffer_write(_output_buffer, buffer_u8, _code);
        }
        else
        {
            var _high = (_code & 240) >> 4;
            var _low = _code & 15;
            buffer_write(_output_buffer, buffer_text, "%" + _hex[_high] + _hex[_low]);
        }
    }
    buffer_write(_output_buffer, buffer_u8, 0);
    return buffer_peek(_output_buffer, 0, buffer_string);
}

function __google_signin_state_create(arg0 = 32, arg1 = "0123456789")
{
    var _length = string_length(arg1);
    if (_length != string_byte_length(arg1))
    {
        show_debug_message("gml_Script___google_signin_state_create" + " :: only ASCII characters are allowed.");
        return "";
    }
    if (_length == 0)
    {
        show_debug_message("gml_Script___google_signin_state_create" + " :: allowed characters is an empty string");
        return "";
    }
    var _out_buff = buffer_create(arg0, buffer_fixed, 1);
    var _input_buff = buffer_create(1, buffer_grow, 1);
    buffer_write(_input_buff, buffer_text, arg1);
    var _input_size = buffer_tell(_input_buff);
    repeat (arg0)
    {
        buffer_write(_out_buff, buffer_u8, buffer_peek(_input_buff, irandom(_input_size - 1), buffer_u8));
    }
    var _code = buffer_peek(_out_buff, 0, buffer_string);
    buffer_delete(_out_buff);
    buffer_delete(_input_buff);
    return _code;
}

function GoogleSignIn_LoginOAuth(arg0, arg1 = "openid email profile")
{
    var _client_id = extension_get_option_value("GoogleSignIn", "oauthClientId");
    var _redirect_url = extension_get_option_value("GoogleSignIn", "oauthUrl");
    var _auth_url = "https://accounts.google.com/o/oauth2/v2/auth?response_type=code&scope=" + __google_signin_url_encode(arg1) + "&redirect_uri=" + __google_signin_url_encode(_redirect_url) + "&client_id=" + __google_signin_url_encode(_client_id) + "&state=" + arg0;
    url_open(_auth_url);
    var _async_load = ds_map_create();
    ds_map_set(_async_load, "type", "GoogleSignIn_LoginOAuth");
    ds_map_set(_async_load, "redirect_uri", _redirect_url);
    ds_map_set(_async_load, "client_id", _client_id);
    ds_map_set(_async_load, "state", arg0);
    event_perform_async(ev_async_social, _async_load);
}
