/// @description DON'T TOUCH THIS
draw_trails(200, 32, c_gray, s_tracks, false, 0.2);
part_type_gravity(global.Part_smoke, 0.2, global._viewang + 90);
part_type_direction(global.Part_smoke, image_angle + 180, image_angle + 180,0,20);
if (vel > 2) {
	part_particles_create(global.PS_low, x + leftWheelX, y + leftWheelY, global.Part_dust, 4);
	part_particles_create(global.PS_low, x + rightWheelX, y + rightWheelY, global.Part_dust, 4);
	
	part_particles_create(global.PS_low, x + backWheelX, y + backWheelY, global.Part_dust, 2);
	part_particles_create(global.PS_low, x - backWheelX, y - backWheelY, global.Part_dust, 2);
}
if (global.pfuel > 100) {
	part_particles_create(global.PS_high, x + pipeX, y + pipeY, global.Part_smoke, 4);
}
draw_3d(s_wheel, x + leftWheelX, y + leftWheelY, wheelAngle);
draw_3d(s_wheel, x + rightWheelX, y + rightWheelY, wheelAngle);

//draw_text(x, y + 40, string(vel) + "   " + string(turnAng));