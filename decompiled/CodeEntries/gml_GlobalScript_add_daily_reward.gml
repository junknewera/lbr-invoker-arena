function add_daily_reward()
{
    global.resources.gems.data.unlocked = true;
    var res = get_daily_reward_resources();
    var daily_reward_struct = 
    {
        date: get_time_object(),
        os: 0,
        te: o_game.data.stats.time_elapsed
    };
    array_push(o_game.data.daily_rewards_claimed, daily_reward_struct);
    tidy_daily_reward();
    add_game_log("Daily reward claimed", "dailyreward");
    add_result(res, "", 
    {
        title: __("Daily Reward")
    });
}
