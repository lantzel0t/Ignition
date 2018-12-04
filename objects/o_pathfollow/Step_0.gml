/// @description Insert description here
// You can write your code in this editor
if (distance_to_object(o_player) < 500) {
	global.target = o_player;
	path_speed = 0;
	
} else {
	global.target = self;
	path_speed = 10;
}