function Harbor_Packer(arg0 = undefined) constructor
{
    index = 0;
    name = __("Packer");
    data = 
    {
        container_index: -1,
        status: UnknownEnum.Value_0,
        time_end: 0
    };
    container = undefined;
    
    init = function()
    {
    };
    
    can_assign = function()
    {
        if (is_struct(self.container))
        {
            return false;
        }
        return true;
    };
    
    can_pack = function()
    {
        if (!is_struct(self.container) || !is_struct(self.container.target))
        {
            return false;
        }
        if (self.data.status != UnknownEnum.Value_0)
        {
            return false;
        }
        if (self.container.target == Harbor_Ship && self.container.target.data.status != UnknownEnum.Value_0)
        {
            return false;
        }
        if (self.data.time_end > o_game.data.stats.time_elapsed)
        {
            return false;
        }
        return true;
    };
    
    check = function()
    {
        var has_auto = true;
        if (o_game.data.stats.time_elapsed >= self.data.time_end)
        {
            self.data.status = UnknownEnum.Value_0;
        }
        if (has_auto)
        {
            if (self.can_pack())
            {
                self.pack();
            }
        }
    };
    
    get_pack_amount = function()
    {
        var value = get_bm_value(10, "harbor_packer_pack_count", "harbor_packer_pack_count_multiplier", round, true);
        return value;
    };
    
    get_pack_duration = function()
    {
        return global.debug ? sec(2) : sec(5);
    };
    
    get_status_text = function()
    {
        var text = "";
        switch (self.data.status)
        {
            case UnknownEnum.Value_0:
                text = __("Idle");
                break;
            case UnknownEnum.Value_1:
                text = __("Packing");
                break;
        }
        return text;
    };
    
    pack = function()
    {
        var pack_amount = self.get_pack_amount();
        var amount = min(pack_amount, self.container.data.count);
        if (amount <= 0)
        {
            exit;
        }
        var add_amount = self.container.target.add(pack_amount);
        self.container.data.count -= amount;
        self.data.status = UnknownEnum.Value_1;
        self.data.time_end = o_game.data.stats.time_elapsed + self.get_pack_duration();
    };
    
    set_container = function(arg0)
    {
        self.data.container_index = arg0.index;
        self.container = arg0;
    };
    
    unassign_container = function()
    {
        if (!is_struct(self.container))
        {
            exit;
        }
        self.container = undefined;
        self.data.container_index = -1;
    };
    
    init_data = function()
    {
        apply_struct_to_struct(o_game.data.harbor.packer[self.index], self.data);
    };
    
    set_local_vars(arg0);
    self.init();
}

enum UnknownEnum
{
    Value_0,
    Value_1
}
