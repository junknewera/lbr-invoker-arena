function is_unlocked_array(arg0)
{
    if (!is_array(arg0))
    {
        return false;
    }
    var __array = arg0;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (!is_unlocked_array_type(mitem))
        {
            return false;
        }
    }
    return true;
}

function is_unlocked_array_type(arg0)
{
    if (!is_struct(arg0) || is_undefined(struct_get_from_hash(arg0, variable_get_hash("type"))) || is_undefined(struct_get_from_hash(arg0, variable_get_hash("value"))))
    {
        return false;
    }
    var result = true;
    switch (arg0.type)
    {
        case "custom":
            result = !arg0.check();
            break;
        case "min_tower_floor":
            result = global.areas.tower.get_highest_floor_current_run() < arg0.value;
            break;
        case "unlock_alchemy":
            result = !is_unlocked_alchemy();
            break;
        case "unlock_ascension_shards":
            result = !is_unlocked_ascension_shards();
            break;
        case "unlock_cards":
            result = !is_unlocked_cards();
            break;
        case "unlock_crafting":
            result = !is_unlocked_crafting();
            break;
        case "unlock_energy_electrical":
            result = !is_unlocked_energy_electrical();
            break;
        case "unlock_equipment":
            result = !is_unlocked_equipment();
            break;
        case "unlock_fusion_shards":
            result = !is_unlocked_fusion_shards();
            break;
        case "unlock_gem_leaves":
            result = !is_unlocked_gem_leaves();
            break;
        case "unlock_leafscension":
            result = !is_unlocked_leafscension();
            break;
        case "unlock_materials":
            result = !is_unlocked_materials();
            break;
        case "unlock_pyramid":
            result = !is_unlocked_pyramid();
            break;
        case "unlock_relics":
            result = !is_unlocked_relics();
            break;
        case "unlock_resource":
            result = !is_unlocked_resource(arg0.value);
            break;
        case "unlock_shards":
            result = !is_unlocked_shards();
            break;
        case "unlock_trading":
            result = !is_unlocked_trading();
            break;
        case "unlock_transformation_shards":
            result = !is_unlocked_transformation_shards();
            break;
    }
    return true;
}

function is_energy_shrine_prophecy_fulfilled()
{
    if (global.enemies.boss_terror_blue.get_current_defeat_counter() == 0 || !global.areas.planet_edge_blue.check())
    {
        return false;
    }
    if (global.enemies.boss_terror_green.get_current_defeat_counter() == 0 || !global.areas.planet_edge_green.check())
    {
        return false;
    }
    if (global.enemies.boss_terror_red.get_current_defeat_counter() == 0 || !global.areas.planet_edge_red.check())
    {
        return false;
    }
    if (global.enemies.boss_terror_purple.get_current_defeat_counter() == 0 || !global.areas.planet_edge_purple.check())
    {
        return false;
    }
    return true;
}

function is_unlocked_alchemy(arg0 = true)
{
    if (get_default_struct_value(global.game_settings.unlocked, "alchemy", false))
    {
        return true;
    }
    if (arg0)
    {
        return global.shops.blc.unlock_alchemy.data.collected > 0;
    }
    return get_upgrade_count(global.shops.blc.unlock_alchemy) > 0;
}

function is_unlocked_areas()
{
    if (get_default_struct_value(global.game_settings.unlocked, "areas", false))
    {
        return true;
    }
    return get_upgrade_count(global.shops.coins.unlock_areas) > 0 || get_upgrade_count(global.shops.mlc.areas_persist_mlc) > 0 || get_upgrade_count(global.shops.ulc.areas_persist_ulc) > 0 || global.game_settings.area_menu_unlocked;
}

function is_unlocked_artifacts(arg0 = true)
{
    if (get_default_struct_value(global.game_settings.unlocked, "artifacts", false))
    {
        return true;
    }
    if (arg0)
    {
        return global.shops.blc.unlock_artifacts.data.collected > 0;
    }
    return get_upgrade_count(global.shops.blc.unlock_artifacts) > 0;
}

function is_unlocked_ascension_shards()
{
    if (get_default_struct_value(global.game_settings.unlocked, "ascension_shards", false))
    {
        return true;
    }
    return get_upgrade_count(global.shops.hematite.unlock_ascension_shards) > 0;
}

function is_unlocked_banks()
{
    if (get_default_struct_value(global.game_settings.unlocked, "banks", false))
    {
        return true;
    }
    return get_upgrade_count(global.shops.soul_entities.unlock_banks) > 0;
}

function is_unlocked_blc()
{
    if (get_default_struct_value(global.game_settings.unlocked, "blc", false))
    {
        return true;
    }
    return get_upgrade_count(global.shops.flask_black.unlock_big_crunch) > 0;
}

function is_unlocked_blc_text()
{
    if (get_default_struct_value(global.game_settings.unlocked, "blc_text", false))
    {
        return true;
    }
    return o_game.data.stats.prestige_crunch > 0 || is_unlocked_blc();
}

function is_unlocked_borbs()
{
    if (get_default_struct_value(global.game_settings.unlocked, "borbs", false))
    {
        return true;
    }
    return get_upgrade_count(global.shops.benitoite.unlock_borbs) > 0;
}

function is_unlocked_borbventure()
{
    if (get_default_struct_value(global.game_settings.unlocked, "borbventure", false))
    {
        return true;
    }
    return get_upgrade_count(global.shops.mlc.unlock_borbventures) > 0 || get_upgrade_count(global.shops.dlc.borbventure_pack) > 0;
}

function is_unlocked_boosters()
{
    if (get_default_struct_value(global.game_settings.unlocked, "boosters", false))
    {
        return true;
    }
    return global.booster_game_upgrades.get_upgrade_value("unlock_booster") > 0;
}

function is_unlocked_butterflies()
{
    if (get_default_struct_value(global.game_settings.unlocked, "butterflies", false))
    {
        return true;
    }
    return get_upgrade_count(global.shops.event_nature.unlock_butterflies) > 0;
}

function is_unlocked_cards(arg0 = false)
{
    if (get_default_struct_value(global.game_settings.unlocked, "cards", false))
    {
        return true;
    }
    var shop_unlock_bought = get_upgrade_count(global.shops.mlc.unlock_cards) > 0;
    if (arg0)
    {
        return shop_unlock_bought;
    }
    return shop_unlock_bought || get_upgrade_count(global.shops.dlc.cards_pack) > 0;
}

function is_unlocked_challenges()
{
    if (get_default_struct_value(global.game_settings.unlocked, "challenges", false))
    {
        return true;
    }
    if (global.cloud_data.is_season)
    {
        return false;
    }
    return is_gt(get_profile_resource(global.profile_types.def, global.resources.blc, "collected_total"), 0);
}

function is_unlocked_chests()
{
    if (get_default_struct_value(global.game_settings.unlocked, "chests", false))
    {
        return true;
    }
    if (!is_unlocked_tower())
    {
        return false;
    }
    var __array = global.chests_array;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (mitem.data.collected > 0)
        {
            return true;
        }
    }
    return false;
}

function is_unlocked_converters(arg0 = false)
{
    if (get_default_struct_value(global.game_settings.unlocked, "converters", false))
    {
        return true;
    }
    if (arg0)
    {
        return global.shops.coins.unlock_converters.data.collected > 0;
    }
    return get_upgrade_count(global.shops.coins.unlock_converters) > 0;
}

function is_unlocked_crafting(arg0 = false)
{
    if (get_default_struct_value(global.game_settings.unlocked, "crafting", false))
    {
        return true;
    }
    if (arg0)
    {
        return global.shops.blc.unlock_crafting.data.collected > 0;
    }
    return get_upgrade_count(global.shops.blc.unlock_crafting) > 0;
}

function is_unlocked_death_book()
{
    if (get_default_struct_value(global.game_settings.unlocked, "death_book", false))
    {
        return true;
    }
    return get_default_struct_value(o_game.data.flags, "death_book", false);
}

function is_unlocked_dice()
{
    if (get_default_struct_value(global.game_settings.unlocked, "dice", false))
    {
        return true;
    }
    return area_bought(global.areas.dicey_meadows);
}

function is_unlocked_energy_electrical()
{
    if (get_default_struct_value(global.game_settings.unlocked, "energy_electrical", false))
    {
        return true;
    }
    return get_upgrade_count(global.shops.hematite.unlock_resource_energy_electrical) > 0;
}

function is_unlocked_equipment()
{
    if (get_default_struct_value(global.game_settings.unlocked, "equipment", false))
    {
        return true;
    }
    return get_upgrade_count(global.areas.tower) > 0 || global.areas.tower.get_highest_floor_current_run() > 1;
}

function is_unlocked_fire_fields()
{
    if (get_default_struct_value(global.game_settings.unlocked, "fire_fields", false))
    {
        return true;
    }
    return area_bought(global.areas.shadow_cavern) && global.areas.ff_portal.check();
}

function is_unlocked_fishing()
{
    if (get_default_struct_value(global.game_settings.unlocked, "fishing", false))
    {
        return true;
    }
    return area_bought(global.areas.fish_pond) || get_upgrade_count(global.shops.dlc.fishing_pack) > 0;
}

function is_unlocked_fishing_baits()
{
    if (get_default_struct_value(global.game_settings.unlocked, "fishing_baits", false))
    {
        return true;
    }
    return has_bought_shop_item_safe(global.shops.fish.unlock_baits);
}

function is_unlocked_fishing_baits_farm()
{
    if (get_default_struct_value(global.game_settings.unlocked, "fishing_baits_farm", false))
    {
        return true;
    }
    return has_bought_shop_item_safe(global.shops.fish.bait_farm);
}

function is_unlocked_fusion_shards()
{
    if (get_default_struct_value(global.game_settings.unlocked, "fusion_shards", false))
    {
        return true;
    }
    return get_upgrade_count(global.shops.hematite.unlock_fusion_shards) > 0;
}

function is_unlocked_gem_leaves()
{
    if (get_default_struct_value(global.game_settings.unlocked, "gem_leaves", false))
    {
        return true;
    }
    return is_gt(global.resources.mlc.data.collected, 0) && o_game.data.stats.prestige_mlc > 0;
}

function is_unlocked_harbor()
{
    if (get_default_struct_value(global.game_settings.unlocked, "harbor", false))
    {
        return true;
    }
    return global.shops.plasma.unlock_industrial_harbor.data.count > 0;
}

function is_unlocked_harbor_diver()
{
    if (get_default_struct_value(global.game_settings.unlocked, "harbor_diver", false))
    {
        return true;
    }
    return global.shops.harbor.unlock_harbor_diver.data.count > 0;
}

function is_unlocked_harbor_ships()
{
    if (get_default_struct_value(global.game_settings.unlocked, "harbor_ships", false))
    {
        return true;
    }
    return global.shops.harbor.unlock_harbor_ships.data.count > 0;
}

function is_unlocked_leafscension()
{
    if (get_default_struct_value(global.game_settings.unlocked, "leafscension", false))
    {
        return true;
    }
    return get_upgrade_count(global.shops.sacred.unlock_relics) > 0;
}

function is_unlocked_materials(arg0 = false)
{
    if (get_default_struct_value(global.game_settings.unlocked, "materials", false))
    {
        return true;
    }
    if (arg0)
    {
        return global.shops.blc.unlock_materials.data.collected > 0;
    }
    return get_upgrade_count(global.shops.blc.unlock_materials) > 0;
}

function is_unlocked_master_relics()
{
    if (get_default_struct_value(global.game_settings.unlocked, "master_relics", false))
    {
        return true;
    }
    return is_unlocked_mirror_fragments();
}

function is_unlocked_mines()
{
    if (get_default_struct_value(global.game_settings.unlocked, "mines", false))
    {
        return true;
    }
    return get_upgrade_count(global.shops.coal.unlock_mines) > 0;
}

function is_unlocked_mines_drill()
{
    if (get_default_struct_value(global.game_settings.unlocked, "mines_drill", false))
    {
        return true;
    }
    return has_bought_shop_item_safe(global.shops.mines.mines_drill_mines);
}

function is_unlocked_mirror()
{
    if (get_default_struct_value(global.game_settings.unlocked, "is_unlocked_mirror", false))
    {
        return true;
    }
    return global.artifacts.mirror.data.collected > 0;
}

function is_not_unlocked_mirror()
{
    return !is_unlocked_mirror();
}

function is_unlocked_mirror_fragments()
{
    if (get_default_struct_value(global.game_settings.unlocked, "is_unlocked_mirror_fragments", false))
    {
        return true;
    }
    return has_bought_shop_item_safe(global.shops.energy_electrical.mirror_drop_relic_fragments);
}

function is_unlocked_mlc()
{
    if (get_default_struct_value(global.game_settings.unlocked, "mlc", false))
    {
        return true;
    }
    return global.areas.tower.data.highest_floor > 100;
}

function is_unlocked_nav(arg0)
{
    return get_default_struct_value(struct_get_from_hash(global.game_settings.unlocked, variable_get_hash("nav")), arg0, false);
}

function is_unlocked_pets()
{
    if (get_default_struct_value(global.game_settings.unlocked, "pets", false))
    {
        return true;
    }
    return get_upgrade_count(global.shops.blc.unlock_pets) > 0;
}

function is_unlocked_printers(arg0 = false)
{
    if (get_default_struct_value(global.game_settings.unlocked, "printers", false))
    {
        return true;
    }
    if (arg0)
    {
        return global.shops.coins.unlock_printers.data.collected > 0;
    }
    return get_upgrade_count(global.shops.coins.unlock_printers) > 0;
}

function is_unlocked_leafton()
{
    if (get_default_struct_value(global.game_settings.unlocked, "leafton", false))
    {
        return true;
    }
    return has_bought_shop_item_safe(global.shops.quark_structure.unlock_leafton);
}

function is_unlocked_plasma()
{
    if (get_default_struct_value(global.game_settings.unlocked, "plasma", false))
    {
        return true;
    }
    return global.areas.energy_shrine.data.count > 0 && global.areas.plasma_forest.check() && global.areas.spark_portal.check();
}

function is_unlocked_pyramid()
{
    if (get_default_struct_value(global.game_settings.unlocked, "pyramid", false))
    {
        return true;
    }
    return get_upgrade_count(global.areas.inner_pyramid) > 0;
}

function is_unlocked_quarks()
{
    if (get_default_struct_value(global.game_settings.unlocked, "quarks", false))
    {
        return true;
    }
    return global.areas.quark_nexus.check() || global.upgrade_attributes.ulc_perma_quarks > 0;
}

function is_unlocked_quarks_structure()
{
    if (get_default_struct_value(global.game_settings.unlocked, "quarks_structure", false))
    {
        return true;
    }
    return has_bought_shop_item_safe(global.shops.quark.unlock_quarks_structure);
}

function is_unlocked_relics()
{
    if (get_default_struct_value(global.game_settings.unlocked, "relics", false))
    {
        return true;
    }
    return get_upgrade_count(global.shops.sacred.unlock_relics) > 0;
}

function is_unlocked_resource(arg0)
{
    if (!is_struct(arg0))
    {
        return false;
    }
    if (is_struct(struct_get_from_hash(global.game_settings, variable_get_hash("unlocked"))) && get_default_struct_value(struct_get_from_hash(global.game_settings.unlocked, variable_get_hash("resources")), arg0.key, false))
    {
        return true;
    }
    if (is_string(arg0))
    {
        return variable_struct_get(global.resources, arg0).data.unlocked;
    }
    return arg0.data.unlocked;
}

function is_unlocked_sacred(arg0 = false)
{
    if (get_default_struct_value(global.game_settings.unlocked, "sacred", false))
    {
        return true;
    }
    return global.areas.exalted_bridge.data.count > 0;
}

function is_unlocked_scrolls(arg0 = false)
{
    if (get_default_struct_value(global.game_settings.unlocked, "scrolls", false))
    {
        return true;
    }
    if (arg0)
    {
        return global.shops.blc.unlock_scrolls.data.collected > 0;
    }
    return get_upgrade_count(global.shops.blc.unlock_scrolls) > 0;
}

function is_unlocked_seeds(arg0 = false)
{
    if (get_default_struct_value(global.game_settings.unlocked, "seeds", false))
    {
        return true;
    }
    if (arg0)
    {
        return global.shops.exotic.unlock_farming.data.collected > 0;
    }
    return get_upgrade_count(global.shops.exotic.unlock_farming) > 0;
}

function is_unlocked_shards()
{
    if (get_default_struct_value(global.game_settings.unlocked, "shards", false))
    {
        return true;
    }
    return get_upgrade_count(global.shops.ancient.unlock_shards) > 0;
}

function is_unlocked_shadow_crystal()
{
    if (get_default_struct_value(global.game_settings.unlocked, "shadow_crystal", false))
    {
        return true;
    }
    return global.areas.shadow_crystal.check();
}

function is_unlocked_soul_crypt()
{
    return call_method(global.areas.soul_crypt, global.areas.soul_crypt.check);
}

function is_unlocked_soul_forge()
{
    return global.areas.soul_forge.check();
}

function is_unlocked_soul_realm()
{
    if (get_default_struct_value(global.game_settings.unlocked, "soul_realm", false))
    {
        return true;
    }
    return area_bought(global.areas.soul_temple) && global.areas.soul_portal.check();
}

function is_unlocked_tools()
{
    if (get_default_struct_value(global.game_settings.unlocked, "tools", false))
    {
        return true;
    }
    return is_gt(global.resources.leaves.data.collected_total, 30);
}

function is_unlocked_tower()
{
    if (get_default_struct_value(global.game_settings.unlocked, "tower", false))
    {
        return true;
    }
    return area_bought(global.areas.tower);
}

function is_unlocked_trading(arg0 = false)
{
    if (get_default_struct_value(global.game_settings.unlocked, "trading", false))
    {
        return true;
    }
    if (arg0)
    {
        return global.shops.blc.unlock_trading.data.collected > 0;
    }
    return get_upgrade_count(global.shops.blc.unlock_trading) > 0;
}

function is_unlocked_transformation_shards()
{
    if (get_default_struct_value(global.game_settings.unlocked, "transformation_shards", false))
    {
        return true;
    }
    return get_upgrade_count(global.shops.hematite.unlock_transformation_shards) > 0;
}

function is_unlocked_ulc()
{
    if (get_default_struct_value(global.game_settings.unlocked, "ulc", false))
    {
        return true;
    }
    return o_game.data.stats.prestige_ulc > 0;
}

function is_unlocked_unique_leaves()
{
    if (get_default_struct_value(global.game_settings.unlocked, "unique_leaves", false))
    {
        return true;
    }
    return get_upgrade_count(global.shops.blc.unlock_unique_leaves) > 0;
}

function can_show_prestige_shop()
{
    return get_upgrade_count(global.shops.gold.unlock_prestige) > 0 || o_game.data.stats.prestige > 0;
}

function can_show_prestige()
{
    return get_upgrade_count(global.shops.gold.unlock_prestige) > 0;
}

function can_show_blc_shop()
{
    return is_unlocked_blc() || o_game.data.stats.prestige_crunch > 0;
}

function can_show_blc()
{
    return is_unlocked_blc();
}

function can_show_mlc_shop()
{
    return is_unlocked_mlc() || o_game.data.stats.prestige_mlc > 0;
}

function can_show_mlc()
{
    return is_unlocked_mlc() && global.areas.tower.check();
}

function can_show_ulc()
{
    return global.enemies.boss_weaver_of_worlds.get_current_defeat_counter() > 0 && global.areas.primordial_ethos.check();
}

function can_show_ulc_shop()
{
    return can_show_ulc() || o_game.data.stats.prestige_ulc > 0;
}

function can_ulc()
{
    if (!global.areas.primordial_ethos.check() || global.enemies.boss_weaver_of_worlds.get_current_defeat_counter() < get_min_ulc_wow_defeat_count())
    {
        return false;
    }
    var min_sacrifices = get_min_ulc_sacrifices();
    var sacrifices_count = 0;
    var __array = global.ulc_options;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (get_default_struct_value(o_game.data.ulc_settings, mitem.key, false))
        {
            sacrifices_count++;
        }
    }
    return sacrifices_count >= min_sacrifices;
}
