function apply_highest_blower()
{
    var blower = global.shops.weapons.hands;
    for (var i = 0; i < array_length(global.shops_sorted.weapons); i++)
    {
        var _blower = @@array_get@@(global.shops_sorted.weapons, i);
        if (_blower.data.count == 1)
        {
            blower = _blower;
        }
    }
    change_blower(blower);
    return blower;
}
