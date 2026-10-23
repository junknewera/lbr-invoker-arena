function Savable_Object(arg0 = undefined) constructor
{
    data = {};
    init = __void;
    
    load_data = function(arg0)
    {
        self.load_data_before();
        apply_struct_to_struct(self.data, arg0);
        self.load_data_after();
        self.init();
        self.load_data_after_init();
    };
    
    load_data_before = __void;
    load_data_after = __void;
    load_data_after_init = __void;
}
