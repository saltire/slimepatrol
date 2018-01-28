if sprite_width < maxSize {
	image_xscale += growthRate;
	image_yscale += growthRate;
}
else if image_alpha > 0 {
	image_alpha -= fadeRate;
}
else {
	instance_destroy();
}