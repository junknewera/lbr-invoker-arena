target_x = o_blower.x;
target_y = o_blower.y;
current_sprite = iif(speed <= 0.5, sprite, sprite_walk);
sprite_index = current_sprite;
can_draw = get_option(global.options.draw_pet);
alarm[0] = sec(0.2);
