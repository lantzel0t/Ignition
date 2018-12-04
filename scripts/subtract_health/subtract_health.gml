var healthSub = argument[0];
with (o_player) {
	if (global.immune <= 0) {
		global.phealth = clamp(global.phealth -healthSub, 0, 500);
	}
}