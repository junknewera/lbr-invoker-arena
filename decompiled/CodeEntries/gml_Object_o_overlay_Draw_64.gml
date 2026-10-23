set_default_font(f_gui_large);
draw_set_color(c_black);
draw_set_alpha(alpha);
draw_rectangle(0, 0, global.gui_width, global.gui_height, false);
draw_set_alpha(alpha);
draw_set_color(c_white);
draw_text(text_pos.x, text_pos.y, text);
