function init_guide()
{
    global.guide = [
    {
        name: __("General"),
        items: [
        {
            name: __("Welcome"),
            text: "Hey there, fellow blower!\n\nThis guide contains some helpful information about the features in the game. If you are looking for in-depth numbers, formulas, or calculations, please join the discord channel or visit the wiki.\n\nThank you for playing Leaf Blower Revolution!"
        }, 
        {
            name: __("How To Play"),
            text: "Move the player with your mouse (or tap the touch screen on mobile devices) and blow the leaves off the screen. You will be rewarded leaves for each blown leaf. These can be spent in the shops to buy tools, purchase upgrades, and more.\n\nOccasionally, fruits spawn in the area which can be collected for additional leaf rewards.\n\nDiscover rare leaves by unlocking new areas, and become the best blower in the world!\n\nImportant hotkeys:\n- Buy multiple upgrades by pressing Ctrl, Alt or Shift (on mobile, there's a button at the top right of a menu to change the buy quantity)\n- The space bar is used for some quick actions like crafting, refreshing trades and borbventures, and more"
        }, 
        {
            name: __("Leaves"),
            text: "In Leaf Blower Revolution, there are different types of leaves. These are the primary currency used to purchase upgrades and progress through the game.\n\nSome leaves have to be unlocked first before they can spawn."
        }, 
        {
            name: __("Printers"),
            text: "Printers add certain leaf types to your inventory each second. Printers work offline, and they require no maintenance (other than in real life).",
            
            is_obfuscated: function()
            {
                return !is_unlocked_printers(true);
            }
        }, 
        {
            name: __("Converters"),
            text: "Converters are machines that take some resources in order to produce others. Unlike Printers, they are required for progress.\n\nOperating\n- Converters are off by default. If Converter Start Bot is purchased in the BLC shop, then all converters with Auto start marked will be started automatically after each Reset.\n- By default Convert batch is enabled. This means that all multipliers to converters are applied automatically.\n- Converters work offline even though they are not shown on the Offline Rewards screen.\n- Static converters aren't affected by other converter upgrades. They can only be upgraded with an upgrade in the Gem Shop.\n- The Energy converter will keep going even when storage is full unless Safe Energy Converters is purchased from the Gems shop.",
            
            is_obfuscated: function()
            {
                return !is_unlocked_converters(true);
            }
        }, 
        {
            name: __("Seeds"),
            text: "Purchasing the first seed upgrade will make them start spawning in any location. When you pick up a seed, you are given (Seed upgrade level)% of your current leaf total in leaves. Further seed upgrades will increase the reward amount from seeds, from 1% up to 100%.\n\nExample:\n- If you have level 1 Seeds and 1,000 leaves, picking up a seed will give you 10 leaves (1% of 1,000).\nIf you have level 100 Seeds and 1,000 leaves, picking up a seed will give you 1,000 leaves (100% of 1,000).\n\nNote: some seeds have a lower spawn chance than others.",
            
            is_obfuscated: function()
            {
                return !is_unlocked_seeds(true);
            }
        }, 
        {
            name: __("Materials"),
            text: "Materials are items with a low chance to appear each Cycle and are unlocked in the BLC Shop. They have a wide range of uses, most notably in Quests, Alchemy, and upgrading Tools/Pets/Unique Leaves.\n\nMaterials collected appear in a new tab on the top bar. Hover over a material to see its spawn location, spawn chance, materials per hour, and current quantity. The quantity also shows the max quantity, ie. your current material storage capacity.\n\nMaterials DO NOT despawn. There can only be 50 on screen at one time, then all materials will stop spawning until some/all are collected. A specific material will not spawn if your storage for that material is full. All materials begin with a base spawn chance of 0.50%.\n\nMaterial Inspector from the BLC Coin Shop shows each material's spawn location and chances in their descriptions.",
            
            is_obfuscated: function()
            {
                return !is_unlocked_materials(true);
            }
        }, 
        {
            name: __("Pets"),
            text: "Pets play a significant role to progress. They are your cute and cuddly companions throughout the game.\n\nPets provide powerful bonuses for almost all sections in the game. They have to be unlocked first with BLC coins.\n\nAll pets can be upgraded. They will gain +10% of their original bonus per level. This lasts until level 10, when they gain a total of +100% to their bonus effect, effectively doubling it.\n\nPets also gain +Blowing Enemy Damage% after level 10 (starting at +5k% at level 10).\n\nTo pet a Pet, while not in a menu, click/tap on your equipped pet. If successfully petted, the pet will do a backflip to indicate how happy it is! There is a 60 second cooldown before you can next pet each pet.",
            
            is_obfuscated: function()
            {
                return !is_unlocked_pets();
            }
        }, 
        {
            name: __("Trading"),
            text: "Trading can be a good source of additional resource income. For each completed trade, you will also receive one cheese.\n\nBy default, you are presented with 2 trades that refresh every 5 minutes. Trades can be manually refreshed for the price of some Cheese.\n\nThe idea behind trading is converting one type of resource into another at a favorable rate. For example, Gold Leaves might be easier to come by than Strange flasks, so trading one into the other can be beneficial.\n\nHigher trade levels give you better trades, by reducing the input costs and increasing the rewards. Trade levels are increased with the Trading Education upgrades.",
            
            is_obfuscated: function()
            {
                return !is_unlocked_trading(true);
            }
        }, 
        {
            name: __("Unique Leaves"),
            text: "Unique Leaves are special leaves that are unlocked with BLC Coins, can only be obtained under certain conditions, and can give good buffs to certain stats.\n\nUnique Leaves have their own designated button and menu. Buffs of Unique Leaves have to be manually toggled in that menu. Depending on the Greedy Uniques upgrade in the BLC shop, you can only have a certain amount of buffs active at a given time. After a Mega Leaf Crunch all unique buffs will be disabled, unless the Crunchy Uniques upgrade is bought in the MLC Shop.\n\nWhen the unlock conditions are met, the leaf will spawn. Blow it offscreen. If desired, you can switch tools while blowing it offscreen. Blowing Power does not matter — it will still move slowly, and even Shovels and Trouts work.",
            
            is_obfuscated: function()
            {
                return !is_unlocked_unique_leaves();
            }
        }, 
        {
            name: __("Artifacts"),
            text: "Artifacts can be consumed in order to gain resources or other benefits. Some Artifacts are unlocks rather than consumables however.\n\nFor your first artifacts, you can wait in an area, but you'll be playing blind. The best approach is to unlock The Compass (in Neighbor's Garden), as it shows where to find other artifacts. Next, get the Time Crystal (in Space), which shows when artifacts will spawn. Both sets of info will then be in the Artifacts menu.\n\nNote: Changing your computer's clock may prevent artifacts from spawning.\n\nOffline Artifacts are gained every 2 offline cycles, for example, 12 consecutive offline hours for the Orb of BLC. Spawn rate does not affect the length of the cycle - it affects offline gains, for example, with 50% spawn time decrease you'll gain twice the normal amount of artifacts per 2 cycles.\n\nNote: You need to collect the artifact first before being able to get them offline.",
            
            is_obfuscated: function()
            {
                return !is_unlocked_artifacts(true);
            }
        }, 
        {
            name: __("Equipment"),
            text: "Equipment serve as permanent buffs to the player and are not lost after Resets. Except for the Zoo Ring, more than one of each equipment can be obtained to increase the bonus.\n\nSources\n- Dropped when enemies are killed in The Leaf Tower.\n- Prizes from the Borb Claw Machine.\n- Chance from Shovelling as long as the item has already been found at least once since the last Prestige.\n\nAll equipment can be upgraded. Upgrading increases the bonus, up to doubling at level 10. Each equipment level also increases blower enemy damage%.",
            
            is_obfuscated: function()
            {
                return !is_unlocked_equipment();
            }
        }, 
        {
            name: __("Challenges"),
            text: "Challenges have different amounts of rewards depending on the difficulty of the challenge.\n\nIndividual completed challenge bonuses are ONLY rewarded the first time you complete the challenge. You will not receive multiple completions bonuses for completing challenges multiple times.\n\nRe-doing a challenge DOES reward medals, but at a reduced amount, until zero medals will be rewarded for additional completions.\n\nGem Shop upgrades are applied to most challenges.\n\nThe medals gained from completing challenges can be used to unlock furniture in the House. Each item purchased in the House will give +25% to all leaf rewards.\n\nNote: Your current progress will not be reset when starting a challenge. You can pause and resume a challenge at any time.",
            
            is_obfuscated: function()
            {
                return !is_unlocked_challenges();
            }
        }, 
        {
            name: __("Alchemy"),
            text: "Alchemy is used to brew artifacts, equipment items, materials, scrolls, and other resources. Each recipe deducts a fixed amount of materials/resources and adds the output to your inventory.\n\nRecipes have to be unlocked first before you can use them. Brewing a recipe takes some time but the duration can be decreased with upgrades, pets and unique leaves.\n\nIt is also possible to brew recipes automatically with the relevant upgrade.\n\nOffline brewing of recipes can be unlocked with the relevant upgrade in the Gem Shop.\n\nIf a critical brew occurs, the output is doubled. Multi-crits can only occur when crits occur. When both happen, the output is tripled instead of doubled. The chance of a multi-crit is your Brew Multi-Crit Chance bonus plus any additional amount of normal crit chance that is over 100%. For example, if the crit chance is 150% and the multi-crit bonus is 10%, then the total multi-crit chance is 60%.\n\nEach successful multi-crit reduces the multi-crit chance by 100%. For example, if the crit chance is 250%, multi-crit chances are 150% -> 50%.",
            
            is_obfuscated: function()
            {
                return !is_unlocked_alchemy(true);
            }
        }, 
        {
            name: __("Scrolls"),
            text: "Scrolls provide temporary boosts. They are dropped by bosses in the The Leaf Tower or from Rare Chests and above. Alternatively, you can get them from the Borb Claw Machine and Slot Machine in the The Cheese Pub.\n\nThe usage of concurrent scrolls is limited, though. The limit can be increased with upgrades. If you would like to use a different scroll, you can cancel an active scroll.\n\nScrolls persist after performing a Mega Leaf Crunch.",
            
            is_obfuscated: function()
            {
                return !is_unlocked_scrolls(true);
            }
        }, 
        {
            name: __("Relics"),
            text: "Relics can be obtained from bosses and alchemy. Relics provide significant bonus to Blowing Damage and Sacred Leaves. To power the relic you need to have Leafscended leaves of the matching type and level.\n\nExample:\n- Common Basic Relics are powered with L1 Leafscended Basic Leaves\n- Uncommon Gold Relics are powered with L2 Leafscended Gold Leaves\n- Rare Platinum Relics are powered with L3 Leafscended Platinum Leaves\n- ... and so on\n\nLeaves that don't spawn (Celestial, Obsidian, Benitoite, Ancient, Gem leaves) provide x5 bonus to Blowing Damage.",
            
            is_obfuscated: function()
            {
                return !is_unlocked_relics();
            }
        }, 
        {
            name: __("Leafscension"),
            text: "Leafscensions are unlocked along with Relics. Ascended leaves are the main source of Relics' power.\n\nLeafscensions to Level 1 require 1e300 leaves of matching type and cannot be changed. Leafscensions to Levels 2-6 require basic amount of 30 leaves of the previous tier and can be reduced with pets, unique leaves, and upgrades from the shops.\n\nLeafscensions are separated into multiple levels. Leafscended leaves correlate to their respective relic.",
            
            is_obfuscated: function()
            {
                return !is_unlocked_leafscension();
            }
        }, 
        {
            name: __("Banks"),
            text: "Deposit soul resources to passively gain random cards of bosses from the selected galaxy.",
            
            is_obfuscated: function()
            {
                return !is_unlocked_banks();
            }
        }, 
        {
            name: __("Mines"),
            text: "Coal Veins\nUncover Coal Veins which can be mined a limited number of times, after which point it will become unusable and need to be removed. When mining a coal vein, you will obtain rewards depending on it's quality and rarity. You can also spend resources to upgrade the level of the coal veins you will find, which can unlock new resources and increase the amount of resources the veins yield.\n\nCoal Mines\nMines consist of caves which can be mined (at a cost) for a wide variety of resources and mine items. Each mine is randomly assigned a rarity and level which will decide the amount and which type of resource you get from the caves, as well as how expensive it is to start mining. Once the relevant upgrade is purchased, mines can also be drilled for additional resources at a slower (and diminishing) rate.\n\nCrafting\nOnce you have found an item in the mine, more can be crafted using Coal Diamonds. Higher rarities of items will require more resources to craft but will give a larger stat bonus. Multiple copies of the same item can be ascended into a higher rarity. The amount of copies required for ascension increases progressively with rarity.\n\nDepth Drill\nBy adding Fuel to the Depth Drill, the drill passively mines deeper and deeper, granting unique bonuses and increasing mine item power in the process. The deeper it goes, the larger the bonuses will be. Additionally, Coal Time Spheres can be used to skip 30 seconds of drilling instantly without using any fuel.",
            
            is_obfuscated: function()
            {
                return !is_unlocked_mines();
            }
        }, 
        {
            name: __("Soul Forge"),
            text: "After unlocking the Soul Forge, Empty Soul Leaves are generated passively in any area or while offline. Once you have a certain amount of empty soul leaves, they will fill/convert into normal Soul Leaves. Information about your passive empty soul leaf generation, requirements to fill them, and the amount of soul leaves you earn per fill cycle is available in the Soul Forge Area in Soul Realm.",
            
            is_obfuscated: function()
            {
                return !is_unlocked_soul_forge();
            }
        }, 
        {
            name: __("Quarks"),
            text: "Quark Reactor - Harness the power of the cosmos itself. Gather reactor energy and unleash it on quarks for maximizing your quark damage. Quark damage is needed to break the quark shield of enemies in the Quark Ambit. Once their shield is broken, their health can be brought down as normal to defeat them.\n\nThe Quark Reactor energy is being filled automatically over time. The higher the quark energy is, the higher the chance to add a Quark. Quark Leaves are required to add quarks.\n\nPerform a Quarkstige to get Quantum Blobs. All Quarks will be reduced but each Quantum Blob multiplies quark damage and quark add chance.",
            
            is_obfuscated: function()
            {
                return !is_unlocked_quarks();
            }
        }, 
        {
            name: __("Shadow Crystal"),
            text: "The player and crystal both attack once each, speed determines who attacks first. The chance of attacking first is based on the speed relative to the combined total of the player's and crystal's speed, and is shown next to the speed value.\n\nResistance divides incoming damage, the percentage of damage blocked is shown next to the value. When the player rests, the crystal also rests and replenishes 20% of it's health.\n\nThe strength gained by throwing resources into the shadow pit is reduced each time. Ascending resets this diminishment but the pit strength is kept. The next ascension strength requirement is based on strength gained in the current ascension, not overall strength.",
            
            is_obfuscated: function()
            {
                return !is_unlocked_shadow_crystal();
            }
        }]
    }, 
    {
        name: __("Tools"),
        
        is_obfuscated: function()
        {
            return !is_gt(global.resources.leaves.data.collected_total, 30);
        },
        
        items: [
        {
            name: __("Leaf Blowers"),
            text: "Leaf blowers - your trusty tools to blow leaves. With a variety of different types and models to choose from, each with their own unique strengths and weaknesses, you'll need to carefully select the right tool for the job.\n\nAs you progress through the game, you'll have the opportunity to upgrade your tools, which will provide powerful bonuses."
        }, 
        {
            name: __("Shovels"),
            text: "Shovels can dig up resources and other items. Click/Tap to dig. All shovels have a cooldown indicated by a cyan progress bar displayed above the player.\n\nShovels can be upgraded at a later stage. Some shovels dig up better items."
        }, 
        {
            name: __("Swords"),
            text: "Swords can be used to 'make' resources from other resources. For example, the Leaf Sword makes mulch out of leaves (available after unlocking a certain upgrade)."
        }, 
        {
            name: __("Trouts"),
            text: "Trouts can be used to slap enemies. Click/Tap to slap. Depending on the slap range, you have to move the player close to an enemy to hit them.\n\nTrouts deal 10% of the base damage to bosses."
        }]
    }, 
    {
        name: __("Prestige"),
        
        is_obfuscated: function()
        {
            return o_game.data.stats.prestige == 0;
        },
        
        items: [
        {
            name: __("Prestige"),
            text: "The Leaf Portal can be used after purchasing Unlock Leaf Portal from the Gold Shop. Entering results in a Prestige in which you restart your progress and earn Prestige Coins based off of how many leaves you've collected.\n\nPrestiging resets leaves and flasks, but you will be rewarded valuable coins that you can use to purchase useful upgrades in the Coins Shop.\n\nAt least 30 Coins is recommended for your first prestige."
        }, 
        {
            name: __("Big Leaf Crunch"),
            text: "Enter the Big Leaf Crunch portal to restart your Blowing journey with some BLC coins.\n\nThe Big Leaf Crunch, referred to as Crunching, is a more powerful Reset, unlocked from the Black Science Shop.\n\nWhen you enter the portal, you earn BLC coins. You can earn more BLC coins per crunch by getting certain upgrades from the Exotic and Strange Flask shops.\n\nBig Leaf Crunch resets leaves, flasks and prestige coins.",
            
            is_obfuscated: function()
            {
                return !is_unlocked_blc_text();
            }
        }, 
        {
            name: __("Mega Leaf Crunch"),
            text: "The Mega Leaf Crunch (MLC) is the third prestige layer, referred to as Mega Crunching. When you mega crunch, you earn MLC coins.\n\nAfter unlocking Floor 101, it becomes possible to MLC at any given time. This first requires that you defeat Evil Bob in The Leaf Tower at Floor 100, however Evil Bob does not need to be defeated every time if the Crunchy Tower Gem Shop or MLC Shop upgrade is owned.\n\nThe amount of MLC Coins is based on the highest boss floor you have cleared in The Leaf Tower, your current amount of BLC Coins, Shop Upgrades, and bonuses from crafted leaves.\n\nMega Crunching resets leaves, flasks, and tokens. A lot of things can be preserved through the reset if you have purchased the appropriate upgrades.",
            
            is_obfuscated: function()
            {
                return !is_unlocked_mlc();
            }
        }, 
        {
            name: __("Ultra Leaf Crunch"),
            text: "The Ultra Leaf Crunch (ULC) is the most powerful reset, referred to as Ultra Crunching. When you ultra crunch, you earn ULC Coins and unlock the ability to enter Umbral Cluster areas.\n\nULC becomes available after defeating the Weaver of Worlds boss at the Primordial Ethos area 20 times.\n\nThe Crunch Portal menu shows a list of things that will be reset, as well as some sacrifices that will increase your ULC coin reward. At first you will need to select all of the sacrifices to be reset in order to ULC, though upgrades are available later to reduce the required number of sacrifices (sacrifices not selected will not be reset or give ULC coins).\n\nAs well as providing additional coins based on their own amount, each sacrifice selected will give an additional 5% multiplier to the coin reward.",
            
            is_obfuscated: function()
            {
                return !is_unlocked_ulc();
            }
        }]
    }, 
    {
        name: __("Areas"),
        
        is_obfuscated: function()
        {
            return !is_unlocked_areas();
        },
        
        items: [
        {
            name: __("General"),
            text: "You can travel to different Areas for different kinds of leaves. Unlock Area must first be purchased in the Coins shop, and then each individual area must be unlocked under Areas.\n\nFruits and Seeds can spawn in other areas outside of those where their leaves can be found."
        }, 
        {
            name: __("The Leaf Tower"),
            text: "The Leaf Tower is an area where you fight ever more challenging enemies as you clear each floor. Your ALBs aren't allowed in the Leaf Tower without a special upgrade, so starting out it's just you and your leaf blower versus the Tower.\n\nDefeat enemies in order to advance to the next floor. There is a Tower Boss every 10 floors.\n\nAs you go higher, the enemies become more and more difficult to defeat before they expire. If an enemy in the Leaf Tower expires, it deals damage that scales with the floor you're on.\n\nDefeating enemies causes them to drop Silver Tokens, which can be spent in the Silver Token Shop for upgrades. Enemies drop Tokens depending on Current Tower Level and Reduced Enemy Rewards (only applies after purchasing More Tower Rewards in Gold Tokens Shop).\n\nDefeating Tower Bosses causes them to drop Gold Tokens, which can be spent in the Gold Token Shop for upgrades.",
            
            is_obfuscated: function()
            {
                return !call_method(global.areas.tower, global.areas.tower.check);
            }
        }, 
        {
            name: __("Your House"),
            text: "The house is an area where you can decorate your home with several items.\n\nEach purchased item provides +25% to all Leaf rewards. Some items provide special bonuses.\n\nTo access the house items, click the House button at the top right of the screen. House items can be unlocked with medals which can be acquired via challenges.",
            
            is_obfuscated: function()
            {
                return !call_method(global.areas.house, global.areas.house.check);
            }
        }, 
        {
            name: __("The Cursed Pyramid"),
            text: "The Cursed Pyramid is a dungeon area that consists of two areas:\n\n- The Cursed Pyramid: Used to unlock more pyramid floors\n- The Inner Cursed Pyramid: Defeat enemies until a boss appears who drops Ancient Leaves and has a chance to drop Chests.\n\nEach subsequent floor requires a greater sacrifice. The price to unlock any given floor of The Inner Cursed Pyramid is given by the following formulas:\n\nUnlike The Leaf Tower, after defeating a floor in the Inner Pyramid, the next floor is not unlocked and requires more resources sacrificed at The Cursed Pyramid for more floors to be unlocked. It is also not required to defeat prior floors before entering a lower floor.",
            
            is_obfuscated: function()
            {
                return !call_method(global.areas.inner_pyramid, global.areas.inner_pyramid.check);
            }
        }, 
        {
            name: __("Leafton Pit"),
            text: "The Leafton Pit is the final area in Quark Ambit which features an enemy rush mechanic. The goal is to defeat as many enemies as possible in a set period of time. Once the time runs out, you will be rewarded resources and milestones based on how many enemies were defeated and how difficult the selected floor is.",
            
            is_obfuscated: function()
            {
                return !is_unlocked_leafton();
            }
        }]
    }, 
    {
        name: __("Borbventures"),
        
        is_obfuscated: function()
        {
            return !is_unlocked_borbventure() || o_game.data.stats.prestige_mlc == 0;
        },
        
        items: [
        {
            name: __("General"),
            text: "Boost your stats with Borbventures! Recruit and send out borbs and they will return with items galore.\n\nTo begin your Borbventures you first need to obtain some Borb Juice either by using the Borb Sword Tool on Borbs or by converting Borbs.\n\nThe Juice can then be converted into Borb Tokens until you have at least 100. Now you can recruit your first Common Borb in the Borbs Tab and send it to a Borbventure.\n\nTake the lowest level Borbventure and click one of the two white squares to add your Borb. If you have enough Borb Tokens you can start the Borbventure. For a better success chance you can either add a second Borb or upgrade your Borbs."
        }, 
        {
            name: __("Borbventures"),
            text: "In the Borbventures Tab you can send your Borbs on adventures to find resources, items and consumables.\n\nTo start an adventure you need to have the number of Borb Tokens to the left of the blue arrow and one or two Borbs selected in the white Squares. After some minutes, you can finish the adventure and get the items to the right of the blue arrow if succeeded.\n\nNote: you can't finish item quests if your inventory is full, but you can still cancel it without getting a reward.\n\nWhen all Borbventures are done you can generate new Borbventures in exchange for some Borb Juice."
        }, 
        {
            name: __("Borbs"),
            text: "Borbs and Special Borbs begin their Borbventure-Life as Level 1 common Borbs and gain Experience by finishing Borbventures.\n\nWith enough Experience and some Borb Juice they can be upgraded to Level 10 and then ascended to Level 1 of the next rarity for the cost of some Ascension Juice.\n\nUpgraded/Ascended Borbs have a higher Borbventure success chance.\n\nWhen recruiting Borbs, it is possible to recruit a special Borb with unique properties. Special Borbs need to be unlocked in the Borbventure Shop first."
        }, 
        {
            name: __("Crafting"),
            text: "Items can also be crafted using Borb Runes. The cost of crafting specific item is increased, but it can be further reduced down through upgrades.\n\nMultiple copies of the same item can be ascended into a higher rarity. The amount of copies required for ascension increases progressively. The Number of copies can be further reduced with upgrades."
        }]
    }, 
    {
        name: __("Cards"),
        
        is_obfuscated: function()
        {
            return !is_unlocked_cards() || o_game.data.stats.prestige_mlc == 0;
        },
        
        items: [
        {
            name: __("General"),
            text: "Boost your stats with Cards!\n\nDefeating an enemy has a chance to drop a card of their own type, in one of 6 possible rarities, from Common to Legendary.\n\nEvery collected card provides a bonus. Higher rarities give more and stronger bonuses. Many cards also provide unique bonuses exclusive to certain basic enemies and certain bosses.\n\nUp to 10 cards can be collected per enemy per rarity (eg. 10 Common Bee + 10 Uncommon Bee, etc.), this can be increased with the 'Max Cards' upgrade in the Transcended Card Part shop.\n\nCards can also be salvaged into Card Parts."
        }, 
        {
            name: __("Card Parts"),
            text: "Card Parts are unlocked when Cards are first unlocked. They can be collected by defeating any enemy, having a 1.5% chance to drop a card part, it's also possible to have defeated enemy drop a card part if a card that you have max cards of were to spawn.\n\nThese parts are used to buy Card Packs and Ascend cards."
        }, 
        {
            name: __("Card Packs"),
            text: "Basic Cards may also be obtained through card packs purchases with Card Parts or Gems. The Cards Pack in the Supporter Shop also gives card packs as daily rewards.\n\nIf you already have the maximum of a card gained from a card pack, you'll instead be compensated with 1/10th the card part cost of the opened pack."
        }, 
        {
            name: __("Ascension"),
            text: "10 cards of the same enemy and rarity may be consumed to gain 1 card of the same enemy at the next-higher rarity. This process is known as Ascension. Ascension is disabled for a given card if there is not enough room in your deck to add the ascended card."
        }, 
        {
            name: __("Transcension"),
            text: "You can transcend cards of the same type and rarity and gain Transcension Card Parts. Transcending a card requires 10 initially and increases by 1 for the transcended card (eg. Transcending a common frog will increase the cost for the next common frog to 11). If a card has enough to transcend the button turns purple. These parts can be used in the Transcend Shop found in the Cards Menu.\n\nThere are two options given for mass transcension: Transcend Regular which refer to Basic Enemy and Tower Boss cards, and Transcend Boss which refer to Non-Tower Bosses or timer Bosses.\n\nMass transcension will transcend all cards that are capable of transcending and are not locked within that category and rarity once, leaving extra cards if the amount of transcended cards is less than what is currently collected.\n\nIncreasing Card Limit\nFor each 30 total transcensions of a given rarity, the card limit of every card of that rarity increases by 1. Furthermore, buying Max Cards upgrade in the Transcend Shop increases the card limit for every card by 1 per level.\n\nAuto transcend cards will automatically transcend cards when available. Locked cards will not be transcended."
        }]
    }, 
    {
        name: __("Crafting"),
        
        is_obfuscated: function()
        {
            return !is_unlocked_crafting(true);
        },
        
        items: [
        {
            name: __("Crafting"),
            text: "Spending Cheese allows you to craft a leaf into an available slot via a mini-game. When the white bar is stopped, a leaf is created of a random type, with a random RNG quality, and a craft quality dependent on how close the white bar is to the green bar in the center.\n\nThe leaf is also given a random set of properties; the number of properties a crafted leaf has, and the power of their buffs, are determined by its type, RNG quality, and craft quality. In addition, certain properties can only appear on higher-tier leaves.\n\nUnwanted leaves can be salvaged to gain Cheese.\n\nIf the crafting inventory is full, additional crafted leaves will be placed in the backpack instead. Leaves can be moved freely between the backpack and the inventory, and leaves in the backpack will not provide buffs."
        }, 
        {
            name: __("Ascend"),
            text: "Once a leaf reaches a certain level, it can be ascended up to ten times for a scaling amount of Ancient Leaves. Ascending a crafted leaf will make it much stronger, but will return it to level 1 and increase its upgrade cost. Ascending will reroll the craft leaf's RNG quality."
        }, 
        {
            name: __("Shards"),
            text: "Shards can be applied to a crafted leaf to boost its properties. When applying shards, you can either:\n\n- Pay 1 shard to boost a random property\nOR\n- Select a single property to boost, but at a greatly increased cost.\n\nShards can also be rerolled and rerolling a leaf's regular properties will return all Shards added to it (including the number of selection shards).",
            
            is_obfuscated: function()
            {
                return !is_unlocked_shards();
            }
        }, 
        {
            name: __("Transformation"),
            text: "Singular properties can be rerolled in the Transformation tab. Transformation Shards are required for Ancient Leaves leaves and higher. Note that doing this will not return any shards that were spent on buffing a transformed property.\n\nTransformation - Target Property\nIn the late game after fulfilling certain requirements, an option to spend 10x the regular cost to Reroll a Property becomes available. You first have to unlock the Properties, but the process is random.",
            
            is_obfuscated: function()
            {
                return !is_unlocked_transformation_shards();
            }
        }, 
        {
            name: __("Fusion"),
            text: "Fusion lets you combine 6 leaves of a given type to create 1 leaf of the next type (eg. 6x Ancient = 1x Sacred). The new crafted leaf will have random properties, and have a craft quality of 1%.\n\nSome leaves can only be created from fusion, and require Fusion Shards to do so.",
            
            is_obfuscated: function()
            {
                return !is_unlocked_fusion_shards();
            }
        }]
    }, 
    {
        name: __("Dice"),
        
        is_obfuscated: function()
        {
            return !is_unlocked_dice();
        },
        
        items: [
        {
            name: __("General"),
            text: concatstr(__s("Discover various dice types of different rarities. Each die provides unique upgrades. Roll a die for better upgrade values. The higher the average roll value is, the higher the bonus value will be (taking the highest average of %s consecutive rolls into account)., ", 5), "\n\n", __s("Rolling a die costs %s. You can acquire more by visiting %s or defeating enemies in the %s.", __("Dice Points"), __("Dicey Meadows"), __("Dice Battlefield")), "\n\n", __s("When a die drops with the same type and rarity you already have in your dice bag, its count will be increased. A higher count is needed for power rolls which require %s. Power roll a die for double the value to achieve a higher average count.", __("Power Dice Points")), "\n\n", __s("Each die can be enhanced with more dice and sides. Each die enhancement increases the number of dice that will be rolled for the relevant die, each side enhancement increases sides."), "\n", __s("For example, a regular die consists of 1 die and 6 sides (1d6), so the min/max roll value is 1-6. After enhancing the die with a dice count upgrade (2d6), the min/max roll value is 2-12. A side enhancement increases the side count (2d7), the min/max roll value is 2-14."), "\n\n", __s("Note that the dice count in the title is different than the dice count from the dice enhancements."))
        }, 
        {
            name: __("Dice Battlefield"),
            text: concatstr(__s("Roll dice against leafy enemies to gain upgrades. These enemies occasionally drop dice. Defeat the same enemy a couple of times will increase the bonus value and you can progress to the next one. Note that you need to have the respective leaf unlocked to battle it."), "\n\n", __s("Dice enemies have different difficulties. Defeat an enemy for the required number to unlock the next difficulty. These enemies are harder but provide more powerful bonuses."), "\n\n", __s("Occasionally, a die might drop into your dice bag when an enemy was defeated. Higher enemy levels and difficulties will drop higher dice rarities."))
        }, 
        {
            name: __("Cursed Dice"),
            text: concatstr(__s("Roll the %s as many times as you like, but beware of the %s! Do not roll a %s or your roll score will be reset. It's up to you to take a risk and roll a higher score or save it.", __("Cursed Die"), __("Cursed Cheese"), 6), "\n\n", __s("The more you saved and the higher your max saved score is, the better bonuses you'll get. Some bonuses might be locked which are displayed with question marks until you have unlocked it in the main game."), "\n\n", __s("With a bit of luck, you can also roll a critical die which multiplies the roll value by the critical multiplier bonus value."), "\n\n", cursed_speech(__s("All your dice are belong to me!")))
        }]
    }, 
    {
        name: __("Online Seasons"),
        items: [
        {
            name: __("General"),
            text: "In Online Seasons, you can compete in the leaderboard to win trophies. You start with a 'fresh' season character and compete with other players. An online season has a fixed start and end date.\n\nDepending on the season, the main goal might be different. For example, the player who reached the highest floor in The Leaf Tower wins. Once a season ends, you will be able to salvage your season character into your main game for attractive rewards. Additionally, you will be able to claim season rewards depending on your final rank.\n\nIMPORTANT NOTE:\nThe use of any macros/autoclickers/cheat engine is strictly prohibited and will result in a permanent ban across all current and future seasons. All Honor investments from cheating players will be deducted from their guild(s)."
        }, 
        {
            name: __("How To Play"),
            text: "To play an online season or challenge, you need to register a Humble North account. If you already have an account, open the Account menu, click on Season & Challenges, choose either View Seasons or View Challenges and select 'Play'.\n\nIf a season or a challenge is active, your character will be loaded and you can compete with other players. Your character will automatically be saved and uploaded. You can check the last character save in the accounts menu."
        }, 
        {
            name: __("Guilds"),
            text: "Guilds are exclusive to online seasons only. Here's how they work:\n- Everyone can create or join guilds which cost some Honor. Guild owners can kick members but they won't be able to leave their guild.\n- Honor can be earned by claiming daily rewards or by defeating area bosses. Claiming supporter packs will reward some honor, too.\n- Guilds can be upgraded by investing Honor. The investment count is capped depending on the season settings, for example, 20 investments per day, 400 total guild investments per day.\n- The higher the guild level, the better the upgrades.\n- Guild upgrades are applied automatically.\n- Certain upgrades are unlocked after reaching a higher guild level, for example, +1 max pet at guild level 10.\n- Honor can also be converted into season gems.\n- Kicked members retrieve their honor back, and the Guild's honor will be decreased by the invested amount.\n- Guild upgrades are available up to level 65.\n- Kicked members get back all their invested honor via the Claimable Rewards button in the account gateway."
        }]
    }, 
    {
        name: __("Nature Season"),
        
        is_obfuscated: function()
        {
            return get_default_struct_value(global.events.nature_season.data, "active_count", 0) == 0 && !is_event_active(global.events.nature_season);
        },
        
        items: [
        {
            name: __("General"),
            text: "Get ready to immerse yourself in a world of greenery as you plant flowers, add water, fertilize, and gain new bonuses. Discover plant synergies to further boost their bonuses.\n\nYou'll also earn Season XP as you progress through each level, allowing you to unlock new and exciting rewards.\n\nBut that's not all - you can also breed butterflies to increase your plant XP and progress faster. Don't miss the chance to fight the Doomed Tree and earn exclusive nature season loot."
        }, 
        {
            name: __("Plants"),
            text: "Crops can be planted on the farm field. Each plant takes some time to grow. Once they're grown, they provide useful bonuses.\n\nYou may leave the plants in place or you can harvest them. Harvesting a plant rewards you with Nature XP as well as Nature Gems. The rarer the plant, the better the rewards.\n\nPlants can also be watered so they grow faster. The water value decreases after time. Good thing that we have an infinite amount of water!\n\nAdditionally, plant fields can be enchanted with Magic Mulch. The higher the enchant level, the better the harvest XP and the better the plant and butterfly bonuses."
        }, 
        {
            name: __("Synergy"),
            text: sprintf("Take advantage of plant synergies to increase the bonuses of neighboring plants!\n\nFor example, if a Pansy flower is fully grown in plant field #2 and a fully grown Hyacinth flower is planted in field #3, the Hyacinth flower receives a small increase in their provided bonus.\n\nHowever, if two plants of the same type are placed besides each other, the bonus is decreased by %s.\n\nNote: Synergy bonuses are only applied to the left and right neighboring plants. You also have to buy the synergy upgrade first.", number_format_percent(0.33))
        }, 
        {
            name: __("Butterflies"),
            text: "Butterflies can be bred on the Butterfly Field. Similar to plants, they provide unique bonuses once fully bred.\n\nHowever, butterflies need plants on the same position to breed. For example, a butterfly on field #1 can only breed when a plant is fully grown on field #1.",
            
            is_obfuscated: function()
            {
                return !is_unlocked_butterflies();
            }
        }, 
        {
            name: __("Vial of Life"),
            text: "The Vial of Life spawns plant crops after its progress is completed. Once collected, you can plant these crops in the farm field.\n\nThe vial also progresses further if you're in a different area. If the progress is completed, the vial will add a crop charge and the timer will be reset if there are free charges. When you return back to the area, the crops are spawned immediately and the charges are decreased.\n\nWhenever a seed is released from the vial, a 3- or 4-leaf-clover may spawn as well. These can be used to complete season quests."
        }, 
        {
            name: __("Nature Time Sphere"),
            text: "These spherical spheres are special items that can be collected to advance the growth of plants and butterflies, and they also reduce the enchant field timer.\n\nYou can obtain Nature Time Spheres by completing quests, embarking on borbventures, or receiving them as seasonal rewards.",
            
            is_obfuscated: function()
            {
                return global.resources.nature_time_sphere.data.collected_total == 0;
            }
        }]
    }, 
    {
        name: __("Account"),
        items: [
        {
            name: __("General"),
            text: "A Humble North account opens up a world of possibilities and benefits. Here are some of the exciting things you can do with a cloud account:\n* Cross-Play saves: enjoy the convenience of cross-platform compatibility (Steam, Opera GX, Android, iOS)\n* Game progress backup: protect your game progress from device issues or reinstalling the game\n*Get claimable rewards: you may receive rewards occasionally\n*Participate in online seasons and online challenges"
        }, 
        {
            name: __("FAQ"),
            text: "* I can't log in to my Humble North account\nAfter registration, you'll receive a confirmation email with a verification link. Please also check your spam folder. If you verified your email address and you are still unable to log in, reset your password and try again. If there is a game update available, update to the latest version.\n\n* How can I transfer my progress to other devices?\nYou need a Humble North account for this:\n- Register an account via the ingame account dialog, verify your email address, log in.\n- In the account dialog, click on Cloud Saves and choose a cloud slot.\n- You can now load your progress on other devices using Load cloud save #x\nGood to know:\n-- Your progress will be saved every 5 minutes to the cloud\n-- If you want to quit the game, use the \"Save & Quit\" button in the options menu. The progress will be saved and pushed to the cloud. The game will quit after the transfer was completed.\n-- Make sure the option Upload save to cloud option is enabled under the Misc tab in the options menu."
        }]
    }];
    var __array = global.guide;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        mitem.key = mitem.name;
        var __array2 = mitem.items;
        var __prop_len2 = array_length(__array2);
        for (var __i2 = 0; __i2 < __prop_len2; __i2++)
        {
            var mitem2 = __array2[__i2];
            mitem2.key = mitem2.name;
        }
    }
}
