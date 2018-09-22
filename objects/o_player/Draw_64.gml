/// @description Debug Stuff
//draw_set_colour(c_white);
draw_text(0,0, "View angle: " + string(global._viewang)
	+ "#Boy angle: " + string(image_angle - global._viewang)
	+ "FPS: " + string(fps));
draw_text(20,20, string(turnAng));