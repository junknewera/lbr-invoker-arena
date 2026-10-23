function unlock_borbventures()
{
    global.resources.borbs.data.unlocked = true;
    global.resources.borb_juice.data.unlocked = true;
    global.resources.borb_token.data.unlocked = true;
    global.resources.borb_ascension_juice.data.unlocked = true;
    global.resources.borb_rune.data.unlocked = true;
    global.resources.borb_ascension_rune.data.unlocked = true;
    global.converters.convert_borb_borb_juice.data.unlocked = true;
    global.converters.convert_borb_juice_borb_token.data.unlocked = true;
}
