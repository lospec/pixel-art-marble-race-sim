///destroy_map_in_list(list_with_maps)
//Special script for destroy ds_list, and all ds_maps are contained
//Be carefull and beware memory leaks
l_list = argument0;
for (i = 0; i < ds_list_size(l_list); i++)
{
    ds_map_destroy(l_list[| i]);
}
ds_list_destroy(l_list);
