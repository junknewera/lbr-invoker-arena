event_inherited();
has_shadow = false;
next_level = 1;
open = __void;
progress = 0;
progress_w = 0;
progress_fx = 0;
text = "";
xscale = 10;
yscale = 10;
sprite_width_raw = sprite_get_width(sprite_index);
sprite_height_raw = sprite_get_width(sprite_index);
dx = x - ((sprite_width_raw / 2) * xscale);
dy = y - ((sprite_height_raw / 2) * yscale);
text_y = dy + sprite_height + 5;

calc_progress = function()
{
    next_level = get_next_soul_forge_count();
    text_y = dy + sprite_height + 5;
    if (next_level > 0)
    {
        progress = global.resources.soul_empty.data.count;
        progress_w = lerp(progress_w, (progress / next_level) * sprite_width_raw, 0.1);
    }
};

calc_progress();
alarm[0] = sec(0.3);
