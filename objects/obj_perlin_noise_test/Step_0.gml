if (keyboard_check_pressed(ord("R")))
{
    randomize();
    seed = random_get_seed();
    surface_free(surf);
}

if (keyboard_check_pressed(vk_space))
or (keyboard_check_pressed(ord("S")))
or (keyboard_check_pressed(ord("P")))
or (keyboard_check_pressed(ord("I")))
{
    randomize();
    octaves = irandom_range(4,8);
    persistence = random_range(.25,.5);
    scale = irandom_range(10,20);
    surface_free(surf);
}

if (surface_exists(surf)==false)
{
    surf = surface_create(room_width,room_height);
    
    surface_set_target(surf);
    

    
    var points = room_width/2;
    var scale = 10;
    var wavelength = points;
    var incWidth = (room_width/(points-1));
    var yyy = (room_height/2);
    var incHeight = yyy;
    draw_primitive_begin(pr_linestrip);
    for(var i = 0; i <= points; i++)
    {
        var xx = incWidth*i;
        if (keyboard_check(ord("P")))
            var yy = PN_1D_perlinNoise(i,seed,persistence,octaves, wavelength, scale);
        else if (keyboard_check(ord("S")))
            var yy = PN_1D_smoothedNoise(i, seed, wavelength, scale);
        else if (keyboard_check(ord("I")))
            var yy = PN_1D_interpolatedNoise(i, seed, wavelength, scale);
        else
            var yy = PN_1D_noise(i, seed);
        yy = yyy+(incHeight*yy);
        draw_vertex(xx,yy);
    }
    draw_primitive_end();
    
    var help ="Controls:#R = New Noise#P = Draw Perlin Noise#S = Smooth Noise#I = Interpolated Noise#Space = Noise"; 
    draw_set_color(c_white);
    draw_rectangle(0,0,200,48+string_height_ext(help,-1,200),0);
    draw_set_color(c_black);
    draw_text(0,0,"Persistence: "+string(persistence));
    draw_text(0,16,"Octaves: "+string(octaves));
    draw_text(0,32,"Seed: "+string(seed));
    draw_text_ext(0,48,help,-1,200);
    
    surface_reset_target();
}



