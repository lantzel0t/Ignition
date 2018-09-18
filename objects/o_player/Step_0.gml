#region controls
switch (control_scheme)
{
	case "keyboard":
	var key_up =	keyboard_check(ord("W"));
	var key_left =  keyboard_check(ord("A"));
	var key_down =  keyboard_check(ord("S"));
	var key_right = keyboard_check(ord("D"));
	break;
	case "controller":
	var key_up =	keyboard_check(ord("W"));
	var key_left =  keyboard_check(ord("A"));
	var key_down =  keyboard_check(ord("S"));
	var key_right = keyboard_check(ord("D"));
	break;
}
#endregion
viewx = sin(degtorad(global._viewang));
viewy = cos(degtorad(global._viewang));

x_axis = (-key_left + key_right);
y_axis = (-key_up + key_down);
vel[0] = clamp(vel[0] + x_axis, -maxvel, maxvel);
vel[1] = clamp(vel[1] - (y_axis * accel), -maxvel, maxvel);

if (x_axis == 0)
{
	turnAng = lerp(turnAng, 0, 0.2);
}
if (y_axis == 0)
{
	vel[1] = lerp(vel[1], 0, 0.2);	
}
if (keyboard_check(ord("Q")) && _camspeed < _maxcamspeed)
{
	_camspeed += 0.5;
}
if (keyboard_check(ord("E")) && _camspeed > - _maxcamspeed)
{
	_camspeed -= 0.5;
}

var _direction = point_direction(x, y, mouse_x, mouse_y);
_acceleration = 0.2;
var _topSpeed = 4;
if (mouse_check_button(mb_left)) {
	friction = 0;
	motion_add(_direction,_acceleration);
	speed = min(speed, _topSpeed);
	playerAng = _direction - 90;
}
else {
		friction = _acceleration + .5;
}

if (keyboard_check_pressed(ord("F")))
{
	if (sprite_index == s_car)
	{
	sprite_index = s_PlayerIdle1;
	}
	else
	{
	sprite_index = s_car;	
	}
}
if (keyboard_check(ord("Z")))
{
	global.viewz += 0.01;
	
}
if (keyboard_check(ord("X")))
{
	global.viewz -= 0.01;
}
if (keyboard_check(ord("C")))
{
	camera_set_view_size(view_camera[0], camera_get_view_width(view_camera[0]) - 5, camera_get_view_height(view_camera[0]) - 5);
}
if (keyboard_check(ord("V")))
{
		camera_set_view_size(view_camera[0], camera_get_view_width(view_camera[0]) + 5, camera_get_view_height(view_camera[0]) + 5);
}
//if (y_axis < 0)
//{
//	x -= sin(degtorad(playerAng)) * vel[1];
//	y -= cos(degtorad(playerAng)) * vel[1];
//	//playerAng = global._viewang;
//	playerAng += turnAng;
//}
if (y_axis != 0)
{
	playerAng += turnAng;	
}
	x -= sin(degtorad(playerAng)) * vel[1];
	y -= cos(degtorad(playerAng)) * vel[1];
	//playerAng = global._viewang + 180;
	//playerAng += turnAng;

if (x_axis > 0)
{
	//x -= sin(degtorad(global._viewang + 90)) * 3;
	//y -= cos(degtorad(global._viewang + 90)) * 3;
	turnAng = clamp(turnAng - 0.5, -maxTurnAng, maxTurnAng);
}
if (x_axis < 0)
{
	//x += sin(degtorad(global._viewang + 90)) * 3;
	//y += cos(degtorad(global._viewang + 90)) * 3;
	turnAng = clamp(turnAng + 0.5, -maxTurnAng, maxTurnAng);
}
if (x_axis == 0)
{
	clamp(turnAng + 0.1, -maxTurnAng, maxTurnAng);
}
//camera_set_view_pos(view_camera[0],
	//x - camera_get_view_width(view_camera[0]) / 2,
	//y - camera_get_view_height(view_camera[0]) / 2);
camera_set_view_angle(view_camera[0], -global._viewang);

image_angle = global._viewang + playerAng;


global._viewang += _camspeed;
global._viewx = viewx;
global._viewy = viewy;
if (_camspeed > 0)
{
	_camspeed -= _camfriction;
}
else if (_camspeed < 0)
{
	_camspeed += _camfriction;
}

if (abs(global._viewang) > 360)
	global._viewang = 0;
	