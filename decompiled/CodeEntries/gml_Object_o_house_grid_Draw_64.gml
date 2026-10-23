if (gui_button_sprite(gui_col_x(24), gui_col_y(2), spr_icon_house))
{
    open_nav("house_constructor", undefined, true);
}
global.options.house_action.draw(gui_col_x(26), gui_col_y(2), undefined, 
{
    draw_mode: 1
});
