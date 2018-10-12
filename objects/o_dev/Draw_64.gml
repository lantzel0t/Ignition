/// @description Insert description here
// You can write your code in this editor
switch (counter)
{
	case 0:
		draw_text(100, 100, "Controls:\nGas Pedal - Right trigger\n"
			+ "Brake/Reverse - Left trigger\nSteer - Left Joystick\n"
			+ "Rotate Cam - Top buttons\nDrop Fuel - A");
	break;
	case 1:
		draw_text(100, 100, "Milestones:\n-Source Control\n-Basic controls for keyboard and controller"
		+ "\n-'Backbone' mechanic prototyped\n-Enemy character AI\n-Fuel gauge");
	break;
	case 2:
		//game design behind gas
		draw_text(100, 100, "The 'backbone' mechanic");
		draw_sprite(link, 0, 150, 150);
	break;
	default:
	break;
}
draw_text(window_get_width(), 20, "DEVBUILD");