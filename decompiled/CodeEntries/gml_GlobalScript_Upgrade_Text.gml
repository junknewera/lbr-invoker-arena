function Upgrade_Text(arg0 = undefined) constructor
{
    collection = undefined;
    collection_format_exceptions = undefined;
    decimal_numbers = undefined;
    is_pct = false;
    is_visible = false;
    key = "";
    parent = undefined;
    prefix = "";
    props_start = arg0;
    suffix = "";
    text = "";
    text_neutral = "";
    text_only = false;
    text_template = "[name]";
    usign = 1;
    init_counter = 0;
    
    init = function()
    {
        if (is_empty(self.text_neutral))
        {
            self.text_neutral = self.key;
        }
        if (self.is_pct)
        {
            self.suffix = "%" + self.suffix;
        }
    };
    
    init_late = function()
    {
        if (!is_undefined(self.collection) && variable_global_exists(self.collection))
        {
            self.text = {};
            var collection_struct = variable_global_get(self.collection);
            var __struct2 = collection_struct;
            var __prop_names2 = struct_get_names(__struct2);
            var __prop_len2 = array_length(__prop_names2);
            for (var __i2 = 0; __i2 < __prop_len2; __i2++)
            {
                var mkey2 = __prop_names2[__i2];
                var mitem2 = variable_struct_get(__struct2, mkey2);
                var text_row;
                if (is_struct(mitem2))
                {
                    text_row = textr(self.text_template, mitem2);
                }
                else if (is_string(mitem2))
                {
                    text_row = textr(self.text_template, 
                    {
                        name: mitem2
                    });
                }
                variable_struct_set(self.text, mkey2, text_row);
            }
        }
    };
    
    set_local_vars(arg0);
}
