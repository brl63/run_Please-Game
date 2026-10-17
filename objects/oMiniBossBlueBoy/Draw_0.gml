if (is_hit)
{
   
    gpu_set_fog(true, c_red, 0, 0);
    draw_self();
    gpu_set_fog(false, c_white, 0, 0);
}
else
{
    draw_self();
}