function mobilehelpers()
{
}

function GooglePlayServices_IsSignedIn()
{
    if (!variable_global_exists("google_signed_in"))
    {
        return false;
    }
    return global.google_signed_in == true;
}

function GooglePlayServices_StartSignInIntent()
{
    extension_stubfunc_real();
}

function GooglePlayServices_SignOut()
{
    with (o_mobile_helper)
    {
        reset_gplay_account();
    }
}

function check_mobile_review()
{
    if (!global.is_mobile)
    {
        exit;
    }
    if (o_game.data.stats.time_elapsed < sec(900))
    {
        exit;
    }
    if (o_game.data.mobile_review_shown)
    {
        exit;
    }
    extension_stubfunc_string();
    o_game.data.mobile_review_shown = true;
}
