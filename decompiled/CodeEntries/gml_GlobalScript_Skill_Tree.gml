function Skill_Tree(arg0) constructor
{
    data = {};
    index = 0;
    key = "";
    nodes = [];
    nodes_map = {};
    upgrade_attributes = undefined;
    upgrade_attributes_cache = undefined;
    upgrade_refresh_duration = sec(60);
    upgrade_refresh_timer = 0;
    
    _init = function()
    {
        var tmp_nodes = self.nodes;
        self.nodes = [];
        self.nodes_map = {};
        var __array = tmp_nodes;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            var node = new Skill_Node(mitem);
            node.skill_tree = self;
            array_push(self.nodes, node);
            variable_struct_set(self.nodes_map, node.id, node);
        }
        __array = self.nodes;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (!is_array(mitem.parent_nodes) || array_length(mitem.parent_nodes) == 0)
            {
                continue;
            }
            var tmp_parent_nodes = mitem.parent_nodes;
            mitem.parent_nodes = [];
            var __array2 = tmp_parent_nodes;
            var __prop_len2 = array_length(__array2);
            for (var __i2 = 0; __i2 < __prop_len2; __i2++)
            {
                var mitem2 = __array2[__i2];
                if (is_empty(mitem2))
                {
                    continue;
                }
                var parent_node = variable_struct_get(self.nodes_map, mitem2);
                if (is_undefined(parent_node))
                {
                    log("no parent node found", mitem.id, mitem2);
                }
                else
                {
                    array_push(mitem.parent_nodes, parent_node);
                }
            }
        }
        self.init();
    };
    
    init = __void;
    
    clear_upgrade_attributes = function()
    {
        self.upgrade_attributes_cache = undefined;
    };
    
    get_upgrade_attributes = function(arg0 = false)
    {
        if (is_undefined(self.upgrade_attributes_cache) || arg0)
        {
            self.refresh_upgrade_attributes();
        }
        return self.upgrade_attributes_cache;
    };
    
    refresh_upgrade_attributes = function()
    {
        self.upgrade_attributes_cache = {};
        var __array = self.nodes;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            add_struct_to_struct(self.upgrade_attributes_cache, mitem.get_upgrade_attributes());
        }
    };
    
    self.get_save_data = function()
    {
        var data = 
        {
            data: self.data,
            nodes: {}
        };
        var __array = self.nodes;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            variable_struct_set(data.nodes, mitem.key, mitem.data);
        }
        return data;
    };
    
    load_data = function(arg0)
    {
        if (is_struct(struct_get_from_hash(arg0, variable_get_hash("data"))))
        {
            apply_struct_to_struct(self.data, arg0.data);
        }
        if (is_struct(struct_get_from_hash(arg0, variable_get_hash("nodes"))))
        {
            var __struct = arg0.nodes;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                var node = variable_struct_get(self.nodes_map, mkey);
                if (!is_struct(node))
                {
                    continue;
                }
                node.load_data(mitem);
            }
        }
        self.load_data_after();
        self.init();
    };
    
    load_data_after = __void;
    set_local_vars(arg0);
    self._init();
}
