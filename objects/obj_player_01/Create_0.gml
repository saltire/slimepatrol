///@description

//velocity based variables
hspd = 0;				//current horizontal speed
vspd = 0;				//current vertical speed
moveSpeed = 3;			//pixels moved each step
acc = 1;				//increments run speed until moveSpeed is reached
dec = 1;				//decrements moveSpeed until stopped
jumpSpeed = 8;			//pixels moved each jump (gravity lowers this value)
grav = 0.5;				//jumpSpeed decreased by this value each step
terminalVelocity = jumpSpeed*4; //maximum falling speed
climbSpeed = 2;			//pixels moved when climbing ladders
onPlatformSpeed = moveSpeed;
jumpGraceFrames = game_get_speed(gamespeed_fps)/10;	//frames you can jump after walking off ledge

//states
onGround = false;       //check if on the ground
onGroundPrev = false;	//check if was on the ground last step
onLadder = false;       //check if on a ladder
canMove	= true;         //movement toggle
canJump = true;			//jump toggle
canDrop = false;        //check if dropping through platform
canShortHop = true;		//allow short hopping
airControl = true;		//allow velocity change in air
facing = 1;				//1 right 0 left

//shooting animation
shootAnimCount = 0;		//counter for shoot frame hold
shootAnimMax = 12;		//how many steps attack frame is held

//moving platforms
//onPlatformCheck = true;
//onPlatform = false;
//xoffset = 0;

//sprite list
//idleSprite = sp_cv_stand;
//jumpSprite = sp_cv_jump;
//jumpAttackSprite = sp_cv_jump_attack;
//walkSprite = sp_cv_run;
//groundAttackSprite = sp_cv_stand_attack;
//climbSprite = sp_cv_climb;

dead = false;
//alpha = 0;


vacuum = 0;