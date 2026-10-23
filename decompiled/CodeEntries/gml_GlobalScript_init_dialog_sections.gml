function init_dialog_sections()
{
    global.dialog_sections = 
    {
        achievements: 
        {
            rank: 
            {
                name: __("Ranks"),
                index: 0,
                start: true
            },
            leaves: 
            {
                name: __("Leaves"),
                index: 1
            },
            general: 
            {
                name: __("General"),
                index: 10
            },
            enemies: 
            {
                name: __("Enemies"),
                index: 20
            },
            printers: 
            {
                name: __("Printers"),
                index: 30
            },
            upgradeables: 
            {
                name: __("Upgradeables"),
                index: 40
            },
            misc: 
            {
                name: __("Misc"),
                index: 1000
            }
        },
        alchemy: 
        {
            general: 
            {
                name: __("General"),
                index: 0
            },
            essences: 
            {
                name: __("Essences"),
                index: 3
            },
            curses: 
            {
                name: __("Curses"),
                index: 10
            },
            relics: 
            {
                name: __("Relics"),
                index: 20,
                
                is_obfuscated: function()
                {
                    return get_upgrade_count(global.shops.sacred.unlock_relics) == 0;
                }
            },
            shards: 
            {
                name: __("Shards"),
                index: 30,
                
                is_obfuscated: function()
                {
                    return !is_unlocked_shards();
                }
            },
            souls: 
            {
                name: __("Souls"),
                index: 40,
                
                is_obfuscated: function()
                {
                    return !is_unlocked_death_book();
                }
            }
        },
        areas: 
        {
            favorites: 
            {
                name: __("Favorites"),
                index: -10
            },
            leaf_galaxy: 
            {
                name: __("Leaf Galaxy"),
                index: 0,
                start: true
            },
            sacred_nebula: 
            {
                name: __("Sacred Nebula"),
                index: 10,
                
                is_obfuscated: function()
                {
                    return global.galaxies.sacred_nebula.is_obfuscated();
                }
            },
            energy_belt: 
            {
                name: __("Energy Belt"),
                index: 20,
                
                is_obfuscated: function()
                {
                    return global.galaxies.energy_belt.is_obfuscated();
                }
            },
            fire_fields: 
            {
                name: __("Fire Fields"),
                index: 30,
                
                is_obfuscated: function()
                {
                    return global.galaxies.fire_fields.is_obfuscated();
                }
            },
            soul_realm: 
            {
                name: __("Soul Realm"),
                index: 40,
                
                is_obfuscated: function()
                {
                    return global.galaxies.soul_realm.is_obfuscated();
                }
            },
            quark_ambit: 
            {
                name: __("Quark Ambit"),
                index: 50,
                
                is_obfuscated: function()
                {
                    return global.galaxies.quark_ambit.is_obfuscated();
                }
            },
            umbral_cluster: 
            {
                name: __("Umbral Cluster"),
                index: 60,
                
                is_obfuscated: function()
                {
                    return global.galaxies.umbral_cluster.is_obfuscated();
                }
            },
            events: 
            {
                name: __("Events"),
                index: 9999
            }
        },
        artifacts: 
        {
            favorites: 
            {
                name: __("Favorites"),
                index: -10
            },
            artifacts: 
            {
                name: __("Artifacts"),
                index: 0,
                start: true
            }
        },
        borbventures: 
        {
            borbventures: 
            {
                name: __("Borbventures"),
                index: 0,
                start: true
            },
            borbs: 
            {
                name: __("Borbs"),
                index: 10
            },
            inventory: 
            {
                name: __("Inventory"),
                index: 20
            },
            shop: 
            {
                name: __("Shop"),
                index: 30
            },
            packs: 
            {
                name: __("Packs"),
                index: 40
            },
            codex: 
            {
                name: __("Codex"),
                index: 50
            },
            settings: 
            {
                name: __("Settings"),
                index: 60
            }
        },
        booster_game: 
        {
            game: 
            {
                name: __("Booster Game"),
                index: 0,
                start: true
            },
            shop: 
            {
                name: __("Shop"),
                index: 10
            },
            stats: 
            {
                name: __("Stats"),
                index: 20
            }
        },
        bot_control_panel: 
        {
            autobuy: 
            {
                name: __("Autobuy"),
                index: 0,
                start: true
            },
            artifacts: 
            {
                name: __("Artifacts"),
                index: 5
            },
            loadouts: 
            {
                name: __("Loadouts"),
                index: 10,
                
                is_obfuscated: function()
                {
                    return false;
                }
            },
            mirrors: 
            {
                name: __("Mirrors"),
                index: 13,
                
                is_obfuscated: function()
                {
                    return global.artifacts.mirror.data.collected == 0;
                }
            },
            navigation: 
            {
                name: __("Navigation"),
                index: 15
            },
            resource_panel: 
            {
                name: __("Resource Panel"),
                index: 20,
                
                is_obfuscated: function()
                {
                    return !can_draw_nav_selection();
                }
            }
        },
        cards: 
        {
            packs: 
            {
                name: __("Packs"),
                index: -100
            },
            transcend: 
            {
                name: __("Transcend"),
                index: -50
            },
            common: 
            {
                name: __("Common"),
                index: 0
            },
            options: 
            {
                name: __("Options"),
                index: 1000
            }
        },
        challenges: 
        {
            general: 
            {
                name: __("General"),
                index: 0
            }
        },
        chests: 
        {
            general: 
            {
                name: __("General"),
                index: 0
            }
        },
        crafting: 
        {
            craft: 
            {
                name: __("Craft"),
                index: 0
            },
            overview: 
            {
                name: __("Overview"),
                index: 10
            },
            transformation: 
            {
                name: __("Transformation"),
                index: 20
            },
            fusion: 
            {
                name: __("Fusion"),
                index: 30
            },
            shadow_forge: 
            {
                name: __("Shadow Forge"),
                index: 35,
                
                is_obfuscated: function()
                {
                    return !is_unlocked_ulc();
                }
            },
            sets: 
            {
                name: __("Sets"),
                index: 40
            },
            presets: 
            {
                name: __("Presets"),
                index: 41
            },
            info: 
            {
                name: __("Info"),
                index: 50
            }
        },
        daily_rewards: 
        {
            reward: 
            {
                name: __("Reward"),
                index: 0,
                start: true
            },
            daily_quests: 
            {
                name: __("Daily quests"),
                index: 10
            }
        },
        dice: 
        {
            dice: 
            {
                name: __("Dice Bag"),
                index: 0,
                start: true
            },
            battlefield: 
            {
                name: __("Battlefield"),
                index: 10
            },
            cursed: 
            {
                name: __("Cursed Dice"),
                index: 20
            },
            shop: 
            {
                name: __("Shop"),
                index: 30
            },
            dice_codex: 
            {
                name: __("Codex"),
                index: 40
            },
            enemies: 
            {
                name: __("Enemies"),
                index: 50
            },
            options: 
            {
                name: __("Options"),
                index: 1000
            }
        },
        event: 
        {
            general: 
            {
                name: __("General"),
                index: -10
            },
            anniversary_journey: 
            {
                name: __("Anniversary Journey"),
                index: 31,
                
                is_obfuscated: function()
                {
                    return !is_event_active(global.events.anniversary);
                }
            }
        },
        fishing: 
        {
            pond: 
            {
                name: __("Pond"),
                index: 0,
                start: true
            },
            rods: 
            {
                name: __("Rods"),
                index: 10
            },
            fish: 
            {
                name: __("Fish"),
                index: 20
            },
            baits: 
            {
                name: __("Baits"),
                index: 25,
                
                is_obfuscated: function()
                {
                    return !has_bought_shop_item_safe(global.shops.fish.unlock_baits);
                }
            },
            bait_farm: 
            {
                name: __("Bait Farm"),
                index: 26,
                
                is_obfuscated: function()
                {
                    return !has_bought_shop_item_safe(global.shops.fish.bait_farm);
                }
            },
            shop: 
            {
                name: __("Shop"),
                index: 30
            },
            journey: 
            {
                name: __("Journey"),
                index: 40
            },
            tournaments: 
            {
                name: __("Tournaments"),
                index: 60,
                
                is_obfuscated: function()
                {
                    return !has_bought_shop_item_safe(global.shops.fish.unlock_fishing_tournaments);
                }
            },
            tourney_rod: 
            {
                name: __("Tourney Rod"),
                index: 61,
                
                is_obfuscated: function()
                {
                    return !has_bought_shop_item_safe(global.shops.fish.unlock_fishing_tournaments);
                }
            },
            transmuters: 
            {
                name: __("Transmuters"),
                index: 70
            }
        },
        general: 
        {
            general: 
            {
                name: __("General"),
                index: 0
            }
        },
        guilds_members: 
        {
            general: 
            {
                name: __("Members"),
                index: 0
            },
            requests: 
            {
                name: __("Requests"),
                index: 10
            }
        },
        harbor: 
        {
            overview: 
            {
                name: __("Overview"),
                index: 0,
                start: true
            },
            shop: 
            {
                name: __("Shop"),
                index: 20
            },
            ships: 
            {
                name: __("Ships"),
                index: 30,
                
                is_obfuscated: function()
                {
                    return !is_unlocked_harbor_ships();
                }
            },
            inventory: 
            {
                name: __("Inventory"),
                index: 40,
                
                is_obfuscated: function()
                {
                    return !is_unlocked_harbor_ships();
                }
            },
            journey: 
            {
                name: __("Journey"),
                index: 50,
                
                is_obfuscated: function()
                {
                    return !is_unlocked_harbor_ships();
                }
            },
            codex: 
            {
                name: __("Codex"),
                index: 60,
                
                is_obfuscated: function()
                {
                    return !is_unlocked_harbor_ships();
                }
            }
        },
        leafscension: 
        {
            level_1: 
            {
                name: __("Level 1"),
                index: 0
            },
            settings: 
            {
                name: __("Settings"),
                index: 999
            }
        },
        milestones: 
        {
            tower: 
            {
                name: __("Tower"),
                index: 0
            },
            events: 
            {
                name: __("Events"),
                index: 100
            }
        },
        mines: 
        {
            coal_vein: 
            {
                name: __("Coal Vein"),
                index: 0,
                start: true
            },
            mines: 
            {
                name: __("Mines"),
                index: 10
            },
            inventory: 
            {
                name: __("Inventory"),
                index: 20
            },
            drill: 
            {
                name: __("Drill"),
                index: 30,
                
                is_obfuscated: function()
                {
                    return !has_bought_shop_item_safe(global.shops.mines.unlock_depth_drill);
                }
            },
            shop: 
            {
                name: __("Shop"),
                index: 40
            },
            transmute: 
            {
                name: __("Transmute"),
                index: 50
            },
            codex: 
            {
                name: __("Codex"),
                index: 60
            }
        },
        options: 
        {
            general: 
            {
                name: __("General"),
                index: 0
            },
            gameplay: 
            {
                name: __("Gameplay"),
                index: 10
            },
            graphics: 
            {
                name: __("Graphics"),
                index: 20
            },
            sound: 
            {
                name: __("Sound"),
                index: 30
            },
            hotkeys: 
            {
                name: __("Hotkeys"),
                index: 40,
                is_visible: !global.is_mobile
            },
            misc: 
            {
                name: __("Misc"),
                index: 50
            },
            userlog: 
            {
                name: __("Log"),
                index: 60
            }
        },
        pets: 
        {
            pets: 
            {
                name: __("Pets"),
                index: 0
            },
            teams: 
            {
                name: __("Teams"),
                index: 10
            }
        },
        quarks: 
        {
            quarks: 
            {
                name: __("Quarks"),
                index: 0,
                start: true
            },
            shop: 
            {
                name: __("Shop"),
                index: 10
            },
            structure: 
            {
                name: __("Structure"),
                index: 20,
                
                is_obfuscated: function()
                {
                    return !is_unlocked_quarks_structure();
                }
            },
            structure_shop: 
            {
                name: __("Structure Shop"),
                index: 21,
                
                is_obfuscated: function()
                {
                    return !is_unlocked_quarks_structure();
                }
            },
            leafton: 
            {
                name: __("Leafton"),
                index: 30,
                
                is_obfuscated: function()
                {
                    return !is_unlocked_leafton();
                }
            },
            leafton_shop: 
            {
                name: __("Leafton Shop"),
                index: 31,
                
                is_obfuscated: function()
                {
                    return !is_unlocked_leafton();
                }
            }
        },
        relics: 
        {
            common: 
            {
                name: __("Common"),
                index: 0
            },
            master: 
            {
                name: __("Master"),
                index: 1000,
                
                is_obfuscated: function()
                {
                    return !is_unlocked_mirror_fragments();
                }
            }
        },
        season_pass: 
        {
            general: 
            {
                name: __("Season Pass"),
                index: 0,
                start: true
            },
            quests: 
            {
                name: __("Quests"),
                index: 20
            }
        },
        seasons: 
        {
            seasons: 
            {
                name: __("Seasons"),
                index: 0,
                start: true
            },
            previous_seasons: 
            {
                name: __("Previous Seasons"),
                index: 10
            }
        },
        blc_shop: 
        {
            general: 
            {
                name: __("General"),
                index: 0
            },
            autoupgrade_bots: 
            {
                name: __("Autoupgrade Bots"),
                index: 10
            }
        },
        gem_leaves_shop: 
        {
            amber: 
            {
                name: __("Amber"),
                index: 0
            },
            amethyst: 
            {
                name: __("Amethyst"),
                index: 10
            },
            emerald: 
            {
                name: __("Emerald"),
                index: 20
            },
            kyanite: 
            {
                name: __("Kyanite"),
                index: 30
            },
            rhodonite: 
            {
                name: __("Rhodonite"),
                index: 40
            },
            ruby: 
            {
                name: __("Ruby"),
                index: 50
            },
            tektite: 
            {
                name: __("Tektite"),
                index: 60
            }
        },
        shadow_crystal: 
        {
            shadow_crystal: 
            {
                name: __("Shadow Crystal"),
                index: 0
            },
            shadow_tree: 
            {
                name: __("Shadow Tree"),
                index: 20
            },
            shadow_pit: 
            {
                name: __("Shadow Pit"),
                index: 25
            },
            transmute: 
            {
                name: __("Transmute"),
                index: 30
            }
        },
        shop_blowers: 
        {
            favorites: 
            {
                name: __("Favorites"),
                index: -10
            },
            blowers: 
            {
                name: __("Blowers"),
                index: 0,
                start: true
            },
            shovels: 
            {
                name: __("Shovels"),
                index: 10
            },
            swords: 
            {
                name: __("Swords"),
                index: 15
            },
            trouts: 
            {
                name: __("Trouts"),
                index: 20
            }
        },
        shop_gems: 
        {
            general: 
            {
                name: __("General"),
                index: 0
            },
            pets: 
            {
                name: __("Pets"),
                index: 10,
                
                is_obfuscated: function()
                {
                    return !is_unlocked_pets();
                }
            },
            borbventure: 
            {
                name: __("Borbventure"),
                index: 30,
                
                is_obfuscated: function()
                {
                    return !is_unlocked_borbventure();
                }
            },
            dice: 
            {
                name: __("Dice"),
                index: 35,
                
                is_obfuscated: function()
                {
                    return !is_unlocked_dice();
                }
            },
            mines: 
            {
                name: __("Mines"),
                index: 40,
                
                is_obfuscated: function()
                {
                    return !is_unlocked_mines();
                }
            },
            offline: 
            {
                name: __("Offline"),
                index: 50,
                
                is_visible: function()
                {
                    return global.game_settings.offline_rewards_enabled;
                }
            },
            time_travel: 
            {
                name: __("Time Travel"),
                index: 100,
                
                is_visible: function()
                {
                    return global.game_settings.time_travel_enabled;
                }
            },
            supporter: 
            {
                name: __("Supporter Perks"),
                index: 200,
                description: __s("These upgrades are available for supporters only. Supporter Perks are divided into different tiers: %s", "T1 = All packs (except Premium/Gems), T2 = Premium Pack")
            }
        },
        shop_science: 
        {
            red: 
            {
                name: __("Red Science"),
                index: 0,
                start: true
            },
            green: 
            {
                name: __("Green Science"),
                index: 10
            },
            blue: 
            {
                name: __("Blue Science"),
                index: 20
            },
            magenta: 
            {
                name: __("Magenta Science"),
                index: 30
            },
            orange: 
            {
                name: __("Orange Science"),
                index: 40
            },
            black: 
            {
                name: __("Black Science"),
                index: 50
            },
            strange: 
            {
                name: __("Strange Science"),
                index: 60
            }
        },
        shop_skins: 
        {
            blower: 
            {
                name: __("Player"),
                index: 0
            },
            autoblower: 
            {
                name: __("ALB"),
                index: 10
            },
            cursor: 
            {
                name: __("Cursors"),
                index: 20
            },
            pets: 
            {
                name: __("Pets"),
                index: 30
            }
        },
        stats: 
        {
            general: 
            {
                name: __("General"),
                index: 0
            },
            resources: 
            {
                name: __("Resources"),
                index: 5
            },
            enemies: 
            {
                name: __("Enemies"),
                index: 10
            },
            damage: 
            {
                name: __("Damage"),
                index: 20,
                is_visible: global.debug
            },
            damage_types: 
            {
                name: __("Damage Types"),
                index: 21,
                
                is_obfuscated: function()
                {
                    return !area_bought(global.areas.spark_bubble);
                }
            }
        }
    };
    init_dialog_sections_late();
}

function init_dialog_sections_late()
{
    global.dialog_sections_selected = {};
    var __struct = global.dialog_sections;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        var __struct2 = mitem;
        var __prop_names2 = struct_get_names(__struct2);
        var __prop_len2 = array_length(__prop_names2);
        for (var __i2 = 0; __i2 < __prop_len2; __i2++)
        {
            var mkey2 = __prop_names2[__i2];
            var mitem2 = variable_struct_get(__struct2, mkey2);
            mitem2.key = mkey2;
            mitem2.selected = false;
            if (__i == 0)
            {
                variable_struct_set(global.dialog_sections_selected, mkey, mkey2);
            }
        }
    }
    global.dialog_sections_array = {};
    __struct = global.dialog_sections;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (is_undefined(variable_struct_get(global.dialog_sections_array, mkey)))
        {
            variable_struct_set(global.dialog_sections_array, mkey, []);
        }
        var __struct2 = mitem;
        var __prop_names2 = struct_get_names(__struct2);
        var __prop_len2 = array_length(__prop_names2);
        for (var __i2 = 0; __i2 < __prop_len2; __i2++)
        {
            var mkey2 = __prop_names2[__i2];
            var mitem2 = variable_struct_get(__struct2, mkey2);
            variable_struct_get(__struct2, mkey2).index = get_default_value(struct_get_from_hash(mitem2, variable_get_hash("index")), 0);
            variable_struct_get(__struct2, mkey2).value = mkey2;
            array_push(variable_struct_get(global.dialog_sections_array, mkey), mitem2);
        }
        sort_array_by_index(variable_struct_get(global.dialog_sections_array, mkey), true);
        var __array2 = variable_struct_get(global.dialog_sections_array, mkey);
        __prop_len2 = array_length(__array2);
        for (var __i2 = 0; __i2 < __prop_len2; __i2++)
        {
            var mitem2 = __array2[__i2];
            mitem2.position = __i2;
        }
    }
}
