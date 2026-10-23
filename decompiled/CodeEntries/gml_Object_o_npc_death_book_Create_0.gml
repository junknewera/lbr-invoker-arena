event_inherited();
hovering = true;
refresh_actions_on_click = true;

init_actions = function()
{
    actions = [];
    if (is_unlocked_death_book())
    {
        actions = [new Gui_Item(UnknownEnum.Value_54, id, 
        {
            text: __s("The Death Book has been unlocked! You can now defeat bosses passively. Check out the Death Book now!")
        }), new Gui_Item(UnknownEnum.Value_5, id, 
        {
            button_text: __s("Open %s", __("Death Book")),
            
            func: function()
            {
                open_nav("death_book");
            }
        })];
        image_blend = c_white;
    }
    else
    {
        actions = [new Gui_Item(UnknownEnum.Value_54, id, 
        {
            text: __s("This book is shut by an enchanted seal. Legend has it that this book is filled with ancient magical knowledge.")
        }), new Gui_Item(UnknownEnum.Value_40, id, 
        {
            result: global.costs.unlock_death_book,
            materials_options: 
            {
                insufficient_indicator: true
            },
            resources_options: 
            {
                insufficient_indicator: true
            }
        }), new Gui_Item(UnknownEnum.Value_5, id, 
        {
            button_text: __("Unlock"),
            
            check: function()
            {
                if (!has_enough(global.costs.unlock_death_book))
                {
                    return false;
                }
                return true;
            },
            
            func: function()
            {
                dec_result(global.costs.unlock_death_book);
                o_game.data.flags.death_book = true;
                destroy_dialog();
                with (o_npc)
                {
                    init_actions();
                    set_text();
                }
            }
        })];
        image_blend = c_black;
    }
};

init_actions();

enum UnknownEnum
{
    Value_5 = 5,
    Value_40 = 40,
    Value_54 = 54
}
