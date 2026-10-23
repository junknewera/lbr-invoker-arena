function fx_gold(arg0)
{
    if (instance_number(o_fx_text) > 200)
    {
        exit;
    }
    var o = fx_text(x, y, sprintf("+%s", arg0));
    o.sprite_index = spr_gold;
}
