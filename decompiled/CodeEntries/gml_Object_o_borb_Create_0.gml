event_inherited();

init_after = function()
{
    if (global.dates_flags.christmas)
    {
        sprite_index = spr_borb_christmas;
        image_index = -1;
        base_scale = 1/3;
    }
    else if (global.dates_flags.new_years_eve)
    {
        sprite_index = spr_borb_party;
        image_speed = 1;
        base_scale = 1/3;
    }
};
