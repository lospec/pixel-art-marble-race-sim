///get_fixture(list_with_points)
//Return fixture from list_with_points
l_points_list = argument0;
l_perimeter = get_perimeter(l_points_list);

var fixture = physics_fixture_create();
physics_fixture_set_polygon_shape(fixture);
for (i = ds_list_size(l_perimeter) - 1; i > 0; i--)
{
    physics_fixture_add_point(fixture, ds_map_find_value(l_perimeter[| i], "x"), ds_map_find_value(l_perimeter[| i], "y"));
}
ds_list_destroy(l_perimeter);
return fixture;
