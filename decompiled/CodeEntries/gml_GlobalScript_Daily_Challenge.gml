function Daily_Challenge(arg0) constructor
{
    name = __("Unknown Challenge");
    description = __("The developer was too lazy to provide a description. Blame him.");
    sprite = spr_placeholder;
    sprite_orig = spr_placeholder;
    data = 
    {
        completed: false,
        count: 0
    };
    index = 0;
    reward_resources = 
    {
        season_gems: 1
    };
    type = array_random_item(global.daily_challenges_types_array);
    set_sprite_data(self);
    
    check = function()
    {
        return false;
    };
    
    claim = function()
    {
        if (self.data.count > 0)
        {
            exit;
        }
        add_resources(self.reward_resources, false, false, false);
        self.data.count++;
    };
    
    progress = function()
    {
        return 0;
    };
    
    set_local_vars(arg0);
}
