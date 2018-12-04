/// @description Debug Stuff
var viewW = display_get_gui_width() * 1.468;
var viewH = display_get_gui_height() * 1.468;

//draw_set_colour(c_white);
/*
draw_text(0,0, "View angle: " + string(global._viewang)
	+ "#Boy angle: " + string(image_angle)
	+ "FPS: " + string(fps));
draw_text(50, 50, string(camera_get_view_height(0)/camera_get_view_width(0)));
*/
draw_sprite(sprite6, 0, viewW, viewH);
//draw_text(20, window_get_height() + 10, string(global.pfuel));
draw_set_color(c_black);
draw_line_width(20, viewH, 20, 0, 40);
draw_set_color(c_orange);
draw_line_width(20, viewH, 20, viewH * (1 - (global.pfuel / 10000)), 40);

draw_set_color(c_red);
draw_line_width(60, viewH, 60, 0, 40);
draw_set_color(c_green);
draw_line_width(60, viewH, 60, viewH * (1 - (global.phealth / 500)), 40);

draw_set_color(c_black);
if (global.enemies <= 0) {
	draw_text(100, 22, "ALL TARGETS THRASHED. GOOD DRIVING.");
} else {
	draw_text(100, 22, "THRASH " + string(global.enemies) + " RAIDERS.");
}
draw_set_color(c_white);

if (global.pfuel <= 0 || global.phealth <= 0) {
	
	deadA += 0.01;
	
	if (deadA >= 1) {
		room_restart();
	}
} else if (deadA > -0.5) deadA -= 0.01;
draw_set_alpha(deadA);
draw_rectangle(-5, -5, viewW, viewH, false);
draw_set_alpha(1);