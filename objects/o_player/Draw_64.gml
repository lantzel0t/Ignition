/// @description Debug Stuff
//draw_set_colour(c_white);

draw_text(0,0, "View angle: " + string(global._viewang)
	+ "#Boy angle: " + string(image_angle)
	+ "FPS: " + string(fps));
draw_text(50, 50, string(camera_get_view_height(0)/camera_get_view_width(0)));

draw_sprite(sprite6, 0, display_get_width(), display_get_height());
//draw_text(0, window_get_height() + 10, string(global.pfuel));
draw_set_color(c_black);
draw_line_width(0, window_get_height() + 50, 0, 0 + 50, 80);
draw_set_color(c_white);
draw_line_width(0, window_get_height() + 50, 0, 0 + 50 + window_get_height() * (1 - (global.pfuel / 10000)), 80);