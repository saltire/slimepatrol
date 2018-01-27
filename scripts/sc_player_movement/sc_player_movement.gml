///@param left,right,up,down,jump

//------------------------------------------------------//
//						INITIALIZATION					//
//------------------------------------------------------//
#region
//variables
var deadzone = 0.6;

//assign keyboard keys / gamepad controls
keyLeft			= gamepad_button_check(0,argument0) || keyboard_check(vk_left);
keyRight		= gamepad_button_check(0,argument1) || keyboard_check(vk_right);
keyUp			= gamepad_button_check(0,argument2) || keyboard_check(vk_up);
keyDown			= gamepad_button_check(0,argument3) || keyboard_check(vk_down);
keyJumpPress	= gamepad_button_check_pressed(0,argument4) || keyboard_check_pressed(ord("X"));
keyJumpHeld		= gamepad_button_check(0,argument4)  || keyboard_check(ord("X"));

//check for analog stick inputs
if gamepad_axis_value(0, gp_axislh) < -deadzone { keyLeft = true; }
if gamepad_axis_value(0, gp_axislh) > deadzone { keyRight = true; }
if gamepad_axis_value(0, gp_axislv) < -deadzone { keyUp = true; }
if gamepad_axis_value(0, gp_axislv) > deadzone { keyDown = true; }
#endregion
//------------------------------------------------------//
//					HORIZONTAL MOVEMENT					//
//------------------------------------------------------//
#region
//when attempting to move left and not on a ladder
if (keyLeft) {
    image_xscale = -1; //flip the object
    if (hspd > 0) { //walking to the right
        hspd = 0; //turn on a dime
    }
    if (hspd > -moveSpeed) { //horizontal speed is less than maximum speed to the left
        hspd -= acc; //decrement speed by acceleration
    }
}
//when attempting to move right and not on a ladder
if (keyRight) {
    image_xscale = 1; //flip the object
    if (hspd < 0) { //walking to the left
        hspd = 0; //turn on a dime
    }
    if (hspd < moveSpeed) { //horizontal speed is less than maximum speed to the right
        hspd += acc; //increment speed by acceleration
    }
}

//no movement
if ((keyLeft && keyRight) || (!keyLeft && !keyRight)) {
    if hspd > 0 {
        hspd -= dec;
    }
    if hspd < 0 {
        hspd += dec;
    }
}
#endregion
//------------------------------------------------------//
//							JUMPING						//
//------------------------------------------------------//
#region
if (!onGround) vspd += grav;

if (keyJumpPress && canJump) {
	if (onGround || onGroundPrev) {
	    if (!place_meeting(x,y-jumpSpeed,obj_impasse)) {
	        vspd = -jumpSpeed;
	    } else if (place_meeting(x,y-jumpSpeed,obj_impasse)) {
			for (var i = 0; i < jumpSpeed; i++) {
				if (!place_meeting(x,y-i,obj_impasse)) {
					//loop again
				}else{
					vspd = -i;
					break;
				}
			}
	    }
	}
}
if (canShortHop && !onGround) {
    if (!keyJumpHeld && vspd < 0) {
        vspd /= 2;
    }
}
#endregion
//------------------------------------------------------//
//							LADDERS						//
//------------------------------------------------------//
#region
////NOT YET ON THE LADDER

////press up to grab ladder
//if (keyUp && !onLadder) {
//    if (place_meeting(x+(GRID_SIZE/4),y-1,obj_ladder) && place_meeting(x-(GRID_SIZE/4),y-1,obj_ladder)) {
//		var ladder = instance_place(x,y,obj_ladder);
//        onGround = false;
//        onLadder = true;
//        x = ladder.x + (GRID_SIZE/2);
//        y -= climbSpeed;
//    }
//}
////press down to grab ladder
//if (keyDown && !onLadder) {
//    if (place_meeting(x+(GRID_SIZE/4),y+1,obj_ladder_top) && place_meeting(x-(GRID_SIZE/4),y+1,obj_ladder_top)) {
//		var ladder = instance_place(x,y+1,obj_ladder_top);
//        onGround = false;
//        onLadder = true;
//        x = ladder.x + (GRID_SIZE/2);
//        y += climbSpeed;
//    }
//}

////ARE CURRENTLY ON THE LADDER

//if (onLadder) {
//	//set variables
//    vspd = 0;
//    hspd = 0;
//    var ladderTop = instance_place(x,y,obj_passable);
//    //if (keyUp) && y > ladderTop.y+climbSpeed*2 then vspd = -climbSpeed;	
//	//climb up
//	if (keyUp) then vspd = -climbSpeed;
//	//leave top of ladder
//    if (keyUp && place_meeting(x,y,obj_ladder_top) && !place_meeting(x,y-GRID_SIZE,obj_ladder) && y <= ladderTop.y+climbSpeed*2) {
//        y = ladderTop.y;
//        onLadder = false;
//        onGround = true;
//		vspd = 0;
//    }
//	//climb down=
//    if (keyDown) then vspd = climbSpeed;
//	//press jump to leave ladder
//    //if (keyJumpPress && !keyUp && !keyDown) then onLadder = false;
//	if (keyJumpPress && !keyUp && !keyDown) {
//		onLadder = false;
//		if (!place_meeting(x,y-jumpSpeed,obj_impasse)) {
//	        vspd = -jumpSpeed;
//	    } else if (place_meeting(x,y-jumpSpeed,obj_impasse)) {
//			for (var i = 0; i < jumpSpeed; i++) {
//				if (!place_meeting(x,y-i,obj_impasse)) {
//					//loop again
//				}else{
//					vspd = -i;
//					break;
//				}
//			}
//	    }
//	}
//	if (keyJumpPress && keyDown) {
//		onLadder = false;
//		sprite_index = jumpSprite;
//	}
//	//safety checks
//    if (onGround) then onLadder = false;
//    if (!place_meeting(x,y,obj_ladder) && !place_meeting(x,y,obj_ladder_top)) then onLadder = false;
//	//leave ladder from bottom
//    if (keyDown) {
//        if place_meeting(x,y+1,obj_impasse) {
//            onLadder = false;
//            onGround = true;
//			vspd = 0;
//        }
//    }
//}
#endregion
//------------------------------------------------------//
//					HORIZONTAL COLLISIONS				//
//------------------------------------------------------//
#region
if place_meeting(x+hspd,y,obj_impasse) {
    //use slopes going up
    yplus = 0;
    while ( place_meeting(x+hspd,y-yplus,obj_impasse) && yplus <= abs(1*hspd) ) yplus += 1;
    if (place_meeting(x+hspd,y-yplus,obj_impasse)) {
        while (!place_meeting(x+sign(hspd),y,obj_impasse)) x += sign(hspd);
        hspd = 0;
    }else{
        y -= yplus;
    }
    //use this code instead to not use slope code
    //while (!place_meeting(x+sign(hspd),y,obj_impasse)) x += sign(hspd);
    //hspd = 0;
}
if (!place_meeting(x+hspd,y+1,obj_impasse)) {
    //use slopes going down
    yminus = 1;
    while ( !place_meeting(x+hspd,y+yminus,obj_impasse) && yminus <= abs(1*hspd) ) yminus += 1;
    if (!place_meeting(x+hspd,y+yminus,obj_impasse)) {
        //gravity
    }else{
        y += yminus;
    }
}

//x movement
x += hspd;

//floor the x coordinate
//if (onGround && !vspd) x = floor(x);
#endregion
//------------------------------------------------------//
//					VERTICAL COLLISIONS					//
//------------------------------------------------------//
#region
//passable block vert collision
//if (vspd >= 0 && place_meeting(x,y+abs(vspd),obj_passable) && !place_meeting(x,y,obj_passable)) {
//	y = floor(y);
//    while (!place_meeting(x,y+1,obj_passable)) y += 1;
//    vspd = 0;
//}

if (place_meeting(x,y+vspd,obj_impasse)) {
    while (!place_meeting(x,y+(grav*sign(vspd)),obj_impasse)) y += (grav*sign(vspd));
    vspd = 0;
}
if (place_meeting(x,y+1,obj_impasse) && !onLadder && vspd >= 0 ) {
    onGround = true;
}else{
	onGround = false;
}

//maximum falling speed
if (vspd > terminalVelocity) vspd = terminalVelocity;

//y movement
y += vspd;

//round y down to integer
if (onGround) {
    y = floor(y);
}

//so sprites don't fidget near ground while in the air
/*
if vspd != 0 {
    onGround = false;
}
*/
#endregion