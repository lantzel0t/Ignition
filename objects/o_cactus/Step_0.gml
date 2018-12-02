/// @description Bust if hit
if (place_meeting(x, y, o_collidable3d)) {
	part_particles_create(global.PS_high, x, y, global.Part_plant, 20);
	if (place_meeting(x, y, o_player)) {
		addTrauma(0.3);
	}
	instance_destroy();
}