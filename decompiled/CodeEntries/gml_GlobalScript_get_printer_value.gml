function get_printer_value(arg0, arg1)
{
    if (is_undefined(arg1))
    {
        arg1 = 1;
    }
    var printer_value = (5 + global.upgrade_attributes.printer_adder) * arg0.print_value_multiplier * get_upgrade_count(arg0) * (1 + global.upgrade_attributes.printer_multiplier);
    printer_value *= (1 + global.upgrade_attributes.printer_multiplier_cards);
    printer_value *= (1 + global.upgrade_attributes.printer_multiplier_dice);
    printer_value *= (1 + global.upgrade_attributes.printer_multiplier_multiplier);
    printer_value *= (1 + global.upgrade_attributes.printer_scroll_multiplier);
    printer_value *= arg1;
    return ceil(printer_value);
}
