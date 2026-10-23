function init_materials()
{
    global.materials = 
    {
        ash: new Material(
        {
            name: __("Ash"),
            sprite: spr_material_ash,
            spawn_area: global.areas.volcano
        }),
        bar_coal: new Material(
        {
            name: __("Coal Bar"),
            name_plural: __("Coal Bars"),
            sprite: spr_material_coal_bar,
            spawnable: false,
            daily_reward_modifier: 0.1
        }),
        bar_copper: new Material(
        {
            name: __("Copper Bar"),
            sprite: spr_material_copper_bar,
            spawn_area: global.areas.harbor
        }),
        bar_iron: new Material(
        {
            name: __("Iron Bar"),
            sprite: spr_material_iron_bar,
            spawn_area: global.areas.harbor
        }),
        battery: new Material(
        {
            name: __("Battery"),
            name_plural: __("Batteries"),
            sprite: spr_material_battery,
            spawn_area: global.areas.antarctica
        }),
        batwing: new Material(
        {
            name: __("Bat Wing"),
            name_plural: __("Bat Wings"),
            sprite: spr_material_batwing,
            spawn_area: global.areas.mountain
        }),
        bone: new Material(
        {
            name: __("Bone"),
            name_plural: __("Bones"),
            sprite: spr_material_bone,
            spawn_area: global.areas.abyss
        }),
        butterfly: new Material(
        {
            name: __("Butterfly"),
            name_plural: __("Butterflies"),
            sprite: spr_material_butterfly,
            spawn_area: global.areas.celestial_plane
        }),
        cloud: new Material(
        {
            name: __("Cloud"),
            name_plural: __("Clouds"),
            sprite: spr_material_cloud,
            spawn_area: global.areas.celestial_plane
        }),
        dark_matter: new Material(
        {
            name: __("Dark Matter"),
            sprite: spr_material_dark_matter,
            spawn_area: global.areas.space
        }),
        essence_cosmic: new Material(
        {
            name: __("Cosmic Essence"),
            name_plural: __("Cosmic Essences"),
            sprite: spr_material_essence_cosmic,
            spawnable: false,
            essence: true
        }),
        essence_dark: new Material(
        {
            name: __("Dark Essence"),
            name_plural: __("Dark Essences"),
            sprite: spr_material_essence_dark,
            spawnable: false,
            essence: true
        }),
        essence_earth: new Material(
        {
            name: __("Earth Essence"),
            name_plural: __("Earth Essences"),
            sprite: spr_material_essence_earth,
            spawnable: false,
            essence: true
        }),
        essence_iridescent: new Material(
        {
            name: __("Iridescent Essence"),
            name_plural: __("Iridescent Essences"),
            sprite: spr_material_essence_iridescent,
            spawnable: false,
            essence: true,
            daily_reward_modifier: 0.01
        }),
        essence_leaf: new Material(
        {
            name: __("Leaf Essence"),
            name_plural: __("Leaf Essences"),
            sprite: spr_material_essence_leaf,
            spawnable: false,
            essence: true
        }),
        essence_light: new Material(
        {
            name: __("Light Essence"),
            name_plural: __("Light Essences"),
            sprite: spr_material_essence_light,
            spawnable: false,
            essence: true,
            daily_reward_modifier: 0.1
        }),
        essence_shadow: new Material(
        {
            name: __("Shadow Essence"),
            name_plural: __("Shadow Essences"),
            sprite: spr_material_essence_shadow,
            spawnable: false,
            essence: true,
            daily_reward_modifier: 0
        }),
        essence_strange: new Material(
        {
            name: __("Strange Essence"),
            name_plural: __("Strange Essences"),
            sprite: spr_material_essence_strange,
            spawnable: false,
            essence: true,
            daily_reward_modifier: 0.1
        }),
        essence_water: new Material(
        {
            name: __("Water Essence"),
            name_plural: __("Water Essences"),
            sprite: spr_material_essence_water,
            spawnable: false,
            essence: true
        }),
        eyeball: new Material(
        {
            name: __("Eyeball"),
            name_plural: __("Eyeballs"),
            sprite: spr_material_eyeball,
            spawn_area: global.areas.abyss
        }),
        feather: new Material(
        {
            name: __("Feather"),
            name_plural: __("Feathers"),
            sprite: spr_material_feather,
            spawn_area: global.areas.neighbors_garden
        }),
        goo: new Material(
        {
            name: __("Goo"),
            sprite: spr_material_goo,
            spawn_area: global.areas.void
        }),
        leather: new Material(
        {
            name: __("Leather"),
            sprite: spr_material_leather,
            spawn_area: global.areas.mountain
        }),
        light_rod: new Material(
        {
            name: __("Light Rod"),
            name_plural: __("Light Rods"),
            sprite: spr_material_light_rod,
            spawnable: false,
            daily_reward_modifier: 0
        }),
        meteor_rock: new Material(
        {
            name: __("Meteor Rock"),
            name_plural: __("Meteor Rocks"),
            sprite: spr_material_meteor_rock,
            spawn_area: global.areas.space
        }),
        milk: new Material(
        {
            name: __("Milk"),
            name_plural: __("Milk"),
            sprite: spr_material_milk,
            spawnable: false,
            daily_reward_modifier: 0.001
        }),
        moon_crystal: new Material(
        {
            name: __("Moon Crystal"),
            name_plural: __("Moon Crystals"),
            sprite: spr_material_moon_crystal,
            spawn_area: global.areas.moon
        }),
        moon_dust: new Material(
        {
            name: __("Moon Dust"),
            sprite: spr_material_moon_dust,
            spawn_area: global.areas.moon
        }),
        mushroom_red: new Material(
        {
            name: __("Mushroom"),
            name_plural: __("Mushrooms"),
            sprite: spr_material_mushroom_red,
            spawn_area: global.areas.garden
        }),
        mysterious_plant: new Material(
        {
            name: __("Mysterious Plant"),
            name_plural: __("Mysterious Plants"),
            sprite: spr_material_mysterious_plant,
            spawn_area: global.areas.mythical_garden
        }),
        oyster: new Material(
        {
            name: __("Oyster"),
            name_plural: __("Oysters"),
            sprite: spr_material_oyster,
            spawn_area: global.areas.hidden_sea
        }),
        pearl: new Material(
        {
            name: __("Pearl"),
            name_plural: __("Pearls"),
            sprite: spr_material_pearl,
            spawn_area: global.areas.hidden_sea
        }),
        power_fragment: new Material(
        {
            name: __("Power Fragment"),
            name_plural: __("Power Fragments"),
            sprite: spr_material_power_fragment,
            spawnable: false,
            daily_reward_modifier: 0.001
        }),
        pumice: new Material(
        {
            name: __("Pumice"),
            sprite: spr_material_pumice,
            spawn_area: global.areas.volcano
        }),
        raw_soul_stone: new Material(
        {
            name: __("Raw Soul Stone"),
            name_plural: __("Raw Soul Stones"),
            sprite: spr_material_raw_soul_stone,
            spawnable: false,
            daily_reward_modifier: 0
        }),
        refined_soul_stone: new Material(
        {
            name: __("Refined Soul Stone"),
            name_plural: __("Refined Soul Stones"),
            sprite: spr_material_refined_soul_stone,
            spawnable: false,
            daily_reward_modifier: 0
        }),
        relic_fragment: new Material(
        {
            name: __("Relic Fragment"),
            name_plural: __("Relic Fragments"),
            sprite: spr_material_relic_fragment,
            spawnable: false,
            daily_reward_modifier: 0.01
        }),
        rose: new Material(
        {
            name: __("Rose"),
            name_plural: __("Roses"),
            sprite: spr_material_rose,
            spawn_area: global.areas.neighbors_garden
        }),
        sand: new Material(
        {
            name: __("Sand"),
            sprite: spr_material_sand,
            spawn_area: global.areas.desert
        }),
        scarab: new Material(
        {
            name: __("Scarab"),
            name_plural: __("Scarabs"),
            sprite: spr_material_scarab,
            spawn_area: global.areas.desert
        }),
        screw: new Material(
        {
            name: __("Screw"),
            name_plural: __("Screws"),
            sprite: spr_material_screw,
            spawn_area: global.areas.antarctica
        }),
        shadow_crystal: new Material(
        {
            name: __("Shadow Crystal"),
            name_plural: __("Shadow Crystals"),
            sprite: spr_material_shadow_crystal,
            spawnable: false,
            daily_reward_modifier: 0,
            persist_prestige_level: global.prestige_levels.ulc.level
        }),
        soul: new Material(
        {
            name: __("Soul"),
            name_plural: __("Souls"),
            sprite: spr_material_soul,
            spawn_area: global.areas.void
        }),
        spider_web: new Material(
        {
            name: __("Spider Web"),
            name_plural: __("Spider Webs"),
            sprite: spr_material_spider_web,
            spawn_area: global.areas.mythical_garden
        }),
        tide_crystal: new Material(
        {
            name: __("Tide Crystal"),
            name_plural: __("Tide Crystals"),
            sprite: spr_material_tide_crystal,
            spawnable: false,
            daily_reward_modifier: 0,
            persist_prestige_level: global.prestige_levels.inf.level
        }),
        tide_crystal_advanced: new Material(
        {
            name: __("Advanced Tide Crystal"),
            name_plural: __("Advanced Tide Crystals"),
            sprite: spr_material_advanced_tide_crystal,
            spawnable: false,
            daily_reward_modifier: 0,
            persist_prestige_level: global.prestige_levels.inf.level
        }),
        wood: new Material(
        {
            name: __("Wood"),
            sprite: spr_material_wood,
            spawn_area: global.areas.garden
        })
    };
    add_keys_to_struct(global.materials);
    global.materials_sorted = struct_to_sorted_array_key(global.materials);
    global.materials_generatable_in_quests = array_filter_custom(global.materials_sorted, "can_generate_in_quests");
    global.materials_spawnable = array_filter_custom(global.materials_sorted, "is_spawnable");
    sort_array_by_key(global.materials_spawnable, true);
    global.materials_shuffled = [];
    array_copy(global.materials_shuffled, 0, global.materials_sorted, 0, array_length(global.materials_sorted));
    global.materials_essences = array_filter_custom(global.materials_sorted, "is_essence");
    global.materials_types = {};
    var __struct = global.materials;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (is_undefined(variable_struct_get(global.materials_types, mitem.material_type)))
        {
            variable_struct_set(global.materials_types, mitem.material_type, []);
        }
        array_push(variable_struct_get(global.materials_types, mitem.material_type), mitem);
    }
}
