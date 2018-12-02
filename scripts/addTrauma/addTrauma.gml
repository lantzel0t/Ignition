///calculate_movement_and_collision(velocity, direction)
var traumaAdd = argument[0];
with (o_cameraController) {
	trauma = clamp(trauma + traumaAdd, 0, 1);
}