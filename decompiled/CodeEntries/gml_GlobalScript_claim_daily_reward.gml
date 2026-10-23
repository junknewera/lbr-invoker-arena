function claim_daily_reward()
{
    init_game_vars(true);
    if (global.cloud_data.is_season)
    {
        text_dialog(__("Claiming daily rewards..."));
        post_to_cloud("save", "claim_daily_reward", undefined, function(arg0)
        {
            logf("add daily reward response", arg0);
            add_daily_reward();
        }, function(arg0)
        {
            text_dialog(__s("Unable to claim daily reward."));
        });
    }
    else
    {
        add_daily_reward();
    }
}
