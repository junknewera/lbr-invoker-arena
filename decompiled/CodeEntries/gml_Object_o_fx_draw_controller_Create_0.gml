refresh_surface = true;
refresh_timer = global.is_mobile ? sec(1/15) : sec(1/30);
surface = -1;
alarm[0] = refresh_timer;
