/// @description Instantiates all particle types
global.PS_ground = part_system_create();
global.PS_low = part_system_create();
global.PS_high = part_system_create();

#region smoke
//global.PE_smoke = part_emitter_create(global.P_System);
global.Part_smoke = part_type_create();
//part_emitter_stream(global.P_System, global.PE_smoke, global.Part_smoke, 4);
part_type_shape(global.Part_smoke,pt_shape_pixel);
part_type_size(global.Part_smoke, 0.5, 0.7, 0.4, 0);
part_type_scale(global.Part_smoke, 4, 4);
part_type_color2(global.Part_smoke,c_dkgray, c_ltgray);
part_type_alpha2(global.Part_smoke,0.4, 0);
part_type_speed(global.Part_smoke, 1, 2, -0.2,0);
           //The direction
part_type_orientation(global.Part_smoke, 0, 359, 0, 1, 1);
part_type_blend(global.Part_smoke, 0);
part_type_life(global.Part_smoke, 1, 20);
#endregion

#region dust
//global.PE_smoke = part_emitter_create(global.P_System);
global.Part_dust = part_type_create();
//part_emitter_stream(global.P_System, global.PE_smoke, global.Part_smoke, 4);
part_type_shape(global.Part_dust,pt_shape_pixel);
part_type_size(global.Part_dust, 1, 1, 0.4, 0);
part_type_scale(global.Part_dust, 2, 2);
part_type_color2(global.Part_dust,merge_color(make_color_rgb(247, 142, 86), c_black, 0.4), make_color_rgb(247, 142, 86));
part_type_alpha2(global.Part_dust,0.7, 0);
//part_type_speed(global.Part_dust, 2, 4, -0.10,0);
           //The direction
part_type_orientation(global.Part_dust, 0, 359, 0, 5, 1);
part_type_blend(global.Part_dust, 0);
part_type_life(global.Part_dust, 1, 20);
#endregion

#region rockBurst
global.Part_rock = part_type_create();
part_type_sprite(global.Part_rock, s_rock, false, false, true);
part_type_size(global.Part_rock, 0.5, 1, -0.05, 0);
part_type_scale(global.Part_rock, 1, 1);
//part_type_color2(global.Part_rock,c_dkgray, c_ltgray);
part_type_alpha1(global.Part_rock, 1);
part_type_speed(global.Part_rock, 1, 2, -0.2,0);
part_type_orientation(global.Part_rock, 0, 359, 0, 0, 1);
part_type_direction(global.Part_rock, 0, 359, 0, 0);
part_type_speed(global.Part_rock, 3, 5, -0.4, 0);
part_type_life(global.Part_rock, 1, 40);
#endregion

#region plantBurst
global.Part_plant = part_type_create();
part_type_sprite(global.Part_plant, s_cactus1, false, false, true);
part_type_size(global.Part_plant, 0.5, 1, -0.05, 0);
part_type_scale(global.Part_plant, 1, 1);
//part_type_color2(global.Part_rock,c_dkgray, c_ltgray);
part_type_alpha1(global.Part_plant, 1);
part_type_speed(global.Part_plant, 1, 2, -0.2,0);
part_type_orientation(global.Part_plant, 0, 359, 0, 0, 1);
part_type_direction(global.Part_plant, 0, 359, 0, 0);
part_type_speed(global.Part_plant, 3, 5, -0.4, 0);
part_type_life(global.Part_plant, 1, 40);
#endregion

#region flameBurst
global.Part_fburst = part_type_create();
part_type_shape(global.Part_fburst,pt_shape_pixel);
//part_type_size(global.Part_fburst, 0.5, 1, -0.05, 0);
part_type_scale(global.Part_fburst, 8, 8);
//part_type_color2(global.Part_rock,c_dkgray, c_ltgray);
part_type_alpha1(global.Part_fburst, 1);
//part_type_speed(global.Part_fburst, 1, 2, -0.2,0);
part_type_orientation(global.Part_fburst, 0, 359, 0, 0, 1);
//part_type_direction(global.Part_fburst, 0, 359, 0, 0);
//part_type_speed(global.Part_fburst, 3, 5, -0.4, 0);
part_type_life(global.Part_fburst, 400, 400);
#endregion