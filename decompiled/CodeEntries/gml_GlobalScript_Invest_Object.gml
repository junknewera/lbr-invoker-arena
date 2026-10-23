function Invest_Object(arg0) : Game_Object(arg0) constructor
{
    data = 
    {
        invest_count: 0,
        invest_count_total: 0,
        invested: 
        {
            materials: {},
            resources: {}
        },
        timeout: 0
    };
    input = {};
    multiplier = 1;
    timeout = global.debug ? 1 : sec(60);
    
    can_invest = function(arg0 = 1)
    {
        if (self.data.timeout > o_game.data.stats.time_elapsed)
        {
            return false;
        }
        var cost = self.get_invest_cost(arg0);
        return has_enough(cost);
    };
    
    get_increase_value = function(arg0 = 1)
    {
        var sp_value = get_shadow_pit_value();
        var sp_add_value = get_shadow_pit_value(build_struct(self.key, arg0));
        return sp_add_value - sp_value;
    };
    
    get_invest_cost = function(arg0 = 1)
    {
        if (arg0 == 1)
        {
            return self.input;
        }
        return multiply_struct_values(self.input, arg0);
    };
    
    get_value = function(arg0 = 0)
    {
        var value = sqrt((self.data.invest_count + arg0) * self.multiplier);
        return value;
    };
    
    invest = function(arg0 = 1)
    {
        var cost = self.get_invest_cost(arg0);
        if (!has_enough(cost))
        {
            exit;
        }
        dec_result(cost);
        add_struct_to_struct(self.data.invested, cost);
        self.data.invest_count += arg0;
        self.data.invest_count_total += arg0;
        self.data.timeout = o_game.data.stats.time_elapsed + self.timeout;
    };
    
    set_local_vars(arg0);
    self._init();
}
