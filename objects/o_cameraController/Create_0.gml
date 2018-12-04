/// @description Initializing vars
global._viewang = 0;
global._viewz = 1;
global._viewx = sin(global._viewang);
global._viewy = cos(global._viewang);
_camfriction = 0.1;
_maxcamspeed = 2;
_camspeed = 0;
global.maxShake = 30;
global.dynCam = true;
global.rand = false;
trauma = 0;
shake = 0;
x = o_player.x;
y = o_player.y;