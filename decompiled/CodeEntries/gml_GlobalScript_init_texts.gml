function init_texts()
{
    global.texts = 
    {
        alchemy_brew_titles: 
        {
            title: __("Alchemy"),
            subtitle: __("Brew finished.")
        },
        auto_upgrade_shop_description: __("This useful bot will help to purchase all upgrades in the %s shop. Beep bloop."),
        bartender_talk: [__("Someone mentioned several thousand people at once. He made so many friends!"), __("We only serve Cheddar here. Gruyere? Did you get your taste buds removed?"), __("Did you hear about that cheese factory exploding in France? There was nothing left but de Brie."), __("The first beer is never nice, you have to learn to appreciate it. At least, that's what the myths say. No clue whether that's true or not."), __("So this year I'm eating very old chocolate."), __("Everyone needs to know Farah's puzzles need to be folded."), __("Some time ago, two people consumed raw eggs here. Legends."), __("Didn't realize we had a Disney princess for a mod."), __("Farah will be always my queen."), __("You are not required to set yourself on fire to keep others warm."), __("Pro tip: Chocolate chip muffins are best served warm!"), __("I followed your advice yesterday. A bit too much. I woke up with my head on my desk at 4am."), __("I run because I have to, but otherwise I'd just pick up heavy things and put them back down."), __("Read a book? Scrap that. I found this new game called Leaf Blower Revolution. 100/10."), __("I was hitting the gym yesterday. I realized I was going too heavy, backed it back down to hit good rep counts and focus on form. Squat day today, doing 225x5x5, 100kg-ish."), __("I'm writing on a thesis called 'Understanding the Riemann Zeta function and its functional equations through elementary complex analysis and calculus'. Could you help me with that?"), __("Dutch is drunk German."), __("leafand"), __("Just keep digging, just keep digging..."), __("You're my favorite dairy-product-themed game dev."), __("@gold"), __("Secret used /clear-all-infractions"), __("Do not use hot oil to fix cramps."), __("I caught the guy who tried to kick down our door last weekend. It was quite a funny conversation. I have rarely been so passive-aggressive.\n\n\n\nBasically, he parked his big Mercedes van in front of our door and someone kicked the van and it did damage.\n\n\n\nHis friend lives a street away and told him it was us (which it obviously wasn't, I dislike violence and damaging people's stuff).\n\n\n\nSo after a bit of a talk, he opens his van, takes out a wet wipe, and starts cleaning our door, and two hours later he came back and gave us two very nice beers.\n\n\n\nSo we invited him over and had a drink with him.\n\n\n\nQuite a nice guy actually, he was very sorry."), __("'Which is why, yes, I will eat a hat if Clyde gets added to LBR'. Hello, Clyde!"), "@mena, you folded @OpGamingDK 0.2571 times.", "... mena couldn't.", "Guess who's on crutches for the coming six to eight weeks. I have the flu, so I had to run to the toilet in the middle of the night. Unfortunately there was a door between me and the toilet. So I broke my foot."],
        cancel_dialog: __("Do you really want to cancel this?"),
        click: global.is_mobile ? __("tap") : __("click"),
        click_left: global.is_mobile ? __("tap") : __("left click"),
        click_right: global.is_mobile ? __("tap") : __("right click"),
        converter_increase_output_count: __("Magically, the converters create more output resources. Increases converted output resource by 1 for the current converter."),
        converter_increase_output_count_all: __("Magically, the converters create more output resources. Increases converted output resource by 1 for all converters."),
        confirm_remove_item: __("Do you want to remove this item?"),
        leaf_marketing: __("Receive +1 leaf per level by using advanced marketing techniques."),
        leaf_marketing_resource: __("Receive +1 %s leaf per level by using advanced marketing techniques."),
        newer_save_warning_text: __("You are trying to load a save file of a newer version. This may break your save file. It is recommended to update the game to the current version.") + "\n" + "\n" + __("Do you wish to load this save file?"),
        newer_save_warning_text_version: __("You are trying to load a save file of a newer version. This may break your save file. It is recommended to update the game to the current version.") + "\n" + "\n" + __("Do you wish to load this save file?") + "\n" + "\n" + __("Current version: %s") + "\n" + __("Save version: %s"),
        pub_lore_text_riddle: "10395",
        steam_note_text: concatstr(__s("Note"), ": ", __s("This purchase is tied to your Steam account.")),
        tree: __("Spawns one more leaf per tree.")
    };
    global.texts.shovel_desc = __s("With the Shovel, you can dig up the ground below to collect resources, items and more. Press %s to dig.", global.texts.click);
    global.texts.trout_description = __s("Slap enemies around with a large trout. %s to slap.", global.texts.click);
    var texts_upgrade_attributes = 
    {
        alb_enemy_damage: 
        {
            text: __("ALB damage")
        },
        alb_enemy_damage_multiplier: 
        {
            text: __("ALB damage"),
            is_pct: true,
            auto_alias: true
        },
        alb_battery_capacity: 
        {
            text: __("ALB battery capacity"),
            is_pct: true
        },
        alb_battery_charge_rate: 
        {
            text: __("ALB battery charge")
        },
        alb_blowing_power: 
        {
            text: __("ALB blowing power"),
            is_pct: true,
            auto_alias: true
        },
        alb_speed: 
        {
            text: __("ALB speed")
        },
        alchemy_brew_crit_chance: 
        {
            text: __("Brew crit chance"),
            is_pct: true
        },
        alchemy_brew_crit_multi_chance: 
        {
            text: __("Brew multi-crit chance"),
            is_pct: true
        },
        alchemy_brew_multiplier: 
        {
            text: __("Brew multiplier"),
            is_pct: true
        },
        alchemy_brew_time_reduction: 
        {
            text: __("Brew time"),
            is_pct: true,
            usign: -1
        },
        artifact_max_count_add: 
        {
            text: {},
            text_template: __("[name] max count"),
            collection: "artifacts",
            text_neutral: __("Increased artifact max count")
        },
        artifact_max_count_add_event: 
        {
            text: __s("Increased max count for %s", __("Event Artifacts"))
        },
        artifact_max_count_add_global: 
        {
            text: __s("Increased max count for capped Artifacts")
        },
        artifact_expire_duration: 
        {
            text: __("Artifact expire duration")
        },
        artifact_expire_duration_multiplier: 
        {
            text: __("Artifact expire duration multiplier"),
            is_pct: true
        },
        artifact_fruit_seconds_reduction: 
        {
            text: __("Artifact fruit seconds reduction")
        },
        artifact_spawn_time_reduction: 
        {
            text: __("Artifact spawn time reduction"),
            is_pct: true
        },
        autobuy_accelerator: 
        {
            text: __("Faster autobuy"),
            is_pct: true
        },
        autocraft_delay_reduction: 
        {
            text: __("Autocraft delay"),
            is_pct: true,
            usign: -1
        },
        autocrunch_timer_reduced: 
        {
            text: __("Autocrunch timer reduction")
        },
        banks_boss_card_rarity_multiplier_cards: 
        {
            text: __("Banks card drop rarity"),
            is_pct: true,
            auto_alias: true
        },
        blc_gems_upgrade: 
        {
            text: __("BLC gems upgrade"),
            tags: ["blc"]
        },
        blc_value_adder: 
        {
            text: __("BLC coins"),
            tags: ["blc"]
        },
        blc_value_multiplier: 
        {
            text: __("BLC coins%"),
            is_pct: true,
            auto_alias: true,
            alias: ["blc_value_multiplier_adder"],
            tags: ["blc"]
        },
        blower_blow_leaf_range_multiplier: 
        {
            text: __("Increased blow range"),
            is_pct: true
        },
        blower_enemy_damage: 
        {
            text: __("Blower enemy damage")
        },
        blower_enemy_damage_soul: 
        {
            text: __("Blower enemy damage")
        },
        blower_enemy_damage_multiplier: 
        {
            text: __("Blower enemy damage%"),
            is_pct: true,
            alias: ["blower_enemy_damage_multiplier_global"],
            auto_alias: true
        },
        boostergame_boost_distance: 
        {
            text: __("Travel distance"),
            suffix: " km"
        },
        boostergame_fuel: 
        {
            text: __("Max Fuel")
        },
        boostergame_hp: 
        {
            text: __("Max HP")
        },
        boostergame_hp_regeneration: 
        {
            text: __("HP regeneration")
        },
        boostergame_milk_reward: 
        {
            text: __("Milk reward"),
            is_pct: true
        },
        booster_duration_multiplier: 
        {
            text: __("Booster duration"),
            is_pct: true
        },
        borb_claw_machine_spawn_chances_curse: 
        {
            text: __("Claw curse spawn chance"),
            is_pct: true
        },
        borb_spawn_chance: 
        {
            text: __("Borb spawn chance"),
            is_pct: true
        },
        borbventure_auto_craft_count: 
        {
            text: __s("%s auto craft count", "Borbventure")
        },
        borbventure_craft_cost_multiplier: 
        {
            text: __s("%s item craft cost", "Borbventure"),
            is_pct: true
        },
        borbventure_increase_adventure_rarity: 
        {
            text: __s("%s rarity", "Borbventure"),
            is_pct: true
        },
        borbventure_increase_reward: 
        {
            text: __s("%s reward", "Borbventure"),
            is_pct: true,
            auto_alias: true
        },
        borbventure_increase_start_resources: 
        {
            text: __s("%s start resources", "Borbventure"),
            is_pct: true
        },
        borbventure_increase_success_chance: 
        {
            text: __s("%s success chance", "Borbventure"),
            is_pct: true,
            auto_alias: true
        },
        borbventure_increase_time: 
        {
            text: __s("%s time", "Borbventure"),
            is_pct: true
        },
        borbventure_increase_xp: 
        {
            text: __s("%s experience", "Borbventure"),
            is_pct: true
        },
        borbventure_inventory_size: 
        {
            text: __s("%s inventory size", "Borbventure")
        },
        borbventure_items_ascend_count: 
        {
            text: __s("%s item upgrade count", "Borbventure")
        },
        borbventure_items_max_count: 
        {
            text: __s("%s max item count", "Borbventure")
        },
        borbventure_max_borbventures: 
        {
            text: __s("More %s", "Borbventures")
        },
        borbventure_max_borbs: 
        {
            text: __s("Max Borbs")
        },
        borbventure_refresh_timer_multiplier: 
        {
            text: __s("%s refresh duration", "Borbventure"),
            is_pct: true
        },
        borbventure_special_recruit_chance: 
        {
            text: __s("Special %s recruit chance", "Borb"),
            is_pct: true
        },
        candle_attack_damage: 
        {
            text: __("Candle auto-attack damage")
        },
        candle_attack_damage_manual: 
        {
            text: __("Candle manual blow damage")
        },
        candle_attack_timer_reduction_multiplier: 
        {
            text: __("Candle auto-attack speed"),
            is_pct: true
        },
        candle_manual_blow_timer_reduction_multiplier: 
        {
            text: __("Candle manual blow speed"),
            is_pct: true
        },
        candle_reward_multiplier: 
        {
            text: __("Candle rewards"),
            is_pct: true
        },
        candle_critical_chance: 
        {
            text: __("Candle critical chance"),
            is_pct: true
        },
        candle_critical_multiplier: 
        {
            text: __("Candle critical damage"),
            suffix: "x"
        },
        candle_reduce_reward_multiplier: 
        {
            text: __("Candle loss penalty"),
            is_pct: true,
            usign: -1
        },
        candle_skill_damage: 
        {
            text: __("Candle skill damage")
        },
        candle_skill_speed: 
        {
            text: __("Candle skill speed"),
            is_pct: true
        },
        candle_skill_reward: 
        {
            text: __("Candle skill reward"),
            is_pct: true
        },
        candle_skill_time: 
        {
            text: __("Candle skill time")
        },
        candle_stage_time_limit: 
        {
            text: __("Candle stage time"),
            suffix: "s"
        },
        cards_boss_drop_chance: 
        {
            text: __("Boss Cards spawn chance"),
            is_pct: true
        },
        cards_decrease_transcension_count: 
        {
            text: __("Cards transcension count"),
            usign: -1
        },
        cards_decrease_transcension_count_multiplier: 
        {
            text: __("Cards transcension count"),
            usign: -1,
            is_pct: true
        },
        cards_enemy_drop_chance: 
        {
            text: __("Cards spawn chance"),
            is_pct: true
        },
        chest_spawn_chance: 
        {
            text: __("Chest spawn chance"),
            is_pct: true
        },
        claw_curses: 
        {
            text: __("Claw curse count")
        },
        claw_equipment: 
        {
            text: __s("Claw %s count", __("Equipment"))
        },
        claw_materials: 
        {
            text: __s("Claw %s count", __("Materials"))
        },
        claw_materials_multiplier: 
        {
            text: __s("Claw %s count", __("Materials")),
            is_pct: true,
            auto_alias: true
        },
        combo_max: 
        {
            text: __("Max combo")
        },
        combo_max_multiplier: 
        {
            text: __("Max combo multiplier"),
            is_pct: true
        },
        combo_multiplier: 
        {
            text: __("Combo multiplier"),
            is_pct: true
        },
        combo_multiplier_multiplier: 
        {
            text: __("Combo multiplier"),
            is_pct: true
        },
        combo_rewards: 
        {
            text: __("Combo multiplier"),
            is_pct: true
        },
        converter_batch_count: 
        {
            text: __("Converter batch count")
        },
        converter_crit_chance: 
        {
            text: __("Converter crit chance"),
            is_pct: true
        },
        converter_crit_value: 
        {
            text: __("Converter crit value"),
            is_pct: true
        },
        converter_crit_value_multiplier: 
        {
            text: __("Converter crit value"),
            is_pct: true,
            auto_alias: true
        },
        converter_output_add: 
        {
            text: __("Converter per leaf output")
        },
        converter_output_add_global: 
        {
            text: __("Converter global leaf output")
        },
        converter_output_multiplier: 
        {
            text: __("Converter output multiplier")
        },
        converter_output_multiplier_global: 
        {
            text: __("Converter global output multiplier")
        },
        converter_reduce_input_recources: 
        {
            text: __("Converter input reduction")
        },
        converter_speed: 
        {
            text: __("Converter speed"),
            is_pct: true
        },
        craft_backpack_size: 
        {
            text: __("Craft backpack size")
        },
        craft_leaf_type_manual: 
        {
            text: {},
            collection: "resources",
            text_template: __("Craft [name_plural] manually"),
            text_neutral: __("Craftable leaf type"),
            text_only: true
        },
        craft_level: 
        {
            text: __("Craft Level")
        },
        craft_max_tier: 
        {
            text: __("Max craft tier")
        },
        craft_min_chance: 
        {
            text: __("Craft rarity chance")
        },
        craft_min_chance_multiplier: 
        {
            text: __("Craft rarity chance"),
            is_pct: true,
            auto_alias: true
        },
        craft_upgrade_decrease_cost: 
        {
            text: __("Decrease Crafted Leaves Upgrade Cost")
        },
        curse_machine_slower_aim_multiplier: 
        {
            text: __("Slower Curse Machine aim speed"),
            is_pct: true
        },
        curse_machine_slower_charge_speed_multiplier: 
        {
            text: __("Slower Curse Machine charge speed"),
            is_pct: true
        },
        cursed_autocollect: 
        {
            text: __("Curses"),
            suffix: "/s"
        },
        cursed_autocollect_multiplier: 
        {
            text: __("Curses/s"),
            is_pct: true,
            auto_alias: true
        },
        cursed_count_multiplier: 
        {
            text: __("Curses multiplier"),
            is_pct: true,
            auto_alias: true
        },
        daily_quest_slots: 
        {
            text: __("Daily quest slots")
        },
        daily_reward_gems: 
        {
            text: __("Daily gems")
        },
        daily_reward_multiplier: 
        {
            text: __("Daily reward multiplier"),
            is_pct: true,
            auto_alias: true
        },
        daily_reward_result: 
        {
            text: __("Daily")
        },
        damage_resistance: 
        {
            text: __("Damage resistance"),
            is_pct: true
        },
        damage_resistance_absolute: 
        {
            text: __("Absolute damage resistance")
        },
        damage_types: 
        {
            text: {},
            text_template: __("Damage type [name]"),
            is_pct: true,
            collection: "damage_types",
            text_neutral: __("Damage type")
        },
        damage_types_environment_resistance: 
        {
            text: {},
            text_template: __("Damage resistance [name]"),
            is_pct: true,
            collection: "damage_types_environment",
            text_neutral: __("Environmental damage resistance")
        },
        db_enemy_add_damage_multiplier: 
        {
            text: {},
            text_template: __("More damage vs [name]"),
            collection: "enemies",
            is_pct: true
        },
        db_level: 
        {
            text: __("Passive kill rate")
        },
        db_kpr_level: 
        {
            text: __("Passive kill count")
        },
        db_souls_chance_level_multiplier: 
        {
            text: __("Soul boost chance"),
            is_pct: true,
            alias: ["db_souls_chance_level"],
            auto_alias: true
        },
        db_souls_count_multiplier: 
        {
            text: __("Raw Soul Stone drop count"),
            is_pct: true,
            alias: ["db_souls_count_level"],
            auto_alias: true
        },
        db_souls_offline_level: 
        {
            text: __("Passive Soul boost chance"),
            is_pct: true
        },
        db_souls_pity_counter_level: 
        {
            text: __("Soul boost pity counter")
        },
        dice_battlefield_damage: 
        {
            text: __s("%s damage", __("Dice Battlefield"))
        },
        dice_battlefield_damage_multiplier: 
        {
            text: __s("%s damage", __("Dice Battlefield")),
            is_pct: true,
            auto_alias: true
        },
        dice_battlefield_die_drop_chance: 
        {
            text: __s("%s drop chance", __("Dice")),
            is_pct: true
        },
        dice_battlefield_roll_timeout_reduction: 
        {
            text: __s("%s roll timeout", __("Dice Battlefield")),
            suffix: "s",
            usign: -1
        },
        dice_battlefield_reward_multiplier: 
        {
            text: __s("%s reward", __("Dice Battlefield")),
            is_pct: true,
            auto_alias: true
        },
        dice_cursed_critical_chance: 
        {
            text: __s("%s critical chance", __("Cursed Dice")),
            suffix: "%"
        },
        dice_cursed_critical_multiplier: 
        {
            text: __s("%s critical multiplier", __("Cursed Dice")),
            is_pct: true
        },
        dice_cursed_reward: 
        {
            text: __s("%s reward", __("Cursed Dice"))
        },
        dice_cursed_reward_multiplier: 
        {
            text: __s("%s reward multiplier", __("Cursed Dice")),
            is_pct: true,
            auto_alias: true
        },
        dice_cursed_timeout_reduction_multiplier: 
        {
            text: __s("%s timeout reduction", __("Cursed Dice")),
            is_pct: true,
            auto_alias: true
        },
        dice_dice: 
        {
            text: __("Dice count")
        },
        dice_dice_multiplier: 
        {
            text: __("Dice count"),
            is_pct: true,
            auto_alias: true
        },
        dice_drop_value: 
        {
            text: __("Dice drop value")
        },
        dice_drop_value_multiplier: 
        {
            text: __("Dice drop value"),
            is_pct: true,
            auto_alias: true
        },
        dice_backpack_size: 
        {
            text: __("Dice backpack slots")
        },
        dice_inventory_size: 
        {
            text: __("Dice inventory slots")
        },
        dice_power_roll_count: 
        {
            text: __("Dice power roll count")
        },
        dice_sides: 
        {
            text: __("Dice sides")
        },
        dice_sides_multiplier: 
        {
            text: __("Dice sides"),
            is_pct: true,
            auto_alias: true
        },
        dice_timeout_reduction: 
        {
            text: __("Dice roll timeout"),
            suffix: "s",
            usign: -1
        },
        dig_count: 
        {
            text: __("Dig count")
        },
        enemy_add_damage_multiplier: 
        {
            text: {},
            text_template: __("More damage vs [name]"),
            collection: "enemies",
            is_pct: true
        },
        enemy_add_reward: 
        {
            text: {},
            text_template: __("Enemy drop [name]"),
            collection: "resources"
        },
        enemy_add_reward_chance: 
        {
            text: {},
            text_template: __("Enemy drop chance [name]"),
            collection: "resources",
            is_pct: true
        },
        enemy_drop_multiplier: 
        {
            text: __("Enemy resource drop multiplier"),
            is_pct: true,
            auto_alias: true
        },
        enemy_shards_drop_base_value: 
        {
            text: __("Enemy shards count")
        },
        enemy_shards_drop_multiplier: 
        {
            text: __("Enemy shards multiplier"),
            is_pct: true,
            auto_alias: true
        },
        enemy_spawn_chance: 
        {
            text: __("Enemy spawn chance"),
            is_pct: true
        },
        energy_base_charge_value: 
        {
            text: __("Energy charge/s")
        },
        energy_base_charge_value_single: 
        {
            text: {},
            text_template: __("[name] charge/s"),
            collection: "resources",
            is_pct: true
        },
        energy_base_charge_value_multiplier: 
        {
            text: __("Energy charge/s%"),
            is_pct: true,
            auto_alias: true
        },
        energy_base_charge_value_multiplier_single: 
        {
            text: {},
            text_template: __("[name] charge/s%"),
            collection: "resources",
            is_pct: true
        },
        fishing_auto_duration_reduction: 
        {
            text: __("Auto fishing timer"),
            usign: -1,
            suffix: "s"
        },
        fishing_bait_farm_progress_value: 
        {
            text: __("Bait farm progress value"),
            is_pct: true
        },
        fishing_bait_farm_rarity_multiplier: 
        {
            text: __("Bait farm rarity multiplier"),
            is_pct: true
        },
        fishing_catch_credits_multiplier: 
        {
            text: __("Fish Credits"),
            is_pct: true,
            auto_alias: true
        },
        fishing_catch_rarity_multiplier: 
        {
            text: __("Fish rarity"),
            is_pct: true,
            auto_alias: true
        },
        fishing_catch_tide_crystal_chance: 
        {
            text: __("Tide Crystal chance"),
            is_pct: true,
            auto_alias: true
        },
        fishing_min_fish_length: 
        {
            text: __("Minimum fish length"),
            suffix: "m"
        },
        fishing_min_fish_length_multiplier: 
        {
            text: __("Minimum fish length"),
            is_pct: true,
            auto_alias: true
        },
        fishing_max_fish_length: 
        {
            text: __("Maximum fish length"),
            suffix: "m"
        },
        fishing_max_fish_length_multiplier: 
        {
            text: __("Maximum fish length"),
            is_pct: true,
            auto_alias: true
        },
        fishing_rods_max_count: 
        {
            text: __("Fishing rods max count")
        },
        fishing_spots_rarity_multiplier: 
        {
            text: __("Fishing spots rarity"),
            is_pct: true,
            auto_alias: true
        },
        fishing_tourney_rod_value: 
        {
            text: __("Tournament Rod value")
        },
        fishing_tourney_rod_value_multiplier: 
        {
            text: __("Tournament Rod value"),
            is_pct: true,
            auto_alias: true
        },
        fishing_tournament_boost_chance: 
        {
            text: __("Tournament boost chance"),
            is_pct: true
        },
        fishing_tournament_success_chance: 
        {
            text: __("Tournament success chance"),
            is_pct: true
        },
        fishing_wait_duration_reduction: 
        {
            text: __("Rod recharge duration"),
            usign: -1
        },
        fishing_wait_duration_reduction_multiplier: 
        {
            text: __("Rod recharge duration"),
            is_pct: true,
            auto_alias: true,
            usign: -1
        },
        fishing_xp_multiplier: 
        {
            text: __("Fishing XP"),
            is_pct: true
        },
        flame_vulnerability: 
        {
            text: __("Flame vulnerability"),
            is_pct: true
        },
        fruit_spawn_chance: 
        {
            text: __("Fruit spawn chance"),
            is_pct: true
        },
        fruit_spawn_chance_multi: 
        {
            text: __("Multiple fruit spawn chance"),
            is_pct: true
        },
        fruit_unlocked: 
        {
            text: __("Unlocked fruits")
        },
        fruit_value: 
        {
            text: __("Fruit value")
        },
        fruit_value_multiplier: 
        {
            text: __("Fruit value multiplier")
        },
        gem_leaf_multiplier: 
        {
            text: __("Gem leaf multiplier"),
            is_pct: true
        },
        gem_leaf_multiplier_cards: 
        {
            text: __("Gem leaf multiplier"),
            is_pct: true
        },
        gem_leaf_multiplier_milestone: 
        {
            text: __("Gem leaf multiplier"),
            is_pct: true
        },
        harbor_container_auto_add_count: 
        {
            text: __("Container auto add"),
            suffix: "/s"
        },
        harbor_container_leaf_adder: 
        {
            text: __("Container leaves")
        },
        harbor_container_leaf_multiplier: 
        {
            text: __("Container leaves"),
            is_pct: true,
            auto_alias: true
        },
        harbor_container_max_count: 
        {
            text: __("Max containers")
        },
        harbor_container_max_storage: 
        {
            text: __("Container max storage")
        },
        harbor_container_max_storage_multiplier: 
        {
            text: __("Container max storage"),
            is_pct: true,
            auto_alias: true
        },
        harbor_diver_find_water_crystal_chance: 
        {
            text: __("Diver find chance"),
            is_pct: true,
            auto_alias: true
        },
        harbor_diver_find_water_crystal_count: 
        {
            text: __("Diver find count")
        },
        harbor_generator_output_multiplier: 
        {
            text: __("Generator output"),
            is_pct: true,
            auto_alias: true
        },
        harbor_inventory_backpack_size: 
        {
            text: __("Harbor backpack size")
        },
        harbor_inventory_inventory_size: 
        {
            text: __("Harbor inventory size")
        },
        harbor_jobs_duration_multiplier: 
        {
            text: __("Harbor job duration"),
            is_pct: true,
            usign: -1
        },
        harbor_jobs_max_count: 
        {
            text: __("Max Harbor jobs")
        },
        harbor_jobs_reward_multiplier: 
        {
            text: __("Harbor job rewards"),
            is_pct: true,
            auto_alias: true
        },
        harbor_jobs_refresh_max_count: 
        {
            text: __("Max Harbor refresh jobs")
        },
        harbor_packer_pack_count: 
        {
            text: __("Packer pack count")
        },
        harbor_packer_pack_count_multiplier: 
        {
            text: __("Packer pack count"),
            is_pct: true,
            auto_alias: true
        },
        harbor_ship_count: 
        {
            text: __("Max ships")
        },
        harbor_ship_fuel_efficiency: 
        {
            text: __("Required fuel"),
            is_pct: true,
            usign: -1
        },
        harbor_ship_reward_multiplier: 
        {
            text: __("Ship reward"),
            is_pct: true
        },
        harbor_ship_speed_multiplier: 
        {
            text: __("Ship speed"),
            is_pct: true,
            auto_alias: true
        },
        harbor_ship_xp_multiplier: 
        {
            text: __("Ship XP"),
            is_pct: true,
            auto_alias: true
        },
        harbor_special_route_chance: 
        {
            text: __("Special route chance"),
            is_pct: true,
            auto_alias: true
        },
        item_collect_count: 
        {
            text: __("Equipment collect count")
        },
        item_drop_chance: 
        {
            text: __("Equipment drop chance"),
            is_pct: true
        },
        item_level_reset_count: 
        {
            text: {},
            text_template: __("Keep [name] upgrade level"),
            collection: "upgradable_items"
        },
        leaf_add: 
        {
            text: __("Leaf value adder")
        },
        leaf_crumble_duration: 
        {
            text: __("Crumble Duration"),
            is_pct: true
        },
        leaf_multiplier: 
        {
            text: __("Leaf value multiplier"),
            is_pct: true,
            alias: ["leaf_multiplier_all", "leaf_hard_multiplier"],
            auto_alias: true
        },
        leaf_merge_count_add: 
        {
            text: __("Additional merged leaves")
        },
        leaf_merge_range: 
        {
            text: __("Additional merge range")
        },
        leaf_pub_counter: 
        {
            text: __("Leaf counter value")
        },
        leaf_pub_counter_autocount: 
        {
            text: __("Auto leaf counter"),
            suffix: "/s"
        },
        leaf_pub_counter_delay_reduction: 
        {
            text: __("Leaf counter delay"),
            usign: -1,
            is_pct: true
        },
        leaf_pub_counter_bet_chance: 
        {
            text: __("Leaf counter bet chance"),
            is_pct: true
        },
        leaf_pub_counter_bet_multiplier: 
        {
            text: __("Leaf counter bet multiplier"),
            is_pct: true
        },
        leaf_pub_counter_multiplier: 
        {
            text: __("Leaf counter multiplier"),
            is_pct: true
        },
        leaf_spawn_chance: 
        {
            text: __("Leaf spawn chance"),
            is_pct: true
        },
        leafton_pit_duration: 
        {
            text: __("Leafton Pit duration"),
            suffix: "s"
        },
        leafton_pit_enemy_spawn_count: 
        {
            text: __("Leafton Pit enemy spawn count"),
            auto_alias: true
        },
        leafton_pit_quark_boost_chance: 
        {
            text: __("Leafton Pit Quark boost chance"),
            is_pct: true,
            auto_alias: true
        },
        leafton_pit_reward_multiplier: 
        {
            text: __("Leafton Pit reward"),
            is_pct: true,
            auto_alias: true
        },
        leafton_pit_reward_quark_blob: 
        {
            text: __("Leafton Pit Quark Blob reward"),
            is_pct: true,
            auto_alias: true
        },
        leafton_pit_reward_quark_structure: 
        {
            text: __("Leafton Pit Quark Structure reward"),
            is_pct: true,
            auto_alias: true
        },
        leafton_pit_reward_quantum_blob: 
        {
            text: __("Leafton Pit Quantum Blob reward"),
            is_pct: true,
            auto_alias: true
        },
        leafscender_decrease_convert_time: 
        {
            text: __("Leafscender duration"),
            is_pct: true,
            usign: -1
        },
        leafscender_decrease_input_cost: 
        {
            text: __("Leafscender input cost"),
            usign: -1
        },
        leafscender_decrease_input_cost_multiplier: 
        {
            text: __("Leafscender input cost%"),
            is_pct: true,
            usign: -1
        },
        leafscender_output_count: 
        {
            text: __("Leafscender output count")
        },
        leafscender_safe_mode: 
        {
            text: __("Leafscender safe mode")
        },
        material_autocollect: 
        {
            text: __("Get random materials"),
            suffix: "/s"
        },
        material_collect_count: 
        {
            text: __("Material collect count")
        },
        material_max_count: 
        {
            text: __("Material storage")
        },
        material_max_count_single: 
        {
            text: {},
            text_template: __("Material storage [name_plural]"),
            collection: "materials"
        },
        material_spawn_chance_add_base: 
        {
            text: __("Material spawn chance"),
            is_pct: true
        },
        material_spawn_chance_add_base_single: 
        {
            text: {},
            text_template: __("Material spawn chance [name_plural]"),
            is_pct: true,
            collection: "materials"
        },
        material_spawn_chance_multiplier: 
        {
            text: __("Material spawn chance multiplier"),
            is_pct: true
        },
        max_energy_storage: 
        {
            text: __("Max energy storage")
        },
        max_leaf_storage: 
        {
            text: __("Max leaf storage")
        },
        max_mirrors: 
        {
            text: __("Max mirrors")
        },
        max_pets: 
        {
            text: __("Max pets")
        },
        max_printer_storage: 
        {
            text: __("Max printer storage")
        },
        max_resource_storage: 
        {
            text: {},
            collection: "resources",
            text_template: __("Max [name] storage"),
            text_neutral: __("Max Energy storage")
        },
        max_resource_storage_pct: 
        {
            text: {},
            collection: "resources",
            text_template: __("Max [name] storage%"),
            is_pct: true,
            text_neutral: __("Max Energy storage%")
        },
        max_unique_leaves: 
        {
            text: __("Max unique leaves")
        },
        merge_count_global: 
        {
            text: __("Global merge input count reduction")
        },
        merge_count_resources: 
        {
            text: __("Merge input count reduction")
        },
        mines_coal_time_sphere_efficiency: 
        {
            text: __("Coal Time Sphere efficiency"),
            is_pct: true,
            auto_alias: true
        },
        mines_drill_depth_progress: 
        {
            text: __("Depth Drill power"),
            suffix: "m"
        },
        mines_drill_depth_progress_multiplier: 
        {
            text: __("Depth Drill power"),
            is_pct: true,
            auto_alias: true
        },
        mines_drill_depth_fuel_drain_reduction_multiplier: 
        {
            text: __("Depth Drill fuel reduction"),
            is_pct: true,
            auto_alias: true,
            usign: -1
        },
        mines_drill_free_refuel_multiplier: 
        {
            text: __("Depth Drill refuel multiplier"),
            is_pct: true,
            auto_alias: true
        },
        mines_drill_progress_multiplier: 
        {
            text: __("Mine Drill power"),
            is_pct: true,
            auto_alias: true
        },
        mines_inventory_size: 
        {
            text: __("Mines inventory size")
        },
        mines_items_max_count: 
        {
            text: __s("%s max item count", __("Mines"))
        },
        mines_max_active_caves: 
        {
            text: __("Max active cave mining")
        },
        mines_max_caves: 
        {
            text: __("Max caves")
        },
        mines_max_mines: 
        {
            text: __("Max mines")
        },
        mines_max_veins: 
        {
            text: __("Max mine veins")
        },
        mines_max_veins_mine_count: 
        {
            text: __("Max mine vein mine count")
        },
        mines_max_level: 
        {
            text: __("Mines max level")
        },
        mines_min_level: 
        {
            text: __("Mines min level")
        },
        mines_mine_power_multiplier: 
        {
            text: __("Mine power"),
            is_pct: true,
            auto_alias: true
        },
        mines_rarity_multiplier: 
        {
            text: __("Mine caves rarity multiplier"),
            is_pct: true,
            auto_alias: true
        },
        mines_reward_multiplier: 
        {
            text: __("Mine caves reward multiplier"),
            is_pct: true,
            auto_alias: true
        },
        mines_search_duration_reduction_multiplier: 
        {
            text: __("Mine search time"),
            is_pct: true,
            auto_alias: true,
            usign: -1
        },
        mines_veins_rarity_multiplier: 
        {
            text: __("Mine veins rarity multiplier"),
            is_pct: true,
            auto_alias: true
        },
        mines_veins_reward_multiplier: 
        {
            text: __("Mine veins reward multiplier"),
            is_pct: true,
            auto_alias: true
        },
        mines_veins_search_reduction_multiplier: 
        {
            text: __("Mine veins search time"),
            is_pct: true,
            auto_alias: true,
            usign: -1
        },
        mirror_drop_relic_fragments_chance: 
        {
            text: __("Mirror Relic Fragment drop chance"),
            is_pct: true
        },
        mirror_drop_relic_fragments_count: 
        {
            text: __("Mirror Relic Fragment drop count")
        },
        mirror_efficiency: 
        {
            text: __("Mirror efficiency"),
            is_pct: true
        },
        mlc_gems_upgrade: 
        {
            text: __("MLC gems upgrade"),
            tags: ["mlc"]
        },
        mlc_value_adder: 
        {
            text: __("MLC coins"),
            tags: ["mlc"]
        },
        mlc_value_multiplier: 
        {
            text: __("MLC coins%"),
            is_pct: true,
            alias: ["mlc_value_multiplier_adder"],
            auto_alias: true,
            tags: ["mlc"]
        },
        nature_butterfly_xp_multiplier_global: 
        {
            text: __("Butterfly XP multiplier"),
            is_pct: true
        },
        nature_enhance_bonus_multiplier: 
        {
            text: __("Nature field quality bonus"),
            is_pct: true
        },
        nature_enhance_cost_reduction: 
        {
            text: __("Enhance cost reduction"),
            is_pct: true,
            usign: -1
        },
        nature_enhance_timeout_multiplier: 
        {
            text: __("Enhance field delay"),
            is_pct: true,
            usign: -1
        },
        nature_global_upgrade_bonus_value: 
        {
            text: __("Nature global upgrade bonus"),
            is_pct: true
        },
        nature_max_fields: 
        {
            text: __("Max nature fields")
        },
        nature_plant_grow_duration: 
        {
            text: __("Plant grow duration"),
            is_pct: true,
            usign: -1
        },
        nature_plant_harvest_bfly_chance: 
        {
            text: __("Plant harvest butterfly chance"),
            is_pct: true
        },
        nature_plant_harvest_seed_chance: 
        {
            text: __("Plant harvest seed chance"),
            is_pct: true
        },
        nature_plant_xp_multiplier: 
        {
            text: {},
            collection: "resources",
            text_template: __("[name] XP%"),
            is_pct: true,
            text_neutral: __("Plant XP multiplier")
        },
        nature_plant_xp_multiplier_global: 
        {
            text: __("Plant XP multiplier"),
            is_pct: true,
            auto_alias: true
        },
        nature_time_skip_value_multiplier: 
        {
            text: __("Nature Time Sphere time multiplier"),
            is_pct: true
        },
        nature_vial_clover3_spawn_chance: 
        {
            text: __s("Vial %s spawn chance", __("3-Leaf Clover")),
            is_pct: true
        },
        nature_vial_clover4_spawn_chance: 
        {
            text: __s("Vial %s spawn chance", __("4-Leaf Clover")),
            is_pct: true
        },
        nature_vial_max_charges: 
        {
            text: __("Max vial charges")
        },
        nature_vial_progress_multiplier: 
        {
            text: __("Vial progress multiplier"),
            is_pct: true
        },
        nature_vial_rarity_seed_spawn_chance: 
        {
            text: __("Increased vial seed rarity chance"),
            is_pct: true
        },
        nature_vial_seed_spawn_count: 
        {
            text: __("Vial seed spawn count")
        },
        nature_vial_seed_spawn_crit_chance: 
        {
            text: __("Vial seed spawn critical chance"),
            is_pct: true
        },
        nature_water_all_fields_effectivity: 
        {
            text: __("Water splash value"),
            is_pct: true
        },
        nature_water_increase_value: 
        {
            text: __("Water value"),
            is_pct: true
        },
        nature_water_decrease_drain_value_multiplier: 
        {
            text: __("Water drain"),
            is_pct: true,
            usign: -1
        },
        nature_xp_multiplier: 
        {
            text: __("Nature XP bonus"),
            is_pct: true,
            auto_alias: true
        },
        nuclear_fuel: 
        {
            text: __("Nuclear fuel")
        },
        nuclear_fuel_multiplier: 
        {
            text: __("Nuclear fuel"),
            is_pct: true,
            auto_alias: true
        },
        offline_blc: 
        {
            text: __("Offline BLC"),
            suffix: "/m"
        },
        offline_boss_multiplier: 
        {
            text: __("Passive Boss Multiplier"),
            is_pct: true
        },
        offline_boss_kills_base: 
        {
            text: __("Passive Boss Kills")
        },
        offline_boss_kills_multiplier: 
        {
            text: __("Passive Boss Kills"),
            is_pct: true,
            auto_alias: true
        },
        offline_crunches: 
        {
            text: __("Offline Crunches"),
            suffix: "/m"
        },
        offline_multiplier: 
        {
            text: __("Offline reward"),
            is_pct: true
        },
        offline_mlc: 
        {
            text: __("Offline MLC"),
            suffix: "/m"
        },
        offline_mlc_pct: 
        {
            text: __("Offline MLC%"),
            is_pct: true
        },
        offline_tower_floors: 
        {
            text: __("Offline Tower Floors"),
            suffix: "/m"
        },
        pet_auto_pet_count: 
        {
            text: __("Pet auto count")
        },
        pet_auto_pet_count_multiplier: 
        {
            text: __("Pet auto count"),
            is_pct: true,
            auto_alias: true
        },
        pet_max_upgrade_level: 
        {
            text: __("Max pet upgrade level")
        },
        player_hp: 
        {
            text: __("Player HP")
        },
        player_hp_multiplier: 
        {
            text: __("Player HP"),
            is_pct: true,
            auto_alias: true
        },
        player_hp_reg: 
        {
            text: __("HP regeneration")
        },
        player_hp_reg_multiplier: 
        {
            text: __("HP regeneration"),
            is_pct: true
        },
        player_resistance: 
        {
            text: __("Player resistance")
        },
        prestige_persist_resources: 
        {
            text: {}
        },
        prestige_persist_shops: 
        {
            text: {},
            collection: "shops",
            text_template: __("Persist prestige shop [name]"),
            text_neutral: __("Presist prestige shop")
        },
        prestige_value_multiplier: 
        {
            text: __("Prestige coins"),
            is_pct: true,
            auto_alias: true
        },
        prestige_value_multiplier_adder: 
        {
            text: 0
        },
        printer_adder: 
        {
            text: __("Printed leaves output")
        },
        printer_multiplier: 
        {
            text: __("Printer output"),
            is_pct: true,
            auto_alias: true,
            alias: ["printer_multiplier_multiplier"]
        },
        printer_printer: 
        {
            text: __("Printer printer")
        },
        printer_printer_multiplier: 
        {
            text: __("Printer printer"),
            is_pct: true,
            auto_alias: true
        },
        quark_energy_charge_multiplier: 
        {
            text: __("Quark Blob charge multiplier"),
            tags: ["quark"],
            is_pct: true
        },
        quark_damage: 
        {
            text: __("Quark damage"),
            tags: ["quark"]
        },
        quark_damage_multiplier: 
        {
            text: __("Quark damage"),
            is_pct: true,
            auto_alias: true,
            tags: ["quark"]
        },
        quark_damage_blower_damage_multiplier: 
        {
            text: __("Quark to Regular damage"),
            is_pct: true,
            auto_alias: true,
            tags: ["quark"]
        },
        quark_funnel_time_reduction_multiplier: 
        {
            text: __("Quark funnel time reduction"),
            is_pct: true,
            auto_alias: true,
            tags: ["quark"]
        },
        quark_quantify_time_reduction_multiplier: 
        {
            text: __("Quark quantify time reduction"),
            is_pct: true,
            auto_alias: true,
            tags: ["quark"]
        },
        quark_reactor_add_quark: 
        {
            text: __("Quark add count"),
            tags: ["quark"]
        },
        quark_reactor_add_quark_multiplier: 
        {
            text: __("Quark add count"),
            is_pct: true,
            auto_alias: true,
            tags: ["quark"]
        },
        quark_reactor_inc_count: 
        {
            text: __("Quark reactor increase value"),
            suffix: "/s",
            tags: ["quark"]
        },
        quark_reactor_inc_count_multiplier: 
        {
            text: __("Quark reactor increase value"),
            is_pct: true,
            auto_alias: true,
            tags: ["quark"]
        },
        quark_reactor_add_chance_multiplier: 
        {
            text: __("Quark add chance"),
            is_pct: true,
            auto_alias: true,
            tags: ["quark"]
        },
        quark_reactor_size: 
        {
            text: __("Quark reactor size"),
            tags: ["quark"]
        },
        quark_reactor_size_multiplier: 
        {
            text: __("Quark reactor size"),
            is_pct: true,
            auto_alias: true,
            tags: ["quark"]
        },
        quark_structurize_multiplier: 
        {
            text: __("Quark structurize multiplier"),
            is_pct: true,
            auto_alias: true,
            tags: ["quark"]
        },
        quarkstige_damage_multiplier: 
        {
            text: __("Quarkstige blower damage multiplier"),
            is_pct: true,
            auto_alias: true,
            tags: ["quark"]
        },
        reduce_upgrade_prices: 
        {
            text: __("Shop Prices"),
            is_pct: true,
            usign: -1
        },
        relics_base_damage_multiplier: 
        {
            text: __("Relics damage multiplier"),
            is_pct: true,
            auto_alias: true
        },
        relics_enemy_drop_chance: 
        {
            text: __("Relics enemy drop chance"),
            is_pct: true
        },
        relics_max_count: 
        {
            text: __("Relics max count")
        },
        resources_auto_collect: 
        {
            text: {},
            collection: "resources",
            text_template: __("Auto collect [name]")
        },
        resources_leaf_add: 
        {
            text: {},
            collection: "resources",
            text_template: __("Additional [name_plural]"),
            text_neutral: __("Additional Leaves"),
            collection_format_exceptions: 
            {
                ancient: 
                {
                    value: 0.01
                }
            }
        },
        resources_leaf_special_upgrades: 
        {
            text: {},
            collection: "resources",
            text_template: __("Additional [name_plural]"),
            text_neutral: __("Additional Leaves")
        },
        resources_multiplier: 
        {
            text: {},
            collection: "resources",
            is_pct: true,
            text_template: __("Additional [name_plural]")
        },
        resources_multiplier_pet: 
        {
            text: {},
            collection: "resources",
            is_pct: true,
            text_template: __("Additional [name_plural]")
        },
        result_auto_collect: 
        {
            text: {},
            collection: "text_autocollect",
            text_template: __("Auto collect [name]")
        },
        scrolls_duration: 
        {
            text: __("Scrolls duration"),
            is_pct: true
        },
        scrolls_active_max: 
        {
            text: __("Max active Scrolls")
        },
        seed_spawn_chance: 
        {
            text: __("Seed spawn chance"),
            is_pct: true
        },
        seed_spawn_chance_leaf: 
        {
            text: {}
        },
        seed_spawn_count: 
        {
            text: __("Seed spawn count")
        },
        seed_value_add: 
        {
            text: {},
            text_template: __("Seed rewards [name]"),
            text_neutral: __("Seed rewards"),
            is_pct: true
        },
        seed_value_add_global: 
        {
            text: __("Seed rewards"),
            is_pct: true
        },
        shadow_crystal_attack_damage: 
        {
            text: __("Shadow Crystal attack damage")
        },
        shadow_crystal_attack_damage_multiplier: 
        {
            text: __("Shadow Crystal attack damage"),
            is_pct: true,
            auto_alias: true
        },
        shadow_crystal_blower_enemy_damage_multiplier_level: 
        {
            text: __("Shadow Crystal Blower Damage"),
            is_pct: true
        },
        shadow_crystal_decrease_resistance: 
        {
            text: __("Shadow Crystal resistance"),
            usign: -1
        },
        shadow_crystal_hp_decrease_multiplier_shadow: 
        {
            text: __("Shadow Crystal HP"),
            is_pct: true,
            auto_alias: true,
            usign: -1
        },
        shadow_crystal_player_hp: 
        {
            text: __("Shadow Player HP")
        },
        shadow_crystal_player_hp_multiplier: 
        {
            text: __("Shadow Player HP"),
            is_pct: true,
            auto_alias: true
        },
        shadow_crystal_player_resistance: 
        {
            text: __("Shadow Player Resistance")
        },
        shadow_crystal_player_rest_hp_value: 
        {
            text: __("Shadow Player Rest HP")
        },
        shadow_crystal_player_rest_hp_value_multiplier: 
        {
            text: __("Shadow Player Rest HP"),
            is_pct: true,
            auto_alias: true
        },
        shadow_crystal_player_rest_stamina_value: 
        {
            text: __("Shadow Player Rest Stamina")
        },
        shadow_crystal_player_speed: 
        {
            text: __("Shadow Player Speed")
        },
        shadow_crystal_player_speed_multiplier: 
        {
            text: __("Shadow Player Speed"),
            is_pct: true,
            auto_alias: true
        },
        shadow_crystal_player_stamina: 
        {
            text: __("Shadow Player Stamina")
        },
        shadow_crystal_player_stamina_multiplier: 
        {
            text: __("Shadow Player Stamina"),
            is_pct: true,
            auto_alias: true
        },
        shadow_crystal_reward: 
        {
            text: __("Shadow Crystal reward")
        },
        shadow_crystal_reward_multiplier: 
        {
            text: __("Shadow Crystal reward"),
            is_pct: true,
            auto_alias: true
        },
        shards_max_count: 
        {
            text: __("Max Shards count")
        },
        shards_max_count_single: 
        {
            text: __("Max Shards count (single)")
        },
        skip_tower_floor_chance: 
        {
            text: __("Skip tower floor chance%"),
            is_pct: true
        },
        skip_tower_floor_chance_multiplier: 
        {
            text: __("Skip tower floor chance multiplier"),
            is_pct: true,
            auto_alias: true
        },
        slap_critical_chance: 
        {
            text: __("Critical slap chance"),
            is_pct: true,
            auto_alias: true
        },
        slap_critical_multiplier: 
        {
            text: __("Critical slap damage"),
            is_pct: true,
            auto_alias: true
        },
        slap_multiplier: 
        {
            text: __("Slap multiplier"),
            is_pct: true,
            auto_alias: true
        },
        soul_crypt_bonus_reward_multiplier: 
        {
            text: __("Soul Crypt Bonus Reward%"),
            is_pct: true,
            auto_alias: true,
            tags: ["soul"]
        },
        soul_crypt_floors: 
        {
            text: __("Soul Crypt Max Floors"),
            tags: ["soul"]
        },
        soul_forge_counter_decrease: 
        {
            text: __("Soul Forge Fill Requirement"),
            usign: -1,
            tags: ["soul"]
        },
        soul_forge_count_multiplier: 
        {
            text: __("Soul Forge Count%"),
            is_pct: true,
            auto_alias: true,
            tags: ["soul"]
        },
        soul_forge_complete_count: 
        {
            text: __("Soul Forge Completion Count"),
            tags: ["soul"]
        },
        soul_forge_complete_count_multiplier: 
        {
            text: __("Soul Forge Completion Count%"),
            is_pct: true,
            auto_alias: true,
            tags: ["soul"]
        },
        soul_keys_crypt_base: 
        {
            text: __("Soul Crypt Keys"),
            tags: ["soul"]
        },
        soul_keys_crypt_multiplier: 
        {
            text: __("Soul Crypt Keys%"),
            is_pct: true,
            tags: ["soul"]
        },
        soul_particles_crypt_multiplier: 
        {
            text: __("Soul Crypt Particles%"),
            is_pct: true,
            tags: ["soul"]
        },
        trade_auto_collect: 
        {
            text: __("Auto-collect trades")
        },
        trade_auto_start: 
        {
            text: __("Auto-start trades")
        },
        trade_base_level: 
        {
            text: 0
        },
        trade_decrease_input_count: 
        {
            text: __("Trade input resources halved")
        },
        trade_duration_decrease_timer: 
        {
            text: __("Trade delivery duration"),
            is_pct: true,
            usign: -1
        },
        trade_gems_max_value: 
        {
            text: __s("Max %s trade value", __("Gems"))
        },
        trade_max_count: 
        {
            text: 0
        },
        trade_max_gems_trades_per_day: 
        {
            text: __s("Max %s trades per day", __("Gems"))
        },
        trade_refresh_decrease_timer: 
        {
            text: __("Trade refresh duration reduction"),
            is_pct: true,
            usign: -1
        },
        trade_resources_multiplier: 
        {
            text: {},
            collection: "resources",
            text_template: __("Trade multiplier [name_plural]"),
            text_neutral: __("Trade multiplier single"),
            is_pct: true
        },
        trade_resources_multiplier_global: 
        {
            text: __("Trade global multiplier"),
            is_pct: true,
            alias: ["trade_resources_multiplier_cards", "trade_resources_multiplier_challenges", "trade_resources_multiplier_dice", "trade_resources_multiplier_fish", "trade_resources_multiplier_harbor", "trade_resources_multiplier_mine", "trade_resources_multiplier_plants", "trade_resources_multiplier_scroll"]
        },
        trees: 
        {
            text: 0
        },
        tower_floor: 
        {
            text: __("More tower floors")
        },
        tower_floor_pct: 
        {
            text: __("More tower floors%"),
            is_pct: true
        },
        unknown: 
        {
            text: 0
        },
        ulc_borbventure_borb_level_reset_count: 
        {
            text: __s("%s keep %s", __("ULC"), __("Borb level")),
            tags: ["ulc"]
        },
        ulc_borbventure_inventory_reset_count: 
        {
            text: __s("%s keep %s", __("ULC"), __("Borbventure items")),
            tags: ["ulc"]
        },
        ulc_cards_reset_count: 
        {
            text: __s("%s keep %s", __("ULC"), __("Cards")),
            tags: ["ulc"]
        },
        ulc_dice_reset_count: 
        {
            text: __s("%s keep %s", __("ULC"), __("Dice")),
            tags: ["ulc"]
        },
        ulc_equipment_reset_count: 
        {
            text: __s("%s keep %s", __("ULC"), __("Equipment")),
            tags: ["ulc"]
        },
        ulc_leafscender_reset_count: 
        {
            text: __s("%s keep %s", __("ULC"), __("Leafscended Leaves")),
            tags: ["ulc"]
        },
        ulc_materials_reset_count: 
        {
            text: __s("%s keep %s", __("ULC"), __("Materials")),
            tags: ["ulc"]
        },
        ulc_mine_items_reset_count: 
        {
            text: __s("%s keep %s", __("ULC"), __("Mine items")),
            tags: ["ulc"]
        },
        ulc_min_sacrifices_decrease_count: 
        {
            text: __s("%s sacrifice count", __("ULC")),
            usign: -1,
            tags: ["ulc"]
        },
        ulc_perma_alchemy: 
        {
            text: __s("Keep %s unlocked after %s", __("Alchemy"), __("ULC")),
            text_only: true,
            tags: ["ulc"]
        },
        ulc_perma_borbventures: 
        {
            text: __s("Keep %s unlocked after %s", __("Borbventures"), __("ULC")),
            text_only: true,
            tags: ["ulc"]
        },
        ulc_perma_cards: 
        {
            text: __s("Keep %s unlocked after %s", __("Cards"), __("ULC")),
            text_only: true,
            tags: ["ulc"]
        },
        ulc_perma_dice: 
        {
            text: __s("Keep %s unlocked after %s", __("Dice"), __("ULC")),
            text_only: true,
            tags: ["ulc"]
        },
        ulc_perma_materials: 
        {
            text: __s("Keep %s unlocked after %s", __("Materials"), __("ULC")),
            text_only: true,
            tags: ["ulc"]
        },
        ulc_perma_mines: 
        {
            text: __s("Keep %s unlocked after %s", __("Mines"), __("ULC")),
            text_only: true,
            tags: ["ulc"]
        },
        ulc_perma_quarks: 
        {
            text: __s("Keep %s unlocked after %s", __("Quarks"), __("ULC")),
            text_only: true,
            tags: ["ulc"]
        },
        ulc_perma_relics: 
        {
            text: __s("Keep %s unlocked after %s", __("Relics"), __("ULC")),
            text_only: true,
            tags: ["ulc"]
        },
        ulc_quarkstiges_reset_count: 
        {
            text: __s("%s keep %s", __("ULC"), __("Quarkstiges")),
            tags: ["ulc"]
        },
        ulc_relics_reset_count: 
        {
            text: __s("%s keep %s", __("ULC"), __("Relics")),
            tags: ["ulc"]
        },
        ulc_value_multiplier: 
        {
            text: __("ULC coins"),
            is_pct: true,
            auto_alias: true,
            tags: ["ulc"]
        },
        upgrade_price: 
        {
            text: 0
        },
        upgrade_section_multiplier: 
        {
            text: {},
            is_pct: true,
            text_template: __("Upgrade multiplier [name]"),
            collection: "upgrade_sections"
        },
        witch_cursed_count: 
        {
            text: __("Witch Curses")
        },
        witch_cursed_count_multiplier: 
        {
            text: __("Witch Curse multiplier"),
            is_pct: true,
            auto_alias: true
        },
        witch_essence_count: 
        {
            text: __("Witch Essences")
        },
        witch_essence_count_multiplier: 
        {
            text: __("Witch Essence multiplier"),
            is_pct: true,
            auto_alias: true
        }
    };
    global.texts_help = 
    {
        alchemy: __("If you can't brew recipes even though you unlocked them, then your material storage is full."),
        bot_control_panel: __("The autobuy resource threshold limits how much resources should be spent for all autobuy bots at once. If this option is set to 50%, the autobuy bots will not purchase any upgrade that costs more than 50% of the relevant resource."),
        crafting: global.is_mobile ? undefined : __("Space: start/stop crafting\nCtrl+LClick: quick salvage\nShift+LClick: move leaf between inventory and backpack\nAlt+LClick: reroll RNG quality\nAlt+RClick: reroll leaf properties\nAlt+MClick: reroll shards\nMouse wheel up/down: select property"),
        
        pets: function()
        {
            return sprintf(__("Unlock and upgrade pet bonuses with the respective materials. Upgraded pets need to be equipped for the bonuses to take effect. Each level improves the pet bonuses by %s. Pet bonuses won't increase after level %s but damage still does, giving a bonus every %s levels."), number_format_percent(global.game_settings.pet_upgrade_multiplier), 10, 10);
        },
        
        shop_blowers: sprintf(__("Unlock and upgrade tool bonuses with the respective materials. Upgraded tools do not need to be equipped for the bonuses to take effect. Another bonus is unlocked after upgrade level %s and some tools provide a special bonus at this level. Tool bonuses won't increase after level %s but damage still does, giving a bonus every %s levels."), 10, 10, 10)
    };
    global.texts_mechanics = 
    {
        alchemy: __("Alchemy"),
        areas: __("Areas"),
        artifacts: __("Artifacts"),
        borbventure: __("Borbventures"),
        cards: __("Cards"),
        chests: __("Chests"),
        converters: __("Converters"),
        crafting: __("Crafting"),
        dice: __("Dice"),
        equipment: __("Equipment"),
        fishing: __("Fishing"),
        materials: __("Materials"),
        mines: __("Mines"),
        mirror: __("Mirrors"),
        pets: __("Pets"),
        printers: __("Printers"),
        relics: __("Relics"),
        scrolls: __("Scrolls"),
        trading: __("Trading"),
        unique_leaves: __("Unique Leaves")
    };
    global.texts_stats = 
    {
        cursed_count: __("Curses"),
        digs: __("Digs"),
        pets_pet: __("Pets pet"),
        prestige: __("Prestiges"),
        prestige_crunch: __("Crunches"),
        prestige_mlc: __("Mega Crunches"),
        time_elapsed: __("Seconds game time")
    };
    global.text_unlock_descriptions = 
    {
        min_tower_floor: __("Unlock Leaf Tower floor %s"),
        unlock_alchemy: __("Unlock Alchemy"),
        unlock_ascension_shards: __("Unlock Ascension Shards"),
        unlock_cards: __("Unlock Cards"),
        unlock_crafting: __("Unlock Crafting"),
        unlock_energy_electrical: __("Unlock Electrical Energy"),
        unlock_equipment: __("Unlock Equipment"),
        unlock_fusion_shards: __("Unlock Fusion Shards"),
        unlock_gem_leaves: __("Unlock Gem Leaves"),
        unlock_harbor: __("Unlock Industrial Harbor"),
        unlock_leafscension: __("Unlock Leafscension"),
        unlock_materials: __("Unlock Materials"),
        unlock_mines: __("Unlock Mines"),
        unlock_pyramid: __("Unlock Pyramid"),
        unlock_relics: __("Unlock Relics"),
        unlock_resource: __("Unlock Resource %s"),
        unlock_shadow_crystal: __("Unlock Shadow Crystal"),
        unlock_shards: __("Unlock Shards"),
        unlock_trading: __("Unlock Trading"),
        unlock_transformation_shards: __("Unlock Transformation Shards")
    };
    global.text_autocollect = 
    {
        equipment_random: 
        {
            name: __("Random equipment")
        }
    };
    global.texts_upgrade_attributes = {};
    var __struct = texts_upgrade_attributes;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        var item = new Upgrade_Text(mitem);
        item.key = mkey;
        item.init();
        variable_struct_set(global.texts_upgrade_attributes, mkey, item);
    }
}

function init_texts_late()
{
    call_struct(global.texts_upgrade_attributes, "init_late");
    var __struct = global.texts_upgrade_attributes;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (!is_undefined(struct_get_from_hash(mitem, variable_get_hash("alias"))))
        {
            var __array2 = mitem.alias;
            var __prop_len2 = array_length(__array2);
            for (var __i2 = 0; __i2 < __prop_len2; __i2++)
            {
                var mitem2 = __array2[__i2];
                variable_struct_set(global.texts_upgrade_attributes, mitem2, new Upgrade_Text(mitem.props_start));
                variable_struct_get(global.texts_upgrade_attributes, mitem2).key = mitem2;
                variable_struct_get(global.texts_upgrade_attributes, mitem2).parent = mitem;
                (variable_struct_get(global.texts_upgrade_attributes, mitem2)).init();
                (variable_struct_get(global.texts_upgrade_attributes, mitem2)).init_late();
            }
        }
        if (!is_undefined(struct_get_from_hash(mitem, variable_get_hash("auto_alias"))))
        {
            var __array2 = global.upgrade_sections_upgrades;
            var __prop_len2 = array_length(__array2);
            for (var __i2 = 0; __i2 < __prop_len2; __i2++)
            {
                var mitem2 = __array2[__i2];
                var key = sprintf("%s_%s", mkey, mitem2);
                variable_struct_set(global.texts_upgrade_attributes, key, new Upgrade_Text(mitem.props_start));
                variable_struct_get(global.texts_upgrade_attributes, key).key = key;
                variable_struct_get(global.texts_upgrade_attributes, key).parent = mitem;
                (variable_struct_get(global.texts_upgrade_attributes, key)).init();
                (variable_struct_get(global.texts_upgrade_attributes, key)).init_late();
            }
        }
        var tags = get_default_struct_value(mitem, "tags", undefined);
        if (is_array(tags))
        {
            var __array2 = tags;
            var __prop_len2 = array_length(__array2);
            for (var __i2 = 0; __i2 < __prop_len2; __i2++)
            {
                var mitem2 = __array2[__i2];
                switch (mitem2)
                {
                    case "blc":
                        variable_struct_get(__struct, mkey).is_visible = [is_unlocked_blc_text];
                        break;
                    case "mlc":
                        variable_struct_get(__struct, mkey).is_visible = [is_unlocked_mlc];
                        break;
                    case "quark":
                        variable_struct_get(__struct, mkey).is_visible = [is_unlocked_quarks];
                        break;
                    case "soul":
                        variable_struct_get(__struct, mkey).is_visible = [is_unlocked_soul_crypt];
                        break;
                    case "ulc":
                        variable_struct_get(__struct, mkey).is_visible = [is_unlocked_ulc];
                        break;
                }
            }
        }
    }
}

function init_titles()
{
    global.titles = 
    {
        leafton: 
        {
            title: __("Leafton") + " ***",
            subtitle: ""
        },
        minigame_candle: 
        {
            title: __("Blow Out The Candles"),
            subtitle: __("Happy Anniversary to us! Blow out the candles and earn anniversary rewards.")
        },
        run_result: 
        {
            title: __("Run result")
        },
        shadow_crystal: 
        {
            title: __("Shadow Crystal") + " ****",
            subtitle: ""
        }
    };
}
