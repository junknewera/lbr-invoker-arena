artifact.collect();
if (artifact.data.collected == 1)
{
    fx_artifact(artifact);
}
fx_sprite(sprite_index, artifact.name, true);
instance_destroy();
