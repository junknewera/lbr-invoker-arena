x = floor(mouse_x / 16) * 16;
y = floor(mouse_y / 16) * 16;
depth = -y;
can_place = can_place_house_item(x, y, item);
