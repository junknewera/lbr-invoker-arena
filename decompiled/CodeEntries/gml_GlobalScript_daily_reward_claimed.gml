function daily_reward_claimed()
{
    if (global.cloud_data.is_season)
    {
        return !global.cloud_data.daily_reward_available;
    }
    var arr_len = array_length(o_game.data.daily_rewards_claimed);
    if (arr_len == 0)
    {
        return false;
    }
    return _any(o_game.data.daily_rewards_claimed, function(arg0)
    {
        if (is_struct(arg0) && !is_undefined(struct_get_from_hash(arg0, variable_get_hash("date"))))
        {
            return date_is_today(get_date_from_object(arg0.date)) && arg0.os == 0;
        }
        else
        {
            return date_is_today(get_date_from_object(arg0));
        }
    }, false);
}

function can_claim_any_daily_quest()
{
    return _any(global.quests.daily, function(arg0)
    {
        return arg0._can_finish();
    });
}
