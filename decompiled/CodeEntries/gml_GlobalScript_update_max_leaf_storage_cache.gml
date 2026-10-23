function update_max_leaf_storage_cache()
{
    global.upgrade_attributes.max_leaf_storage_cache = "1" + string_repeat("0", 30 + global.upgrade_attributes.max_leaf_storage);
    global.upgrade_attributes.max_leaf_storage_cache_level = global.upgrade_attributes.max_leaf_storage;
}
