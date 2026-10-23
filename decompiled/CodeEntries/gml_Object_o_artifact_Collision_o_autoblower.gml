if (get_upgrade_count(global.shops.blc.alb_can_collect_artifacts) == 0)
{
    exit;
}
artifact.collect();
if (artifact.data.collected == 1)
{
    fx_artifact(artifact);
}
fx_sprite(sprite_index, artifact.name, true);
instance_destroy();
