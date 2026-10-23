function init_layers()
{
    global.layers = 
    {
        mouse: layer_create(-1000, "MOUSE"),
        overlay: layer_create(-900, "OVERLAY"),
        tooltips: layer_create(-500, "TOOLTIPS"),
        gui_debug: layer_create(-402, "GUI_DEBUG"),
        gui_fx: layer_create(-402, "GUI_FX"),
        gui: layer_create(-400, "GUI"),
        gui_buttons: layer_create(-350, "GUI_BUTTONS"),
        gui_items_3: layer_create(-295, "GUI_ITEMS_3"),
        gui_items_2: layer_create(-294, "GUI_ITEMS_2"),
        gui_items_1: layer_create(-293, "GUI_ITEMS_1"),
        gui_items: layer_create(-292, "GUI_ITEMS"),
        gui_dialog: layer_create(-290, "GUI"),
        tooltips_behind_menu: layer_create(-280, "TOOLTIPS_BEHIND_MENU"),
        fx_sprite: layer_create(19, "FX_SPRITE"),
        fx: layer_create(20, "FX"),
        trees: layer_create(25, "TREES"),
        player: layer_create(27, "PLAYER"),
        equipment: layer_create(29, "EQUIPMENT"),
        pets: layer_create(30, "PETS"),
        fruits: layer_create(31, "FRUITS"),
        npc: layer_create(32, "NPC"),
        leaves: layer_create(35, "LEAVES"),
        borbs: layer_create(36, "BORBS"),
        autoblower: layer_create(40, "AUTOBLOWER"),
        sub_items: layer_create(90, "SUB_ITEMS"),
        house_ceiling: layer_create(100, "HOUSE_CEILING"),
        house_instances: layer_create(110, "HOUSE_INSTANCES"),
        house_instances_above: layer_create(115, "HOUSE_INSTANCES_ABOVE"),
        house_ground: layer_create(120, "HOUSE_GROUND"),
        shadows: layer_create(500, "SHADOWS"),
        above_ground: layer_create(550, "ABOVE_GROUND"),
        ground: layer_create(600, "GROUND")
    };
    if (layer_exists("Control"))
    {
        global.layers.control = layer_get_id("Control");
    }
    else
    {
        global.layers.control = layer_create(5000, "Control");
    }
    global.house_layers = 
    {
        ground: global.layers.house_ground,
        instances: global.layers.house_instances,
        instances_above: global.layers.house_instances_above,
        ceiling: global.layers.house_ceiling
    };
}
