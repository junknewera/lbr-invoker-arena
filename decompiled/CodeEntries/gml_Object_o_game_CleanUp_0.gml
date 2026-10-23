if (surface_exists(surface))
{
    surface_free(surface);
}
if (surface_exists(surface_leaf))
{
    surface_free(surface_leaf);
}
if (surface_exists(surface_trees))
{
    surface_free(surface_trees);
}
ds_list_destroy(global.active_pets);
ds_list_destroy(leaves_active);
ds_list_destroy(leaves_inactive);
ds_list_destroy(pool_fx_text_active);
ds_list_destroy(pool_fx_text_inactive);
