/// @description This object handles the camera

//camera math
camera_set_view_angle(view_camera[0], -global._viewang);
global._viewang += _camspeed;
global._viewx = sin(degtorad(global._viewang));
global._viewy = cos(degtorad(global._viewang));

#region debug controls
if (keyboard_check(ord("Q")) && _camspeed < _maxcamspeed)
{
	_camspeed += 0.5;
}
if (keyboard_check(ord("E")) && _camspeed > - _maxcamspeed)
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
	camera_set_view_size(view_camera[0], camera_get_view_width(view_camera[0]) - 5, camera_get_view_height(view_camera[0]) - 5);
}
if (keyboard_check(ord("V")))
{
		camera_set_view_size(view_camera[0], camera_get_view_width(view_camera[0]) + 5, camera_get_view_height(view_camera[0]) + 5);
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
	