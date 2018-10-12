/// @description Insert description here
// You can write your code in this editor
if(keyboard_check_pressed(ord("R")))
{
	if (instance_exists(o_player))
	{
		instance_destroy(o_player);
	}
	instance_create_depth(x, y, 100, o_player);
}
if(keyboard_check_pressed(ord("L")))
{
	instance_create_depth(random_range(0, room_width), random_range(0, room_height), 100, o_enemyCar);
}
if(keyboard_check_pressed(ord("T")))
{
	debug = !debug;
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
}
counter = clamp(counter 
	- keyboard_check_pressed(vk_left) + keyboard_check_pressed(vk_right),
	0, 10);
	
