if (is_undefined(offline_seconds_start))
{
    offline_seconds_start = offline_seconds;
}
afk_counter++;
offline_rewards = get_offline_rewards(offline_seconds, true, false, false);
alarm[0] = sec(1);
