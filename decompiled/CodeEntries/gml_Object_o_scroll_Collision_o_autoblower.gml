if (get_upgrade_count(global.shops.gold_token.alb_can_collect_scrolls) == 0)
{
    exit;
}
notify(sprintf(__("%s collected."), item.name));
item.collect();
instance_destroy();
