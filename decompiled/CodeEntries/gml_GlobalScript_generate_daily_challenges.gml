function generate_daily_challenges()
{
    var daily_challenges_count = 3;
    for (var i = 0; i < daily_challenges_count; i++)
    {
        array_push(global.daily_challenges, new Daily_Challenge());
    }
}
