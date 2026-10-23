function Achievement(arg0) constructor
{
    name = __("Unknown Achievement");
    description = __("The developer was too lazy to provide a description. Blame him.");
    sprite = spr_solid;
    sprite_orig = spr_solid;
    attribute = 
    {
        key: "unknown",
        value: 1
    };
    claim_resources = 
    {
        gems: 0
    };
    data = 
    {
        claimed: 0
    };
    index = 0;
    is_progress = true;
    levels = [];
    levels_count = 0;
    reward = undefined;
    value = 0;
    section = global.dialog_sections.achievements.general;
    
    init = function()
    {
        self.levels_count = array_length(self.levels);
    };
    
    check = function()
    {
        if (self.data.claimed >= self.levels_count)
        {
            return false;
        }
        return get_value_ext(self, self.value, false) >= self.levels[self.data.claimed];
    };
    
    func = function()
    {
        if (!self.check())
        {
            exit;
        }
        add_resources(self.claim_resources, false, false);
        self.data.claimed++;
    };
    
    get_display_count = function()
    {
        return sprintf("%s/%s", self.data.claimed, self.levels_count);
    };
    
    get_tooltip = function()
    {
        return self.is_obfuscated() ? "?" : self.name;
    };
    
    get_value = function()
    {
        return get_value_ext(self, self.value, false);
    };
    
    is_completed = function()
    {
        return self.data.claimed >= self.levels_count;
    };
    
    is_obfuscated = function()
    {
        var achievement_value = self.get_value();
        if (self.data.claimed > 0 || achievement_value > 0)
        {
            return false;
        }
        return true;
    };
    
    get_name = function()
    {
        return self.name;
    };
    
    get_description = function()
    {
        var text = self.description;
        var achievement_value = self.get_value();
        if (achievement_value > 0 && self.data.claimed < self.levels_count)
        {
            var progress = min(100, (achievement_value / self.levels[self.data.claimed]) * 100);
            var progress_pct = number_format(progress, 2, false);
            text += ("\n" + sprintf("\nProgress: %s/%s (%s%)", number_format(floor(achievement_value), 2, false), number_format(self.levels[self.data.claimed], 2, false), progress_pct));
        }
        return text;
    };
    
    set_sprite_data(self);
    set_local_vars(arg0);
    self.init();
}
