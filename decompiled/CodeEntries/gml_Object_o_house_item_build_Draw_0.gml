var alpha = iif(can_place, 0.4, 0.8);
var col = iif(can_place, 16777215, 255);
draw_sprite_outlined(sprite_index, img_index, x, y, item.scale, item.scale, img_angle, col, 16777215);
