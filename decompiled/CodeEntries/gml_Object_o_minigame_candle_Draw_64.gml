if (live_auto_call_1())
{
    var lac_argc = argument_count;
    var lac_args = array_create(lac_argc);
    var lac_argk = 0;
    repeat (lac_argc)
    {
        lac_args[lac_argk] = argument[lac_argk];
        lac_argk++;
    }
    if (live_auto_call_2(lac_args))
    {
        return global.live_result;
    }
}
if (!visible)
{
    exit;
}
var _x = x;
var _y = y;
var y_start = _y;

draw_left_sidebar = function(arg0, arg1)
{
    var left_x = arg0;
    var left_y = arg1;
    left_y += draw_heading(left_x, left_y, __("Stats"), undefined, undefined, undefined, undefined, false);
    var stage_candles_blown = 0;
    var __array = o_game.data.candle.candles;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (mitem.blown)
        {
            stage_candles_blown++;
        }
    }
    left_y += draw_description(left_x, left_y, concatstr_nl(__s("Damage: %s", number_format(candle_game_get_damage())), __s("Blow Damage: %s", number_format(candle_game_get_damage_blow())), __s("Attack speed: %s", format_time(secr(candle_game_get_auto_attack_interval()), true, true)), __s("Crit chance: %s", number_format_percent(candle_game_get_critical_chance())), __s("Stage time: %s", format_time(secr(candle_game_get_stage_time_limit()), true, true)), "", __s("Candles blown: %s", number_format(stage_candles_blown)), __s("Candles blown (run): %s", number_format(o_game.data.candle.candles_blown)), __s("Candles blown (total): %s", number_format(o_game.data.candle.candles_blown_total)), __s("Highest stage: %s", o_game.data.candle.highest_stage)), gui_col_x(7));
    left_y += global.ui_gaps.md;
    left_y += draw_heading(left_x, left_y, __("Current reward"), undefined, undefined, undefined, undefined, false);
    left_y += draw_result(left_x, left_y, o_game.data.candle.reward_full);
    left_y += global.ui_gaps.md;
    left_y += draw_heading(left_x, left_y, __("Upgrades"), undefined, undefined, undefined, undefined, false);
    left_y += draw_description(left_x, left_y, upgrades_text, gui_col_x(7));
};

draw_candles_grid = function(arg0, arg1)
{
    var right_x = arg0;
    var right_y = arg1;
    var candle_count = array_length(o_game.data.candle.candles);
    var available_width = gui_col_x(15);
    var candle_spacing = gui_col_x(2.5);
    var max_candles_per_row = max(1, floor(available_width / candle_spacing));
    var candles_per_row = max_candles_per_row;
    while (candles_per_row > 1 && (candles_per_row * candle_spacing) > available_width)
    {
        candles_per_row--;
    }
    var __array = o_game.data.candle.candles;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        var row = __i div candles_per_row;
        var col = __i % candles_per_row;
        var cx = right_x + gui_col_x(0.5) + (col * candle_spacing);
        var cy = right_y + (row * gui_col_y(4));
        var candle = mitem;
        var shake_x = 0;
        var shake_y = 0;
        if (candle.hp > 0 && candle.shake_intensity > 0)
        {
            shake_x = (random(1) - 0.5) * candle.shake_intensity * 8;
            shake_y = (random(1) - 0.5) * candle.shake_intensity * 8;
        }
        cx += shake_x;
        cy += shake_y;
        var flash_alpha = 0;
        if (candle.damage_flash > 0)
        {
            flash_alpha = (candle.damage_flash / sec(0.2)) * 0.6;
        }
        gui_draw_sprite(cx, cy, spr_icon_candle2, undefined, 4);
        gui_draw_sprite(cx, cy, spr_icon_candle2, 255, 4, flash_alpha);
        var bar_width = 30;
        var bar_height = 6;
        draw_healthbar(cx - (bar_width / 2), cy - 40, cx + (bar_width / 2), (cy - 40) + bar_height, (candle.hp / candle.max_hp) * 100, #323232, #FF6400, #00C800, 0, true, true);
    }
};

draw_auto_advance_timer = function(arg0, arg1, arg2)
{
    var auto_advance_enabled = has_bought_shop_item_safe(global.shops.event_anniversary.candle_auto_advance) && get_option(global.options.auto_advance_candle_minigame);
    if (!auto_advance_enabled)
    {
        return 0;
    }
    var y_start = arg1;
    var advance_progress = (o_game.data.candle.auto_advance_timer / auto_advance_timer_max) * 100;
    draw_healthbar(arg0, arg1, arg0 + gui_col_x(4), arg1 + 20, advance_progress, global.colors.gray, global.colors.cyan, global.colors.cyan, 0, true, false);
    arg1 += gui_col_y(0.75);
    arg1 += draw_description(arg0, arg1, sprintf(arg2, format_time_left(o_game.data.candle.auto_advance_timer, auto_advance_timer_max, undefined, true)));
    arg1 += global.ui_gaps.md;
    return arg1 - y_start;
};

if (o_game.data.candle.dead && o_game.data.candle.state == UnknownEnum.Value_2)
{
    draw_left_sidebar(_x, _y);
    var end_x = _x + gui_col_x(8);
    var end_y = _y;
    end_y += draw_heading(end_x, end_y, __s("Time's Up!"), undefined, undefined, undefined, undefined, false);
    var reduce_reward_multiplier_base = 0.1;
    var reduce_reward_multiplier = reduce_reward_multiplier_base + global.upgrade_attributes.candle_reduce_reward_multiplier;
    reduce_reward_multiplier = clamp(reduce_reward_multiplier, 0, 1);
    end_y += draw_description(end_x, end_y, __s("Your reward was reduced by %s.", number_format_percent(1 - reduce_reward_multiplier)) + "\n" + __s("Stages cleared: %s", o_game.data.candle.current_level - 1));
    end_y += global.ui_gaps.xs;
    end_y += draw_heading(end_x, end_y, __("Rewards"), undefined, undefined, undefined, undefined, false);
    end_y += draw_result(end_x, end_y, o_game.data.candle.reward);
    end_y += global.ui_gaps.xs;
    end_y += draw_auto_advance_timer(end_x, end_y, __("Auto restart in: %s"));
    if (gui_button_tl(end_x, end_y, __("Claim Rewards"), undefined, gui_col_x(4)))
    {
        candle_game_claim_rewards();
        o_game.data.candle.state = UnknownEnum.Value_0;
    }
}
else if (o_game.data.candle.state == UnknownEnum.Value_0 || o_game.data.candle.state == UnknownEnum.Value_3)
{
    draw_heading(_x + (global.gui_settings.content_width / 2), _y, __("Candle Game"), undefined, undefined, 1);
    draw_sprite_ext(spr_icon_candle2, 0, _x + (global.gui_settings.content_width / 2), _y + gui_col_y(5), 12, 12, 0, c_white, 1);
    var can_play = o_game.data.candle.state == UnknownEnum.Value_3 || o_game.data.candle.state == UnknownEnum.Value_0;
    var has_unclaimed_reward = is_struct(o_game.data.candle.reward) && is_struct(struct_get_from_hash(o_game.data.candle.reward, variable_get_hash("resources"))) && get_default_struct_value(o_game.data.candle.reward.resources, "party_tokens", 0) > 0;
    if (o_game.data.candle.playing)
    {
        if (gui_button((_x + (global.gui_settings.content_width / 2)) - gui_col_x(3), _y + gui_col_y(9.5), __("Claim & Restart"), can_play, gui_col_x(5)))
        {
            add_result_lite(o_game.data.candle.reward);
            o_game.data.candle.reward = undefined;
            o_game.data.candle.reward_full = undefined;
            candle_game_start_game();
        }
        if (gui_button(_x + (global.gui_settings.content_width / 2) + gui_col_x(3), _y + gui_col_y(9.5), __("Continue"), can_play, gui_col_x(5), undefined, 
        {
            text_below: __s("Stage %s", o_game.data.candle.current_level)
        }))
        {
            candle_game_start_game(o_game.data.candle.current_level);
        }
    }
    else
    {
        var button_text = has_unclaimed_reward ? __("Claim & Start") : __("Start");
        if (gui_button(_x + (global.gui_settings.content_width / 2), _y + gui_col_y(9.5), button_text, can_play, gui_col_x(5)))
        {
            add_result_lite(o_game.data.candle.reward);
            o_game.data.candle.reward = undefined;
            o_game.data.candle.reward_full = undefined;
            candle_game_start_game();
        }
    }
    _y += global.ui_gaps.button_y_lg;
    if (gui_button((_x + (global.gui_settings.content_width / 2)) - gui_col_x(3), _y + gui_col_y(10), __("Shop"), true, gui_col_x(5)))
    {
        open_nav("event_shop", global.dialog_sections.event.anniversary);
    }
    if (gui_button(_x + (global.gui_settings.content_width / 2) + gui_col_x(3), _y + gui_col_y(10), __("Journey"), true, gui_col_x(5)))
    {
        open_nav("event_shop", global.dialog_sections.event.anniversary_journey);
    }
    if (has_unclaimed_reward)
    {
        var reward_y = y_start + gui_col_y(3);
        reward_y += draw_heading(_x + gui_col_x(0.5), reward_y, __("Unclaimed Reward"));
        reward_y += draw_result(_x + gui_col_x(0.5), reward_y, o_game.data.candle.reward);
    }
    _y += gui_col_y(12);
    _y += draw_description(_x, _y, __s("Start a new game of Candle Game! Blow out as many candles as you can before time runs out to earn %s.", global.resources.party_tokens.name_plural));
    _y += draw_description(_x, _y, __("Use BLOW to deal extra damage to a candle!"));
}
else if (o_game.data.candle.state == UnknownEnum.Value_1)
{
    draw_left_sidebar(_x, _y);
    var right_x = _x + gui_col_x(8);
    var right_y = _y;
    var stage_text = __s("Stage: %s", o_game.data.candle.current_level) + " | " + format_time_left(o_game.data.candle.stage_timer, candle_game_get_stage_time_limit(), true, true, "-");
    right_y += draw_heading(right_x, right_y, stage_text);
    var can_blow = o_game.data.candle.manual_blow_cooldown <= o_game.data.stats.time_elapsed && o_game.data.candle.state == UnknownEnum.Value_1;
    var text_below_attack = can_blow ? __("Ready") : format_remaining_time(o_game.data.candle.manual_blow_cooldown, true, true);
    if (gui_button_tl(right_x, right_y, __("BLOW"), can_blow, gui_col_x(4), undefined, 
    {
        text_below: text_below_attack
    }))
    {
        candle_game_manual_attack();
    }
    var has_auto_manual_attack = has_bought_shop_item_safe(global.shops.event_anniversary.candle_auto_manual_attack);
    if (has_auto_manual_attack)
    {
        var auto_manual_attack_enabled = get_option(global.options.auto_blow_candle_minigame);
        if (gui_button_toggle(right_x + gui_col_x(4.75), right_y + gui_col_y(0.5), auto_manual_attack_enabled))
        {
            global.options.auto_blow_candle_minigame.data.value = !global.options.auto_blow_candle_minigame.data.value;
        }
    }
    right_y += (global.ui_gaps.xl * 1.7);
    draw_candles_grid(right_x, right_y);
}
else if (o_game.data.candle.state == UnknownEnum.Value_2)
{
    draw_left_sidebar(_x, _y);
    var complete_x = _x + gui_col_x(8);
    var complete_y = _y;
    complete_y += draw_heading(complete_x, complete_y, __s("Stage %s complete!", o_game.data.candle.current_level - 1), undefined, undefined, undefined, undefined, false);
    complete_y += draw_auto_advance_timer(complete_x, complete_y, __("Auto advancing in: %s"));
    if (o_game.data.candle.dead)
    {
        complete_y += draw_description(complete_x, complete_y, __("You ran out of time."));
        complete_y += global.ui_gaps.md;
    }
    if (gui_button_tl(complete_x + gui_col_x(6), complete_y + gui_col_y(1.3), __s("Claim & Finish"), undefined, gui_col_x(4), undefined, 
    {
        result_mini: o_game.data.candle.reward_full
    }))
    {
        o_game.data.candle.playing = false;
        o_game.data.candle.reward = o_game.data.candle.reward_full;
        candle_game_claim_rewards();
        o_game.data.candle.state = UnknownEnum.Value_0;
    }
    complete_y += draw_heading(complete_x, complete_y, __("Stage reward"));
    complete_y += draw_result(complete_x, complete_y, o_game.data.candle.stage_reward);
    complete_y += global.ui_gaps.md;
    if (o_game.data.candle.skill_choice_shown)
    {
        complete_y += draw_heading(complete_x, complete_y, __("Choose a skill and advance a round"));
        complete_y += global.ui_gaps.xs;
        var skill_btn_x = complete_x;
        var skill_btn_y = complete_y;
        var __array = o_game.data.candle.available_skills;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            var skill = mitem;
            var btn_x = skill_btn_x + (__i * gui_col_x(5.5));
            draw_rect(btn_x + 5, skill_btn_y - 20, btn_x + 20, skill_btn_y + 10, false, mitem.rarity.color);
            draw_heading(btn_x + 40, skill_btn_y - 7, mitem.rarity.name, undefined, undefined, 0, 1);
            if (gui_button_tl(btn_x, skill_btn_y + gui_col_y(0.7), skill.name, true, gui_col_x(4.5), undefined, 
            {
                text_below: mitem.text
            }))
            {
                candle_game_apply_skill(skill);
                candle_game_advance_stage();
            }
        }
        complete_y += (global.ui_gaps.xl * 2);
    }
    else
    {
        if (gui_button_tl(complete_x, complete_y, __s("Next stage"), true, gui_col_x(4)))
        {
            candle_game_advance_stage();
        }
        complete_y += global.ui_gaps.xl;
    }
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3
}
