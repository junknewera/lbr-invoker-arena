function Daily_Challenge_Type(arg0, arg1) constructor
{
    key = arg0;
    name = __("Unknown");
    description = __("The developer was too lazy to provide a description. Blame him.");
    sprite = spr_placeholder;
    sprite_orig = spr_placeholder;
    reward_resources = 
    {
        season_gems: 1
    };
    set_sprite_data(self);
    
    check = function()
    {
        return false;
    };
    
    set_local_vars(arg1);
}
