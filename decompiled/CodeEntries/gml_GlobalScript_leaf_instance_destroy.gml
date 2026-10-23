function leaf_instance_destroy()
{
    if (is_struct(unique))
    {
        instance_destroy();
        exit;
    }
    if (add_reward_flag)
    {
        var leaf_count = 1;
        var leaf_reward_value = 1;
        o_game.leaves -= leaf_count;
        if (mulched)
        {
            type = global.resources.mulch;
            leaf_reward_value = get_leaf_reward_value(global.resources.mulch);
            o_game.data.stats.leaves_mulched++;
        }
        else if (juiced)
        {
            leaf_reward_value = get_leaf_reward_value(global.resources.borb_juice);
            type = global.resources.borb_juice;
            o_game.data.stats.borb_juiced++;
        }
        else
        {
            leaf_reward_value = get_leaf_reward_value(type, 1, 1);
            o_game.combo++;
            o_game.data.stats.leaves_blown_total++;
        }
        add_resources_cache(type, leaf_reward_value, true);
        fx_resources_single(type, leaf_reward_value);
    }
    destroy_leaf(id);
}
