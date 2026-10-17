switch(move_type){
	case "horizontal":
        xsp = move_speed * dir;
        ysp = 0;
        
        // Reverse direction on hitting a wall
        if (place_meeting(x + xsp, y, oSolid))
        {
            dir *= -1;
            xsp = move_speed * dir;
        }
        break;
		case "vertical":
		xsp = 0;
		ysp = move_speed *dir;
		
	if (place_meeting(x + xsp, y, oSolid))
        {
            dir *= -1;
            xsp = move_speed * dir;
        }
}
x += xsp;
y += ysp;