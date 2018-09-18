/// @description Insert description here
// You can write your code in this editor
draw_set_colour(c_white);
draw_text(0,0, "Global angle: " + string(global._viewang)
	+ "#View angle: " + string(camera_get_view_angle(camera_get_active()))
	+ "#Boy angle: " + string(image_angle)
	+ "FPS: " + string(fps)
	+ "Instances: " + string(instance_number(o_pillar)));