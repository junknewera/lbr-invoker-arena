function init_equipment()
{
    global.equipment = 
    {
        cheese_boots: new Equipment_Item(
        {
            name: __("Cheese Boots"),
            description: __s("Increases ALB speed by %s per level.", number_format_percent(0.01)),
            sprite: spr_equip_cheese_boots,
            upgrade_attributes: 
            {
                alb_speed: 0.01
            },
            max_count: 100
        }),
        cursed_cheese: new Equipment_Item(
        {
            name: __("Cursed Cheese"),
            
            description: function()
            {
                var boss_cursed_cheese_bonus = global.enemies.boss_cursed_cheese.data.defeated * 0.05;
                var bonus = o_game.data.stats.cursed_count * 0.01 * (1 + global.upgrade_attributes.cursed_count_multiplier) * get_upgrade_count(self);
                bonus *= (1 + boss_cursed_cheese_bonus);
                var add_text = "";
                if (boss_cursed_cheese_bonus > 0)
                {
                    add_text = " | " + __s("%s bonus: %s", global.enemies.boss_cursed_cheese.name, number_format_percent(boss_cursed_cheese_bonus));
                }
                var text = __s("Increases damage by %s each time you were cursed.", number_format_percent(0.01)) + "\n" + __s("Cursed: %s", number_format(o_game.data.stats.cursed_count)) + add_text + "\n" + __s("Current bonus: %s", number_format_percent(bonus));
                return text;
            },
            
            sprite: spr_icon_cursed_cheese,
            upgrade_attributes: 
            {
                blower_enemy_damage_multiplier: function()
                {
                    var boss_cursed_cheese_bonus = global.enemies.boss_cursed_cheese.data.defeated * 0.05;
                    var bonus = o_game.data.stats.cursed_count * 0.01 * (1 + global.upgrade_attributes.cursed_count_multiplier);
                    bonus *= (1 + boss_cursed_cheese_bonus);
                    return bonus;
                }
            },
            max_count: 0
        }),
        Flail: new Equipment_Item(
        {
            name: __("ALB Flail"),
            description: __("Attaches a flail to your ALBs. Increases ALB damage by 2% per level."),
            sprite: spr_equip_flail,
            upgrade_attributes: 
            {
                alb_enemy_damage_multiplier: 0.02
            },
            max_count: 0
        }),
        hammer: new Equipment_Item(
        {
            name: __("The Ban Hammer"),
            description: __("Increases player damage by 0.5% per level."),
            sprite: spr_equip_hammer,
            upgrade_attributes: 
            {
                blower_enemy_damage_multiplier: 0.005
            },
            max_count: 0
        }),
        leaf_armor: new Equipment_Item(
        {
            name: __("Leaf Armor"),
            description: __("Decreases enemy damage by 0.1% per level."),
            sprite: spr_equip_armor,
            upgrade_attributes: 
            {
                damage_resistance: 0.001
            },
            max_count: 100
        }),
        leaf_helm: new Equipment_Item(
        {
            name: __("Leaf Helm"),
            description: __("Increases Player HP by 0.5% per level."),
            sprite: spr_equip_helm,
            upgrade_attributes: 
            {
                player_hp_multiplier: 0.005
            },
            max_count: 0
        }),
        leaf_shield: new Equipment_Item(
        {
            name: __("Leaf Shield"),
            description: __("Decreases enemy damage by 5 per level."),
            sprite: spr_equip_shield,
            upgrade_attributes: 
            {
                damage_resistance_absolute: 5
            },
            max_count: 0
        }),
        lil_doggo: new Equipment_Item(
        {
            name: __("Lil' Doggo"),
            
            description: function()
            {
                var bonus = o_game.data.stats.pets_pet * self.upgrade_value_single * get_upgrade_count(self);
                return __s("Increases player damage by %s per Pet pet.", number_format_percent(self.upgrade_value_single)) + "\n" + __s("Current bonus: %s", number_format_percent(bonus));
            },
            
            sprite: spr_pet_dog,
            upgrade_value_single: 0.01,
            upgrade_attributes: 
            {
                blower_enemy_damage_multiplier: function()
                {
                    return o_game.data.stats.pets_pet * self.upgrade_value_single;
                }
            },
            max_count: 0
        }),
        medkit: new Equipment_Item(
        {
            name: __("Medkit"),
            description: __("Increases Player HP Regeneration rate by +1 per level."),
            sprite: spr_equip_medkit,
            upgrade_attributes: 
            {
                player_hp_reg: 1
            },
            max_count: 0
        }),
        mini_shovel: new Equipment_Item(
        {
            name: __("Mini Shovel"),
            
            description: function()
            {
                var bonus = o_game.data.stats.digs * 0.0005 * get_upgrade_count(self);
                return sprintf(__("Increases player damage by %s per dig.\nCurrent bonus: %s (%s digs)"), number_format_percent(0.0005), number_format_percent(bonus), number_format(o_game.data.stats.digs));
            },
            
            sprite: spr_equip_mini_shovel,
            upgrade_attributes: 
            {
                blower_enemy_damage_multiplier: function()
                {
                    return o_game.data.stats.digs * 0.0005;
                }
            },
            max_count: 0
        }),
        ring_blc: new Equipment_Item(
        {
            name: __("BLC Ring"),
            
            description: function()
            {
                var bonus = floor(o_game.data.stats.prestige_crunch / 30) * 0.005 * get_upgrade_count(self);
                return sprintf(__("Increases player damage by 0.5% each 30 Big Leaf Crunches per level. Also increases BLC Coins rewards by +100 per level.\nCurrent bonus: %s% (%s crunches)"), number_format(bonus * 100), number_format(o_game.data.stats.prestige_crunch));
            },
            
            sprite: spr_equip_blc_ring,
            upgrade_attributes: 
            {
                blc_value_adder: 100,
                
                blower_enemy_damage_multiplier: function()
                {
                    return floor(o_game.data.stats.prestige_crunch / 30) * 0.005;
                }
            },
            max_count: 0
        }),
        ring_zoo: new Equipment_Item(
        {
            name: __("Zoo Ring"),
            description: __("You can equip an additional pet."),
            sprite: spr_equip_zoo_ring,
            upgrade_attributes: 
            {
                max_pets: 1
            },
            max_count: 1
        }),
        traders_suitcase: new Equipment_Item(
        {
            name: __("Trader's Suitcase"),
            
            description: function()
            {
                var bonus = o_game.data.stats.trades_finished * 0.005 * get_upgrade_count(self);
                return sprintf(__("Increases player damage by %s per completed trade.\nCurrent bonus: %s (%s trades)"), number_format_percent(0.005), number_format_percent(bonus), number_format(o_game.data.stats.trades_finished));
            },
            
            sprite: spr_icon_trading,
            upgrade_attributes: 
            {
                blower_enemy_damage_multiplier: function()
                {
                    return o_game.data.stats.trades_finished * 0.005;
                }
            },
            max_count: 0
        }),
        viking_borb: new Equipment_Item(
        {
            name: __("Viking Borb"),
            
            description: function()
            {
                var bonus = o_game.data.stats.borb_slapped * self.upgrade_value_single * get_upgrade_count(self);
                return __s("Increases player damage by %s per Borb slapped.", number_format_percent(self.upgrade_value_single)) + "\n" + __s("Current bonus: %s", number_format_percent(bonus));
            },
            
            sprite: spr_borb_viking,
            upgrade_value_single: 0.001,
            upgrade_attributes: 
            {
                blower_enemy_damage_multiplier: function()
                {
                    return o_game.data.stats.borb_slapped * self.upgrade_value_single;
                }
            },
            max_count: 0
        }),
        wizard_hat: new Equipment_Item(
        {
            name: __("Wizard Hat"),
            
            description: function()
            {
                var bonus = o_game.data.stats.prestige_random_number * 0.1 * get_upgrade_count(self);
                var single_bonus = 0;
                if (self.data.count > 0)
                {
                    single_bonus = bonus / self.data.count;
                }
                return sprintf(__("Increases player damage by up to %s per level. After each prestige, the bonus value changes randomly.\nCurrent bonus: %s | Single bonus: %s"), number_format_percent(0.1), number_format_percent(bonus), number_format_percent(single_bonus));
            },
            
            sprite: spr_equip_wizard_hat,
            upgrade_attributes: 
            {
                blower_enemy_damage_multiplier: function()
                {
                    return o_game.data.stats.prestige_random_number * 0.1;
                }
            },
            max_count: 0
        })
    };
    add_keys_to_struct(global.equipment);
    global.equipment_array = struct_to_sorted_array_key(global.equipment);
    global.equipment_length = array_length(global.equipment_array);
}
