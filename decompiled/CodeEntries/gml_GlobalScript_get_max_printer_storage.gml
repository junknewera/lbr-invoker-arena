function get_max_printer_storage()
{
    return power(10, 3 + global.upgrade_attributes.max_printer_storage);
}
