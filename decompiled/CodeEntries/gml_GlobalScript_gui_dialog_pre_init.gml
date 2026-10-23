function gui_dialog_pre_init()
{
    actions = [];
    actions_sections = {};
    add_actions = [];
    alpha = 1;
    back_button = undefined;
    btn_args = false;
    check_dialog_help_button = __return_true;
    click_action = undefined;
    current_gui_item = false;
    current_section = global.dialog_sections.general.general;
    custom_func = undefined;
    destroying = false;
    dialog_id = "unknown";
    draw_bottom_result = false;
    drawing_to_surface_stack = false;
    help_button_text = undefined;
    help_button_text_options = undefined;
    is_dialog = true;
    items_display = 6;
    parent_nav = undefined;
    parent_npc = undefined;
    parent_section = undefined;
    resources = {};
    refresh_surface = true;
    result_bottom = 
    {
        materials: {},
        resources: {}
    };
    shop_items_display = 6;
    sections = {};
    sections_sorted = global.dialog_sections_array.general;
    shop_items_array = undefined;
    shop_items_display = 6;
    show_dialog_help_button = true;
    surface = -1;
    surface_items = -1;
    start_section = global.dialog_sections.general.general;
    text = "";
    titles = 
    {
        title: "",
        subtitle: ""
    };
    title = "";
    subtitle = "";
    use_last_scroll_position = true;
}
