function can_auto_crunch(arg0 = false)
{
    if (!global.game_settings.autocrunch_enabled)
    {
        return false;
    }
    if (o_game.autocrunching)
    {
        return false;
    }
    if (get_upgrade_count(global.shops.blc.autocrunch_bot) == 0)
    {
        return false;
    }
    if (arg0)
    {
        return true;
    }
    if (!global.shops.blc.autocrunch_bot.data.toggle)
    {
        return false;
    }
    if (get_upgrade_count(global.shops.flask_black.unlock_big_crunch) == 0)
    {
        return false;
    }
    var prestige_rewards = get_prestige_resources(true, global.prestige_levels.blc.level);
    if (prestige_rewards.blc < global.shops.blc.autocrunch_setting.data.slider_value)
    {
        return false;
    }
    if (!o_game.area.type.auto_crunch_enabled)
    {
        return false;
    }
    return true;
}

function check_auto_crunch()
{
    if (!can_auto_crunch())
    {
        exit;
    }
    autocrunch_timer++;
    if (autocrunch_timer < autocrunch_timer_duration)
    {
        return false;
    }
    add_game_log(sprintf("Autocrunch: %s", autocrunch_timer), "autocrunch");
    autocrunching = true;
    autocrunch_timer = 0;
    prestige_exec(global.prestige_levels.blc.level);
}
