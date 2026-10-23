function init_galaxies()
{
    global.galaxies = 
    {
        leaf_galaxy: new Galaxy(
        {
            name: __("Leaf Galaxy"),
            index: 0,
            level: 1
        }),
        sacred_nebula: new Galaxy(
        {
            name: __("Sacred Nebula"),
            index: 10,
            level: 2,
            
            is_obfuscated: function()
            {
                return !global.areas.exalted_bridge.check() || !global.areas.black_leaf_hole.check();
            }
        }),
        energy_belt: new Galaxy(
        {
            name: __("Energy Belt"),
            index: 20,
            level: 3,
            
            is_obfuscated: function()
            {
                return !is_unlocked_plasma();
            }
        }),
        fire_fields: new Galaxy(
        {
            name: __("Fire Fields"),
            index: 30,
            level: 4,
            
            is_obfuscated: function()
            {
                return !is_unlocked_fire_fields();
            }
        }),
        soul_realm: new Galaxy(
        {
            name: __("Soul Realm"),
            index: 40,
            level: 5,
            
            is_obfuscated: function()
            {
                return !global.areas.soul_temple.check();
            }
        }),
        quark_ambit: new Galaxy(
        {
            name: __("Quark Ambit"),
            index: 50,
            level: 6,
            
            is_obfuscated: function()
            {
                return !global.areas.quark_nexus.check();
            }
        }),
        umbral_cluster: new Galaxy(
        {
            name: __("Umbral Cluster"),
            index: 60,
            level: 7,
            
            is_obfuscated: function()
            {
                return !global.areas.tenebris_field.check();
            }
        })
    };
    add_keys_to_struct(global.galaxies);
    global.galaxies_sorted = struct_to_sorted_array(global.galaxies);
}

function init_galaxies_late()
{
}
