function Fishing_Tournament_Rod(arg0 = undefined) : Game_Object(arg0) constructor
{
    var cost_exp = 1.2;
    var cost_value = 100;
    upgrade_material = undefined;
    upgrade_resource = global.resources.fish_credits;
    upgrades = 
    {
        tournament_rod_value: new Object_Upgrade(
        {
            index: 0,
            name: __("Tip"),
            value: 1,
            max_level: 0,
            base_cost: 100,
            cost_exp: 1.05,
            cost_material: self.upgrade_material,
            cost_resource: self.upgrade_resource,
            upgrade_text: "fishing_tourney_rod_value"
        }),
        tournament_success_chance: new Object_Upgrade(
        {
            index: 1,
            name: __("Handle"),
            value: 0.01,
            max_level: 10,
            base_cost: 125,
            cost_exp: 1.2,
            cost_material: self.upgrade_material,
            cost_resource: self.upgrade_resource,
            upgrade_text: "fishing_tournament_success_chance"
        }),
        tournament_boost_chance: new Object_Upgrade(
        {
            index: 2,
            name: __("Shaft"),
            value: 0.01,
            max_level: 10,
            base_cost: 150,
            cost_exp: 1.2,
            cost_material: self.upgrade_material,
            cost_resource: self.upgrade_resource,
            upgrade_text: "fishing_tournament_boost_chance"
        })
    };
    data = 
    {
        level: 1,
        tier: 1
    };
    
    init = function()
    {
    };
    
    can_upgrade_level = function()
    {
        return has_enough(self.get_level_cost());
    };
    
    get_level_cost = function()
    {
        var cost = 
        {
            materials: 
            {
                tide_crystal_advanced: 1 + power(2, self.data.level)
            }
        };
        return cost;
    };
    
    get_min_fish_length = function(arg0 = 0)
    {
        return self.get_value(arg0);
    };
    
    get_max_fish_length = function(arg0 = 0)
    {
        return self.get_min_fish_length(arg0) * 3;
    };
    
    get_sprite = function()
    {
        return spr_rod_common;
    };
    
    get_base_value = function(arg0 = 0)
    {
        var value = 1 + self.get_upgrade_value("tournament_rod_value") + arg0 + sqrt0(o_game.data.stats.fish_caught * 0.1);
        value *= self.data.level;
        value *= self.data.tier;
        return value;
    };
    
    get_value = function(arg0 = 0)
    {
        var base_value = self.get_base_value(arg0);
        base_value = sqrt(base_value);
        var value = get_bm_value(base_value, "fishing_tourney_rod_value", "fishing_tourney_rod_value_multiplier", undefined, true);
        return value;
    };
    
    set_local_vars(arg0);
    self._init();
}
