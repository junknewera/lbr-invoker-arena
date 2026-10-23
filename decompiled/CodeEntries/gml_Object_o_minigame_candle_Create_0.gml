event_inherited();
skip_visible_check = true;
auto_advance_timer_max = sec(5);
upgrades_text = "-";
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

refresh_upgrades_text = function()
{
    upgrades_text = format_upgrade_text(o_game.data.candle.upgrades, undefined, undefined, undefined, "\n");
    if (is_empty(upgrades_text))
    {
        upgrades_text = "-";
    }
};

refresh_upgrades_text();
