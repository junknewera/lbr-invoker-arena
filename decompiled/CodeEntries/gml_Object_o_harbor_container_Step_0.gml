pulse = max(0, pulse - pulse_decay);
var eased = pulse * (2 - pulse);
var s = image_scale + (pulse_amp * eased);
image_xscale = s;
image_yscale = s;
