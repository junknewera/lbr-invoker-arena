function init_weapon_types()
{
    global.weapon_types = 
    {
        blowers: 
        {
            name: __("Blowers"),
            index: 0
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
    };
    add_keys_to_struct(global.weapon_types);
}
