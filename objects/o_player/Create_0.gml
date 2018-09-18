/// @description Insert description here
// You can write your code in this editor
global._viewang = 0;
global.viewz = 1;
playerAng = 0;
turnAng = 0;
maxTurnAng = 4;
global._viewx = sin(global._viewang);
global._viewy = cos(global._viewang);
draw_set_colour(c_white);
_camfriction = 0.1;
_maxcamspeed = 2;
_camspeed = 0;
is3d = true;
image_speed = 0;
control_scheme = "keyboard";
vel = [0, 0];
maxvel = 25;
accel = 0.2;
fric = 1;