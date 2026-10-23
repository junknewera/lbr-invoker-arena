gui_dialog_pre_init();
var tmp_dialog_id = id;
with (o_dialog)
{
    if (id != tmp_dialog_id)
    {
        if (variable_instance_exists(id, "destroy"))
        {
            parent_nav = undefined;
            parent_npc = undefined;
            parent_section = undefined;
            destroy();
        }
        else
        {
            instance_destroy();
        }
    }
}

add_draw = function()
{
};

destroy = function()
{
    if (destroying)
    {
        exit;
    }
    destroying = true;
    instance_destroy(o_gui_instance);
    instance_destroy();
    if (!is_undefined(parent_nav))
    {
        open_nav(parent_nav, parent_section);
    }
    if (!is_undefined(parent_npc) && instance_exists(parent_npc))
    {
        parent_npc.open();
    }
};

_func_cancel = function()
{
    func_cancel();
};

func_cancel = __void;
func_confirm = __void;

func_cancel_after = function()
{
    destroy();
};

func_confirm_after = function()
{
    destroy();
};

init = function()
{
    gui_dialog_init();
    var __array = actions;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (is_undefined(mitem.section))
        {
            mitem.section = global.dialog_sections.general.general;
        }
        if (is_undefined(variable_struct_get(actions_sections, mitem.section.value)))
        {
            variable_struct_set(actions_sections, mitem.section.value, []);
        }
        array_push(variable_struct_get(actions_sections, mitem.section.value), mitem);
    }
    set_dialog_section(start_section);
    dialog_visible = true;
    shop_index = 0;
    shop_index_last = {};
    shop_items_display = items_display;
    shop_index_max = max(0, array_length(actions) - shop_items_display);
    tab = 0;
    visible = true;
    title = get_default_struct_value(titles, "title", "");
    subtitle = get_default_struct_value(titles, "subtitle", "");
    init_after();
    init_finish();
};

init_after = __void;

init_finish = function()
{
    if (check_dialog_help_button())
    {
        if (variable_global_exists("texts_help"))
        {
            help_button_text = get_value_ext(global.texts_help, variable_struct_get(global.texts_help, dialog_id));
            help_button_text_options = 
            {
                tooltip: help_button_text
            };
        }
        if (global.is_mobile && !is_empty(subtitle))
        {
            var has_help_button_text = !is_empty(help_button_text);
            if (has_help_button_text)
            {
                help_button_text = "";
            }
            help_button_text = subtitle;
            if (has_help_button_text)
            {
                help_button_text += ("\n\n" + help_button_text);
            }
            help_button_text_options = undefined;
            subtitle = "";
        }
    }
    shop_index_max = max(0, array_length(actions) - shop_items_display);
    if (use_last_scroll_position && !is_undefined(variable_struct_get(global.dialog_shop_index_last, dialog_id)))
    {
        scroll_y = variable_struct_get(global.dialog_shop_index_last, dialog_id);
        scroll_y_fx = scroll_y;
    }
    shop_index = clamp(shop_index, 0, shop_index_max);
    if (is_shop)
    {
        show_quantity_selection = true;
    }
    global.dialog_instance = id;
    var o_up = instance_create_layer(gui_x_start + gui_width, gui_y_start + 48, global.layers.gui_buttons, o_gui_instance_button);
    o_up.check_auto_mouse_trigger = true;
    o_up.sprite = spr_gui_arrow_up;
    o_up.click = [gui_dialog_scroll_up];
    
    o_up.is_visible = function()
    {
        return gui_dialog_has_scroll_buttons();
    };
    
    o_up.is_dialog_button = true;
    with (o_up)
    {
        init();
    }
    var o_down = instance_create_layer(gui_x_start + gui_width, (gui_y_start + gui_height) - 20, global.layers.gui_buttons, o_gui_instance_button);
    o_down.check_auto_mouse_trigger = true;
    o_down.sprite = spr_gui_arrow_down;
    o_down.click = [gui_dialog_scroll_down];
    
    o_down.is_visible = function()
    {
        return gui_dialog_has_scroll_buttons();
    };
    
    o_down.is_dialog_button = true;
    with (o_down)
    {
        init();
    }
    delay("destroy_nav_tooltips", 2, function()
    {
        instance_destroy(o_tooltip);
    });
};

set_titles = function(arg0)
{
    var title = "";
    if (is_string(arg0))
    {
        title = arg0;
    }
    titles.title = get_default_struct_value(arg0, "title", title);
    titles.subtitle = get_default_struct_value(arg0, "subtitle", "");
};

init();
alarm[0] = sec(0.2);
