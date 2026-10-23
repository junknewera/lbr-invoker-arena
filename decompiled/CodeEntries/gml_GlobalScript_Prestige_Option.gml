function Prestige_Option(arg0) constructor
{
    key = "";
    name = "";
    description = "";
    points_cache = 0;
    refresh_duration = sec(1);
    refresh_timer = 0;
    
    _get_points = function()
    {
        if (self.refresh_timer <= o_game.data.stats.time_elapsed)
        {
            self.points_cache = self.get_points();
            self.refresh_timer = o_game.data.stats.time_elapsed + self.refresh_duration;
        }
        return self.points_cache;
    };
    
    get_points = __void;
    set_local_vars(arg0);
}
