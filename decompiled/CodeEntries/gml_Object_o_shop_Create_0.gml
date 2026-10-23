actions = [];
badge_check_counter = 0;
click_action = false;
click_action_alarm_set = undefined;
current_gui_item = false;
current_nav_key = undefined;
dialog_id = "SHOP_OBSOLETE";
dialog_visible = false;
current_nav_item = undefined;
items_bl_visible = [];
items_length_bl = 0;
nav_items = {};
nav_items_row_count = 30;
nav_items_show_count = 60;
nav_tl_page = 0;
nav_bl_page = 0;
shop = undefined;
shop_items = {};
show_nav_tl = true;
show_nav_bl = true;
shop_resource_key = undefined;
skip_frame = false;
refresh_surface = true;
surface = -1;
surface_nav = -1;
surface_bbox = 
{
    top: gui_col_y(29),
    left: 0,
    right: gui_col_x(28),
    bottom: global.gui_height
};
tab = UnknownEnum.Value_37;
titles = {};
__i = 0;
menu_categories = 
{
    bottom: 
    {
        items: [],
        sprite: spr_placeholder
    },
    leaf: 
    {
        items: [],
        sprite: spr_leaf
    },
    flask: 
    {
        items: [],
        sprite: spr_flask_red
    },
    top: 
    {
        items: [],
        sprite: spr_placeholder
    }
};
nav_tl_visible = true;
nav_bl_visible = true;
selected_menu_category = undefined;
gui_dialog_pre_init();
gui_dialog_init();

init = function()
{
    alarm[0] = 1;
    alarm[1] = 1;
    init_nav_items();
    shop_index = 0;
    shop_items_display = 6;
    shop_dialog_add_draw = get_create_instance_struct("shop_dialog_add_draw");
    shop_items = get_create_instance_struct("shop_items");
    for (var i = 0; i < UnknownEnum.Value_93; i++)
    {
        variable_struct_set(shop_items, i, []);
    }
    init_shop_menus();
    if (global.is_mobile)
    {
        variable_struct_set(shop_items, UnknownEnum.Value_23, []);
        variable_struct_set(shop_items, UnknownEnum.Value_24, []);
        var __array = nav_items_tl;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            array_push(variable_struct_get(shop_items, UnknownEnum.Value_23), new Gui_Item(UnknownEnum.Value_6, id, 
            {
                button_options: 
                {
                    icon: mitem.sprite,
                    position: "left"
                },
                button_text: mitem.name,
                check: mitem.check,
                func: mitem.func,
                is_visible: mitem.check
            }));
        }
        __array = nav_items_bl;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            array_push(variable_struct_get(shop_items, UnknownEnum.Value_24), new Gui_Item(UnknownEnum.Value_6, id, 
            {
                button_options: 
                {
                    icon: mitem.sprite,
                    position: "left"
                },
                button_text: mitem.name,
                check: mitem.check,
                func: mitem.func,
                is_visible: mitem.check
            }));
        }
        mobile_nav_items_tl_func = 
        {
            key: "mobile_nav_items_tl_func",
            
            func: function()
            {
                actions_dialog(variable_struct_get(shop_items, UnknownEnum.Value_23), 
                {
                    title: "",
                    subtitle: ""
                }, 32, 
                {
                    dialog_id: "nav_tl",
                    tab: UnknownEnum.Value_23,
                    can_toggle: true,
                    scroll_steps: 4
                });
            }
        };
        mobile_nav_items_bl_func = 
        {
            key: "mobile_nav_items_bl_func",
            
            func: function()
            {
                actions_dialog(variable_struct_get(shop_items, UnknownEnum.Value_24), 
                {
                    title: "",
                    subtitle: ""
                }, 32, 
                {
                    dialog_id: "nav_bl",
                    tab: UnknownEnum.Value_24,
                    can_toggle: true,
                    scroll_steps: 4
                });
            }
        };
    }
    shop_index_max = array_length(actions) - shop_items_display;
};

init();

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
        var nav_page_tmp = nav_bl_page + (arg0 * nav_items_show_count);
        if (nav_page_tmp >= items_length_bl)
        {
            exit;
        }
        nav_bl_page += (arg0 * nav_items_show_count);
        nav_bl_page = clamp(nav_bl_page, 0, floor(items_length_bl / nav_items_show_count) * nav_items_show_count);
    }
};

alarm[0] = sec(1);
alarm[1] = sec(0.1);

enum UnknownEnum
{
    Value_6 = 6,
    Value_23 = 23,
    Value_24,
    Value_37 = 37,
    Value_93 = 93
}
