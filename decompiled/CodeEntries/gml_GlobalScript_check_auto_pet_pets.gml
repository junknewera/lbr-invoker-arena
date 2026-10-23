function check_auto_pet_pets()
{
    var upgrade_count = get_upgrade_attribute_value(global.upgrade_attributes.pet_auto_pet_count);
    if (upgrade_count == 0)
    {
        return false;
    }
    with (o_pet)
    {
        petpet();
    }
}
