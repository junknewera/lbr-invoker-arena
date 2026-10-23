event_inherited();
ball = undefined;
state = UnknownEnum.Value_0;
win_flag = false;
width = gui_col_x(23);
height = gui_col_y(16);
if (global.is_mobile)
{
    y = 278;
}
xmin = x;
xmax = x + width;
ymin = y;
ymax = y + height;
instance_list = [o_minigame_curse_ball, o_minigame_curse_goal, o_minigame_curse_key_green, o_minigame_curse_obstacle, o_minigame_curse_wall, o_minigame_curse_wall_default, o_minigame_curse_wall_key_green];
current_level = "test";
current_stats = undefined;
level_timer = 0;
level_timer_real = 0;
level_timer_real_start = 0;
is_random_level = false;
le_selection = o_minigame_curse_ball;
show_borders = false;

trigger = function()
{
    if (is_state(UnknownEnum.Value_0))
    {
        win_flag = false;
        current_stats = variable_struct_get(o_game.data.stats.curse_game, global.tavern_games_curse_level);
        current_stats.hit = 0;
        destroy_minigame_instances();
        if (is_random_level)
        {
            instance_create_layer(x + 40, (y + height) - 40, global.layers.gui_items_2, o_minigame_curse_ball);
            instance_create_layer((x + width) - 40, y + 40 + irandom_range(0, height - 80), global.layers.gui_items_1, o_minigame_curse_goal);
            var obstacles_min = 8;
            var obstacles_max = 16;
            var obstacles = irandom_range(obstacles_min, obstacles_max);
            repeat (obstacles)
            {
                var ox = irandom_range(x + 40, (x + width) - 40);
                var oy = irandom_range(y + 40, (y + height) - 40);
                instance_create_layer(ox, oy, global.layers.gui_items_1, o_minigame_curse_obstacle);
            }
        }
        else
        {
            load_curse_game_level(global.tavern_games_curse_level);
        }
        create_walls();
        state = UnknownEnum.Value_1;
    }
    else if (is_state(UnknownEnum.Value_1))
    {
        start();
    }
    else if (is_state(UnknownEnum.Value_2))
    {
        state = UnknownEnum.Value_4;
    }
    else if (is_state(UnknownEnum.Value_4))
    {
        global.tavern_games_playing.curse = false;
        state = UnknownEnum.Value_0;
    }
};

start = function()
{
    is_random_level = false;
    current_stats.played++;
    level_timer = 0;
    level_timer_real = 0;
    level_timer_real_start = get_timer();
    replay_data = [];
    state = UnknownEnum.Value_2;
    global.tavern_games_playing.curse = true;
    instance_destroy(o_minigame_curse_result);
};

end_curse_game = function()
{
    global.tavern_games_playing.curse = false;
    with (o_minigame_curse_ball)
    {
        speed = 0;
    }
    instance_destroy(o_minigame_curse_result);
    var o = instance_create_layer(x, y, global.layers.gui_items_3, o_minigame_curse_result);
    o.width = width;
    o.height = height;
    o.win_flag = win_flag;
    trigger();
};

lose = function()
{
    win_flag = false;
    current_stats.win_streak = 0;
    end_curse_game();
};

win = function()
{
    win_flag = true;
    level_timer_real = get_timer() - level_timer_real_start;
    if (current_stats.time_min == -1 || level_timer <= current_stats.time_min)
    {
        if (array_length(replay_data) > 50)
        {
            array_delete(replay_data, 0, array_length(replay_data) - 50);
        }
        current_stats.replay_data_time = replay_data;
    }
    current_stats.hit_min = (current_stats.hit_min == -1) ? current_stats.hit : min(current_stats.hit_min, current_stats.hit);
    current_stats.hit_max = max(current_stats.hit_max, current_stats.hit);
    current_stats.time_min = (current_stats.time_min == -1) ? level_timer : min(current_stats.time_min, level_timer);
    current_stats.time_real_min = (current_stats.time_real_min == -1) ? level_timer_real : min(current_stats.time_real_min, level_timer_real);
    current_stats.win_streak++;
    current_stats.win_streak_max = max(current_stats.win_streak, current_stats.win_streak_max);
    current_stats.won++;
    end_curse_game();
};

destroy_minigame_instances = function()
{
    var __array = instance_list;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        instance_destroy(mitem);
    }
};

create_walls = function()
{
    for (var i = 0; i < ceil(width / 16); i++)
    {
        var ox = xmin + (i * 16);
        var oyt = y;
        var oyb = ymax;
        instance_create_layer(ox, oyt, global.layers.gui_items_1, o_minigame_curse_wall_default);
        instance_create_layer(ox, oyb, global.layers.gui_items_1, o_minigame_curse_wall_default);
    }
    for (var i = 0; i < ceil(height / 16); i++)
    {
        var oxl = x;
        var oxr = xmax;
        var oy = y + (i * 16);
        instance_create_layer(oxl, oy, global.layers.gui_items_1, o_minigame_curse_wall_default);
        instance_create_layer(oxr, oy, global.layers.gui_items_1, o_minigame_curse_wall_default);
    }
};

trigger();

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_4 = 4
}
