var seconds_text = format_time(offline_seconds);
var text = __s("Offline rewards for %s", seconds_text);
if (instance_exists(o_dialog_reward))
{
    o_dialog_reward.reward = offline_rewards;
    o_dialog_reward.text = text;
    with (o_dialog_reward)
    {
        init_after();
    }
}
else
{
    if (init)
    {
        instance_destroy();
        exit;
    }
    reward_dialog(text, offline_rewards, true, 
    {
        title: __("Offline rewards")
    }, 
    {
        back_button: "stats"
    });
    init = true;
}
alarm[1] = sec(1);
