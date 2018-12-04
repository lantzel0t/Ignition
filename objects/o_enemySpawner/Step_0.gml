/// @description Insert description here
// You can write your code in this editor
if (current != global.enemies) {
	current = global.enemies;
	with (o_pathfollow) {
			path_start(path0, 10, path_action_restart, true);
		}
	switch (current) {
		case 9:
		//spawn 2
		instance_create_layer(o_pathfollow.x, o_pathfollow.y, "Instances", o_enemyCar);
		instance_create_layer(o_pathfollow.x + 100, o_pathfollow.y, "Instances", o_enemyCar);
		break;
		case 7:
		//spawn 3
		instance_create_layer(o_pathfollow.x + 100, o_pathfollow.y, "Instances", o_enemyCar);
		instance_create_layer(o_pathfollow.x + 100, o_pathfollow.y + 100, "Instances", o_enemyCar);
		instance_create_layer(o_pathfollow.x - 100, o_pathfollow.y, "Instances", o_enemyCar);
		break;
		case 4:
		//spawn 4 reg, 2 spec
		instance_create_layer(o_pathfollow.x, o_pathfollow.y, "Instances", o_enemyCar);
		instance_create_layer(o_pathfollow.x + 100, o_pathfollow.y, "Instances", o_enemyCar);
		instance_create_layer(o_pathfollow.x + 100, o_pathfollow.y + 100, "Instances", o_enemyCar);
		instance_create_layer(o_pathfollow.x - 100, o_pathfollow.y, "Instances", o_enemyCar);
		
		instance_create_layer(o_pathfollow.x - 100, o_pathfollow.y - 100, "Instances", o_enemyCar2);
		instance_create_layer(o_pathfollow.x + 100, o_pathfollow.y - 100, "Instances", o_enemyCar2);
		break;
		default:
		break;
	}
}