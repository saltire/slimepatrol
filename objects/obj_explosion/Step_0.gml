if sprite_width < maxSize {
	image_xscale += growthRate;
	image_yscale += growthRate;
}
else {
	image_alpha -= fadeRate;
}

if image_alpha <= 0 instance_destroy();
