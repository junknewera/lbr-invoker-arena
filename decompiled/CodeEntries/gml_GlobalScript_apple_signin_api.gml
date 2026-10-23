function apple_signin_api()
{
    throw "gml_Script_apple_signin_api" + " :: script cannnot be call as a function";
}

function __apple_signin_buffer_sha256(arg0, arg1, arg2 = 0, arg3 = buffer_get_size(arg1) - arg2)
{
    static __sha256_block_size = 64;
    static __sha256_word_datatype = 5;
    static __sha256_word_size = buffer_sizeof(__sha256_word_datatype);
    static __sha256_block_words = __sha256_block_size / __sha256_word_size;
    static __sha256_round_count = 64;
    static __sha256_message_schedule = array_create(__sha256_round_count, 0);
    static __sha256_round_constants = [1116352408, 1899447441, 3049323471, 3921009573, 961987163, 1508970993, 2453635748, 2870763221, 3624381080, 310598401, 607225278, 1426881987, 1925078388, 2162078206, 2614888103, 3248222580, 3835390401, 4022224774, 264347078, 604807628, 770255983, 1249150122, 1555081692, 1996064986, 2554220882, 2821834349, 2952996808, 3210313671, 3336571891, 3584528711, 113926993, 338241895, 666307205, 773529912, 1294757372, 1396182291, 1695183700, 1986661051, 2177026350, 2456956037, 2730485921, 2820302411, 3259730800, 3345764771, 3516065817, 3600352804, 4094571909, 275423344, 430227734, 506948616, 659060556, 883997877, 958139571, 1322822218, 1537002063, 1747873779, 1955562222, 2024104815, 2227730452, 2361852424, 2428436474, 2756734187, 3204031479, 3329325298];
    
    var _state_array_0 = 1779033703;
    var _state_array_1 = 3144134277;
    var _state_array_2 = 1013904242;
    var _state_array_3 = 2773480762;
    var _state_array_4 = 1359893119;
    var _state_array_5 = 2600822924;
    var _state_array_6 = 528734635;
    var _state_array_7 = 1541459225;
    var _block_count = ceil(arg3 / __sha256_block_size);
    var _last_block_remaining = (__sha256_block_size * _block_count) - arg3;
    if (_last_block_remaining < 9)
    {
        _block_count++;
    }
    var _buffer = arg1;
    var _offset = arg2;
    buffer_resize(_buffer, _offset + (__sha256_block_size * _block_count));
    buffer_poke(_buffer, _offset + arg3, buffer_u8, 128);
    var _bits = 8 * arg3;
    buffer_seek(_buffer, buffer_seek_start, (_offset + (__sha256_block_size * _block_count)) - 8);
    buffer_write(_buffer, buffer_u8, _bits >> 56);
    buffer_write(_buffer, buffer_u8, _bits >> 48);
    buffer_write(_buffer, buffer_u8, _bits >> 40);
    buffer_write(_buffer, buffer_u8, _bits >> 32);
    buffer_write(_buffer, buffer_u8, _bits >> 24);
    buffer_write(_buffer, buffer_u8, _bits >> 16);
    buffer_write(_buffer, buffer_u8, _bits >> 8);
    buffer_write(_buffer, buffer_u8, _bits);
    buffer_seek(_buffer, buffer_seek_start, _offset);
    repeat (_block_count)
    {
        var _message_schedule = __sha256_message_schedule;
        var _i = 0;
        repeat (__sha256_block_words)
        {
            var _value = buffer_read(_buffer, __sha256_word_datatype);
            array_set(_message_schedule, _i, ((_value & 255) << 24) | ((_value & 65280) << 8) | ((_value & 16711680) >> 8) | ((_value & 4278190080) >> 24));
            _i++;
        }
        _i = __sha256_block_words;
        repeat (__sha256_round_count - __sha256_block_words)
        {
            var _p = _message_schedule[_i - 15];
            var _q = _message_schedule[_i - 2];
            array_set(_message_schedule, _i, ((((_q >> 17) | (_q << 15)) ^ ((_q >> 19) | (_q << 13)) ^ (_q >> 10)) + _message_schedule[_i - 7] + (((_p >> 7) | (_p << 25)) ^ ((_p >> 18) | (_p << 14)) ^ (_p >> 3)) + _message_schedule[_i - 16]) & 4294967295);
            _i++;
        }
        var _a = _state_array_0;
        var _b = _state_array_1;
        var _c = _state_array_2;
        var _d = _state_array_3;
        var _e = _state_array_4;
        var _f = _state_array_5;
        var _g = _state_array_6;
        var _h = _state_array_7;
        _i = 0;
        repeat (__sha256_round_count)
        {
            var _t1 = _h + ((((_e >> 6) | (_e << 26)) ^ ((_e >> 11) | (_e << 21)) ^ ((_e >> 25) | (_e << 7))) & 4294967295) + ((_e & _f) ^ (~_e & _g)) + __sha256_round_constants[_i] + _message_schedule[_i];
            var _t2 = ((((_a >> 2) | (_a << 30)) ^ ((_a >> 13) | (_a << 19)) ^ ((_a >> 22) | (_a << 10))) & 4294967295) + ((_a & _b) ^ (_a & _c) ^ (_b & _c));
            _h = _g;
            _g = _f;
            _f = _e;
            _e = (_d + _t1) & 4294967295;
            _d = _c;
            _c = _b;
            _b = _a;
            _a = (_t1 + _t2) & 4294967295;
            _i++;
        }
        _state_array_0 = (_state_array_0 + _a) & 4294967295;
        _state_array_1 = (_state_array_1 + _b) & 4294967295;
        _state_array_2 = (_state_array_2 + _c) & 4294967295;
        _state_array_3 = (_state_array_3 + _d) & 4294967295;
        _state_array_4 = (_state_array_4 + _e) & 4294967295;
        _state_array_5 = (_state_array_5 + _f) & 4294967295;
        _state_array_6 = (_state_array_6 + _g) & 4294967295;
        _state_array_7 = (_state_array_7 + _h) & 4294967295;
    }
    buffer_seek(arg0, buffer_seek_start, 0);
    var _state_array = [_state_array_0, _state_array_1, _state_array_2, _state_array_3, _state_array_4, _state_array_5, _state_array_6, _state_array_7];
    var _len = array_length(_state_array);
    for (var _i = 0; _i < _len; _i++)
    {
        var _word = _state_array[_i];
        _word = ((_word & 255) << 24) | ((_word & 65280) << 8) | ((_word & 16711680) >> 8) | ((_word & 4278190080) >> 24);
        buffer_write(arg0, buffer_u32, _word);
    }
    buffer_seek(arg0, buffer_seek_start, 0);
}

function __apple_signin_url_encode(arg0)
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

function __apple_signin_generate_code_verifier(arg0 = 32)
{
    static _output_buffer = buffer_create(1, buffer_grow, 1);
    static _chars = [45, 46, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 95, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 126];
    static _chars_count = array_length(_chars);
    
    buffer_seek(_output_buffer, buffer_seek_start, 0);
    for (var i = 0; i < arg0; i++)
    {
        buffer_write(_output_buffer, buffer_u8, _chars[irandom_range(0, _chars_count - 1)]);
    }
    buffer_write(_output_buffer, buffer_u8, 0);
    return buffer_peek(_output_buffer, 0, buffer_string);
}

function __apple_signin_generate_code_challenge(arg0)
{
    var _buffer = buffer_create(1, buffer_grow, 1);
    buffer_write(_buffer, buffer_string, arg0);
    var _buffer_sha256 = buffer_create(1, buffer_grow, 1);
    __apple_signin_buffer_sha256(_buffer_sha256, _buffer, 0, string_length(arg0));
    var _hex_string = __apple_signin_byte_buffer_to_hex_string(_buffer_sha256);
    buffer_delete(_buffer);
    buffer_delete(_buffer_sha256);
    return _hex_string;
}

function __apple_signin_buffer_base64_url_encode(arg0, arg1 = 0, arg2 = -1)
{
    var _base64_url = buffer_base64_encode(arg0, arg1, arg2);
    _base64_url = string_replace_all(_base64_url, "+", "-");
    _base64_url = string_replace_all(_base64_url, "/", "_");
    _base64_url = string_trim_end(_base64_url, ["="]);
    return _base64_url;
}

function __apple_signin_byte_buffer_to_hex_string(arg0, arg1 = 0, arg2 = buffer_get_size(arg0) - arg1)
{
    static _nibble_to_hexa = [48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 97, 98, 99, 100, 101, 102];
    
    var _tell = buffer_tell(arg0);
    buffer_seek(arg0, buffer_seek_start, arg1);
    var _temp_buffer = buffer_create(arg2 * 2, buffer_fixed, 1);
    repeat (arg2)
    {
        var _byte = buffer_read(arg0, buffer_u8);
        var _high = (_byte & 240) >> 4;
        var _low = _byte & 15;
        buffer_write(_temp_buffer, buffer_u8, _nibble_to_hexa[_high]);
        buffer_write(_temp_buffer, buffer_u8, _nibble_to_hexa[_low]);
    }
    buffer_write(_temp_buffer, buffer_u8, 0);
    buffer_seek(arg0, buffer_seek_start, _tell);
    var _hexa_string = buffer_peek(_temp_buffer, 0, buffer_string);
    buffer_delete(_temp_buffer);
    return _hexa_string;
}

function __apple_signin_state_create(arg0 = 32, arg1 = "0123456789")
{
    var _length = string_length(arg1);
    if (_length != string_byte_length(arg1))
    {
        show_debug_message("gml_Script___apple_signin_state_create" + " :: only ASCII characters are allowed.");
        return "";
    }
    if (_length == 0)
    {
        show_debug_message("gml_Script___apple_signin_state_create" + " :: allowed characters is an empty string");
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

function AppleSignIn_LoginOAuth(arg0, arg1 = "name email")
{
    var _client_id = extension_get_option_value("AppleSignIn", "oauthClientId");
    var _redirect_uri = extension_get_option_value("AppleSignIn", "oauthRedirectUrl");
    var _response_type = "code";
    var _response_mode = "form_post";
    var _nonce = __apple_signin_generate_code_verifier(128);
    var _nonce_sha256 = __apple_signin_generate_code_challenge(_nonce);
    var _auth_url = "https://appleid.apple.com/auth/authorize?client_id=" + string(_client_id) + "&redirect_uri=" + __apple_signin_url_encode(_redirect_uri) + "&response_type=" + __apple_signin_url_encode(_response_type) + "&response_mode=" + __apple_signin_url_encode(_response_mode) + "&scope=" + __apple_signin_url_encode(arg1) + "&state=" + __apple_signin_url_encode(arg0) + "&nonce=" + __apple_signin_url_encode(_nonce_sha256);
    url_open(_auth_url);
    var _async_load = ds_map_create();
    ds_map_set(_async_load, "type", "AppleSignIn_LoginOAuth");
    ds_map_set(_async_load, "redirect_uri", _redirect_uri);
    ds_map_set(_async_load, "client_id", _client_id);
    ds_map_set(_async_load, "nonce", _nonce);
    ds_map_set(_async_load, "state", arg0);
    event_perform_async(ev_async_social, _async_load);
}
