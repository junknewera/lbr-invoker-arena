function init_lore()
{
    global.lore_sorted = [];
    global.lore = 
    {
        start: new Lore(
        {
            index: 0,
            
            check: function()
            {
                return true;
            },
            
            name: "The Journey Begins",
            description: "Well, it's that time of year again; the leaves are starting to fill up the yard, so I've been out there getting rid of what I can. It's the strangest thing though, the more leaves I seem to get rid of, the more I find next time.\n\nAnd while this in itself is perplexing, I'm more bewildered that I find the work... enchanting? In some way? They're just leaves, nothing special about them at all, and yet I can't seem to pull myself away from clearing them..."
        }),
        leaf_blower: new Lore(
        {
            index: 5,
            
            check: function()
            {
                return get_upgrade_count(global.shops.weapons.leaf_blower) > 0;
            },
            
            name: "The Leaf Blower",
            description: "I had to make a run to the store. I realized that just bagging leaves by hand or a small hand rake wasn't going to cut it, so I went and bought a small leaf blower.\n\nIt really does the trick! I also saw the store was having a special on a new gadget, the Automatic Leaf Blower, or ALB for short. I figured I'd try them out, seeing as I can never quite get all the leaves."
        }),
        neighbors_garden: new Lore(
        {
            index: 10,
            
            check: function()
            {
                return global.resources.platinum.data.collected > 0;
            },
            
            name: "Neighbor's Garden",
            description: "I snuck over to Bob's place to rake his leaves. I know that sounds like a bizarre thing to do; raking a neighbor's leaves when they're more than capable of doing it themselves, but I just can't help it.\n\nHis yard has those incredible platinum leaves; they catch the light in the most alluring way. And the ALBs seem to be happy with their new work as well; it could just be an illusion from the new location, but I swear they're stronger and last longer than before...\n\nBut Bob needs to take care of his pest issues. I'm getting swarmed by all sorts of little creatures... I just pester them by blowing leaves in their direction until they end up moving on.\n\nHe told me stories about some sort of artifacts, and that he lost his magic Compass in his garden. I guess he forgot to take his medicine."
        }),
        bob_1: new Lore(
        {
            index: 11,
            
            check: function()
            {
                return global.resources.platinum.data.collected > 0;
            },
            
            name: "Bob",
            description: "Another tepid morning in the suburbs. Sunshine creeps over the horizon and bathes the road in a warm light. Bob heads out the door and waves to the neighbor; he seems like an earnest man, Bob thinks to himself, if not a little boring. He's pruning those trees again. Not particularly interesting work. Not unless you were Bob.\n\nBob's sedan grumbled to life and back out of the drive, then headed down the road. His tie fluttered a bit in the breeze that came in through the cracked windows; Bob's AC had broken years ago, but the heater worked fine in the winter and he didn't mind the fresh air. As he drove out of town into the foothills of the mountain, he saw glimpses of silver peeking through the mountain forest. Local botanists were eager to study the clearly distinct trees, but roaming security officials would always intercept them and turn them away; one less piece of evidence to draw back to the Corporation.\n\nWhere the state road veers towards the nearby town on the other side of the mountains, Bob instead turns onto a small maintenance road and drives for a few miles before being stopped by armed guards in all black. He flashes his deep red badge and is waved through. Another half mile up the road, a large metal door opens for his car, and Bob drives into the dark cavern."
        }),
        mountain: new Lore(
        {
            index: 15,
            
            check: function()
            {
                return global.areas.mountain.data.count > 0;
            },
            
            name: "The Mountain",
            description: "I can't believe it's real. It shouldn't be real. And yet, I'm here... the platinum leaves guided me here, a bread crumb trail, a map to El Dorado... but instead of gold; leaves.\n\nThey lured me to the edge of the city, through the countryside and to the top of the mountains, and there I found it. A glen, full of beautiful, shimmering, metal trees which spawned an everlasting stream of rainbow-colored leaves.\n\nTheir beauty is not their only strength; my ALBs continue to gain strength, push harder and for longer. Sometimes, a fleeting thought; Why? What does it all mean? Soon the thought passes, blown away with the leaves."
        }),
        space: new Lore(
        {
            index: 20,
            
            check: function()
            {
                return global.areas.space.data.count > 0;
            },
            
            name: "Space",
            description: "As I climbed the mountain, clearing the path of leaves, my steps became lighter and lighter as I seemed to escape the Earth itself, as I floated up into a vast open space. It should have been to my surprise that I should find leaves here, but it did not.\n\nI knew that the work must continue, and the leaves must be cleared. Leaves like glowing meteors, dark grey with a glowing sheen like embers fluttered away from me and my ALBs, who continued to happily encircle me, despite the apparent lack of gravity. I like to talk to them, the ALBs. It's gotten a little lonely out here, and I prefer their quiet contemplation over the hushed whispers I hear coming from the leaves.\n\nCrazy Bob told me that he lost some sort of artifact while he was in space. He really needs to consult a doctor about his hallucinations."
        }),
        void: new Lore(
        {
            index: 25,
            
            check: function()
            {
                return global.areas.void.data.count > 0;
            },
            
            name: "THE VOID",
            description: "If space was an open and vast emptiness, I have stumbled into someplace... colder. Darker. It's bitter nothingness, its... void. I try to keep my mind straight, but everything is turned around.\n\nBetween the darkness I see more leaves, they shine through the empty but with a kind of blackness, not just a lack of light but as if they're made of something the light hates; something the light flees from. I push away these umbral shadows as fast as I can, but they continue to encroach.\n\nMy mind plays tricks on me, ghastly apparitions assault me through the void. I blow them away like the leaves, but soon I hear their cackle behind me, unseen in the dark. I feel my grip on sanity straining, my connection to the before tenuous; I chase the leaves further and further into the darkness, hoping to find a light... but..."
        }),
        science: new Lore(
        {
            index: 30,
            
            check: function()
            {
                return global.resources.flask_red.data.collected_total > 0;
            },
            
            name: "Science",
            description: "The voices come from just beyond my vision; their ramblings are dark, terrible things. They try to corrupt my mind, to sew chaos into my being... but then, a whisper through the madness. It's not the whisper of a loving mother, but the whispers of droplets falling during the rain.\n\nIt weaves a tale of everything, the cadence of life and the rhythm of the universe. It's hard to follow, all a bit too much, but there's a spark in my mind. In my mind's eye, a room appears before me. While my body is obscured in the preternatural, my mind walks through the doorway of a simple room, lined with nothing but unadorned wooden tables and uninspired cabinets, fluorescent lighting dripping from the fixtures on the ceiling.\n\nThe whispers continue in my mind, and I know I need to comprehend their teachings. I realize there is a single leaf resting on top of a table... was that there before? I lift it by the stem and examine it. Lively green webbed by symmetrical veins, seven tips along its circumference... but there's something else.\n\nI pick up the magnifying glass next to me (when did I put that there?) and peer at the leaf's waxy coating. I tear off a piece and without question place it on the microscope slide, my eyes darting to the lens to see the structure of the leaf's capillaries, pores, cells. My mind is entranced, I'm leaping from basic examination to advanced biological chemistry in mere moments.\n\nI pull flasks and burners from the cabinets, distilling the essence from the leaves that appear before me. Centrifuges sit alongside alchemical transmutation diagrams as I pass between this realm of science into the next, my mind filling with knowledge of the leaves. But it's all hints, notes, scraps; this is only the beginning. I learn how to create more leaves, how to process leaves into more complicated forms. One innovation leads to the next, a cacophony of intellectual metamorphosis until... a dead end... or a fork in the path?"
        }),
        blc: new Lore(
        {
            index: 35,
            
            check: function()
            {
                return global.resources.blc.data.collected_total > 0;
            },
            
            name: "Big Leaf Crunch",
            description: "The whirlwind in the laboratory of my mind ceases. I stand there, bewitched; unmoving for the first time in what seems to be after eons and only a moment. Before me, in a squat glass beaker, sits a point of light. It undulates with color, swift pulses of yellow and green before collapsing into a black mote again.\n\nThis wasn't where my experiments were leading, this doesn't feel like I'm closer to the answer I seek. Yet... I can't help but reach my hand out. The pulses quicken as my hand approaches, but I'm not afraid. It seems to slowly drift toward my outstretched finger, and then everything goes white.\n\nWell, it's that time of year again; the leaves are starting to fill up the yard, so I've been out there getting rid of what I can. It's the strangest thing though, the more leaves I seem to get rid of, the more I find next time. And I'm plagued by the worst case of Deja vu, like I've been here before but... they're just leaves, nothing special about them at all, and yet I can't seem to pull myself away from clearing them..."
        }),
        strange_science: new Lore(
        {
            index: 40,
            
            check: function()
            {
                return global.resources.flask_strange.data.collected_total > 0;
            },
            
            name: "Strange Science",
            description: "I've placed the glowing mote in one of the cabinets. I can still feel it pulling me, but I know that it will only delay my experiments. The storm of science continues, but it feels wrong now. Maybe not wrong, just, not new.\n\nMy experiments require more and more leaves, the conversion process distilling a seemingly infinite supply of leaves into mere drops where I require a flood - no, an ocean! My mind thirsts for revelation but all my findings slowly decrease to nothing. There must be more that I'm missing. From the back of my room, I hear a twisting doorknob, and then the faint creak of hinges.\n\nI turn to see an open door, plain and unassuming. Through the door seeps a darkness, kept at bay by the flickering lights. As I stand in the doorway, I know that my quest for knowledge is only just beginning. I step through the door and hear it shut behind me."
        }),
        abyss: new Lore(
        {
            index: 45,
            
            check: function()
            {
                return global.areas.abyss.data.count > 0;
            },
            
            name: "The Abyss",
            description: "My footsteps echo through the vast openness surrounding me, my feet gliding along an invisible floor in a room of undeterminable size. Around me fall ordinary leaves, gathering in soft green piles. I reach down and pull out something strange... something different.\n\nIt's a leaf, that much is sure, but it feels unplaceable. Like it exudes a force that I can't comprehend. I let the leaf fall from my hand and begin to clear the piles, pushing them into a fading nothingness on the outskirts of this curious place.\n\nAs I continue, I gaze around, finding nothing but leaves and my own thoughts. \"Why am I here? What is there to learn in the deepest corners of my own psyche? What knowledge could possibly grow in nothingness?\" As if to answer my question, my foot connects with something small along the ground. I shift my eyes to see a pebble, light green. As I pick it up, I find that it's actually a seed. A strange seed, for sure; a seed I had never seen the likeness of before, but a seed nonetheless. I turn to the door to my room, ready to dissect the specimen in my palm to find its inner workings. Yet, my feet don't move.\n\nThe thought of desecrating this seed... it sends a wave of disgust through my body. I turn away from the door instead and drop to one knee. I push my hands into the invisible floor, disappearing as if they were swallowed by the earth, and create a small pit. I let the seed roll from my palm and land in the hole, then push the dirt over it, wiping it from view. I stand and wipe the specks of nothingness from my palms, nothing to show for my act except a sense of good. \"Maybe it's just good karma\", I think to myself."
        }),
        celestial: new Lore(
        {
            index: 50,
            
            check: function()
            {
                return global.areas.celestial_plane.data.count > 0;
            },
            
            name: "The Celestial Plane",
            description: "As I continue along the room, clearing leaves and planting the many seeds I find, I'm taken by surprise by a set of stairs I hadn't noticed. There, at the top, a glimmer of light. I turn to the door behind me, to my mental laboratory; where would these stairs take me?\n\nWhere can I go from these catacombs below my thoughts? But my feet took the steps as if I had no doubts, carrying me up above the nothingness. At the top of the stairs, I find a glowing arch; pure dazzling light from within, and yet it feels warm to look at. I breathe in deep and step into the light. My eyes adjust, and I am met with elysian fields of green under an impossibly blue sky.\n\nThe rolling hills come alive, as a warm spring breeze lifts leaves from the ground and gently tumbles them through the air. As I bask in the warmth, a voice booms from behind me. \"Child, welcome to our home.\" I sit up to witness an incredible sight; a leaf, staggering in height, towering over me. Its stern face gazes down at me, and I make my way to my feet.\n\nHis voice, deep and warm, rings out again. 'While it might be that you are to end up here, now is not your time. But before you go, I will teach you.' From his back he pulls out two tree limbs, long and straight, each my size. He begins to twirl them gracefully around, a cross between conducting an orchestra and a ballet. And as he continues this dance, the leaves around him rise from the ground and swirl around him.\n\nHe gathers them into a long banner that wraps around him, and with a swift motion, sends the leaves hurtling towards me. I close my eyes and smile as the leaves harmlessly bump against me. \"Now it is your turn\", he says. I do as instructed; I begin to blow the leaves around, gathering more and more in a pile so high that it could topple at the slightest breeze, and then with a swift motion explode the leaves towards my master, creating a blanket of green that covers him. And as the leaves settle, the master is gone."
        }),
        mythical_garden: new Lore(
        {
            index: 60,
            
            check: function()
            {
                return global.areas.mythical_garden.data.count > 0;
            },
            
            name: "The Mythical Garden",
            description: "As I walk along the meadow, I come across other sentient leaves, and I practice the dance my Master taught me. I begin to feel a smoothness in the dance, my body working into the rhythm. The leaf people guide me to a way back to my home, through the Mythical Garden that joins their world and ours.\n\nI make my way to the edge of the trees, and give one last thank you to the people that have taught me so much. As I trek deeper into the Garden, the vegetation becomes thicker and lusher. Fruits of all colors hang from low bushes and tall trees, the canopy above me a woven tapestry of leaves and vines. Soon, the flora becomes difficult to pass through.\n\nI jump and dip over and under boughs and thorny growths, a needle weaving thread through a dangerous canvas. As I pass through a particularly rough patch, there is a clearing in the treetops ahead, and I can see an enormous formation peering over the horizon. Its peak spews a black haze, shimmering from the bottom by an orange light. Something tells me this volcano is where I need to go.\n\nAs I approach the base, tired and worn from the journey, a rustling from the bushes in front of me stops me in my tracks. From behind the leaves emerge a group of people; tall and orange, their heads covered in long green hair styled in intricate tribal fashions, and each with a spear in one hand. One steps forward and addresses me. 'We protect the path ahead from those who are not worthy. Turn back now, before we must make you.'\n\nI know I must reach that volcano, but the tribe confronting me must be shown that I am ready. I breathe in deep and begin the dance my master taught me. Like water through a canyon, I weave through the vegetation and gather the leaves in a trance, as if the leaves were birds, soaring at my command. I recruit more and more of these tree-borne birds, my flock surrounding me, until the moment they rush forward into the tribe, parting them down the middle. The flock slowly flutters to the ground as I walk between the two groups, towards the molten mountain."
        }),
        volcano: new Lore(
        {
            index: 65,
            
            check: function()
            {
                return global.areas.volcano.data.count > 0;
            },
            
            name: "The Volcano",
            description: "The heat rising from the rim of the volcano wafts away the sweat I worked up climbing the slope, and now a new sweat begins to pour from my brow. I slide down to a ledge along the side of the basin and peer down further. The deepest parts shine bright through cracks in the solidified lava, revealing a vivid and boiling magma underneath.\n\nBlack smoke creates curtains between the pieces of floating rock, and I jump down to find purchase on one of these islands of relative safety. The heat is more than brutal; I can feel the dehydration ravaging my body, but I stay strong. Cracking from the surface of the volcanic platforms are sheets of rock, black with char lines with cracks of molten lava, but clearly in the shape of leaves. I wipe the sweat from my face and begin to clear these earthen leaves, when the platform I stand on is rocked by a wave of magma from underneath.\n\nI steady myself and try to see where the disruption came from, only to see a shadow approaching me through a sheet of black smoke. With a whir of gears and pistons, a stone goliath crashes through the curtain and onto my island, sending me to my feet. Its stone body glowing red from the heat of the volcano, its glowing yellow eyes point to me as it begins to drag its crude form in my direction. Panicked, I rise to my feet and attempt to stop the golem with a blast of stone leaves. They crash against its forged skin, leaving scratches and pocks, but the stone monster continues its march towards me.\n\nI know I need to run, so I jump through a sheet of smoke and land on another platform. I gather a volcanic pile of leaves and wait for my moment; the golem crosses onto the new area and is met with a barrage of slashes and slices, cracking pieces of his exterior and exposing his inner machinery. I leap to another floating rock, and start to gather leaves for my next assault.\n\nHowever, I realize that I'm cornered; sheer walls encapsulate me. The golem reaches through the smoke and onto my platform, and I release my assault. The flying rocks pummel the form, tearing away sheets of its shell, and I can hear the gears inside grinding and moaning with damage, but the golem's march is only slowed.\n\nI retreat and my back is met with the smooth wall of the volcano... wait, too smooth... I turn and realize that by complete chance, I've stumbled across a sheer metal door, a battered keypad hidden along its side. I slam on the \"open door\" button, and hear a recording from behind the door. \"Initiating door open sequence. Please stand by.\" Seconds seem like hours as I watch the stonework monstrosity creep ever closer, and I realize that the door won't open in time.\n\nI peel one last volcanic leaf from the wall, the heat of it singing my fingers through my gardening gloves, and I throw it like a giant shuriken into the hollow body. It disappears from sight as it bangs around the gears and shell, and then a loud screech emanates from the golem. Its body freezes, lifeless glowing vizor locked on me, and then fades to black. My heart is beating out of my chest, the golem's corpse mere steps away, when a sound from behind me makes me jump in terror. \"Door opening. Watch your step!\""
        }),
        antarctica: new Lore(
        {
            index: 70,
            
            check: function()
            {
                return global.areas.antarctica.data.count > 0;
            },
            
            name: "The Abandoned Research Station",
            description: "The metal door slides shut behind me as I walk into a dusty metal hallway. I walk to the other end and find an elevator with a single button. I give it a quick click and the two doors slide apart, revealing a stainless-steel box with some hip-height handrails and yellow lights overhead. Seeing as my path hasn't been wrong so far, I step in and turn around.\n\nHoping to find some answers about where I am, I check the floor button panel to be greeted with another singular button. I shrug, just happy to be out of the heat of the volcano, and press the button. The elevator plays a happy little chime and shuts the doors. I feel a small sense of weightlessness as the elevator begins to descend. And descend. Time passes, and the heat from the volcano dissipates into a cold that seems to penetrate the elevator. I try to hold myself for warmth, but the cold intensifies, and I can see the heat of my body leaving with every breath.\n\nI pace around to keep the blood flowing, to do anything to keep warm, when I trip headfirst into the wall of the elevator. As my face collides with the panel, I hear a soft click as the panel swings open to reveal a set of winter gear, replete with a thick coat, pants, and some overboots. I wipe the blood from my nose and don the gear.\n\nSuddenly, the elevator halts. With that same cheerful chime, the doors open with a blast of frigid air. I stumble through the doors and into snow and ice halfway to my knees. I try to go back into the elevator, but the doors have already shut, and the button is frozen over. I turn back to gaze at my new surroundings. The snow and ice cover everything I see, but I can tell the room is a very large circle with a high-dome ceiling. Paper-thin sheets of ice flutter from above, landing gently and piling atop the mounts of snow and ice already gathered down here.\n\nI make my way to one of the mounds and wipe away the caking of snow to reveal a mechanical panel of some sort, diodes and meters all dead in the cold. Tubes and wires jut from the side of the panel and dive into the snow, and I follow them along the ground and to another mound hidden under snow. The mound is tall with flat sides, so I wipe across its face to be met with a sheet of cold glass. Some sort of tube?\n\nI put my face closer, hoping to peer in through the glare off the snow, when something thumbs hard against the other side of the glass. I step back hesitantly, when another thump rings out from the tube, followed by a large cracking sound as a fissure runs up the side of the tube, shaking off the snow and revealing its captive. A large leaf, similar to the people on the Celestial Plane, but twisted.\n\nIts mouth distorted into a grimace, its eyes wild and animalistic. It lets out a terrifying roar as it once again crashes its head against the glass, this time shattering through and escaping its confinement. As it stumbles onto its feet, it lifts its eyes to me and bares its fanged jaws, then leaps into a sprint."
        }),
        hidden_sea: new Lore(
        {
            index: 75,
            
            check: function()
            {
                return global.areas.hidden_sea.check();
            },
            
            name: "The Hidden Sea",
            description: "As the snarls and roars draw closer and closer, I remember that odd trinket from Bob's yard. He had made idle chit chat over it. It was just a little stone seal, made of some polished stone. He would just have that nervous grin on his face and divert to whichever sport was in vogue. Why was I remembering it now?\n\nI move to get on my knees, to face my doom, when I feel a weight in my pocket. I pulled my hand out, and there in my palm was that odd little artifact from Bob's yard. Indistinct whispers fill my head and I'm compelled to press the statue against the door. I feel the stone break through that unseen force like a pane of glass and sink through the door, my palm colliding with the intricate filigree of the rune carvings.\n\nAs the rumble of a beast is at my back, a siren blares out as the door parts: and from beyond, a gush of dark water blasts into the room. I'm swept off my feet and pulled under as the jet of water encircles the room, the current tumbling me head over heels. Totally submerged, I open my eyes to see through the murky dark to witness a laboratory floor cleared of all ice and snow, and in the middle, an aperture, sliding open like a camera lens. The water begins to flow down and out like a whirlpool, throwing me around the room as I fight against the pull with no avail. As quickly as the water had come in, I'm submerged with it as we sink through the hole into the darkness.\n\nAs I feel the eddies of water pushing and pulling me like invisible hands, my landscape is illuminated by falling streams of lava, sending columns of steam cascading through the unseen currents. Chunks of ice, brought from the laboratory above, crash with the molten pillars, sending hardened obsidian-colored leaves through the water. I look for a way up, a pocket of air, but find nothing; obsidian leaves begin to pool and cloud the water, and I can feel my lungs aching with the need for air.\n\nRinging in my ears crowds my thoughts; my arms burn from the futile attempt to find safety, to pull myself from this watery grave. Darkness creeps into the corners of my vision as the panic subsides into cold nothingness, and I feel nothing but the embrace of the sea of leaves..."
        }),
        harbor: new Lore(
        {
            index: 80,
            
            check: function()
            {
                return global.areas.harbor.check();
            },
            
            name: "Leafsink Harbor",
            description: "Cold swells along my sides, my head heavy with a dull pain. A sudden coughing fit, and I roll to my side, expunging sea water from my chest. My eyes fight to open, to drink in my surroundings. Through the dim crepuscular light, I see the beach that has graciously accepted my would-be corpse. Dotted along the beach, wooden pillars supporting docks above sprout from the sand, as if they were the trunks of trees with impossibly woven limbs, with all manner of ships perched along their boughs. As the rays of light pour over the horizon, refractions of light glisten along the beach. Beautiful flecks of blue light emanate from whisper-thin leaves that swim through the tide and rest upon the shore. I am enamored by their beauty, by the crystalline structure. As I reach to grab the treasure, I'm startled by sudden movement.\n\nThe clawed-arm of a shadowy monster digs into the sand before my hand and drags the gem-like leaves towards itself. I scramble backwards, a wave taking my grip and submerging me back into the water. As I surface, I quickly wipe my eyes to properly face my adversary, when I realize what I am facing... a boy! A young boy with chestnut hair and a warm complexion, in his hands a rake and a net full of glittering leaves. I clear my throat to speak, but the boy stands from the now-naked sand and begins to walk off. I clamber from the water and rush to his side, words failing me after so long without them. My hand reaches his shoulder and he stops, but nothing more. I walk around to face him, to greet another human being, but I gasp in shock. The boy's eyes - or where his eyes should be - is nothing, save for the bright blue glow like that of the gem leaves from the sea. He faces me, emotionless, cold; then returns his empty gaze forward to another vibrant azure pile and continues on.\n\nAs I leave the beach and reach a worn stone path, the sun finishes its ascent over the edge of the world and bathes the structures before me in a warm, dancing light, and the buildings reciprocate with their own blue light. Adorning the elegant buildings are polished blue gems that accept the gift of the sun and craft it into a million dancing specks of light, each blessing the land with its grace. Ornate filigree and meticulously carved wooden pieces intertwine with stonework that seems to grow from the dirt; architecture conceived by gods. And as the sun alights the gems, so too does it wake the denizens. Coming from their homes and business emerge countless individuals, no singular trait among them shared save for the crystal-blue light from their eyes, somehow even brighter in the morning light. They engage with each other, but no sounds are uttered. With no whispers, no motions; they stand before each other in contemplation, sometimes trading more of those polished gems, sometimes adjourning with no discernable exchange.\n\nI slowly stalk the roads, undisturbed by the other passers-by, but still unnerved. What has happened to these people? What is with this town, and these gems? The stores I pass have no signage other than large pictures advertising their wares: a bird in flight, a bushel of apples, and a printer supply store? I laugh as I pass by one garnishing an illustration of a wedge of cheese drinking a pint of beer. I almost go in, when another sign catches my eye. The simple illustration of a stack of books hangs atop the doorway of a fine wooden door that shuts silently behind me."
        }),
        borbs: new Lore(
        {
            index: 81,
            
            check: function()
            {
                return get_upgrade_count(global.shops.benitoite.unlock_borbs) > 0;
            },
            
            name: "Borb",
            description: "Borb borb borb, borb borb borb. Borb borb. Borb borb borb, borb. Borb borb! Borb?\n\nBorb borb. Borb borb borb. Borb, borb, borb borb borb borb. Borb borb? Borb Borb borb? Borb. Borb...\n\nBorb borb. Borb borb borb, borb borb borb borb borb. Borb borb, borb borb borb, borb borb borb.\n\nBorb..."
        }),
        cheese_pub: new Lore(
        {
            index: 85,
            
            check: function()
            {
                return get_upgrade_count(global.areas.cheese_pub) > 0;
            },
            
            name: "Cheese Pub",
            description: "Along the quiet pedestrian-filled streets of a town named Leafsink Harbor, a building adorned with no more and no fewer glittering blue gems than its neighbors, stone and woodwork as elegant as that of the buildings to the left and right, and presenting a sign illustrated with a cheese wedge drinking a pint of beer, sits the Cheese Pub. \n\nWhile its exterior is as elegant as any other structure in the town, its interior is a unique warmness from top to bottom. Worn wooden flooring smoothed under a layer of waxy polish supports a number of dark oak chairs, tables, and booths for gathering patrons. A high-top bar hides a number of individually marked taps, and several shelves covered in liquor bottles obscure a wall-sized mirror. Warm six-pronged chandeliers hang from a copper-stamped ceiling. Frames of photos of unknown individuals, taxidermied game, and other pieces of memorabilia hang on the walls above a waist-high wainscoting.\n\nAnd this warm hall lies as still as the dead.\n\nMysteriously, the denizens of this town have quit patroning this establishment, leaving it to collect dust in unfettered silence. However, some form of life can still be found emanating from a corner in the back of the pub; a small unlabeled archway through which the flashes of lights matches the ringing of bells and the whirrs of automation. Through this hidden gate, a secret land of entertainment and diversion.\n\nWith the folk of the harbor bewitched by a mysterious force, it seems that the games that lay shrouded under that cheese and beer sign await for someone new to win their prizes."
        }),
        tower_1: new Lore(
        {
            index: 90,
            
            check: function()
            {
                return get_upgrade_count(global.areas.tower) > 0;
            },
            
            name: "The Leaf Tower",
            description: "As the door seals behind me, my eyes adjust to dark halls before me. Rows of tall bookcases line the floor, reaching to the low-hanging ceiling and carve a shadowy network of tomes. A lamp sits on the front counter; I grab it and begin my way through the darkness. I'm not sure exactly what I'm looking for, but I'm sure I'll find a clue in this mystery of a town.\n\nI descend the halls, not even reading the words that cover the bindings along the shelves. As I reach further into the depths of the building, what little light that crept in through the dusted windows has ceased and only what emanates from my lamp illuminates the collections around me.\n\nI turn into another row, and my heart begins to beat faster. I'm close. I scour the lines of books, the lamp practically banging against the dark wood and leather as my eyes frantically dart left to right and up and down. And then, I know I've found it. Dark bindings with worn gilding hides in the corner of a tall shelf, its presence made unknown to all but those who seek it. As I grab it, I feel a tingle carry up my arm; whether it was real or psychosomatic doesn't matter, I had found what my soul had been searching for."
        }),
        tower_2: new Lore(
        {
            index: 91,
            
            check: function()
            {
                return global.areas.tower.data.highest_floor >= 50;
            },
            
            name: "The Leaf Tower Pt. 2",
            description: "I bring the book to a nearby desk and admire its cover. Intricate symbols intertwine and weave an ornate tapestry that all at once feels absolutely foreign and somehow intimately familiar. I begin to flip through the yellowed pages, grabbing each worn page with a delicate but determined grip.\n\nThe words aren't in any that I understand, the letters almost identifiable but consistently out of reach for my mind. Detailed diagrams of what seem to be organic models interlaid on abstract conceptual diagrams fill the blanks, blurring the lines between reality and something else. As I turn page after page, my mind retreats into itself, almost as if to cloister itself against this otherworldly knowledge being presented.\n\nMy body, seemingly puppeted by an unseen force, continues through the book while my mind falls deeper and deeper, despair filling my head, until I suddenly snap back. My hand shakes but remains frozen on a page full of an illustration of some sort of tower. A tall, ominous tower, beveling and stonework dark and foreboding.\n\nGargoyles and grotesques cling to the out walls and shadowy creatures peek out from under the arches. Along the base of the tower lie piles of dark figures, masses of writhing bodies in constant agony. They seem to be drawn to the tower, but dare not enter the light that emanates from the shining beacon that adorns the tower's precipice."
        }),
        tower_3: new Lore(
        {
            index: 92,
            
            check: function()
            {
                return global.areas.tower.data.highest_floor >= 101;
            },
            
            name: "The Leaf Tower Pt. 3",
            description: "Smoke billowed from the broken windows into the early morning sun as an alarm blared. The center console was shot, and sparks leapt angrily from shattered mechanisms as Bob's eyes fluttered open. He sat up and stared through the viewing window to the experiment platform, where silver and gold metallic disks flashed with chromatic energy. A burst of energy ripples from the platform as the disks bounce into the air and explode in size, swiftly transforming into all manner of creatures. Limbs with misshapen claws and talons land on the cracked tile floor, and innumerable glowing eyes turn to Bob.\n\nBob's mind flooded with panicked thoughts. How the hell did this all happen? Think Bob, think! The gold and silver tokens were designed to hold an incredible amount of high-density extra-dimensional energy. That energy was siphoned from exotic-matter \"gemstone\" leaves, each one extremely dangerous in their own way. Our plan was to harness their seemingly infinite energy into a usable form, but our calculations must have been off, the tokens' matrices not designed to properly channel the energy...\n\nBob's thoughts were cut short as a cacophony of roars and screeches bellowed from the viewing window. The hoard inside were ripping at the wall between them and Bob, pulling down reinforced metal plates like paper. He scrambled to his feet, but Bob knew that the creatures would get to him before he could move away. Hulking bodies poured through the breach between them, fangs barred and chomping as they rushed forwards to their first victim. In a final fit of desperation, Bob reached for a piece of debris to throw at his assailants, and shouted a single command as he watched a piece of shattered gemstone leaf fly from his hand and explode into light.\n\n'STOP'."
        }),
        tower_4: new Lore(
        {
            index: 93,
            
            check: function()
            {
                return global.areas.tower.data.highest_floor >= 200;
            },
            
            name: "The Leaf Tower Pt. 4",
            description: "Papers fluttered in the air behind him as Bob's thick-hewn robes cut eddies around his frantic movements. He began to scrawl on papers, producing undecipherable calculations and muttering to himself.\n\n\"No, no, no! This cannot be!\"\n\nBut it was. He could feel the fluctuations in the time stream, alternate iterations branching from that fateful day collapsing back into a singular flow.\n\nHis.\n\nAnd who could possibly be foiling his plans? Who on this Earth would have the power to thwart his gem-leaf powers? None other than his own neighbor! Somehow he had unlocked the power of the leaf, and he was destroying possible outcomes left and right. It was only a matter of time before he reached his own time stream, fought his way through the facility floors now guarded by mass-produced monstrosities. Bob had survived that fateful day, and swiftly moved to claim the magic of the leaf for himself. The leaves gave him powers; powers he used to cleanse the facility and claim it as his mighty Tower. Through his experimentation, he found ways to poke at reality, expanding his magical abilities, and planting in his mind the seeds of greed. He had found a way to not only create these alternate realities and split timelines, but was on the cusp of travelling between them! But first, he had to defeat that nosey neighbor. There were an infinite number of timelines where he won the fight against that man, this undoubtedly would be the same.\n\nRumblings began to shake the tower from under Bob's feet.\n\n\"Surely my magic can defeat that simpleton!\"\n\nThe sounds of roars grew progressively louder.\n\n\"I have unlimited power, strength he can't imagine!\"\n\nDust begins to fall from the shaking ceiling, and cracks run up the stone walls.\n\n\"All he does is blow leaves! Why should I be worried?\"\n\nSilence falls over the tower, as the silhouette of the neighbor walks through the door."
        }),
        gem_leaf_amber: new Lore(
        {
            index: 100,
            
            check: function()
            {
                return global.resources.amber.data.collected_total > 0;
            },
            
            name: "Amber Leaf",
            description: [lore_scramble, "An entry from Bob's journal...\n\n\n\nLike the sap of ancient flora, this leaf glistens with the glow of honey frozen in time. My experiments have come up fruitless, I can detect no energy from it at all... And yet, when I return to it from my other studies, the eldritch energy capacitor has increased in stored flux! Is it possible the amber-colored leaf is a sort of quantum conduit, which only provides energy during periods of inattentiveness?\n\n\n\nThis does make measuring difficult...\n\n"]
        }),
        gem_leaf_amethyst: new Lore(
        {
            index: 101,
            
            check: function()
            {
                return global.resources.amethyst.data.collected_total > 0;
            },
            
            name: "Amethyst Leaf",
            description: [lore_scramble, "An entry from Bob's journal...\n\n\n\nSuccessive tests show increasing returns from the source transistors. Provided the testing algorithm remains unchanged, could it be that the energy production through this leaf runs parallel to that of an event horizon?\n\n\n\nIt might just be possible to reach absolute energy through the bright purple crystal refractions of this leaf. Must remember to wear my safety goggles...\n\n"]
        }),
        gem_leaf_emerald: new Lore(
        {
            index: 102,
            
            check: function()
            {
                return global.resources.emerald.data.collected_total > 0;
            },
            
            name: "Emerald Leaf",
            description: [lore_scramble, "An entry from Bob's journal...\n\n\n\nChemical analysis shows volatile chain reactions superimposed within the supposed atomic structure of the emerald leaf. I am unsure if they are atoms at all, with their odd behavior, but I digress; the random energy spikes are continuing to become more frequent, repeatedly destroying the testing equipment.\n\n\n\nIt's as if the leaf wishes to remain a secret to me...\n\n"]
        }),
        gem_leaf_kyanite: new Lore(
        {
            index: 103,
            
            check: function()
            {
                return global.resources.kyanite.data.collected_total > 0;
            },
            
            name: "Kyanite Leaf",
            description: [lore_scramble, "An entry from Bob's journal...\n\n\n\nThe blue gem leaf hates me, I know it does. I see it there in its containment capsule, sneering at me. It bites me when I try to hold it, even through kevlar gloves reinforced with runic bands and thaumaturgic protections!!\n\n\n\nI've named it Nacho after my mother-in-law's chihuahua, he never liked me either.\n\n"]
        }),
        gem_leaf_rhodonite: new Lore(
        {
            index: 104,
            
            check: function()
            {
                return global.resources.rhodonite.data.collected_total > 0;
            },
            
            name: "Rhodonite Leaf",
            description: [lore_scramble, "An entry from Bob's journal...\n\n\n\nI'm unsure whether to be furious or elated! Weeks of data and figures need to be scrubbed due to this pink jewel of a specimen. I've discovered the elevated numbers in my other experiments were tied to times directly proceeding interaction with this one.\n\n\n\nIt seems at every corner, these beings are determined to destroy any attempts I make at understanding them...\n\n"]
        }),
        gem_ruby_rhodonite: new Lore(
        {
            index: 105,
            
            check: function()
            {
                return global.resources.ruby.data.collected_total > 0;
            },
            
            name: "Ruby Leaf",
            description: [lore_scramble, "An entry from Bob's journal...\n\n\n\nGood and bad news on this one. The bad news is that during experimentation to attempt crystalline deformation within the ruby leaf, a malfunction in the bewitched dynamo led to me being thrown from the window. The good news is, while my landing wasn't soft, I somehow managed to walk back up the stairs to write this entry!\n\n\n\nI believe that I have been, albeit temporarily, imbued with a similar supernatural constitution! Maybe could I resurrect the intramural rugby team...\n\n"]
        }),
        gem_ruby_tektite: new Lore(
        {
            index: 106,
            
            check: function()
            {
                return global.resources.tektite.data.collected_total > 0;
            },
            
            name: "Tektite Leaf",
            description: [lore_scramble, "An entry from Bob's journal...\n\n\n\nA deep darkness resides in this leaf. Black as pitch, this leaf emanates a cruelty that I wish not to dance with. So aren't I surprised when during my lunch a bite from my apple returned a mouth full of seeds!! I suppose in my fear-struck mind I had forgotten my lunch pale was next to the death-leaf's ionized binding circle.\n\n\n\nI will continue my research after I find a replacement meal.\n\n"]
        }),
        mlc: new Lore(
        {
            index: 200,
            
            check: function()
            {
                return o_game.data.stats.prestige_mlc > 0;
            },
            
            name: "Mega Leaf Crunch",
            description: "Bob lies motionless on the floor, as I stand exhausted above a tower of corpses. The fight with him was seemingly impossible, but somehow I made it here. I never would have expected my neighbor to be some sort of dimensional wizard, but I suppose odd things have happened a fair deal recently.\n\nAs I catch my breath, a glimmer of light catches my eye. Along the wall near the far corner is a complicated metallic device, with brilliant crystalline leaves connected by wires and tubes surrounding some sort of archway. I could swear he was making a portal, but it isn't right. It's defiled somehow; dark. I look at the leaves, each one its own color, and I feel a voice in my head.\n\nNo words, just a whisper... I reach into the machine to disconnect the leaves, but my hand darts away instinctively; the leaves react to my presence and begin to glow brighter, but they feel warm and comforting in my hands. As I disconnect the last leaf, I feel a pulse-like warm ocean wave wash over me, and they're gone. Before me though, is a single pulsing green mote within the archway.\n\nIt looks familiar in a way, but completely new. An old friend I have yet to meet. My feet carry me forward, and the mote's light begins to expand and crescendo through my vision, a light green at first, then white, and then...\n\nWell, it's that time of year again; the leaves are starting to fill up the yard, so I've been out there getting rid of what I can. It's the strangest thing though, the more leaves I seem to get rid of, the more I find next time. And I'm plagued by the worst case of deja vu, like I've been here before but... like I've been HERE before.\n\nStanding here thinking about being here before. Double deja vu? I look over to Bob's yard, and I feel like I need to meet with him..."
        }),
        moon: new Lore(
        {
            index: 300,
            
            check: function()
            {
                return get_upgrade_count(global.areas.moon) > 0;
            },
            
            name: "The Moon",
            description: "Sweat drips down my brow as I scan the room for more monsters. The floors ascend unyieldingly; swarms of minions encircle their brood mother or hive lord, and then another set of stairs. Is this what is left for me? Unceasing climbing towards the unknown? A feeling begins to grow in my stomach, an uneasy pit, pushing against my soul; but then, light strikes my eye from the side of the room emanating from an open door, accompanied by the sound of rushing air.\n\nI move along the wall, prepared for the surprise attack from some unseen assailant. As my feet bring me nearer and nearer to the doorway, I begin to feel the rush of air passing by me and escaping into the lit beyond. I feel the sweat from my brow begin to pull from my face as a gale pushes from behind me into the expanse, and before I can turn my head to creep away, I'm torn from this room into the doorway, and see the door shut behind me.\n\nAs I tumble violently into this new expanse, I notice two things: the first is the lack of any noise at all. The second is as soon as I was through the frame, there was no wind at all. My eyes try to lock onto something as I tumble head over heels, my stomach floating up inside me with a strange lightness.\n\nFinally, my hands above me scrape against something as I flip onto my back and stare up into the sky. Or lack of sky. What should be an open expanse of blue and wispy white streaks is a vast ichor of black, blotted only by an immense spotlight near the horizon. I avert my gaze from its intensity, to see something else floating in that nothingness. The only drop of color in this blackness; a little blue marble, floating in a sea of nothingness.\n\nIn all my travels, through what feels like dimensions and time, no single sight has been so incredible to see. The home of humanity in its entirety, the birthplace of every single soul to have existed, every loving relationship, and ingenious scientific discovery. It seems so small there, like I could reach out and pluck it from the solar system if I wanted. Take it somewhere safe, protect them all. But then I remember where I am. A barren landscape of harshly-lit craters and scattered rock debris.\n\nIt seems they'll have to protect themselves for now.\n\nI push myself to my feet. I panic for a moment, remembering that I haven't had a breath in a bit. But I feel fine enough, so I guess that's not a problem for whatever reason. I feel my weight sink into the lunar surface, and look down to see fissures emanating out from me, cracking leaf-shaped rocks from the surface.\n\nI reach down and pick one up and wipe some lunar dust off and it glistens with an almost opalescent sheen. From behind this leaf, I notice another hint of color hidden under the dusty shell of the moon; a golden yellow vein.\n\nI reach down and touch the amber streak and confusion strikes me. It's... soft? I dig my finger down and scoop a bit up, and the notion hits me. It's absurd, there's no way... but I do it anyway. I bring the substance close to my face, and I lick it.\n\nI can't believe it. It's cheese!"
        }),
        desert: new Lore(
        {
            index: 400,
            
            check: function()
            {
                return get_upgrade_count(global.areas.desert) > 0;
            },
            
            name: "The Infernal Desert",
            description: "An unrelenting heat assaults me from the sun above, piercing the clear sky like a thermal barrage on my shoulders. I'm not sure how long I have been here now; time has phased in and out for me, and I'm missing parts of my memory, but the hazy picture of a bright blue globe hovering serenely in the inky darkness above me reminds me that the unending daylight hasn't been my cage forever.\n\nMy feet kick up sand into the arid wind; its large flat shape helps carry it along the dunes and into the distance. Dotting the valleys between the ridges of sand, black igneous rock peeks from under the dusty surface, occasionally belching towers of blistering flames, from which flutter down glowing leaves that weave heat trails as they fall to the ground and blacken the sand they fall upon. Between the absolute barren landscape and the wicked flame spouts, this Infernal Desert seems determined to finish me.\n\nI collapse to my knees in exhaustion. I try to conjure some moisture in my throat, but I feel as desiccated as the dunes. I feel emotions welling up inside of my chest, but no tears fall from my forlorn eyes. I look to the horizon one last time; to gaze upon the enemy that finally bested me. I see that enormous ball of fire hanging in the befouled heavens above, its wicked light besetting the horizon, from the sands, to the blackened rock, to the palm trees and pristine pool of crystal blue water...\n\nWater?!\n\nWith an energy I did not know still resided within me, I rushed forward to that oasis. Even as my breath wheezed from my chest, I could not contain the smile on my cracked lips. Salvation! Deliverance! But as I drew nearer, the pool shrank into the ground and the palm trees reduced in number until I came upon the truth; a single cactus, enveloped in needles and as thick as a tree trunk.\n\nNo, this can't be. This hellscape has come up with a fiendish manner to squeeze the last bit of will from my very being. In a rage, I grab the nearest thing I can; was it a rock, a leaf? Who cares, I just need to feel relief. I take the object and hurl it with all the strength I can muster, straight into the base of that accursed cactus. With a THUD, the thing pierces into the green flesh, and from the wound... water! Real water!\n\nI clamber over and fill my cupped hands with the delicious nectar. After quenching my thirst, I relax. I begin to remember my trek thus far; the hardships and the realizations I've made along the way. I cannot be stopped here. I must go further."
        }),
        pyramid: new Lore(
        {
            index: 500,
            
            check: function()
            {
                return get_upgrade_count(global.areas.pyramid) > 0;
            },
            
            name: "The Cursed Pyramid",
            description: "As I try to stand upon the sandy ground, my legs give out and I instinctively reach towards the nearest thing to help catch my fall. Unfortunately, that happens to be a plant covered with miniature swords weaving a fine coat that slashes my hand. I hold my wrist as blood trickles from the wound and onto the ground. I watch as the red droplets then glow with an ominous light and quickly plunge into the sands. \n\nMy confusion hangs momentarily unanswered under that wretched sun, but soon the ground groans and shakes as the ridge before me begins to climb into the sky, its edges becoming more pronounced and its crest coming to a singular point. I stare in disbelief as my vision is filled by the enormous structure of a pyramid, rising from an unknown depth below the desert.\n\nIts rise begins to abate, a gate carved from fine sandstone and marble emerges at last, a darkened hall beckoning from behind a curtain of the last sand rolling from the structure. Seeing this as the only alternative to a continued existence in that Infernal Desert, I step into the hall and begin down the darkness."
        }),
        inner_pyramid: new Lore(
        {
            index: 600,
            
            check: function()
            {
                return get_upgrade_count(global.areas.inner_pyramid) > 0;
            },
            
            name: "The Inner Cursed Pyramid",
            description: "Torches dot the walls, providing a dim light to guide myself through the maze. An ominous feeling sinks into my bones as I wander the grounds; a sense of unease that I can't seem to shake. I try my best to continue on, searching the rooms for something significant.\n\nI begin to find things; small, at first; trinkets or small things, left by some long-gone tenants of this place. I stuff my pockets with the goods and carry on, but that cold chill creeps deeper into me, a dark presence stepping closer to me. I quicken my pace, finding gilded idols and fine hand crafts, stuffing them all in my bag. Then that shadow of something nips at my heels, as if it is right on me.\n\nI feel compelled; I run, but continue to grab golden riches and brilliant jewels, when I feel that monster overwhelm me, and I fall into the darkness.\n\nMy eyes open to drink in the light from that ever-persistent sun, and then glance down to see the pyramid continues to dominate the land before me. However, the hall is closed now, with two enormous stone doors depicting some sort of ritual. I look to my bag, still full of the valuables I found in the halls, and I pull from it a golden cup with a handle carved from ivory and beset with brilliant rubies.\n\nI press the tip into my thumb, and with a wince, witness a thin trail of crimson roll down my hand. Walking up to the stone slabs, I press my palm against the carved design, and smile as the doors open to the darkness yet again, and that ominous feeling of something trailing me as I step inside."
        }),
        kokkaupunki: new Lore(
        {
            index: 700,
            
            check: function()
            {
                return get_upgrade_count(global.areas.kokkaupunki) > 0;
            },
            
            name: "Kokkaupunki",
            description: "In thatch-roofed cottage and cobble-lined streets, villagers meet and greet;\n\nA stack of these for a barrel of those, their trades they will complete.\n\nAn ancient tradition from founders' ambition to build a peaceful abode,\n\nWhere they care for each other and provide one another the gifts they were bestowed."
        }),
        kokkaupunki_cursed: new Lore(
        {
            index: 710,
            
            check: function()
            {
                return get_upgrade_count(global.areas.kokkaupunki_cursed) > 0;
            },
            
            name: "Cursed Kokkaupunki",
            description: "They dash in a hurry, they run with a fury! With terror alight in their eyes,\n\nThey scream and shout, they plead 'Let me out!' before meeting their tragic demise.\n\nA splash from my potion will start a commotion; it can turn a man into beast!\n\nA drop from a vial (with poison most vile) and they'll end up hairy at least.\n\nIn thatched-roof cottage and cobble-lined street, the Witch the villagers flee,\n\nA sack of bees or a murder of crows, these terrors make her cackle with glee.\n\nA gruesome affliction where Earth her perdition, so forever she'll menace the land;\n\nBut her cackle subsides when a man meets her eyes, who holds a leaf blower in hand."
        }),
        essence_cosmic: new Lore(
        {
            index: 750,
            
            check: function()
            {
                return global.materials.essence_cosmic.data.collected > 0;
            },
            
            name: "Cosmic Essence",
            description: "Cosmic Essence, cosmicam essentiam. A prime materia spawned through alchemical exploitation of higher-dimensional energies. Capturing these energies in plasmoid matrices during phase-dropping seances, low complexity poltergeists are converted into non-regular ectoplasmic bodies able to be harnessed for later use. It seems that even through the discombobulation, the non-regular bodies impose a sense of personality on unique and particular characters, promoting positive attributes."
        }),
        essence_earth: new Lore(
        {
            index: 751,
            
            check: function()
            {
                return global.materials.essence_earth.data.collected > 0;
            },
            
            name: "Earth Essence",
            description: "Earth Essence, terra essentia. A prime materia drawn from extra planar dimensions through alchemical processes conducted on mineral-rich components. Analysis of the meta-crystaline superstructure reveals components that simultaneously form strong pair bonds as well as rotate regularly, creating a semi-fluid substance that appears gel-like at a macro level. These unique characteristics would make for a profitable venture."
        }),
        essence_leaf: new Lore(
        {
            index: 752,
            
            check: function()
            {
                return global.materials.essence_leaf.data.collected > 0;
            },
            
            name: "Leaf Essence",
            description: "Leaf Essence, folium essentia. A prime materia generated from alchemical conversions of biological components. Autonomic generation of several scalable superstructures creates an ever-expanding network within the substance, allowing for fluid transferal of fresh essence to developing organelle-like facilities. It seems this self-improving ability extends to natural biological life as well, leading to more viral organisms once exposed."
        }),
        essence_water: new Lore(
        {
            index: 753,
            
            check: function()
            {
                return global.materials.essence_water.data.collected > 0;
            },
            
            name: "Water Essence",
            description: "Water Essence, aqua essentia. A prime materia derived through an alchemy-enhanced H2O conversion cycle. When submitted to the proper environment, H2O secretes a sub-dimensional isotope once it acquires sufficient energy to sublimate from crystalline ice to a gas. This isotope is extracted through centripetal means and condensed into a liquid superstate. The ephemeral composition of this substance can seep into and rearrange the anatomy of more porous substances, especially those regular structures of flora."
        }),
        witch: new Lore(
        {
            index: 800,
            
            check: function()
            {
                return global.enemies.boss_witch.data.defeated > 0;
            },
            
            name: "The Witch",
            description: "Somewhere hidden by thick tree canopy and far from the prying eyes of man, a structure sits amidst the fog and rank bog air of an untouched and cursed swamp. Vines like snakes crawl from branch to branch, ensnaring everything in a spider's web of dense vegetation.\n\nThe croak of bullfrogs and the screech of cicadas occasionally pierces the thick humid air, bouncing from water-borne tree trunks to another, conducting a sinister symphony for the lone occupant of a shrouded domicile. A small cabin, ancient in construction, wears a shawl of fallen leaves, moss, and the passage of time. The dim light of a flickering candle permeates from a window along the rough-hewn wooden side of this place, and if one were to peer in, they would behold a dark creature working within; a dark and disheveled creature with grey and mottled skin, whose knotted hands with their sharp claws toil over a bubbling cauldron reeking of acrid fumes.\n\nHer eyes dart about with inhuman intention from cavernous eyes as she speaks profane words from an ancient leather tome. Her nostrils flare from her hooked nose as she senses something, and with a flick of her wrist, a dark tendril lashes out from her wrist and snatches up a centipede crawling along the floorboards. She releases the writhing creature, shifting her hand as its legs pull it around her open fingers. And as she gazes at it, wide-eyed with intrigue and excitement, she swiftly closes her fist and sinks her teeth into it, biting it into two.\n\nShe spits the head into her cauldron and discards the rest out the window. As she stirs, sparks begin to fly and a thick green fog pours over the edge, filling the room with a profane aura that alights the witch's face. She cackles with glee, overcome with horrific amusement as she peers into the light forming an image on the cauldron's surface, more and more details bubbling into detail; a man. A simple man, intertwined with the fate of everything, drifting through the winds of fate like a falling leaf. \n\nAnd soon, she will have him."
        }),
        dark_glade: new Lore(
        {
            index: 900,
            
            check: function()
            {
                return get_upgrade_count(global.areas.dark_glade) > 0;
            },
            
            name: "The Dark Glade",
            description: "My breath rises rhythmically into the night air, flowing behind me like a scarf of fog, holding the chill at bay as I step between the wide bows of hearty evergreens. Snow crunches under my every step, freshly fallen and glistening like the stars in the clear moonless sky. The silence of the woods surrounds me, but it isn't an eerie quiet; no, it's a clean and calm serenity. A tranquility that guides me through an unmarked and unblemished passage that opens into a wide glade between the trees where I feel a connection to some deeper place that has eluded me all this time.\n\nI take a few steps deeper into the glade and pause as a shiver runs down my spine. I can't tell now if it's from the cold air or if it's this other place; though that hardly stops my thoughts from wandering about this other place that I'm so close to here. I kneel down and sift through the snow and find... a rose? A hearty stem adorned with thorns, crowned by a beautiful flower of deep crimson, as perfect of a rose as can be. \"I can feel a warm smile spread across my face, and I ponder what other beautiful treasures can be found in this secret place, hidden away but connected to it all?\""
        }),
        black_leaf_hole: new Lore(
        {
            index: 1000,
            
            check: function()
            {
                return get_upgrade_count(global.areas.exalted_bridge) > 0;
            },
            
            name: "The Black Leaf Hole",
            description: "The echoes of my breath fill the circular stairwell around me, as I sit and rest on a cold slab of sandstone. The crackling flame from the torches lining the exterior wall sends light down and around the curvature, illuminating the large carved door that stands ominously ahead. The dead-still air laps the sweat from my brow, raising goosebumps from my skin; the heat from the Infernal Desert long since left behind in the depths of the sands that reside below it. I have traversed ninety-nine floors of these halls, each filled with treasures and terrors, and each followed by a more harrowing challenge. This door will lead to the hundredth; and while there's nothing particularly interesting about that number, the large onyx gemstone beset above the door's rock frame leads me to ponder what unique challenge waits patiently behind for whoever breaches that long-kept seal. I steel my mind and press the door open.\n\nAs the grinding of rocks signals the door's opening, a gust of wind is cast from the stairwell into the room, extinguishing the torches and drenching my vision in darkness. I feel around for the wall to steady myself, but find nothing but smooth-carved floor stones. I try to reach out with my senses, to hear or see anything, but I am surrounded by an absolute still air, penetrated only by the sound of my panicked breath. And then, eyes begin to peer at me from all around; large ones at first, but then the space between is permeated by more small ones than I can count. They glisten and twinkle with a cool white light, sometimes sparkling like light through a gem in reds and golds and greens... and then it dawns on me; these unblinking eyes surrounding me are stars in the sky. Millions of them, of all shapes and colors, a kaleidoscope of the heavens, which then grow so bright they reveal what is ahead of me; an inverse of the pyramidion, a pyramid-shaped well with stairs leading to an intricate altar at its pinnacle. I can see a small glimmer down there... just barely through the dark.\n\nI walk cautiously down the stairs to it, but I meet no resistance. There upon the finely-crafted rockface is a black gem. Almost like onyx, but it pulls light in and around it oddly; I grab it to look closer, but as I touch the smooth sphere, it flashes quickly and begins to grow in my vision. The deep blackness of the gem begins to eclipse everything, all the light from the room and stars feeding into its shadow of a center, and then begin to swirl and eddy around it as if caught in an everlasting whirlpool that nothing can escape from. The pull from the gem grows and begins to lift me up, to pull me into that black maw. I watch as all the light from around me collapses into a single point above me, and then, nothing."
        }),
        exalted_bridge: new Lore(
        {
            index: 1100,
            
            check: function()
            {
                return get_upgrade_count(global.areas.exalted_bridge) > 0;
            },
            
            name: "The Exalted Bridge",
            description: "A pinhole of light breaks the curtain of darkness in front of me, and I again remember where I am. I fell into a dark void, not unlike what I have learned about black holes; and as that pinhole of light grows into a full image in front of me, I suppose it wouldn't be too surprising to find that the theories of black holes being a sort of wormhole could be true after all. My feet come to gently rest upon a bridge of crystalline light; a literal rainbow bridge reaching out into another vast expanse of stars and cosmic clouds surrounding me. At the end of the bridge, enormous pillars of a beautiful city glimmer in a brilliant sheen of white silver and rainbow crystals, and from the front gate of that city, a small dark dot emerges. I squint my eyes, but the distance makes seeing the figure difficult; it gallops along, up and down as the hoofbeat begins to reverberate through the bridge all the way to where I stand. \n\nAs the figure nears, I'm able to make out more details; they charge towards me, glimmering mail adorning their chestnut fur and bronze skin, a broad flat nose set between two stern eyes that glisten with determination. In their hand, a prodigious spear made of that same gleaming crystal, the two prongs just barely separated at the tip. Their human muscles twitch and flex as their lower horse half runs at a full gallop at me, and then skids to a stop within shouting distance. But they say nothing; their demeanor is all the message I need. They guard that ancient city, and it is through them I must struggle to earn the privilege of entering that sacred place. I ready my weapon and meet their eyes, and they nod with acknowledgement as they rear up to a massive height, then begin the charge at me."
        }),
        centaur: new Lore(
        {
            index: 1200,
            
            check: function()
            {
                return global.enemies.boss_centaur.data.defeated > 0;
            },
            
            name: "The Centaur",
            description: "As do the stars, I stand at my post unblinking. The sacred sanctum hath stood in this spot eternally, and I younger by only the breath between our creations. Since our inception, the gates have held closed to all that have found passage to them, rebuffed by my weapon and their own insufficient zeal. And after every victory, I return from that iridescent bridge to my post before the gate, awaiting the one who can provide me a fitting defeat. I yearn not for death; nor do I cling to life like a foal to the dam. No, I exist with singular purpose; withhold entrance to this reverent hall, this Ancient Sanctum, from those who would sully its purity. And to that end, I will continue to turn away the unworthy and see that these gates are entered only by the one who can end my perpetual post. \n\nA light glistens yet again upon the end of the Exalted Bridge, and an unassuming biped is placed upon the hallowed grounds. I stomp a forehoof upon the ground, and begin my gallop towards the newest contender. My grip upon the hilt of my spear tightens; something is different about this one. I gaze into his eyes as I skid into a stop several paces shy, and I see the look of one who has not wanton bloodlust in their nature, but the knowledge of more than can be realized. My heart beats faster, and I feel a rush of something within my timeless veins; could this be the moment? I nod at my opponent; he shall receive no quarter from me, no restraint. I will beset upon him with the totality of the strength I have been afforded. And I know that he shall do the same.\n\n"
        }),
        ancient_sanctum: new Lore(
        {
            index: 1300,
            
            check: function()
            {
                return get_upgrade_count(global.areas.ancient_sanctum) > 0 || global.enemies.boss_centaur.data.defeated > 0;
            },
            
            name: "The Ancient Sanctum",
            description: "As I enter through the grand gates that open before me, I'm taken aback by the state of the buildings here. While the outer walls of the city are dotted by great crystal towers, the interior looks like time has taken away much of its beauty. Carved marble pillars, once painted and leafed with gold and jewels, now sit cracked and heaped into piles of rubble. Great trees, their branches reaching out like a giant's gnarled arms, grow from the rocky soil and through the debris. Grasses and small flowers peek through cracks in the stone roads that cross between the remnants of collapsed buildings, and a soft breeze is the only whisper heard coming from the vacant halls.\n\nI walk alone for a long time, the enormous ruins stretching out further than one would imagine. Along the way I find scattered leaves, each one split diagonally between a warm autumn amber and a bright and icey blue, and take them with me. Eventually I come across a long hall, stone pillars lining the front and sides, creating tall open windows that let in light to the cases and shelves within. Each shelf and case is faded now by the passage of eons, but still belays a sense of reverence that carries to the items upon their dusty tops. Little ancient bobbles, artifacts crafted from these same leaves I found along my journey. I find one that speaks to me; it wasn't anything grand, but it reminded me of a time before. It reminded me of home. I took my gathered leaves and began to fold them, simple bends here and there and sliding them together to create geometric shapes to mimic the artifact before me. After a time, I place the final touch on my own creation, and it glows with a holy light. I can feel the appreciation from it, reaching out and resonating from the collection surrounding me. I smile, and place my own contribution to the shelf, as I turn to leave."
        }),
        sacred_leaves: new Lore(
        {
            index: 1400,
            
            check: function()
            {
                return global.resources.sacred.data.collected_total > 0;
            },
            
            name: "Sacred Leaves",
            description: "Within each living entity resides the capability for change, for growth; this fact was well known and studied by the Architects. During their eternity of traveling the cosmos to learn and catalog all observable information, they came across the same immutable fact; that while all precursory information and factors can be identified, there can be quantum variances that deviate expected outcomes.\n\nThe culmination of the Architects' studies on the subject eventually lead to the creation of the Sacred Leaf; an artificial organism composed of intertwined but diametrically opposed material components which both metaphorically and literally embody the inherent malleability of life itself. Using these leaves, the Architects created bastions of information across innumerable universes, protected by single-minded guardians.\n\nWithin these sacred halls, artifacts crafted from those Sacred Leaves reside, waiting to share their knowledge and powers to those who have been deemed worthy of their powers."
        }),
        biotite_forest: new Lore(
        {
            index: 1500,
            
            check: function()
            {
                return get_default_struct_value(o_game.data.stats.areas_time, global.areas.biotite_forest.key, 0) > 0;
            },
            
            name: "Biotite Forest",
            description: "If you were to take a stroll to the edge of your town or city, you might be lucky enough to find yourself on the edge of a forest or wood. Walk into those woods, and you'll quickly find yourself surrounded by a feeling of timelessness of a force that stood long before you, before your ancestors, and who knows for how long before that.\n\nTrees and ferns and the small creatures that dart underfoot and unseen in the branches above. However, there exists a tale of a wood even older than that, the Oldest Forest. It has stood guard since the beginning; its trees larger than skyscrapers, some say to unmeasurable heights. Their age so immemorial that the wood and bark had turned to stone; verdant leaves petrifying into beautiful sheets of biotite and malachite.\n\nThe trees, while still there in form, turned to stone; forever guarding that eldest glade in that unknown part of the world. They say, if you take the time to meditate in those local forests near your home, you can feel the eternal peace and presence of that Oldest Forest; and for a moment, if just a moment, you can feel that sense of eternal serenity that exists in the forest which no one has ever seen."
        }),
        vilewood_cemetery: new Lore(
        {
            index: 1600,
            
            check: function()
            {
                return get_default_struct_value(o_game.data.stats.areas_time, global.areas.vilewood_cemetery.key, 0) > 0;
            },
            
            name: "Vilewood Cemetery",
            description: "The centaur gasps in ragged breaths as he holds his weight upon his weapon, trying to keep his body from fully collapsing. His eyes remain closed in concentration, a timeless fire in his soul continuing to fight on, but his heart recognizes defeat. With a ragged sigh, his shoulders drop, and he lifts his eyes to gaze across the glowing rainbow bridge at me. He releases a few short words between those dying breaths, words that sound both new and known; a message that I had never heard but all my life had somehow known.\n\n'It can only be you.'\n\nThe iridescent light from the bridge begins to shine brighter then, illuminating the centaur's body in a shower of light. In moments, the centaur himself is transformed into specks of light being carried on an interstellar breeze, which swirls around me and drifts down a cobble road of the Ancient Sanctum. My eyes follow the path, and see a hill surrounded by a wrought-iron fence, adorned with ashen filigree and crooked spears.\n\nI pass through a rusty gate, which groans with displeasure of use. Large stone and marble statues denote the graves of those who once lived in this ancient place; carved and sculpted imagery of holy figures beg eternal forgiveness and peace for those they stand guard.\n\nAtop the hill that sits centered in this forgotten resting grounds, a large tree reaches out with its naked limbs and blankets the ground in a web of shadows. As I begin to walk toward the hill, I notice a small statue hidden in the shade of several larger and more imposing carved figures. The small statue is that of a young girl, her stone eyes staring at me in a peaceful revere; in her hands, cupped together in offering, hold an iridescent shard, shining brilliantly with what little light falls down upon it.\n\nI think better than to steal from those long gone, but I hear the faintest plea in the rustle of the leaves around me. \n\n'Please.'\n\nWith a heavy sigh, I place a hand upon the shard, pausing to hold the statue's hand. \n\n'It had to be me,' I say reluctantly as I lift the crystal and continue on to the tree on the hill."
        }),
        lone_tree: new Lore(
        {
            index: 1700,
            
            check: function()
            {
                return get_default_struct_value(o_game.data.stats.areas_time, global.areas.lone_tree.key, 0) > 0;
            },
            
            name: "The Lone Tree",
            description: "As I take the large stone steps up the hill toward that Lone Tree, my mind drifts back to the grave of that little girl. What sort of world was this Sanctum, where they could hold unimaginable treasures and god-like gifts, yet their young are still taken so early? Is there not some inevitable time and place where civilization can prevent that inevitability?\n\nI think of the countless souls, ripped from their loved ones too soon. I think of those who leave before they can make peace with their demons; before they can make something of themselves at all. Sent to the grave with nothing but an empty heart and a head full of guilt and remorse. The steps become further apart, my feet struggling to reach the next as the weight of those souls' burdens begin to pile onto my shoulders and drag down on my soul.\n\nI feel them all, reaching out from their darkened graves, hoping my life can give them that last little bit to earn them a peaceful eternity. Their wretched hands clench onto the hem of my pants, clasp to my shins and hold my legs from moving forward. They pull me down into an inky darkness, their cries for salvation beginning to echo loudly in my ears.\n\nI try to pull them up, to lift us both from the darkness, but more of them begin to pull and push and sink me lower into that cold nothingness. As my head is finally pushed below the waves of unrelenting souls, I manage to call out for that which these souls could only attempt to steal.\n\n'Help.'\n\nVoid surrounds me. Frightening, cold, alone. But then, a ray of light appears from the corner of my vision. I look down to see my pocket, gently lit from inside. I reach in and pull out the crystal shard, and its light falls upon the face of a small girl; no statue, but a real girl. Her hair is done in two pig tails of big curly hair, and a smile rests between her cherubic face.\n\n'Many are too afraid to ask for help, and face the end having never known it was there if requested.'\n\nThe shard erupts in a brilliant explosion of light, the void giving way to the faces of the dead and the damned, their wretched and terrible faces erased as if consumed by a radiant fire. As the light fades, I see that girl again. But this time, she's standing in front of that tree; but the tree is covered in beautiful blossoms of every color. And as I look back to thank that girl, there is only myself and the tree once more."
        }),
        spark_range: new Lore(
        {
            index: 1800,
            
            check: function()
            {
                return get_default_struct_value(o_game.data.stats.areas_time, global.areas.spark_range.key, 0) > 0;
            },
            
            name: "Spark Range",
            description: "I sit under the shade of the Lone Tree for a while. While I haven't seen that girl again, the memory of her sits in my mind like a stone. I've been on this journey for so long, to who knows what end, by myself up until this point.\n\nTo reach out and finally receive aid, only for that kind face to vanish. She seemed so... peaceful. Like the threats of this existence frightened her not. There must be more to her, more to the people she came from. I found my way here for a reason, I have to believe that, and I will continue on my search for that reason.\n\nOn the cemetery's far side, another gate opens to more structures of ancient white marble; however, their edifices  and eaves are all lined with metallic caps and brackets, copper-colored adornments that sit lashed to one another with thin wire that buzzes in the silent air. The wires continue around the buildings, leaping free at central hubs and interweave within large crystalline orbs that hovered without support, bobbing almost imperceptibly on the ghost of a breeze.\n\nFrom there, my eyes trace the metal chords down the thoroughfare and alight upon an open plaza surrounded by marble towers. Or, what can be assumed are marble towers; their faces are blemished with those same bronze fixtures, but to a degree that almost entirely veil the stone underneath.\n\nWires like cobwebs are strung from the surrounding buildings, criss-crossing between the towers in an intricate net that wreathed the plaza. Walking along the road towards the configuration, the wires that road parallel hummed with a soft but consistent energy; upon setting foot before the imposing contraption, that hum joined a thousand others in a cacophonous chorus, articulated with the zaps and cracks of electricity leaping from the cage, like the limbs of an ethereal creature reaching through the bars of its prison.\n\nA single archway creates a path into the plaza. Made of a cool-blue metal, bars that bend back and forth like ocean waves frozen in time repeatedly invoke the wrath of the imprisoned, being met with shock after shock; however, the opening to the plaza remains free of electricity. My mind races as I step tentatively through and into the plaza proper; what purpose could this device have? Why is it constructed in such contrast to the rest of the architecture? \n\nAnd is that arc of electricity looking at me?"
        }),
        spark_bubble: new Lore(
        {
            index: 1900,
            
            check: function()
            {
                return get_default_struct_value(o_game.data.stats.areas_time, global.areas.spark_bubble.key, 0) > 0;
            },
            
            name: "Spark Bubble",
            description: "The plaza, at a glance, looks like you just walked under an upside-down bird nest, except that nest is made of millions of metal wires and is large enough to house an entire sports stadium. The floor, made of a similar stone to the roads outside, is covered in metal plates larger than I am tall, and dotted with waist-high metal beams capped with domes made of that same cool-blue metal as the entrance gate.\n\nCenter of the plaza was a raised dais, upon which flickered a large ball of electricity, which then grinned at me in a very unnerving way. If asked, I couldn't tell you how I knew, but I see a face in that ball. That face continues its malicious grin as two arcs shoot out from either side, attaching to two posts on opposite sides of the dais. The figure grows bright and screams in effort, then a thundering crack rips through the air as electricity quickly dashes between those metal beams and a tight net of energy rips me from the ground and levitates me several feet above it. The net stitches up the walls and over the roof of the dome, encapsulating the plaza in a ball of writhing light. The light is intense, and I blink to adjust. I almost miss it.\n\nInstinctually, I try to dodge away from the fast-approaching glimmer in the corner of my eye, but my levitating body finds no purchase as a ball of energy careens from the dais and into me, sending me sailing across the dome's inner surface like a pinball. After the initial shock, I look around to assess my situation, to find that I am hovering a hundred feet over the surface of the plaza, still several feet above the electric net.\n\nI try to shake the vertigo and locate my assailant, and quickly find the sphere has ricocheted off of me and is building up speed on the opposite wall, coming straight back for another strike. I try to move again, but to no avail; there's nothing I can do to move my position. So I center myself and brace for the inevitable impact. The orb bristles with energy, shoots of electricity branch off as it leans into its acceleration even more, deforming with the speed it has gathered. Its eyes go wide and it lets out a scream as the distance evaporates and it connects with my body."
        }),
        spark_portal: new Lore(
        {
            index: 1910,
            
            check: function()
            {
                return get_default_struct_value(o_game.data.stats.areas_time, global.areas.spark_portal.key, 0) > 0;
            },
            
            name: "Spark Portal",
            description: "But this time, I'm ready.\n\nI let the electricity flow through me, mentally willing it to begin to circulate through my limbs and back to my center, faster and faster as more of the orb's energy is transferred into me. The screech of glee from the creature turns to shock and then terror as it swiftly begins to dwindle into nothing, and with a final spark, dies out. However, the whirlpool of energy within me is clawing at my willpower, and I look for some sort of outlet. That's when I notice the dais isn't just a platform; twelve raised girders surround a number of runes that alight in my vision, electric blue against the white nest of static.\n\nFrom dead above, I release a charge from my feet, ejecting me from my locked position and rocketing me towards the dais' center. As I approach, the whirlpool within me begins to vibrate, and I let out a thunderous roar as I am enveloped in energy that connects to the twelve girders, which flash with lightning and connect into a pool of energy. I feel the energy arcing between myself and the pool before me, the two of us connecting and twisting everything until my senses are rendered useless. I've been in nothingness before, I have felt the kiss of the cold Void, but this is something different.\n\nEnergy, very much alive and everywhere, surrounds me. Is me. I become a spark in a sea of lightning, enormous bolts snaking through crowds of motes. I'm jostled, thrown about, unable to find my footing, but I keep my mind focused. I am nothing but energy, nothing but unrealized potential. A wave begins to form around me, raising me above those flecks of energy that surround me. That wave begins to undulate, a ripple growing larger and larger as I tap into the energy of my inner whirlpool, and I can feel something beginning to stretch in the vastness around me. I will myself to push the wave further out, reaching out with my will, and I can feel the wave begin to crest. With the sound of a thunderbolt, I exit that sea of energy and enter into... something new."
        }),
        energy_shrine: new Lore(
        {
            index: 2000,
            
            check: function()
            {
                return area_bought(global.areas.plasma_forest);
            },
            
            name: global.areas.energy_shrine.name,
            description: "As my consciousness begins to settle in these new surroundings, my mind feels adrift in the lack of stimuli. My limbs continue to shake with energy as I steady myself, dropping to a knee to keep from completely falling over. My ragged breaths carry out into a vast emptiness, and my eyes cast about the darkened room for a hint as to my new location.\n\nThe room is large, easily one hundred meters in diameter, with five structures emerging from the metallic floor: four pillars, each equidistant from a large dome placed in the center, its copper-colored surface pitted with ornate lines and divots. Could those be some kind of circuitry, or runes perhaps? The pattern repeats between each of the surrounding pillars, could they be connected somehow? I walk over to the nearest pillar to examine it more closely, and I find that this one has grooves similar to the dome, but a faint blue light emanates along its course.\n\nThe markings lead to an opening on the back side, opposite the dome, and I discover an unsealed compartment. On the top and bottom are two discs, each with those lines converging on their sides. Is this where you put some sort of power source? With nothing better to do, I stroll to the other pillars, each with an identical design and empty compartment save the color emitted changing to green, red, and purple. As I finish my promenade, I take in the vast darkness around me, only to be surprised by the presence of four giants floating on the horizon. Not humanoids, but planets; each close enough to display their animated atmospheres full of swirling clouds that obscure the rugged terrain and ambling rivers below. The four planets each glow with a different color, corresponding with the pillar directly ahead of them. \n\n'...Probably a little obvious, but I'll go with it.'\n\nI head back to the blue pillar and walk straight towards the hovering celestial body. My feet stop at the edge of the floor, inky darkness filling the space between me and the giant."
        }),
        plasma_forest: new Lore(
        {
            index: 2010,
            
            check: function()
            {
                return area_bought(global.areas.plasma_forest);
            },
            
            name: global.areas.plasma_forest.name,
            description: "I don't get very far.\n\nI fall straight down off the edge, down unexpectedly towards a... forest?? As I approach the trees, I quickly realize a bigger problem than the branches that swiftly encroach upon me; leaves that arc with electricity fill their boughs. I quickly bring my arms up to defend my head as I dive head-first into the voltaic foliage, leaves of pure plasma breaking from their trees to follow me like a static charge.\n\nI hit the ground into a tight roll as a storm of shocks and discharges circles around me, constantly zapping me with painful bolt after bolt. I struggle to my feet, muscles spasming as my bodily signals are overridden by the electric tempest. I try to blast the leaves away, but as the gust my leaf blower hits them, they seem to use it to circle faster, accumulating even more static to discharge on me.\n\nI collapse to a knee again, and then fully onto the ground as the pain overwhelms me. While my vision begins to go gray with static, I catch a glimpse of a single leaf; circling slower than the rest of the storm, it gently flows into the corner of the leaf blower's push and is gently pushed out and away from me. Then, separated from its source of energy, it dissipates. With the last of my own energy, I turn down the power on my blower, and immediately the leaves go from a raging tempest to a soft waltz out and away from me, where they quickly pop out of existence. \n\nOccasionally twitching, I continue to lay on the ground and just stare up at the canopy, brilliant leaves that glow with power and illuminate the floor below. It's a beautiful sight, when it isn't trying to kill me.\n\nI dust myself off and stand up, and wander back to the edge of the forest towards the azure orb. This time, I don't find blank space, but a small blue portal. \n\n'This better teleport me above some trees full of bubble wrap'.\n\nAnd I step through."
        }),
        planet_edges: new Lore(
        {
            index: 2020,
            
            check: function()
            {
                return global.areas.planet_edge_blue.check();
            },
            
            name: "Planet Edges",
            description: "*An excerpt from a plaque, hidden deep within the Plasma Forest*\n\nLong ago, our civilization faced great hardship. As our population soared, so too did our need. However, our resources were insufficient, and our people suffered. 'Please,' they cried, 'save us from this torment!'. Our greatest minds could not bear to leave their fellow beings to waste away, so they devised a plan. They would tap into an energy source that permeated reality, the foundational power of existence. Should they fail, reality itself would collapse; but they found this superior to leaving so many to the same fate while a select few flourished. To that end, they created a beautiful forest, one whose trees bloomed with pure power and energy. Upon that forest they placed a shrine, one that could harness the power of those leaves and save their people. Once the shrine was completed, our people wanted for nothing, and all was well.\n\n...for a time.\n\nEventually, as generations passed, our people forgot our ancestors' struggles. We began to hoard again, to spend needlessly, and once more we teetered on the edge of collapse as so many died from deprivation. What was once plenty became insufficient, and again our greatest minds dared to meddle with existence to ensure our future. They created windows to parallel realities, and crafted 'keys' to channel their power into the shrine. Our sky became full with our brothers and sisters from adjacent possibilities, and together, we flourished.\n\nBut we had already gone too far.\n\nFor we had not opened three windows, but four. Upon the fifth planet, blackened with rot and corruption, evil had grown unfettered and undisturbed. Until we opened our realities to it. With terrifying speed, the Great Terror breached the windows to our four worlds and brought with it destruction and defilement, the populace either succumbing to putrescence or falling before it. The last of our kind banded together, and dispersed the energy keys to their respective planets. Then, to save our kind and ensure we could no longer destroy reality, we utilized the last of the shrine's energy to upload our populace into a singularity, where we shall remain for time immemorial. \n\nThis monument is a warning to all those who would dare tread in our steps. Please, turn back.\n\nBefore it is too late for you, as well."
        }),
        planet_edge_black: new Lore(
        {
            index: 2030,
            
            check: function()
            {
                return global.areas.planet_edge_black.check();
            },
            
            name: global.areas.planet_edge_black.name,
            description: "...Sweat drips from my brow as the Purple Terror's final cry fades into the air, its form swiftly dissipating and leaving behind a large stone idol; a large leaf with purple runic carvings, the fourth and final key for the strange energy shrine. As I pick my way through the lavender grasses beneath the mauve tree canopy above, I wonder what happened to the people that crafted all of this.\n\nWith such power at their behest, where could they have gone? The thought picks at the back of my mind as I step through the portal to return to the forest beneath the shrine, where a floating disc returns me to that sheer metal floor with four pillars and the copper dome. I begin to place the keys within their respective pillars, each alighting with power as the key couples into the empty compartment.\n\nAs the fourth pillar powers up, a single spark alights upon the dome. It doesn't grow in size, but it does seem to glow brighter and brighter, a single speck hovering in the air with the intensity of an entire star. I begin to walk towards it when I feel the entire shrine lurch with sudden motion. As I steady myself, I look around and see the planets descending into the horizon. No... the shrine is being pulled upwards. I cast my eyes above and see it; like a splotch of ink in a starless sky, a fifth planet dominates the void above me. \n\nWhile I stand around uselessly, the shrine decides to throw me a bone. The dome begins to rise into the air with a whir, surrounded by a disc connected to lines to the still-powered pillars. Beneath it, I see a now-familiar elevator, and I quickly jump on and begin a swift descent into the forest below. It comes to a stop on the ground before an abstract monument, and before it, a plaque in an alien language.\n\nI glance over it quickly, but whatever their message was, it's as lost to time as they are themselves. As the ground continues to quake, motes of colored energy drift down from the platform above. The motes, an assortment of blue, green, red, and purple, settle on the monument and send a ripple of light across its surface. The ripples multiply, recursing over the surface until the entirety shines with brilliant white light, and inside an arch a hazy distortion quickly solidifies into dark nothingness.\n\nA portal to the fifth planet. I think of the lost civilization, and briefly wonder if this is how they met their end. \n\nOnly one way to find out."
        }),
        energy_singularity: new Lore(
        {
            index: 2040,
            
            check: function()
            {
                return global.areas.energy_singularity.check();
            },
            
            name: global.areas.energy_singularity.name,
            description: "My feet struggle to carry me away as the Terror behind me collapses inward, multi-colored beams of light escaping from within its colossal form as it thrashes violently and ravages the land surrounding it. I lose my footing as a tremor rips the ground from beneath me, and I begin to slide down the black surface of the mountain back towards the disintegrating  monstrosity now climbing towards me.\n\nMy eyes briefly glance back up to the sky, to those four planets, and hope that this was not the fate that they met with. However, between them all, a single mote of light catches my eye; that single light from the dome still pierces my vision even now, no smaller than it had been upon the shrine. I look down to a gaping maw, black jaws encapsulating a nebulous void that yearns to consume all.\n\nI reach up to that mote of light, and as my hand meets it within my vision, the black planet falls away as that dot grows to encompass everything. I faintly sense the Terror's last attempt to reach for me, but it succumbs to its injuries and explodes into a cacophony of lights that blend into the white that is overtaking everything. \n\nAfter a time, my feet press upon a surface, and I find myself standing. There is no discernable floor; just an expansive white space. As I try to find anything to look at, a voice calls to me.\n\n'YOU SEEK THEM, AS I SEEK THEM.'\n\nI turn around to a hulking figure, its body surrounding one large red eye with clawed arms and wings that flap lazily, yet it continues to float above me.\n\n'THEY SOUGHT ME, EVOKED ME FROM THE DARKNESS. YET THEY RAN. SHALL YOU RUN AS WELL?'\n\nIt speaks with no voice, yet I hear its words. Without thinking, I dodge to the right, tripping onto the ground as a claw rips into the white void where I had just been standing. The red eye shifts from that spot back to me, and I see its massive pupil shrinks as it hones in on my location. I shuffle to my feet, placing my weapon between me and the monster. My limbs still ache from fighting the Terrors, and I try to keep my face calm as my hands tremble. Its voice rings in my head again, this time, with confusion.\n\n'...IS THAT A FISH?'"
        }),
        ff_portal: new Lore(
        {
            index: 2050,
            
            check: function()
            {
                return global.areas.ff_portal.check();
            },
            
            name: global.areas.ff_portal.name,
            description: "From the safety of our Singularity, we saw the Warrior.\n\nAs foretold, he entered our Energy Shrine through a doorway in reality. He gathered the power of the Plasma Leaves and sought the Keys from the reflections of our home. He ended the Terrors that destroyed our civilizations, and unlocked the hidden Fifth Planet. There, he destroyed the Darkness that our ancestors released upon creation and had sealed away in a meager attempt to stall our demise.\n\nHe reached out to us, and we wrested him from that accursed plane, only for him to be met by the True Guardian. The Terrors might have laid claim to our old homes, but the Guardian kept us withheld in the Singularity like prisoners. Should we have left our sanctuary, it would have consumed us entirely. And we delivered the Warrior straight to it.\n\nBut the Warrior was not to be defeated, as he carried with him the Scales of Justice, the legendary weapon. Battered and bruised from countless battles, the Warrior struggled on against a timeless horror that threatened our very existence, and he won. \n\nBy the ancestors, he actually won.\n\nWith the Guardian defeated, our people could finally leave the Singularity and once again flourish in true reality. But we knew this could not come to pass. Just as the Terror that threatened existence came from a mirror of our world, we were reflections of it as well. Only destruction would blossom from our labors. And so, with the vestiges of our power retained to free us from the SIngularity, we instead opened a portal for the Warrior. We know not to where it led. We know not the trials nor calamity we have beset upon him. However, one thing is for certain;\n\nWhere the Warrior treads, the battle will be won."
        }),
        shadow_cavern: new Lore(
        {
            index: 3000,
            
            check: function()
            {
                return global.areas.shadow_cavern.check();
            },
            
            name: global.areas.shadow_cavern.name,
            description: "I step from the portal, and a wave of heat washes over me. Light creeps over a ridge high above me, the sound of gurgling magma and the odorous fumes of brimstone flow down into the cave I find myself in. I gaze around the cavern, noting nothing of interest among the craggy surface. But then, as I turn to leave, I hear a tiny chirp from behind me.\n\n'...Borb??' <...hello??>\n\nI glance back to see a ball-like creature approach me, like a deflated beach ball made of red marshmallow. It bounces cautiously out of the dark towards me, two tiny bird feet shuffling underneath it with a viking helmet uselessly plopping on top of it. It tries again to chirp at me, but its voice cracks as it coughs instead.\n\n'Oh, um, hello little friend. Are you thirsty?' I ask it, and produce a juice box from my gear. Its eyes widen and it darts towards me, moving much faster than a creature that peculiar shape should move. In a blink, it covers the distance and leaps into the air, snatching the juice box with its beak and crushing it. Juice runs down its face as it relishes in the sugary hydration, and as it finishes it perks up noticeably and begins to chirp incessantly.\n\n'Borb borb borb, borb borb borb borb! Borb borb borb borb, borb borb borb borb borb borb borb borb! Borb borb borb borb borb! Borb, borb borb borb borb borb borb borb borb borb!'\n\n<Oh my borb, thanks a lot stranger! Ragethron  was absolutely parched, and Ragethorn thought Ragethorn was doomed for sure! This borb's name is Ragethorn! Please, take this token as a show of Ragethorn's appreciation!>\n\nThe creature produces a coin from behind it and sets it into my hand. Both sides are embossed with designs. One has an archway with a leaf floating within it, and the other has another spherical creature, this time without a hat.\n\n'Um... thank you? I'm sorry, I can't understand what you want from me. All I hear is 'borb'.'\n\nAs the word leaves my mouth, the token evaporates into a wisp of energy that flies to the ground and produces an archway identical to the coin's. The archway condenses the leftover light into a swirling portal, from which exits another of these creatures, this time green and without a hat.\n\n'Borb! Borb borb borb borb! Borb borb borb, borb borb borb borb borb borb borb borb borb! Borb, borb borb borb borb!'\n\n<Warrior! Borb-knight heeds your call! On your word, Borb-knight ventures forth to worlds unknown to retrieve Warrior treasures! Together, borb-kind shall taste victory!>\n\nThe creature looks at me with determination in its eyes, and I can sense a fire burning within. A yearning for victory. The red one looks back at me with wide eyes, in some sort of awe. I just wish I knew what these guys were saying.\n\n'Hmmm... borb?'\n\n'Borb borb borb! Borb, borb borb!'\n\n<As Warrior commands! Onward, to victory!>\n\nAnd with that, the green ball pivots back to the portal and darts through with a loud chirp, almost like a battle cry, and disappears. The red one bounces up and down excitedly, then hops over to a nook and immediately falls asleep. I decide to let the little guy rest for a bit while I figure this area out, and I head out of the cave."
        }),
        mount_moltenfury: new Lore(
        {
            index: 3010,
            
            check: function()
            {
                return global.areas.mount_moltenfury.check();
            },
            
            name: global.areas.mount_moltenfury.name,
            description: "As I crest the lip of the cave, sweat begins to pour down my skin as the heat swells to unreasonable levels. I gaze out over an expansive terrain, small volcanic mountains dotting a blackened valley with small streams of lava dotting their slopes. The cave mouth is surrounded by such a river, glowing molten rock flowing along while spewing large embers that cool into broad floating sheets of black soot, which drift on torrid eddies. I try to catch one to investigate it further, and it falls apart in my hands like ash. However, as it disintegrates, the remnants coat my hands and somehow block a portion of the heat from my hands. My mouth pulls back into a grin as an idea forms, and I get to work.\n\nSoon enough, I dart across the cliff faces, now shrouded in a layer of soot to protect me from the calidity of the fiery conditions, ash trailing behind me like a shadow in the breeze. I climb up the mountain swiftly, quickly noting as I rise the sheer size of the one I climb compared to those in the distance. Like a dominating beast, it towers over the paltry hills that kneel at its feet.\n\nThe air begins to thin as I ascend, but the heat only increases as magma vents become more frequent. I try to leap from a particularly precarious boulder, but the rock collapses from underneath me and crashes down, crashing and smashing its way down. I manage to catch myself before I follow in its wake, but the sound of the boulder's fall is drowned out by an enormous roar from atop the precipice. I feel the ground rumble as something begins to stir from way above me, and I quickly duck into an alcove to hide from whatever tyrant makes its home atop this eminence.\n\nTo my surprise, I'm not met with the rough interior of a natural cave, but smooth-carved walls inlaid with some sort of hieroglyphic designs. The artwork tells a story of some sort of beast, a massive horned-lion with eagle's wings and a serpent tail, standing atop a large mountain and raining fire upon the landscape. \n\n'Well I guess I know what's making all that ruckus outside.'"
        }),
        fire_temple: new Lore(
        {
            index: 3020,
            
            check: function()
            {
                return global.areas.fire_temple.check();
            },
            
            name: global.areas.fire_temple.name,
            description: "The pictographs along the cave wall depict a vast emptiness, a time before everything. From that emptiness sprang a flame, green and flickering with power; life sprang from its embers, and soon it slumbered within the ground. The chimera, embodiment of greed and avarice, found the flame's hallowed shrine and consumed a portion of that odd green fire, that speck continuing to burn inside the beast and fuel its magical power. Brimming with jealousy, the chimera now guards the entrance to the green flame's temple so that no other being can take the power it has claimed. Upon the entrance to the temple, a magical seal was placed, whose key is known only by the beast itself. With the green flame's power, the chimera let loose a mighty roar that ripped the earth asunder and released torrents of lava. That roar let the world know of the chimera's presence, and the title they would use to address their new king: \n\nSpectralseeker.\n\nThe images crawl along the wall until they meet an ornately carved door, glittering with magical energies and adorned in the center with a flame carved from a giant emerald; light dancing within it like it was a living flame. As I'm captivated by its beauty, I clumsily trip over a rock, kicking it into the door and casting a loud echo about the cave. Then, from the other side of the door, I hear a faint cry.\n\n'...Borb??'\n\n<...Hello??>"
        }),
        flame_brazier: new Lore(
        {
            index: 3030,
            
            check: function()
            {
                return global.areas.flame_brazier.check();
            },
            
            name: global.areas.flame_brazier.name,
            description: "I spend some time trying to open the door to the temple, but the magical energies keeping it sealed don't respond to my attempts. The being on the other side doesn't speak much more; they sound tired, defeated. I decide to return to that first cavern, as maybe I can enlist the help of those odd marshmallow birds to get through this door.\n\nRetreating down the mountain is quiet and swift; the chimera above doesn't cause me any more trouble for now. As I cross the stream of lava and enter the cavern, the red creature begins to jump excitedly and gestures to a large collection of items. As I try to parse through the eclectic mix, a portal opens up and another creature wearing a construction helmet pulls out a pirate hat and adds it to the line of items. Noticing me, it chirps happily as it reopens a portal and disappears through it. The items are an odd mix, but a lot of things also are pretty familiar. Some coins, a leaf, some random clothing items... but then something different catches my eye. I gaze over what appears to be a stone tablet, carved runes painted green seem to say something in a language I can't understand.\n\n...Or can I? \n\nAs I continue to stare at the tablet, my mind swirls with information and I begin to understand the tablet. Or rather, its function. The runes on the front, however varied, all just seem to mean a word I've heard a lot recently.\n\n'Borb'.\n\nI turn to look at my viking hat companion.\n\n'Would you mind telling me your name?'\n\nThe red sphere looks at me with sparkling eyes. 'Of course! This borb's name is Ragethorn!'\n\n'Alright Ragethorn, it's nice to meet you. I came to ask if you knew anything about the temple up the mountain, but I think I got just what I needed here.' I hold up the tablet, and Ragethorn's excitement quickly dwindles to a look of worry.\n\n'Ragethorn is terrified of that place. Ragethorn's friend left many days ago to seek out the great treasure, but Ragethorn fears that friend was captured by Spectralseeker.' Ragethorn wrinkles their forehead as if pondering something deeply. 'Perhaps Warrior could seek out and rescue friend of Ragethorn?'\n\nI smile down at the little guy. 'Yeah Ragethorn, I bet I can.'"
        }),
        fire_universe: new Lore(
        {
            index: 3040,
            
            check: function()
            {
                return global.areas.fire_universe.check();
            },
            
            name: global.areas.fire_universe.name,
            description: "Getting to Ragethorn's friend was the easy part. The tablet, known as a 'Borbcipherer', is able to decode almost anything, and with it I was able to open the temple doors. Inside, I found two chambers. The first, was a large dome-shaped room with a large brazier in the center. Within it burned an iconic green flame. To the room's side was a section of wall that had been carved out, with a wall of bars separating the two halves. On the other side was one of those borbs, adorned in a large-brimmed hat and a leather jacket. Its green color seemed pale under the light of the flickering flame, but it perked up as I entered the room. I was able to free it fairly easily, and then it gave me its name, and a warning.\n\n'Thank you for freeing Borbiana Jones. This is the roughest pickle Jones has ever gotten into. Now... the chimera grows in strength as long as the flame burns. While the flame cannot truly be extinguished, reducing power of the flame will similarly drain Spectralseeker.'\n\nSo Borbiana Jones takes off, its little feet carrying it down the mountain side, leaving me alone to extinguish an eternal flame from which all life in this universe seems to spring from. \n\nAll in all, not the hardest thing I've had to do.\n\nBut as I cradle my badly burnt hands, the cavern trembles under the concussive bellow of a tyrant above.\n\n'SAVOR YOUR BREATH, TRESPASSER. SOON YOUR BONES WILL MELT IN A RIVER OF FIRE.'\n\nWhich is not a sentence you like hearing. Dust begins to fall as the shrine shakes under Spectralseeker's galloping strides, and soon the chimera rears its head. Heads. The serpent tail gazes as me with cold, unmoving eyes and lets loose a hideous hiss and the lion head watches me with the infuriated eyes of a predator. Its yellow fangs bared, it roars at me.\n\n'I DO NOT TAKE LIGHTLY TO FOOLS WHO KNOW NOT THEIR PLACE.'\n\nEmitting a jet of green flame, Spectralseeker begins our epic fight to the death."
        }),
        soul_portal: new Lore(
        {
            index: 3050,
            
            check: function()
            {
                return global.areas.soul_portal.check();
            },
            
            name: global.areas.soul_portal.name,
            description: "Spectralseeker lies upon the ground motionless, save for the uneasy breaths that cycle in an uneasy rhythm. Even now, bloodied and broken upon the ruined mountaintop, hate and disdain ooze from its gaze. Within its heart, the fires of supremacy yet burn.\n\n'You were true to yourself, until the very end. I'll give that much to you.'\n\nI lift my weapon to finish the job, the weight of it heavy with consequence as I swing down. With a sickening crack, I feel the soul of my enemy unshackle from its vessel and begin to descend into the aether. My job done, I turn to make my way back to Ragethorn, when a ghastly roar reverberates through me.\n\n'AS IF DEATH WOULD BE THE END OF MY WRATH, WRETCH!'\n\nI quickly pivot, taking in an incorporeal Spectralseeker with claws wreathed in ghostly flames descending upon me. It's too fast, I can't dodge. My mind seems to race faster than ever, the split second stretching on while I contemplate this turn of fate. I fall back to the ground, Spectralseeker seemingly frozen in time. There's a moment of quiet static behind me, and then a brief pop, when a new voice speaks.\n\n'Oh jeez kid, you can't just let deez big guys discorporate and den leave 'em be. You'll have vengeful spirits comin' out da woodwork!'\n\nI turn to regard my new audience. Floating a few feet off the ground is a large tome, its rich purple cover banded in metal and adorned with a demonic skull, which speaks like it had a long history of driving taxis.\n\n'Look kid, da bigwigs upstairs wanted to trow you a bone, so here I am. Now, I ain't here ta play around, so I gotta ask,' The tome says all this, still regarding the frozen geist behind me, but then turns as a ghoulish green glow alights the skull's eye sockets.\n\n'You lookin' for some real power?'\n\nIt stares at me in silence, the question obviously meaning more than I understand at first glance. It seems like all I ever do is go from one tight spot to the next, constantly reaching for power. Always only just enough. The heat from Spectralseeker's ghost flame still radiates uncomfortably on my skin.\n\n'Let's see what you've got.'\n\nThe tome skull grins with avarice. 'I knew you were da real ting, kid!' The tome darts towards Spectralseeker, halting just before it. The golden bands encircling the cover unclasp, the pages unfurling in a hectic wave of paper. More ghostly flames began to leap off of Spectralseeker's form, flowing into the open pages of the tome. As the flames race, the ghost starts to chip away like old paint, until nothing remains. On the open pages is a diagram of Spectralseeker, and notes scrawled in glyphs and runes that I can't identify but somehow still parse. As quick as the process had started, the pages slam shut again and the gold bands clasp with a crisp click. The tome skull releases a powerful belch, a cloud of billowing fumes cascades down to the ground and pools into a rough circle, which alights with bright purple and blue lights. The tome floats over and jumps in, disappearing. A moment or two later, it pops back up, the skull sitting just above the surface.\n\n'You comin' or what?'"
        }),
        soul_temple: new Lore(
        {
            index: 4000,
            
            check: function()
            {
                return global.areas.soul_temple.check();
            },
            
            name: global.areas.soul_temple.name,
            description: "No sooner than my feet landing on the ground beneath the portal, the tome began speaking again.\n\n'Tanks kid, it's been literally eternity since I had a good soul meal. But dat's all gonna change! Da name's Death Book, but dat's fricken' edgy as hell, so call me DB.' DB eagerly floats over to me, a gold band unclasping and protruding straight out, like a hand inviting a handshake. \n\nI smile and return the gesture, giving the makeshift hand a quick shake. 'Alright DB, it's nice to make your acquaintance. So, what's the deal?'\n\nTaking its band back and reclasping, DB floats in haphazard circles around me, regarding the building we find ourselves in front of. 'As a Death Book, my job is to convert da souls you liberate and process dem into powers for you. It's a real win-win situation. I get gourmet meals delivered via a mass-murderin' dervish of death, and you get power-ups AND a travel companion.' DB beams with a self-aggrandizing pause, clearly thinking the world of itself. 'I'm da best buddy you neva knew you needed.'\n\nI feel the strength DB converted from consuming Spectralseeker's soul, so I know it isn't lying. I decide it won't hurt to go along with this for now. 'Well then best buddy, where have you brought me to?'\n\nDB darts over to the entrance of a large marbled building. Its long-sloping roof sits atop tall colonnades, thick bricks filling the gaps of the walls. An open arch at the front leads into a wide atrium, statues inside flanking a set of stairs that lead into the darkness. 'Dis, my friend, is the Soul Temple!' DB proclaims the name loudly, trying to evoke a clear gravitas. 'Basically, it's where some strong-as-hell souls have been cooped up for too long, and now you gotta go trough and clear 'em out.'\n\n'And you get to eat all the defeated souls?'\n\nDB clicks its nonexistent tongue. 'I could, but dey ain't worth nothin'. Nah, no good souls for da eatin' until you get pretty deep in.' DB's skull grinned with devilish hunger, 'but den there's da entree.'"
        }),
        soul_crypt: new Lore(
        {
            index: 4010,
            
            check: function()
            {
                return global.areas.soul_crypt.check();
            },
            
            name: global.areas.soul_crypt.name,
            description: "We quietly descended down the stairs, our way lit by the green glow coming from DB's eyes. I press him for more details on this place, since he seems to know about it.\n\n'Throughout da Leafverse exist a multitudinous amount of beings. True beings have souls. Now, I know you fleshies get hung up on da term 'soul', but the connotation here is a bit different, so don't get your chapters out of order. Souls, once made, can't just be 'unmade'. If the life force of the corporeal form dey inhabit goes caput, den dey get untethered. But dat's no good neither, so dey get pulled to places like dis one. Da head honchos, dey've got 'em all over da place. It's a big existence, after all.'\n\nMy eyebrows bunch up in thought, parsing the information. 'That makes sense. What was that you said though, the 'Leafverse'?'\n\nDB nods sagely. 'Yeah kid, the Leafverse. You know, like, everyting. This specific branch of reality, along wit all da sub-branches, all originate from an existence intrinsically tied to da Leaf. You can't tell me you didn't notice?'\n\nEmbarrassment flushes my face as I respond, 'Well yeah, it seems like this all started forever ago when I was cleaning my yard of leaves. Then it seemed like one place after another, leaves of all sorts were found. Rock leaves, energy leaves, it seems like if something exists, there's a leaf-form of it.'\n\n'Well dere's a reason for dat. It's leaves all da way down, kid.'\n\nI can't help but ask, 'But... why?' \n\nDB stops abruptly, its skull looks at me with a serious composure. 'You sure you wanna know?'\n\nI nod.\n\n'So, in da beginning, dere was nothin', right? But den, BAM! A big explosion of light and matter, all jumbled up in dis terrifying knot of... well, everyting. But, instead of just goin' out and makin' up stars and planets and dentures and Ska bands, all dis stuff coalesced into a tree. DA Tree. Da Tree was more den just normal stuff; it was light, it was matter, it was magic and energy and all of it. From one of dose branches, your universe blossomed. You found yourself on a metaphysical leaf, and traced your way up a metaphorical vein and back up the branch into a larger part of Da Tree. Den you met me, and here we are!'\n\nI stand there, awe-struck. 'Holy... you mean all of it, this whole journey, has been because the Big Bang actually came from a Pseudo Big Bang that first made a thing called 'The Tree'?'\n\nThere's a pregnant pause, then DB breaks out in a maniacal cackle. 'Bwahaha, dude, you shoulda seen your face! I had you goin' real good! Like I know where or how or why it all came to be, I'm just a book. Anyway, you gonna do somethin' 'bout dose rogue souls headin' our way?'"
        }),
        soul_zone: new Lore(
        {
            index: 4020,
            
            check: function()
            {
                return global.areas.soul_zone.check();
            },
            
            name: global.areas.soul_zone.name,
            description: "We move from floor to floor, clearing out the vengeful souls that roam the halls. While DB says he doesn't want any of these 'garbage' souls, he doesn't let them go to waste. Since the souls are already discoporated, or without a physical form, you can't 'kill' them like a normal enemy. Once their energy goes to zero, they enter into a trance-like state. If left alone, they'd slowly recharge and begin rampaging again. To prevent that, DB takes these minor souls and converts them into Soul Stones, and I can craft all sorts of things with those.\n\n'Deez are still lower quality tings, even with all da refining I did. Da souls had a definite form, and trying to take dat and convert it to anyting else will have losses. If my notes are correct, you should get access to some more potent soul energies as we get further down.'\n\nWe pause at the end of the hall, twenty floors deep already. The path splits; a stairwell continuing down, and an ornate door of ancient carved marble. Spectral energy flows through the stone as if it was sunlight through deep water, the blue-purple glow ebbing and flowing under the carved image of a creature. The shape of it seems to wax and wane, not giving a clear image of what we're looking at, and yet somehow the stone seems unmoving.\n\nI nod my head to the doorway. 'Hey DB, this where that big meal is?'\n\nDB sniffed at the air like a cartoon following the trail of a pie, 'No, but it's still good. A lil' appetizer. And it's guarding someting real good.'\n\nAs I step forward, the towering stone doors groan as they split apart, a blinding flash of light breaking through the gap. From within, a shifting form of blue and purple races out and careens into me, sending me flying back across the hall. I quickly hop back to my feet and take a stance, fish-blade at the ready. The creature shifts again as it hurtles towards me, its hulking form stretching out into lanky limbs with terrible claws. I move to strike as it gets within range, but the blade passes through its form as a claw rakes at my chest. While I attempt to fall back and reset, DB calls out to me. \n\n'Kid, raise da fish!'\n\nI jump back to create distance, and I hoist the fish-blade into the air. The creature roars an otherworldly bellow, leaping at my open form, as I hear a loud *HURK* from behind me. Shimmering blue-purple soul energy shoots from DB's skull mouth, infusing into the fish-blade. Its scales soak in the energy, becoming iridescent themselves. As the jaws of the creature morph wide and move to snap on me, I swing down."
        }),
        soul_forge: new Lore(
        {
            index: 4030,
            
            check: function()
            {
                return global.areas.soul_forge.check();
            },
            
            name: global.areas.soul_forge.name,
            description: "Like a mirage, the creature fades into nothingness as the blade bisects it a final time. As its shimmering form dissipates, the room seems to respond and shifts rapidly. The walls, once dark and devoid of markings, grow in rectangular patterns, squares upon squares. A warm light, like the pink rays of dawn, filter through the walls and mix with the glow emitted from an anvil that has sprouted from the room's center. Blues and purples mix and rotate within the strange metal, like it was crafted from ore made of souls.\n\n'Oh sweet, a Soul Forge!' DB exclaims excitedly, quickly floating over to the anvil and laying on top. 'Quick, take that lil' hammer der and smack me with it!'\n\nI notice a matching hammer rests at the anvil's foot. I stare back at DB incredulously.\n\n'What? Did I say somethin' stupid?' It pauses in thought, and its eyes go wide with realization. 'Oh my leaves, kid! What was I thinkin'?? You can't just hit me with a hammer!'\n\nI smile, relieved that the tome has at least a little common sense.\n\n'You gotta infuse da hammer with souls first! Den whack me with it!' Clearly satisfied with their thinking, DB lays back upon the anvil.\n\nWell, DB is a fully sapient individual who should know what's best for them. They want me to hit them with a hammer full of souls, who am I to argue? I lift the hammer, which has a hefty and condensed head made of a dark ore. I take out one of the more refined Soul Stones, one that DB calls a Soul Flask. An odd name, given the soul energy inside is more solid than liquid. I press the Flask against the hammer, and the entire container is swifty absorbed, making the hammer glow with that same blue-purple soul energy. Hammer infused, I regard DB again; it continues to lay there, eyes closed without concern. DB is whistling a tune by this point, an act that baffles me considering the skull face has no lips. With a shrug, I bring the hammer down and get thrown back by a powerful wave of energy and light. As quickly as the light began, the room darkens once more. DB floats there, its eyes no longer glowing with a ghostly green but with the same shifting colors as soul energy.\n\n'Oh, holy cannoli kid! Dis feels incredible!' The tome zips around the room, making several full laps before practically screeching to a halt in front of me. 'Okay, got da zoomies out. So, you've upgraded my soul-processing capacity. Basically, you've imprinted empty soul leaves in my blank pages. Dose will passively collect all the low-energy souls dat are too weak to coalesce into corporeal forms. Collect enough, and I convert all dat into a Soul Leaf.'\n\nI give DB a moment to continue, but note that it has clearly finished its explanation. 'And soul leaves are good because...?'\n\n'Upgrades, same as always.' DB gives me an inquisitive look. 'You have been payin' attention, haven't you?'"
        }),
        quark_portal: new Lore(
        {
            index: 5000,
            
            check: function()
            {
                return global.areas.quark_portal.check();
            },
            
            name: global.areas.quark_portal.name,
            description: "DB's eyes flicker with that blue-purple light, its bob upon unseen tides hastening for a few moments while it stabilizes. I notice that it's quiet now, its jovial banter interrupted. I'm unsure how to broach the subject with it; how does one comfort a sapient book? Does it even need comfort? I scratch my neck in hesitance. Aside from those odd borb creatures, I really hadn't spent much time around other people in the last indeterminate period. And yeah, I'd count DB as a person. Even with all the blustering, it made a good point talking about souls, and it's not like I would be able to tell any different. \n\n'I can hear 'em all, kid.'\n\nI stumble out of my thoughts at DB's sudden statement. Hear them all? \n\n'The souls? I thought you, I don't know, digested them?'\n\nIt nods with eyes closed in sage acknowledgement. 'In a manner of speakin', yeah. So, souls. There's a bunch to 'em. But, for da time bein', let's simplify it to two pieces: da shell, and da true soul. True souls by themselves, dey ain't got enough substance to stick around. Like da air in a balloon; pop da balloon, air don't stick around. Da soul shell is basically a balloon made of da same stuff as da universe. But, like balloon without air, it's just stuff. Takes a true soul to fill dat balloon out and get it to go play pickleball or evade taxes. Each universe creates its own flavor of soul shell, but da true soul is always da same. Can't get smaller den dat. Anyway, da stuff I'm eatin' is just the soul shell. I can't do anytin' with da true soul, dey're just stickin' around inside my pages. Without da soul shell, it ain't like dey're sayin' nothin' specific, but it's like a far off echo in a cave. Or a fart from the nosebleeds in an empty stadium. You understandin'?'\n\nDepravity aside, I think I understand what DB is describing. 'So you're just accumulating these true souls with nothing to do with them, and they're weighing you down? Can I help with that?'\n\nDB chuckles softly. 'Kid, make sure you don't go conflagratin' yourself to heat anotha. Just keep doin' what comes natural, we'll find a purpose for all dese little guys.'\n\nAs DB finishes its thoughts with a satisfied nod, its eyes go wide. With a sudden retch, DB produces a deep pink ball of phlegm. The goop begins to seep along the ground, spreading out to a large oval.\n\n'Leftovas from dat Soul Mirage ting. Probably nothin' to worry about.'\n\nThe oval, accomplishing some unknown configuration, shifts inward upon itself, dragging me and DB along with it."
        }),
        fabric_universe: new Lore(
        {
            index: 5001,
            
            check: function()
            {
                return global.areas.fabric_universe.check();
            },
            
            name: global.areas.fabric_universe.name,
            description: "We once again walk the halls of the Soul Crypt, our little foray into the Quark Nexus over. I had thought that the strength I had achieved there would be left behind, but I can feel the quark energy still coursing through my blade. The fishblade is an interesting weapon; it seemed to cut through my enemies, but my strikes were more of a slap with the broad side. I chalk it up to another mystery for the ages. Sure would be nice to have a rifle like Bob's.\n\nThe air had been getting heavier as we continued, an air of expectation or significance filling out the space more than the sparse rooms would otherwise contain. Eventually, the corridor expands into a great hall, a circular affair with a towering crystalline pillar in its center. Within the clear structure floats a cube of some sort, its faces rotating in and out of itself in a way that was difficult to describe. A tesseract, I think. Bob had mentioned those before, when I could get him to open up about his interests. Before the object, a hulking figure stands guard. Vaguely humanoid, like a suit of armor hewn from ore by time itself. Its eyeless visage regards me, somehow I can tell. Our gazes lock, and time seems to stand still. Without motion, without a word, I can feel my worth being weighed by this being, the value of my actions and intents measured upon some unknowable scale. Moments stretch into eternity, time forgotten in that instant. And then, it stepped aside, the cacophonous grinding of its body jolting me out of my stupor.\n\nDB floated into me in its attempt at a nudge. 'Take the victory, kid. Some people spend ages on dis dude.'\n\nI walk forward to examine the tesseract. The shifting patterns of its surface are fascinating, waves undulating over and over in and out of itself. Hypnotic shapes call out to me, drowning out the world. All I see is the tesseract. If I just reach out...\n\n'Hey uh, kid? You doin' okay?'\n\nI snap back awake, the dream-like trance I was lulled into shattering at DB's question.\n\n'Oh, wow. It really got its claws in me. I shouldn't take it lightly.'\n\nA sound like grinding stones emanates from the hulking guard, and I realize it to be spoken words.\n\n'Hero of the Leafverse. I am known as the Warden. For an eternity, I have stood watch over this prison, ensuring its captive remains and none release it to the world. You stand before me and have been judged. You are worthy to enter. Be warned; within the Primordial Ethos, the entity has near-omnipotence. While you are fated to end its existence, the Weaver can undo the threads of fate. Good luck, Hero. Be victorious.'\n\nAs the voice finishes, the Warden's form loses cohesion and begins to drift in a calm breeze, dissipating like mist in the sun.\n\nDB turns back to regard me.\n\n'A little melodramatic, but I appreciate da theater of it all.'"
        }),
        quark_nexus: new Lore(
        {
            index: 5010,
            
            check: function()
            {
                return global.areas.quark_nexus.check();
            },
            
            name: global.areas.quark_nexus.name,
            description: "Bob startled awake from unconsciousness.\n\nHis ears rang and there was a splitting pain in his head. Eyes closed, his mind stumbled around in an attempt to piece together what had happened. Had he been drinking? No, he hadn't had a drink in weeks. He'd been too devoted to the project to waste time drinking. \n\nThe project!\n\nThe memory of claxon ringing and flashing red alarm lights jumped to Bob's mind. They had been attempting to generate energy from those strange coins by recursing power from those gem-like leaves when an unexpected flux disturbed the refractory matrix. The pulse from that explosion... Bob could vaguely recall being pulled from himself, watching his body remain behind as his consciousness was pulled downward, cascading past cells, molecules, and atoms before it all went to black. That black now began to glow with a pink light, and Bob opened his eyes to a strange sight; nothing. Nothing, save for a leaf of oscillating pink light floating before him. He reached out with arms similar to but not quite his and seized the leaf.\n\n-\n\nBob made quick progress in this strange new world. Through sheer mental comprehension, he was able to enact his will upon his surroundings. He crafted space and tools designed to investigate these strange leaves. He could feel the energy contained within them, his studies quickly concluding they exhibited attributes related to quarks. However, they were muddled; quantum. He would need to produce infrastructure to appropriately process the leaves into separate quark flavors. As blueprints and calculations flooded his mind, Bob chuckled to himself. Scientists were a funny group. One minute, they'll be ruminating on the spin-statistics theorem and Pauli exclusion principle, and the next they're calling fundamental particles flavors. Materials coalesced from scant quantum energy before Bob, and he chuckled again. \n\nLike this was any more mundane."
        }),
        quantum_aether: new Lore(
        {
            index: 5020,
            
            check: function()
            {
                return global.areas.quantum_aether.check();
            },
            
            name: global.areas.quantum_aether.name,
            description: "There were always setbacks in science.\n\nAs Bob moved on through the space he dubbed 'Quantum Aether', he iterated time and time again upon his designs. Quark leaves were gathered and processed in reactors to produce pure quarks of the six flavors. A number of products could be produced through this process, leading to a feedback loop of advancements pushing towards further advancements. Bob had found a deep satisfaction for this phenomenon, enjoying his work with greater fervor than ever, but perhaps not with the level of fanaticism as his time in the Agency. \n\nHis bliss was constantly interrupted, however. It seemed that, as Bob moved through the Aether and put order to the quantum space, entities appeared as if spawned in juxtaposition. Strange obelisks and shifting clouds of shadowy-probability constantly attacked his newest machines, each one disappearing as they made contact, as if matter and antimatter collided, sans behemothic explosion. Just a plop of displaced space equalizing over their absence. A plop sounded from behind Bob, and he sighed at the loss of his most recent machine. He could make them easier and better every time, but the losses were a serious detractor. \n\nWhen he first experienced this development, he steeled himself to action, only finding his fists bouncing off of or simply phasing through the semi-corporeal bodies of the creatures. Flummoxed, Bob endeavored to engineer a solution. It didn't take long (but Bob felt a pang of shame at just how long) to connect two and two. Utilizing processed Quark Leaf energy, Bob was able to stabilize the quantum phase of the beings. With great satisfaction, he proceeded to bludgeon them into unexistence. \n\nNow THAT was a most satisfying result."
        }),
        astral_oasis: new Lore(
        {
            index: 5030,
            
            check: function()
            {
                return global.areas.astral_oasis.check();
            },
            
            name: global.areas.astral_oasis.name,
            description: "Being hit back? Not so satisfying.\n\nOnce Bob had proven the stabilization effect of quantum energy upon indeterminate-phase monsters, he was smooth sailing. Progress led to advancement which led to growth, all the while attracting more and more creatures. Bob wasn't too upset by this point; he could extract a fair deal of energy from the monsters themselves, so spending attention and energy in dealing with them was more of an investment than a loss. Bob was putting the latest touches on his most recent reactor when he realized how quiet it had been. Normally, within the last few metaphorical turns of the wrench on any iteration, monsters would be crawling out of the quantum woodwork. However, it was just quiet at the moment.\n\nBob took the juncture of confusion to gaze about, scanning his surroundings. There, not far off, he saw a number of those quantum entities congregating. Strangely, they weren't focusing on his technology, but instead themselves. Bob watched as the animate pillars rotated around one another, drawing closer and closer until they began to collide and phase together. The pillars mutated into a faceted tree with a split trunk, flat-faced branches extending to either side as a crop of jagged spikes sprouted from the top in a circle. Bob's eyes bulged as a wave of quantum shadows emerged from the ground and phased into the figure, the rough-cut surface becoming a polished metal. Stoney growths evolved into a crown upon a dark helmet, and from a branch-turned-gauntlet erupted a sword that crackled in and out of existence.\n\nBob continued to gawk at the being. Scientific mind racing for theories and possibilities as to the nature of this newcomer, it was a deeper and more animalistic part of Bob's brain that recognized the heavy overhead swing of the sword and forced his legs to jump out of the way. Popping out of a tumble, Bob materialized his Quarkuebus. Resembling a long-barreled rifle, the Quarkuebus was a miniaturized reactor that could deploy concentrated bursts of bi-phase energy which would, upon propinquity, redistribute the target's matter to sundry nearby locations.\n\nIt was a Quantum Gun."
        }),
        dimensional_tapestry: new Lore(
        {
            index: 5030,
            
            check: function()
            {
                return global.areas.dimensional_tapestry.check();
            },
            
            name: global.areas.dimensional_tapestry.name,
            description: "Normally, when you shot someone with a gun that fired ammunition with a composition between that of plasma and antimatter, they would have the decency to stay down.\n\nBob took a moment to make some on-the-fly adjustments to his Quarkuebus as the Arbiter once again began to reconstitute from a pile of debris. Granted, it's not like all the broken pieces would float back together like a pile of blocks reassembling themselves into a tower. Pieces would mash together where they could, getting the general shape right but never the same. Not even all the pieces would make it back into the figure; debris scattered the landscape that was too far from the main mass to rejoin, new bits of pillar and shadow emerging from nothingness to fill the missing mass. As the crown began to distinguish itself upon the incomplete helmet, Bob put a quantum slug through its brow, dropping the figure before it even started. \n\nAnalyzing his most recent results, Bob was sent reeling as a chaotic wave of pressure washed over him. Bob swiftly assessed the field, attempting to pinpoint some unseen origin. To his horror, Bob watched as the myriad Arbiter remnants were drawn together, coalescing into a form several orders of magnitude larger. Jagged shards welded together into an enormous countenance, a sharp maw split open to reveal rows of cruel fangs encompassing a void-like gullet. Slit eyes wrenched open, full of an ever-shifting radiance that emitted bloodlust that landed upon Bob. With a roar, it careened toward him, a never-ending serpent-like body composed of that same malicious force surging forward.\n\n-\n\nBob took a moment for himself as he flew through the air, propelled by a well-timed oscillation of the serpent's body against his person. To be honest, he had done well during the first phase of the fight. These quantum creatures existed in a dual-phase existence, and required stabilization to continue receiving damage. To account for this, Bob's Quarkuebus could switch between two modes, one focusing on utilizing quark energy to condense the enemy into a single phase, and the second mode boring apertures within the enemy anatomy. That had been working fairly well so far. But this serpent was something else. While Bob was able to consolidate the corpus  into a single phase, he lacked the power to inflict any lasting damage. Even limited to just one phase, the enemy was able to adjust its physical composition to heal nearly instantly. If only it didn't have a near-perfect control of its form... \n\nBob gasped in surprise, an idea striking him like lightning. Nearing the end of his impromptu flight, Bob tucked into a roll and dipped behind some machinery. He pulled open his Quarkuebus and began disassembling the handover matrix, the piece that managed the weapon's discharge type. Mentally designing a new component, Bob manifested it using his personal quark energy battery and installed it into the matrix. The Quarkuebus began to whirr with new life. Bob rolled back out into the open, the serpent spotting him and darting forward with jaws gaping. Taking aim, Bob placed a luminous shell into the beast's belly, knocking it down. Roaring in anger, the serpent moved to lift itself up only to fall back down. With apparent agitation, it gazed down at the slug wound to see a continuously-shifting crater that crackled with pink lightning. Bob had successfully combined the destructive qualities of both quark energy as well as a physical projectile. The beast looked back to Bob, who placed another shot in the beast. And then another.\n\n-\n\nStanding above the corpse, Bob held his hand out. Particles floated free from the disintegrating body, red motes of light carrying with them a portion of the serpent's power. Those motes that made contact with his glove sank in, giving off a sense of warmth. And power. \n\n'Hmmm. An intriguing development.'"
        }),
        ante_leafton: new Lore(
        {
            index: 5050,
            
            check: function()
            {
                return global.areas.ante_leafton.check();
            },
            
            name: global.areas.ante_leafton.name,
            description: "I take the moment of quiet to process the haul of quark leaves from the Cosmic Dragon. It had looked more like a serpent, maybe even a wyrm if you like to get specific with your nomenclature. But DB said, at least according to his Universal Monster Index, it was considered a dragon. Either way, its corpse continues to disintegrate into floating wisps of red light as I utilize the strange quantum tech found across this land. It's odd, coming across items left by others in an existence like this, but a welcome one.\n\nI recall being baffled when I first walked through the portal, my senses being swept away from me, but I was also carried with those senses and sent downward, inside everything. It hadn't taken DB long to figure out we had entered a Quark Portal, placing us in a Quark Nexus.\n\n'Hey kid, remember how I said dat true souls get covered wit some sort of shell dependin' on deir universe? Well, dis is where dat happens. Which means...'\n\nDB made a few heaving noises before a waterfall of opalescent light erupted from its mouth. Rather than pooling on the ground, as with the remains of the Soul Mirage, the light gently floated off, attracting particles of pink light and disappearing with a gentle 'plop'.\n\n'Tanks kid, I appreciate da assist. Feels good to be reintroducin' souls back to da world.'\n\nI'm pulled from my memory as DB slams into me, taking me to the ground with a startlingly-strong tackle. I barely have time to consider it before I hear the sound of a high-pitched electrical discharge, followed by the crack of an object colliding into the ground where I had been standing. I'm not even on my feet again before another discharge, making me leap to the side to avoid the hit. I scramble behind a nearby reactor, putting it between me and the origin of the sniper shots. Who the hell is that, and how in the hell do they have a GUN??\n\nWell, guns are fired by people, and people can be reasoned with. I lean over and shout out, 'Don't shoot! I'm not hostile!' Silence. I think to myself, maybe I can attempt to negotiate or trade...\n\nThe barrel of a futuristic gun, something like a coil gun, materializes in front of my face. DB starts to move towards me but the individual holding the gun throws a contraption down that generates some sort of structure around DB, locking it in place. The stranger keeps the rifle trained on me, their face obscured by an opaque glass dome set atop a gnarly shawl draping over their shoulders. After a tense pause, the stranger removes a hand from the rifle to press a small button at the base of the glass dome, which retracts in an instant to reveal a face. A face I remember from so long ago.\n\n'Bob?!'\n\n-\n\nWe sit in a small sitting room as Bob fixes a few glasses of tea. Honest-to-god tea.\n\n'I still find taking the time to prepare the tea, rather than just generate it, leads to a more enjoyable experience overall.' He hands a saucer and cup to me, taking his and retreating to a worn-in recliner opposite the couch we sit on. 'DB, you sure I can't interest you in any? The spice profile I've come up with is recent, but I'd call this experiment a success.' \n\nDB sits on the cushion next to me. I don't think it actually gets tired from floating, so to see it sitting is amusing.\n\n'Nah, I'm good Doc. Not unless you got some sort of soul blend in one of dose cupboards you got.'\n\nBob chuckles softly. 'No, I'm afraid not. While working with quarks has lead to some exotic and interesting outcomes, I'm still working with materials quite a bit more mundane than souls.' He closes his eyes and lifts the cup to his lips, gently blowing steam from the top before taking a quiet sip. 'Ah, that is pleasant. You can't forget to take time for yourself when you're caught in a liminal space for an apparent eternity.' He enjoys another sip before lowering the cup. 'I'm glad to see a familiar face. It's been a bit lonely down here. That said, I've never been one to require companionship, and the secrets I've been unlocking...' Bob looks off to the distance, momentarily distracted by some memory. 'Anyway. From what you tell me, you're only transient. I'll do what I can to prepare you for the challenges that still await you.'\n\nBob sets his cup atop a small end table and stands up, taking a boot and dragging it across a rug and flipping it to the side. Beneath the rug, covered by a thick glass-like material. From within, a well-like structure descends down into a world of cascading colors and shifting lights.\n\n'I've been digging a pit. Wanna check it out?'"
        }),
        leafton_pit: new Lore(
        {
            index: 5050,
            
            check: function()
            {
                return global.areas.leafton_pit.check();
            },
            
            name: global.areas.leafton_pit.name,
            description: "Bob had been doing pretty well for himself.\n\nHis experiments into quark compositing had led to some impressive results, such as the ability to construct any matter he wished from the ground up. After a short-lived period of crafting diamonds, jewelry, and large monuments in his likeness, Bob settled down a bit and made himself a nice little house. A single-story white house topped with blue-grey shingles. Large bay windows in the front overlooked a small garden.\n\nNothing grew there, as while he was able to generate matter, crafting biological materials, and then ensuring those were currently alive? Beyond his limits. But he had chosen a smattering of nice rocks, and had even placed a garden gnome atop a boulder to watch over the little plot. He had painted a similar one as a child, his mother placing it in with her buttercups, where it slowly submerged under mulch and weeds. Inside, the yellow entry door opened into a small hall, a sitting room to the left, a kitchen ahead, and a bedroom to the right that amounted to nothing more than a small bed and desk. The kitchen was quaint; wooden butcher block tops and white cabinets adorned with dark bronze button handles. Bob's father had renovated his own kitchen in a very similar manner, before age had taken away his virility. Bob did his best to recreate the look of it, but chose to replace the gas stove with an induction top. His mother had insisted that gas cooked better, but Bob could never see anything more than a lot of wasted energy heating the air and not the pan.\n\nA rack of spices abutted the wall behind the stovetop, small green glass jars labeled with white stickers and hand-written names. Bob had tried to organize them a number of ways, but he had always been utilitarian, and had ended up just letting them go where they would go. It was typically more convenient that way. He took one of those jars, one on the top row near the end, labeled 'clove', and removed the lid. He sprinkled just a bit of it into the still steaming teacup in front of him, replaced the jar, and took a whiff. It needed to steep more, but the mixer was coming along well. He lifted the cup and walked out of the kitchen and into the living room, passing by a small breakfast bar with two wooden stools. The stools were made to have the same carvings and graffiti under the seat, artwork existing in a world hidden from the towering gazes of adults, but unforgettable to him and his cousin.\n\nShe was the closest thing he had ever had to a sibling or best friend, and he basked in the memories of his childhood family as he sat down in a worn armchair. It groaned with age, but the soft cushions were a comfort like no other. The upholstery was a thick cloth material, a garish deep yellow-green, like the root of some sort of bog plant. But his mother had loved that chair, stitched it back up time and time again after he would jump on it too hard or after his father would accidentally stick it with an errant tool. Bob recalled his dad moving the chair to his mother's hospice room after the diagnosis. Most of the time, she couldn't get out of her bed. But he could still remember the few times he'd walk in on a visit, his mother looking up from one of her cheap romance novels as she basked in the afternoon light that fell through the window on that chair. He had taken it to his own house after she passed, his dad insisting on it.\n\n'I can't guarantee I wouldn't put a sawzall through it day one,' his father opined. His cousin had helped him get it home after his mother's celebration of life. Her urn, a simple white container adorned with a dove, had sat in her chair for the occasion one last time. That ride had been quiet. His cousin moved away a few months later, her parents having moved south to warmer climes and a new research position opening up for her at a well-respected institute just a few hours from them. Bob hadn't heard much from her since then, but would see her name on papers and patents every so often. When dad passed, he had cut the legs off the stool and shipped the seat to her without further communication. His own projects had kept him from the house more and more often, not even offering him the time to enjoy his old armchair, let alone a rickety-old bar stool. She had sent a letter back, just a week or two later, but Bob hadn't taken the chance to open it. Not with how busy the Agency kept him. \n\nAs Bob sat there, eyes wet from memories and tea long cold, he was glad for his life. It wasn't perfect, but what sadness called to him was from mourning the happiness he had been fortunate enough to feel so many times before. And now, in this strange new quantum world, he gave a silent thanks to everyone that had cared for him along the way. \n\nHe coughed in sudden embarrassment, a single tear quickly wiped away on a rough sleeve as he regarded the pit dug in the middle of his living room. It was the most unique feature to the recreation of his parents' old place, the ground giving way to a swirling eddy of various lights. Every now and then, eldritch limbs would begin to slowly scale the rough-hewn walls, giving Bob ample time to poke it back down with a burst from his Quarkuebus.\n\n'Now, what do I do with you?'"
        })
    };
    add_keys_to_struct(global.lore);
    global.lore_sorted = struct_to_sorted_array(global.lore);
}
