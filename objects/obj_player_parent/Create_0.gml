///@description

//velocity based variables
hspd = 0;				//current horizontal speed
vspd = 0;				//current vertical speed
moveSpeed = 3;			//pixels moved each step
acc = 1;				//increments run speed until moveSpeed is reached
dec = 1;				//decrements moveSpeed until stopped
jumpSpeed = 9;			//pixels moved each jump (gravity lowers this value)
grav = 0.5;				//jumpSpeed decreased by this value each step
terminalVelocity = jumpSpeed*2; //maximum falling speed
climbSpeed = 2;			//pixels moved when climbing ladders
onPlatformSpeed = moveSpeed;
jumpGraceFrames = game_get_speed(gamespeed_fps)/15;	//frames you can jump after walking off ledge

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


touchingSlime = false; // are we touching slime?
slimeSpeedRatio = 100;

gunCooldown = 0;
gunCooldownRate = 15;
bulletCount = 8;
spreadAngle = 4;
bulletSpeed = 10;

vacuum = 0; // id of vacuum cleaner instance