///point_add(list_with_points, x, y)
//Create points ds_map, and add it to the list_with_points
l_list = argument0;
l_x = argument1;
l_y = argument2;
var l_map;
l_map = ds_map_create();
l_map[? "x"] = l_x;
l_map[? "y"] = l_y;
ds_list_add(l_list, l_map);
