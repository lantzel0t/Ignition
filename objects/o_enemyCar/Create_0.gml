/// @description Initializing vars
playerAng = 0;
turnAng = 0;
maxTurnAng = 6;
is3d = true;
image_speed = 0;
vel = 0;
maxvel = irandom_range(5,11);
accel = 0.2;
fric = 0.1;
invertX = -1;
frontAxle = 32;
distancetoWheel = 10;
wheelAngle = 0;
leftWheelX = 0;
leftWheelY = 0;
rightWheelX = 0;
rightWheelY = 0;
trail_init();
global.target = o_pathfollow;
dead = false;