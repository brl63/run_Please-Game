// Gravity
ysp += grav;

//  Horizontal Movement
xsp = move_speed * dir;
// Reverse direction when hitting a wall or another platform
if (place_meeting(x + xsp, y, oSolid))
{
    dir *= -1;
}
if (is_hit)
{
    hit_timer--;
    if (hit_timer <= 0)
    {
        is_hit = false;
    }
}
// Stomp MiniBoss Mechanic
var _boss = instance_place(x, y + ysp, oMiniBoss);
if (_boss != noone)
{
   
    if (ysp > 0) && (y < _boss.y)
    {
        if (!_boss.is_hit)
        {
            _boss.hp -= 1;           
            _boss.is_hit = true;      
            _boss.hit_timer = 8;     
            
            ysp = -6;                 
        }
    }
}

// 4. Apply Movement & Collision
move_and_collide(xsp, ysp, oSolid);

// 5. Death Check
if (hp <= 0)
{
    instance_destroy();
}
