single_object();
if (!global.is_mobile)
{
    instance_destroy();
    exit;
}
if (global.is_ios)
{
    extension_stubfunc_real();
}
product_ids = [global.is_mobile ? "borbventure_pack" : "2239260", global.is_mobile ? "cards_pack" : "2125730", global.is_mobile ? "dice_pack" : 10001, global.is_mobile ? "fishing_pack" : 10003, global.is_mobile ? "gems_pack_uncommon" : 11001, global.is_mobile ? "gems_pack_epic" : 11002, global.is_mobile ? "gems_pack_legendary" : 11003, global.is_mobile ? "materials_pack" : "1873910", global.is_mobile ? "mines_pack" : 10002, global.is_mobile ? "nature_pack" : 10000, global.is_mobile ? "premium_pack" : "1482631", global.is_mobile ? "skins_pack" : "1482632", global.is_mobile ? "supporter_pack" : "1482630"];
product_map = {};
products_added_ios = false;
purchases = {};
validationRequests = {};
accountInfo = undefined;
signing_in = false;
var dummy_sprite = sprite_add("default_bg.png", 0, false, false, 0, 0);
sprite_save(dummy_sprite, 0, "leaf.png");
sprite_delete(dummy_sprite);
connected_to_store = false;
getting_purchase_data = false;
got_purchase_data = false;
purchasesData = undefined;
subsHttpId = -1;
subsToken = "";

function updatePurchasesData()
{
    purchases = {};
    if (global.is_android)
    {
        var queryJson = extension_stubfunc_string("\"inapp\"");
    }
    else if (global.is_ios)
    {
        connected_to_store = extension_stubfunc_real();
        var purchasesJson = extension_stubfunc_string();
        if (purchasesJson != "")
        {
            var purchasesData_tmp = json_parse(purchasesJson);
            if (is_struct(purchasesData_tmp))
            {
                purchases = struct_get_from_hash(purchasesData_tmp, variable_get_hash("purchases"));
                log("ios purchases data", purchases);
                ios_handle_purchases(purchases);
            }
        }
    }
    if (is_struct(purchasesData) && variable_global_exists("shops") && room == r_start)
    {
        got_purchase_data = true;
        refresh_dlc_shop();
    }
}

function reset_gplay_account()
{
    accountInfo = undefined;
    global.google_signed_in = false;
    global.android_save_slots = [];
}

function get_gplay_account_info()
{
    var accountJson = "{}";
    accountInfo = json_parse(accountJson);
}

if (global.is_android && GooglePlayServices_IsSignedIn())
{
    get_gplay_account_info();
}
alarm[0] = sec(3);
alarm[2] = sec(2);
