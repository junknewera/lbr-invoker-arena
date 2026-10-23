draw_set_font(f_game_large);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_alpha(0.4);
draw_text(room_width / 2, room_height / 2, string(text));
draw_set_alpha(1);
