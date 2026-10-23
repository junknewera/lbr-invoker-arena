_is_visible = true;
is_visible = true;
label_id = "";
is_dialog_button = false;
skip_visible_check = false;
surface = -1;
tab_index = -1;
type = -1;
alarm[0] = 1;
alarm[1] = 1;

init = function()
{
    is_visible = maybe_add_method(id, is_visible);
};

update_position = __void;
