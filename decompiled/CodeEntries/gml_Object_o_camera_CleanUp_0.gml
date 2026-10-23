if (surface_exists(application_surface))
{
    surface_free(application_surface);
}
if (variable_instance_exists(id, "camera") && !is_undefined(camera))
{
    camera_destroy(camera);
}
