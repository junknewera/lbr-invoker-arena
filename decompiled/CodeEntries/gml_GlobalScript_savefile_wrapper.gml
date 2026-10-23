function after_load_game()
{
    refresh_shop_prices();
    if (get_option(global.options.language) == "ru")
    {
        global.options.alternative_font.data.value = 1;
        global.options.alternative_font.change();
    }
    global.options.font_size.change(true);
    var spider_sprites = [spr_pet_spider, spr_pet_spider_walk, spr_pet_spider_burning];
    if (get_option(global.options.arachnophobia))
    {
        __array = spider_sprites;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            sprite_assign(mitem, spr_icon_cake);
        }
    }
    call_struct(global.areas, "after_load_game_data");
    var __struct = global.season_pass;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        mitem._init_late();
    }
    call_struct(global.borbventures.borbventure_items, "_init");
    call_struct(global.dice_types, "_init");
    call_struct(global.journeys, "_init_late");
    call_struct(global.mine_items, "_init");
    call_struct(global.events, "init_late");
    init_harbor_late();
    var __array = global.cards_array;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        limit_max_count(mitem);
    }
    __array = global.materials_sorted;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        limit_max_count(mitem);
    }
    __array = global.relics_array;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        limit_max_count(mitem);
    }
    __struct = global.shops.converters;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        var converter = variable_struct_get(global.converters, mkey);
        if (converter.data.version == 0)
        {
            (variable_struct_get(global.converters, mkey)).load_data(mitem.data);
            converter.data.version = 1;
        }
    }
    __array = global.dice_inventory;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        var rarity = variable_struct_get(global.dice_rarity, mitem.data.rarity_key);
        var type = variable_struct_get(global.dice_types, mitem.data.type_key);
        var __array2 = global.dice_inventory;
        var __prop_len2 = array_length(__array2);
        var __i2 = __prop_len2 - 1;
        while (__i2 >= 0)
        {
            var mitem2 = __array2[__i2];
            if (rarity.key == mitem2.data.rarity_key && type.key == mitem2.data.type_key && mitem != mitem2)
            {
                mitem.data.count += mitem2.data.count;
                array_delete(global.dice_inventory, __i2, 1);
                __prop_len = array_length(__array);
                __prop_len2 = array_length(__array2);
            }
            __i2--;
        }
        __array2 = global.dice_backpack;
        __prop_len2 = array_length(__array2);
        __i2 = __prop_len2 - 1;
        while (__i2 >= 0)
        {
            var mitem2 = __array2[__i2];
            if (rarity.key == mitem2.data.rarity_key && type.key == mitem2.data.type_key)
            {
                mitem.data.count += mitem2.data.count;
                array_delete(global.dice_backpack, __i2, 1);
                __prop_len = array_length(__array);
                __prop_len2 = array_length(__array2);
            }
            __i2--;
        }
    }
    __array = global.borbventures.items.borbs;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (!mitem.data.started)
        {
            continue;
        }
        var borb_found = false;
        var __array2 = global.borbventures.items.borbventures;
        var __prop_len2 = array_length(__array2);
        for (var __i2 = 0; __i2 < __prop_len2; __i2++)
        {
            var mitem2 = __array2[__i2];
            if (mitem2.data.started)
            {
                var __array3 = mitem2.borbs;
                var __prop_len3 = array_length(__array3);
                for (var __i3 = 0; __i3 < __prop_len3; __i3++)
                {
                    var mitem3 = __array3[__i3];
                    if (mitem == mitem3)
                    {
                        borb_found = true;
                    }
                }
            }
        }
        if (!borb_found)
        {
            mitem.data.started = false;
        }
    }
    if (global.areas.exalted_bridge.data.count > 0)
    {
        o_game.data.flags.black_leaf_hole = true;
    }
    sort_pets_by_prio();
    init_game_vars(true);
    global.season_pass.nature.check_upgrade_attributes();
    if (global.shadow_crystal.data.hp == -1)
    {
        global.shadow_crystal.data.hp = global.shadow_crystal.get_max_hp();
    }
    if (global.shadow_player.data.hp == -1)
    {
        global.shadow_player.data.hp = global.shadow_player.get_max_hp();
        global.shadow_player.data.stamina = global.shadow_player.get_max_stamina();
    }
    if (o_game.data.stats.time_elapsed_frames == -1)
    {
        o_game.data.stats.time_elapsed_frames = floor(o_game.data.stats.time_elapsed);
    }
    global.shops.gems.time_travel_30m.data.count = max(0, global.shops.gems.time_travel_30m.data.count);
    global.shops.gems.time_travel_6h.data.count = max(0, global.shops.gems.time_travel_6h.data.count);
    global.shops.gems.time_travel_24h.data.count = max(0, global.shops.gems.time_travel_24h.data.count);
    global.shops.gems.time_travel_72h.data.count = max(0, global.shops.gems.time_travel_72h.data.count);
    global.shops.gems.time_travel_30m.data.inventory = max(0, global.shops.gems.time_travel_30m.data.inventory);
    global.shops.gems.time_travel_6h.data.inventory = max(0, global.shops.gems.time_travel_6h.data.inventory);
    global.shops.gems.time_travel_24h.data.inventory = max(0, global.shops.gems.time_travel_24h.data.inventory);
    global.shops.gems.time_travel_72h.data.inventory = max(0, global.shops.gems.time_travel_72h.data.inventory);
    limit_resource_numbers();
    if (global.testers)
    {
        post_to_cloud_lite("tester", "start", 
        {
            player_id: o_game.data.player_id
        });
    }
}

function check_overwrite_current_save()
{
    var save_file_exists = file_exists("save.dat");
    if (save_file_exists)
    {
        confirm_dialog(__("Do you want to overwrite your current save?"), function()
        {
            if (file_exists("save-android.dat"))
            {
                file_copy("save-android.dat", "save.dat");
                file_delete("save-android.dat");
            }
            if (room == r_init)
            {
                room_goto(r_start);
            }
        }, undefined, undefined, undefined, function()
        {
            if (instance_exists(o_init))
            {
                o_init.is_loading = false;
                o_init.text_android = "";
            }
        });
        exit;
    }
    if (file_exists("save-android.dat"))
    {
        file_copy("save-android.dat", "save.dat");
        file_delete("save-android.dat");
    }
    room_goto(r_start);
}

function compare_save_game_version(arg0, arg1 = 2229.07)
{
    try
    {
        if (!is_struct(arg0))
        {
            if (!is_string(arg0))
            {
                return undefined;
            }
            if (!file_exists(arg0))
            {
                return undefined;
            }
            var save_file_string = get_file_contents(arg0);
            arg0 = parse_save_data(save_file_string);
        }
        if (!is_struct(arg0))
        {
            return undefined;
        }
        if (is_undefined(struct_get_from_hash(arg0, variable_get_hash("version_int"))))
        {
            return undefined;
        }
        if (arg0.version_int > arg1)
        {
            return 1;
        }
        else if (arg0.version_int == arg1)
        {
            return 0;
        }
        else
        {
            return -1;
        }
    }
    catch (err)
    {
        return undefined;
    }
}

function get_compat_save_data(arg0)
{
    if (!is_undefined(struct_get_from_hash(arg0, variable_get_hash("current_profile"))))
    {
        return arg0;
    }
    var t = get_time_object();
    var save_data_wrapper = get_empty_wrapper_data();
    var save_profile_data = get_empty_profile_data();
    var __struct = global.profile_types;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(save_data_wrapper.profiles, mkey, struct_clone(save_profile_data));
        save_data_wrapper.profiles.profile_key = mkey;
    }
    struct_apply_defaults(arg0, save_profile_data);
    save_data_wrapper.profiles.def = arg0;
    save_data_wrapper.achievements = arg0.achievements;
    save_data_wrapper.version = arg0.version;
    save_data_wrapper.version_int = arg0.version_int;
    if (!is_undefined(struct_get_from_hash(arg0, variable_get_hash("lore"))))
    {
        save_data_wrapper.lore = arg0.lore;
    }
    return struct_clone(save_data_wrapper);
}

function get_game_data_from_file(arg0)
{
    var data = get_file_contents(arg0);
    return parse_save_data(data);
}

function load_game_from_file(arg0)
{
    file_copy(arg0, "save.dat");
    file_delete(arg0);
    global.changing_profile = true;
    room_goto(r_init);
}

function load_options(arg0 = false, arg1 = global.current_profile)
{
    try
    {
        var filename = get_options_filename(arg1);
        log("=== LOADING OPTIONS ===", filename);
        if (!file_exists(filename))
        {
            exit;
        }
        var fs = file_text_open_read(filename);
        var option_raw = file_text_read_string(fs);
        file_text_close(fs);
        if (is_empty(option_raw))
        {
            exit;
        }
        var data_options = json_parse(option_raw);
        if (!is_struct(data_options))
        {
            exit;
        }
        var __struct = data_options;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var option = variable_struct_get(global.options, mkey);
            if (is_undefined(option))
            {
                continue;
            }
            option.data.checked = mitem.checked;
            option.data.value = mitem.value;
            if (option.has_options && is_string(mitem.value))
            {
                option.data.value = option.get_option_value_index(mitem.value);
            }
            if (option.reset_at_startup)
            {
                option.reset();
            }
            if (!arg0)
            {
                option.change();
            }
        }
        load_i18n(get_option(global.options.language));
        refresh_options_i18n();
    }
    catch (e)
    {
        log("Unable to read options", e);
    }
}

function parse_save_data(arg0)
{
    try
    {
        var buf = buffer_base64_decode(arg0);
        var raw_data = buffer_read(buf, buffer_text);
        buffer_delete(buf);
        var has_hash = string_copy(raw_data, string_length(raw_data) - 41, 1) == "#";
        var _expected_hash = string_copy(raw_data, string_length(raw_data) - 40, 40);
        var _hashless_string = string_copy(raw_data, 1, string_length(raw_data) - 42);
        var _new_hash = sha1_string_utf8_hmac("ke03m!5ng93nan7p24lyg343nml2o591", _hashless_string);
        if (_expected_hash != _new_hash)
        {
            return false;
        }
        var game_data = json_parse(raw_data);
        return game_data;
    }
    catch (err)
    {
        return false;
    }
}

function save_and_end_game()
{
    if (global.cloud_data.is_season || is_google_cloud_save_enabled())
    {
        global.func_after_cloud_save = game_end;
        save_game();
        text_dialog(__("Please wait as your character is being uploaded to the cloud. The game will close automatically..."));
        exit;
    }
    save_game();
    game_end();
    steam_shutdown();
}

function save_game(arg0 = undefined)
{
    log("=== save game ===");
    global.is_saving = true;
    tidy_game_log();
    if (global.cloud_data.is_season)
    {
        if (is_undefined(global.cloud_data.save_hash))
        {
            post_to_cloud("save", "get_save_hash", undefined, function(arg0)
            {
                var hash = struct_get_from_hash(arg0, variable_get_hash("hash"));
                if (is_undefined(hash))
                {
                    clear_async_actions();
                    return text_dialog(__("Unable to retrieve hash, please try again later."));
                }
                global.cloud_data.save_hash = hash;
                save_game();
            }, text_dialog);
            exit;
        }
        o_game.data.season_save_hash = global.cloud_data.save_hash;
        global.cloud_data.save_hash = undefined;
    }
    o_game.data.last_daily_reward = 0;
    var save_data_wrapper = get_empty_wrapper_data();
    var save_data_string = get_save_data(save_data_wrapper, arg0);
    var save_filename = get_save_filename_custom();
    save_string_to_file(save_data_string, "save.tmp");
    if (is_save_valid("save.tmp"))
    {
        file_copy("save.tmp", save_filename);
        file_delete("save.tmp");
    }
    else
    {
        global.is_saving = false;
        save_string_to_file(save_data_string, "save-invalid.dat");
        save_string_to_file(save_data_wrapper, "save-invalid2.dat");
        return notify_error(__("Unable to save game."));
    }
    if (global.debug)
    {
    }
    if (!global.cloud_data.is_season)
    {
        if (global.is_pc && steam_is_cloud_enabled_for_account() && steam_is_cloud_enabled_for_app())
        {
            var steam_write_res = steam_file_write_file(save_filename, save_filename);
        }
    }
    save_options();
    autosave_backup();
    global.load_game_content = save_data_wrapper;
    if (!mp_is_season())
    {
        global.is_saving = false;
    }
    check_upload_save();
    if (!mp_is_season() && global.is_android)
    {
        check_upload_save_google(save_data_string);
    }
    if (file_exists("save-season.dat"))
    {
        file_delete("save-season.dat");
    }
}

function force_save_game_mp()
{
    if (!mp_is_season())
    {
        exit;
    }
    clear_async_actions();
    global.cloud_data.last_season_upload = undefined;
    global.cloud_data.last_season_upload_manual = undefined;
    if (file_exists("save-season.dat"))
    {
        file_delete("save-season.dat");
    }
    global.is_saving = false;
    global.is_cloud_saving = false;
    save_game();
}

function save_string_to_file(arg0, arg1, arg2 = false)
{
    var fs;
    if (arg2)
    {
        fs = file_text_open_append(arg1);
    }
    else
    {
        fs = file_text_open_write(arg1);
    }
    if (fs == -1)
    {
        return notify(sprintf(__("Unable to open file %s"), arg1));
    }
    file_text_write_string(fs, arg0);
    file_text_close(fs);
}
