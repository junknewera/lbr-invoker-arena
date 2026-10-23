function check_drop_gem_leaf(arg0, arg1)
{
    if (global.current_tower_floor <= 100)
    {
        exit;
    }
    var available_gem_leaves = [];
    var __array = global.resources_gem_leaves;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (!mitem.data.unlocked)
        {
            continue;
        }
        array_push(available_gem_leaves, mitem);
    }
    if (array_length(available_gem_leaves) == 0)
    {
        exit;
    }
    var leaf_count = floor((global.current_tower_floor - 110) / 10) * 4;
    leaf_count = clamp(leaf_count, 1, global.max_leaves);
    var autoloot_gem_leaves = get_upgrade_count(global.shops.gems.autoloot_tower_gem_leaves) > 0 && global.shops.gems.autoloot_tower_gem_leaves.data.toggle;
    var autoloot_struct = autoloot_gem_leaves ? {} : undefined;
    repeat (leaf_count)
    {
        var gem_leaf = array_random_item(available_gem_leaves);
        if (autoloot_gem_leaves)
        {
            struct_merge(autoloot_struct, get_leaf_reward(gem_leaf));
        }
        else
        {
            create_leaf(arg0 + irandom_range(-60, 60), arg1 + irandom_range(-60, 60), gem_leaf, true);
        }
    }
    if (autoloot_gem_leaves)
    {
        add_resources(autoloot_struct, true);
    }
}
