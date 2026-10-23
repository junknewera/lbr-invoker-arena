var collect_count = get_material_collect_count();
fx_sprite(sprite_index, get_item_collect_name(item.name, collect_count), true);
item.collect(collect_count);
instance_destroy();
