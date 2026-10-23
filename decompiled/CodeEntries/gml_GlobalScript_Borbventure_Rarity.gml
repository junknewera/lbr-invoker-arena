function Borbventure_Rarity(arg0) : Rarity(arg0) constructor
{
    init = function()
    {
        self.upgrade_multiplier = 1 + ((self.level - 1) * 0.2);
    };
}
