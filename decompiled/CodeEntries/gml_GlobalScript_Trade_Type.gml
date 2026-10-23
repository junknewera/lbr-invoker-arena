function Trade_Type(arg0, arg1) constructor
{
    if (is_undefined(arg1))
    {
        arg1 = {};
    }
    name = __("Standard Delivery");
    description = __("");
    index = 0;
    key = arg0;
    max_trades_per_day = 0;
    reward_count_base = 1;
    reward_resource = global.resources.leaves;
    sprite = spr_placeholder;
    trade_key = "";
    
    init = function()
    {
        trade_key = sprintf("trade_%s", self.key);
    };
    
    _can_generate = function()
    {
        var daily_data = get_daily_data_today();
        var max_trades_per_day = self.get_max_trades_per_day();
        if (max_trades_per_day > 0)
        {
            var trade_types_started = get_default_struct_value(daily_data.data, self.trade_key, 0);
            if (trade_types_started >= max_trades_per_day)
            {
                return false;
            }
        }
        return self.can_generate();
    };
    
    can_generate = __return_true;
    
    __collect = function(arg0)
    {
        if (is_same_key(arg0.type, global.trade_types.gems))
        {
            var value = arg0.data.reward.gems;
            var d = get_daily_data_today();
            add_to_struct_value(d.data, "trade_gems", value);
        }
        self.collect(arg0);
    };
    
    collect = __void;
    
    get_max_trades_per_day = function()
    {
        return self.max_trades_per_day;
    };
    
    _start = function(arg0)
    {
        self.start(arg0);
    };
    
    start = __void;
    
    get_name = function()
    {
        return get_value_ext(self, self.name);
    };
    
    set_local_vars(arg1);
    set_sprite_data(self);
    init();
}
