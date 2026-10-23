function ParseAppleSignInResponse(arg0)
{
    if (arg0 == "")
    {
        exit;
    }
    var jsonMap = json_parse(arg0);
    if (!is_struct(jsonMap))
    {
        exit;
    }
    logf("Apple Sign Response", jsonMap);
    if (struct_get_from_hash(jsonMap, variable_get_hash("success")))
    {
        logf("Apple Sign In Succeeded", jsonMap);
        global.ios_account = jsonMap;
        if (!is_empty(struct_get_from_hash(global.ios_account, variable_get_hash("email"))))
        {
            if (file_exists("apple-email.txt"))
            {
                file_delete("apple-email.txt");
            }
            save_string_to_file(global.ios_account.email, "apple-email.txt", false);
        }
        if (file_exists("apple-email.txt"))
        {
            global.ios_account.email = get_file_contents("apple-email.txt");
        }
    }
    else
    {
        logf("Apple Sign In Failed");
        global.ios_account = undefined;
    }
}
