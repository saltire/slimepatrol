// kills

draw_set_halign(fa_center);
draw_text(room_width/2, GRID_SIZE, string(global.enemyKillTotal));

// draw left ammo bar

if (instance_exists(obj_player_01)) {
	var xStartPoint = GRID_SIZE*1.5;
	var barTop = room_height-GRID_SIZE+4;
	var barLength = 200;
	var barWidth = GRID_SIZE;
	var barHeight = GRID_SIZE-12;
	var margin = 2;

	draw_set_color(c_white);
	draw_rectangle(xStartPoint-margin, barTop-margin, xStartPoint+barLength+margin, barTop+barHeight+margin, true);
	draw_set_color(c_red);
	draw_rectangle(xStartPoint, barTop, xStartPoint+(obj_player_01.energy*2), barTop+barHeight, false);
}

// draw right ammo bar

if (instance_exists(obj_player_02)) {
	
	var xStartPoint = (room_width)-(GRID_SIZE*1.5);
	var barTop = room_height-GRID_SIZE+4;
	var barLength = 200;
	var barWidth = GRID_SIZE;
	var barHeight = GRID_SIZE-12;
	var margin = 2;

	draw_set_color(c_white);
	draw_rectangle(xStartPoint+margin, barTop-margin, xStartPoint-barLength-margin, barTop+barHeight+margin, true);
	draw_set_color(c_red);
	draw_rectangle(xStartPoint, barTop, xStartPoint-(obj_player_02.energy*2), barTop+barHeight, false);
}

// reset to white
draw_set_color(c_white);