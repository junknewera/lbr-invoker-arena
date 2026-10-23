function set_steam_max_value(arg0)
{
    return min(2147483647, arg0);
}

function set_steam_stats()
{
    if (global.is_pc)
    {
        steam_set_stat_int("game_started", set_steam_max_value(o_game.data.stats.game_started));
        steam_set_stat_int("time_elapsed", set_steam_max_value(o_game.data.stats.time_elapsed));
        steam_set_stat_int("wpn_leaf_blower", set_steam_max_value(global.shops.weapons.leaf_blower.data.count));
        var leaves_blown_total = _sum(global.resources, function(arg0, arg1)
        {
            return arg0.data.collected_total;
        });
        steam_set_stat_int("leaves_blown_total", set_steam_max_value(leaves_blown_total));
        steam_set_stat_int("leaf_gold", set_steam_max_value(global.resources.gold.data.collected_total));
        steam_set_stat_int("leaf_platinum", set_steam_max_value(global.resources.platinum.data.collected_total));
        steam_set_stat_int("leaf_bismuth", set_steam_max_value(global.resources.bismuth.data.collected_total));
        steam_set_stat_int("leaf_cosmic", set_steam_max_value(global.resources.cosmic.data.collected_total));
        steam_set_stat_int("leaf_void", set_steam_max_value(global.resources.void.data.collected_total));
        steam_set_stat_int("leaf_exotic", set_steam_max_value(global.resources.exotic.data.collected_total));
        steam_set_stat_int("leaf_celestial", set_steam_max_value(global.resources.celestial.data.collected_total));
        steam_set_stat_int("flask_red", set_steam_max_value(global.resources.flask_red.data.collected_total));
        steam_set_stat_int("flask_green", set_steam_max_value(global.resources.flask_green.data.collected_total));
        steam_set_stat_int("flask_blue", set_steam_max_value(global.resources.flask_blue.data.collected_total));
        steam_set_stat_int("flask_magenta", set_steam_max_value(global.resources.flask_magenta.data.collected_total));
        steam_set_stat_int("flask_orange", set_steam_max_value(global.resources.flask_orange.data.collected_total));
        steam_set_stat_int("flask_black", set_steam_max_value(global.resources.flask_black.data.collected_total));
        steam_set_stat_int("flask_strange", set_steam_max_value(global.resources.flask_strange.data.collected_total));
        steam_set_stat_int("fruits_collected", set_steam_max_value(global.resources.fruits.data.collected_total));
        steam_set_stat_int("gems", set_steam_max_value(global.resources.gems.data.collected_total));
        steam_set_stat_int("prestige", set_steam_max_value(o_game.data.stats.prestige));
        steam_set_stat_int("prestige_crunch", set_steam_max_value(o_game.data.stats.prestige_crunch));
        _map(global.unique_leaves, function(arg0)
        {
            var stat_name = sprintf("uleaf_%s", arg0.key);
            steam_set_stat_int(stat_name, set_steam_max_value(arg0.data.count));
        });
    }
    else if (global.is_android)
    {
        if (global.resources.gold.data.collected_total > 0)
        {
            extension_stubfunc_real("CgkIxO-InscJEAIQAg");
        }
        if (global.resources.platinum.data.collected_total > 0)
        {
            extension_stubfunc_real("CgkIxO-InscJEAIQAw");
        }
        if (global.resources.bismuth.data.collected_total > 0)
        {
            extension_stubfunc_real("CgkIxO-InscJEAIQBA");
        }
        if (global.resources.cosmic.data.collected_total > 0)
        {
            extension_stubfunc_real("CgkIxO-InscJEAIQBQ");
        }
        if (global.resources.void.data.collected_total > 0)
        {
            extension_stubfunc_real("CgkIxO-InscJEAIQBg");
        }
        if (global.resources.exotic.data.collected_total > 0)
        {
            extension_stubfunc_real("CgkIxO-InscJEAIQBw");
        }
        if (global.resources.celestial.data.collected_total > 0)
        {
            extension_stubfunc_real("CgkIxO-InscJEAIQCA");
        }
        if (global.resources.mythical.data.collected_total > 0)
        {
            extension_stubfunc_real("CgkIxO-InscJEAIQCQ");
        }
        if (global.resources.lava.data.collected_total > 0)
        {
            extension_stubfunc_real("CgkIxO-InscJEAIQCg");
        }
        if (global.resources.ice.data.collected_total > 0)
        {
            extension_stubfunc_real("CgkIxO-InscJEAIQCw");
        }
        if (global.resources.obsidian.data.collected_total > 0)
        {
            extension_stubfunc_real("CgkIxO-InscJEAIQDA");
        }
        if (global.resources.silicon.data.collected_total > 0)
        {
            extension_stubfunc_real("CgkIxO-InscJEAIQDQ");
        }
        if (global.resources.benitoite.data.collected_total > 0)
        {
            extension_stubfunc_real("CgkIxO-InscJEAIQDg");
        }
        if (global.resources.moonstone.data.collected_total > 0)
        {
            extension_stubfunc_real("CgkIxO-InscJEAIQDw");
        }
        if (global.resources.sand.data.collected_total > 0)
        {
            extension_stubfunc_real("CgkIxO-InscJEAIQEA");
        }
        if (global.resources.ancient.data.collected_total > 0)
        {
            extension_stubfunc_real("CgkIxO-InscJEAIQEQ");
        }
        if (global.resources.sacred.data.collected_total > 0)
        {
            extension_stubfunc_real("CgkIxO-InscJEAIQEg");
        }
    }
}
