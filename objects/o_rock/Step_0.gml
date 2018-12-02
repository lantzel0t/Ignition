/// @description Bust if hit
if (place_meeting(x, y, o_collidable3d)) {
	part_particles_create(global.PS_high, x, y, global.Part_rock, 20);
	if (place_meeting(x, y, o_player)) {
		addTrauma(0.2);
	}
	instance_destroy();
}