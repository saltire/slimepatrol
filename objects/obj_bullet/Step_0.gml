x += xv;
y += yv;

if place_meeting(x, y, obj_impasse) {
	instance_destroy();
}