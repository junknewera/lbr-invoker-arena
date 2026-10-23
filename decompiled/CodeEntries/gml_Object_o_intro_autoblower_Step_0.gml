bounce_room_edges();
speed = lerp(speed, movespeed, 0.05);
image_angle += (sin(degtorad(direction - image_angle)) * 10);
restrict_position_to_room();
