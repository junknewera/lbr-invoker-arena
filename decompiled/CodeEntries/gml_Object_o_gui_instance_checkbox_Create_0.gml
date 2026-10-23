event_inherited();
checked = false;
input = "";
label_id = -1;
label = "";
obfuscated = false;
show_unmask_option = false;
tab_index = -1;
type = UnknownEnum.Value_10;
width = iif(global.is_mobile, gui_col_x(0.8), gui_col_x(0.4));
height = iif(global.is_mobile, gui_col_y(1.2), gui_col_y(0.8));

update_position = function()
{
    box_x1 = x;
    box_y1 = y;
    box_x2 = x + width;
    box_y2 = y + height;
    text_x1 = x;
    text_y1 = y;
    text_x2 = x + string_width(label);
    text_y2 = y + string_height(label);
};

update_position();

enum UnknownEnum
{
    Value_10 = 10
}
