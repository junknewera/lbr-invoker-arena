artifact = undefined;
duration = sec(5);

init = function()
{
    if (is_numeric(duration))
    {
        alarm[0] = duration;
    }
};

destroy = function()
{
    if (is_struct(artifact))
    {
        set_timeout(artifact.destroy_time_key, artifact.auto_use_delay);
    }
    instance_destroy();
};
