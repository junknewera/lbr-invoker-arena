function init_colors()
{
    global.colors = 
    {
        black: 0,
        blue: 10555665,
        cyan: 16776192,
        gray: hexcolor(4473924),
        green: 1155345,
        magenta: 9699579,
        purple: 8388736,
        red: 1118625,
        slight_red: 10921707,
        white: 16777215,
        yellow: 64764,
        button_bg_disabled: 13158600,
        button_bg_hover: global.is_mobile ? 16777215 : 11067133,
        button_bg_hover_selected: global.is_mobile ? 16777215 : 10549920,
        button_bg_selected: 7920760,
        content_section_background: 4417418,
        insufficient_indicator: hexcolor(8587272),
        text_default: 0,
        text_disabled: 8421504,
        text_hover: 2105376,
        transcend: 15939009
    };
    global.custom_colors = 
    {
        def: 
        {
            sprite: spr_solid,
            color: 16777215,
            index: 0
        },
        black: 
        {
            sprite: spr_house_color_black,
            color: 0,
            index: 10
        },
        blue: 
        {
            sprite: spr_house_color_blue,
            color: 16711680,
            index: 20
        },
        brown: 
        {
            sprite: spr_house_color_brown,
            color: hexcolor(8204321),
            index: 25
        },
        cyan: 
        {
            sprite: spr_house_color_cyan,
            color: 16776192,
            index: 30
        },
        gray: 
        {
            sprite: spr_house_color_gray,
            color: hexcolor(8553090),
            index: 35
        },
        green: 
        {
            sprite: spr_house_color_green,
            color: 512045,
            index: 40
        },
        magenta: 
        {
            sprite: spr_house_color_magenta,
            color: 9699579,
            index: 50
        },
        orange: 
        {
            sprite: spr_house_color_orange,
            color: hexcolor(15029260),
            index: 60
        },
        pink: 
        {
            sprite: spr_house_color_pink,
            color: hexcolor(16519104),
            index: 65
        },
        purple: 
        {
            sprite: spr_house_color_purple,
            color: hexcolor(8851192),
            index: 70
        },
        red: 
        {
            sprite: spr_house_color_red,
            color: 255,
            index: 80
        },
        yellow: 
        {
            sprite: spr_house_color_yellow,
            color: 65535,
            index: 90
        }
    };
    add_keys_to_struct(global.custom_colors);
    global.custom_colors_array = struct_to_sorted_array(global.custom_colors);
    var __array = global.custom_colors_array;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        mitem.pos = __i;
    }
    global.rarity_colors = 
    {
        common: 10526880,
        uncommon: 11234610,
        rare: 4178899,
        epic: 665267,
        mythical: 12652702,
        legendary: 1730273,
        legendary1: 63998,
        legendary2: 3438
    };
    global.rarity_colors_button = struct_clone(global.rarity_colors);
    global.rarity_colors_button.common = 16777215;
    global.rarity_sprites = 
    {
        common: spr_rarity_common,
        uncommon: spr_rarity_uncommon,
        rare: spr_rarity_rare,
        epic: spr_rarity_epic,
        mythical: spr_rarity_mythical,
        legendary: spr_rarity_legendary
    };
}

function init_encoding_chars()
{
    global.encoded_chars_table = {};
    variable_struct_set(global.encoded_chars_table, " ", "%20");
    variable_struct_set(global.encoded_chars_table, "!", "%21");
    variable_struct_set(global.encoded_chars_table, "“", "%22");
    variable_struct_set(global.encoded_chars_table, "#", "%23");
    variable_struct_set(global.encoded_chars_table, "$", "%24");
    variable_struct_set(global.encoded_chars_table, "%", "%25");
    variable_struct_set(global.encoded_chars_table, "&", "%26");
    variable_struct_set(global.encoded_chars_table, "‘", "%27");
    variable_struct_set(global.encoded_chars_table, "(", "%28");
    variable_struct_set(global.encoded_chars_table, ")", "%29");
    variable_struct_set(global.encoded_chars_table, "*", "%2A");
    variable_struct_set(global.encoded_chars_table, "+", "%2B");
    variable_struct_set(global.encoded_chars_table, ",", "%2C");
    variable_struct_set(global.encoded_chars_table, "–", "%2D");
    variable_struct_set(global.encoded_chars_table, ".", "%2E");
    variable_struct_set(global.encoded_chars_table, "/", "%2F");
    variable_struct_set(global.encoded_chars_table, ":", "%3A");
    variable_struct_set(global.encoded_chars_table, ";", "%3B");
    variable_struct_set(global.encoded_chars_table, "<", "%3C");
    variable_struct_set(global.encoded_chars_table, "=", "%3D");
    variable_struct_set(global.encoded_chars_table, ">", "%3E");
    variable_struct_set(global.encoded_chars_table, "?", "%3F");
    variable_struct_set(global.encoded_chars_table, "@", "%40");
    variable_struct_set(global.encoded_chars_table, "[", "%5B");
    variable_struct_set(global.encoded_chars_table, "\\", "%5C");
    variable_struct_set(global.encoded_chars_table, "]", "%5D");
    variable_struct_set(global.encoded_chars_table, "^", "%5E");
    global.encoded_chars_table._ = "%5F";
    variable_struct_set(global.encoded_chars_table, "`", "%60");
    variable_struct_set(global.encoded_chars_table, "{", "%7B");
    variable_struct_set(global.encoded_chars_table, "|", "%7C");
    variable_struct_set(global.encoded_chars_table, "}", "%7D");
    variable_struct_set(global.encoded_chars_table, "~", "%7E");
    variable_struct_set(global.encoded_chars_table, "€", "%80");
    variable_struct_set(global.encoded_chars_table, "‚", "%82");
    global.encoded_chars_table.ƒ = "%83";
    variable_struct_set(global.encoded_chars_table, "„", "%84");
    variable_struct_set(global.encoded_chars_table, "…", "%85");
    variable_struct_set(global.encoded_chars_table, "†", "%86");
    variable_struct_set(global.encoded_chars_table, "‡", "%87");
    global.encoded_chars_table.ˆ = "%88";
    variable_struct_set(global.encoded_chars_table, "‰", "%89");
    global.encoded_chars_table.Š = "%8A";
    variable_struct_set(global.encoded_chars_table, "‹", "%8B");
    global.encoded_chars_table.Œ = "%8C";
    global.encoded_chars_table.Ž = "%8E";
    variable_struct_set(global.encoded_chars_table, "‘", "%91");
    variable_struct_set(global.encoded_chars_table, "’", "%92");
    variable_struct_set(global.encoded_chars_table, "“", "%93");
    variable_struct_set(global.encoded_chars_table, "”", "%94");
    variable_struct_set(global.encoded_chars_table, "•", "%95");
    variable_struct_set(global.encoded_chars_table, "–", "%96");
    variable_struct_set(global.encoded_chars_table, "—", "%97");
    variable_struct_set(global.encoded_chars_table, "˜", "%98");
    variable_struct_set(global.encoded_chars_table, "™", "%99");
    global.encoded_chars_table.š = "%9A";
    variable_struct_set(global.encoded_chars_table, "›", "%9B");
    global.encoded_chars_table.œ = "%9C";
    global.encoded_chars_table.ž = "%9E";
    global.encoded_chars_table.Ÿ = "%9F";
    variable_struct_set(global.encoded_chars_table, "¡", "%A1");
    variable_struct_set(global.encoded_chars_table, "¢", "%A2");
    variable_struct_set(global.encoded_chars_table, "£", "%A3");
    variable_struct_set(global.encoded_chars_table, "¥", "%A5");
    variable_struct_set(global.encoded_chars_table, "|", "%A6");
    variable_struct_set(global.encoded_chars_table, "§", "%A7");
    variable_struct_set(global.encoded_chars_table, "¨", "%A8");
    variable_struct_set(global.encoded_chars_table, "©", "%A9");
    global.encoded_chars_table.ª = "%AA";
    variable_struct_set(global.encoded_chars_table, "«", "%AB");
    variable_struct_set(global.encoded_chars_table, "¬", "%AC");
    variable_struct_set(global.encoded_chars_table, "¯", "%AD");
    variable_struct_set(global.encoded_chars_table, "®", "%AE");
    variable_struct_set(global.encoded_chars_table, "¯", "%AF");
    variable_struct_set(global.encoded_chars_table, "°", "%B0");
    variable_struct_set(global.encoded_chars_table, "±", "%B1");
    variable_struct_set(global.encoded_chars_table, "²", "%B2");
    variable_struct_set(global.encoded_chars_table, "³", "%B3");
    variable_struct_set(global.encoded_chars_table, "´", "%B4");
    global.encoded_chars_table.µ = "%B5";
    variable_struct_set(global.encoded_chars_table, "¶", "%B6");
    variable_struct_set(global.encoded_chars_table, "·", "%B7");
    variable_struct_set(global.encoded_chars_table, "¸", "%B8");
    variable_struct_set(global.encoded_chars_table, "¹", "%B9");
    global.encoded_chars_table.º = "%BA";
    variable_struct_set(global.encoded_chars_table, "»", "%BB");
    variable_struct_set(global.encoded_chars_table, "¼", "%BC");
    variable_struct_set(global.encoded_chars_table, "½", "%BD");
    variable_struct_set(global.encoded_chars_table, "¾", "%BE");
    variable_struct_set(global.encoded_chars_table, "¿", "%BF");
    global.encoded_chars_table.À = "%C0";
    global.encoded_chars_table.Á = "%C1";
    global.encoded_chars_table.Ã = "%C3";
    global.encoded_chars_table.Ä = "%C4";
    global.encoded_chars_table.Å = "%C5";
    global.encoded_chars_table.Æ = "%C6";
    global.encoded_chars_table.Ç = "%C7";
    global.encoded_chars_table.È = "%C8";
    global.encoded_chars_table.É = "%C9";
    global.encoded_chars_table.Ë = "%CB";
    global.encoded_chars_table.Ì = "%CC";
    global.encoded_chars_table.Í = "%CD";
    global.encoded_chars_table.Î = "%CE";
    global.encoded_chars_table.Ï = "%CF";
    global.encoded_chars_table.Ð = "%D0";
    global.encoded_chars_table.Ñ = "%D1";
    global.encoded_chars_table.Ò = "%D2";
    global.encoded_chars_table.Ó = "%D3";
    global.encoded_chars_table.Ô = "%D4";
    global.encoded_chars_table.Õ = "%D5";
    global.encoded_chars_table.Ö = "%D6";
    global.encoded_chars_table.Ø = "%D8";
    global.encoded_chars_table.Ù = "%D9";
    global.encoded_chars_table.Ú = "%DA";
    global.encoded_chars_table.Û = "%DB";
    global.encoded_chars_table.Ü = "%DC";
    global.encoded_chars_table.Ý = "%DD";
    global.encoded_chars_table.Þ = "%DE";
    global.encoded_chars_table.ß = "%DF";
    global.encoded_chars_table.à = "%E0";
    global.encoded_chars_table.á = "%E1";
    global.encoded_chars_table.â = "%E2";
    global.encoded_chars_table.ã = "%E3";
    global.encoded_chars_table.ä = "%E4";
    global.encoded_chars_table.å = "%E5";
    global.encoded_chars_table.æ = "%E6";
    global.encoded_chars_table.ç = "%E7";
    global.encoded_chars_table.è = "%E8";
    global.encoded_chars_table.é = "%E9";
    global.encoded_chars_table.ê = "%EA";
    global.encoded_chars_table.ë = "%EB";
    global.encoded_chars_table.ì = "%EC";
    global.encoded_chars_table.í = "%ED";
    global.encoded_chars_table.î = "%EE";
    global.encoded_chars_table.ï = "%EF";
    global.encoded_chars_table.ð = "%F0";
    global.encoded_chars_table.ñ = "%F1";
    global.encoded_chars_table.ò = "%F2";
    global.encoded_chars_table.ó = "%F3";
    global.encoded_chars_table.ô = "%F4";
    global.encoded_chars_table.õ = "%F5";
    global.encoded_chars_table.ö = "%F6";
    variable_struct_set(global.encoded_chars_table, "÷", "%F7");
    global.encoded_chars_table.ø = "%F8";
    global.encoded_chars_table.ù = "%F9";
    global.encoded_chars_table.ú = "%FA";
    global.encoded_chars_table.û = "%FB";
    global.encoded_chars_table.ü = "%FC";
    global.encoded_chars_table.ý = "%FD";
    global.encoded_chars_table.þ = "%FE";
    global.encoded_chars_table.ÿ = "%FF";
}

function init_fonts()
{
    if (variable_global_exists("fonts"))
    {
        struct_map(global.fonts, function(arg0)
        {
            if (!font_exists(arg0))
            {
                exit;
            }
            font_delete(arg0);
        });
    }
    global.fonts = 
    {
        def: {},
        alt: {},
        pikzel: {},
        flashback: {},
        noto: {},
        debug: {}
    };
    global.fonts_line_height = 
    {
        alt: 2,
        pikzel: 9
    };
    font_add_enable_aa(false);
    var font_file_def = "fonts/kenney_mini.ttf";
    var font_file_alt = "fonts/open_sans_semibold.ttf";
    var font_file_noto = "fonts/NotoSansJP-Regular.ttf";
    var font_file_mobile = "fonts/pikzel.ttf";
    var font_file_debug = "fonts/debug.ttf";
    global.font_size = 20;
    if (variable_global_exists("options"))
    {
        global.font_size += get_option(global.options.font_size);
    }
    var f_gui_default_d = font_add(font_file_def, global.font_size, false, false, 32, 255);
    var f_gui_button_d = font_add(font_file_def, global.font_size - 8, false, false, 32, 255);
    var f_gui_large_d = font_add(font_file_def, global.font_size + 16, false, false, 32, 255);
    var f_gui_medium_d = font_add(font_file_def, global.font_size - 6, false, false, 32, 255);
    var f_gui_small_d = font_add(font_file_def, global.font_size - 8, false, false, 32, 255);
    var f_gui_xs_d = font_add(font_file_mobile, global.font_size - 8, false, false, 32, 255);
    var f_game_small_d = font_add(font_file_def, global.font_size - 10, false, false, 32, 255);
    var f_game_xs_d = font_add(font_file_def, global.font_size - 11, false, false, 32, 255);
    var f_gui_default_mobile_d = font_add(font_file_mobile, global.font_size + 4, false, false, 32, 255);
    var f_gui_button_mobile_d = font_add(font_file_mobile, global.font_size - 5, false, false, 32, 255);
    var f_gui_large_mobile_d = font_add(font_file_mobile, global.font_size + 8, false, false, 32, 255);
    var f_gui_medium_mobile_d = font_add(font_file_mobile, global.font_size + 1, false, false, 32, 255);
    var f_gui_small_mobile_d = font_add(font_file_mobile, global.font_size + 1, false, false, 32, 255);
    var f_gui_xs_mobile_d = font_add(font_file_mobile, global.font_size - 1, false, false, 32, 255);
    var f_game_small_mobile_d = font_add(font_file_mobile, global.font_size - 4, false, false, 32, 255);
    var f_game_xs_mobile_d = font_add(font_file_mobile, global.font_size - 5, false, false, 32, 255);
    font_add_enable_aa(true);
    var f_gui_default_alt_d = font_add(font_file_alt, global.font_size - 4, false, false, 32, 255);
    var f_gui_button_alt_d = font_add(font_file_alt, global.font_size - 7, false, false, 32, 255);
    var f_gui_large_alt_d = font_add(font_file_alt, global.font_size + 12, false, false, 32, 255);
    var f_gui_medium_alt_d = font_add(font_file_alt, global.font_size - 4, false, false, 32, 255);
    var f_gui_small_alt_d = font_add(font_file_alt, global.font_size - 6, false, false, 32, 255);
    var f_gui_xs_alt_d = font_add(font_file_alt, global.font_size - 8, false, false, 32, 255);
    var f_game_small_alt_d = font_add(font_file_alt, global.font_size - 12, false, false, 32, 255);
    var f_game_xs_alt_d = font_add(font_file_alt, global.font_size - 13, false, false, 32, 255);
    font_add_enable_aa(false);
    font_add_enable_aa(true);
    var f_gui_default_noto_d = font_add(font_file_noto, global.font_size - 4, false, false, 12288, 12543);
    var f_gui_button_noto_d = font_add(font_file_noto, global.font_size - 7, false, false, 12288, 12543);
    var f_gui_large_noto_d = font_add(font_file_noto, global.font_size + 12, false, false, 12288, 12543);
    var f_gui_medium_noto_d = font_add(font_file_noto, global.font_size - 4, false, false, 12288, 12543);
    var f_gui_small_noto_d = font_add(font_file_noto, global.font_size - 6, false, false, 12288, 12543);
    var f_gui_xs_noto_d = font_add(font_file_noto, global.font_size - 8, false, false, 12288, 12543);
    var f_game_small_noto_d = font_add(font_file_noto, global.font_size - 12, false, false, 12288, 12543);
    var f_game_xs_noto_d = font_add(font_file_noto, global.font_size - 13, false, false, 12288, 12543);
    font_add_enable_aa(false);
    variable_struct_set(global.fonts.def, f_gui_default, f_gui_default_d);
    variable_struct_set(global.fonts.def, f_gui_button, f_gui_button_d);
    variable_struct_set(global.fonts.def, f_gui_large, f_gui_large_d);
    variable_struct_set(global.fonts.def, f_gui_medium, f_gui_medium_d);
    variable_struct_set(global.fonts.def, f_gui_small, f_gui_small_d);
    variable_struct_set(global.fonts.def, f_gui_xs, f_gui_xs_d);
    variable_struct_set(global.fonts.def, f_game_small, f_game_small_d);
    variable_struct_set(global.fonts.def, f_game_xs, f_game_xs_d);
    variable_struct_set(global.fonts.alt, f_gui_default, f_gui_default_alt_d);
    variable_struct_set(global.fonts.alt, f_gui_button, f_gui_button_alt_d);
    variable_struct_set(global.fonts.alt, f_gui_large, f_gui_large_alt_d);
    variable_struct_set(global.fonts.alt, f_gui_medium, f_gui_medium_alt_d);
    variable_struct_set(global.fonts.alt, f_gui_small, f_gui_small_alt_d);
    variable_struct_set(global.fonts.alt, f_gui_xs, f_gui_xs_alt_d);
    variable_struct_set(global.fonts.alt, f_game_small, f_game_small_alt_d);
    variable_struct_set(global.fonts.alt, f_game_xs, f_game_xs_alt_d);
    variable_struct_set(global.fonts.noto, f_gui_default, f_gui_default_noto_d);
    variable_struct_set(global.fonts.noto, f_gui_button, f_gui_button_noto_d);
    variable_struct_set(global.fonts.noto, f_gui_large, f_gui_large_noto_d);
    variable_struct_set(global.fonts.noto, f_gui_medium, f_gui_medium_noto_d);
    variable_struct_set(global.fonts.noto, f_gui_small, f_gui_small_noto_d);
    variable_struct_set(global.fonts.noto, f_gui_xs, f_gui_xs_noto_d);
    variable_struct_set(global.fonts.noto, f_game_small, f_game_small_noto_d);
    variable_struct_set(global.fonts.noto, f_game_xs, f_game_xs_noto_d);
    variable_struct_set(global.fonts.pikzel, f_gui_default, f_gui_default_mobile_d);
    variable_struct_set(global.fonts.pikzel, f_gui_button, f_gui_button_mobile_d);
    variable_struct_set(global.fonts.pikzel, f_gui_large, f_gui_large_mobile_d);
    variable_struct_set(global.fonts.pikzel, f_gui_medium, f_gui_medium_mobile_d);
    variable_struct_set(global.fonts.pikzel, f_gui_small, f_gui_small_mobile_d);
    variable_struct_set(global.fonts.pikzel, f_gui_xs, f_gui_xs_mobile_d);
    variable_struct_set(global.fonts.pikzel, f_game_small, f_game_small_mobile_d);
    variable_struct_set(global.fonts.pikzel, f_game_xs, f_game_xs_mobile_d);
    if (global.debug)
    {
        var f_gui_default_debug = font_add(font_file_debug, global.font_size, false, false, 32, 255);
        var f_gui_button_debug = font_add(font_file_debug, global.font_size - 8, false, false, 32, 255);
        var f_gui_large_debug = font_add(font_file_debug, global.font_size + 16, false, false, 32, 255);
        var f_gui_medium_debug = font_add(font_file_debug, global.font_size - 6, false, false, 32, 255);
        var f_gui_small_debug = font_add(font_file_debug, global.font_size - 8, false, false, 32, 255);
        var f_gui_xs_debug = font_add(font_file_debug, global.font_size - 8, false, false, 32, 255);
        var f_game_small_debug = font_add(font_file_debug, global.font_size - 10, false, false, 32, 255);
        var f_game_xs_debug = font_add(font_file_debug, global.font_size - 11, false, false, 32, 255);
        variable_struct_set(global.fonts.debug, f_gui_default, f_gui_default_debug);
        variable_struct_set(global.fonts.debug, f_gui_button, f_gui_button_debug);
        variable_struct_set(global.fonts.debug, f_gui_large, f_gui_large_debug);
        variable_struct_set(global.fonts.debug, f_gui_medium, f_gui_medium_debug);
        variable_struct_set(global.fonts.debug, f_gui_small, f_gui_small_debug);
        variable_struct_set(global.fonts.debug, f_gui_xs, f_gui_xs_debug);
        variable_struct_set(global.fonts.debug, f_game_small, f_game_small_debug);
        variable_struct_set(global.fonts.debug, f_game_xs, f_game_xs_debug);
    }
    else
    {
        variable_struct_set(global.fonts.debug, f_gui_default, f_gui_default_d);
        variable_struct_set(global.fonts.debug, f_gui_button, f_gui_button_d);
        variable_struct_set(global.fonts.debug, f_gui_large, f_gui_large_d);
        variable_struct_set(global.fonts.debug, f_gui_medium, f_gui_medium_d);
        variable_struct_set(global.fonts.debug, f_gui_small, f_gui_small_d);
        variable_struct_set(global.fonts.debug, f_gui_xs, f_gui_xs_d);
        variable_struct_set(global.fonts.debug, f_game_small, f_game_small_d);
        variable_struct_set(global.fonts.debug, f_game_xs, f_game_xs_d);
    }
    global.current_font = global.is_mobile ? global.fonts.pikzel : global.fonts.def;
}

function init_hashes()
{
    var hash_names = ["add_upgrade_multiplier", "add_bonus_upgrade_multiplier", "count", "data", "get_bonus_upgrade_attributes", "get_upgrade_attributes", "upgrade_attributes", "upgrade_count_max", "upgrade_override_value"];
    global.hashes = {};
    var __array = hash_names;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        variable_struct_set(global.hashes, mitem, variable_get_hash(mitem));
    }
}

function init_hotkeys()
{
    global.hotkeys_array = [new Hotkey("tool_shop", 
    {
        name: __("Tool Shop"),
        hotkey: 49,
        sprite: spr_weapon_leaf_blower
    }), new Hotkey("leaf_shop", 
    {
        name: __("Leaf Shop"),
        hotkey: 50,
        sprite: spr_leaf_basic
    }), new Hotkey("gold_shop", 
    {
        name: __("Gold Shop"),
        hotkey: 51,
        sprite: spr_leaf_gold
    }), new Hotkey("platinum_shop", 
    {
        name: __("Platinum Shop"),
        hotkey: 52,
        sprite: spr_leaf_platinum
    }), new Hotkey("bismuth_shop", 
    {
        name: __("Bismuth Shop"),
        hotkey: 53,
        sprite: spr_leaf_bismuth
    }), new Hotkey("cosmic_shop", 
    {
        name: __("Cosmic Shop"),
        hotkey: 54,
        sprite: spr_leaf_cosmic
    }), new Hotkey("void_shop", 
    {
        name: __("Void Shop"),
        hotkey: 55,
        sprite: spr_leaf_void
    }), new Hotkey("exotic_shop", 
    {
        name: __("Exotic Shop"),
        hotkey: 56,
        sprite: spr_leaf_exotic
    }), new Hotkey("celestial_shop", 
    {
        name: __("Celestial Shop"),
        hotkey: 57,
        sprite: spr_leaf_celestial
    }), new Hotkey("mythical_shop", 
    {
        name: __("Mythical Shop"),
        hotkey: 81,
        sprite: spr_leaf_mythical
    }), new Hotkey("lava_shop", 
    {
        name: __("Lava Shop"),
        hotkey: 87,
        sprite: spr_leaf_lava
    }), new Hotkey("ice_shop", 
    {
        name: __("Ice Shop"),
        hotkey: 69,
        sprite: spr_leaf_ice
    }), new Hotkey("obsidian_shop", 
    {
        name: __("Obsidian Shop"),
        hotkey: 82,
        sprite: spr_leaf_obsidian
    }), new Hotkey("silicon_shop", 
    {
        name: __("Silicon Shop"),
        hotkey: 84,
        sprite: spr_leaf_silicon
    }), new Hotkey("benitoite_shop", 
    {
        name: __("Benitoite Shop"),
        hotkey: 90,
        sprite: spr_leaf_benitoite
    }), new Hotkey("moonstone_shop", 
    {
        name: __("Moonstone Shop"),
        sprite: spr_leaf_moonstone
    }), new Hotkey("sand_shop", 
    {
        name: __("Sand Shop"),
        sprite: spr_leaf_sand
    }), new Hotkey("ancient_shop", 
    {
        name: __("Ancient Shop"),
        sprite: spr_leaf_ancient
    }), new Hotkey("sacred_shop", 
    {
        name: __("Sacred Shop"),
        sprite: spr_leaf_sacred
    }), new Hotkey("biotite_shop", 
    {
        name: __("Biotite Shop"),
        sprite: spr_leaf_biotite
    }), new Hotkey("malachite_shop", 
    {
        name: __("Malachite Shop"),
        sprite: spr_leaf_malachite
    }), new Hotkey("hematite_shop", 
    {
        name: __("Hematite Shop"),
        sprite: spr_leaf_hematite
    }), new Hotkey("plasma_shop", 
    {
        name: __("Plasma Shop"),
        sprite: spr_leaf_plasma
    }), new Hotkey("coal_shop", 
    {
        name: __("Coal Shop"),
        sprite: spr_leaf_coal
    }), new Hotkey("energy_electrical_shop", 
    {
        name: __("Electric Shop"),
        sprite: spr_resource_electrical_energy
    }), new Hotkey("dusk_Shop", 
    {
        name: __("Dusk Shop"),
        sprite: spr_leaf_dusk
    }), new Hotkey("gem_leaves_shop", 
    {
        name: __("Gem Leaves Shop"),
        hotkey: 85,
        sprite: spr_leaf_emerald
    }), new Hotkey("coins_shop", 
    {
        name: __("Coins Shop"),
        hotkey: 65,
        sprite: spr_gold
    }), new Hotkey("blc_shop", 
    {
        name: __("BLC Shop"),
        hotkey: 83,
        sprite: spr_blc
    }), new Hotkey("mlc_shop", 
    {
        name: __("MLC Shop"),
        sprite: spr_mlc
    }), new Hotkey("ulc_shop", 
    {
        name: __("ULC Shop"),
        sprite: spr_ulc
    }), new Hotkey("silver_token_shop", 
    {
        name: __("Silver Token Shop"),
        sprite: spr_resource_silver_token
    }), new Hotkey("gold_token_shop", 
    {
        name: __("Gold Token Shop"),
        sprite: spr_resource_gold_token
    }), new Hotkey("red_science", 
    {
        name: __("Red Science"),
        hotkey: 68,
        sprite: spr_flask_red
    }), new Hotkey("green_science", 
    {
        name: __("Green Science"),
        hotkey: 70,
        sprite: spr_flask_green
    }), new Hotkey("blue_science", 
    {
        name: __("Blue Science"),
        hotkey: 71,
        sprite: spr_flask_blue
    }), new Hotkey("magenta_science", 
    {
        name: __("Magenta Science"),
        hotkey: 72,
        sprite: spr_flask_magenta
    }), new Hotkey("orange_science", 
    {
        name: __("Orange Science"),
        hotkey: 74,
        sprite: spr_flask_orange
    }), new Hotkey("black_science", 
    {
        name: __("Black Science"),
        hotkey: 75,
        sprite: spr_flask_black
    }), new Hotkey("strange_science", 
    {
        name: __("Strange Science"),
        hotkey: 76,
        sprite: spr_flask_strange
    }), new Hotkey("prestige", 
    {
        name: __("Prestige"),
        hotkey: 88,
        sprite: spr_icon_portal
    }), new Hotkey("blc", 
    {
        name: __("Big Leaf Crunch"),
        hotkey: 67,
        sprite: spr_icon_portal_leaf_crunch
    }), new Hotkey("mlc", 
    {
        name: __("Mega Leaf Crunch"),
        sprite: spr_icon_portal_mlc
    }), new Hotkey("ulc", 
    {
        name: __("Ultra Leaf Crunch"),
        sprite: spr_icon_portal_ulc
    }), new Hotkey("areas", 
    {
        name: __("Areas"),
        hotkey: 86,
        sprite: spr_flag
    }), new Hotkey("converters", 
    {
        name: __("Converters"),
        hotkey: 66,
        sprite: spr_icon_converters
    }), new Hotkey("printers", 
    {
        name: __("Printers"),
        hotkey: 78,
        sprite: spr_icon_printer
    }), new Hotkey("farming", 
    {
        name: __("Farming"),
        hotkey: 77,
        sprite: spr_icon_farming
    }), new Hotkey("mulch_shop", 
    {
        name: __("Mulch Shop"),
        sprite: spr_icon_mulch
    }), new Hotkey("trading", 
    {
        name: __("Trading"),
        hotkey: 89,
        sprite: spr_icon_trading
    }), new Hotkey("crafting", 
    {
        name: __("Crafting"),
        sprite: spr_icon_crafting
    }), new Hotkey("alchemy", 
    {
        name: __("Alchemy"),
        sprite: spr_icon_alchemy
    }), new Hotkey("boosters", 
    {
        name: __("Boosters"),
        sprite: spr_icon_rocket
    }), new Hotkey("leafscension", 
    {
        name: __("Leafscension"),
        sprite: spr_icon_leafscension
    }), new Hotkey("borbventures", 
    {
        name: __("Borbventures"),
        sprite: spr_borb_jones
    }), new Hotkey("mines", 
    {
        name: __("Mines"),
        sprite: spr_icon_mine
    }), new Hotkey("soul_shop", 
    {
        name: __("Soul Shop"),
        sprite: spr_resource_soul_entity
    }), new Hotkey("soul_forge", 
    {
        name: __("Soul Forge"),
        sprite: spr_icon_soul_forge
    }), new Hotkey("banks", 
    {
        name: __("Banks"),
        sprite: spr_icon_bank
    }), new Hotkey("dice", 
    {
        name: __("Dice"),
        sprite: spr_icon_die
    }), new Hotkey("fishing", 
    {
        name: __("Fishing"),
        sprite: spr_fish_aquazure
    }), new Hotkey("harbor", 
    {
        name: __("Harbor"),
        sprite: spr_icon_ship
    }), new Hotkey("quarks", 
    {
        name: __("Quarks"),
        sprite: spr_icon_quark
    }), new Hotkey("shadow_crystal", 
    {
        name: __("Shadow Crystal"),
        sprite: spr_object_shadow_crystal
    }), new Hotkey("event_shop", 
    {
        name: __("Event Shop"),
        sprite: spr_icon_event
    }), new Hotkey("guide", 
    {
        name: __("Guide"),
        sprite: spr_icon_guide
    }), new Hotkey("supporter_shop", 
    {
        name: __("Supporter Shop"),
        sprite: spr_icon_star2
    }), new Hotkey("shop_gems", 
    {
        name: __("Gems Shop"),
        sprite: spr_resource_gem
    }), new Hotkey("season_pass", 
    {
        name: __("Season Pass"),
        sprite: spr_resource_nature_gem
    }), new Hotkey("unique_leaves", 
    {
        name: __("Unique Leaves"),
        sprite: spr_leaf_unique_fire
    }), new Hotkey("pets", 
    {
        name: __("Pets"),
        sprite: spr_pet_dog
    }), new Hotkey("artifacts", 
    {
        name: __("Artifacts"),
        sprite: spr_artifact_orb
    }), new Hotkey("cards", 
    {
        name: __("Cards"),
        sprite: spr_card_default
    }), new Hotkey("items", 
    {
        name: __("Equipment"),
        sprite: spr_equip_shield
    }), new Hotkey("materials", 
    {
        name: __("Materials"),
        sprite: spr_material_copper_bar
    }), new Hotkey("relics", 
    {
        name: __("Relics"),
        sprite: spr_relic_uncommon
    }), new Hotkey("scrolls", 
    {
        name: __("Scrolls"),
        sprite: spr_scroll_damage
    }), new Hotkey("chests", 
    {
        name: __("Chests"),
        sprite: spr_chest_rare
    }), new Hotkey("death_book", 
    {
        name: __("Death Book"),
        sprite: spr_borbventure_item_death_book
    }), new Hotkey("skins", 
    {
        name: __("Skins"),
        sprite: spr_player_rainbow
    }), new Hotkey("achievements", 
    {
        name: __("Achievements"),
        sprite: spr_icon_achievement
    }), new Hotkey("milestones", 
    {
        name: __("Milestones"),
        sprite: spr_icon_milestone
    }), new Hotkey("stats", 
    {
        name: __("Stats"),
        sprite: spr_icon_stats
    }), new Hotkey("lore", 
    {
        name: __("Lore"),
        sprite: spr_icon_book
    }), new Hotkey("daily_rewards", 
    {
        name: __("Daily rewards"),
        sprite: spr_icon_calendar
    }), new Hotkey("challenges", 
    {
        name: __("Challenges"),
        sprite: spr_icon_challenge
    }), new Hotkey("bot_control_panel", 
    {
        name: __("Control Panel"),
        sprite: spr_icon_bot
    }), new Hotkey("house_constructor", 
    {
        name: __("House Constructor"),
        sprite: spr_icon_house
    }), new Hotkey("community_leaves", 
    {
        name: __("Community Leaves"),
        sprite: spr_leaf_comm_happy
    }), new Hotkey("account_gateway", 
    {
        name: __("Account"),
        sprite: spr_icon_user
    }), new Hotkey("news", 
    {
        name: __("News"),
        sprite: spr_icon_news
    }), new Hotkey("afk_mode", 
    {
        name: __("AFK Mode"),
        is_nav_hotkey: false,
        
        hotkey_func: function()
        {
            global.options.afk_mode.data.value = !global.options.afk_mode.data.value;
            if (get_option(global.options.afk_mode))
            {
                instance_destroy(o_overlay);
            }
            else
            {
                global.options.afk_mode.change(true);
            }
        }
    }), new Hotkey("draw_hud", 
    {
        name: __("Draw HUD"),
        is_nav_hotkey: false,
        
        hotkey_func: function()
        {
            if (global.is_prestiging)
            {
                exit;
            }
            o_mouse.visible = !o_mouse.visible;
            global.draw_hud = !global.draw_hud;
        }
    }), new Hotkey("refresh_trades", 
    {
        name: __("Refresh Trades/Borbventures"),
        is_nav_hotkey: false,
        
        hotkey_func: function()
        {
            if (!instance_exists(o_dialog) || !o_dialog.visible)
            {
                exit;
            }
            switch (o_dialog.dialog_id)
            {
                case "trading":
                    if (can_refresh_trades())
                    {
                        refresh_trades();
                    }
                    break;
                case "borbventures":
                    if (global.borbventures.can_refresh())
                    {
                        global.borbventures.refresh_borbventures();
                    }
                    break;
            }
        }
    }), new Hotkey("transcend_card", 
    {
        name: __("Transcend Selected Card"),
        is_nav_hotkey: false
    }), new Hotkey("resource_draw_selection", 
    {
        name: __("Change Resource Filter"),
        is_nav_hotkey: false,
        
        hotkey_func: function()
        {
            global.options.resource_draw_selection._func();
        }
    })];
    for (var i = 0; i < 8; i++)
    {
        array_push(global.hotkeys_array, new Hotkey(sprintf("load_loadout_%s", i), 
        {
            name: __s("Load loadout %s", sprintf("#%s", i + 1)),
            is_nav_hotkey: false,
            slot: i + 1,
            
            hotkey_func: function()
            {
                load_loadout(self.slot);
            }
        }));
    }
    for (var i = 0; i < 8; i++)
    {
        array_push(global.hotkeys_array, new Hotkey(sprintf("load_craft_set_%s", i), 
        {
            name: __s("Load craft set %s", sprintf("#%s", i + 1)),
            is_nav_hotkey: false,
            slot: i,
            
            hotkey_func: function()
            {
                load_craft_set(self.slot);
            }
        }));
    }
    global.hotkeys_reserved = [27, 13, 8, 9, 38, 40, 37, 39];
    global.hotkeys = {};
    global.hotkeys_other = [];
    global.hotkey_map = {};
    variable_struct_set(global.hotkey_map, "8", "Backspace");
    variable_struct_set(global.hotkey_map, "9", "Tab");
    variable_struct_set(global.hotkey_map, "160", "LShift");
    variable_struct_set(global.hotkey_map, "162", "LCtrl");
    variable_struct_set(global.hotkey_map, "164", "LAlt");
    variable_struct_set(global.hotkey_map, "165", "RAlt");
    variable_struct_set(global.hotkey_map, "92", "RWin");
    variable_struct_set(global.hotkey_map, "163", "RCtrl");
    variable_struct_set(global.hotkey_map, "161", "RShift");
    variable_struct_set(global.hotkey_map, "12", "Num5");
    variable_struct_set(global.hotkey_map, "13", "Enter");
    variable_struct_set(global.hotkey_map, "16", "Shift");
    variable_struct_set(global.hotkey_map, "17", "Ctrl");
    variable_struct_set(global.hotkey_map, "18", "Alt");
    variable_struct_set(global.hotkey_map, "19", "Pause");
    variable_struct_set(global.hotkey_map, "20", "Caps");
    variable_struct_set(global.hotkey_map, "32", "Space");
    variable_struct_set(global.hotkey_map, "33", "PgUp");
    variable_struct_set(global.hotkey_map, "34", "PgDown");
    variable_struct_set(global.hotkey_map, "35", "End");
    variable_struct_set(global.hotkey_map, "36", "Home");
    variable_struct_set(global.hotkey_map, "37", "Left");
    variable_struct_set(global.hotkey_map, "38", "Up");
    variable_struct_set(global.hotkey_map, "39", "Right");
    variable_struct_set(global.hotkey_map, "40", "Down");
    variable_struct_set(global.hotkey_map, "45", "Insert");
    variable_struct_set(global.hotkey_map, "46", "Delete");
    variable_struct_set(global.hotkey_map, "48", "0");
    variable_struct_set(global.hotkey_map, "49", "1");
    variable_struct_set(global.hotkey_map, "50", "2");
    variable_struct_set(global.hotkey_map, "51", "3");
    variable_struct_set(global.hotkey_map, "52", "4");
    variable_struct_set(global.hotkey_map, "53", "5");
    variable_struct_set(global.hotkey_map, "54", "6");
    variable_struct_set(global.hotkey_map, "55", "7");
    variable_struct_set(global.hotkey_map, "56", "8");
    variable_struct_set(global.hotkey_map, "57", "9");
    variable_struct_set(global.hotkey_map, "65", "A");
    variable_struct_set(global.hotkey_map, "66", "B");
    variable_struct_set(global.hotkey_map, "67", "C");
    variable_struct_set(global.hotkey_map, "68", "D");
    variable_struct_set(global.hotkey_map, "69", "E");
    variable_struct_set(global.hotkey_map, "70", "F");
    variable_struct_set(global.hotkey_map, "71", "G");
    variable_struct_set(global.hotkey_map, "72", "H");
    variable_struct_set(global.hotkey_map, "73", "I");
    variable_struct_set(global.hotkey_map, "74", "J");
    variable_struct_set(global.hotkey_map, "75", "K");
    variable_struct_set(global.hotkey_map, "76", "L");
    variable_struct_set(global.hotkey_map, "77", "M");
    variable_struct_set(global.hotkey_map, "78", "N");
    variable_struct_set(global.hotkey_map, "79", "O");
    variable_struct_set(global.hotkey_map, "80", "P");
    variable_struct_set(global.hotkey_map, "81", "Q");
    variable_struct_set(global.hotkey_map, "82", "R");
    variable_struct_set(global.hotkey_map, "83", "S");
    variable_struct_set(global.hotkey_map, "84", "T");
    variable_struct_set(global.hotkey_map, "85", "U");
    variable_struct_set(global.hotkey_map, "86", "V");
    variable_struct_set(global.hotkey_map, "87", "W");
    variable_struct_set(global.hotkey_map, "88", "X");
    variable_struct_set(global.hotkey_map, "89", "Y");
    variable_struct_set(global.hotkey_map, "90", "Z");
    variable_struct_set(global.hotkey_map, "91", "Win");
    variable_struct_set(global.hotkey_map, "93", "Ctx");
    variable_struct_set(global.hotkey_map, "96", "Num 0");
    variable_struct_set(global.hotkey_map, "97", "Num 1");
    variable_struct_set(global.hotkey_map, "98", "Num 2");
    variable_struct_set(global.hotkey_map, "99", "Num 3");
    variable_struct_set(global.hotkey_map, "100", "Num 4");
    variable_struct_set(global.hotkey_map, "101", "Num 5");
    variable_struct_set(global.hotkey_map, "102", "Num 6");
    variable_struct_set(global.hotkey_map, "103", "Num 7");
    variable_struct_set(global.hotkey_map, "104", "Num 8");
    variable_struct_set(global.hotkey_map, "105", "Num 9");
    variable_struct_set(global.hotkey_map, "106", "Num *");
    variable_struct_set(global.hotkey_map, "107", "Num +");
    variable_struct_set(global.hotkey_map, "109", "Num -");
    variable_struct_set(global.hotkey_map, "110", "Num .");
    variable_struct_set(global.hotkey_map, "111", "Num /");
    variable_struct_set(global.hotkey_map, "112", "F1");
    variable_struct_set(global.hotkey_map, "113", "F2");
    variable_struct_set(global.hotkey_map, "114", "F3");
    variable_struct_set(global.hotkey_map, "115", "F4");
    variable_struct_set(global.hotkey_map, "116", "F5");
    variable_struct_set(global.hotkey_map, "117", "F6");
    variable_struct_set(global.hotkey_map, "118", "F7");
    variable_struct_set(global.hotkey_map, "119", "F8");
    variable_struct_set(global.hotkey_map, "120", "F9");
    variable_struct_set(global.hotkey_map, "121", "F10");
    variable_struct_set(global.hotkey_map, "122", "F11");
    variable_struct_set(global.hotkey_map, "123", "F12");
    variable_struct_set(global.hotkey_map, "144", "Numlock");
    variable_struct_set(global.hotkey_map, "173", "Mute");
    variable_struct_set(global.hotkey_map, "173", "VolDown");
    variable_struct_set(global.hotkey_map, "173", "VolUp");
    variable_struct_set(global.hotkey_map, "186", ";");
    variable_struct_set(global.hotkey_map, "187", "=");
    variable_struct_set(global.hotkey_map, "188", ",");
    variable_struct_set(global.hotkey_map, "189", "-");
    variable_struct_set(global.hotkey_map, "190", ".");
    variable_struct_set(global.hotkey_map, "191", "/");
    variable_struct_set(global.hotkey_map, "192", "'");
    variable_struct_set(global.hotkey_map, "219", "[");
    variable_struct_set(global.hotkey_map, "220", "^");
    variable_struct_set(global.hotkey_map, "221", "]");
    variable_struct_set(global.hotkey_map, "222", "'");
    variable_struct_set(global.hotkey_map, "223", "`");
    variable_struct_set(global.hotkey_map, "226", "\\");
}

function init_hotkeys_late()
{
    var __array = global.artifacts_sorted;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (!mitem.is_usable)
        {
            continue;
        }
        array_push(global.hotkeys_array, new Hotkey(sprintf("artifact_%s", mitem.key), 
        {
            name: __s("Use Artifact %s", mitem.name),
            artifact: mitem,
            is_nav_hotkey: false,
            
            hotkey_func: function()
            {
                self.artifact._activate();
            }
        }));
    }
    __array = global.hotkeys_array;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        variable_struct_set(global.hotkeys, mitem.key, mitem);
        var opt_key = sprintf("hotkey_%s", mitem.key);
        variable_struct_set(global.options, opt_key, new Option(id, 
        {
            index: 40000 + __i,
            name: mitem.name,
            data: 
            {
                value: mitem.hotkey
            },
            section: global.dialog_sections.options.hotkeys,
            sprite: get_default_struct_value(mitem, "sprite"),
            await_input: true,
            await_input_single: true,
            has_clear_button: true,
            hotkey: mitem,
            is_hotkey: true,
            
            func: function()
            {
                init_nav_items();
                o_shop.refresh_surface = true;
            }
        }));
        mitem.option = variable_struct_get(global.options, opt_key);
        if (!mitem.is_nav_hotkey)
        {
            array_push(global.hotkeys_other, mitem);
        }
    }
}

function init_i18n()
{
}

function init_start()
{
    global.gml_functions = {};
    for (var i = 0; i < 10000; i++)
    {
        var name = script_get_name(i);
        var first_letter = string_char_at(name, 1);
        if (first_letter == "<" || first_letter == "@")
        {
            continue;
        }
        variable_struct_set(global.gml_functions, name, method(undefined, i));
    }
    global.debug = false;
    global.debug_toggle = false;
    global.debug_value = 1;
    global.dialog_history = [];
    global.dt = 1;
    global.dtf = 1;
    global.epsilon = 0.00001;
    global.epsilon_max = global.epsilon;
    global.force_skip_to_start = false;
    global.log_enabled = global.debug;
    global.lognumber = 0;
    global.is_steam_initialised = false;
    global.pause = false;
    global.testers = false;
    global.testers_pub = false;
    global.web_base_url = global.debug ? "http://cheesetor/humblenorth/report/router.php" : "https://lbr.humblenorth.de/lbr/report/router.php";
    if (global.testers)
    {
        global.web_base_url = "https://lbr.humblenorth.de/lbr/report3/router.php";
    }
    global.draw_hud = true;
    global.game_version = "2.29.7";
    if (global.testers)
    {
        global.game_version += "-testers";
    }
    global.is_android = false;
    global.is_ios = false;
    global.is_mobile = false;
    global.is_opera = false;
    global.is_pc = true;
    global.os_type_text = "";
    switch (0)
    {
        case 4:
            global.os_type_text = "Android";
            break;
        case 3:
            global.os_type_text = "iOS";
            break;
        case 6:
        case 1:
        case 24:
            global.os_type_text = "GX.games";
            break;
        case 0:
            global.os_type_text = "Steam";
            break;
        default:
            global.os_type_text = "Steam";
            break;
    }
    global.dlc_prices = {};
    global.current_language = "en";
    global.i18n = {};
    global.debug_x = 0;
    global.debug_y = 0;
    global.max_num = get_max_num();
    global.max_num_shop_item = 1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    global.max_round_number = 1000000000000000000;
    date_set_timezone(1);
    gml_release_mode(global.debug && !global.testers);
    global.android_new_save_slot = false;
    global.android_save_slots = [];
    global.android_save_slot_name = "0";
    global.android_sign_in_notification_shown = false;
    global.google_signed_in = false;
    global.image_cache_http = {};
    global.ios_account = undefined;
    global.load_game_content = "";
    global.load_game_content_season = false;
    global.is_android_cloud_loading = false;
    global.is_android_cloud_saving = false;
    global.is_cloud_saving = false;
    global.is_saving = false;
    global.news = undefined;
    global.quitting = false;
    global.save_data_string = "";
    global.profile_types = 
    {
        challenge: "challenge",
        def: "def"
    };
    global.autobuy_priorities = {};
    global.current_profile = global.profile_types.def;
    if (!variable_global_exists("force_exit_challenge"))
    {
        global.force_exit_challenge = false;
    }
    global.profiles = {};
    var __struct = global.profile_types;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(global.profiles, mkey, get_empty_profile_data(mkey));
    }
    global.await_async_actions = {};
    global.await_async_action_text = "";
    global.delay_actions = {};
    global.func_after_cloud_save = undefined;
    global.timeouts = {};
    global.timeouts_end = {};
    if (!global.debug)
    {
        exception_unhandled_handler(crash_handler);
    }
    init_encoding_chars();
    init_hashes();
    init_static_structs();
    init_cloud_data();
    load_token();
    init_fonts();
    set_gui_size();
    init_colors();
    init_date_flags();
    init_number_notations();
    init_coroutines();
    global.awaiting_input_option = undefined;
    global.is_awaiting_input = false;
    global.mouse_click_delay_timer = 0;
    global.mouse_click_duration = 2;
    global.mouse_click_timer = 0;
    global.mouse_click_triggered = false;
    global.inputs = 
    {
        mouse: 
        {
            mb_all: [1, 3, 2]
        }
    };
    global.mouse_drag = 0;
    global.player_controls = 
    {
        dpad: 
        {
            key: "dpad",
            value: "D-pad",
            text: __("D-Pad")
        },
        keyboard: 
        {
            key: "keyboard",
            value: "Keyboard",
            text: __("Keyboard")
        },
        mouse: 
        {
            key: "mouse",
            value: "Mouse",
            text: __("Mouse")
        }
    };
    global.dialog_click_delay = true;
    global.disable_gui_close_tmp = false;
    global.dialog_instance = -1;
    global.dialog_shop_index_last = {};
    global.dialog_shop_section_last = {};
    global.is_dialog_item_button = false;
    init_dialog_sections();
    init_start_once();
    init_options();
    load_options(true);
    global.options.fullscreen.change();
    init_dialog_sections();
    init_dialog_actions();
    init_guide();
    if (global.is_mobile)
    {
        instance_create_layer(0, 0, "control", o_mobile_helper);
    }
    init_texts();
    init_titles();
    init_i18n();
    init_layers();
    init_dialog_actions();
}

function init_start_once()
{
    if (variable_global_exists("init_start_once_done"))
    {
        exit;
    }
    global.init_start_once_done = true;
    global.disable_init_skip_to_start = false;
}
