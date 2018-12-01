/// @description Bust if hit
if (place_meeting(x, y, o_collidable3d)) {
	part_particles_create(global.P_System, x, y, global.Part_rock, 20);
	instance_destroy();
}