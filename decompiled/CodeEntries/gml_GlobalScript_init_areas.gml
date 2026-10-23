function init_areas()
{
    global.areas = 
    {
        garden: new Area(
        {
            index: 100,
            name: __("Home Garden"),
            description: __("This is your home garden. Your partner likes to have the garden CLEAN OF LEAVES AT ALL TIMES."),
            resources: [global.resources.leaves, global.resources.gold],
            galaxy: global.galaxies.leaf_galaxy,
            section: global.dialog_sections.areas.leaf_galaxy,
            bgcolor: 5609803,
            bgsprite: spr_grass_07,
            data: 
            {
                count: 1
            },
            unlocked_start: true
        }),
        neighbors_garden: new Area(
        {
            index: 101,
            name: __("Neighbors' Garden"),
            description: __("This is your neighbors' garden. They wonder why there are so many leaves around recently..."),
            resources: [global.resources.leaves, global.resources.gold, global.resources.platinum],
            galaxy: global.galaxies.leaf_galaxy,
            section: global.dialog_sections.areas.leaf_galaxy,
            bgcolor: 4951873,
            bgsprite: spr_bg_neighbor,
            enemy: [global.enemies.bee, global.enemies.bird, global.enemies.bug, global.enemies.frog],
            data: 
            {
                count: 1
            },
            unlocked_start: true
        }),
        mountain: new Area(
        {
            index: 102,
            name: __("Mountain"),
            description: __("Everyone at the mountain is annoyed by leaves. GET RID OF THEM."),
            resources: [global.resources.leaves, global.resources.gold, global.resources.platinum, global.resources.bismuth],
            galaxy: global.galaxies.leaf_galaxy,
            section: global.dialog_sections.areas.leaf_galaxy,
            bgcolor: 5789784,
            bgsprite_stretch: spr_bg_mountain,
            cost: 
            {
                coins: 10
            },
            enemy: [global.enemies.bat, global.enemies.elk, global.enemies.hare, global.enemies.hyena, global.enemies.snowman],
            generatable_in_quests: true
        }),
        space: new Area(
        {
            index: 103,
            name: __("Space"),
            description: __("No one knows how this works, but leaves can apparently spawn in space."),
            resources: [global.resources.leaves, global.resources.gold, global.resources.platinum, global.resources.bismuth, global.resources.cosmic],
            galaxy: global.galaxies.leaf_galaxy,
            section: global.dialog_sections.areas.leaf_galaxy,
            bgcolor: 723723,
            bgsprite_stretch: spr_bg_space,
            cost: 
            {
                coins: 500
            },
            enemy: [global.enemies.crab, global.enemies.vulture],
            generatable_in_quests: true
        }),
        void: new Area(
        {
            index: 104,
            name: __("THE VOID"),
            description: __("Rare leaves spawn in THE VOID."),
            resources: [global.resources.leaves, global.resources.gold, global.resources.platinum, global.resources.bismuth, global.resources.cosmic, global.resources.void],
            galaxy: global.galaxies.leaf_galaxy,
            section: global.dialog_sections.areas.leaf_galaxy,
            bgcolor: 3350064,
            bgsprite_stretch: spr_bg_void,
            cost: 
            {
                coins: 2500
            },
            enemy: [global.enemies.skull],
            data: 
            {
                auto_teleport: true
            },
            generatable_in_quests: true
        }),
        abyss: new Area(
        {
            index: 105,
            name: __("The Abyss"),
            description: __("Some leaf blowers were never seen again after descending into The Abyss."),
            resources: [global.resources.leaves, global.resources.exotic],
            galaxy: global.galaxies.leaf_galaxy,
            section: global.dialog_sections.areas.leaf_galaxy,
            bgcolor: 3350064,
            bgsprite: spr_bg_abyss,
            cost: 
            {
                flask_strange: 25000
            },
            enemy: [global.enemies.skull],
            generatable_in_quests: true
        }),
        celestial_plane: new Area(
        {
            index: 106,
            name: __("The Celestial Plane"),
            description: __("Ascend to The Celestial Plane to acquire Celestial Leaves."),
            resources: [global.resources.leaves, global.resources.celestial],
            galaxy: global.galaxies.leaf_galaxy,
            section: global.dialog_sections.areas.leaf_galaxy,
            bgcolor: 8288858,
            bgsprite: -1,
            bgsprite_stretch: spr_bg_celestial,
            cost: 
            {
                blc: 1000000
            },
            level: 50,
            enemy: [global.enemies.angry_leaf],
            generatable_in_quests: true
        }),
        mythical_garden: new Area(
        {
            index: 107,
            name: __("The Mythical Garden"),
            description: __("A wise person once stepped into the Mythical Garden but they were never the same..."),
            resources: [global.resources.leaves, global.resources.exotic, global.resources.mythical],
            galaxy: global.galaxies.leaf_galaxy,
            section: global.dialog_sections.areas.leaf_galaxy,
            bgcolor: 5928244,
            bgsprite: spr_bg_mythical,
            cost: 
            {
                blc: 50000000
            },
            level: 200,
            enemy: [global.enemies.carrot],
            generatable_in_quests: true
        }),
        volcano: new Area(
        {
            index: 108,
            name: __("The Volcano"),
            description: __("It's kind of hot in here."),
            resources: [global.resources.leaves, global.resources.gold, global.resources.exotic, global.resources.lava],
            galaxy: global.galaxies.leaf_galaxy,
            section: global.dialog_sections.areas.leaf_galaxy,
            bgcolor: 2105421,
            bgsprite: spr_bg_volcano,
            cost: 
            {
                blc: 500000000
            },
            level: 300,
            hp_drain: 3,
            enemy: [global.enemies.alb],
            generatable_in_quests: true
        }),
        antarctica: new Area(
        {
            index: 109,
            name: __("The Abandoned Research Station"),
            description: __("This is an abandoned research station in Antarctica. Make sure to bring some hot beverages with you!"),
            resources: [global.resources.leaves, global.resources.gold, global.resources.exotic, global.resources.ice],
            galaxy: global.galaxies.leaf_galaxy,
            section: global.dialog_sections.areas.leaf_galaxy,
            bgcolor: 10204340,
            bgsprite: spr_bg_ice,
            cost: 
            {
                blc: 1000000000
            },
            level: 500,
            enemy: [global.enemies.ice_leaf],
            generatable_in_quests: true
        }),
        hidden_sea: new Area(
        {
            index: 1010,
            name: __("The Hidden Sea"),
            description: __("A vast sea that has been hidden for eons."),
            description_locked: __("Find a specific Artifact to lift the seal. You will also need to have access to The Abandoned Research Station before going here."),
            resources: [global.resources.leaves, global.resources.exotic, global.resources.lava, global.resources.ice, global.resources.obsidian],
            galaxy: global.galaxies.leaf_galaxy,
            section: global.dialog_sections.areas.leaf_galaxy,
            bgcolor: 10178640,
            bgsprite: -1,
            bgsprite_stretch: spr_bg_sea,
            is_buyable: false,
            level: 2500,
            hp_drain: 50,
            
            check: function()
            {
                return get_upgrade_count(global.artifacts.water_seal) > 0 && get_upgrade_count(global.areas.antarctica) > 0;
            },
            
            can_teleport: function()
            {
                return self.check();
            }
        }),
        harbor: new Area(
        {
            index: 1100,
            name: __("Leafsink Harbor"),
            description: __("Located in the northern hemisphere, Leafsink Harbor is home to many wealthy leaf blowers due to its valuable resources."),
            resources: [global.resources.leaves, global.resources.exotic, global.resources.ice, global.resources.silicon, global.resources.benitoite],
            galaxy: global.galaxies.leaf_galaxy,
            section: global.dialog_sections.areas.leaf_galaxy,
            bgcolor: 7874600,
            bgsprite: -1,
            bgsprite_stretch: spr_bg_harbor,
            cost: 
            {
                blc: 15000000000
            },
            level: 3000,
            generatable_in_quests: true
        }),
        tower: new Area(
        {
            index: 1200,
            name: __("The Leaf Tower"),
            description: __("Ascend The Leaf Tower as there is someone waiting for you at its peak... Enemy rewards are applied at a reduced rate."),
            resources: [global.resources.leaves, global.resources.exotic, global.resources.lava, global.resources.ice, global.resources.obsidian, global.resources.silicon, global.resources.benitoite],
            galaxy: global.galaxies.leaf_galaxy,
            section: global.dialog_sections.areas.leaf_galaxy,
            type: global.area_types.tower,
            bgcolor: 2631720,
            bgsprite_stretch: spr_bg_tower,
            cost: 
            {
                blc: 100000000000
            },
            level: 5000,
            
            buy_after: function()
            {
                global.resources.silver_token.data.unlocked = true;
                global.resources.gold_token.data.unlocked = true;
            },
            
            generatable_in_quests: true
        }),
        moon: new Area(
        {
            index: 1300,
            name: __("The Moon"),
            description: __("Dust, dust, more dust, and... Leaves? ON THE MOON? [Reach Tower floor 120 to teleport here]"),
            description_locked: __("You have to climb up at least 120 floors to be able to reach this area."),
            resources: [global.resources.leaves, global.resources.exotic, global.resources.moonstone],
            galaxy: global.galaxies.leaf_galaxy,
            section: global.dialog_sections.areas.leaf_galaxy,
            bgcolor: 1973790,
            bgsprite: -1,
            bgsprite_stretch: spr_bg_moon,
            cost: 
            {
                blc: 50000000000
            },
            level: 4000,
            
            check: function()
            {
                return get_upgrade_count(global.areas.tower) > 0 && global.areas.tower.get_highest_floor_current_run() >= 120;
            },
            
            can_teleport: function()
            {
                return global.areas.moon.check();
            },
            
            is_buyable: function()
            {
                return global.areas.moon.check();
            },
            
            generatable_in_quests: true
        }),
        desert: new Area(
        {
            index: 1400,
            name: __("The Infernal Desert"),
            description: __("Sand, sand, more sand, scorpions, cacti, pure heat... What a lovely place!"),
            resources: [global.resources.leaves, global.resources.exotic, global.resources.sand],
            galaxy: global.galaxies.leaf_galaxy,
            section: global.dialog_sections.areas.leaf_galaxy,
            bgcolor: 1973790,
            bgsprite: -1,
            bgsprite_stretch: spr_bg_desert,
            cost: 
            {
                mlc: 1000
            },
            hp_drain: 20000,
            level: 16000,
            enemy: [global.enemies.scorpion],
            generatable_in_quests: true
        }),
        pyramid: new Area(
        {
            index: 1500,
            name: __("The Cursed Pyramid"),
            description: __("This place seems to be cursed."),
            resources: [],
            galaxy: global.galaxies.leaf_galaxy,
            section: global.dialog_sections.areas.leaf_galaxy,
            type: global.area_types.idle,
            bgcolor: 1973790,
            bgsprite: -1,
            bgsprite_stretch: spr_bg_pyramid,
            cost: 
            {
                mlc: 50000
            },
            npc: [
            {
                obj: o_npc_pyramid_dungeon,
                _x: room_width / 2,
                _y: room_height / 2,
                text: __("Pyramid Entrance")
            }]
        }),
        inner_pyramid: new Area(
        {
            index: 1600,
            name: __("The Inner Cursed Pyramid"),
            
            description: function()
            {
                return __s("Lowest floor: %s", global.areas.inner_pyramid.get_highest_floor_current_run());
            },
            
            resources: [global.resources.leaves, global.resources.gold, global.resources.platinum, global.resources.exotic, global.resources.lava, global.resources.sand],
            galaxy: global.galaxies.leaf_galaxy,
            section: global.dialog_sections.areas.leaf_galaxy,
            type: global.area_types.dungeon,
            bgcolor: 1973790,
            bgsprite: spr_bg_inner_pyramid_tiles,
            
            can_teleport: function()
            {
                return get_upgrade_count(global.areas.inner_pyramid) > 0;
            },
            
            check: function()
            {
                return get_upgrade_count(global.areas.inner_pyramid) > 0;
            },
            
            is_buyable: false,
            
            is_obfuscated: function()
            {
                return get_upgrade_count(global.areas.pyramid) == 0;
            },
            
            level: 100000000,
            enemy: [global.enemies.bat, global.enemies.bug, global.enemies.hyena, global.enemies.scorpion]
        }),
        kokkaupunki: new Area(
        {
            index: 11000,
            name: __("Kokkaupunki"),
            description: __("A small historical town built on top of a hill with a pleasant atmosphere. The residents love to exchange materials."),
            type: global.area_types.idle,
            resources: [],
            galaxy: global.galaxies.leaf_galaxy,
            section: global.dialog_sections.areas.leaf_galaxy,
            bgcolor: 1973790,
            bgsprite_stretch: spr_bg_kokkaupunki,
            cost: {},
            cost_materials: 
            {
                essence_earth: 2,
                essence_water: 2
            },
            npc: [
            {
                obj: o_npc_quests_kokka_w,
                _x: 200,
                _y: 350,
                text: __("Wayland"),
                angle: random(360)
            }, 
            {
                obj: o_npc_quests_kokka_i,
                _x: 350,
                _y: 420,
                text: __("Inga"),
                angle: random(360)
            }, 
            {
                obj: o_npc_quests_kokka_t,
                _x: 500,
                _y: 360,
                text: __("Torvald"),
                angle: random(360)
            }, 
            {
                obj: o_npc_quests_kokka_c,
                _x: 650,
                _y: 370,
                text: __("Cuvje"),
                angle: random(360)
            }, 
            {
                obj: o_npc_quests_kokka_h,
                _x: 800,
                _y: 330,
                text: __("Heikki"),
                angle: random(360),
                
                rotating: function()
                {
                    return global.enemies.boss_witch.get_current_defeat_counter() == 0;
                }
            }],
            
            check: function()
            {
                return global.areas.kokkaupunki.data.count > 0;
            },
            
            generatable_in_quests: true,
            
            is_buyable: function()
            {
                return global.areas.pyramid.check();
            }
        }),
        kokkaupunki_cursed: new Area(
        {
            index: 11001,
            name: __("Cursed Kokkaupunki"),
            description: __("The lovely town of Kokkaupunki has been cursed. The curse must be lifted..."),
            resources: [global.resources.leaves, global.resources.void, global.resources.exotic, global.resources.lava, global.resources.ice, global.resources.silicon, global.resources.moonstone, global.resources.sand],
            galaxy: global.galaxies.leaf_galaxy,
            section: global.dialog_sections.areas.leaf_galaxy,
            type: global.area_types.boss,
            bgcolor: 1973790,
            bgsprite_stretch: spr_bg_kokkaupunki_c,
            cost: {},
            cost_materials: 
            {
                essence_cosmic: 200,
                essence_leaf: 200
            },
            level: 1000000000000000000000000000,
            enemy: [global.enemies.boss_witch],
            
            check: function()
            {
                return global.areas.kokkaupunki.data.count > 0;
            },
            
            generatable_in_quests: true,
            
            is_buyable: function()
            {
                return global.areas.pyramid.check();
            }
        }),
        dark_glade: new Area(
        {
            index: 12000,
            name: __("The Dark Glade"),
            description: __("A small, dark place in an eternal forest with a mysterious red glade. All spawnable materials can be found here but their spawn chances are decreased."),
            description_locked: __("A small, dark place in an eternal forest with a mysterious red glade."),
            resources: [],
            galaxy: global.galaxies.leaf_galaxy,
            section: global.dialog_sections.areas.leaf_galaxy,
            type: global.area_types.idle,
            bgcolor: 1973790,
            bgsprite: -1,
            bgsprite_stretch: spr_bg_dark_glade,
            cost: {},
            cost_materials: 
            {
                essence_cosmic: 10,
                essence_leaf: 10
            },
            
            check: function()
            {
                return is_unlocked_materials();
            },
            
            can_teleport: function()
            {
                return global.areas.dark_glade.check() && get_upgrade_count(global.areas.dark_glade) > 0;
            },
            
            is_buyable: function()
            {
                return global.areas.dark_glade.check();
            },
            
            generatable_in_quests: true
        }),
        black_leaf_hole: new Area(
        {
            index: 13000,
            name: __("Black Leaf Hole"),
            description: sprintf(__("A black sphere where leaves travel as fast as light near its event horizon. Sounds scary. [Reach Pyramid floor %s to teleport here]"), -100),
            description_locked: sprintf(__("[Reach Pyramid floor %s to teleport here]"), -100),
            resources: [],
            galaxy: global.galaxies.leaf_galaxy,
            section: global.dialog_sections.areas.leaf_galaxy,
            type: global.area_types.idle,
            bgcolor: 0,
            bgsprite_stretch: spr_bg_black_leaf_hole,
            is_buyable: false,
            level: 5000,
            
            check: function()
            {
                return global.areas.inner_pyramid.get_highest_floor_current_run() >= 100 && global.areas.tower.check();
            },
            
            npc: [
            {
                obj: o_npc_black_hole,
                _x: 540,
                _y: 255,
                text: __("Black Leaf Hole"),
                angle: 0
            }]
        }),
        dicey_meadows: new Area(
        {
            index: 13001,
            name: __("Dicey Meadows"),
            description: __("Nature's randomness reigns supreme, and every step might just lead you to a fresh roll of luck."),
            description_locked: __("A mystical forest playground where rolling takes on a new meaning."),
            resources: [global.resources.dice],
            resources_unlock: [global.resources.dice],
            galaxy: global.galaxies.leaf_galaxy,
            section: global.dialog_sections.areas.leaf_galaxy,
            type: global.area_types.idle,
            bgcolor: 1973790,
            bgsprite: -1,
            bgsprite_stretch: spr_bg_dicey_meadows,
            
            buy_after: function()
            {
                refresh_ua_section("dice");
            },
            
            cost: {},
            cost_materials: 
            {
                essence_dark: 5,
                essence_light: 5
            },
            
            check: function()
            {
                return is_unlocked_materials() || (global.upgrade_attributes.ulc_perma_dice > 0 && get_upgrade_count(global.areas.dicey_meadows) > 0);
            },
            
            can_teleport: function()
            {
                return global.areas.dicey_meadows.check() && get_upgrade_count(global.areas.dark_glade) > 0;
            },
            
            is_buyable: function()
            {
                return global.areas.dicey_meadows.check();
            },
            
            npc: [
            {
                obj: o_npc_dicey_meadows,
                _x: room_width / 2,
                _y: room_height / 2,
                text: __("Dicey Dice")
            }],
            generatable_in_quests: false
        }),
        glinting_thicket: new Area(
        {
            index: 13002,
            name: __("Glinting Thicket"),
            description: __("Nestled deep within the glinting forest, this place is the jackpot of foliage fanciness."),
            description_locked: __("Leaves aren't just green – they're Azurite blue and Niobium vibrant!"),
            resources: [global.resources.leaves, global.resources.azurite, global.resources.niobium],
            galaxy: global.galaxies.leaf_galaxy,
            section: global.dialog_sections.areas.leaf_galaxy,
            bgcolor: 1973790,
            bgsprite: -1,
            bgsprite_stretch: spr_bg_glinting_thicket,
            cost: 
            {
                dice: 1000
            },
            
            check: function()
            {
                return is_unlocked_dice();
            },
            
            can_teleport: function()
            {
                return global.areas.glinting_thicket.check();
            },
            
            is_buyable: function()
            {
                return global.areas.glinting_thicket.check();
            },
            
            generatable_in_quests: false
        }),
        fish_pond: new Area(
        {
            index: 13100,
            name: __("Fish Pond"),
            description: __("A peaceful pond perfect for fishing."),
            description_locked: __("A pond where patience is required."),
            galaxy: global.galaxies.leaf_galaxy,
            resources: [],
            section: global.dialog_sections.areas.leaf_galaxy,
            type: global.area_types.idle,
            bgcolor: 1973790,
            bgsprite: -1,
            bgsprite_stretch: spr_bg_fish_pond,
            
            buy_after: function()
            {
                refresh_ua_section("fish");
            },
            
            cost: {},
            cost_materials: 
            {
                essence_iridescent: 100
            },
            
            check: function()
            {
                return is_unlocked_fishing();
            },
            
            is_buyable: true,
            npc: [
            {
                obj: o_npc_fish,
                _x: room_width / 2,
                _y: room_height / 2,
                text: __("Fish Pond"),
                xscale: 3,
                yscale: 3
            }],
            generatable_in_quests: false
        }),
        industrial_harbor: new Area(
        {
            index: 13200,
            name: __("Industrial Harbor"),
            description: __s("The world's only port where shipping containers are full of %s and somehow come back as %s. Don't ask the customs office how that works.", global.resources.water.name_plural, global.resources.water_crystal.name_plural),
            description_locked: global.text_unlock_descriptions.unlock_harbor,
            resources: [global.resources.water],
            section: global.dialog_sections.areas.leaf_galaxy,
            bgcolor: 5609803,
            bgsprite_stretch: spr_bg_industrial_harbor,
            data: 
            {
                count: 1
            },
            trees: false,
            type: global.area_types.closed,
            
            can_spawn_albs: function()
            {
                return global.shops.harbor.harbor_albs.data.count > 0;
            },
            
            can_use_artifacts: false,
            
            check: function()
            {
                return is_unlocked_harbor();
            },
            
            is_buyable: false,
            show_leaves_visibility_text: true,
            
            enter: function()
            {
                if (!instance_exists(o_blower))
                {
                    exit;
                }
                o_blower.fixed_damage = 35;
                o_blower.use_fixed_damage = true;
            },
            
            npc: [
            {
                obj: o_harbor,
                _x: -999,
                _y: -999
            }]
        }),
        biotite_forest: new Area(
        {
            index: 20000,
            name: __("Biotite Forest"),
            description: __("A calm place where diverse leaves spawn."),
            resources: [global.resources.leaves, global.resources.exotic, global.resources.biotite, global.resources.malachite],
            galaxy: global.galaxies.sacred_nebula,
            section: global.dialog_sections.areas.sacred_nebula,
            bgsprite_stretch: spr_bg_biotite_forest,
            
            check: function()
            {
                return get_default_struct_value(o_game.data.flags, "black_leaf_hole", false) && global.areas.black_leaf_hole.check();
            },
            
            can_teleport: function()
            {
                return global.areas.biotite_forest.check();
            },
            
            is_buyable: false
        }),
        exalted_bridge: new Area(
        {
            index: 20005,
            name: __("The Exalted Bridge"),
            description: __("A literal rainbow bridge that leads to a protected place. Shards might drop."),
            description_locked: sprintf(__("A far away place around 420 light years away from %s"), __("The Leaf Galaxy")),
            resources: [global.resources.leaves, global.resources.void, global.resources.exotic, global.resources.moonstone],
            galaxy: global.galaxies.sacred_nebula,
            section: global.dialog_sections.areas.sacred_nebula,
            bgsprite_stretch: spr_bg_exalted_bridge,
            type: global.area_types.boss,
            enemy: [global.enemies.boss_centaur],
            
            check: function()
            {
                return global.areas.biotite_forest.check();
            },
            
            level: 300000000000000000000000000000000000000,
            is_buyable: false
        }),
        ancient_sanctum: new Area(
        {
            index: 20010,
            name: __("The Ancient Sanctum"),
            description: __("Protected by Zyrkiras, the Centaur, this place is older than the actual universe. It happens to be the birthplace of Leaf Relics."),
            description_locked: __("A giant centaur protects this place."),
            resources: [global.resources.leaves, global.resources.void, global.resources.exotic, global.resources.moonstone, global.resources.sacred],
            galaxy: global.galaxies.sacred_nebula,
            section: global.dialog_sections.areas.sacred_nebula,
            bgsprite_stretch: spr_bg_ancient_sanctum,
            is_buyable: false,
            
            check: function()
            {
                return (global.areas.ancient_sanctum.data.count > 0 || global.enemies.boss_centaur.get_current_defeat_counter() > 0) && global.areas.biotite_forest.check();
            },
            
            can_teleport: function()
            {
                return global.areas.ancient_sanctum.check() && get_upgrade_count(global.areas.ancient_sanctum) > 0;
            }
        }),
        vilewood_cemetery: new Area(
        {
            index: 20020,
            name: __("Vilewood Cemetery"),
            description: __("An abandoned cemetery. There's something else buried here... Shards might drop."),
            description_locked: __("Tombstones, tombstones everywhere."),
            resources: [global.resources.leaves, global.resources.void, global.resources.exotic, global.resources.moonstone, global.resources.sacred],
            galaxy: global.galaxies.sacred_nebula,
            section: global.dialog_sections.areas.sacred_nebula,
            type: global.area_types.boss,
            enemy: [global.enemies.boss_vile_creature],
            level: 300000000000000000000000000000000000000000,
            bgsprite_stretch: spr_bg_cemetery,
            is_buyable: true,
            
            check: function()
            {
                return global.enemies.boss_centaur.get_current_defeat_counter() > 0 && global.areas.biotite_forest.check();
            },
            
            cost: build_resource_cost(global.resources.sacred, 2500000),
            
            is_buyable: function()
            {
                return global.areas.vilewood_cemetery.check();
            }
        }),
        lone_tree: new Area(
        {
            index: 20040,
            name: __("The Lone Tree"),
            description: __("A silent place with an everlasting tree, guarded by a mysterious presence."),
            description_locked: __("A mysterious presence awaits."),
            resources: [global.resources.leaves, global.resources.exotic, global.resources.sacred, global.resources.biotite, global.resources.malachite],
            galaxy: global.galaxies.sacred_nebula,
            section: global.dialog_sections.areas.sacred_nebula,
            type: global.area_types.boss,
            enemy: [global.enemies.boss_air_elemental],
            level: 29999999999999997000000000000000000000000000000,
            bgsprite_stretch: spr_bg_lone_tree,
            
            check: function()
            {
                return global.areas.vilewood_cemetery.data.count > 0 && global.areas.vilewood_cemetery.check() && global.enemies.boss_vile_creature.get_current_defeat_counter() > 0;
            },
            
            cost: 
            {
                biotite: 50000,
                malachite: 50000
            },
            
            is_buyable: function()
            {
                return self.check();
            }
        }),
        spark_range: new Area(
        {
            index: 20050,
            name: __("Spark Range"),
            description: __("The Spark Range is an electrifying place where lightning strikes every second."),
            galaxy: global.galaxies.sacred_nebula,
            section: global.dialog_sections.areas.sacred_nebula,
            resources: [global.resources.leaves, global.resources.hematite, global.resources.energy_electrical],
            bgsprite_stretch: spr_bg_spark_range,
            
            check: function()
            {
                return global.enemies.boss_air_elemental.get_current_defeat_counter() > 0 && global.areas.lone_tree.check();
            },
            
            can_teleport: function()
            {
                return self.check() && get_upgrade_count(global.areas.spark_range) > 0;
            },
            
            cost: 
            {
                biotite: 100000000,
                malachite: 100000000
            },
            charge_energy: 
            {
                energy: global.resources.energy_electrical,
                value: 1
            },
            
            is_buyable: function()
            {
                return self.check();
            }
        }),
        spark_bubble: new Area(
        {
            index: 20060,
            name: __("Spark Bubble"),
            description: __("The Spark Bubble consists of nothing but pure electricity."),
            galaxy: global.galaxies.sacred_nebula,
            section: global.dialog_sections.areas.sacred_nebula,
            resources: [global.resources.leaves, global.resources.exotic, global.resources.malachite, global.resources.hematite],
            type: global.area_types.boss,
            enemy: [global.enemies.boss_spark_bubble],
            level: 1000000000000000000000000000000000000000000000000000000,
            bgsprite_stretch: spr_bg_spark_bubble,
            
            check: function()
            {
                return global.areas.spark_range.data.count > 0 && global.areas.spark_range.check();
            },
            
            can_teleport: function()
            {
                return self.check() && get_upgrade_count(global.areas.spark_bubble) > 0;
            },
            
            cost: 
            {
                energy_electrical: 1200
            },
            charge_energy: 
            {
                energy: global.resources.energy_electrical,
                value: -25
            },
            
            is_buyable: function()
            {
                return self.check();
            }
        }),
        spark_portal: new Area(
        {
            index: 20070,
            name: __("Spark Portal"),
            description: __("After defeating the Spark Bubble, the emitted energy formed an electrifying portal."),
            resources: [],
            galaxy: global.galaxies.sacred_nebula,
            section: global.dialog_sections.areas.sacred_nebula,
            type: global.area_types.idle,
            bgcolor: 0,
            bgsprite_stretch: spr_bg_spark_portal,
            is_buyable: false,
            
            check: function()
            {
                return global.enemies.boss_spark_bubble.get_current_defeat_counter() > 0 && global.areas.spark_bubble.check();
            },
            
            npc: [
            {
                obj: o_npc_spark_portal,
                _x: 480,
                _y: 270,
                text: __("Spark Portal")
            }]
        }),
        energy_shrine: new Area(
        {
            index: 30000,
            name: __("Energy Shrine"),
            description: __("A peculiar place with a shrine that used to emit vast amounts of energy."),
            resources: [],
            galaxy: global.galaxies.energy_belt,
            section: global.dialog_sections.areas.energy_belt,
            trees: false,
            type: global.area_types.idle,
            bgsprite_stretch: spr_bg_energy_shrine,
            is_buyable: false,
            
            check: function()
            {
                return global.areas.spark_portal.check();
            },
            
            npc: [
            {
                obj: o_npc_leaf_stone_blue,
                _x: 142,
                _y: 132,
                text: __("Blue Leaf Stone"),
                xscale: 2.375,
                yscale: 2
            }, 
            {
                obj: o_npc_leaf_stone_green,
                _x: 142,
                _y: 372,
                text: __("Green Leaf Stone"),
                xscale: 2.375,
                yscale: 2
            }, 
            {
                obj: o_npc_leaf_stone_red,
                _x: 808,
                _y: 132,
                text: __("Red Leaf Stone"),
                xscale: 2.375,
                yscale: 2
            }, 
            {
                obj: o_npc_leaf_stone_purple,
                _x: 808,
                _y: 372,
                text: __("Purple Leaf Stone"),
                xscale: 2.375,
                yscale: 2
            }, 
            {
                obj: o_npc_energy_shrine,
                _x: 478,
                _y: 268,
                text: __("Energy Shrine"),
                xscale: 2.41,
                yscale: 2
            }]
        }),
        plasma_forest: new Area(
        {
            index: 30100,
            name: __("Plasma Forest"),
            description: __("High-energy area. Feels like you'll get an electric shock each second. Bzzz bzzz. Plasma Leaves can only be blown off the screen at a certain speed."),
            resources: [global.resources.plasma, global.resources.energy_electrical],
            galaxy: global.galaxies.energy_belt,
            section: global.dialog_sections.areas.energy_belt,
            bgsprite_stretch: spr_bg_plasma_forest,
            charge_energy: 
            {
                energy: global.resources.energy_electrical,
                value: 5
            },
            is_buyable: false,
            
            check: function()
            {
                return global.areas.energy_shrine.check();
            }
        }),
        planet_edge_blue: new Area(
        {
            index: 31000,
            name: __("Blue Planet Edge"),
            description: __("The Blue Energy Stone can be found here."),
            resources: [global.resources.leaves, global.resources.plasma],
            galaxy: global.galaxies.energy_belt,
            section: global.dialog_sections.areas.energy_belt,
            bgsprite_stretch: spr_bg_planet_edge,
            type: global.area_types.boss,
            enemy: [global.enemies.boss_terror_blue],
            level: 100000000000000000000000000000000000000000000000000000000000000000,
            is_buyable: false,
            
            check: function()
            {
                return global.areas.energy_shrine.check() && global.areas.plasma_forest.data.count > 0;
            }
        }),
        planet_edge_green: new Area(
        {
            index: 31001,
            name: __("Green Planet Edge"),
            description: __("The Green Energy Stone can be found here."),
            resources: [global.resources.leaves, global.resources.plasma],
            galaxy: global.galaxies.energy_belt,
            section: global.dialog_sections.areas.energy_belt,
            bgsprite_stretch: spr_bg_planet_edge,
            bgcolor_blend: 32768,
            type: global.area_types.boss,
            enemy: [global.enemies.boss_terror_green],
            level: 100000000000000000000000000000000000000000000000000000000000000000,
            is_buyable: false,
            
            check: function()
            {
                return global.areas.energy_shrine.check() && global.areas.plasma_forest.data.count > 0;
            }
        }),
        planet_edge_red: new Area(
        {
            index: 31002,
            name: __("Red Planet Edge"),
            description: __("The Red Energy Stone can be found here."),
            resources: [global.resources.leaves, global.resources.plasma],
            galaxy: global.galaxies.energy_belt,
            section: global.dialog_sections.areas.energy_belt,
            bgsprite_stretch: spr_bg_planet_edge,
            bgcolor_blend: 255,
            type: global.area_types.boss,
            enemy: [global.enemies.boss_terror_red],
            level: 100000000000000000000000000000000000000000000000000000000000000000,
            is_buyable: false,
            
            check: function()
            {
                return global.areas.energy_shrine.check() && global.areas.plasma_forest.data.count > 0;
            }
        }),
        planet_edge_purple: new Area(
        {
            index: 31003,
            name: __("Purple Planet Edge"),
            description: __("The Purple Energy Stone can be found here."),
            resources: [global.resources.leaves, global.resources.plasma],
            galaxy: global.galaxies.energy_belt,
            section: global.dialog_sections.areas.energy_belt,
            bgsprite_stretch: spr_bg_planet_edge,
            bgcolor_blend: 8388736,
            type: global.area_types.boss,
            enemy: [global.enemies.boss_terror_purple],
            level: 100000000000000000000000000000000000000000000000000000000000000000,
            is_buyable: false,
            
            check: function()
            {
                return global.areas.energy_shrine.check() && global.areas.plasma_forest.data.count > 0;
            }
        }),
        planet_edge_black: new Area(
        {
            index: 31004,
            name: __("Black Planet Edge"),
            description: __("The Energy Shrine has awakened the Black Planet along with a powerful creature..."),
            resources: [global.resources.leaves, global.resources.plasma],
            galaxy: global.galaxies.energy_belt,
            section: global.dialog_sections.areas.energy_belt,
            bgsprite_stretch: spr_bg_planet_edge,
            bgcolor_blend: 0,
            type: global.area_types.boss,
            enemy: [global.enemies.boss_terror_super],
            level: 10000000000000000000000000000000000000000000000000000000000000000000000,
            
            check: function()
            {
                return is_energy_shrine_prophecy_fulfilled();
            },
            
            is_buyable: false,
            
            is_obfuscated: function()
            {
                return !is_energy_shrine_prophecy_fulfilled();
            }
        }),
        terror_graveyard: new Area(
        {
            index: 31050,
            name: __("Terror Graveyard"),
            description: __("A graveyard filled with ancient tombs, as well as strange, twisted trees, gnarled roots, and thick vines. A magic book floats here."),
            resources: [],
            galaxy: global.galaxies.energy_belt,
            section: global.dialog_sections.areas.energy_belt,
            bgsprite_stretch: spr_bg_terror_graveyard,
            type: global.area_types.idle,
            
            check: function()
            {
                return global.enemies.boss_terror_super.get_current_defeat_counter() > 0 && global.areas.planet_edge_black.check();
            },
            
            is_buyable: false,
            
            is_obfuscated: function()
            {
                return global.enemies.boss_terror_super.get_current_defeat_counter() == 0;
            },
            
            npc: [
            {
                obj: o_npc_death_book,
                _x: room_width / 2,
                _y: room_height / 2,
                
                text_func: function()
                {
                    return is_unlocked_death_book() ? __("Death Book") : "?";
                },
                
                xscale: 5,
                yscale: 5
            }]
        }),
        energy_singularity: new Area(
        {
            index: 31100,
            name: __("Energy Singularity"),
            description: __("An infinitely small point in the space-time fabric which contains more than 99.99% of energy in the universe. A strong entity guards this place."),
            resources: [global.resources.leaves, global.resources.plasma],
            galaxy: global.galaxies.energy_belt,
            section: global.dialog_sections.areas.energy_belt,
            bgsprite_stretch: spr_bg_energy_singularity,
            type: global.area_types.boss,
            enemy: [global.enemies.boss_energy_guard],
            level: 100000000000000000000000000000000000000000000000000000000000000000000000000000,
            
            check: function()
            {
                return global.enemies.boss_terror_super.get_current_defeat_counter() > 0 && global.areas.terror_graveyard.check();
            },
            
            is_buyable: false,
            
            is_obfuscated: function()
            {
                return global.enemies.boss_terror_super.get_current_defeat_counter() == 0;
            }
        }),
        ff_portal: new Area(
        {
            index: 31200,
            name: __("Fire Fields Portal"),
            description: __s("The Fire Fields Portal opened after defeating the %s.", __("Energy Guard")),
            resources: [],
            galaxy: global.galaxies.energy_belt,
            section: global.dialog_sections.areas.energy_belt,
            type: global.area_types.idle,
            bgcolor: 0,
            bgsprite_stretch: spr_bg_fire_portal,
            is_buyable: false,
            
            check: function()
            {
                return global.enemies.boss_energy_guard.get_current_defeat_counter() > 0 && global.areas.energy_singularity.check();
            },
            
            npc: [
            {
                obj: o_npc_ff_portal,
                _x: 480,
                _y: 270,
                text: __("Ragethorn")
            }]
        }),
        shadow_cavern: new Area(
        {
            index: 40000,
            name: __("The Shadow Cavern"),
            description: __("A dark, narrow cavern below a huge fire river."),
            resources: [],
            galaxy: global.galaxies.fire_fields,
            section: global.dialog_sections.areas.fire_fields,
            trees: false,
            type: global.area_types.idle,
            bgsprite_stretch: spr_bg_shadow_cavern,
            is_buyable: false,
            
            check: function()
            {
                return is_unlocked_fire_fields();
            },
            
            npc: [
            {
                obj: o_npc_ragethorn,
                _x: 300,
                _y: 350,
                text: "Ragethorn"
            }, 
            {
                obj: o_npc_borb_jones_free,
                _x: 650,
                _y: 150,
                text: "Borbiana Jones"
            }]
        }),
        coal_mine: new Area(
        {
            index: 40005,
            name: __("The Coal Mine"),
            description: __s("Where the earth burns and miners sweat, hacking at veins of black gold."),
            mirror_resources: [global.resources.coal],
            resources: [],
            galaxy: global.galaxies.fire_fields,
            section: global.dialog_sections.areas.fire_fields,
            bgsprite_stretch: spr_bg_coal_mine,
            is_buyable: false,
            trees: false,
            type: global.area_types.idle,
            
            check: function()
            {
                return is_unlocked_mines();
            },
            
            npc: [
            {
                obj: o_npc_coal_vein,
                _x: room_width / 2,
                _y: room_height / 2,
                xscale: 8,
                yscale: 8,
                text: __("Coal Vein")
            }]
        }),
        mount_moltenfury: new Area(
        {
            index: 40010,
            name: __("Mount Moltenfury"),
            description: __s("%s is a large erupting volcano in the Fire Fields region. It is the largest volcano in the Fire Fields and is a popular destination for hikers. Heat resistance gear is recommended.", __("Mount Moltenfury")),
            resources: [global.resources.coal],
            galaxy: global.galaxies.fire_fields,
            section: global.dialog_sections.areas.fire_fields,
            bgsprite_stretch: spr_bg_mount_moltenfury,
            is_buyable: false,
            
            check: function()
            {
                return is_unlocked_fire_fields();
            }
        }),
        fire_temple: new Area(
        {
            index: 40020,
            name: __("The Fire Temple"),
            description: __s("%s lies inside a large volcano. A powerful chimera guards its entrance. Its flame is the source of the temple's power.", __("The Fire Temple")),
            resources: [global.resources.leaves, global.resources.lava, global.resources.coal],
            galaxy: global.galaxies.fire_fields,
            section: global.dialog_sections.areas.fire_fields,
            bgsprite_stretch: spr_bg_fire_temple,
            hp_drain_types: 
            {
                heat: 0.3
            },
            cost: 
            {
                coal: 50000
            },
            
            check: function()
            {
                return is_unlocked_fire_fields();
            },
            
            npc: [
            {
                obj: o_npc_borb_jones_prison,
                _x: 500,
                _y: 250,
                text: "?"
            }],
            
            can_spawn_area_leaves: function()
            {
                return o_game.data.flags.ff_prison_solved;
            },
            
            can_merge: false,
            
            is_buyable: function()
            {
                return self.check();
            },
            
            leave: function()
            {
                delay("destroy_prison_dialog", 1, function()
                {
                    instance_destroy(o_dialog);
                });
            }
        }),
        flame_brazier: new Area(
        {
            index: 40030,
            name: __("Flame Brazier"),
            description: __s("An everlasting flame lights up the %s since the birth of the Fire Universe. The Green Flame heats up all atoms to near lightspeed. Just a single second being near the Green Flame could be enough to set an entire universe on fire.", __("Flame Brazier")),
            resources: [global.resources.leaves, global.resources.lava, global.resources.coal],
            galaxy: global.galaxies.fire_fields,
            section: global.dialog_sections.areas.fire_fields,
            bgsprite_stretch: spr_bg_flame_brazier,
            hp_drain_types: 
            {
                heat: 0.6
            },
            type: global.area_types.boss,
            enemy: [global.enemies.boss_green_flame],
            level: 100000000000000000000000000000000000000000000000000000000000000000000000000000000,
            is_buyable: false,
            
            check: function()
            {
                return o_game.data.flags.ff_prison_solved && global.areas.shadow_cavern.check();
            },
            
            can_merge: false
        }),
        fire_universe: new Area(
        {
            index: 40040,
            name: __("The Fire Universe"),
            description: __s("%s is home to the magical chimera named %s. Long after it was captured by %s, the chimera fused itself with the Green Flame - an everlasting flame since the birth of the universe - in order to prevent its demise. This mindblowing, mystical union worked, and %s was brought back to life.", __("The Fire Universe"), __("Spectralseeker"), "Borbiana Jones", __("Spectralseeker")),
            resources: [global.resources.leaves, global.resources.lava, global.resources.coal],
            galaxy: global.galaxies.fire_fields,
            section: global.dialog_sections.areas.fire_fields,
            bgsprite_stretch: spr_bg_fire_universe,
            hp_drain_types: 
            {
                heat: 0.8
            },
            type: global.area_types.boss,
            enemy: [global.enemies.boss_spectralseeker],
            level: 1000000000000000000000000000000000000000000000000000000000000000000000000000000000,
            is_buyable: false,
            
            check: function()
            {
                return o_game.data.flags.ff_prison_solved && global.areas.shadow_cavern.check();
            },
            
            can_merge: false
        }),
        soul_portal: new Area(
        {
            index: 40100,
            name: __("Soul Portal"),
            description: __s("The Soul Portal opened after defeating %s.", __("Spectralseeker")),
            resources: [],
            galaxy: global.galaxies.fire_fields,
            section: global.dialog_sections.areas.fire_fields,
            type: global.area_types.idle,
            bgcolor: 0,
            bgsprite_stretch: spr_bg_soul_portal,
            is_buyable: false,
            
            check: function()
            {
                return global.enemies.boss_spectralseeker.get_current_defeat_counter() > 0 && global.areas.fire_universe.check();
            },
            
            npc: [
            {
                obj: o_npc_soul_portal,
                _x: room_width / 2,
                _y: (room_height / 2) - 20,
                text: __("Soul Portal")
            }]
        }),
        soul_temple: new Area(
        {
            index: 40050,
            name: __("Soul Temple"),
            description: __s("A magical place with a mystical vibe. Its walls are lined with ancient runes and symbols."),
            resources: [],
            galaxy: global.galaxies.soul_realm,
            section: global.dialog_sections.areas.soul_realm,
            bgsprite_stretch: spr_bg_soul_temple,
            type: global.area_types.idle,
            
            check: function()
            {
                return is_unlocked_soul_realm();
            },
            
            is_buyable: false,
            can_merge: false,
            npc: [
            {
                obj: o_npc_soul_crypt,
                _x: room_width / 2,
                _y: room_height / 2,
                text: __("Soul Crypt")
            }]
        }),
        soul_crypt: new Area(
        {
            index: 40060,
            name: __("Soul Crypt"),
            
            description: function()
            {
                return __s("A bright but dangerous and scary dungeon. It's a great place to explore, though.") + "\n" + __s("Highest floor: %s", global.areas.soul_crypt.get_highest_floor_current_run());
            },
            
            resources: [global.resources.leaves, global.resources.gold, global.resources.bismuth, global.resources.void, global.resources.lava, global.resources.coal],
            galaxy: global.galaxies.soul_realm,
            section: global.dialog_sections.areas.soul_realm,
            type: global.area_types.dungeon,
            bgcolor: 1973790,
            bgsprite_stretch: spr_bg_soul_crypt,
            
            check: function()
            {
                return global.areas.soul_temple.check();
            },
            
            hp_drain_types: 
            {
                heat: 2
            },
            is_buyable: false,
            level: 10000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
            enemy: [global.enemies.sc_monolith, global.enemies.sc_mummy, global.enemies.sc_puddle],
            
            get_bonus_reward_chance: function(arg0)
            {
                var value = clamp(round((arg0 * 50) / 20), 0, 50);
                value = get_bm_value(value, "soul_crypt_bonus_reward_chance");
                return value;
            },
            
            get_bonus_reward: function(arg0)
            {
                var reward = 
                {
                    resources: 
                    {
                        soul_entities: max(1, round(1 + (0.5 * power(arg0, 1.1)))),
                        soul_stones: max(1, round(1 + (1.5 * power(arg0, 1.2))))
                    }
                };
                if (arg0 > 20)
                {
                    reward.resources.soul_empty = max(1, 1 * power(arg0 - 20, 1.1));
                }
                var multiplier = 1 + get_upgrade_attribute_value(global.upgrade_attributes.soul_crypt_bonus_reward_multiplier);
                multiplier *= (1 + get_upgrade_attribute_value(global.upgrade_attributes.soul_crypt_bonus_reward_multiplier_dice));
                reward = multiply_struct_values(reward, multiplier, true);
                return reward;
            },
            
            get_upgrade_cost: function()
            {
                return 
                {
                    resources: 
                    {
                        soul_keys: ceil(10 + (5 * power(global.areas.soul_crypt.data.highest_floor, 1.8))),
                        soul_stones: ceil(5 + (3 * power(global.areas.soul_crypt.data.highest_floor, 1.6)))
                    }
                };
            },
            
            unlock_cost_npc: 
            {
                resources: 
                {
                    soul_stones: 50
                }
            }
        }),
        soul_zone: new Area(
        {
            index: 40070,
            name: __("The Hollow"),
            description: __s("A dark and dismal area where a fearsome boss resides. This place is strictly off limits to anyone but the most determined blowers. Adventurers who came here were never to be seen again..."),
            description_locked: __s("Clear Soul Crypt level %s to unlock this area.", 20),
            resources: [global.resources.leaves, global.resources.mythical, global.resources.lava, global.resources.coal],
            galaxy: global.galaxies.soul_realm,
            section: global.dialog_sections.areas.soul_realm,
            bgsprite_stretch: spr_bg_soul_forge,
            type: global.area_types.boss,
            enemy: [global.enemies.boss_soul_mirage],
            hp_drain_types: 
            {
                heat: 3
            },
            level: 400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
            is_buyable: false,
            
            check: function()
            {
                return global.areas.soul_crypt.check() && global.areas.soul_crypt.get_highest_floor_current_run() >= 20;
            },
            
            can_merge: false
        }),
        soul_forge: new Area(
        {
            index: 40080,
            name: __("Soul Forge"),
            description: __s("A mysterious area; no one knew exactly what it was or what went on behind its walls. Rumors swirled of souls being forged and remade - and the occasional screams echoing in the night only added to the mystery."),
            resources: [],
            galaxy: global.galaxies.soul_realm,
            section: global.dialog_sections.areas.soul_realm,
            bgsprite_stretch: spr_bg_soul_forge2,
            type: global.area_types.idle,
            
            check: function()
            {
                return global.enemies.boss_soul_mirage.get_current_defeat_counter() > 0 && global.areas.soul_zone.check();
            },
            
            is_buyable: false,
            npc: [
            {
                obj: o_npc_soul_forge,
                _x: room_width / 2,
                _y: (room_height / 2) + 120,
                text: __("Soul Forge")
            }, 
            {
                obj: o_npc_soul_leaf,
                _x: room_width / 2,
                _y: (room_height / 2) - 90
            }]
        }),
        quark_portal: new Area(
        {
            index: 40090,
            name: __("Quark Portal"),
            description: __s("A portal leading to the %s.", __("Quark Ambit")),
            resources: [],
            galaxy: global.galaxies.soul_realm,
            section: global.dialog_sections.areas.soul_realm,
            type: global.area_types.idle,
            bgcolor: 0,
            bgsprite_stretch: spr_bg_quark_portal,
            is_buyable: false,
            
            check: function()
            {
                return global.enemies.boss_soul_mirage.get_current_defeat_counter() > 0 && global.areas.soul_zone.check();
            },
            
            npc: [
            {
                obj: o_npc_quark_portal,
                _x: 480,
                _y: 270,
                text: __("Quark Portal")
            }]
        }),
        fabric_universe: new Area(
        {
            index: 41000,
            name: __("The Fabric of the Leafverse"),
            description: __s("A stalwart warden protects this place. They keep a vigilant eye on all that takes place within this little-known part of the universe and make sure that the balance of leaves is maintained, that everything remains as it should."),
            description_locked: __s("Clear Soul Crypt level %s to unlock this area.", 100),
            resources: [global.resources.leaves],
            galaxy: global.galaxies.soul_realm,
            section: global.dialog_sections.areas.soul_realm,
            bgsprite_stretch: spr_bg_fabric_universe,
            type: global.area_types.boss,
            enemy: [global.enemies.boss_fabric_warden],
            hp_drain_types: 
            {
                heat: 3.5
            },
            level: 1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
            is_buyable: false,
            
            check: function()
            {
                return global.areas.soul_crypt.get_highest_floor_current_run() >= 100 && global.areas.soul_crypt.check();
            },
            
            can_merge: false
        }),
        primordial_ethos: new Area(
        {
            index: 41010,
            name: __("Primordial Ethos"),
            description: __s("A convergence of swirling nebulas and radiant star clusters, serving as a crossroads for interstellar energy currents."),
            resources: [global.resources.leaves],
            galaxy: global.galaxies.soul_realm,
            section: global.dialog_sections.areas.soul_realm,
            bgsprite_stretch: spr_bg_primordial_ethos,
            type: global.area_types.boss,
            enemy: [global.enemies.boss_weaver_of_worlds],
            hp_drain_types: 
            {
                heat: 6
            },
            level: 50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
            quark_level: 20,
            is_buyable: false,
            
            check: function()
            {
                return global.enemies.boss_fabric_warden.get_current_defeat_counter() > 0 && global.areas.fabric_universe.check();
            },
            
            can_merge: false
        }),
        quark_nexus: new Area(
        {
            index: 50000,
            name: __("Quark Nexus"),
            description: __s("Find yourself within a transcendent space where quarks and quasars unite, shaping a biome that extends from the subatomic to the cosmic."),
            description_locked: __s("Defeat %s to unlock this area.", __("Fabric Warden")),
            resources: [global.resources.quark],
            galaxy: global.galaxies.quark_ambit,
            section: global.dialog_sections.areas.quark_ambit,
            bgsprite_stretch: spr_bg_quark_nexus,
            is_buyable: false,
            
            check: function()
            {
                return global.enemies.boss_soul_mirage.get_current_defeat_counter() > 0 && global.areas.soul_zone.check();
            },
            
            can_merge: false
        }),
        quantum_aether: new Area(
        {
            index: 50010,
            name: __("Quantum Aether"),
            description: __s("Step into a sanctuary nestled within the uncharted territory of the quantum realm, where space-time itself dances with the tiniest building blocks of existence."),
            resources: [global.resources.leaves, global.resources.quark],
            galaxy: global.galaxies.quark_ambit,
            section: global.dialog_sections.areas.quark_ambit,
            bgsprite_stretch: spr_bg_quantum_aether,
            enemy: [global.enemies.quark_stone],
            level: 1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
            quark_level: 4,
            is_buyable: false,
            
            check: function()
            {
                return global.areas.quark_nexus.check();
            },
            
            can_merge: false
        }),
        astral_oasis: new Area(
        {
            index: 50020,
            name: __("Astral Oasis"),
            description: __s("An area with almost infinite reflections, where every droplet of cosmic water mirrors the grandeur of the universe, creating an awe-inspiring sight. The sight gets disturbed occassionally, though."),
            resources: [global.resources.leaves, global.resources.quark],
            galaxy: global.galaxies.quark_ambit,
            section: global.dialog_sections.areas.quark_ambit,
            bgsprite_stretch: spr_bg_astral_oasis,
            type: global.area_types.boss,
            enemy: [global.enemies.boss_atomic_arbiter],
            level: 100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
            quark_level: 6,
            is_buyable: false,
            
            check: function()
            {
                return global.areas.quark_nexus.check();
            },
            
            can_merge: false
        }),
        dimensional_tapestry: new Area(
        {
            index: 50030,
            name: __("Dimensional Tapestry"),
            description: __s("Dimensions are woven together, creating a cosmic mosaic that captivates with its grandeur."),
            resources: [global.resources.leaves, global.resources.quark],
            galaxy: global.galaxies.quark_ambit,
            section: global.dialog_sections.areas.quark_ambit,
            bgsprite_stretch: spr_bg_dimensional_tapestry,
            type: global.area_types.boss,
            enemy: [global.enemies.boss_cosmic_dragon],
            level: 1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
            quark_level: 8,
            is_buyable: false,
            
            check: function()
            {
                return global.enemies.boss_atomic_arbiter.get_current_defeat_counter() > 0 && global.areas.astral_oasis.check();
            },
            
            can_merge: false
        }),
        planck_scope: new Area(
        {
            index: 50040,
            name: __("Planck Scope"),
            description: __s("Within the %s, time and space dance in an eternal flux, with particles blinking in and out of existence in a breathtaking display of cosmic transience.", __("Planck Scope")),
            resources: [global.resources.leaves, global.resources.quark],
            galaxy: global.galaxies.quark_ambit,
            section: global.dialog_sections.areas.quark_ambit,
            bgsprite_stretch: spr_bg_planck_scope,
            type: global.area_types.boss,
            enemy: [global.enemies.boss_quantum_artificer],
            level: 1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
            quark_level: 10,
            is_buyable: false,
            
            check: function()
            {
                return global.enemies.boss_cosmic_dragon.get_current_defeat_counter() > 0 && global.areas.dimensional_tapestry.check();
            },
            
            can_merge: false
        }),
        ante_leafton: new Area(
        {
            index: 50100,
            name: __("Ante Leafton"),
            description: __s("The dooryard to %s.", __("The Leafton Pit")),
            resources: [],
            galaxy: global.galaxies.quark_ambit,
            section: global.dialog_sections.areas.quark_ambit,
            type: global.area_types.idle,
            bgsprite_stretch: spr_bg_ante_leafton,
            is_buyable: false,
            
            check: function()
            {
                return is_unlocked_leafton() && global.areas.quark_nexus.check();
            },
            
            npc: [
            {
                obj: o_npc_leafton,
                _x: 480,
                _y: 270,
                text: __("Leafton")
            }]
        }),
        leafton_pit: new Area(
        {
            index: 50110,
            name: __("The Leafton Pit"),
            description: __s("A cavernous expanse of pure energy, where hordes of enemies come to eliminate intruders."),
            resources: [global.resources.leaves, global.resources.quark],
            galaxy: global.galaxies.quark_ambit,
            section: global.dialog_sections.areas.quark_ambit,
            type: global.area_types.horde,
            bgcolor: 1973790,
            bgsprite_stretch: spr_bg_leafton_pit,
            
            can_teleport: function()
            {
                return false;
            },
            
            teleport_disabled: true,
            
            check: function()
            {
                return is_unlocked_leafton() && global.areas.quark_nexus.check();
            },
            
            is_buyable: false,
            level: 10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
            quark_level: 12,
            enemy: [global.enemies.quarkling, global.enemies.quark_stone]
        }),
        shadow_crystal: new Area(
        {
            index: 60000,
            name: __("Shadow Crystal"),
            description: __s("Shimmering eternally, gleaming with endless nightlight."),
            resources: [],
            galaxy: global.galaxies.umbral_cluster,
            section: global.dialog_sections.areas.umbral_cluster,
            bgsprite_stretch: spr_bg_shadow_crystal,
            enemy: [],
            is_buyable: false,
            
            check: function()
            {
                return o_game.data.stats.prestige_ulc > 0;
            },
            
            can_merge: false,
            npc: [
            {
                obj: o_npc_shadow_crystal,
                _x: 480,
                _y: 270,
                text: __("Shadow Crystal")
            }]
        }),
        tenebris_field: new Area(
        {
            index: 60001,
            name: __("Tenebris Field"),
            description: __s("A vast expanse where the darkness swirls like mist."),
            resources: [global.resources.dusk],
            galaxy: global.galaxies.umbral_cluster,
            section: global.dialog_sections.areas.umbral_cluster,
            bgsprite_stretch: spr_bg_tenebris_field,
            is_buyable: false,
            
            check: function()
            {
                return global.areas.shadow_crystal.check();
            },
            
            can_merge: false
        }),
        blacklight_verge: new Area(
        {
            index: 60011,
            name: __("Blacklight Verge"),
            description: __s("A realm where shadows devour light, a dangerous void filled with elusive, dark entities."),
            description_locked: __s("Defeat %s level %s.", __("Shadow Crystal"), 5),
            resources: [global.resources.dusk],
            galaxy: global.galaxies.umbral_cluster,
            section: global.dialog_sections.areas.umbral_cluster,
            bgsprite_stretch: spr_bg_blacklight_verge,
            enemy: [global.enemies.shadow_fiend],
            level: 10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
            
            check: function()
            {
                return global.areas.tenebris_field.check() && global.shadow_crystal.data.highest_defeat_level >= 5;
            },
            
            is_buyable: false,
            can_merge: false
        }),
        sombrynth: new Area(
        {
            index: 60020,
            name: __("Sombrynth"),
            description: __s("Shrouded in perpetual twilight where the shadows themselves seem alive."),
            description_locked: __s("Defeat %s level %s.", __("Shadow Crystal"), 25),
            resources: [global.resources.dusk],
            galaxy: global.galaxies.umbral_cluster,
            section: global.dialog_sections.areas.umbral_cluster,
            type: global.area_types.boss,
            bgsprite_stretch: spr_bg_sombrynth,
            enemy: [global.enemies.boss_shadow_tyrant],
            level: 1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
            
            check: function()
            {
                return global.areas.tenebris_field.check() && global.shadow_crystal.data.highest_defeat_level >= 25;
            },
            
            is_buyable: false,
            can_merge: false
        }),
        latsyrc_wodash: new Area(
        {
            index: 60030,
            name: __("Latsyrc Wodash"),
            description: __s("A shadow-ish resemblance of a familiar presence."),
            description_locked: __s("Defeat %s level %s.", __("Shadow Crystal"), 100),
            resources: [global.resources.dusk],
            galaxy: global.galaxies.umbral_cluster,
            section: global.dialog_sections.areas.umbral_cluster,
            type: global.area_types.boss,
            bgsprite_stretch: spr_bg_shadow_crystal,
            bgcolor_blend: 8388736,
            enemy: [global.enemies.boss_verdraxis],
            level: 10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
            
            check: function()
            {
                return global.areas.sombrynth.check() && global.shadow_crystal.data.highest_defeat_level >= 100;
            },
            
            is_buyable: false,
            can_merge: false
        }),
        shadow_lighthouse: new Area(
        {
            index: 60040,
            name: __("Shadow Lighthouse"),
            description: __("The Shadow Lighthouse stands alone, its shadowy walls a hideaway for an omnipresent being who insists on claiming the spotlight."),
            description_locked: __s("Defeat %s %s times.", global.enemies.boss_verdraxis.name, 10),
            resources: [global.resources.dusk],
            galaxy: global.galaxies.umbral_cluster,
            section: global.dialog_sections.areas.umbral_cluster,
            type: global.area_types.boss,
            bgsprite_stretch: spr_bg_lighthouse,
            enemy: [global.enemies.boss_omnipresence],
            level: 1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
            is_buyable: false,
            
            check: function()
            {
                return global.areas.latsyrc_wodash.check() && global.enemies.boss_verdraxis.get_current_defeat_counter() > 10;
            },
            
            can_merge: false
        }),
        spiral_walk: new Area(
        {
            index: 60050,
            name: __("Spiral Walk"),
            description: __("A seemingly endless loop of twists and turns inside the Shadow Lighthouse."),
            description_locked: __s("Defeat %s %s times.", global.enemies.boss_omnipresence.name, 10),
            resources: [global.resources.dusk],
            galaxy: global.galaxies.umbral_cluster,
            section: global.dialog_sections.areas.umbral_cluster,
            type: global.area_types.boss,
            bgsprite_stretch: spr_bg_spiral_walk,
            enemy: [global.enemies.boss_krevlok],
            level: 100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
            is_buyable: false,
            
            check: function()
            {
                return global.areas.shadow_lighthouse.check() && global.enemies.boss_omnipresence.get_current_defeat_counter() > 10;
            },
            
            can_merge: false
        }),
        cheese_pub: new Area(
        {
            index: 900000,
            name: __("The Cheese Pub"),
            description: __("A famous tavern located in Leafsink Harbor."),
            description_locked: sprintf(__("Pay some %s to enter this place."), global.resources.borbs.name_plural),
            resources: [],
            galaxy: global.galaxies.leaf_galaxy,
            section: global.dialog_sections.areas.leaf_galaxy,
            type: global.area_types.idle,
            bgcolor: 2631800,
            bgsprite: -1,
            bgsprite_stretch: spr_bg_cheese_pub,
            cost: 
            {
                borbs: 500
            },
            can_dig: false,
            level: 3000,
            trees: false,
            npc: [
            {
                obj: o_npc_slots,
                _x: 670,
                _y: 207,
                text: __("Slots"),
                angle: 270
            }, 
            {
                obj: o_npc_borb,
                _x: 200,
                _y: 200,
                text: __("Borb Claw Machine"),
                xscale: 1.5,
                yscale: 1.5
            }, 
            {
                obj: o_npc_leaf_counter,
                _x: 560,
                _y: 202,
                text: __("Leaf Counter"),
                xscale: 1.5,
                yscale: 1.5
            }, 
            {
                obj: o_npc_quests_pub,
                _x: 90,
                _y: 280,
                text: __("Bartender"),
                xscale: 3,
                yscale: 3
            }, 
            {
                obj: o_npc_curse_machine,
                _x: 907,
                _y: 274,
                text: __("Curse Machine"),
                xscale: 1.5,
                yscale: 1.5
            }, 
            {
                obj: o_npc_booster,
                _x: 415,
                _y: 132,
                text: __("Booster Game"),
                xscale: 2,
                yscale: 2
            }, 
            {
                obj: o_npc_anniversary,
                _x: 516,
                _y: 282,
                text: __("Anniversary"),
                xscale: 3,
                yscale: 3
            }, 
            {
                obj: o_deco_christmas,
                sprite_index: spr_deco_christmas_tree,
                _x: 768,
                _y: 384,
                image_xscale: 6,
                image_yscale: 6
            }, 
            {
                obj: o_deco_christmas,
                sprite_index: spr_deco_christmas_wreath,
                _x: 544,
                _y: 155,
                image_xscale: 3,
                image_yscale: 3
            }, 
            {
                obj: o_deco_pub_pig,
                _x: 155,
                _y: 267
            }]
        }),
        house: new Area(
        {
            index: 900010,
            name: __("Your House"),
            description: __("Literally unlocks your house for you have lost your key since the start of your journey."),
            resources: [],
            galaxy: global.galaxies.leaf_galaxy,
            section: global.dialog_sections.areas.leaf_galaxy,
            type: global.area_types.idle,
            bgcolor: 2631800,
            bgsprite: spr_bg_wood,
            cost: 
            {
                cheese: 300
            },
            can_dig: false,
            persist_prestige: true,
            player_visible: false,
            trees: false,
            
            enter: function()
            {
                instance_create_layer(0, 0, global.layers.ground, o_house_grid);
                var __struct = global.house_items;
                var __prop_names = struct_get_names(__struct);
                var __prop_len = array_length(__prop_names);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mkey = __prop_names[__i];
                    var mitem = variable_struct_get(__struct, mkey);
                    var len = array_length(mitem.data.build_data);
                    for (var i = 0; i < len; i++)
                    {
                        var row = mitem.get_build_data(i);
                        var o = place_house_item(mitem, row._x, row._y, row.img_angle, row.img_index, false);
                        if (is_undefined(o))
                        {
                            continue;
                        }
                        o.item_id = row.item_id;
                        o.build_data = row;
                    }
                }
            }
        }),
        cursed_halloween: new Area(
        {
            index: 1,
            name: __("Cursed Halloween"),
            
            description: function()
            {
                var text = __("It's Halloween. The Cursed Cheese returns! Protip: enable ALB bumping in the options.");
                text += ("\n" + __s("%s level: %s", __("The Cursed Cheese"), global.enemies.boss_cursed_cheese.data.defeated + 1));
                if (global.events.halloween._is_active())
                {
                    text += ("\n" + __s("Expires in %s.", global.events.halloween.get_expire_time_formatted()));
                }
                return text;
            },
            
            description_locked: __s("This area opens on %s.", __("Halloween")),
            resources: [],
            section: global.dialog_sections.areas.events,
            bgcolor: 5609803,
            bgsprite_stretch: spr_bg_cursed_church_outside,
            data: 
            {
                count: 1
            },
            type: global.area_types.boss,
            can_use_artifacts: false,
            enemy: [global.enemies.boss_cursed_cheese],
            level: 690000000000,
            
            check: function()
            {
                return is_event_active(global.events.halloween);
            },
            
            is_buyable: false
        }),
        farm_field: new Area(
        {
            index: 10,
            name: __("Farm Field"),
            description: __("Grow your own plants here. Make sure to water them regularly!"),
            description_locked: __s("This area opens on %s.", __("Nature Season")),
            resources: [],
            section: global.dialog_sections.areas.events,
            bgcolor: 5609803,
            bgsprite: spr_grass_08,
            data: 
            {
                count: 1
            },
            type: global.area_types.idle,
            
            check: function()
            {
                return is_event_active(global.events.nature_season);
            },
            
            is_buyable: false,
            persist_prestige: true,
            player_visible: false,
            npc: [
            {
                obj: o_npc_nature_season,
                _x: -200,
                _y: -200,
                text: ""
            }]
        }),
        butterfly_field: new Area(
        {
            index: 11,
            name: __("Butterfly Field"),
            description: __("The perfect place to breed butterflies."),
            description_locked: __s("This area opens on %s.", __("Nature Season")) + " " + __s("Unlock %s to get access to this area.", __("Butterflies")),
            resources: [],
            section: global.dialog_sections.areas.events,
            bgcolor: 5609803,
            bgsprite: spr_grass_08,
            data: 
            {
                count: 1
            },
            type: global.area_types.idle,
            
            check: function()
            {
                return is_event_active(global.events.nature_season) && is_unlocked_butterflies();
            },
            
            is_buyable: false,
            persist_prestige: true,
            player_visible: false,
            npc: [
            {
                obj: o_npc_nature_season_butterfly_fields,
                _x: -200,
                _y: -200,
                text: ""
            }]
        }),
        vial_of_life: new Area(
        {
            index: 15,
            name: __("Vial of Life"),
            description: __("The Vial of Life spreads flower seeds occassionally. Collect them to plant new flowers!"),
            description_locked: __s("This area opens on %s.", __("Nature Season")),
            resources: [],
            section: global.dialog_sections.areas.events,
            bgcolor: 5609803,
            bgsprite: spr_grass_07,
            data: 
            {
                count: 1
            },
            type: global.area_types.idle,
            
            check: function()
            {
                return is_event_active(global.events.nature_season);
            },
            
            is_buyable: false,
            persist_prestige: true,
            trees: true,
            npc: [
            {
                obj: o_npc_vial_of_life,
                _x: room_width / 2,
                _y: room_height / 2,
                text: __("Vial of Life"),
                xscale: 3,
                yscale: 3
            }]
        }),
        the_doomed_forest: new Area(
        {
            index: 100,
            name: __("The Doomed Forest"),
            description: __("It's Nature Season. The Doomed Tree returns!"),
            description_locked: __s("This area opens on %s.", __("Nature Season")),
            resources: [],
            section: global.dialog_sections.areas.events,
            bgcolor: 5609803,
            bgsprite_stretch: spr_bg_doomed_forest,
            data: 
            {
                count: 1
            },
            type: global.area_types.boss,
            boss_spawn_delay_duration: sec(900),
            can_use_artifacts: false,
            enemy: [global.enemies.boss_doomed_tree],
            level: 666,
            
            check: function()
            {
                return is_event_active(global.events.nature_season);
            },
            
            is_buyable: false
        })
    };
    var defaults = get_default_shop_item();
    global.areas_sections = {};
    var __struct = global.dialog_sections.areas;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(global.areas_sections, mkey, []);
    }
    global.areas_array = [];
    _map(global.areas, function(arg0, arg1, arg2, arg3)
    {
        struct_apply_defaults(arg0, arg3);
        arg0.data.auto_teleport = false;
        arg0.key = arg1;
        arg0.level = get_default_struct_value(arg0, "level", arg0.index);
        arg0.data_start = struct_clone(arg0.data);
        set_sprite_data(arg0);
        _map(arg0.resources, function(arg0, arg1, arg2)
        {
            array_push(arg2.resources_sorted, arg0);
            if (arg0.droppable)
            {
                array_push(arg2.resources_droppable, arg0);
            }
        }, arg0);
        var __array = arg0.enemy;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            array_push(mitem.spawn_areas, arg0.key);
        }
        array_sort(arg0.resources_sorted, function(arg0, arg1)
        {
            return arg1.index - arg0.index;
        });
        array_push(global.areas_array, arg0);
    }, defaults);
    global.areas_boss = _filter(global.areas_array, function(arg0)
    {
        return arg0.type.key == global.area_types.boss.key;
    });
    global.areas_boss_random = _clone_array(global.areas_boss);
    call_struct(global.enemies, "init_late");
    array_sort(global.areas_array, function(arg0, arg1)
    {
        return arg0.index - arg1.index;
    });
    var __array = global.areas_array;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        array_push(variable_struct_get(global.areas_sections, mitem.section.key), mitem);
    }
}
