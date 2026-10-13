//moving to the charcter
xsp = 0;

if keyboard_check(vk_left)
{
    xsp = -move_speed;
}
if keyboard_check(vk_right)
{
    xsp = move_speed;
}


if place_meeting(x, y + 1, oSolid)
{
    ysp = 0;
    if keyboard_check(vk_up)
    {
        ysp = -4;
    }
}
else
{
    ysp += 0.1;
}


move_and_collide(xsp, ysp, oSolid);

// Win And Die to the Chracter
if (place_meeting(x, y, oFlag))
{
    room_goto_next();
}
if (place_meeting(x, y, oThingsToMakeDie))
{
    room_restart();
}