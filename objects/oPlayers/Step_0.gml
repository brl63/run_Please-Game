// 1. Jump Buffer
if (keyboard_check_pressed(vk_space))
{
    jump_buffer_counter = jump_buffer_time;
}

if (jump_buffer_counter > 0)
{
    jump_buffer_counter--;
}

// 2. Horizontal Movement
xsp = 0;

if (keyboard_check(vk_left))
{
    xsp = -move_speed;
}
if (keyboard_check(vk_right))
{
    xsp = move_speed;
}

// 3. Vertical Movement & Jumping Logic
if (place_meeting(x, y + 1, oSolid))
{
    ysp = 0;
    coyote_counter = coyotetime;  
}
else
{
	coyote_counter--;
	if(keyboard_check_released(vk_space)&& (ysp < 0))
	{
		ysp *= 0.5;
	}
	ysp += 0.2; //gravity
}
if (coyote_counter > 0) && (jump_buffer_counter > 0)
{
    ysp = -5.2;             
    jump_buffer_counter = 0; 
    coyote_counter = 0;     
}

// Ride Moving Platforms
var _platform = instance_place(x, y + 1, oPlatforms);
if (_platform != noone)
{
    x += _platform.xsp;
    y += _platform.ysp;
}
// Apply Movement & Collision
move_and_collide(xsp, ysp, oSolid);

//  Win and Death Triggers
if (place_meeting(x, y, oFlag))
{
    room_goto_next();
}

if (place_meeting(x, y, oThingsToMakeDie))
{
    room_restart();
}