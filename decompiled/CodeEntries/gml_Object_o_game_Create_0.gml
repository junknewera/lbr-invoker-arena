randomize();
init_globals();
if (!global.debug)
{
    instance_create_layer(x, y, global.layers.control, o_iap_helper);
}
combo = 0;
combo_decrease_step = 1;
combo_max = 0;
combo_multiplier = 1;
_fx_value_counter = {};
area = undefined;
artifact_autouse_timer = 0;
autocrunching = false;
autocrunch_timer_base = 300;
autocrunch_timer_duration = autocrunch_timer_base;
autocrunch_timer = 0;
can_elapse_time = true;
converter_timer = 0;
current_leaf_resources = {};
data = undefined;
data_init_done = false;
game_loop_timer = 0;
house_item_selected = -1;
init_game_vars_step = 0;
key_modifier = 1;
offline_reward_counter = 0;
leaf_reward_cache = {};
leaf_reward_avg_cache = {};
leaf_step_current_frame = 0;
leaf_step_max_frames = ceil(global.max_leaves / 10);
leaves_spawn_queue = 0;
nav_page = 0;
nav_items_height = gui_col_y(28);
nav_items_show_count = 28;
refresh_surface = true;
res_draw_items_count = 0;
resource_box_hover = false;
resource_nav_items_remaining = false;
resource_nav_page_index = 0;
resource_nav_page_next = 0;
scroll_y = 0;
scroll_height = global.gui_height;
step_counter = 0;
spawn_count = 0;
spawn_interval = 0;
spawn_interval_duration = 1;
surface = surface_create(global.gui_width, global.gui_height);
surface_leaf = surface_create(960, 540);
surface_trees = surface_create(960, 540);
surface_bbox = 
{
    top: 0,
    left: gui_col_x(28.5),
    right: global.gui_width,
    bottom: global.gui_height
};
scroll_bbox_top = 
{
    top: 0,
    left: surface_bbox.left,
    right: surface_bbox.right,
    bottom: gui_col_y(1)
};
scroll_bbox_bottom = 
{
    top: surface_bbox.bottom - gui_col_y(1),
    left: surface_bbox.left,
    right: surface_bbox.right,
    bottom: surface_bbox.bottom
};
state = UnknownEnum.Value_0;
update_draw_delay = 2;
update_draw_delay_timer = 0;
itmp = 0;
leaves_active = ds_list_create();
leaves_inactive = ds_list_create();
repeat (global.max_leaves)
{
    var o = instance_create_layer(100, 100, global.layers.leaves, o_leaf_resource);
    ds_list_add(leaves_inactive, o);
}
instance_deactivate_object_hook(o_leaf_resource);
delay_instance_loop("leaves_spawn_queue", 10, function()
{
    repeat (leaves_spawn_queue)
    {
        spawn_leaf();
    }
    leaves_spawn_queue = 0;
});
pool_fx_text_active = ds_list_create();
pool_fx_text_inactive = ds_list_create();
repeat (50)
{
    var o = instance_create_layer(0, 0, global.layers.fx, o_fx_text);
    ds_list_add(pool_fx_text_inactive, o);
}
instance_deactivate_object_hook(o_fx_text);
vstick_init(0, 200, global.gui_height / 2, 125, true, -4, -4);
can_draw_vstick = false;
if (global.is_opera)
{
    instance_create_layer(0, 0, global.layers.control, o_opera_helper);
}
get_news();
delay_instance_loop("get_news", sec(3600), function()
{
    get_news();
});

init = function(arg0)
{
    area = global.areas.garden;
    if (is_undefined(data))
    {
        init_game_data();
    }
    data.last_daily_reward = 0;
    if (!arg0)
    {
        init_stats();
    }
    _map(global.resources, function(arg0, arg1, arg2, arg3)
    {
        variable_struct_set(_fx_value_counter, arg1, 0);
        variable_struct_set(o_game.data.stats.prints, arg1, 0);
        variable_struct_set(o_game.data.stats.resources_collected_avg, arg1, 0);
        variable_struct_set(o_game.data.stats.resources_collected_count, arg1, 0);
        if (arg0.persist_prestige || arg0.persist_prestige_level >= arg3)
        {
            exit;
        }
        if (arg3 == global.prestige_levels.blc.level && arg1 == global.resources.coins.key && get_upgrade_count(global.shops.blc.coins_persist_blc) > 0)
        {
            exit;
        }
        if (arg3 == global.prestige_levels.mlc.level && arg1 == global.resources.blc.key && get_upgrade_count(global.shops.mlc.blc_persist_mlc) > 0)
        {
            exit;
        }
        arg0.data.collected = 0;
        arg0.data.count = 0;
        arg0.data.level = 0;
        arg0.data.unlocked = get_cloned_struct_value(arg0.data_start, "unlocked");
        arg0.data.unlocked_fruit = get_cloned_struct_value(arg0.data_start, "unlocked_fruit");
    }, arg0);
    autocrunch_timer = 0;
    combo = 0;
    combo_multiplier = 1;
    is_dialog_open = false;
    leaf_reward_cache = {};
    leaves = 0;
    step_counter = 99999;
    wind_direction = random(359);
    wind_force = 0;
    destroy_unit_instances();
    init_shops(arg0);
    init_achievements(arg0);
    init_trades();
    var area_key = is_undefined(data.current_area_key) ? global.areas.garden.key : data.current_area_key;
    change_area(variable_struct_get(global.areas, area_key));
    refresh_surface = true;
};

init_game_soft = function()
{
    room_width = o_game.area.width;
    room_height = o_game.area.height;
    init_game_vars(true);
    check_achievements();
    destroy_unit_instances();
    instance_create_layer(mouse_x, mouse_y, global.layers.mouse, o_mouse);
    instance_create_layer(mouse_x, mouse_y, global.layers.player, o_blower);
    instance_create_layer(x, y, global.layers.shadows, o_shadows);
    instance_create_layer(x, y, global.layers.ground, o_intro_text);
    instance_create_layer(x, y, global.layers.trees, o_trees);
    instance_create_layer(x, y, global.layers.fx, o_fx_draw_controller);
    create_autoblowers();
    create_pets();
    with (o_trees)
    {
        init();
    }
    var blower_equip = global.shops.weapons.hands;
    if (is_string(data.current_weapon_key) && !is_undefined(variable_struct_get(global.shops.weapons, data.current_weapon_key)) && get_upgrade_count(variable_struct_get(global.shops.weapons, data.current_weapon_key)) > 0)
    {
        blower_equip = variable_struct_get(global.shops.weapons, data.current_weapon_key);
    }
    change_blower(blower_equip);
    var alb_blower_equip = global.shops.weapons.hands;
    if (is_string(data.current_alb_weapon_key) && !is_undefined(variable_struct_get(global.shops.weapons, data.current_alb_weapon_key)) && get_upgrade_count(variable_struct_get(global.shops.weapons, data.current_alb_weapon_key)) > 0)
    {
        alb_blower_equip = variable_struct_get(global.shops.weapons, data.current_alb_weapon_key);
    }
    change_alb_blower(alb_blower_equip);
    alarm[5] = sec(1);
    refresh_surface = true;
};

check_resource_box_hover = function()
{
    resource_box_hover = mouse_in_gui_range(surface_bbox.left, surface_bbox.top, surface_bbox.right, surface_bbox.bottom);
};

scroll = function(arg0, arg1)
{
    arg0 = get_default_value(arg0, 1);
    arg1 = get_default_value(arg1, 32);
    check_resource_box_hover();
    if (resource_box_hover)
    {
        refresh_surface = true;
        instance_destroy(o_tooltip);
        if (arg0 > 0 && !resource_nav_items_remaining)
        {
            exit;
        }
        resource_nav_page_index += (arg0 * resource_nav_page_next);
        resource_nav_page_index = max(0, resource_nav_page_index);
    }
};

global.game_loaded = false;
init();
alarm[0] = 1;
alarm[1] = 1;
alarm[2] = global.cloud_data.is_season ? sec(900) : sec(get_option(global.options.autosave_interval));
alarm[4] = sec(3);
alarm[6] = 60;
alarm[7] = 1;
alarm[9] = sec(60);
alarm[11] = sec(0.5);
if (mp_is_season())
{
    delay(undefined, sec(10), mp_track_game, undefined, undefined, true);
}

enum UnknownEnum
{
    Value_0
}
