/// @description Insert description here
// You can write your code in this editor
if(keyboard_check_pressed(ord("R")))
{
	if (instance_exists(o_player))
	{
		o_player.x += 100;
	}
}
if(keyboard_check_pressed(ord("L")))
{
	instance_create_layer(900, 2200, "Instances", o_enemyCar);
}
if(keyboard_check(ord("T")))
{
	//debug = !debug;
	global.maxShake = clamp(global.maxShake - 0.5, 0, 100);
}
if(keyboard_check(ord("Y")))
{
	global.maxShake = clamp(global.maxShake + 0.5, 0, 100);
}
if(keyboard_check_pressed(ord("U")))
{
	global.maxShake = 30;
	addTrauma(0.1);
}
if(keyboard_check(ord("I")))
{
	addTrauma(1);
}
if(keyboard_check_pressed(ord("O")))
{
	global.dynCam = !global.dynCam;
}
if(keyboard_check_pressed(ord("P")))
{
	global.rand = !global.rand;
}
if(keyboard_check_pressed(ord("H")))
{
	room_restart();
}
if(keyboard_check_pressed(ord("N")))
{
	if(global.control_scheme == "keyboard")
	{
		global.control_scheme = "controller";
	} else global.control_scheme = "keyboard";
}
if(keyboard_check_pressed(ord("M")))
{
	if(global.target == o_player)
	{
		global.target = o_pathfollow;
	} else global.target = o_player;
}
if(keyboard_check(ord("G")))
{
	global.pfuel = clamp(global.pfuel + 100, 0, 10000);
	global.phealth = clamp(global.phealth + 1, 0, 500);
}
counter = clamp(counter 
	- keyboard_check_pressed(vk_left) + keyboard_check_pressed(vk_right),
	0, 10);
	
