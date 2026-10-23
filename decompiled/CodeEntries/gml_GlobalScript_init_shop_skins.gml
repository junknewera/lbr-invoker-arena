function init_shop_skins()
{
    global.shops_prestige_levels.skins = global.prestige_levels.inf;
    global.shops.skins = 
    {
        def: 
        {
            index: -500,
            name: __("Default"),
            sprite: spr_player,
            cost: global.costs.skin_default,
            target: "blower",
            data: 
            {
                count: 1
            }
        },
        def_female: 
        {
            index: -499,
            name: __("Default Female"),
            sprite: spr_player_female_blue,
            cost: global.costs.skin_default,
            target: "blower",
            data: 
            {
                count: 1
            }
        },
        alb_def: 
        {
            index: -498,
            name: __("Autoblower Default"),
            sprite: spr_autoblower,
            cost: global.costs.skin_default,
            data: 
            {
                count: 1
            },
            target: "autoblower"
        },
        santa: 
        {
            index: -400,
            name: __("Santa"),
            sprite: spr_player_santa,
            cost: global.costs.skin_discount,
            target: "blower"
        },
        angel_male: 
        {
            index: -300,
            name: __("Angel Male"),
            supporters_only: true,
            sprite: spr_player_male_angel,
            target: "blower"
        },
        angel_female: 
        {
            index: -299,
            name: __("Angel Female"),
            supporters_only: true,
            sprite: spr_player_female_angel,
            target: "blower"
        },
        demon_male: 
        {
            index: -298,
            name: __("Demon Male"),
            supporters_only: true,
            sprite: spr_player_demon,
            target: "blower"
        },
        demon_female: 
        {
            index: -297,
            name: __("Demon Female"),
            supporters_only: true,
            sprite: spr_player_female_demon,
            target: "blower"
        },
        borb_party: 
        {
            index: -296,
            name: __("Borb Party"),
            supporters_only: true,
            sprite: spr_player_borb_party,
            target: "blower"
        },
        superleaf: 
        {
            index: -295,
            name: __("Superleaf"),
            supporters_only: true,
            sprite: spr_player_female_superhero,
            target: "blower"
        },
        electric: 
        {
            index: -294,
            name: __("Electric"),
            supporters_only: true,
            sprite: spr_player_electric,
            target: "blower"
        },
        fairy: 
        {
            index: -27,
            name: __("Fairy"),
            sprite: spr_player_fairy,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        leafcape_male: 
        {
            index: -26,
            name: __("Leafcape Male"),
            sprite: spr_player_male_leafcape,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        leafcape_female: 
        {
            index: -25,
            name: __("Leafcape Female"),
            sprite: spr_player_female_leafcape,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        tree: 
        {
            index: -22,
            name: __("Tree"),
            sprite: spr_player_tree,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        afro: 
        {
            index: -21,
            name: __("Afro"),
            sprite: spr_player_afro,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        rainbow: 
        {
            index: -20,
            name: __("Rainbow"),
            sprite: spr_player_rainbow,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        robot: 
        {
            index: -19,
            name: __("Robot"),
            sprite: spr_player_robot,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        robot2: 
        {
            index: -18,
            name: __("Alternate Robot"),
            sprite: spr_player_robot2,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        gnome: 
        {
            index: -15,
            name: __("Garden Gnome"),
            sprite: spr_player_gnome,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        hitman: 
        {
            index: -10,
            name: __("Hitman"),
            sprite: spr_player_hitman,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        grandma: 
        {
            index: -9,
            name: __("Grandma"),
            sprite: spr_player_grandma,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        grandpa: 
        {
            index: -8,
            name: __("Grandpa"),
            sprite: spr_player_grandpa,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        flokc200k: 
        {
            index: -7,
            name: __("Flokc 200k"),
            description: "Shout-out to the peeps from #leaf-counter for reaching 200k!",
            sprite: spr_player_flokc200k,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        grim: 
        {
            index: -6,
            name: __("69,420"),
            description: "Someone crunched 69,420 times manually. This is for you.",
            sprite: spr_player_blcking,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        cat: 
        {
            index: -5,
            name: __("CAT"),
            sprite: spr_player_cat,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        sacred_flokcette: 
        {
            index: -4,
            name: __("Sacred Flokcette"),
            sprite: spr_icon_flokcette,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        black: 
        {
            index: 1,
            name: __("Black"),
            sprite: spr_player_black,
            cost: global.costs.skin_default,
            target: "blower"
        },
        gray: 
        {
            index: 2,
            name: __("Gray"),
            sprite: spr_player_gray,
            cost: global.costs.skin_default,
            target: "blower"
        },
        green: 
        {
            index: 3,
            name: __("Green"),
            sprite: spr_player_green,
            cost: global.costs.skin_default,
            target: "blower"
        },
        orange: 
        {
            index: 4,
            name: __("Orange"),
            sprite: spr_player_orange,
            cost: global.costs.skin_default,
            target: "blower"
        },
        pink: 
        {
            index: 5,
            name: __("Pink"),
            sprite: spr_player_pink,
            cost: global.costs.skin_default,
            target: "blower"
        },
        purple: 
        {
            index: 6,
            name: __("Purple"),
            sprite: spr_player_purple,
            cost: global.costs.skin_default,
            target: "blower"
        },
        red: 
        {
            index: 8,
            name: __("Red"),
            sprite: spr_player_red,
            cost: global.costs.skin_default,
            target: "blower"
        },
        turquoise: 
        {
            index: 9,
            name: __("Turquoise"),
            sprite: spr_player_turquoise,
            cost: global.costs.skin_default,
            target: "blower"
        },
        white: 
        {
            index: 10,
            name: __("White"),
            sprite: spr_player_white,
            cost: global.costs.skin_default,
            target: "blower"
        },
        yellow: 
        {
            index: 11,
            name: __("Yellow"),
            sprite: spr_player_yellow,
            cost: global.costs.skin_default,
            target: "blower"
        },
        f_black: 
        {
            index: 201,
            name: __("Female Black"),
            sprite: spr_player_female_black,
            cost: global.costs.skin_default,
            target: "blower"
        },
        f_green: 
        {
            index: 203,
            name: __("Female Green"),
            sprite: spr_player_female_green,
            cost: global.costs.skin_default,
            target: "blower"
        },
        f_orange: 
        {
            index: 204,
            name: __("Female Orange"),
            sprite: spr_player_female_orange,
            cost: global.costs.skin_default,
            target: "blower"
        },
        f_pink: 
        {
            index: 205,
            name: __("Female Pink"),
            sprite: spr_player_female_pink,
            cost: global.costs.skin_default,
            target: "blower"
        },
        f_purple: 
        {
            index: 206,
            name: __("Female Purple"),
            sprite: spr_player_female_purple,
            cost: global.costs.skin_default,
            target: "blower"
        },
        f_red: 
        {
            index: 208,
            name: __("Female Red"),
            sprite: spr_player_female_red,
            cost: global.costs.skin_default,
            target: "blower"
        },
        f_turquoise: 
        {
            index: 209,
            name: __("Female Turquoise"),
            sprite: spr_player_female_turquoise,
            cost: global.costs.skin_default,
            target: "blower"
        },
        f_white: 
        {
            index: 2010,
            name: __("Female White"),
            sprite: spr_player_female_white,
            cost: global.costs.skin_default,
            target: "blower"
        },
        f_yellow: 
        {
            index: 2011,
            name: __("Female Yellow"),
            sprite: spr_player_female_yellow,
            cost: global.costs.skin_default,
            target: "blower"
        },
        alb_player: 
        {
            index: 2100,
            name: __("Autoblower Player"),
            sprite: spr_autoblower,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        bee_player: 
        {
            index: 2101,
            name: __("Bee Player"),
            sprite: spr_enemy_bee,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        bird_player: 
        {
            index: 2102,
            name: __("Bird Player"),
            sprite: spr_enemy_bird,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        flask_red_player: 
        {
            index: 2103,
            name: __("Red Flask"),
            sprite: spr_flask_red,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        leaf_blower_player: 
        {
            index: 2104,
            name: __("Leaf Blower"),
            sprite: spr_weapon_leaf_blower,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        ace_of_spades_player: 
        {
            index: 2105,
            name: __("Ace of Spades"),
            sprite: spr_weapon_ace_of_spades,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        cookie_player: 
        {
            index: 2106,
            name: __("Cookie"),
            sprite: spr_autoblower_cookie,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        fruit_player: 
        {
            index: 2500,
            name: __("Fruit"),
            sprite: spr_fruit,
            sprite_image_index: 0,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        printer_player: 
        {
            index: 2501,
            name: __("Printer"),
            sprite: spr_icon_printer,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        gold_leaf_player: 
        {
            index: 2502,
            name: __("Gold Leaf"),
            sprite: spr_leaf_gold,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        borb_player: 
        {
            index: 2600,
            name: __("Borb"),
            sprite: spr_borb,
            sprite_image_index: 0,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        borb_christmas_player: 
        {
            index: 2601,
            name: __("Christmas Borb"),
            sprite: spr_borb_christmas,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        borb_cool: 
        {
            index: 2602,
            name: __("Cool Borb"),
            sprite: spr_borb_cool,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        borb_excited: 
        {
            index: 2603,
            name: __("Excited Borb"),
            sprite: spr_borb_excited,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        borb_helper: 
        {
            index: 2604,
            name: __("Helper Borb"),
            sprite: spr_borb_helper,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        borb_love: 
        {
            index: 2605,
            name: __("Love Borb"),
            sprite: spr_borb_love,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        borb_sip: 
        {
            index: 2606,
            name: __("Sip Borb"),
            sprite: spr_borb_sip,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        borb_viking: 
        {
            index: 2607,
            name: __("Viking Borb"),
            sprite: spr_borb_viking,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        borb_o_lantern: 
        {
            index: 2608,
            name: __("Borb o'Lantern"),
            sprite: spr_borb_o_lantern,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        borb_blush: 
        {
            index: 2609,
            name: __("Blush Borb"),
            sprite: spr_borb_blush,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        borb_fish: 
        {
            index: 2610,
            name: __("Fisher Borb"),
            sprite: spr_borb_fishing,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        borb_square: 
        {
            index: 2611,
            name: __("Square Borb"),
            sprite: spr_borb_square,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        borb_square_pink: 
        {
            index: 2612,
            name: __("Pink Square Borb"),
            sprite: spr_borb_square_pink,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        borb_symmetrical: 
        {
            index: 2613,
            name: __("Symmetrical Borb"),
            sprite: spr_borb_symmetrical,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        borb_heart: 
        {
            index: 2614,
            name: __("Heart Borb"),
            sprite: spr_borb_heartborb,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        borb_nerd: 
        {
            index: 2615,
            name: __("Nerd Borb"),
            sprite: spr_borb_nerd,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        borb_hollow: 
        {
            index: 2616,
            name: __("Hollow Borb"),
            sprite: spr_borb_hollow,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        cursed_cheese: 
        {
            index: 2700,
            name: __("Cursed Cheese"),
            sprite: spr_icon_cursed_cheese,
            sprite_image_index: 0,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        cursed_cheese_cool: 
        {
            index: 2701,
            name: __("Cool Cursed Cheese"),
            sprite: spr_icon_cursed_cheese_cool,
            sprite_image_index: 0,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        die: 
        {
            index: 2710,
            name: __("Die"),
            sprite: spr_icon_die,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        power_die: 
        {
            index: 2711,
            name: __("Power Die"),
            sprite: spr_icon_power_die,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        birthday_cake: 
        {
            index: 2720,
            name: __("Birthday Cake"),
            sprite: spr_icon_birthday_cake,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        birthday_hat: 
        {
            index: 2721,
            name: __("Birthday Hat"),
            sprite: spr_icon_birthday_hat,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        candle: 
        {
            index: 2722,
            name: __("Candle"),
            sprite: spr_icon_candle2,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        ship: 
        {
            index: 2730,
            name: __("Ship"),
            sprite: spr_icon_ship,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        container: 
        {
            index: 2731,
            name: __("Container"),
            sprite: spr_icon_container,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        rce: 
        {
            index: 3000,
            name: __("Real Civil Engineer"),
            description: "Hello, RCE! Skin created by Starr.",
            sprite: spr_player_rce,
            cost: global.costs.skin_premium,
            target: "blower"
        },
        alb_fidget: 
        {
            index: 4500,
            name: __("ALB Fidget Spinner"),
            description: "Supporters only",
            sprite: spr_autoblower_fidget,
            spinning: true,
            supporters_only: true,
            target: "autoblower"
        },
        alb_minime: 
        {
            index: 4901,
            name: __("Autoblower Minime"),
            sprite: spr_autoblower_minime,
            cost: global.costs.skin_premium,
            target: "autoblower"
        },
        alb_black: 
        {
            index: 5001,
            name: __("Autoblower Black"),
            sprite: spr_autoblower_black,
            cost: global.costs.skin_default,
            target: "autoblower"
        },
        alb_blue: 
        {
            index: 5002,
            name: __("Autoblower Blue"),
            sprite: spr_autoblower_blue,
            cost: global.costs.skin_default,
            target: "autoblower"
        },
        alb_gold: 
        {
            index: 5003,
            name: __("Autoblower Gold"),
            sprite: spr_autoblower_gold,
            cost: global.costs.skin_default,
            target: "autoblower"
        },
        alb_green: 
        {
            index: 5004,
            name: __("Autoblower Green"),
            sprite: spr_autoblower_green,
            cost: global.costs.skin_default,
            target: "autoblower"
        },
        alb_pink: 
        {
            index: 5006,
            name: __("Autoblower Pink"),
            sprite: spr_autoblower_pink,
            cost: global.costs.skin_default,
            target: "autoblower"
        },
        alb_rainbow: 
        {
            index: 5007,
            name: __("Autoblower Rainbow"),
            sprite: spr_autoblower_rainbow,
            cost: global.costs.skin_default,
            target: "autoblower"
        },
        alb_red: 
        {
            index: 5008,
            name: __("Autoblower red"),
            sprite: spr_autoblower_red,
            cost: global.costs.skin_default,
            target: "autoblower"
        },
        alb_white: 
        {
            index: 5009,
            name: __("Autoblower White"),
            sprite: spr_autoblower_white,
            cost: global.costs.skin_default,
            target: "autoblower"
        },
        alb_flower: 
        {
            index: 5010,
            name: __("Autoflower"),
            sprite: spr_autoblower_flower,
            cost: global.costs.skin_default,
            target: "autoblower"
        },
        alb_ladybug: 
        {
            index: 5011,
            name: __("Autoblower Ladybug"),
            sprite: spr_autoblower_ladybug,
            cost: global.costs.skin_default,
            target: "autoblower"
        },
        alb_mushroom: 
        {
            index: 5012,
            name: __("Autoblower Mushroom"),
            sprite: spr_autoblower_mushroom,
            cost: global.costs.skin_default,
            target: "autoblower"
        },
        alb_leaf: 
        {
            index: 5013,
            name: __("Autoblower Leaf"),
            sprite: spr_autoblower_leaf,
            cost: global.costs.skin_default,
            target: "autoblower"
        },
        alb_cookie: 
        {
            index: 5014,
            name: __("Autoblower Cookie"),
            sprite: spr_autoblower_cookie,
            cost: global.costs.skin_default,
            target: "autoblower"
        },
        alb_nose: 
        {
            index: 5016,
            name: __("ALB Red Nose"),
            sprite: spr_autoblower_nose,
            cost: global.costs.skin_default,
            target: "autoblower"
        },
        alb_borb: 
        {
            index: 5017,
            name: __("ALB Borb"),
            description: "Borb",
            sprite: spr_pet_borb_walk,
            cost: global.costs.skin_default,
            target: "autoblower"
        },
        alb_flockfly: 
        {
            index: 5018,
            name: __("ALB Flying Flokco"),
            description: __("The prize for counting to 100,000 in #leaf-counter. Congrats, counter gang!"),
            sprite: spr_autoblower_flockfly,
            cost: global.costs.skin_default,
            target: "autoblower"
        },
        alb_spider: 
        {
            index: 5019,
            name: __("ALB Spider"),
            sprite: spr_pet_spider_walk,
            cost: global.costs.skin_default,
            scale_sign: -1,
            target: "autoblower"
        },
        alb_borb_ua: 
        {
            index: 5020,
            name: __("UA Borb"),
            description: "A people free to choose will always choose peace. Stay strong, UA!",
            sprite: spr_borb_ua,
            cost: global.costs.skin_premium,
            data: 
            {
                count: 1
            },
            target: "autoblower"
        },
        alb_borb_o_lantern: 
        {
            index: 5020.1,
            name: __("Borb o'Lantern"),
            sprite: spr_borb_o_lantern,
            cost: global.costs.skin_premium,
            target: "autoblower"
        },
        alb_troll: 
        {
            index: 5021,
            name: __("ALB Troll"),
            sprite: spr_autoblower_troll,
            cost: global.costs.skin_default,
            target: "autoblower"
        },
        alb_die: 
        {
            index: 5022,
            name: concatstr(__("ALB"), " ", __("Die")),
            sprite: spr_icon_die,
            cost: global.costs.skin_default,
            target: "autoblower"
        },
        alb_quark: 
        {
            index: 5023,
            name: concatstr(__("ALB"), " ", __("Quark")),
            sprite: spr_icon_quark,
            cost: global.costs.skin_default,
            target: "autoblower"
        },
        alb_df: 
        {
            index: 6000,
            name: "DangerouslyFunny",
            description: __("Thanks so much, DF!"),
            sprite: spr_autoblower_df,
            cost: global.costs.skin_default,
            target: "autoblower"
        },
        alb_dragoon: 
        {
            index: 6010,
            name: "Dragoon",
            description: "(:",
            sprite: spr_autoblower_dragoon,
            cost: global.costs.skin_default,
            target: "autoblower"
        },
        alb_miltontpike: 
        {
            index: 6020,
            name: "MiltonTPike1",
            description: __("Yo, kiki!"),
            sprite: spr_autoblower_miltontpike,
            cost: global.costs.skin_default,
            target: "autoblower"
        },
        cursor_def: 
        {
            index: 10000,
            name: __("Default"),
            sprite: spr_mouse_cursor,
            sprite_image_index: 0,
            cost: global.costs.skin_default,
            data: 
            {
                count: 1
            },
            target: "cursor"
        },
        cursor_black: 
        {
            index: 10005,
            name: __("Black"),
            sprite: spr_mouse_cursor,
            sprite_image_index: 8,
            cost: global.costs.skin_default,
            target: "cursor"
        },
        cursor_blue: 
        {
            index: 10010,
            name: __("Blue"),
            sprite: spr_mouse_cursor,
            sprite_image_index: 1,
            cost: global.costs.skin_default,
            target: "cursor"
        },
        cursor_gray: 
        {
            index: 10020,
            name: __("Gray"),
            sprite: spr_mouse_cursor,
            sprite_image_index: 2,
            cost: global.costs.skin_default,
            target: "cursor"
        },
        cursor_green: 
        {
            index: 10030,
            name: __("Green"),
            sprite: spr_mouse_cursor,
            sprite_image_index: 4,
            cost: global.costs.skin_default,
            target: "cursor"
        },
        cursor_pink: 
        {
            index: 10040,
            name: __("Pink"),
            sprite: spr_mouse_cursor,
            sprite_image_index: 3,
            cost: global.costs.skin_default,
            target: "cursor"
        },
        cursor_purple: 
        {
            index: 10050,
            name: __("Purple"),
            sprite: spr_mouse_cursor,
            sprite_image_index: 6,
            cost: global.costs.skin_default,
            target: "cursor"
        },
        cursor_red: 
        {
            index: 10060,
            name: __("Red"),
            sprite: spr_mouse_cursor,
            sprite_image_index: 5,
            cost: global.costs.skin_default,
            target: "cursor"
        },
        cursor_teal: 
        {
            index: 10070,
            name: __("Teal"),
            sprite: spr_mouse_cursor,
            sprite_image_index: 7,
            cost: global.costs.skin_default,
            target: "cursor"
        },
        cursor_cheese: 
        {
            index: 11000,
            name: __("Cheese"),
            sprite: spr_mouse_cursor,
            sprite_image_index: 9,
            cost: global.costs.skin_default,
            target: "cursor"
        },
        cursor_borb: 
        {
            index: 11001,
            name: __("Borb"),
            sprite: spr_mouse_cursor_borb,
            cost: global.costs.skin_cursor_premium,
            target: "cursor"
        },
        cursor_cookie: 
        {
            index: 11002.5,
            name: __("Cookie"),
            sprite: spr_mouse_cursor_cookie,
            cost: global.costs.skin_cursor_premium,
            target: "cursor"
        },
        cursor_cursed_cheese: 
        {
            index: 11002,
            name: __("Cursed"),
            sprite: spr_mouse_cursor_cursed,
            cost: global.costs.skin_cursor_premium,
            target: "cursor"
        },
        bunny_small: 
        {
            index: 20000,
            name: __("Smol"),
            scale: 0.5,
            sprite: spr_pet_bunnyo_small,
            cost: global.costs.skin_pet,
            target: "pets",
            target_item: global.pets.bunny
        },
        cat_small: 
        {
            index: 20100,
            name: __("Smol"),
            scale: 0.5,
            sprite: spr_pet_cat_small,
            cost: global.costs.skin_pet,
            target: "pets",
            target_item: global.pets.cat
        },
        cheese_alt: 
        {
            index: 20110,
            name: __("Alternative"),
            scale: 1,
            sprite: spr_pet_cheese_alt,
            cost: global.costs.skin_pet,
            target: "pets",
            target_item: global.pets.cheesetor
        },
        deer_small: 
        {
            index: 20200,
            name: __("Smol"),
            scale: 0.5,
            sprite: spr_pet_deer_small,
            cost: global.costs.skin_pet,
            target: "pets",
            target_item: global.pets.deer
        },
        dog_rce: 
        {
            index: 20300,
            name: "RealCivilEngineer's",
            scale: 15,
            sprite: spr_pet_dog_rce,
            cost: global.costs.skin_pet,
            target: "pets",
            target_item: global.pets.dog
        },
        dog_small: 
        {
            index: 20301,
            name: __("Smol"),
            scale: 0.5,
            sprite: spr_pet_dog_small,
            cost: global.costs.skin_pet,
            target: "pets",
            target_item: global.pets.dog
        },
        fox_small: 
        {
            index: 20400,
            name: __("Smol"),
            scale: 0.5,
            sprite: spr_pet_fox_small,
            cost: global.costs.skin_pet,
            target: "pets",
            target_item: global.pets.fox
        },
        pig_blue: 
        {
            index: 21000,
            name: __("Blue"),
            sprite: spr_pet_pig_blue,
            cost: global.costs.skin_pet,
            target: "pets",
            target_item: global.pets.pig
        },
        pig_green: 
        {
            index: 21000.1,
            name: __("Green"),
            sprite: spr_pet_pig_green,
            cost: global.costs.skin_pet,
            target: "pets",
            target_item: global.pets.pig
        },
        penguin_small: 
        {
            index: 21400,
            name: __("Smol"),
            scale: 0.5,
            sprite: spr_pet_penguin_small,
            cost: global.costs.skin_pet,
            target: "pets",
            target_item: global.pets.penguino
        },
        raccoon_small: 
        {
            index: 21500,
            name: __("Smol"),
            scale: 0.5,
            sprite: spr_pet_raccoon_small,
            cost: global.costs.skin_pet,
            target: "pets",
            target_item: global.pets.raccoon
        },
        spider_burning: 
        {
            index: 22000,
            name: __("Burning"),
            sprite: spr_pet_spider_burning,
            cost: global.costs.skin_pet_premium,
            target: "pets",
            target_item: global.pets.spider
        }
    };
    var defaults = 
    {
        index: 0,
        name: __("Unnamed Skin"),
        description: "",
        sprite: spr_placeholder,
        sprite_walk: undefined,
        cost: global.costs.skin_default,
        is_usable: true,
        img_speed: -1,
        section: global.dialog_sections.shop_skins.blower,
        spinning: false,
        target: "blower"
    };
    _map(global.shops.skins, function(arg0, arg1, arg2, arg3)
    {
        arg0.is_skin = true;
        arg0.scale = get_default_struct_value(arg0, "scale", 1);
        arg0.scale_sign = get_default_struct_value(arg0, "scale_sign", 1);
        arg0.sprite_image_index = get_default_struct_value(arg0, "sprite_image_index", -1);
        arg0.supporters_only = get_default_struct_value(arg0, "supporters_only", false);
        arg0.section = variable_struct_get(global.dialog_sections.shop_skins, arg0.target);
        arg0.target_item = get_default_struct_value(arg0, "target_item", undefined);
        
        arg0.func = function(arg0)
        {
            if (is_undefined(arg0))
            {
                exit;
            }
            if (is_struct(self.target_item))
            {
                call_method(self.target_item, self.target_item.set_skin, self.key);
            }
            else
            {
                var _item = variable_struct_get(global.shops.skins, arg0);
                variable_struct_set(o_game.data.skins, _item.target, _item.key);
            }
            if (instance_exists(o_blower))
            {
                with (o_blower)
                {
                    init_skin();
                }
            }
            if (instance_exists(o_autoblower))
            {
                with (o_autoblower)
                {
                    init_skin();
                }
            }
            if (instance_exists(o_mouse))
            {
                with (o_mouse)
                {
                    init_skin();
                }
            }
        };
        
        if (arg0.supporters_only)
        {
            arg0.description = __("Supporters only");
        }
        if (arg0.target == "cursor")
        {
            arg0.name += " " + __("Cursor");
        }
        else if (is_struct(arg0.target_item))
        {
            arg0.name += " " + arg0.target_item.name;
        }
        struct_apply_defaults(arg0, arg3.defaults);
    }, 
    {
        defaults: defaults
    });
}
