function ParseAppleCredentialResponse(arg0)
{
    var jsonMap = json_parse(arg0);
    if (!is_struct(jsonMap))
    {
        exit;
    }
    var state = struct_get_from_hash(jsonMap, variable_get_hash("state"));
    logf("parse apple cred response", state);
    global.appleSignInState = state;
    switch (state)
    {
        case 100:
            logf("Authorized!");
            break;
        case 101:
            logf("Revoked");
            break;
        case 102:
            logf("Not found");
            break;
    }
}
