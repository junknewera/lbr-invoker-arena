function tidy_daily_reward()
{
    var game_log_max_size = 32;
    var game_log_length = array_length(o_game.data.daily_rewards_claimed);
    if (game_log_length < game_log_max_size)
    {
        exit;
    }
    array_delete(o_game.data.daily_rewards_claimed, 0, game_log_length - game_log_max_size);
}
