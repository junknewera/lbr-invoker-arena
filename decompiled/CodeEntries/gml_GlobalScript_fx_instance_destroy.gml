function fx_instance_destroy()
{
    if (force_remove)
    {
        instance_destroy();
        exit;
    }
    ds_list_add(o_game.pool_fx_text_inactive, id);
    ds_list_delete(o_game.pool_fx_text_active, ds_list_find_index(o_game.pool_fx_text_active, id));
    instance_deactivate_object_hook(id);
}
