draw_self();

if aimActive {
	draw_sprite_ext(spr_arrow, 0, 
		x + lengthdir_x(arrowDistance, aimDirection), y - sprite_height / 2 + lengthdir_y(arrowDistance, aimDirection), 
		1, 1, aimDirection, c_white, 1);
}