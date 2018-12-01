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
	global._viewang = 0;
}
	