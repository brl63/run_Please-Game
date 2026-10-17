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
if (ysp < 0)
{
    // for platforms
    move_and_collide(xsp, ysp, oSolid, 4, 0, 0, [oPlatforms]);
}
else
{
    
    move_and_collide(xsp, ysp, oSolid);
}

//  Win and Death Triggers
var _flag = instance_place(x, y, oFlag);
if (_flag != noone) && (_flag.visible)
{
    room_goto_next();
}

if (place_meeting(x, y, oThingsToMakeDie))
{
  
    var _touching_boss = instance_place(x, y, oMiniBoss);
    if (_touching_boss != noone)
    {
     
        if (ysp < 0) || (bbox_bottom <= _touching_boss.y + 4)
        {
        
        }
        else
        {
            room_restart(); // موت عالي الجوانب/الأسفل
        }
    }
    else
    {
        room_restart(); // الموت العادي مع باقي الأشياء
    }
}