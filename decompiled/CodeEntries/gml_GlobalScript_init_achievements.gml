function init_achievements(arg0)
{
    if (arg0)
    {
        exit;
    }
    global.achievements_sections = {};
    global.achievements_sorted = [];
    global.achievements = 
    {
        collected_leaves: new Achievement(
        {
            index: 0,
            name: __("Leaf Blower"),
            description: __("So many leaves..."),
            sprite: spr_leaf_basic,
            effect_description: "",
            claim_resources: 
            {
                gems: 1
            },
            levels: [100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000, 10000000000],
            
            value: function()
            {
                return global.resources.leaves.data.collected_total;
            },
            
            section: global.dialog_sections.achievements.leaves
        }),
        collected_leaves_gold: new Achievement(
        {
            index: 10,
            name: __("Gold Leaves"),
            description: __("Gold leaves? They must be worth something."),
            sprite: spr_leaf_gold,
            effect_description: "",
            claim_resources: 
            {
                gems: 1
            },
            levels: [100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000, 10000000000],
            
            value: function()
            {
                return global.resources.gold.data.collected_total;
            },
            
            section: global.dialog_sections.achievements.leaves
        }),
        collected_leaves_platinum: new Achievement(
        {
            index: 20,
            name: __("Platinum Leaves"),
            description: __("Platinum leaves? What kind of tree drops platinum leaves?"),
            sprite: spr_leaf_platinum,
            effect_description: "",
            claim_resources: 
            {
                gems: 1
            },
            levels: [100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000, 10000000000],
            
            value: function()
            {
                return global.resources.platinum.data.collected_total;
            },
            
            section: global.dialog_sections.achievements.leaves
        }),
        collected_leaves_bismuth: new Achievement(
        {
            index: 30,
            name: __("Bismuth Leaves"),
            description: __("Bismuth leaves? HAVE YOU EVER SEEN ANY BISMUTH LEAVES?!"),
            sprite: spr_leaf_bismuth,
            effect_description: "",
            claim_resources: 
            {
                gems: 1
            },
            levels: [100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000, 10000000000],
            
            value: function()
            {
                return global.resources.bismuth.data.collected_total;
            },
            
            section: global.dialog_sections.achievements.leaves
        }),
        collected_leaves_cosmic: new Achievement(
        {
            index: 40,
            name: __("Cosmic Leaves"),
            description: __("Cosmic leaves? What is this, a space game?"),
            sprite: spr_leaf_cosmic,
            effect_description: "",
            claim_resources: 
            {
                gems: 1
            },
            levels: [100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000, 10000000000],
            
            value: function()
            {
                return global.resources.cosmic.data.collected_total;
            },
            
            section: global.dialog_sections.achievements.leaves
        }),
        collected_leaves_void: new Achievement(
        {
            index: 50,
            name: __("Void Leaves"),
            description: __("Void leaves? Yeah, right."),
            sprite: spr_leaf_void,
            effect_description: "",
            claim_resources: 
            {
                gems: 1
            },
            levels: [100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000, 10000000000],
            
            value: function()
            {
                return global.resources.void.data.collected_total;
            },
            
            section: global.dialog_sections.achievements.leaves
        }),
        collected_leaves_exotic: new Achievement(
        {
            index: 60,
            name: __("Exotic Leaves"),
            description: __("Exotic leaves? These leaves seem to be important."),
            sprite: spr_leaf_exotic,
            effect_description: "",
            claim_resources: 
            {
                gems: 1
            },
            levels: [100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000, 10000000000],
            
            value: function()
            {
                return global.resources.exotic.data.collected_total;
            },
            
            section: global.dialog_sections.achievements.leaves
        }),
        collected_leaves_celestial: new Achievement(
        {
            index: 70,
            name: __("Celestial Leaves"),
            description: __("Celestial leaves? These leaves are so celestial they earned a bunch of negative reviews."),
            sprite: spr_leaf_celestial,
            effect_description: "",
            claim_resources: 
            {
                gems: 1
            },
            levels: [100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000, 10000000000],
            
            value: function()
            {
                return global.resources.celestial.data.collected_total;
            },
            
            section: global.dialog_sections.achievements.leaves
        }),
        collected_leaves_mythical: new Achievement(
        {
            index: 80,
            name: __("Mythical Leaves"),
            description: __("Mythical leaves? These leaves look so fancy, though."),
            sprite: spr_leaf_mythical,
            effect_description: "",
            claim_resources: 
            {
                gems: 1
            },
            levels: [100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000, 10000000000],
            
            value: function()
            {
                return global.resources.mythical.data.collected_total;
            },
            
            section: global.dialog_sections.achievements.leaves
        }),
        collected_leaves_lava: new Achievement(
        {
            index: 90,
            name: __("Lava Leaves"),
            description: __("Lava leaves? So hot right now."),
            sprite: spr_leaf_lava,
            effect_description: "",
            claim_resources: 
            {
                gems: 1
            },
            levels: [100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000, 10000000000],
            
            value: function()
            {
                return global.resources.lava.data.collected_total;
            },
            
            section: global.dialog_sections.achievements.leaves
        }),
        collected_leaves_ice: new Achievement(
        {
            index: 100,
            name: __("Ice Leaves"),
            description: __("Ice leaves? So cold right now."),
            sprite: spr_leaf_ice,
            effect_description: "",
            claim_resources: 
            {
                gems: 1
            },
            levels: [100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000, 10000000000],
            
            value: function()
            {
                return global.resources.ice.data.collected_total;
            },
            
            section: global.dialog_sections.achievements.leaves
        }),
        collected_leaves_obsidian: new Achievement(
        {
            index: 110,
            name: __("Obsidian Leaves"),
            description: __("Obsidian leaves? What is this, Leafcraft?"),
            sprite: spr_leaf_obsidian,
            effect_description: "",
            claim_resources: 
            {
                gems: 1
            },
            levels: [100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000, 10000000000],
            
            value: function()
            {
                return global.resources.obsidian.data.collected_total;
            },
            
            section: global.dialog_sections.achievements.leaves
        }),
        collected_leaves_silicon: new Achievement(
        {
            index: 120,
            name: __("Silicon Leaves"),
            description: __("Silicon leaves? Really, nature?"),
            sprite: spr_leaf_silicon,
            effect_description: "",
            claim_resources: 
            {
                gems: 1
            },
            levels: [100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000, 10000000000],
            
            value: function()
            {
                return global.resources.silicon.data.collected_total;
            },
            
            section: global.dialog_sections.achievements.leaves
        }),
        collected_leaves_benitoite: new Achievement(
        {
            index: 130,
            name: __("Benitoite Leaves"),
            description: __("Bentiote... Bentitote... Benitotite... THE LEAVES AFTER SILICON."),
            sprite: spr_leaf_benitoite,
            effect_description: "",
            claim_resources: 
            {
                gems: 1
            },
            levels: [100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000, 10000000000],
            
            value: function()
            {
                return global.resources.benitoite.data.collected_total;
            },
            
            section: global.dialog_sections.achievements.leaves
        }),
        collected_leaves_moonstone: new Achievement(
        {
            index: 140,
            name: __("Moonstone Leaves"),
            description: __("Moonstone leaves are created when leaves are blown through Space and then land with their downside on the Moon. Only on Mondays, though. Scientifically 103% accurate."),
            sprite: spr_leaf_moonstone,
            effect_description: "",
            claim_resources: 
            {
                gems: 1
            },
            levels: [100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000, 10000000000],
            
            value: function()
            {
                return global.resources.moonstone.data.collected_total;
            },
            
            section: global.dialog_sections.achievements.leaves
        }),
        collected_leaves_sand: new Achievement(
        {
            index: 150,
            name: __("Sand Leaves"),
            description: __("Sand leaves go crumble."),
            sprite: spr_leaf_sand,
            effect_description: "",
            claim_resources: 
            {
                gems: 1
            },
            levels: [100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000, 10000000000],
            
            value: function()
            {
                return global.resources.sand.data.collected_total;
            },
            
            section: global.dialog_sections.achievements.leaves
        }),
        collected_leaves_azurite: new Achievement(
        {
            index: 154,
            name: __("Azurite Leaves"),
            description: __(""),
            sprite: spr_leaf_azurite,
            effect_description: "",
            claim_resources: 
            {
                gems: 1
            },
            levels: [100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000, 10000000000],
            
            value: function()
            {
                return global.resources.azurite.data.collected_total;
            },
            
            section: global.dialog_sections.achievements.leaves
        }),
        collected_leaves_niobium: new Achievement(
        {
            index: 157,
            name: __("Niobium Leaves"),
            description: __(""),
            sprite: spr_leaf_niobium,
            effect_description: "",
            claim_resources: 
            {
                gems: 1
            },
            levels: [100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000, 10000000000],
            
            value: function()
            {
                return global.resources.niobium.data.collected_total;
            },
            
            section: global.dialog_sections.achievements.leaves
        }),
        collected_leaves_ancient: new Achievement(
        {
            index: 160,
            name: __("Ancient Leaves"),
            description: __("These leaves were created 420 seconds after the Big Leaf Crunch."),
            sprite: spr_leaf_ancient,
            effect_description: "",
            claim_resources: 
            {
                gems: 1
            },
            levels: [100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000, 10000000000],
            
            value: function()
            {
                return global.resources.ancient.data.collected_total;
            },
            
            section: global.dialog_sections.achievements.leaves
        }),
        collected_leaves_sacred: new Achievement(
        {
            index: 170,
            name: __("Sacred Leaves"),
            description: __("Blessed by The Leaf God."),
            sprite: spr_leaf_sacred,
            effect_description: "",
            claim_resources: 
            {
                gems: 1
            },
            levels: [100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000, 10000000000],
            
            value: function()
            {
                return global.resources.sacred.data.collected_total;
            },
            
            section: global.dialog_sections.achievements.leaves
        }),
        collected_leaves_biotite: new Achievement(
        {
            index: 180,
            name: __("Biotite Leaves"),
            description: __("These leaves look so biotite!"),
            sprite: spr_leaf_biotite,
            effect_description: "",
            claim_resources: 
            {
                gems: 1
            },
            levels: [100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000, 10000000000],
            
            value: function()
            {
                return global.resources.biotite.data.collected_total;
            },
            
            section: global.dialog_sections.achievements.leaves
        }),
        collected_leaves_malachite: new Achievement(
        {
            index: 190,
            name: __("Malachite Leaves"),
            description: __("I need a malachite notepad to keep track of all these leaves..."),
            sprite: spr_leaf_malachite,
            effect_description: "",
            claim_resources: 
            {
                gems: 1
            },
            levels: [100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000, 10000000000],
            
            value: function()
            {
                return global.resources.malachite.data.collected_total;
            },
            
            section: global.dialog_sections.achievements.leaves
        }),
        collected_leaves_hematite: new Achievement(
        {
            index: 200,
            name: __("Hematite Leaves"),
            description: __("Ahh, yes, the famous Hematite Leaves."),
            sprite: spr_leaf_hematite,
            effect_description: "",
            claim_resources: 
            {
                gems: 1
            },
            levels: [100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000, 10000000000],
            
            value: function()
            {
                return global.resources.hematite.data.collected_total;
            },
            
            section: global.dialog_sections.achievements.leaves
        }),
        collected_leaves_plasma: new Achievement(
        {
            index: 210,
            name: __("Plasma Leaves"),
            description: __("Round and round they go!"),
            sprite: spr_leaf_plasma,
            effect_description: "",
            claim_resources: 
            {
                gems: 2
            },
            levels: [100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000, 10000000000],
            
            value: function()
            {
                return global.resources.plasma.data.collected_total;
            },
            
            section: global.dialog_sections.achievements.leaves
        }),
        collected_leaves_coal: new Achievement(
        {
            index: 220,
            name: __("Coal Leaves"),
            description: __("Look out, they can be hot!"),
            sprite: spr_leaf_coal,
            effect_description: "",
            claim_resources: 
            {
                gems: 2
            },
            levels: [100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000, 10000000000],
            
            value: function()
            {
                return global.resources.coal.data.collected_total;
            },
            
            section: global.dialog_sections.achievements.leaves
        }),
        collected_leaves_soul: new Achievement(
        {
            index: 230,
            name: __("Soul Leaves"),
            description: __(""),
            sprite: spr_leaf_soul,
            effect_description: "",
            claim_resources: 
            {
                gems: 2
            },
            levels: [100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000, 10000000000],
            
            value: function()
            {
                return global.resources.soul.data.collected_total;
            },
            
            section: global.dialog_sections.achievements.leaves
        }),
        collected_leaves_quark: new Achievement(
        {
            index: 240,
            name: __("Quark Leaves"),
            description: __(""),
            sprite: spr_leaf_quark,
            effect_description: "",
            claim_resources: 
            {
                gems: 2
            },
            levels: [100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000, 10000000000],
            
            value: function()
            {
                return global.resources.quark.data.collected_total;
            },
            
            section: global.dialog_sections.achievements.leaves
        }),
        collected_fruits: new Achievement(
        {
            index: 2000,
            name: __("Fruits"),
            description: __("Tasty and healthy for sure."),
            sprite: spr_fruit,
            effect_description: "",
            claim_resources: 
            {
                gems: 1
            },
            levels: [10, 50, 200, 500, 1000, 3000, 5000, 10000, 50000, 250000],
            
            value: function()
            {
                return global.resources.fruits.data.collected_total;
            }
        }),
        prestige: new Achievement(
        {
            index: 5000,
            name: __("Leaf Portals"),
            description: __("Stepping through Leaf Portals seems to make it even worse..."),
            sprite: spr_gold,
            effect_description: "",
            claim_resources: 
            {
                gems: 1
            },
            levels: [1, 3, 5, 10, 30, 50, 100, 200, 300, 500],
            
            value: function()
            {
                return o_game.data.stats.prestige;
            }
        }),
        blc: new Achievement(
        {
            index: 5100,
            name: __("Big Leaf Crunches"),
            description: __("Performing Big Leaf Crunches seems to make it MUCH worse..."),
            sprite: spr_blc,
            effect_description: "",
            claim_resources: 
            {
                gems: 1
            },
            levels: [1, 2, 3, 5, 10, 20, 30, 50, 100, 200],
            
            value: function()
            {
                return o_game.data.stats.prestige_crunch;
            }
        }),
        mlc: new Achievement(
        {
            index: 5200,
            name: __("Mega Leaf Crunches"),
            description: __("Performing Mega Leaf Crunches seems to make it MULCH worse..."),
            sprite: spr_mlc,
            effect_description: "",
            claim_resources: 
            {
                gems: 1
            },
            levels: [1, 2, 3, 5, 10, 20, 30, 50, 100, 200],
            
            value: function()
            {
                return o_game.data.stats.prestige_mlc;
            }
        }),
        ulc: new Achievement(
        {
            index: 5300,
            name: __("Ultra Leaf Crunches"),
            description: __("Performing Ultra Leaf Crunches seems to make it ULCH worse..."),
            sprite: spr_ulc,
            effect_description: "",
            claim_resources: 
            {
                gems: 1
            },
            levels: [1, 2, 3, 5, 10, 20, 30, 50, 100, 200],
            
            value: function()
            {
                return o_game.data.stats.prestige_ulc;
            }
        }),
        house: new Achievement(
        {
            index: 6000,
            name: __("Your House"),
            description: __("You have finally unlocked your house!"),
            sprite: spr_icon_house,
            effect_description: "",
            claim_resources: 
            {
                cp: 4
            },
            levels: [1],
            
            value: function()
            {
                return get_upgrade_count(global.areas.house) > 0;
            }
        }),
        pub: new Achievement(
        {
            index: 6100,
            name: __("The Cheese Pub"),
            description: __("You have finally unlocked The Cheese Pub! Time to drink some be... water!"),
            sprite: spr_icon_beer,
            effect_description: "",
            claim_resources: 
            {
                gems: 5
            },
            levels: [1],
            
            value: function()
            {
                return get_upgrade_count(global.areas.cheese_pub) > 0;
            }
        }),
        claw_machine: new Achievement(
        {
            index: 6800,
            name: __("Borb Claw Machine Pro"),
            description: __("Someone said this was more fun than the actual game. Thank you."),
            sprite: spr_icon_hook,
            effect_description: "",
            claim_resources: 
            {
                gems: 1
            },
            levels: [1, 100, 500, 1000, 5000],
            
            value: function()
            {
                return o_game.data.stats.borb_claw_machine.won;
            }
        }),
        slots: new Achievement(
        {
            index: 6810,
            name: __("Slots Pro"),
            description: __("You're totally not addicted."),
            sprite: spr_icon_slot_machine,
            effect_description: "",
            claim_resources: 
            {
                gems: 1
            },
            levels: [1, 100, 500, 1000, 5000],
            
            value: function()
            {
                return o_game.data.stats.slots.won;
            }
        }),
        curses: new Achievement(
        {
            index: 7000,
            name: __("C U R S E S"),
            description: __("- Y O U - G O T - C U R S E D -"),
            sprite: spr_icon_cursed_cheese,
            effect_description: "",
            claim_resources: 
            {
                gems: 1
            },
            levels: [1, 10, 1000, 10000, 100000],
            
            value: function()
            {
                return o_game.data.stats.cursed_count;
            }
        }),
        crafted_leaves: new Achievement(
        {
            index: 7100,
            name: __("Crafted Leaves"),
            description: __("First, you got rid of leaves. Now, you crafted leaves. ALL THIS DOESN'T MAKE SENSE, DOES IT."),
            sprite: spr_icon_crafting,
            effect_description: "",
            claim_resources: 
            {
                gems: 1
            },
            levels: [1, 25, 100, 500, 2500, 10000],
            
            value: function()
            {
                return o_game.data.stats.crafted_leaves;
            }
        }),
        trades: new Achievement(
        {
            index: 7200,
            name: __("Trade Blower Revolution"),
            description: __("Why blow leaves when you can trade leaves?"),
            sprite: spr_icon_trading,
            effect_description: "",
            claim_resources: 
            {
                gems: 1
            },
            levels: [1, 50, 250, 1000, 5000, 25000],
            
            value: function()
            {
                return o_game.data.stats.trades_finished;
            }
        }),
        digs: new Achievement(
        {
            index: 7300,
            name: __("Digging Simulator"),
            description: __("The greenkeeper is not amused."),
            sprite: spr_weapon_shovel,
            effect_description: "",
            claim_resources: 
            {
                gems: 1
            },
            levels: [1, 25, 250, 1000, 5000, 25000],
            
            value: function()
            {
                return o_game.data.stats.digs;
            }
        }),
        pets_pet: new Achievement(
        {
            index: 7400,
            name: __("Pet the Pets"),
            description: __("Who is a good Doggo? You're a good Doggo!"),
            sprite: spr_pet_dog,
            effect_description: "",
            claim_resources: 
            {
                gems: 1
            },
            levels: [1, 25, 100, 500, 2500, 10000],
            
            value: function()
            {
                return o_game.data.stats.pets_pet;
            }
        }),
        borb_slapped: new Achievement(
        {
            index: 7500,
            name: __("Borb Slapper"),
            description: __("Borbs don't feel any pain by slapping them. It's more like a nice massage due to their half-solid-half-fluid consistence."),
            sprite: spr_borb,
            effect_description: "",
            claim_resources: 
            {
                gems: 1
            },
            levels: [1, 25, 100, 500, 2500, 10000],
            
            value: function()
            {
                return o_game.data.stats.borb_slapped;
            }
        }),
        fish_caught: new Achievement(
        {
            index: 7600,
            name: __("Master Angler"),
            description: __("Gone fishing. Again. And again. And again."),
            sprite: spr_fish_swoople,
            effect_description: "",
            claim_resources: 
            {
                gems: 1
            },
            levels: [1, 25, 50, 100, 500, 1000, 2000, 5000, 10000, 50000],
            
            value: function()
            {
                return o_game.data.stats.fish_caught;
            }
        }),
        artifacts_collected: new Achievement(
        {
            index: 7700,
            name: __("Artifact Hunter"),
            description: __("Collecting shiny things since forever."),
            sprite: spr_artifact_orb,
            effect_description: "",
            claim_resources: 
            {
                gems: 1
            },
            levels: [1, 10, 50, 100, 200, 500, 1000],
            
            value: function()
            {
                return o_game.data.stats.artifacts_collected;
            }
        }),
        chests_opened: new Achievement(
        {
            index: 7800,
            name: __("Chest Opener"),
            description: __("What's in the box?! WHAT'S IN THE BOX?!"),
            sprite: spr_chest_legendary,
            effect_description: "",
            claim_resources: 
            {
                gems: 1
            },
            levels: [1, 50, 200, 500, 1000, 5000, 10000, 50000],
            
            value: function()
            {
                return o_game.data.stats.chests_opened;
            }
        }),
        leaves_mulched: new Achievement(
        {
            index: 7900,
            name: __("Mulch Mania"),
            description: __("Leaves go in, mulch comes out. It's the circle of mulch."),
            sprite: spr_icon_mulch,
            effect_description: "",
            claim_resources: 
            {
                gems: 1
            },
            levels: [1, 100, 1000, 5000, 10000, 50000, 100000, 1000000],
            
            value: function()
            {
                return o_game.data.stats.leaves_mulched;
            }
        }),
        brews: new Achievement(
        {
            index: 8000,
            name: __("Master Brewer"),
            description: __("Bubbling potions and mysterious concoctions."),
            sprite: spr_icon_vial_of_life,
            effect_description: "",
            claim_resources: 
            {
                gems: 1
            },
            levels: [1, 50, 250, 1000, 5000, 10000, 50000],
            
            value: function()
            {
                return o_game.data.stats.brews.regular;
            }
        }),
        brews: new Achievement(
        {
            index: 8001,
            name: __("Critical Brewer"),
            description: __("Getting those critical brews more often than not."),
            sprite: spr_icon_vial_of_life,
            effect_description: "",
            claim_resources: 
            {
                gems: 1
            },
            levels: [1, 50, 200, 500, 1000, 5000, 10000],
            
            value: function()
            {
                return o_game.data.stats.brews.crits;
            }
        }),
        borbventures: new Achievement(
        {
            index: 8100,
            name: __("Borbventurer"),
            description: __("Sending Borbs on borbventures. They don't seem to mind."),
            sprite: spr_borb,
            effect_description: "",
            claim_resources: 
            {
                gems: 1
            },
            levels: [1, 20, 100, 500, 1000, 5000, 10000],
            
            value: function()
            {
                return o_game.data.stats.borbventures_finished;
            }
        }),
        daily_quests: new Achievement(
        {
            index: 8200,
            name: __("Daily Devotion"),
            description: __("Every day brings new quests. You're up for it!"),
            sprite: spr_icon_calendar,
            effect_description: "",
            claim_resources: 
            {
                gems: 1
            },
            levels: [1, 10, 50, 100, 200, 365, 500, 1000],
            
            value: function()
            {
                return o_game.data.stats.daily_quests;
            }
        }),
        time_played: new Achievement(
        {
            index: 10000,
            name: __("Time Played"),
            description: __("The longer you play, the more achievements you get. Simple."),
            sprite: spr_icon_clock,
            effect_description: "",
            claim_resources: 
            {
                gems: 1
            },
            levels: [300, 3600, 21600, 86400, 604800, 1209600, 1814400, 3024000, 6048000, 18144000],
            
            value: function()
            {
                return o_game.data.stats.time_elapsed / room_speed;
            },
            
            section: global.dialog_sections.achievements.misc
        }),
        social_discord: new Achievement(
        {
            index: 100000,
            name: "Discord",
            description: __("Come join us on discord!"),
            is_progress: false,
            sprite: spr_icon_discord_color,
            claim_resources: 
            {
                gems: 5
            },
            levels: [1],
            value: false,
            section: global.dialog_sections.achievements.misc
        }),
        social_humblenorth: new Achievement(
        {
            index: 100001,
            name: "Humble North",
            description: __("The developer's game development company."),
            is_progress: false,
            sprite: spr_icon_humblenorth,
            claim_resources: 
            {
                gems: 5
            },
            levels: [1],
            value: false,
            section: global.dialog_sections.achievements.misc
        }),
        social_googleplay: new Achievement(
        {
            index: 100002,
            name: "Google",
            description: __("Blow leaves on your phone!"),
            is_progress: false,
            sprite: spr_icon_googleplay,
            claim_resources: 
            {
                gems: 5
            },
            levels: [1],
            value: false,
            section: global.dialog_sections.achievements.misc
        }),
        social_apple: new Achievement(
        {
            index: 100002.5,
            name: "Apple",
            description: __("Blow leaves on your phone!"),
            is_progress: false,
            sprite: spr_icon_apple,
            claim_resources: 
            {
                gems: 5
            },
            levels: [1],
            value: false,
            section: global.dialog_sections.achievements.misc
        }),
        social_steam: new Achievement(
        {
            index: 100003,
            name: "Steam",
            description: __("Blow leaves on your PC!"),
            is_progress: false,
            sprite: spr_icon_steam,
            claim_resources: 
            {
                gems: 5
            },
            levels: [1],
            value: false,
            section: global.dialog_sections.achievements.misc
        }),
        social_reddit: new Achievement(
        {
            index: 100004,
            name: "Reddit",
            description: __("Hello, /r/LeafBlowerRevolution!"),
            is_progress: false,
            sprite: spr_icon_reddit,
            claim_resources: 
            {
                gems: 5
            },
            levels: [1],
            value: false,
            section: global.dialog_sections.achievements.misc
        }),
        social_twitter: new Achievement(
        {
            index: 100005.5,
            name: "Twitter",
            description: __("Chirp, chirp."),
            is_progress: false,
            sprite: spr_icon_twitter,
            claim_resources: 
            {
                gems: 5
            },
            levels: [1],
            value: false,
            section: global.dialog_sections.achievements.misc
        }),
        social_wiki: new Achievement(
        {
            index: 100006,
            name: "Wiki",
            description: __("Game wiki maintained by awesome fans."),
            is_progress: false,
            sprite: spr_icon_wiki,
            claim_resources: 
            {
                gems: 5
            },
            levels: [1],
            value: false,
            section: global.dialog_sections.achievements.misc
        }),
        social_merch: new Achievement(
        {
            index: 100007,
            name: __("Merchandise Shop"),
            description: __("Yes, we have Borb cups."),
            is_progress: false,
            sprite: spr_borb,
            claim_resources: 
            {
                gems: 5
            },
            levels: [1],
            value: false,
            section: global.dialog_sections.achievements.misc
        }),
        social_yt: new Achievement(
        {
            index: 100008,
            name: "YouTube",
            description: __("Watch some leaf videos."),
            is_progress: false,
            sprite: spr_icon_yt,
            claim_resources: 
            {
                gems: 5
            },
            levels: [1],
            value: false,
            section: global.dialog_sections.achievements.misc
        })
    };
    _map(global.shops.printers, function(arg0, arg1, arg2)
    {
        var item_key = sprintf("printer_%s", arg1);
        variable_struct_set(global.achievements, item_key, new Achievement(
        {
            index: 2000 + arg0.index,
            name: sprintf("%s %s", arg0.resource.name, __("Printer")),
            sprite: spr_icon_printer,
            description: __("The Printer Cult rises"),
            claim_resources: 
            {
                gems: 1
            },
            levels: [10, 50, 100, 200, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000, 10000000000, 100000000000, 1000000000000, 10000000000000],
            printer: arg0,
            section: global.dialog_sections.achievements.printers,
            
            value: function()
            {
                return self.printer.data.count;
            }
        }));
    }, false);
    _map(global.unique_leaves, function(arg0, arg1, arg2)
    {
        var uleaf_key = sprintf("uleaf_%s", arg1);
        variable_struct_set(global.achievements, uleaf_key, new Achievement(
        {
            index: 3000 + arg0.index,
            name: arg0.name,
            description: sprintf("You have unlocked the %s", arg0.name),
            sprite: arg0.sprite,
            is_progress: false,
            claim_resources: 
            {
                gems: 3
            },
            levels: [1],
            uleaf: arg0,
            
            value: function()
            {
                return self.uleaf.data.count > 0;
            }
        }));
        uleaf_key = sprintf("upgrade_uleaf_%s", arg1);
        variable_struct_set(global.achievements, uleaf_key, new Achievement(
        {
            index: 100000 + arg0.index,
            name: __s("Upgrade %s", arg0.name),
            description: __("These upgrades looks useful. I should probably try to max them."),
            sprite: arg0.sprite,
            claim_resources: 
            {
                gems: 1
            },
            levels: [1, 5, 20, 50, 100, 150],
            uleaf: arg0,
            
            value: function()
            {
                return self.uleaf.data.level;
            },
            
            section: global.dialog_sections.achievements.upgradeables
        }));
    }, false);
    for (var i = 1; i <= global.tavern_games_curse_count; i++)
    {
        var curse_key = sprintf("cursemachine_%s", i);
        variable_struct_set(global.achievements, curse_key, new Achievement(
        {
            index: 11000 + i,
            name: __s("Curse %s cleared", i),
            description: __s("You have cleared Curse %s in the Curse Machine.", i),
            sprite: spr_icon_cursed_cheese,
            is_progress: false,
            claim_resources: 
            {
                gems: 3
            },
            levels: [1],
            course_id: i,
            
            value: function()
            {
                return variable_struct_get(o_game.data.stats.curse_game, self.course_id).won;
            }
        }));
    }
    _map(global.enemies_sorted, function(arg0, arg1, arg2)
    {
        var enemy_key = sprintf("enemy_defeated_%s", arg0.key);
        var _index = arg0.index;
        var _levels = [1, 5, 20, 50, 100, 300, 1000, 10000, 100000, 1000000];
        if (arg0.is_boss)
        {
            if (arg0.is_event_boss)
            {
                _levels = [1, 5, 20, 50, 100, 250];
            }
            else if (arg0.tower)
            {
                _levels = [1, 5, 20, 50, 100, 300, 1000, 10000, 100000];
            }
            else
            {
                _levels = [1, 5, 20, 50, 100, 300, 1000, 10000, 100000, 1000000, 10000000, 100000000];
            }
        }
        var desc = "";
        if (arg0.key == "boss_witch")
        {
            desc = __s("Cross the road, please, cross the road, please...");
        }
        variable_struct_set(global.achievements, enemy_key, new Achievement(
        {
            index: _index,
            name: __s("Defeat %s", arg0.name),
            description: desc,
            sprite: arg0.sprite,
            claim_resources: 
            {
                gems: 1
            },
            levels: _levels,
            enemy: arg0,
            
            value: function()
            {
                return self.enemy.data.defeated;
            },
            
            section: global.dialog_sections.achievements.enemies
        }));
    }, false);
    _map(global.shops.weapons, function(arg0, arg1, arg2)
    {
        var weapon_key = sprintf("upgrade_weapon_%s", arg1);
        variable_struct_set(global.achievements, weapon_key, new Achievement(
        {
            index: arg0.index,
            name: __s("Upgrade %s", arg0.name),
            description: __("This could be useful"),
            sprite: arg0.sprite,
            claim_resources: 
            {
                gems: 1
            },
            levels: [1, 5, 20, 50, 100, 150],
            weapon: arg0,
            
            value: function()
            {
                return (self.weapon.data.count > 0) ? self.weapon.data.level : 0;
            },
            
            section: global.dialog_sections.achievements.upgradeables
        }));
    }, false);
    _map(global.pets, function(arg0, arg1, arg2)
    {
        var pet_key = sprintf("upgrade_pet_%s", arg1);
        variable_struct_set(global.achievements, pet_key, new Achievement(
        {
            index: 200000 + arg0.index,
            name: __s("Upgrade %s", arg0.name),
            description: __("They may only work when I have them equipped, but I like seeing numbers go up."),
            sprite: arg0.sprite,
            claim_resources: 
            {
                gems: 1
            },
            levels: [2, 5, 20, 50, 100, 150, 170],
            pet: arg0,
            
            value: function()
            {
                return self.pet.data.level;
            },
            
            section: global.dialog_sections.achievements.upgradeables
        }));
    }, false);
    _map(global.equipment, function(arg0, arg1, arg2)
    {
        var equipment_key = sprintf("upgrade_equipment_%s", arg1);
        variable_struct_set(global.achievements, equipment_key, new Achievement(
        {
            index: 300000 + arg0.index,
            name: __s("Upgrade %s", arg0.name),
            description: __(""),
            sprite: arg0.sprite,
            claim_resources: 
            {
                gems: 1
            },
            levels: [1, 5, 20, 50, 100, 150],
            equipment: arg0,
            
            value: function()
            {
                return self.equipment.data.level;
            },
            
            section: global.dialog_sections.achievements.upgradeables
        }));
    }, false);
    var __struct = global.achievements;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        mitem.key = mkey;
        array_push(global.achievements_sorted, mitem);
        if (is_undefined(variable_struct_get(global.achievements_sections, mitem.section.key)))
        {
            variable_struct_set(global.achievements_sections, mitem.section.key, []);
        }
        array_push(variable_struct_get(global.achievements_sections, mitem.section.key), mitem);
    }
    array_sort(global.achievements_sorted, function(arg0, arg1)
    {
        return sign(arg0.index - arg1.index);
    });
    __struct = global.achievements_sections;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        sort_array_by_index(mitem, true);
    }
    global.achievement_ranks = 
    {
        newbie: 
        {
            index: 0,
            name: __("Newbie"),
            min_value: 1,
            sprite: spr_achievement_trophy_newbie,
            reward: 
            {
                resources: 
                {
                    gems: 50
                }
            }
        },
        novice: 
        {
            index: 10,
            name: __("Novice"),
            min_value: 10,
            sprite: spr_achievement_trophy_novice,
            reward: 
            {
                resources: 
                {
                    gems: 100
                }
            }
        },
        apprentice: 
        {
            index: 20,
            name: __("Apprentice"),
            min_value: 40,
            sprite: spr_achievement_trophy_apprentice,
            reward: 
            {
                resources: 
                {
                    gems: 150
                }
            }
        },
        expert: 
        {
            index: 30,
            name: __("Expert"),
            min_value: 100,
            sprite: spr_achievement_trophy_expert,
            reward: 
            {
                resources: 
                {
                    gems: 200
                }
            }
        },
        sage: 
        {
            index: 40,
            name: __("Sage"),
            min_value: 200,
            sprite: spr_achievement_trophy_sage,
            reward: 
            {
                resources: 
                {
                    gems: 250
                }
            }
        },
        legend: 
        {
            index: 50,
            name: __("Legend"),
            min_value: 280,
            sprite: spr_achievement_trophy_legend,
            add_scale: 1,
            reward: 
            {
                resources: 
                {
                    gems: 300
                }
            }
        }
    };
    add_keys_to_struct(global.achievement_ranks);
    global.achievement_ranks_sorted = struct_to_sorted_array_by(global.achievement_ranks, "min_value", true);
}

function get_completed_achievements_count()
{
    return _sum(global.achievements, function(arg0)
    {
        return arg0.is_completed() ? 1 : 0;
    });
}
