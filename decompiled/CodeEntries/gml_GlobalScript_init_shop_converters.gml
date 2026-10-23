function init_shop_converters()
{
    global.shops_prestige_levels.converters = global.prestige_levels.prestige;
    global.shops_resources.converters = global.resources.leaves;
    global.converters = 
    {
        convert_gold: new Converter(
        {
            index: 1,
            resource_from: global.resources.leaves,
            resource_to: global.resources.gold,
            cost: 
            {
                leaves: 100
            },
            reward: 
            {
                gold: 1
            },
            unlocked: true
        }),
        convert_platinum: new Converter(
        {
            index: 2,
            resource_from: global.resources.gold,
            resource_to: global.resources.platinum,
            cost: 
            {
                gold: 100
            },
            reward: 
            {
                platinum: 1
            },
            unlocked: true
        }),
        convert_bismuth: new Converter(
        {
            index: 3,
            resource_from: global.resources.platinum,
            resource_to: global.resources.bismuth,
            cost: 
            {
                platinum: 100
            },
            reward: 
            {
                bismuth: 1
            },
            unlocked: true
        }),
        convert_cosmic: new Converter(
        {
            index: 4,
            resource_from: global.resources.bismuth,
            resource_to: global.resources.cosmic,
            cost: 
            {
                bismuth: 100
            },
            reward: 
            {
                cosmic: 1
            },
            unlocked: true
        }),
        convert_void: new Converter(
        {
            index: 5,
            resource_from: global.resources.cosmic,
            resource_to: global.resources.void,
            cost: 
            {
                cosmic: 100
            },
            reward: 
            {
                void: 1
            },
            unlocked: true
        }),
        exotic_celestial: new Converter(
        {
            index: 10,
            resource_from: global.resources.exotic,
            resource_to: global.resources.celestial,
            cost: 
            {
                exotic: 10000000000000
            },
            reward: 
            {
                celestial: 1
            },
            unlocked: true
        }),
        convert_flask_red: new Converter(
        {
            index: 106,
            resource_from: global.resources.void,
            resource_to: global.resources.flask_red,
            cost: 
            {
                void: 100
            },
            reward: 
            {
                flask_red: 1
            },
            unlocked: true
        }),
        convert_flask_green: new Converter(
        {
            index: 107,
            resource_from: global.resources.flask_red,
            resource_to: global.resources.flask_green,
            cost: 
            {
                flask_red: 100
            },
            reward: 
            {
                flask_green: 1
            },
            unlocked: true
        }),
        convert_flask_blue: new Converter(
        {
            index: 108,
            resource_from: global.resources.flask_green,
            resource_to: global.resources.flask_blue,
            cost: 
            {
                flask_green: 100
            },
            reward: 
            {
                flask_blue: 1
            },
            unlocked: true
        }),
        convert_flask_magenta: new Converter(
        {
            index: 109,
            resource_from: global.resources.flask_blue,
            resource_to: global.resources.flask_magenta,
            cost: 
            {
                flask_blue: 100
            },
            reward: 
            {
                flask_magenta: 1
            },
            unlocked: true
        }),
        convert_flask_orange: new Converter(
        {
            index: 110,
            resource_from: global.resources.flask_magenta,
            resource_to: global.resources.flask_orange,
            cost: 
            {
                flask_magenta: 100
            },
            reward: 
            {
                flask_orange: 1
            },
            unlocked: true
        }),
        convert_flask_black: new Converter(
        {
            index: 111,
            resource_from: global.resources.flask_orange,
            resource_to: global.resources.flask_black,
            cost: 
            {
                flask_orange: 100
            },
            reward: 
            {
                flask_black: 1
            },
            unlocked: true
        }),
        convert_flask_strange: new Converter(
        {
            index: 112,
            resource_from: global.resources.flask_black,
            resource_to: global.resources.flask_strange,
            cost: 
            {
                flask_black: 10000
            },
            reward: 
            {
                flask_strange: 1
            },
            unlocked: true
        }),
        convert_flask_strange_silver_token: new Converter(
        {
            index: 2010,
            resource_from: global.resources.flask_strange,
            resource_to: global.resources.silver_token,
            cost: 
            {
                flask_strange: 500000
            },
            reward: 
            {
                silver_token: 1
            }
        }),
        convert_silver_token_gold_token: new Converter(
        {
            index: 2020,
            resource_from: global.resources.silver_token,
            resource_to: global.resources.gold_token,
            cost: 
            {
                silver_token: 1000
            },
            reward: 
            {
                gold_token: 1
            }
        }),
        convert_borb_cheese: new Converter(
        {
            index: 5000,
            resource_from: global.resources.borbs,
            resource_to: global.resources.cheese,
            cost: 
            {
                borbs: 5000
            },
            reward: 
            {
                cheese: 1
            },
            unlocked: true,
            static_resources: true
        }),
        convert_borb_borb_juice: new Converter(
        {
            index: 5010,
            resource_from: global.resources.borbs,
            resource_to: global.resources.borb_juice,
            cost: 
            {
                borbs: 100000000
            },
            reward: 
            {
                borb_juice: 1
            },
            
            unlocked: function()
            {
                return is_unlocked_borbventure();
            },
            
            static_resources: true,
            time_resistant: true
        }),
        convert_borb_juice_borb_token: new Converter(
        {
            index: 5020,
            resource_from: global.resources.borb_juice,
            resource_to: global.resources.borb_token,
            cost: 
            {
                borb_juice: 500
            },
            reward: 
            {
                borb_token: 1
            },
            
            unlocked: function()
            {
                return is_unlocked_borbventure();
            },
            
            static_resources: true,
            time_resistant: true
        }),
        convert_cheese_beer: new Converter(
        {
            index: 5200,
            resource_from: global.resources.cheese,
            resource_to: global.resources.beer,
            cost: 
            {
                cheese: 500
            },
            reward: 
            {
                beer: 1
            },
            unlocked: true,
            static_resources: true
        }),
        convert_plasma_electric: new Converter(
        {
            index: 10000,
            resource_from: global.resources.plasma,
            resource_to: global.resources.energy_electrical,
            cost: 
            {
                plasma: 100
            },
            reward: 
            {
                energy_electrical: 20
            },
            
            unlocked: function()
            {
                return has_bought_shop_item_safe(global.shops.energy_electrical.unlock_converter_plasma_electric);
            },
            
            static_resources: true
        }),
        convert_azurite_dice: new Converter(
        {
            index: 20000,
            resource_from: global.resources.azurite,
            resource_to: global.resources.dice,
            cost: 
            {
                azurite: 10000
            },
            reward: 
            {
                dice: 5
            },
            
            unlocked: function()
            {
                return get_upgrade_count(global.shops.dice.unlock_converter_azurite_dice) > 0;
            },
            
            static_resources: true
        }),
        convert_azurite_power_dice: new Converter(
        {
            index: 20001,
            resource_from: global.resources.azurite,
            resource_to: global.resources.power_dice,
            cost: 
            {
                azurite: 500000
            },
            reward: 
            {
                power_dice: 5
            },
            
            unlocked: function()
            {
                return get_upgrade_count(global.shops.dice.unlock_converter_azurite_power_dice) > 0;
            },
            
            static_resources: true
        }),
        convert_niobium_dice: new Converter(
        {
            index: 20010,
            resource_from: global.resources.niobium,
            resource_to: global.resources.dice,
            cost: 
            {
                niobium: 10000
            },
            reward: 
            {
                dice: 10
            },
            
            unlocked: function()
            {
                return get_upgrade_count(global.shops.dice.unlock_converter_niobium_dice) > 0;
            },
            
            static_resources: true
        }),
        convert_niobium_power_dice: new Converter(
        {
            index: 20011,
            resource_from: global.resources.niobium,
            resource_to: global.resources.power_dice,
            cost: 
            {
                niobium: 500000
            },
            reward: 
            {
                power_dice: 10
            },
            
            unlocked: function()
            {
                return get_upgrade_count(global.shops.dice.unlock_converter_niobium_power_dice) > 0;
            },
            
            static_resources: true
        })
    };
    if (mp_is_season() && global.game_settings.guilds_enabled)
    {
        global.converters.convert_honor_season_gems = new Converter(
        {
            index: 100000,
            resource_from: global.resources.honor,
            resource_to: global.resources.season_gems,
            cost: 
            {
                honor: 5
            },
            reward: 
            {
                season_gems: 3
            },
            unlocked: true,
            fixed: true
        });
    }
    add_keys_to_struct(global.converters);
    global.converters_array = struct_to_sorted_array(global.converters);
    global.shops.converters = {};
    var __struct = global.converters;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(global.shops.converters, mkey, 
        {
            converter: mitem,
            cost: mitem.cost,
            description: mitem.description,
            index: mitem.index,
            key: mitem.key,
            name: mitem.name,
            sprite: mitem.sprite,
            unlocked: mitem.unlocked
        });
    }
}
