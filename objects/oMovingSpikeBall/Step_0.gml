switch(move_type){
case "horizontal":
        x += move_speed * dir;
        // Reverse direction on wall collision
        if (place_meeting(x + (move_speed * dir), y, oSolid))
        {
            dir *= -1;
        }
        break;
case "vertical":
        y += move_speed * dir;
        // Reverse direction on wall collision
        if (place_meeting(x, y + (move_speed * dir), oSolid))
        {
            dir *= -1;
        }
        break;
		case "circle":
        circle_angle += move_speed;
        x = center_x + lengthdir_x(circle_radius, circle_angle);
        y = center_y + lengthdir_y(circle_radius, circle_angle);
        break;
}
	