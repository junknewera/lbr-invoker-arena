function check_google_new_cloud_save()
{
    if (global.globalstats.android_save_slot_name == "0")
    {
        if (global.android_save_slot_name != "0")
        {
            global.globalstats.android_save_slot_name = global.android_save_slot_name;
            exit;
        }
        if (is_google_cloud_save_enabled())
        {
            global.android_save_slot_name = guid();
            global.globalstats.android_save_slot_name = global.android_save_slot_name;
            logf("create new default cloud save", global.android_save_slot_name);
            extension_stubfunc_real(global.android_save_slot_name, __("New Leaf Blower Revolution Save"), "", "datafiles/default_bg.png");
        }
    }
    else
    {
        global.android_new_save_slot = false;
        global.android_save_slot_name = global.globalstats.android_save_slot_name;
    }
}

function is_google_cloud_save_enabled()
{
    if (!global.is_android)
    {
        return false;
    }
    if (!instance_exists(o_mobile_helper))
    {
        return false;
    }
    if (!GooglePlayServices_IsSignedIn())
    {
        return false;
    }
    if (!variable_global_exists("options"))
    {
        return false;
    }
    return get_option(global.options.upload_save_android);
}
