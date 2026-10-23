function init_events()
{
    global.events = 
    {
        halloween: new Event(
        {
            name: __("Cursed Halloween"),
            description: cursed_speech(__("It's Cursed Halloween!")) + "\n" + __("Face a pretty known enemy in the Halloween event area which drops some nice event loot!"),
            sprite: spr_icon_cursed_cheese,
            index: 10,
            areas: [global.areas.cursed_halloween],
            auto_artifact_key: "lantern",
            date_start: 
            {
                year: current_year,
                month: 10,
                day: 24,
                hour: 0,
                minute: 0,
                second: 0
            },
            date_end: 
            {
                year: current_year,
                month: 11,
                day: 2,
                hour: 0,
                minute: 0,
                second: 0
            }
        }),
        nature_season: new Event(
        {
            name: __("Nature Season"),
            description: __("Get ready to immerse yourself in a world of greenery as you plant flowers, add water, fertilize, and gain new bonuses. Discover plant synergies to further boost their bonuses. You'll also earn Season XP as you progress through each level, allowing you to unlock new and exciting rewards. But that's not all - you can also breed butterflies to increase your plant XP and progress faster. Don't miss the chance to fight the Doomed Tree and earn exclusive nature season loot."),
            sprite: spr_plant_primula,
            index: 20,
            areas: [global.areas.farm_field, global.areas.butterfly_field, global.areas.vial_of_life],
            auto_artifact_key: "nature_rod",
            date_start: 
            {
                year: current_year,
                month: 5,
                day: 1,
                hour: 0,
                minute: 0,
                second: 0
            },
            date_end: 
            {
                year: current_year,
                month: 8,
                day: 1,
                hour: 0,
                minute: 0,
                second: 0
            },
            
            is_active: function()
            {
                if (is_dlc_claimed(global.shops.dlc.nature_pack.key))
                {
                    return true;
                }
                return false;
            },
            
            game_loop_second: function(arg0 = 1, arg1 = false)
            {
                global.season_pass.nature._game_loop_second(arg0, arg1);
            },
            
            offline_step: function(arg0 = 1, arg1 = false)
            {
                global.season_pass.nature._offline_step(arg0, arg1);
            }
        }),
        anniversary: new Event(
        {
            name: __("Anniversary"),
            description: __("Happy Birthday to us! Celebrate and collect Party Tokens for exclusive anniversary upgrades."),
            sprite: spr_icon_birthday_cake,
            index: 30,
            auto_artifact_key: "birthday_cake",
            date_start: 
            {
                year: current_year,
                month: 12,
                day: 1,
                hour: 0,
                minute: 0,
                second: 0
            },
            date_end: 
            {
                year: current_year,
                month: 12,
                day: 31,
                hour: 0,
                minute: 0,
                second: 0
            },
            expire_duration: sec(604800),
            
            activate: function()
            {
                with (o_autoblower)
                {
                    init();
                }
            },
            
            game_loop_second: function(arg0 = 1, arg1 = false)
            {
            },
            
            offline_step: function(arg0 = 1, arg1 = false)
            {
            }
        })
    };
    add_keys_to_struct(global.events);
    global.events_sorted = struct_to_sorted_array(global.events);
    var __array = global.events_sorted;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        variable_struct_set(global.dialog_sections.event, mitem.key, 
        {
            name: mitem.name,
            index: mitem.index,
            event: mitem,
            
            is_obfuscated: function()
            {
                return !is_event_active(self.event);
            }
        });
    }
}

function init_events_late()
{
    var __struct = global.events;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        mitem.init_late();
    }
}
