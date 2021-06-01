///get_perimeter(list_with_points)
//Jarvis march or gift wrapping algorithm
//Return ds_list with points ds_map, which is contained minimum convex hull
//Anti-clockwise orientation
//First node = last node
//Excess points will delete
//WARNING! Script create and return new ds_list, please, delete it after use
l_points_list = argument0;

perimeter_list = ds_list_create();
var buf_max = l_points_list[| 0];
for (i = 0; i < ds_list_size(l_points_list); i++)
{
    if (ds_map_find_value(l_points_list[| i], "x") > buf_max[? "x"])
    {
        buf_max = l_points_list[| i];
    }
}
perimeter_list[| 0] = buf_max;
var next_point = noone;
var current_direction = 0;
var last_point = perimeter_list[| 0];
var buf_point = 0;
while (next_point != perimeter_list[| 0])
{  
    buf_max = 10000;
    for (i = 0; i < ds_list_size(points_list); i++)
    {
        var local_dir;
        local_dir = point_direction(last_point[? "x"], last_point[? "y"], 
        ds_map_find_value(l_points_list[| i], "x"), ds_map_find_value(l_points_list[| i], "y"));
        if (local_dir < current_direction)
        {
            local_dir += 360;
        }
        
        if ((local_dir - current_direction) < buf_max)
        {
            if (last_point != l_points_list[| i])
            {
                buf_max = local_dir - current_direction;
                next_point = l_points_list[| i];
            }
        }
    }
    current_direction = point_direction(last_point[? "x"], last_point[? "y"], 
        next_point[? "x"], next_point[? "y"]);
    ds_list_add(perimeter_list, next_point);
    last_point = next_point; 
}
return perimeter_list;
