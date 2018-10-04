/// @description DON'T TOUCH THIS
draw_trails(200, 32, c_gray, s_tracks, false, 0.2);
draw_3d(s_wheel, x + leftWheelX, y + leftWheelY, wheelAngle);
draw_3d(s_wheel, x + rightWheelX, y + rightWheelY, wheelAngle);
//draw_text(x, y + 40, string(vel) + "   " + string(turnAng));