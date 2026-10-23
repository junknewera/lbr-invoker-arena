function gui_item_npc_borbjones(arg0, arg1)
{
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
    arg1 += draw_description(arg0, arg1, __s("Fortune and glory, kid. Fortune and glory. You may now fuse %s!", global.resources.coal.name_plural));
    arg1 += draw_description(arg0, arg1, __s("Having trouble defeating the bosses? We can reset their level with magic.", global.enemies.boss_green_flame.name));
    arg1 += gui_col_y(2);
    var reset_gf_text = __s("Reset %s (%s)", global.enemies.boss_green_flame.name, global.enemies.boss_green_flame.get_defeat_counter());
    if (gui_button_tl(arg0, arg1, reset_gf_text, global.enemies.boss_green_flame.can_reset_defeat_counter(), gui_col_x(7), undefined, 
    {
        result_mini: global.enemies.boss_green_flame.reset_cost
    }))
    {
        global.enemies.boss_green_flame.reset_defeat_counter();
    }
    var reset_spec_text = __s("Reset %s (%s)", global.enemies.boss_spectralseeker.name, global.enemies.boss_spectralseeker.get_defeat_counter());
    if (gui_button_tl(arg0 + gui_col_x(11), arg1, reset_spec_text, global.enemies.boss_spectralseeker.can_reset_defeat_counter(), gui_col_x(7), undefined, 
    {
        result_mini: global.enemies.boss_spectralseeker.reset_cost
    }))
    {
        global.enemies.boss_spectralseeker.reset_defeat_counter();
    }
    arg1 += gui_col_y(4);
    var bx = arg0 + gui_col_x(0.4);
    var enabled_gf = has_milestone(global.milestones.fire_fields.milestones.gf10);
    var enabled_spec = has_milestone(global.milestones.fire_fields.milestones.spec10);
    if (gui_button_toggle(bx, arg1, global.enemies.boss_green_flame.data.auto_reset_defeat_counter, enabled_gf, 
    {
        text: __s("Auto reset %s", global.enemies.boss_green_flame.name)
    }))
    {
        global.enemies.boss_green_flame.data.auto_reset_defeat_counter = !global.enemies.boss_green_flame.data.auto_reset_defeat_counter;
    }
    draw_number_slider(bx, arg1 + gui_col_y(3), global.enemies.boss_green_flame.data.auto_reset_defeat_counter_count, 1, undefined, undefined, enabled_gf, __("Defeat count reset"), function(arg0, arg1)
    {
        global.enemies.boss_green_flame.data.auto_reset_defeat_counter_count = arg0;
    });
    if (gui_button_toggle(bx + gui_col_x(11), arg1, global.enemies.boss_spectralseeker.data.auto_reset_defeat_counter, enabled_spec, 
    {
        text: __s("Auto reset %s", global.enemies.boss_spectralseeker.name)
    }))
    {
        global.enemies.boss_spectralseeker.data.auto_reset_defeat_counter = !global.enemies.boss_spectralseeker.data.auto_reset_defeat_counter;
    }
    draw_number_slider(bx + gui_col_x(11), arg1 + gui_col_y(3), global.enemies.boss_spectralseeker.data.auto_reset_defeat_counter_count, 1, undefined, undefined, enabled_spec, __("Defeat count reset"), function(arg0, arg1)
    {
        global.enemies.boss_spectralseeker.data.auto_reset_defeat_counter_count = arg0;
    });
}
