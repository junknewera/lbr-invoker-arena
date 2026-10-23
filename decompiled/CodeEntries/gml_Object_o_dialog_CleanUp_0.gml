try
{
    if (surface_exists(surface))
    {
        if (drawing_to_surface_stack)
        {
            surface_reset_target();
        }
        surface_free(surface);
        surface_free(surface_items);
    }
}
catch (err)
{
    log("dialog err", err);
}
