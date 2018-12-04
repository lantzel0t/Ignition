/// @description This object handles the camera
switch (global.control_scheme)
{
	case "keyboard":
	var key_camL = keyboard_check(ord("Q"));
	var key_camR = keyboard_check(ord("E"));
	break;
	case "controller":
	var key_camL =	gamepad_button_check(0, gp_shoulderl);
	var key_camR =  gamepad_button_check(0, gp_shoulderr);
	break;
}
//camera math
camera_set_view_angle(view_camera[0], -global._viewang);
global._viewang += _camspeed;
global._viewx = sin(degtorad(global._viewang));
global._viewy = cos(degtorad(global._viewang));
x = lerp(x, o_player.x, 0.2);
y = lerp(y, o_player.y, 0.2);
if (global.dynCam) {
global._viewang = lerp(global._viewang, o_player.image_angle, 0.005);
}
#region debug controls
if (key_camL && _camspeed < _maxcamspeed)
{
	_camspeed += 0.5;
}
if (key_camR && _camspeed > - _maxcamspeed)
{
	_camspeed -= 0.5;
}
if (keyboard_check(ord("Z")))
{
	global._viewz += 0.01;
	
}
if (keyboard_check(ord("X")))
{
	global._viewz -= 0.01;
}
if (keyboard_check(ord("C")))
{
	camera_set_view_size(view_camera[0], camera_get_view_width(view_camera[0]) * 1.01, camera_get_view_height(view_camera[0]) * 1.01);
}
if (keyboard_check(ord("V")))
{
		camera_set_view_size(view_camera[0], camera_get_view_width(view_camera[0]) * 0.99, camera_get_view_height(view_camera[0]) * 0.99);
}
#endregion

shake = power(trauma, 2);
var noise = 0;
var noise2 = 0;
if (global.rand) {
	noise = random_range(-1, 1);
	noise2 = random_range(-1, 1);
} else {
	noise = PN_1D_perlinNoise(delta_time, 1, 1, 1, 1, 1);
	noise2 = PN_1D_perlinNoise(delta_time * 2, 1, 1, 1, 1, 1);
}
if (shake > 0) {
	gamepad_set_vibration(0, 1, 1);
} else gamepad_set_vibration(0, 0, 0);
var shakeX = global.maxShake * shake * noise;
var shakeY = global.maxShake * shake * noise2;
camera_set_view_pos(view_camera[0],
	x - (camera_get_view_width(view_camera[0]) / 2) + shakeX,
	y - (camera_get_view_height(view_camera[0]) / 2) + shakeY);
trauma = clamp(trauma - 0.01, 0, 1);
//camera friction
if (_camspeed > 0)
{
	_camspeed -= _camfriction;
}
else if (_camspeed < 0)
{
	_camspeed += _camfriction;
}

//sets the angle back to 0 when it loops around.
//this prevents the angle from becoming huge
if (abs(global._viewang) > 360)
{
	global._viewang -= 360;
}
	