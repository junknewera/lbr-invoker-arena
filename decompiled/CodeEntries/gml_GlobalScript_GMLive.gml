global.g_gml_token_constructors = ["header", "macro_def", "macro_start", "hash", "semico", "comma", "period", "colon", "qmark", "at_sign", "dollar_sign", "keyword", "ident", "undefined_hx", "boolean", "number", "cstring", "un_op", "adjfix", "bin_op", "set_op", "par_open", "par_close", "sqb_open", "sqb_close", "cub_open", "cub_close", "arg_const", "null_co", "null_co_set", "pragma"];
global.g_gml_node_constructors = ["undefined_hx", "boolean", "number", "cstring", "other_const", "enum_ctr", "array_decl", "object_decl", "ensure_array_for_local", "ensure_array_for_global", "ensure_array_for_field", "ensure_array_for_index", "ensure_array_for_index2d", "ident", "self_hx", "other_hx", "global_ref", "script", "native_script", "const", "arg_const", "arg_index", "arg_count", "call", "call_script", "call_script_at", "call_script_id", "call_script_with_array", "call_field", "call_func", "call_func_at", "construct", "func_literal", "prefix", "postfix", "un_op", "bin_op", "set_op", "delete_hx", "null_co", "to_bool", "from_bool", "in", "local_hx", "local_set", "local_aop", "static_hx", "static_set", "static_aop", "global_hx", "global_set", "global_aop", "script_static", "script_static_set", "script_static_aop", "field", "field_set", "field_aop", "env", "env_set", "env_aop", "env_fd", "env_fd_set", "env_fd_aop", "env1d", "env1d_set", "env1d_aop", "alarm", "alarm_set_hx", "alarm_aop", "index", "index_set", "index_aop", "index2d", "index2d_set", "index2d_aop", "raw_id", "raw_id_set", "raw_id_aop", "raw_id2d", "raw_id2d_set", "raw_id2d_aop", "ds_list", "ds_list_set_hx", "ds_list_aop", "ds_map", "ds_map_set_hx", "ds_map_aop", "ds_grid", "ds_grid_set_hx", "ds_grid_aop", "key_id", "key_id_set", "key_id_aop", "var_decl", "block", "if_then", "ternary", "switch_hx", "wait", "fork", "while_hx", "do_until", "do_while", "repeat_hx", "for_hx", "with_hx", "once", "return_hx", "exit_hx", "break_hx", "continue_hx", "debugger", "try_catch", "throw_hx"];
global.mq_gml_thread_scope = [undefined, undefined, 0, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined];
global.gml_std_haxe_type_markerValue = [];
(function()
{
    global.mt_gml_std_Date = new gml_std_haxe_class(-1, "gml_std_Date");
    global.mt_gml_builder = new gml_std_haxe_class(-1, "gml_builder");
    global.mt_gml_action = new gml_std_haxe_enum(-1, "gml_action", ["discard", "dup", "dup2x", "dup3x", "dup_in", "undefined_hx", "number", "cstring", "array_decl", "object_decl", "const", "self_hx", "other_hx", "local_hx", "local_set", "local_aop", "global_hx", "global_set", "global_aop", "field", "field_set", "field_aop", "fast_field_aop", "self_field", "self_field_set", "self_field_aop", "fast_self_field", "fast_self_field_set", "fast_self_field_aop", "local_field", "local_field_set", "local_field_aop", "fast_local_field", "fast_local_field_set", "fast_local_field_aop", "index", "index_set", "index_aop", "index2d", "index2d_set", "index2d_aop", "env", "env_set", "env_aop", "env1d", "env1d_set", "env1d_aop", "ds_aop", "arg_const", "arg_const_set", "arg_const_aop", "arg_index", "arg_index_set", "arg_index_aop", "arg_count", "add_int", "equ_op", "neq_op", "concat", "bin_op", "un_op", "in", "in_const", "call_script", "call_script_id", "call_script_with_array", "call_func", "call_func0", "call_func0o", "call_func1", "call_func1o", "call_func2", "call_func2o", "call_func3", "call_func3o", "call_func4", "call_func4o", "call_func_with_local0", "call_func_with_local0o", "call_func_with_local1", "call_func_with_local1o", "call_func_with_local2", "call_func_with_local2o", "call_func_with_local3", "call_func_with_local3o", "call_func_with_local4", "call_func_with_local4o", "call_field", "construct", "func_literal", "jump", "jump_if", "jump_unless", "jump_placeholder", "bool_and", "bool_or", "null_co", "switch_hx", "switch_case", "repeat_jump", "repeat_pre", "with_pre", "with_next", "with_post", "break_hx", "continue_hx", "return_hx", "return_const", "result", "try_hx", "catch_hx", "finally_hx", "throw_hx", "wait", "fork", "ensure_array_for_local", "ensure_array_for_global", "ensure_array_for_field", "ensure_array_for_index", "ensure_array_for_index2d", "alarm", "alarm_set_hx", "alarm_aop", "closure"]);
    global.mt_gml_func = new gml_std_haxe_class(-1, "gml_func");
    global.mt_api_api_version = new gml_std_haxe_class(-1, "api_api_version");
    global.mt_gml_parser = new gml_std_haxe_class(-1, "gml_parser");
    global.mt_gml_parser_template_state = new gml_std_haxe_class(-1, "gml_parser_template_state");
    global.mt_gml_parser_macro = new gml_std_haxe_class(-1, "gml_parser_macro");
    global.mt_gml_program = new gml_std_haxe_class(-1, "gml_program");
    global.mt_gml_std_StringBuf = new gml_std_haxe_class(-1, "gml_std_StringBuf");
    global.mt_api_api_var = new gml_std_haxe_class(-1, "api_api_var");
    global.mt_gml_enum = new gml_std_haxe_class(-1, "gml_enum");
    global.mt_gml_enum_ctr = new gml_std_haxe_class(-1, "gml_enum_ctr");
    global.mt_gml_macro = new gml_std_haxe_class(-1, "gml_macro");
    global.mt_ast_gml_node_def_param = new gml_std_haxe_class(-1, "ast_gml_node_def_param");
    global.mt_ast_gml_node_def_ctr = new gml_std_haxe_class(-1, "ast_gml_node_def_ctr");
    global.mt_gml_script = new gml_std_haxe_class(-1, "gml_script");
    global.mt_gml_source = new gml_std_haxe_class(-1, "gml_source");
    global.mt_gml_std_haxe_class = new gml_std_haxe_class(-1, "gml_std_haxe_class");
    global.mt_gml_std_haxe_enum = new gml_std_haxe_class(-1, "gml_std_haxe_enum");
    global.mt_gml_std_haxe_Exception = new gml_std_haxe_class(-1, "gml_std_haxe_Exception");
    global.mt_haxe_ds_basic_map = new gml_std_haxe_class(-1, "haxe_ds_basic_map");
    global.mt_haxe_ds_string_map = new gml_std_haxe_class(-1, "haxe_ds_string_map");
    global.mt_haxe_ds_string_map.h_superClass = global.mt_haxe_ds_basic_map;
    global.mt_gml_thread_scope = new gml_std_haxe_class(7, "gml_thread_scope");
    global.mt_gml_with_scope = new gml_std_haxe_class(-1, "gml_with_scope");
    global.mt_gml_type_ref = new gml_std_haxe_class(-1, "gml_type_ref");
    global.mt_vm_v2_GmlStructBase = new gml_std_haxe_class(-1, "vm_v2_GmlStructBase");
})();

function gml_std_enum_toString()
{
    return gml_std_Std_stringify(self);
}

function gml_std_enum_getIndex()
{
    return __enumIndex__;
}

function gml_std_Date(arg0, arg1, arg2, arg3, arg4, arg5) constructor
{
    static h_date = undefined;
    
    static h_getTime = function()
    {
        return (self.h_date - 25569) * 86400000;
    };
    
    static __class__ = global.mt_gml_std_Date;
    
    self.h_date = date_create_datetime(arg0, arg1 + 1, arg2, arg3, arg4, arg5);
}

function gml_std_Date_now()
{
    var l_d = new gml_std_Date(2000, 0, 1, 0, 0, 0);
    l_d.h_date = date_current_datetime();
    return l_d;
}

function gml_builder(arg0, arg1) constructor
{
    static h_tokens = undefined;
    static h_source = undefined;
    static h_offset = undefined;
    static h_length = undefined;
    static h_scripts = undefined;
    static h_enums = undefined;
    static h_macro_names = undefined;
    static h_macro_nodes = undefined;
    static h_global_vars = undefined;
    
    static h_run = function()
    {
        if (self.h_error_text == undefined)
        {
            self.h_build_loop(self.h_source.h_main);
        }
    };
    
    static h_error_text = undefined;
    static h_error_pos = undefined;
    
    static h_error_at = function(arg0, arg1)
    {
        self.h_error_text = gml_pos_to_string(arg1, self.h_program) + ": " + arg0;
        self.h_error_pos = arg1;
        return true;
    };
    
    static h_error = function(arg0, arg1)
    {
        return self.h_error_at(arg0, arg1[1]);
    };
    
    static h_expect = function(arg0, arg1)
    {
        return self.h_error("Expected " + arg0 + ", got " + global.g_gml_token_constructors[arg1[0]], arg1);
    };
    
    static h_expect_node = function(arg0, arg1)
    {
        return self.h_error_at("Expected " + arg0 + ", got " + global.g_gml_node_constructors[arg1[0]], gml_std_haxe_enum_tools_getParameter(arg1, 0));
    };
    
    static h_out_node = undefined;
    static h_current_script = undefined;
    static h_current_script_ref = undefined;
    
    static h_build_ops = function(arg0, arg1)
    {
        self.h_offset += 1;
        var l_nodes = ds_list_create();
        ds_list_add(l_nodes, self.h_out_node);
        var l_ops = ds_list_create();
        ds_list_add(l_ops, arg1);
        var l_locs = ds_list_create();
        ds_list_add(l_locs, arg0);
        var l_proc = true;
        while (l_proc && self.h_offset < self.h_length)
        {
            if (self.h_build_expr(1))
            {
                ds_list_destroy(l_nodes);
                ds_list_destroy(l_ops);
                ds_list_destroy(l_locs);
                return true;
            }
            ds_list_add(l_nodes, self.h_out_node);
            if (self.h_offset < self.h_length)
            {
                var l__g = self.h_tokens[self.h_offset];
                switch (l__g[0])
                {
                    case UnknownEnum.Value_19:
                        self.h_offset += 1;
                        ds_list_add(l_locs, l__g[1]);
                        ds_list_add(l_ops, l__g[2]);
                        break;
                    case UnknownEnum.Value_20:
                        if (l__g[2] == -1)
                        {
                            self.h_offset += 1;
                            ds_list_add(l_locs, l__g[1]);
                            ds_list_add(l_ops, 64);
                        }
                        else
                        {
                            l_proc = false;
                        }
                        break;
                    default:
                        l_proc = false;
                }
            }
        }
        var l_pmin = 7;
        var l_pmax = 0;
        var l_n = ds_list_size(l_ops);
        for (var l_i = 0; l_i < l_n; l_i++)
        {
            var l_pcur = gml_op_get_priority(ds_list_find_value(l_ops, l_i));
            if (l_pcur < l_pmin)
            {
                l_pmin = l_pcur;
            }
            if (l_pcur > l_pmax)
            {
                l_pmax = l_pcur;
            }
        }
        while (l_pmin <= l_pmax)
        {
            for (var l_i = 0; l_i < l_n; l_i++)
            {
                if (gml_op_get_priority(ds_list_find_value(l_ops, l_i)) == l_pmin)
                {
                    ds_list_set(l_nodes, l_i, [UnknownEnum.Value_36, ds_list_find_value(l_locs, l_i), ds_list_find_value(l_ops, l_i), ds_list_find_value(l_nodes, l_i), ds_list_find_value(l_nodes, l_i + 1)]);
                    ds_list_delete(l_nodes, l_i + 1);
                    ds_list_delete(l_ops, l_i);
                    ds_list_delete(l_locs, l_i);
                    l_n--;
                    l_i--;
                }
            }
            l_pmin++;
        }
        self.h_out_node = ds_list_find_value(l_nodes, 0);
        ds_list_destroy(l_nodes);
        ds_list_destroy(l_ops);
        ds_list_destroy(l_locs);
        return false;
    };
    
    static h_build_args = function(arg0, arg1)
    {
        var l_args1 = [];
        var l_proc = true;
        var l_seenComma = true;
        var l_func = self.h_out_node;
        while (l_proc && self.h_offset < self.h_length)
        {
            var l_tk = self.h_tokens[self.h_offset];
            switch (l_tk[0])
            {
                case UnknownEnum.Value_22:
                    if (arg1)
                    {
                        return self.h_error("Unexpected `)`", l_tk);
                    }
                    else
                    {
                        l_proc = false;
                        self.h_offset += 1;
                    }
                    break;
                case UnknownEnum.Value_24:
                    if (arg1)
                    {
                        l_proc = false;
                        self.h_offset += 1;
                    }
                    else
                    {
                        return self.h_error("Unexpected `]`", l_tk);
                    }
                    break;
                case UnknownEnum.Value_5:
                    if (l_seenComma)
                    {
                        array_push(l_args1, [UnknownEnum.Value_0, l_tk[1]]);
                        self.h_offset += 1;
                    }
                    else
                    {
                        l_seenComma = true;
                        self.h_offset += 1;
                    }
                    break;
                default:
                    if (l_seenComma)
                    {
                        l_seenComma = false;
                        if (self.h_build_expr(0))
                        {
                            return true;
                        }
                        array_push(l_args1, self.h_out_node);
                        break;
                    }
                    return self.h_expect("a comma or closing token.", l_tk);
            }
        }
        if (l_proc)
        {
            return self.h_error_at("Unclosed list", arg0);
        }
        if (arg1)
        {
            self.h_out_node = [UnknownEnum.Value_6, arg0, l_args1];
        }
        else
        {
            self.h_out_node = [UnknownEnum.Value_23, arg0, l_func, l_args1];
        }
        return false;
    };
    
    static h_build_expr = function(arg0)
    {
        if (self.h_offset >= self.h_length)
        {
            return self.h_error_at("Expected an expression", self.h_source.h_get_eof());
        }
        var l_tk0 = self.h_tokens[self.h_offset++];
        switch (l_tk0[0])
        {
            case UnknownEnum.Value_13:
                self.h_out_node = [UnknownEnum.Value_0, l_tk0[1]];
                break;
            case UnknownEnum.Value_15:
                self.h_out_node = [UnknownEnum.Value_2, l_tk0[1], l_tk0[2], l_tk0[3]];
                break;
            case UnknownEnum.Value_14:
                self.h_out_node = [UnknownEnum.Value_1, l_tk0[1], l_tk0[2]];
                break;
            case UnknownEnum.Value_16:
                self.h_out_node = [UnknownEnum.Value_3, l_tk0[1], l_tk0[2]];
                break;
            case UnknownEnum.Value_23:
                if (l_tk0[2] == 0)
                {
                    l_proc = true;
                    var l_sep = true;
                    self.h_build_args(l_tk0[1], true);
                }
                else if ((arg0 & 4) != 0)
                {
                    return self.h_expect("a statement", l_tk0);
                }
                else
                {
                    return self.h_expect("a value", l_tk0);
                }
                break;
            case UnknownEnum.Value_12:
                var l_s1 = l_tk0[2];
                switch (l_s1)
                {
                    case "self":
                        self.h_out_node = [UnknownEnum.Value_14, l_tk0[1]];
                        break;
                    case "other":
                        self.h_out_node = [UnknownEnum.Value_15, l_tk0[1]];
                        break;
                    default:
                        if (variable_struct_get(global.gml_asset_index, l_s1) != undefined)
                        {
                            var l_i = variable_struct_get(global.gml_asset_index, l_s1);
                            self.h_out_node = [UnknownEnum.Value_2, l_tk0[1], l_i, undefined];
                            break;
                        }
                        var l_m = variable_struct_get(self.h_program.h_macro_map, l_s1);
                        if (l_m != undefined && l_m.h_is_expr)
                        {
                            self.h_out_node = gml_node_tools_clone(l_m.h_node);
                            break;
                        }
                        self.h_out_node = [UnknownEnum.Value_13, l_tk0[1], l_s1];
                }
                break;
            case UnknownEnum.Value_27:
                self.h_out_node = [UnknownEnum.Value_20, l_tk0[1], l_tk0[2]];
                break;
            case UnknownEnum.Value_17:
                if (self.h_build_expr(1))
                {
                    return true;
                }
                var l__g = self.h_out_node;
                if (l__g[0] == 2)
                {
                    var l_f = l__g[2];
                    switch (l_tk0[2])
                    {
                        case 2:
                            l_f = ~(l_f | 0);
                            break;
                        case 0:
                            l_f = -l_f;
                            break;
                        case 1:
                            l_f = (l_f > 0.5) ? 0 : 1;
                            break;
                    }
                    self.h_out_node = [UnknownEnum.Value_2, l_tk0[1], l_f, undefined];
                }
                else
                {
                    self.h_out_node = [UnknownEnum.Value_35, l_tk0[1], self.h_out_node, l_tk0[2]];
                }
                break;
            case UnknownEnum.Value_18:
                if (self.h_build_expr(1))
                {
                    return true;
                }
                self.h_out_node = [UnknownEnum.Value_33, l_tk0[1], self.h_out_node, l_tk0[2]];
                break;
            case UnknownEnum.Value_19:
                var l__g = l_tk0[1];
                switch (l_tk0[2])
                {
                    case 16:
                        if (self.h_build_expr(1))
                        {
                            return true;
                        }
                        break;
                    case 17:
                        var l_d = l__g;
                        if (self.h_build_expr(1))
                        {
                            return true;
                        }
                        l__g = self.h_out_node;
                        if (l__g[0] == 2)
                        {
                            self.h_out_node = [UnknownEnum.Value_2, l_d, -l__g[2], undefined];
                        }
                        else
                        {
                            self.h_out_node = [UnknownEnum.Value_35, l_d, self.h_out_node, 0];
                        }
                        break;
                    default:
                        if ((arg0 & 4) != 0)
                        {
                            return self.h_expect("a statement", l_tk0);
                            break;
                        }
                        return self.h_expect("a value", l_tk0);
                }
                break;
            case UnknownEnum.Value_21:
                if (self.h_build_expr(0))
                {
                    return true;
                }
                if (self.h_offset >= self.h_length)
                {
                    return self.h_error("Unclosed parenthesis", l_tk0);
                }
                if (self.h_offset >= self.h_length)
                {
                    return self.h_error_at("Expected a closing parenthesis", self.h_source.h_get_eof());
                }
                else if (self.h_tokens[self.h_offset][0] == 22)
                {
                    self.h_offset += 1;
                }
                else
                {
                    return self.h_error("Expected a closing parenthesis", self.h_tokens[self.h_offset]);
                }
                break;
            case UnknownEnum.Value_25:
                var l_d = l_tk0[1];
                var l_keys = [];
                var l_nodes = [];
                l_proc = true;
                var l__g = self.h_tokens[self.h_offset];
                if (l__g[0] == 26)
                {
                    l_proc = false;
                    self.h_offset += 1;
                }
                else
                {
                    while (l_proc && self.h_offset < self.h_length)
                    {
                        l__g = self.h_tokens[self.h_offset];
                        switch (l__g[0])
                        {
                            case UnknownEnum.Value_12:
                                var l_s = l__g[2];
                                array_push(l_keys, l_s);
                                self.h_offset += 1;
                                if (self.h_offset >= self.h_length)
                                {
                                    continue;
                                }
                                var l__g1 = self.h_tokens[self.h_offset];
                                var l_tmp;
                                if (l__g1[0] == 7)
                                {
                                    l_tmp = true;
                                }
                                else
                                {
                                    l_tmp = false;
                                }
                                if (l_tmp)
                                {
                                    self.h_offset += 1;
                                    if (self.h_build_expr(0))
                                    {
                                        return true;
                                    }
                                    array_push(l_nodes, self.h_out_node);
                                }
                                else
                                {
                                    var l_node = [UnknownEnum.Value_13, l__g[1], l_s];
                                    array_push(l_nodes, l_node);
                                }
                                switch (self.h_tokens[self.h_offset][0])
                                {
                                    case UnknownEnum.Value_5:
                                        self.h_offset += 1;
                                        if (self.h_tokens[self.h_offset][0] == 26)
                                        {
                                            self.h_offset += 1;
                                            l_proc = false;
                                        }
                                        break;
                                    case UnknownEnum.Value_26:
                                        self.h_offset += 1;
                                        l_proc = false;
                                        break;
                                    default:
                                        return self.h_expect("a `,` or a `}` in object declaration", self.h_tokens[self.h_offset]);
                                }
                                break;
                            case UnknownEnum.Value_16:
                                var l_s = l__g[2];
                                array_push(l_keys, l_s);
                                self.h_offset += 1;
                                if (self.h_offset >= self.h_length)
                                {
                                    continue;
                                }
                                var l__g8 = self.h_tokens[self.h_offset];
                                var l_tmp1;
                                if (l__g8[0] == 7)
                                {
                                    l_tmp1 = true;
                                }
                                else
                                {
                                    l_tmp1 = false;
                                }
                                if (l_tmp1)
                                {
                                    self.h_offset += 1;
                                    if (self.h_build_expr(0))
                                    {
                                        return true;
                                    }
                                    array_push(l_nodes, self.h_out_node);
                                }
                                else
                                {
                                    var l_node = [UnknownEnum.Value_13, l__g[1], l_s];
                                    array_push(l_nodes, l_node);
                                }
                                switch (self.h_tokens[self.h_offset][0])
                                {
                                    case UnknownEnum.Value_5:
                                        self.h_offset += 1;
                                        if (self.h_tokens[self.h_offset][0] == 26)
                                        {
                                            self.h_offset += 1;
                                            l_proc = false;
                                        }
                                        break;
                                    case UnknownEnum.Value_26:
                                        self.h_offset += 1;
                                        l_proc = false;
                                        break;
                                    default:
                                        return self.h_expect("a `,` or a `}` in object declaration", self.h_tokens[self.h_offset]);
                                }
                                break;
                            default:
                                return self.h_expect("a key-value pair or a `}` in object declaration", self.h_tokens[self.h_offset]);
                        }
                    }
                }
                if (l_proc)
                {
                    return self.h_error_at("Unclosed struct literal", l_d);
                }
                self.h_out_node = [UnknownEnum.Value_7, l_d, l_keys, l_nodes];
                break;
            case UnknownEnum.Value_0:
                if ((arg0 & 4) != 0)
                {
                    return self.h_error("Expected a statement, got a header (did you miss a closing bracket?)", l_tk0);
                }
                else
                {
                    return self.h_error("Expected an expression, got a header (did you miss a closing parenthesis?)", l_tk0);
                }
            case UnknownEnum.Value_11:
                switch (l_tk0[2])
                {
                    case 0:
                        var l_d = l_tk0[1];
                        if (self.h_offset >= self.h_length)
                        {
                            self.h_out_node = [UnknownEnum.Value_16, l_d];
                        }
                        else if (self.h_tokens[self.h_offset][0] == 6)
                        {
                            var l_tk = self.h_tokens[self.h_offset++];
                            if (self.h_offset >= self.h_length)
                            {
                                return self.h_expect("a field name", l_tk);
                            }
                            else
                            {
                                var l__g1 = self.h_tokens[self.h_offset];
                                if (l__g1[0] == 12)
                                {
                                    self.h_offset += 1;
                                    self.h_out_node = [UnknownEnum.Value_49, l__g1[1], l__g1[2]];
                                }
                                else
                                {
                                    return self.h_expect("a field name", self.h_tokens[self.h_offset]);
                                }
                            }
                        }
                        else
                        {
                            self.h_out_node = [UnknownEnum.Value_16, l_d];
                        }
                        break;
                    case 26:
                        if (self.h_offset >= self.h_length)
                        {
                            return self.h_error_at("Expected an opening square bracket", self.h_source.h_get_eof());
                        }
                        else if (self.h_tokens[self.h_offset][0] == 23)
                        {
                            self.h_offset += 1;
                        }
                        else
                        {
                            return self.h_error("Expected an opening square bracket", self.h_tokens[self.h_offset]);
                        }
                        if (self.h_build_expr(0))
                        {
                            return true;
                        }
                        if (self.h_offset >= self.h_length)
                        {
                            return self.h_error_at("Expected a closing square bracket", self.h_source.h_get_eof());
                        }
                        else if (self.h_tokens[self.h_offset][0] == 24)
                        {
                            self.h_offset += 1;
                        }
                        else
                        {
                            return self.h_error("Expected a closing square bracket", self.h_tokens[self.h_offset]);
                        }
                        self.h_out_node = [UnknownEnum.Value_21, l_tk0[1], self.h_out_node];
                        break;
                    case 27:
                        self.h_out_node = [UnknownEnum.Value_22, l_tk0[1]];
                        break;
                    case 25:
                        if (self.h_build_expr(arg0))
                        {
                            return true;
                        }
                        var l__g1 = self.h_out_node;
                        if (l__g1[0] == 23)
                        {
                            self.h_out_node = [UnknownEnum.Value_31, l__g1[1], l__g1[2], l__g1[3]];
                        }
                        else
                        {
                            return self.h_expect("a callable value after `new`", l_tk0);
                        }
                        break;
                    case 24:
                        if (self.h_offset >= self.h_length)
                        {
                            return self.h_error_at("Expected a function name or `(`", self.h_source.h_get_eof());
                        }
                        var l_oldName = self.h_current_script;
                        var l_oldScript = self.h_current_script_ref;
                        var l_i = 0;
                        var l_n, l_s;
                        do
                        {
                            l_s = l_oldName + "+" + string(++l_i);
                            l_n = array_length(self.h_scripts);
                            while (--l_n >= 0)
                            {
                                if (self.h_scripts[l_n].h_name == l_s)
                                {
                                    break;
                                }
                            }
                        }
                        until (l_n <= 0);
                        var l__g1 = self.h_tokens[self.h_offset];
                        if (l__g1[0] == 12)
                        {
                            var l__name = l__g1[2];
                            self.h_offset += 1;
                            var l_scrName = l__name;
                        }
                        else
                        {
                            var l_scrName = undefined;
                        }
                        if (self.h_offset >= self.h_length)
                        {
                            return self.h_error_at("Expected an opening `(`", self.h_source.h_get_eof());
                        }
                        else if (self.h_tokens[self.h_offset][0] == 21)
                        {
                            self.h_offset += 1;
                        }
                        else
                        {
                            return self.h_error("Expected an opening `(`", self.h_tokens[self.h_offset]);
                        }
                        if (self.h_build_script_args())
                        {
                            return true;
                        }
                        var l_isConstructor = false;
                        var l_tmp;
                        if (self.h_offset < self.h_length)
                        {
                            l__g1 = self.h_tokens[self.h_offset];
                            if (l__g1[0] == 12)
                            {
                                l_tmp = l__g1[2] == "constructor";
                            }
                            else
                            {
                                l_tmp = false;
                            }
                        }
                        else
                        {
                            l_tmp = false;
                        }
                        if (l_tmp)
                        {
                            l_isConstructor = true;
                            self.h_offset += 1;
                        }
                        var l_argPrefix = self.h_build_script_args_prefix;
                        var l_scr = self.h_add_script(l_s, self.h_build_script_args_map, self.h_build_script_args_argc, true, []);
                        l_scr.h_is_constructor = l_isConstructor;
                        self.h_build_script_args_map = undefined;
                        self.h_current_script = l_s;
                        self.h_current_script_ref = l_scr;
                        if (self.h_offset >= self.h_length)
                        {
                            return self.h_error_at("Expected function body", self.h_source.h_get_eof());
                        }
                        var l_tk = self.h_tokens[self.h_offset];
                        if (l_tk[0] == 25)
                        {
                            l__g1 = l_tk[1];
                        }
                        else
                        {
                            return self.h_expect("a `{`", self.h_tokens[self.h_offset]);
                        }
                        self.h_build_line();
                        if (l_argPrefix != undefined)
                        {
                            array_push(l_argPrefix, self.h_out_node);
                            l_scr.h_node = [UnknownEnum.Value_95, gml_std_haxe_enum_tools_getParameter(self.h_out_node, 0), l_argPrefix];
                        }
                        else
                        {
                            l_scr.h_node = self.h_out_node;
                        }
                        self.h_out_node = [UnknownEnum.Value_32, l_tk0[1], l_s, false];
                        self.h_current_script = l_oldName;
                        self.h_current_script_ref = l_oldScript;
                        break;
                    default:
                        if ((arg0 & 4) != 0)
                        {
                            return self.h_expect("a statement", l_tk0);
                            break;
                        }
                        return self.h_expect("a value", l_tk0);
                }
                break;
            default:
                if ((arg0 & 4) != 0)
                {
                    return self.h_expect("a statement", l_tk0);
                    break;
                }
                return self.h_expect("a value", l_tk0);
        }
        var l_proc = true;
        while (l_proc && self.h_offset < self.h_length)
        {
            var l_tk = self.h_tokens[self.h_offset];
            switch (l_tk[0])
            {
                case UnknownEnum.Value_18:
                    if ((arg0 & 2) == 0)
                    {
                        self.h_offset += 1;
                        self.h_out_node = [UnknownEnum.Value_34, l_tk[1], self.h_out_node, l_tk[2]];
                        arg0 |= 2;
                    }
                    else if (l_tk[2])
                    {
                        return self.h_error_at("Unexpected `++`", l_tk[1]);
                    }
                    else
                    {
                        return self.h_error_at("Unexpected `--`", l_tk[1]);
                    }
                    break;
                case UnknownEnum.Value_6:
                    if ((arg0 & 2) == 0)
                    {
                        self.h_offset += 1;
                        var l__g = self.h_tokens[self.h_offset];
                        if (l__g[0] == 12)
                        {
                            var l_s = l__g[2];
                            self.h_offset += 1;
                            self.h_out_node = [UnknownEnum.Value_55, l_tk[1], self.h_out_node, l_s];
                        }
                        else
                        {
                            return self.h_error("Expected a field name", self.h_tokens[self.h_offset]);
                        }
                    }
                    else
                    {
                        return self.h_error("Unexpected period", self.h_tokens[self.h_offset]);
                    }
                    break;
                case UnknownEnum.Value_21:
                    if ((arg0 & 2) == 0)
                    {
                        self.h_offset += 1;
                        if (self.h_build_args(l_tk[1], false))
                        {
                            return true;
                        }
                    }
                    else
                    {
                        return self.h_error_at("Unexpected `(`", l_tk[1]);
                    }
                    break;
                case UnknownEnum.Value_23:
                    var l_d4 = l_tk[1];
                    if ((arg0 & 2) == 0)
                    {
                        self.h_offset += 1;
                        if (self.h_offset >= self.h_length)
                        {
                            return self.h_error_at("Expected an index", self.h_source.h_get_eof());
                        }
                        var l_node = self.h_out_node;
                        switch (l_tk[2])
                        {
                            case 124:
                                if (self.h_build_expr(0))
                                {
                                    return true;
                                }
                                if (self.h_offset >= self.h_length)
                                {
                                    return self.h_error_at("Expected a closing bracket", self.h_source.h_get_eof());
                                }
                                else if (self.h_tokens[self.h_offset][0] == 24)
                                {
                                    self.h_offset += 1;
                                }
                                else
                                {
                                    return self.h_error("Expected a closing bracket", self.h_tokens[self.h_offset]);
                                }
                                self.h_out_node = [UnknownEnum.Value_82, l_d4, l_node, self.h_out_node];
                                break;
                            case 63:
                                if (self.h_build_expr(0))
                                {
                                    return true;
                                }
                                if (self.h_offset >= self.h_length)
                                {
                                    return self.h_error_at("Expected a closing bracket", self.h_source.h_get_eof());
                                }
                                else if (self.h_tokens[self.h_offset][0] == 24)
                                {
                                    self.h_offset += 1;
                                }
                                else
                                {
                                    return self.h_error("Expected a closing bracket", self.h_tokens[self.h_offset]);
                                }
                                self.h_out_node = [UnknownEnum.Value_85, l_d4, l_node, self.h_out_node];
                                break;
                            case 35:
                                if (self.h_build_expr(0))
                                {
                                    return true;
                                }
                                var l_node2 = self.h_out_node;
                                if (self.h_offset >= self.h_length)
                                {
                                    return self.h_error_at("Expected a comma", self.h_source.h_get_eof());
                                }
                                else if (self.h_tokens[self.h_offset][0] == 5)
                                {
                                    self.h_offset += 1;
                                }
                                else
                                {
                                    return self.h_error("Expected a comma", self.h_tokens[self.h_offset]);
                                }
                                if (self.h_build_expr(0))
                                {
                                    return true;
                                }
                                if (self.h_offset >= self.h_length)
                                {
                                    return self.h_error_at("Expected a closing bracket", self.h_source.h_get_eof());
                                }
                                else if (self.h_tokens[self.h_offset][0] == 24)
                                {
                                    self.h_offset += 1;
                                }
                                else
                                {
                                    return self.h_error("Expected a closing bracket", self.h_tokens[self.h_offset]);
                                }
                                self.h_out_node = [UnknownEnum.Value_88, l_d4, l_node, l_node2, self.h_out_node];
                                break;
                            case 36:
                                if (self.h_build_expr(0))
                                {
                                    return true;
                                }
                                if (self.h_offset >= self.h_length)
                                {
                                    return self.h_error_at("Expected a closing bracket", self.h_source.h_get_eof());
                                }
                                else if (self.h_tokens[self.h_offset][0] == 24)
                                {
                                    self.h_offset += 1;
                                }
                                else
                                {
                                    return self.h_error("Expected a closing bracket", self.h_tokens[self.h_offset]);
                                }
                                self.h_out_node = [UnknownEnum.Value_91, l_d4, l_node, self.h_out_node];
                                break;
                            case 64:
                                if (self.h_build_expr(0))
                                {
                                    return true;
                                }
                                if (self.h_offset >= self.h_length)
                                {
                                    return self.h_error_at("Expected comma or a closing bracket", self.h_source.h_get_eof());
                                }
                                switch (self.h_tokens[self.h_offset][0])
                                {
                                    case UnknownEnum.Value_5:
                                        self.h_offset += 1;
                                        var l_node2 = self.h_out_node;
                                        if (self.h_build_expr(0))
                                        {
                                            return true;
                                        }
                                        if (self.h_offset >= self.h_length)
                                        {
                                            return self.h_error_at("Expected a closing bracket", self.h_source.h_get_eof());
                                        }
                                        else if (self.h_tokens[self.h_offset][0] == 24)
                                        {
                                            self.h_offset += 1;
                                        }
                                        else
                                        {
                                            return self.h_error("Expected a closing bracket", self.h_tokens[self.h_offset]);
                                        }
                                        self.h_out_node = [UnknownEnum.Value_79, l_d4, l_node, l_node2, self.h_out_node];
                                        break;
                                    case UnknownEnum.Value_24:
                                        self.h_offset += 1;
                                        self.h_out_node = [UnknownEnum.Value_76, l_d4, l_node, self.h_out_node];
                                        break;
                                    default:
                                        self.h_expect("comma or a closing bracket", self.h_tokens[self.h_offset]);
                                }
                                break;
                            case 0:
                                l_proc = false;
                                break;
                            default:
                                return self.h_error("Unknown accessor", l_tk);
                        }
                        if (!l_proc)
                        {
                            l_proc = true;
                            if (self.h_build_expr(0))
                            {
                                return true;
                            }
                            if (self.h_offset >= self.h_length)
                            {
                                return self.h_error_at("Expected comma or a closing bracket", self.h_source.h_get_eof());
                            }
                            switch (self.h_tokens[self.h_offset][0])
                            {
                                case UnknownEnum.Value_5:
                                    self.h_offset += 1;
                                    var l_node2 = self.h_out_node;
                                    if (self.h_build_expr(0))
                                    {
                                        return true;
                                    }
                                    if (self.h_offset >= self.h_length)
                                    {
                                        return self.h_error_at("Expected a closing bracket", self.h_source.h_get_eof());
                                    }
                                    else if (self.h_tokens[self.h_offset][0] == 24)
                                    {
                                        self.h_offset += 1;
                                    }
                                    else
                                    {
                                        return self.h_error("Expected a closing bracket", self.h_tokens[self.h_offset]);
                                    }
                                    self.h_out_node = [UnknownEnum.Value_73, l_d4, l_node, l_node2, self.h_out_node];
                                    break;
                                case UnknownEnum.Value_24:
                                    self.h_offset += 1;
                                    self.h_out_node = [UnknownEnum.Value_70, l_d4, l_node, self.h_out_node];
                                    break;
                                default:
                                    self.h_expect("comma or a closing bracket", self.h_tokens[self.h_offset]);
                            }
                        }
                    }
                    else
                    {
                        return self.h_error_at("Unexpected `[`", l_d4);
                    }
                    break;
                case UnknownEnum.Value_19:
                    if ((arg0 & 1) == 0)
                    {
                        if (self.h_build_ops(l_tk[1], l_tk[2]))
                        {
                            return true;
                        }
                        arg0 |= 2;
                    }
                    else
                    {
                        l_proc = false;
                    }
                    break;
                case UnknownEnum.Value_20:
                    var l__g5 = l_tk[2];
                    if (l__g5 == -1)
                    {
                        var l_p1 = l_tk[1];
                        if ((arg0 & 4) != 0)
                        {
                            var l_node = self.h_out_node;
                            self.h_offset += 1;
                            if (self.h_build_expr(0))
                            {
                                return true;
                            }
                            self.h_out_node = [UnknownEnum.Value_37, l_p1, -1, l_node, self.h_out_node];
                            l_proc = false;
                        }
                        else if ((arg0 & 1) == 0)
                        {
                            if (self.h_build_ops(l_p1, 64))
                            {
                                return true;
                            }
                            arg0 |= 2;
                        }
                        else
                        {
                            l_proc = false;
                        }
                    }
                    else
                    {
                        var l_o1 = l__g5;
                        var l_p2 = l_tk[1];
                        if ((arg0 & 4) != 0)
                        {
                            var l_node = self.h_out_node;
                            self.h_offset += 1;
                            if (self.h_build_expr(0))
                            {
                                return true;
                            }
                            self.h_out_node = [UnknownEnum.Value_37, l_p2, l_o1, l_node, self.h_out_node];
                        }
                        l_proc = false;
                    }
                    break;
                case UnknownEnum.Value_28:
                    if ((arg0 & 1) == 0)
                    {
                        var l_node = self.h_out_node;
                        self.h_offset += 1;
                        if (self.h_build_expr(0))
                        {
                            return true;
                        }
                        arg0 |= 2;
                        self.h_out_node = [UnknownEnum.Value_39, l_tk[1], l_node, self.h_out_node];
                    }
                    else
                    {
                        l_proc = false;
                    }
                    break;
                case UnknownEnum.Value_29:
                    var l_p4 = l_tk[1];
                    if ((arg0 & 4) != 0)
                    {
                        var l_node = self.h_out_node;
                        self.h_offset += 1;
                        if (self.h_build_expr(0))
                        {
                            return true;
                        }
                        self.h_out_node = [UnknownEnum.Value_37, l_p4, -1, gml_node_tools_clone(l_node), self.h_out_node];
                        var l_node2 = [UnknownEnum.Value_0, l_p4];
                        l_node = [UnknownEnum.Value_36, l_p4, 64, l_node, l_node2];
                        self.h_out_node = [UnknownEnum.Value_96, l_p4, l_node, self.h_out_node, undefined];
                    }
                    l_proc = false;
                    break;
                case UnknownEnum.Value_8:
                    if ((arg0 & 1) == 0)
                    {
                        self.h_offset += 1;
                        var l_node = self.h_out_node;
                        if (self.h_build_expr(0))
                        {
                            return true;
                        }
                        var l_node2 = self.h_out_node;
                        if (self.h_offset >= self.h_length)
                        {
                            return self.h_error_at("Expected an else-colon", self.h_source.h_get_eof());
                        }
                        else if (self.h_tokens[self.h_offset][0] == 7)
                        {
                            self.h_offset += 1;
                        }
                        else
                        {
                            return self.h_error("Expected an else-colon", self.h_tokens[self.h_offset]);
                        }
                        if (self.h_build_expr(0))
                        {
                            return true;
                        }
                        self.h_out_node = [UnknownEnum.Value_97, l_tk[1], l_node, l_node2, self.h_out_node];
                    }
                    else
                    {
                        l_proc = false;
                    }
                    break;
                default:
                    l_proc = false;
            }
        }
        return false;
    };
    
    static h_build_line_inner = function(arg0)
    {
        if (self.h_offset >= self.h_length)
        {
            return self.h_error_at("Expected a statement", self.h_source.h_get_eof());
        }
        var l_tk = self.h_tokens[self.h_offset++];
        var l_unknown = false;
        switch (l_tk[0])
        {
            case UnknownEnum.Value_12:
                if (l_tk[2] == "static")
                {
                    var l_d = l_tk[1];
                    var l__g = self.h_tokens[self.h_offset];
                    if (l__g[0] == 12)
                    {
                        var l_nodes = [];
                        var l_proc = true;
                        while (l_proc && self.h_offset < self.h_length)
                        {
                            var l_tk2 = self.h_tokens[self.h_offset++];
                            switch (l_tk2[0])
                            {
                                case UnknownEnum.Value_11:
                                    if (l_tk2[2] == 2)
                                    {
                                        var l_d1 = l_tk2[1];
                                    }
                                    else
                                    {
                                        return self.h_expect("a static variable name", l_tk2);
                                    }
                                    break;
                                case UnknownEnum.Value_12:
                                    var l_id = l_tk2[2];
                                    if (self.h_offset >= self.h_length)
                                    {
                                        return self.h_error_at("Expected a static variable value", self.h_source.h_get_eof());
                                    }
                                    l_tk = self.h_tokens[self.h_offset];
                                    if (self.h_offset >= self.h_length)
                                    {
                                        return self.h_error_at("Expected a static variable value", self.h_source.h_get_eof());
                                    }
                                    else
                                    {
                                        l__g = self.h_tokens[self.h_offset];
                                        if (l__g[0] == 20)
                                        {
                                            if (l__g[2] == -1)
                                            {
                                                self.h_offset += 1;
                                            }
                                            else
                                            {
                                                return self.h_error("Expected a static variable value", self.h_tokens[self.h_offset]);
                                            }
                                        }
                                        else
                                        {
                                            return self.h_error("Expected a static variable value", self.h_tokens[self.h_offset]);
                                        }
                                    }
                                    if (self.h_build_expr(0))
                                    {
                                        return true;
                                    }
                                    var l_scr = self.h_current_script_ref;
                                    if (variable_struct_exists(l_scr.h_static_map, l_id))
                                    {
                                        return self.h_error("Re-declaration of static variable " + l_id, l_tk2);
                                    }
                                    array_push(l_scr.h_static_names, l_id);
                                    variable_struct_set(l_scr.h_static_map, l_id, l_scr.h_static_count++);
                                    array_push(l_scr.h_static_init, [UnknownEnum.Value_47, l_tk2[1], l_id, self.h_out_node, true]);
                                    array_push(l_scr.h_static_values, undefined);
                                    if (self.h_offset < self.h_length)
                                    {
                                        switch (self.h_tokens[self.h_offset][0])
                                        {
                                            case UnknownEnum.Value_5:
                                                self.h_offset += 1;
                                                break;
                                            case UnknownEnum.Value_4:
                                                self.h_offset += 1;
                                                l_proc = false;
                                                break;
                                            default:
                                                l_proc = false;
                                        }
                                    }
                                    break;
                                default:
                                    return self.h_expect("a static variable name", l_tk2);
                            }
                        }
                        if (array_length(l_nodes) != 1)
                        {
                            self.h_out_node = [UnknownEnum.Value_95, l_d, l_nodes];
                        }
                        else
                        {
                            self.h_out_node = l_nodes[0];
                        }
                    }
                    else
                    {
                        l_unknown = true;
                    }
                }
                else
                {
                    l_unknown = true;
                }
                break;
            case UnknownEnum.Value_11:
                var l__g = l_tk[1];
                switch (l_tk[2])
                {
                    case 1:
                        var l_d = l__g;
                        var l_nodes = [];
                        var l_x1 = [UnknownEnum.Value_95, l_d, l_nodes];
                        while (self.h_offset < self.h_length)
                        {
                            var l_tk2 = self.h_tokens[self.h_offset++];
                            if (l_tk2[0] == 12)
                            {
                                l_d = l_tk2[1];
                                var l_s = l_tk2[2];
                                array_push(self.h_global_vars, l_s);
                                var l_i = array_length(self.h_macro_names);
                                array_set(self.h_macro_names, l_i, l_s);
                                array_set(self.h_macro_nodes, l_i, new gml_macro(l_s, [UnknownEnum.Value_49, l_d, l_s], true, false));
                                var l__g1 = self.h_tokens[self.h_offset];
                                if (l__g1[0] == 20)
                                {
                                    if (l__g1[2] == -1)
                                    {
                                        self.h_offset += 1;
                                        if (self.h_build_expr(0))
                                        {
                                            return true;
                                        }
                                        var l_x = [UnknownEnum.Value_50, l_d, l_s, self.h_out_node];
                                        array_push(l_nodes, l_x);
                                    }
                                }
                                if (self.h_tokens[self.h_offset][0] == 5)
                                {
                                    self.h_offset += 1;
                                    continue;
                                }
                            }
                            else
                            {
                                return self.h_error("Expected a global variable name.", l_tk2);
                            }
                            break;
                        }
                        self.h_out_node = l_x1;
                        break;
                    case 2:
                        var l_d = l__g;
                        var l_nodes = [];
                        var l_proc = true;
                        while (l_proc && self.h_offset < self.h_length)
                        {
                            var l_tk2 = self.h_tokens[self.h_offset++];
                            switch (l_tk2[0])
                            {
                                case UnknownEnum.Value_11:
                                    if (l_tk2[2] == 2)
                                    {
                                        var l_d1 = l_tk2[1];
                                    }
                                    else
                                    {
                                        return self.h_expect("a variable name", l_tk2);
                                    }
                                    break;
                                case UnknownEnum.Value_12:
                                    if (self.h_offset >= self.h_length)
                                    {
                                        return self.h_error_at("Expected a variable value", self.h_source.h_get_eof());
                                    }
                                    l_tk = self.h_tokens[self.h_offset];
                                    if (l_tk[0] == 20)
                                    {
                                        if (l_tk[2] == -1)
                                        {
                                            self.h_offset += 1;
                                            if (self.h_build_expr(0))
                                            {
                                                return true;
                                            }
                                        }
                                        else
                                        {
                                            self.h_out_node = undefined;
                                        }
                                    }
                                    else
                                    {
                                        self.h_out_node = undefined;
                                    }
                                    array_push(l_nodes, [UnknownEnum.Value_94, l_tk2[1], l_tk2[2], self.h_out_node]);
                                    if (self.h_offset < self.h_length)
                                    {
                                        switch (self.h_tokens[self.h_offset][0])
                                        {
                                            case UnknownEnum.Value_5:
                                                self.h_offset += 1;
                                                break;
                                            case UnknownEnum.Value_4:
                                                self.h_offset += 1;
                                                l_proc = false;
                                                break;
                                            default:
                                                l_proc = false;
                                        }
                                    }
                                    break;
                                default:
                                    return self.h_expect("a variable name", l_tk2);
                            }
                        }
                        if (array_length(l_nodes) != 1)
                        {
                            self.h_out_node = [UnknownEnum.Value_95, l_d, l_nodes];
                        }
                        else
                        {
                            self.h_out_node = l_nodes[0];
                        }
                        break;
                    case 3:
                        var l__g1 = self.h_tokens[self.h_offset];
                        var l_e;
                        if (l__g1[0] == 12)
                        {
                            var l_d1 = l__g1[1];
                            var l_s1 = l__g1[2];
                            self.h_offset += 1;
                            l_e = new gml_enum(l_s1, l_d1);
                        }
                        else
                        {
                            return self.h_error("Expected an enum name", self.h_tokens[self.h_offset]);
                        }
                        if (self.h_offset >= self.h_length)
                        {
                            return self.h_error_at("Expected enum block", self.h_source.h_get_eof());
                        }
                        else if (self.h_tokens[self.h_offset][0] == 25)
                        {
                            self.h_offset += 1;
                        }
                        else
                        {
                            return self.h_error("Expected enum block", self.h_tokens[self.h_offset]);
                        }
                        var l_proc = true;
                        var l_sep = true;
                        while (self.h_offset < self.h_length && l_proc)
                        {
                            l__g1 = self.h_tokens[self.h_offset];
                            switch (l__g1[0])
                            {
                                case UnknownEnum.Value_26:
                                    self.h_offset += 1;
                                    l_proc = false;
                                    break;
                                case UnknownEnum.Value_5:
                                    if (l_sep)
                                    {
                                        return self.h_error("Unexpected comma", self.h_tokens[self.h_offset]);
                                    }
                                    else
                                    {
                                        self.h_offset += 1;
                                        l_sep = true;
                                    }
                                    break;
                                case UnknownEnum.Value_12:
                                    if (l_sep)
                                    {
                                        self.h_offset += 1;
                                        var l__g3 = self.h_tokens[self.h_offset];
                                        if (l__g3[0] == 20)
                                        {
                                            if (l__g3[2] == -1)
                                            {
                                                self.h_offset += 1;
                                                if (self.h_build_expr(0))
                                                {
                                                    return true;
                                                }
                                            }
                                            else
                                            {
                                                self.h_out_node = undefined;
                                            }
                                        }
                                        else
                                        {
                                            self.h_out_node = undefined;
                                        }
                                        var l_ec = new gml_enum_ctr(l__g1[2], l__g1[1], self.h_out_node);
                                        array_push(l_e.h_ctr_list, l_ec);
                                        variable_struct_set(l_e.h_ctr_map, l_ec.h_name, l_ec);
                                        l_sep = false;
                                    }
                                    else
                                    {
                                        return self.h_expect("a comma or a closing bracket", self.h_tokens[self.h_offset]);
                                    }
                                    break;
                                default:
                                    return self.h_expect("a comma, enum entry, or closing bracket", self.h_tokens[self.h_offset]);
                            }
                        }
                        if (l_proc)
                        {
                            return self.h_error("Unclosed enum-block", l_tk);
                        }
                        array_push(self.h_enums, l_e);
                        self.h_out_node = [UnknownEnum.Value_95, l__g, []];
                        break;
                    case 4:
                        if (self.h_build_expr(0))
                        {
                            return true;
                        }
                        var l_x1 = self.h_out_node;
                        if (self.h_offset >= self.h_length)
                        {
                            return self.h_error_at("Expected a then-expression", self.h_source.h_get_eof());
                        }
                        var l__g1 = self.h_tokens[self.h_offset];
                        if (l__g1[0] == 11)
                        {
                            if (l__g1[2] == 5)
                            {
                                self.h_offset += 1;
                            }
                        }
                        if (self.h_build_line())
                        {
                            return true;
                        }
                        var l_x2 = self.h_out_node;
                        var l_i = self.h_offset;
                        var l_x;
                        if (self.h_offset < self.h_length)
                        {
                            l__g1 = self.h_tokens[self.h_offset];
                            if (l__g1[0] == 11)
                            {
                                if (l__g1[2] == 6)
                                {
                                    self.h_offset += 1;
                                    if (self.h_build_line())
                                    {
                                        return true;
                                    }
                                    l_x = self.h_out_node;
                                }
                                else
                                {
                                    self.h_offset = l_i;
                                    l_x = undefined;
                                }
                            }
                            else
                            {
                                self.h_offset = l_i;
                                l_x = undefined;
                            }
                        }
                        else
                        {
                            self.h_offset = l_i;
                            l_x = undefined;
                        }
                        self.h_out_node = [UnknownEnum.Value_96, l__g, l_x1, l_x2, l_x];
                        break;
                    case 7:
                        var l_d = l__g;
                        if (self.h_build_expr(0))
                        {
                            return true;
                        }
                        var l_x1 = self.h_out_node;
                        var l_cc = [];
                        var l_c = undefined;
                        if (self.h_offset >= self.h_length)
                        {
                            return self.h_error_at("Expected switch-block body", self.h_source.h_get_eof());
                        }
                        else if (self.h_tokens[self.h_offset][0] == 25)
                        {
                            self.h_offset += 1;
                        }
                        else
                        {
                            return self.h_error("Expected switch-block body", self.h_tokens[self.h_offset]);
                        }
                        if (self.h_offset >= self.h_length)
                        {
                            return self.h_error_at("Expected switch-block contents", self.h_source.h_get_eof());
                        }
                        var l__g1 = self.h_tokens[self.h_offset];
                        if (l__g1[0] == 11)
                        {
                            switch (l__g1[2])
                            {
                                case 8:
                                case 9:
                                    break;
                                default:
                                    return self.h_expect("`case` or `default`", self.h_tokens[self.h_offset]);
                            }
                        }
                        else
                        {
                            return self.h_expect("`case` or `default`", self.h_tokens[self.h_offset]);
                        }
                        var l_proc = true;
                        var l_x2 = undefined;
                        var l_nodes = undefined;
                        var l_pre = [];
                        while (self.h_offset < self.h_length && l_proc)
                        {
                            l__g1 = self.h_tokens[self.h_offset];
                            switch (l__g1[0])
                            {
                                case UnknownEnum.Value_26:
                                    self.h_offset += 1;
                                    l_proc = false;
                                    break;
                                case UnknownEnum.Value_11:
                                    switch (l__g1[2])
                                    {
                                        case 8:
                                            self.h_offset += 1;
                                            if (self.h_build_expr(0))
                                            {
                                                return true;
                                            }
                                            if (self.h_offset >= self.h_length)
                                            {
                                                return self.h_error_at("Expected a colon", self.h_source.h_get_eof());
                                            }
                                            else if (self.h_tokens[self.h_offset][0] == 7)
                                            {
                                                self.h_offset += 1;
                                            }
                                            else
                                            {
                                                return self.h_error("Expected a colon", self.h_tokens[self.h_offset]);
                                            }
                                            l_nodes = [self.h_out_node];
                                            while (self.h_offset < self.h_length)
                                            {
                                                var l__g5 = self.h_tokens[self.h_offset];
                                                if (l__g5[0] == 11)
                                                {
                                                    if (l__g5[2] == 8)
                                                    {
                                                        self.h_offset += 1;
                                                        if (self.h_build_expr(0))
                                                        {
                                                            return true;
                                                        }
                                                        if (self.h_offset >= self.h_length)
                                                        {
                                                            return self.h_error_at("Expected a colon", self.h_source.h_get_eof());
                                                        }
                                                        else if (self.h_tokens[self.h_offset][0] == 7)
                                                        {
                                                            self.h_offset += 1;
                                                        }
                                                        else
                                                        {
                                                            return self.h_error("Expected a colon", self.h_tokens[self.h_offset]);
                                                        }
                                                        array_push(l_nodes, self.h_out_node);
                                                        continue;
                                                    }
                                                }
                                                break;
                                            }
                                            l_c = 
                                            {
                                                values: l_nodes,
                                                expr: undefined,
                                                pre: l_pre
                                            };
                                            array_push(l_cc, l_c);
                                            l_nodes = [];
                                            l_pre = [];
                                            l_c.expr = [UnknownEnum.Value_95, l__g1[1], l_nodes];
                                            break;
                                        case 9:
                                            self.h_offset += 1;
                                            if (self.h_offset >= self.h_length)
                                            {
                                                return self.h_error_at("Expected a colon", self.h_source.h_get_eof());
                                            }
                                            else if (self.h_tokens[self.h_offset][0] == 7)
                                            {
                                                self.h_offset += 1;
                                            }
                                            else
                                            {
                                                return self.h_error("Expected a colon", self.h_tokens[self.h_offset]);
                                            }
                                            l_nodes = [];
                                            l_x2 = [UnknownEnum.Value_95, l__g1[1], l_nodes];
                                            break;
                                        default:
                                            if (self.h_build_line())
                                            {
                                                return true;
                                            }
                                            array_push(l_nodes, self.h_out_node);
                                            break;
                                            continue;
                                    }
                                    break;
                                default:
                                    if (self.h_build_line())
                                    {
                                        return true;
                                    }
                            }
                        }
                        if (l_proc)
                        {
                            return self.h_error_at("Unclosed switch-block", l_d);
                        }
                        self.h_out_node = [UnknownEnum.Value_98, l_d, l_x1, l_cc, l_x2];
                        break;
                    case 14:
                        var l_d = l__g;
                        if (self.h_offset >= self.h_length)
                        {
                            return self.h_error_at("Expected for-loop header", self.h_source.h_get_eof());
                        }
                        var l_proc;
                        if (self.h_tokens[self.h_offset][0] == 21)
                        {
                            self.h_offset += 1;
                            l_proc = true;
                        }
                        else
                        {
                            l_proc = false;
                        }
                        if (self.h_offset >= self.h_length)
                        {
                            return self.h_error_at("Expected for-loop init", self.h_source.h_get_eof());
                        }
                        var l_x;
                        if (self.h_tokens[self.h_offset][0] == 4)
                        {
                            self.h_offset += 1;
                            l_x = [UnknownEnum.Value_95, l_d, []];
                        }
                        else
                        {
                            if (self.h_build_line_inner(true))
                            {
                                return true;
                            }
                            l_x = self.h_out_node;
                            if (self.h_tokens[self.h_offset][0] == 4)
                            {
                                self.h_offset += 1;
                            }
                        }
                        if (self.h_offset >= self.h_length)
                        {
                            return self.h_error_at("Expected for-loop condition", self.h_source.h_get_eof());
                        }
                        var l_x1;
                        if (self.h_tokens[self.h_offset][0] == 4)
                        {
                            self.h_offset += 1;
                            l_x1 = [UnknownEnum.Value_1, l_d, true];
                        }
                        else
                        {
                            if (self.h_build_expr(0))
                            {
                                return true;
                            }
                            l_x1 = self.h_out_node;
                            if (self.h_offset >= self.h_length)
                            {
                                return self.h_error_at("Expected for-loop post-action", self.h_source.h_get_eof());
                            }
                            if (self.h_tokens[self.h_offset][0] == 4)
                            {
                                self.h_offset += 1;
                            }
                        }
                        if (self.h_offset >= self.h_length)
                        {
                            return self.h_error_at("Expected for-loop post-action", self.h_source.h_get_eof());
                        }
                        var l_x2;
                        if (l_proc)
                        {
                            if (self.h_tokens[self.h_offset][0] == 22)
                            {
                                self.h_offset += 1;
                                l_proc = false;
                                l_x2 = [UnknownEnum.Value_95, l_d, []];
                            }
                            else
                            {
                                if (self.h_build_line())
                                {
                                    return true;
                                }
                                l_x2 = self.h_out_node;
                            }
                        }
                        else
                        {
                            if (self.h_build_line())
                            {
                                return true;
                            }
                            l_x2 = self.h_out_node;
                        }
                        if (l_proc)
                        {
                            if (self.h_tokens[self.h_offset][0] == 22)
                            {
                                self.h_offset += 1;
                            }
                            else
                            {
                                return self.h_expect("a closing parenthesis", self.h_tokens[self.h_offset]);
                            }
                        }
                        if (self.h_build_line())
                        {
                            return true;
                        }
                        self.h_out_node = [UnknownEnum.Value_105, l_d, l_x, l_x1, l_x2, self.h_out_node];
                        break;
                    case 11:
                        if (self.h_build_expr(0))
                        {
                            return true;
                        }
                        var l_x1 = self.h_out_node;
                        if (self.h_build_line())
                        {
                            return true;
                        }
                        self.h_out_node = [UnknownEnum.Value_101, l__g, l_x1, self.h_out_node];
                        break;
                    case 10:
                        if (self.h_build_expr(0))
                        {
                            return true;
                        }
                        var l_x1 = self.h_out_node;
                        if (self.h_build_line())
                        {
                            return true;
                        }
                        self.h_out_node = [UnknownEnum.Value_104, l__g, l_x1, self.h_out_node];
                        break;
                    case 13:
                        var l_d = l__g;
                        if (self.h_build_line())
                        {
                            return true;
                        }
                        var l_x1 = self.h_out_node;
                        if (self.h_offset >= self.h_length)
                        {
                            return self.h_error_at("Expected a `while` or `until`", self.h_source.h_get_eof());
                        }
                        var l__g1 = self.h_tokens[self.h_offset];
                        if (l__g1[0] == 11)
                        {
                            switch (l__g1[2])
                            {
                                case 11:
                                    self.h_offset += 1;
                                    if (self.h_build_expr(0))
                                    {
                                        return true;
                                    }
                                    self.h_out_node = [UnknownEnum.Value_103, l_d, l_x1, self.h_out_node];
                                    break;
                                case 12:
                                    self.h_offset += 1;
                                    if (self.h_build_expr(0))
                                    {
                                        return true;
                                    }
                                    self.h_out_node = [UnknownEnum.Value_102, l_d, l_x1, self.h_out_node];
                                    break;
                                default:
                                    return self.h_expect("a `while` or `until`", self.h_tokens[self.h_offset]);
                            }
                        }
                        else
                        {
                            return self.h_expect("a `while` or `until`", self.h_tokens[self.h_offset]);
                        }
                        break;
                    case 15:
                        if (self.h_build_expr(0))
                        {
                            return true;
                        }
                        var l_x1 = self.h_out_node;
                        if (self.h_build_line())
                        {
                            return true;
                        }
                        self.h_out_node = [UnknownEnum.Value_106, l__g, l_x1, self.h_out_node];
                        break;
                    case 17:
                        self.h_out_node = [UnknownEnum.Value_110, l__g];
                        break;
                    case 16:
                        self.h_out_node = [UnknownEnum.Value_111, l__g];
                        break;
                    case 19:
                        self.h_out_node = [UnknownEnum.Value_109, l__g];
                        break;
                    case 18:
                        var l_d = l__g;
                        if (self.h_offset < self.h_length)
                        {
                            var l__g1 = self.h_tokens[self.h_offset];
                            switch (l__g1[0])
                            {
                                case UnknownEnum.Value_4:
                                    self.h_out_node = [UnknownEnum.Value_109, l__g1[1]];
                                    break;
                                case UnknownEnum.Value_26:
                                    self.h_out_node = [UnknownEnum.Value_109, l__g1[1]];
                                    break;
                                default:
                                    if (self.h_build_expr(0))
                                    {
                                        return true;
                                    }
                                    self.h_out_node = [UnknownEnum.Value_108, l_d, self.h_out_node];
                            }
                        }
                        else
                        {
                            self.h_out_node = [UnknownEnum.Value_109, l_d];
                        }
                        break;
                    case 29:
                        if (self.h_build_expr(0))
                        {
                            return true;
                        }
                        self.h_out_node = [UnknownEnum.Value_38, l__g, self.h_out_node];
                        break;
                    case 20:
                        if (self.h_build_expr(0))
                        {
                            return true;
                        }
                        self.h_out_node = [UnknownEnum.Value_99, l__g, self.h_out_node];
                        break;
                    case 28:
                        self.h_out_node = [UnknownEnum.Value_112, l__g];
                        break;
                    case 21:
                        if (self.h_build_line())
                        {
                            return true;
                        }
                        var l_x1 = self.h_out_node;
                        if (self.h_offset >= self.h_length)
                        {
                            return self.h_error_at("Expected a catch-block", self.h_source.h_get_eof());
                        }
                        else
                        {
                            var l__g1 = self.h_tokens[self.h_offset];
                            if (l__g1[0] == 11)
                            {
                                if (l__g1[2] == 22)
                                {
                                    self.h_offset += 1;
                                }
                                else
                                {
                                    return self.h_error("Expected a catch-block", self.h_tokens[self.h_offset]);
                                }
                            }
                            else
                            {
                                return self.h_error("Expected a catch-block", self.h_tokens[self.h_offset]);
                            }
                        }
                        var l_proc;
                        if (self.h_tokens[self.h_offset][0] == 21)
                        {
                            self.h_offset += 1;
                            l_proc = true;
                        }
                        else
                        {
                            l_proc = false;
                        }
                        var l_s;
                        if (self.h_offset >= self.h_length)
                        {
                            return self.h_error_at("Expected a capture variable name", self.h_source.h_get_eof());
                        }
                        else
                        {
                            var l__g1 = self.h_tokens[self.h_offset];
                            if (l__g1[0] == 12)
                            {
                                self.h_offset += 1;
                                l_s = l__g1[2];
                            }
                            else
                            {
                                return self.h_error("Expected a capture variable name", self.h_tokens[self.h_offset]);
                            }
                        }
                        if (l_proc)
                        {
                            if (self.h_offset >= self.h_length)
                            {
                                return self.h_error_at("Expected a closing parenthesis", self.h_source.h_get_eof());
                            }
                            else if (self.h_tokens[self.h_offset][0] == 22)
                            {
                                self.h_offset += 1;
                            }
                            else
                            {
                                return self.h_error("Expected a closing parenthesis", self.h_tokens[self.h_offset]);
                            }
                        }
                        if (self.h_build_line())
                        {
                            return true;
                        }
                        self.h_out_node = [UnknownEnum.Value_113, l__g, l_x1, l_s, self.h_out_node];
                        break;
                    case 23:
                        if (self.h_build_expr(0))
                        {
                            return true;
                        }
                        self.h_out_node = [UnknownEnum.Value_114, l__g, self.h_out_node];
                        break;
                    default:
                        l_unknown = true;
                }
                break;
            case UnknownEnum.Value_2:
                var l__g = self.h_tokens[self.h_offset++];
                if (l__g[0] == 12)
                {
                    var l_s1 = l__g[2];
                    var l_add;
                    if (self.h_tokens[self.h_offset][0] == 7)
                    {
                        self.h_offset += 1;
                        l_add = l_s1 == global.live_config;
                        l__g = self.h_tokens[self.h_offset++];
                        if (l__g[0] == 12)
                        {
                            l_s1 = l__g[2];
                        }
                        else
                        {
                            return self.h_error("Expected a macro name", self.h_tokens[self.h_offset]);
                        }
                    }
                    else
                    {
                        l_add = true;
                    }
                    if (self.h_build_expr(0))
                    {
                        return true;
                    }
                    if (l_add)
                    {
                        var l_i1 = gml_std_gml_internal_ArrayImpl_indexOf(self.h_macro_names, l_s1);
                        if (l_i1 < 0)
                        {
                            l_i1 = array_length(self.h_macro_names);
                            array_set(self.h_macro_names, l_i1, l_s1);
                        }
                        array_set(self.h_macro_nodes, l_i1, new gml_macro(l_s1, self.h_out_node, true, gml_node_tools_is_statement(self.h_out_node)));
                    }
                    self.h_out_node = [UnknownEnum.Value_95, l_tk[1], []];
                }
                else
                {
                    return self.h_error("Expected a macro name", self.h_tokens[self.h_offset]);
                }
                break;
            case UnknownEnum.Value_25:
                var l_start = l_tk[1];
                if (!arg0)
                {
                    switch (self.h_tokens[self.h_offset][0])
                    {
                        case UnknownEnum.Value_16:
                            self.h_offset -= 1;
                            return self.h_build_expr(0);
                        case UnknownEnum.Value_12:
                            if ((self.h_offset + 1) < self.h_length)
                            {
                                if (self.h_tokens[self.h_offset + 1][0] == 7)
                                {
                                    self.h_offset -= 1;
                                    return self.h_build_expr(0);
                                }
                            }
                            break;
                    }
                }
                var l_proc = true;
                var l_nodes = [];
                while (l_proc && self.h_offset < self.h_length)
                {
                    if (self.h_tokens[self.h_offset][0] == 26)
                    {
                        self.h_offset += 1;
                        l_proc = false;
                    }
                    else
                    {
                        if (self.h_build_line())
                        {
                            return true;
                        }
                        array_push(l_nodes, self.h_out_node);
                    }
                }
                if (l_proc)
                {
                    return self.h_error_at("Expected a closing bracket.", l_start);
                }
                self.h_out_node = [UnknownEnum.Value_95, l_start, l_nodes];
                break;
            default:
                l_unknown = true;
        }
        if (l_unknown)
        {
            self.h_offset -= 1;
        }
        else
        {
            global.gml_builder_build_line_is_stat = true;
            global.gml_builder_build_line_is_expr = false;
        }
        if (l_unknown)
        {
            var l_flags = 4;
            if (arg0)
            {
                l_flags |= 1;
            }
            if (self.h_build_expr(l_flags))
            {
                return true;
            }
            global.gml_builder_build_line_is_stat = gml_node_tools_is_statement(self.h_out_node);
            global.gml_builder_build_line_is_expr = true;
            if (arg0 && !global.gml_builder_build_line_is_stat)
            {
                return self.h_expect_node("a statement", self.h_out_node);
            }
        }
        return false;
    };
    
    static h_build_line = function(arg0 = true)
    {
        if (self.h_build_line_inner(arg0))
        {
            return true;
        }
        while (self.h_offset < self.h_length)
        {
            if (self.h_tokens[self.h_offset][0] == 4)
            {
                self.h_offset += 1;
                continue;
            }
            break;
        }
        return false;
    };
    
    static h_build_top_level_script = function(arg0, arg1, arg2, arg3, arg4)
    {
        return self.h_build_top_level_script_body(self.h_add_script(arg0, arg1, arg2, arg3, arg4));
    };
    
    static h_add_script = function(arg0, arg1, arg2, arg3, arg4)
    {
        var l_scr = new gml_script(self.h_source, arg0, (self.h_offset >= self.h_length) ? self.h_source.h_get_eof() : self.h_tokens[self.h_offset][1]);
        if (arg1 == undefined)
        {
            arg1 = {};
        }
        l_scr.h_named_args = arg1;
        l_scr.h_arguments = arg2;
        l_scr.h_is_function = arg3;
        l_scr.h_prefix_statements = arg4;
        array_push(self.h_scripts, l_scr);
        return l_scr;
    };
    
    static h_build_top_level_script_body = function(arg0)
    {
        if (global.compile_groups_gml_compile_group_static_has_statics)
        {
            var l_fn = variable_struct_get(global.gml_func_map, arg0.h_name);
            if (l_fn != undefined)
            {
                arg0.h_script_id = l_fn.h_raw_func;
            }
        }
        var l_prefixStatements = arg0.h_prefix_statements;
        arg0.h_prefix_statements = undefined;
        var l__scriptName = self.h_current_script;
        var l__scriptRef = self.h_current_script_ref;
        self.h_current_script = arg0.h_name;
        self.h_current_script_ref = arg0;
        var l_nodes;
        if (arg0.h_is_function)
        {
            if (self.h_build_line())
            {
                return true;
            }
            var l_scrNode = self.h_out_node;
            if (l_prefixStatements != undefined)
            {
                array_push(l_prefixStatements, l_scrNode);
                l_scrNode = [UnknownEnum.Value_95, gml_std_haxe_enum_tools_getParameter(l_scrNode, 0), l_prefixStatements];
            }
            arg0.h_node = l_scrNode;
            arg0 = self.h_scripts[0];
            var l__g = arg0.h_node;
            if (l__g[0] == 95)
            {
                l_nodes = l__g[2];
            }
            else
            {
                l_nodes = [arg0.h_node];
            }
        }
        else if (l_prefixStatements != undefined)
        {
            l_nodes = l_prefixStatements;
        }
        else
        {
            l_nodes = [];
        }
        while (self.h_offset < self.h_length)
        {
            var l__g = self.h_tokens[self.h_offset];
            switch (l__g[0])
            {
                case UnknownEnum.Value_0:
                    break;
                case UnknownEnum.Value_11:
                    if (l__g[2] != 24)
                    {
                        if (self.h_build_line())
                        {
                            return true;
                        }
                        array_push(l_nodes, self.h_out_node);
                        continue;
                    }
                    break;
                default:
                    if (self.h_build_line())
                    {
                        return true;
                    }
                    array_push(l_nodes, self.h_out_node);
                    continue;
            }
            break;
        }
        if (array_length(l_nodes) > 1)
        {
            arg0.h_node = [UnknownEnum.Value_95, gml_std_haxe_enum_tools_getParameter(l_nodes[0], 0), l_nodes];
        }
        else if (array_length(l_nodes) == 1)
        {
            arg0.h_node = l_nodes[0];
        }
        else
        {
            arg0.h_node = [UnknownEnum.Value_95, self.h_source.h_get_eof(), l_nodes];
        }
        self.h_current_script = l__scriptName;
        self.h_current_script_ref = l__scriptRef;
        return false;
    };
    
    static h_build_script_args = function()
    {
        var l_nextArgs = {};
        var l_nextArgc = 0;
        var l_proc = true;
        var l_nextPrefix = undefined;
        if (self.h_offset >= self.h_length)
        {
            return self.h_error_at("Expected script arguments", self.h_source.h_get_eof());
        }
        var l__g = self.h_tokens[self.h_offset];
        if (l__g[0] == 22)
        {
            self.h_offset += 1;
        }
        else
        {
            while (l_proc && self.h_offset < self.h_length)
            {
                l__g = self.h_tokens[self.h_offset];
                if (l__g[0] == 12)
                {
                    var l_argName = l__g[2];
                    var l_nextArg = l_argName;
                    if (variable_struct_exists(l_nextArgs, l_nextArg))
                    {
                        return self.h_error("An argument named " + l_nextArg + " is already defined at position " + gml_std_Std_stringify(variable_struct_get(l_nextArgs, l_nextArg)), self.h_tokens[self.h_offset]);
                    }
                    var l_argIndex = l_nextArgc++;
                    variable_struct_set(l_nextArgs, l_argName, l_argIndex);
                    self.h_offset += 1;
                    var l__g2 = self.h_tokens[self.h_offset];
                    if (l__g2[0] == 20)
                    {
                        if (l__g2[2] == -1)
                        {
                            var l_defPos = l__g2[1];
                            self.h_offset += 1;
                            if (self.h_build_expr(0))
                            {
                                return true;
                            }
                            var l_ifNode = [UnknownEnum.Value_96, l_defPos, [UnknownEnum.Value_36, l_defPos, 64, [UnknownEnum.Value_20, l_defPos, l_argIndex], [UnknownEnum.Value_0, l_defPos]], [UnknownEnum.Value_37, l_defPos, -1, [UnknownEnum.Value_20, l_defPos, l_argIndex], self.h_out_node], undefined];
                            if (l_nextPrefix == undefined)
                            {
                                l_nextPrefix = [];
                            }
                            array_push(l_nextPrefix, l_ifNode);
                        }
                    }
                    switch (self.h_tokens[self.h_offset][0])
                    {
                        case UnknownEnum.Value_22:
                            self.h_offset += 1;
                            l_proc = false;
                            break;
                        case UnknownEnum.Value_5:
                            self.h_offset += 1;
                            break;
                        default:
                            return self.h_expect("a comma or closing parenthesis in script arguments", self.h_tokens[self.h_offset]);
                    }
                }
                else
                {
                    return self.h_expect("an argument", self.h_tokens[self.h_offset]);
                }
            }
        }
        self.h_build_script_args_map = l_nextArgs;
        self.h_build_script_args_argc = l_nextArgc;
        self.h_build_script_args_prefix = l_nextPrefix;
        return false;
    };
    
    static h_build_script_args_prefix = undefined;
    static h_build_script_args_map = undefined;
    static h_build_script_args_argc = undefined;
    
    static h_build_inherit = function()
    {
        if (self.h_offset >= self.h_length)
        {
            return self.h_error_at("Expected a parent function name", self.h_source.h_get_eof());
        }
        var l_tk = self.h_tokens[self.h_offset++];
        switch (l_tk[0])
        {
            case UnknownEnum.Value_12:
                self.h_build_inherit_is_global = false;
                self.h_build_inherit_parent = l_tk[2];
                break;
            case UnknownEnum.Value_11:
                if (l_tk[2] == 0)
                {
                    if (self.h_offset >= self.h_length)
                    {
                        return self.h_error_at("Expected a `.` after `global.`", self.h_source.h_get_eof());
                    }
                    else if (self.h_tokens[self.h_offset][0] == 6)
                    {
                        self.h_offset += 1;
                    }
                    else
                    {
                        return self.h_error("Expected a `.` after `global.`", self.h_tokens[self.h_offset]);
                    }
                    if (self.h_offset >= self.h_length)
                    {
                        return self.h_error_at("Expected a global variable name", self.h_source.h_get_eof());
                    }
                    else
                    {
                        var l__g = self.h_tokens[self.h_offset];
                        if (l__g[0] == 12)
                        {
                            self.h_offset += 1;
                            self.h_build_inherit_is_global = true;
                            self.h_build_inherit_parent = l__g[2];
                        }
                        else
                        {
                            return self.h_error("Expected a global variable name", self.h_tokens[self.h_offset]);
                        }
                    }
                }
                else
                {
                    return self.h_expect("a parent function name", l_tk);
                }
                break;
            default:
                return self.h_expect("a parent function name", l_tk);
        }
        if (self.h_offset >= self.h_length)
        {
            return self.h_error_at("Expected an opening `(` for inheritance call", self.h_source.h_get_eof());
        }
        else if (self.h_tokens[self.h_offset][0] == 21)
        {
            self.h_offset += 1;
        }
        else
        {
            return self.h_error("Expected an opening `(` for inheritance call", self.h_tokens[self.h_offset]);
        }
        if (self.h_build_script_args())
        {
            return true;
        }
        return false;
    };
    
    static h_build_inherit_is_global = undefined;
    static h_build_inherit_parent = undefined;
    
    static h_build_loop = function(arg0)
    {
        if (self.h_build_top_level_script(arg0, undefined, 0, false, undefined))
        {
            return true;
        }
        var l_hasFirstFunc = false;
        while (self.h_offset < self.h_length)
        {
            var l_tk = self.h_tokens[self.h_offset];
            switch (l_tk[0])
            {
                case UnknownEnum.Value_0:
                    self.h_offset += 1;
                    var l_nextName = l_tk[2];
                    var l_nextArgs = undefined;
                    var l_nextArgc = 0;
                    var l_nextPrefix = undefined;
                    if (!(l_tk[3] || self.h_offset >= self.h_length))
                    {
                        var l__g1 = self.h_tokens[self.h_offset];
                        if (l__g1[0] == 21)
                        {
                            self.h_offset += 1;
                            if (self.h_build_script_args())
                            {
                                return true;
                            }
                            l_nextArgs = self.h_build_script_args_map;
                            l_nextArgc = self.h_build_script_args_argc;
                            l_nextPrefix = self.h_build_script_args_prefix;
                            self.h_build_script_args_map = undefined;
                        }
                    }
                    if (self.h_build_top_level_script(l_nextName, l_nextArgs, l_nextArgc, false, l_nextPrefix))
                    {
                        return true;
                    }
                    break;
                case UnknownEnum.Value_11:
                    if (l_tk[2] == 24)
                    {
                        self.h_offset += 1;
                        if (self.h_offset >= self.h_length)
                        {
                            return self.h_error_at("Expected a function name", self.h_source.h_get_eof());
                        }
                        l_tk = self.h_tokens[self.h_offset];
                        var l_nextName1;
                        if (l_tk[0] == 12)
                        {
                            l_nextName1 = l_tk[2];
                            self.h_offset += 1;
                        }
                        else if (l_hasFirstFunc)
                        {
                            return self.h_expect("a function name", l_tk);
                        }
                        else
                        {
                            l_hasFirstFunc = true;
                            l_nextName1 = arg0;
                        }
                        if (self.h_offset >= self.h_length)
                        {
                            return self.h_error_at("Expected an opening `(`", self.h_source.h_get_eof());
                        }
                        l_tk = self.h_tokens[self.h_offset++];
                        if (!(l_tk[0] == 21))
                        {
                            return self.h_expect("an opening `(`", l_tk);
                        }
                        if (self.h_build_script_args())
                        {
                            return true;
                        }
                        var l_nextArgs1 = self.h_build_script_args_map;
                        self.h_build_script_args_map = undefined;
                        var l_scr = self.h_add_script(l_nextName1, l_nextArgs1, self.h_build_script_args_argc, true, self.h_build_script_args_prefix);
                        if (self.h_offset < self.h_length)
                        {
                            l_tk = self.h_tokens[self.h_offset];
                            if (l_tk[0] == 7)
                            {
                                self.h_offset += 1;
                                l_scr.h_is_constructor = true;
                                if (self.h_build_inherit())
                                {
                                    return true;
                                }
                                l_scr.h_parent_name = self.h_build_inherit_parent;
                                l_scr.h_parent_is_global = self.h_build_inherit_is_global;
                                l_scr.h_parent_argc = self.h_build_script_args_argc;
                                self.h_build_script_args_map = undefined;
                            }
                            else
                            {
                                var l_tmp3;
                                if (l_tk[0] == 12)
                                {
                                    l_tmp3 = l_tk[2] == "constructor";
                                }
                                else
                                {
                                    l_tmp3 = false;
                                }
                                if (l_tmp3)
                                {
                                    self.h_offset += 1;
                                    l_scr.h_is_constructor = true;
                                }
                            }
                        }
                        if (self.h_build_top_level_script_body(l_scr))
                        {
                            return true;
                        }
                    }
                    else
                    {
                        return self.h_expect("A script declaration", l_tk);
                    }
                    break;
                default:
                    return self.h_expect("A script declaration", l_tk);
            }
        }
        return false;
    };
    
    static h_program = undefined;
    static __class__ = global.mt_gml_builder;
    
    self.h_build_inherit_parent = undefined;
    self.h_build_inherit_is_global = false;
    self.h_build_script_args_argc = 0;
    self.h_build_script_args_map = undefined;
    self.h_build_script_args_prefix = [];
    self.h_current_script_ref = undefined;
    self.h_current_script = undefined;
    self.h_error_text = undefined;
    self.h_global_vars = [];
    self.h_macro_nodes = [];
    self.h_macro_names = [];
    self.h_enums = [];
    self.h_scripts = [];
    self.h_offset = 0;
    self.h_program = arg0;
    self.h_source = arg1;
    var l_parser = arg1.h_parser;
    if (l_parser != undefined && l_parser.h_tokens != undefined)
    {
        self.h_tokens = l_parser.h_tokens;
        self.h_length = l_parser.h_token_count;
    }
    else
    {
        l_parser = new gml_parser(arg1);
        arg1.h_parser = l_parser;
        self.h_tokens = l_parser.h_run();
        if (self.h_tokens != undefined)
        {
            self.h_length = l_parser.h_token_count;
        }
        else
        {
            self.h_error_text = global.gml_parser_error_text;
            self.h_error_pos = global.gml_parser_error_pos;
        }
    }
}

function gml_std_Type_getEnumConstructs(arg0)
{
    return gml_std_gml_internal_ArrayImpl_copy(arg0.h_constructors);
}

function gml_std_Type_enumConstructor(arg0)
{
    var l_isStruct1 = is_struct(arg0);
    var l_et, l_i;
    if (l_isStruct1)
    {
        l_et = arg0.__enum__;
        l_i = arg0.__enumIndex__;
    }
    else
    {
        return string(arg0);
    }
    var l_cs = l_et.h_constructors;
    if (l_cs != undefined && l_i >= 0 && l_i < array_length(l_cs))
    {
        return l_cs[l_i];
    }
    else
    {
        if (l_isStruct1)
        {
            var l_s = instanceof(arg0);
            if (string_copy(l_s, 1, 3) == "mc_")
            {
                l_s = string_delete(l_s, 1, 3);
            }
            l_i = string_length(l_et.h_name);
            if (string_copy(l_s, 1, l_i) == l_et.h_name && string_ord_at(l_s, l_i + 1) == 95)
            {
                l_s = string_delete(l_s, 1, l_i + 1);
            }
            return l_s;
        }
        return string(arg0);
    }
}

function gml_std_Type_enumParameters(arg0)
{
    if (is_struct(arg0))
    {
        var l_fields = arg0.__enumParams__;
        var l_n = array_length(l_fields);
        var l_r = array_create(l_n);
        var l_i = -1;
        while (++l_i < l_n)
        {
            array_set(l_r, l_i, variable_struct_get(arg0, l_fields[l_i]));
        }
        return l_r;
    }
    if (is_array(arg0))
    {
        var l_m = arg0;
        var l_n = array_length(l_m) - 1;
        var l_r = array_create(l_n);
        array_copy(l_r, 0, l_m, 1, l_n);
        return l_r;
    }
    else
    {
        return [];
    }
}

function gml_std_Type_enumIndex(arg0)
{
    if (is_struct(arg0))
    {
        return arg0.__enumIndex__;
    }
    else if (is_array(arg0))
    {
        return arg0[0];
    }
    else
    {
        return arg0;
    }
}

function gml_std_StringTools_startsWith(arg0, arg1)
{
    var l_n = string_length(arg1);
    return string_length(arg0) >= l_n && string_copy(arg0, 1, l_n) == arg1;
}

function gml_std_StringTools_endsWith(arg0, arg1)
{
    var l_n = string_length(arg0);
    var l_i = string_length(arg1);
    return l_n >= l_i && string_copy(arg0, (l_n + 1) - l_i, l_i) == arg1;
}

function gml_std_StringTools_trim(arg0)
{
    var l_len = string_length(arg0);
    var l_till = l_len;
    while (l_till > 0)
    {
        var l_char = string_ord_at(arg0, l_till);
        if (l_char == 32 || (l_char > 8 && l_char < 14))
        {
            l_till--;
        }
        else
        {
            break;
        }
    }
    if (l_till < l_len)
    {
        arg0 = string_copy(arg0, 1, l_till);
    }
    var l_start = 1;
    while (l_start <= l_till)
    {
        var l_char = string_ord_at(arg0, l_start);
        if (l_char == 32 || (l_char > 8 && l_char < 14))
        {
            l_start++;
        }
        else
        {
            break;
        }
    }
    if (l_start > 1)
    {
        arg0 = string_delete(arg0, 1, l_start - 1);
    }
    return arg0;
}

function compile_groups_gml_compile_group_literal_proc_lf(arg0, arg1, arg2, arg3)
{
    var l_instStack = arg2[6];
    var l_inst = l_instStack[l_instStack[0]];
    if (instanceof(l_inst) == "instance")
    {
        l_inst = l_inst.id;
    }
    var l_i = arg3[0] + 1;
    if (l_i >= array_length(arg3))
    {
        array_set(arg3, array_length(arg3) * 2, 0);
    }
    array_set(arg3, l_i, l_inst);
    array_set(arg3, 0, l_i);
    return 0;
}

function compile_groups_gml_compile_group_literal_proc_lf1(arg0, arg1, arg2, arg3)
{
    var l_instStack = arg2[6];
    var l_inst = l_instStack[l_instStack[0] - 1];
    if (instanceof(l_inst) == "instance")
    {
        l_inst = l_inst.id;
    }
    var l_i = arg3[0] + 1;
    if (l_i >= array_length(arg3))
    {
        array_set(arg3, array_length(arg3) * 2, 0);
    }
    array_set(arg3, l_i, l_inst);
    array_set(arg3, 0, l_i);
    return 0;
}

function compile_groups_gml_compile_group_literal_proc(arg0, arg1, arg2)
{
    var l__g = arg0;
    switch (l__g[0])
    {
        case UnknownEnum.Value_0:
            if (arg2)
            {
                ds_list_add(arg1, gml_action_undefined_hx(l__g[1]));
            }
            break;
        case UnknownEnum.Value_2:
            if (arg2)
            {
                ds_list_add(arg1, gml_action_number(l__g[1], l__g[2]));
            }
            break;
        case UnknownEnum.Value_3:
            if (arg2)
            {
                ds_list_add(arg1, gml_action_cstring(l__g[1], l__g[2]));
            }
            break;
        case UnknownEnum.Value_1:
            if (arg2)
            {
                ds_list_add(arg1, gml_action_const(l__g[1], bool(l__g[2])));
            }
            break;
        case UnknownEnum.Value_19:
            if (arg2)
            {
                ds_list_add(arg1, gml_action_const(l__g[1], variable_struct_get(global.gml_const_val, l__g[2])));
            }
            break;
        case UnknownEnum.Value_4:
            if (arg2)
            {
                ds_list_add(arg1, gml_action_const(l__g[1], l__g[2]));
            }
            break;
        case UnknownEnum.Value_14:
            var l_d = l__g[1];
            if (arg2)
            {
                if (global.gml_compile_curr_program.h_get_source(l_d[0]).h_version.h_int_self)
                {
                    ds_list_add(arg1, vm_v2_gml_action_closure_bind(l_d, "self", {}, compile_groups_gml_compile_group_literal_proc_lf));
                }
                else
                {
                    ds_list_add(arg1, gml_action_self_hx(l_d));
                }
            }
            break;
        case UnknownEnum.Value_15:
            var l_d = l__g[1];
            if (arg2)
            {
                if (global.gml_compile_curr_program.h_get_source(l_d[0]).h_version.h_int_self)
                {
                    ds_list_add(arg1, vm_v2_gml_action_closure_bind(l_d, "other", {}, compile_groups_gml_compile_group_literal_proc_lf1));
                }
                else
                {
                    ds_list_add(arg1, gml_action_other_hx(l_d));
                }
            }
            break;
        case UnknownEnum.Value_16:
            if (arg2)
            {
                ds_list_add(arg1, gml_action_number(l__g[1], -5));
            }
            break;
        case UnknownEnum.Value_17:
            ds_list_add(arg1, gml_action_func_literal(l__g[1], l__g[2].h_name, false));
            break;
        case UnknownEnum.Value_18:
            ds_list_add(arg1, gml_action_const(l__g[1], l__g[3]));
            break;
        case UnknownEnum.Value_6:
            var l_w = l__g[2];
            compile_gml_compile_args_proc(arg1, l_w);
            ds_list_add(arg1, gml_action_array_decl(l__g[1], array_length(l_w)));
            break;
        case UnknownEnum.Value_7:
            var l_w = l__g[3];
            var l_fields = [];
            var l_i = 0;
            var l__g2 = array_length(l_w);
            while (l_i < l__g2)
            {
                var l_x = l_w[l_i];
                if (gml_compile_node(l_w[l_i], arg1, true))
                {
                    return true;
                }
                var l__g3 = l_x;
                var l_bindFunc = l__g3[0] == 32;
                array_push(l_fields, 
                {
                    name: l__g[2][l_i],
                    bindFunc: l_bindFunc
                });
                l_i++;
            }
            ds_list_add(arg1, gml_action_object_decl(l__g[1], l_fields));
            break;
        default:
            return undefined;
    }
    return false;
}

function compile_groups_gml_compile_group_literal_init()
{
    gml_compile_set_handlers(compile_groups_gml_compile_group_literal_proc, ["undefined", "number", "cstring", "const", "other_const", "boolean", "self", "other", "global_ref", "script", "native_script", "array_decl", "object_decl"]);
}

function mc_gml_action() constructor
{
    static getIndex = method(undefined, gml_std_enum_getIndex);
    static toString = method(undefined, gml_std_enum_toString);
    static __enum__ = global.mt_gml_action;
}

function mc_gml_action_discard() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d"];
    static __enumIndex__ = 0;
}

function gml_action_discard(arg0)
{
    var l_this = new mc_gml_action_discard();
    l_this.h_d = arg0;
    return l_this;
}

function mc_gml_action_dup() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d"];
    static __enumIndex__ = 1;
}

function gml_action_dup(arg0)
{
    var l_this = new mc_gml_action_dup();
    l_this.h_d = arg0;
    return l_this;
}

function mc_gml_action_dup2x() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d"];
    static __enumIndex__ = 2;
}

function gml_action_dup2x(arg0)
{
    var l_this = new mc_gml_action_dup2x();
    l_this.h_d = arg0;
    return l_this;
}

function mc_gml_action_dup3x() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d"];
    static __enumIndex__ = 3;
}

function gml_action_dup3x(arg0)
{
    var l_this = new mc_gml_action_dup3x();
    l_this.h_d = arg0;
    return l_this;
}

function mc_gml_action_dup_in() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_z"];
    static __enumIndex__ = 4;
}

function gml_action_dup_in(arg0, arg1)
{
    var l_this = new mc_gml_action_dup_in();
    l_this.h_d = arg0;
    l_this.h_z = arg1;
    return l_this;
}

function mc_gml_action_undefined_hx() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d"];
    static __enumIndex__ = 5;
}

function gml_action_undefined_hx(arg0)
{
    var l_this = new mc_gml_action_undefined_hx();
    l_this.h_d = arg0;
    return l_this;
}

function mc_gml_action_number() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_f"];
    static __enumIndex__ = 6;
}

function gml_action_number(arg0, arg1)
{
    var l_this = new mc_gml_action_number();
    l_this.h_d = arg0;
    l_this.h_f = arg1;
    return l_this;
}

function mc_gml_action_cstring() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_s"];
    static __enumIndex__ = 7;
}

function gml_action_cstring(arg0, arg1)
{
    var l_this = new mc_gml_action_cstring();
    l_this.h_d = arg0;
    l_this.h_s = arg1;
    return l_this;
}

function mc_gml_action_array_decl() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_size"];
    static __enumIndex__ = 8;
}

function gml_action_array_decl(arg0, arg1)
{
    var l_this = new mc_gml_action_array_decl();
    l_this.h_d = arg0;
    l_this.h_size = arg1;
    return l_this;
}

function mc_gml_action_object_decl() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_fields"];
    static __enumIndex__ = 9;
}

function gml_action_object_decl(arg0, arg1)
{
    var l_this = new mc_gml_action_object_decl();
    l_this.h_d = arg0;
    l_this.h_fields = arg1;
    return l_this;
}

function mc_gml_action_const() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_v"];
    static __enumIndex__ = 10;
}

function gml_action_const(arg0, arg1)
{
    var l_this = new mc_gml_action_const();
    l_this.h_d = arg0;
    l_this.h_v = arg1;
    return l_this;
}

function mc_gml_action_self_hx() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d"];
    static __enumIndex__ = 11;
}

function gml_action_self_hx(arg0)
{
    var l_this = new mc_gml_action_self_hx();
    l_this.h_d = arg0;
    return l_this;
}

function mc_gml_action_other_hx() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d"];
    static __enumIndex__ = 12;
}

function gml_action_other_hx(arg0)
{
    var l_this = new mc_gml_action_other_hx();
    l_this.h_d = arg0;
    return l_this;
}

function mc_gml_action_local_hx() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_i", "h_name"];
    static __enumIndex__ = 13;
}

function gml_action_local_hx(arg0, arg1, arg2)
{
    var l_this = new mc_gml_action_local_hx();
    l_this.h_d = arg0;
    l_this.h_i = arg1;
    l_this.h_name = arg2;
    return l_this;
}

function mc_gml_action_local_set() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_i", "h_name"];
    static __enumIndex__ = 14;
}

function gml_action_local_set(arg0, arg1, arg2)
{
    var l_this = new mc_gml_action_local_set();
    l_this.h_d = arg0;
    l_this.h_i = arg1;
    l_this.h_name = arg2;
    return l_this;
}

function mc_gml_action_local_aop() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_o", "h_i", "h_name"];
    static __enumIndex__ = 15;
}

function gml_action_local_aop(arg0, arg1, arg2, arg3)
{
    var l_this = new mc_gml_action_local_aop();
    l_this.h_d = arg0;
    l_this.h_o = arg1;
    l_this.h_i = arg2;
    l_this.h_name = arg3;
    return l_this;
}

function mc_gml_action_global_hx() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_fd"];
    static __enumIndex__ = 16;
}

function gml_action_global_hx(arg0, arg1)
{
    var l_this = new mc_gml_action_global_hx();
    l_this.h_d = arg0;
    l_this.h_fd = arg1;
    return l_this;
}

function mc_gml_action_global_set() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_fd"];
    static __enumIndex__ = 17;
}

function gml_action_global_set(arg0, arg1)
{
    var l_this = new mc_gml_action_global_set();
    l_this.h_d = arg0;
    l_this.h_fd = arg1;
    return l_this;
}

function mc_gml_action_global_aop() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_o", "h_fd"];
    static __enumIndex__ = 18;
}

function gml_action_global_aop(arg0, arg1, arg2)
{
    var l_this = new mc_gml_action_global_aop();
    l_this.h_d = arg0;
    l_this.h_o = arg1;
    l_this.h_fd = arg2;
    return l_this;
}

function mc_gml_action_field() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_fd"];
    static __enumIndex__ = 19;
}

function gml_action_field(arg0, arg1)
{
    var l_this = new mc_gml_action_field();
    l_this.h_d = arg0;
    l_this.h_fd = arg1;
    return l_this;
}

function mc_gml_action_field_set() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_fd"];
    static __enumIndex__ = 20;
}

function gml_action_field_set(arg0, arg1)
{
    var l_this = new mc_gml_action_field_set();
    l_this.h_d = arg0;
    l_this.h_fd = arg1;
    return l_this;
}

function mc_gml_action_field_aop() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_o", "h_fd"];
    static __enumIndex__ = 21;
}

function gml_action_field_aop(arg0, arg1, arg2)
{
    var l_this = new mc_gml_action_field_aop();
    l_this.h_d = arg0;
    l_this.h_o = arg1;
    l_this.h_fd = arg2;
    return l_this;
}

function mc_gml_action_fast_field_aop() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_o", "h_getter", "h_setter"];
    static __enumIndex__ = 22;
}

function gml_action_fast_field_aop(arg0, arg1, arg2, arg3)
{
    var l_this = new mc_gml_action_fast_field_aop();
    l_this.h_d = arg0;
    l_this.h_o = arg1;
    l_this.h_getter = arg2;
    l_this.h_setter = arg3;
    return l_this;
}

function mc_gml_action_self_field() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_fd"];
    static __enumIndex__ = 23;
}

function gml_action_self_field(arg0, arg1)
{
    var l_this = new mc_gml_action_self_field();
    l_this.h_d = arg0;
    l_this.h_fd = arg1;
    return l_this;
}

function mc_gml_action_self_field_set() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_fd"];
    static __enumIndex__ = 24;
}

function gml_action_self_field_set(arg0, arg1)
{
    var l_this = new mc_gml_action_self_field_set();
    l_this.h_d = arg0;
    l_this.h_fd = arg1;
    return l_this;
}

function mc_gml_action_self_field_aop() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_o", "h_fd"];
    static __enumIndex__ = 25;
}

function gml_action_self_field_aop(arg0, arg1, arg2)
{
    var l_this = new mc_gml_action_self_field_aop();
    l_this.h_d = arg0;
    l_this.h_o = arg1;
    l_this.h_fd = arg2;
    return l_this;
}

function mc_gml_action_fast_self_field() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_getter"];
    static __enumIndex__ = 26;
}

function gml_action_fast_self_field(arg0, arg1)
{
    var l_this = new mc_gml_action_fast_self_field();
    l_this.h_d = arg0;
    l_this.h_getter = arg1;
    return l_this;
}

function mc_gml_action_fast_self_field_set() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_setter"];
    static __enumIndex__ = 27;
}

function gml_action_fast_self_field_set(arg0, arg1)
{
    var l_this = new mc_gml_action_fast_self_field_set();
    l_this.h_d = arg0;
    l_this.h_setter = arg1;
    return l_this;
}

function mc_gml_action_fast_self_field_aop() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_o", "h_getter", "h_setter"];
    static __enumIndex__ = 28;
}

function gml_action_fast_self_field_aop(arg0, arg1, arg2, arg3)
{
    var l_this = new mc_gml_action_fast_self_field_aop();
    l_this.h_d = arg0;
    l_this.h_o = arg1;
    l_this.h_getter = arg2;
    l_this.h_setter = arg3;
    return l_this;
}

function mc_gml_action_local_field() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_localIndex", "h_fd"];
    static __enumIndex__ = 29;
}

function gml_action_local_field(arg0, arg1, arg2)
{
    var l_this = new mc_gml_action_local_field();
    l_this.h_d = arg0;
    l_this.h_localIndex = arg1;
    l_this.h_fd = arg2;
    return l_this;
}

function mc_gml_action_local_field_set() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_localIndex", "h_fd"];
    static __enumIndex__ = 30;
}

function gml_action_local_field_set(arg0, arg1, arg2)
{
    var l_this = new mc_gml_action_local_field_set();
    l_this.h_d = arg0;
    l_this.h_localIndex = arg1;
    l_this.h_fd = arg2;
    return l_this;
}

function mc_gml_action_local_field_aop() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_localIndex", "h_o", "h_fd"];
    static __enumIndex__ = 31;
}

function gml_action_local_field_aop(arg0, arg1, arg2, arg3)
{
    var l_this = new mc_gml_action_local_field_aop();
    l_this.h_d = arg0;
    l_this.h_localIndex = arg1;
    l_this.h_o = arg2;
    l_this.h_fd = arg3;
    return l_this;
}

function mc_gml_action_fast_local_field() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_localIndex", "h_getter"];
    static __enumIndex__ = 32;
}

function gml_action_fast_local_field(arg0, arg1, arg2)
{
    var l_this = new mc_gml_action_fast_local_field();
    l_this.h_d = arg0;
    l_this.h_localIndex = arg1;
    l_this.h_getter = arg2;
    return l_this;
}

function mc_gml_action_fast_local_field_set() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_localIndex", "h_setter"];
    static __enumIndex__ = 33;
}

function gml_action_fast_local_field_set(arg0, arg1, arg2)
{
    var l_this = new mc_gml_action_fast_local_field_set();
    l_this.h_d = arg0;
    l_this.h_localIndex = arg1;
    l_this.h_setter = arg2;
    return l_this;
}

function mc_gml_action_fast_local_field_aop() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_localIndex", "h_o", "h_getter", "h_setter"];
    static __enumIndex__ = 34;
}

function gml_action_fast_local_field_aop(arg0, arg1, arg2, arg3, arg4)
{
    var l_this = new mc_gml_action_fast_local_field_aop();
    l_this.h_d = arg0;
    l_this.h_localIndex = arg1;
    l_this.h_o = arg2;
    l_this.h_getter = arg3;
    l_this.h_setter = arg4;
    return l_this;
}

function mc_gml_action_index() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d"];
    static __enumIndex__ = 35;
}

function gml_action_index(arg0)
{
    var l_this = new mc_gml_action_index();
    l_this.h_d = arg0;
    return l_this;
}

function mc_gml_action_index_set() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d"];
    static __enumIndex__ = 36;
}

function gml_action_index_set(arg0)
{
    var l_this = new mc_gml_action_index_set();
    l_this.h_d = arg0;
    return l_this;
}

function mc_gml_action_index_aop() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_o"];
    static __enumIndex__ = 37;
}

function gml_action_index_aop(arg0, arg1)
{
    var l_this = new mc_gml_action_index_aop();
    l_this.h_d = arg0;
    l_this.h_o = arg1;
    return l_this;
}

function mc_gml_action_index2d() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d"];
    static __enumIndex__ = 38;
}

function gml_action_index2d(arg0)
{
    var l_this = new mc_gml_action_index2d();
    l_this.h_d = arg0;
    return l_this;
}

function mc_gml_action_index2d_set() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d"];
    static __enumIndex__ = 39;
}

function gml_action_index2d_set(arg0)
{
    var l_this = new mc_gml_action_index2d_set();
    l_this.h_d = arg0;
    return l_this;
}

function mc_gml_action_index2d_aop() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_o"];
    static __enumIndex__ = 40;
}

function gml_action_index2d_aop(arg0, arg1)
{
    var l_this = new mc_gml_action_index2d_aop();
    l_this.h_d = arg0;
    l_this.h_o = arg1;
    return l_this;
}

function mc_gml_action_env() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_f"];
    static __enumIndex__ = 41;
}

function gml_action_env(arg0, arg1)
{
    var l_this = new mc_gml_action_env();
    l_this.h_d = arg0;
    l_this.h_f = arg1;
    return l_this;
}

function mc_gml_action_env_set() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_f", "h_ch"];
    static __enumIndex__ = 42;
}

function gml_action_env_set(arg0, arg1, arg2)
{
    var l_this = new mc_gml_action_env_set();
    l_this.h_d = arg0;
    l_this.h_f = arg1;
    l_this.h_ch = arg2;
    return l_this;
}

function mc_gml_action_env_aop() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_o", "h_f"];
    static __enumIndex__ = 43;
}

function gml_action_env_aop(arg0, arg1, arg2)
{
    var l_this = new mc_gml_action_env_aop();
    l_this.h_d = arg0;
    l_this.h_o = arg1;
    l_this.h_f = arg2;
    return l_this;
}

function mc_gml_action_env1d() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_f"];
    static __enumIndex__ = 44;
}

function gml_action_env1d(arg0, arg1)
{
    var l_this = new mc_gml_action_env1d();
    l_this.h_d = arg0;
    l_this.h_f = arg1;
    return l_this;
}

function mc_gml_action_env1d_set() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_f", "h_ch"];
    static __enumIndex__ = 45;
}

function gml_action_env1d_set(arg0, arg1, arg2)
{
    var l_this = new mc_gml_action_env1d_set();
    l_this.h_d = arg0;
    l_this.h_f = arg1;
    l_this.h_ch = arg2;
    return l_this;
}

function mc_gml_action_env1d_aop() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_o", "h_f"];
    static __enumIndex__ = 46;
}

function gml_action_env1d_aop(arg0, arg1, arg2)
{
    var l_this = new mc_gml_action_env1d_aop();
    l_this.h_d = arg0;
    l_this.h_o = arg1;
    l_this.h_f = arg2;
    return l_this;
}

function mc_gml_action_ds_aop() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_o", "h_argc", "h_get", "h_set", "h_out"];
    static __enumIndex__ = 47;
}

function gml_action_ds_aop(arg0, arg1, arg2, arg3, arg4, arg5)
{
    var l_this = new mc_gml_action_ds_aop();
    l_this.h_d = arg0;
    l_this.h_o = arg1;
    l_this.h_argc = arg2;
    l_this.h_get = arg3;
    l_this.h_set = arg4;
    l_this.h_out = arg5;
    return l_this;
}

function mc_gml_action_arg_const() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_i"];
    static __enumIndex__ = 48;
}

function gml_action_arg_const(arg0, arg1)
{
    var l_this = new mc_gml_action_arg_const();
    l_this.h_d = arg0;
    l_this.h_i = arg1;
    return l_this;
}

function mc_gml_action_arg_const_set() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_i"];
    static __enumIndex__ = 49;
}

function gml_action_arg_const_set(arg0, arg1)
{
    var l_this = new mc_gml_action_arg_const_set();
    l_this.h_d = arg0;
    l_this.h_i = arg1;
    return l_this;
}

function mc_gml_action_arg_const_aop() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_o", "h_i"];
    static __enumIndex__ = 50;
}

function gml_action_arg_const_aop(arg0, arg1, arg2)
{
    var l_this = new mc_gml_action_arg_const_aop();
    l_this.h_d = arg0;
    l_this.h_o = arg1;
    l_this.h_i = arg2;
    return l_this;
}

function mc_gml_action_arg_index() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d"];
    static __enumIndex__ = 51;
}

function gml_action_arg_index(arg0)
{
    var l_this = new mc_gml_action_arg_index();
    l_this.h_d = arg0;
    return l_this;
}

function mc_gml_action_arg_index_set() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d"];
    static __enumIndex__ = 52;
}

function gml_action_arg_index_set(arg0)
{
    var l_this = new mc_gml_action_arg_index_set();
    l_this.h_d = arg0;
    return l_this;
}

function mc_gml_action_arg_index_aop() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_o"];
    static __enumIndex__ = 53;
}

function gml_action_arg_index_aop(arg0, arg1)
{
    var l_this = new mc_gml_action_arg_index_aop();
    l_this.h_d = arg0;
    l_this.h_o = arg1;
    return l_this;
}

function mc_gml_action_arg_count() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d"];
    static __enumIndex__ = 54;
}

function gml_action_arg_count(arg0)
{
    var l_this = new mc_gml_action_arg_count();
    l_this.h_d = arg0;
    return l_this;
}

function mc_gml_action_add_int() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_i"];
    static __enumIndex__ = 55;
}

function gml_action_add_int(arg0, arg1)
{
    var l_this = new mc_gml_action_add_int();
    l_this.h_d = arg0;
    l_this.h_i = arg1;
    return l_this;
}

function mc_gml_action_equ_op() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d"];
    static __enumIndex__ = 56;
}

function gml_action_equ_op(arg0)
{
    var l_this = new mc_gml_action_equ_op();
    l_this.h_d = arg0;
    return l_this;
}

function mc_gml_action_neq_op() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d"];
    static __enumIndex__ = 57;
}

function gml_action_neq_op(arg0)
{
    var l_this = new mc_gml_action_neq_op();
    l_this.h_d = arg0;
    return l_this;
}

function mc_gml_action_concat() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d"];
    static __enumIndex__ = 58;
}

function gml_action_concat(arg0)
{
    var l_this = new mc_gml_action_concat();
    l_this.h_d = arg0;
    return l_this;
}

function mc_gml_action_bin_op() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_o"];
    static __enumIndex__ = 59;
}

function gml_action_bin_op(arg0, arg1)
{
    var l_this = new mc_gml_action_bin_op();
    l_this.h_d = arg0;
    l_this.h_o = arg1;
    return l_this;
}

function mc_gml_action_un_op() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_o"];
    static __enumIndex__ = 60;
}

function gml_action_un_op(arg0, arg1)
{
    var l_this = new mc_gml_action_un_op();
    l_this.h_d = arg0;
    l_this.h_o = arg1;
    return l_this;
}

function mc_gml_action_in() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_not"];
    static __enumIndex__ = 61;
}

function gml_action_in(arg0, arg1)
{
    var l_this = new mc_gml_action_in();
    l_this.h_d = arg0;
    l_this.h_not = arg1;
    return l_this;
}

function mc_gml_action_in_const() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_field", "h_not"];
    static __enumIndex__ = 62;
}

function gml_action_in_const(arg0, arg1, arg2)
{
    var l_this = new mc_gml_action_in_const();
    l_this.h_d = arg0;
    l_this.h_field = arg1;
    l_this.h_not = arg2;
    return l_this;
}

function mc_gml_action_call_script() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_script", "h_argc"];
    static __enumIndex__ = 63;
}

function gml_action_call_script(arg0, arg1, arg2)
{
    var l_this = new mc_gml_action_call_script();
    l_this.h_d = arg0;
    l_this.h_script = arg1;
    l_this.h_argc = arg2;
    return l_this;
}

function mc_gml_action_call_script_id() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_argc"];
    static __enumIndex__ = 64;
}

function gml_action_call_script_id(arg0, arg1)
{
    var l_this = new mc_gml_action_call_script_id();
    l_this.h_d = arg0;
    l_this.h_argc = arg1;
    return l_this;
}

function mc_gml_action_call_script_with_array() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d"];
    static __enumIndex__ = 65;
}

function gml_action_call_script_with_array(arg0)
{
    var l_this = new mc_gml_action_call_script_with_array();
    l_this.h_d = arg0;
    return l_this;
}

function mc_gml_action_call_func() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_func", "h_argc", "h_args", "h_rest", "h_inst", "h_out"];
    static __enumIndex__ = 66;
}

function gml_action_call_func(arg0, arg1, arg2, arg3, arg4, arg5, arg6)
{
    var l_this = new mc_gml_action_call_func();
    l_this.h_d = arg0;
    l_this.h_func = arg1;
    l_this.h_argc = arg2;
    l_this.h_args = arg3;
    l_this.h_rest = arg4;
    l_this.h_inst = arg5;
    l_this.h_out = arg6;
    return l_this;
}

function mc_gml_action_call_func0() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_func"];
    static __enumIndex__ = 67;
}

function gml_action_call_func0(arg0, arg1)
{
    var l_this = new mc_gml_action_call_func0();
    l_this.h_d = arg0;
    l_this.h_func = arg1;
    return l_this;
}

function mc_gml_action_call_func0o() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_func"];
    static __enumIndex__ = 68;
}

function gml_action_call_func0o(arg0, arg1)
{
    var l_this = new mc_gml_action_call_func0o();
    l_this.h_d = arg0;
    l_this.h_func = arg1;
    return l_this;
}

function mc_gml_action_call_func1() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_func"];
    static __enumIndex__ = 69;
}

function gml_action_call_func1(arg0, arg1)
{
    var l_this = new mc_gml_action_call_func1();
    l_this.h_d = arg0;
    l_this.h_func = arg1;
    return l_this;
}

function mc_gml_action_call_func1o() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_func"];
    static __enumIndex__ = 70;
}

function gml_action_call_func1o(arg0, arg1)
{
    var l_this = new mc_gml_action_call_func1o();
    l_this.h_d = arg0;
    l_this.h_func = arg1;
    return l_this;
}

function mc_gml_action_call_func2() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_func"];
    static __enumIndex__ = 71;
}

function gml_action_call_func2(arg0, arg1)
{
    var l_this = new mc_gml_action_call_func2();
    l_this.h_d = arg0;
    l_this.h_func = arg1;
    return l_this;
}

function mc_gml_action_call_func2o() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_func"];
    static __enumIndex__ = 72;
}

function gml_action_call_func2o(arg0, arg1)
{
    var l_this = new mc_gml_action_call_func2o();
    l_this.h_d = arg0;
    l_this.h_func = arg1;
    return l_this;
}

function mc_gml_action_call_func3() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_func"];
    static __enumIndex__ = 73;
}

function gml_action_call_func3(arg0, arg1)
{
    var l_this = new mc_gml_action_call_func3();
    l_this.h_d = arg0;
    l_this.h_func = arg1;
    return l_this;
}

function mc_gml_action_call_func3o() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_func"];
    static __enumIndex__ = 74;
}

function gml_action_call_func3o(arg0, arg1)
{
    var l_this = new mc_gml_action_call_func3o();
    l_this.h_d = arg0;
    l_this.h_func = arg1;
    return l_this;
}

function mc_gml_action_call_func4() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_func"];
    static __enumIndex__ = 75;
}

function gml_action_call_func4(arg0, arg1)
{
    var l_this = new mc_gml_action_call_func4();
    l_this.h_d = arg0;
    l_this.h_func = arg1;
    return l_this;
}

function mc_gml_action_call_func4o() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_func"];
    static __enumIndex__ = 76;
}

function gml_action_call_func4o(arg0, arg1)
{
    var l_this = new mc_gml_action_call_func4o();
    l_this.h_d = arg0;
    l_this.h_func = arg1;
    return l_this;
}

function mc_gml_action_call_func_with_local0() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_func", "h_local"];
    static __enumIndex__ = 77;
}

function gml_action_call_func_with_local0(arg0, arg1, arg2)
{
    var l_this = new mc_gml_action_call_func_with_local0();
    l_this.h_d = arg0;
    l_this.h_func = arg1;
    l_this.h_local = arg2;
    return l_this;
}

function mc_gml_action_call_func_with_local0o() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_func", "h_local"];
    static __enumIndex__ = 78;
}

function gml_action_call_func_with_local0o(arg0, arg1, arg2)
{
    var l_this = new mc_gml_action_call_func_with_local0o();
    l_this.h_d = arg0;
    l_this.h_func = arg1;
    l_this.h_local = arg2;
    return l_this;
}

function mc_gml_action_call_func_with_local1() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_func", "h_local"];
    static __enumIndex__ = 79;
}

function gml_action_call_func_with_local1(arg0, arg1, arg2)
{
    var l_this = new mc_gml_action_call_func_with_local1();
    l_this.h_d = arg0;
    l_this.h_func = arg1;
    l_this.h_local = arg2;
    return l_this;
}

function mc_gml_action_call_func_with_local1o() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_func", "h_local"];
    static __enumIndex__ = 80;
}

function gml_action_call_func_with_local1o(arg0, arg1, arg2)
{
    var l_this = new mc_gml_action_call_func_with_local1o();
    l_this.h_d = arg0;
    l_this.h_func = arg1;
    l_this.h_local = arg2;
    return l_this;
}

function mc_gml_action_call_func_with_local2() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_func", "h_local"];
    static __enumIndex__ = 81;
}

function gml_action_call_func_with_local2(arg0, arg1, arg2)
{
    var l_this = new mc_gml_action_call_func_with_local2();
    l_this.h_d = arg0;
    l_this.h_func = arg1;
    l_this.h_local = arg2;
    return l_this;
}

function mc_gml_action_call_func_with_local2o() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_func", "h_local"];
    static __enumIndex__ = 82;
}

function gml_action_call_func_with_local2o(arg0, arg1, arg2)
{
    var l_this = new mc_gml_action_call_func_with_local2o();
    l_this.h_d = arg0;
    l_this.h_func = arg1;
    l_this.h_local = arg2;
    return l_this;
}

function mc_gml_action_call_func_with_local3() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_func", "h_local"];
    static __enumIndex__ = 83;
}

function gml_action_call_func_with_local3(arg0, arg1, arg2)
{
    var l_this = new mc_gml_action_call_func_with_local3();
    l_this.h_d = arg0;
    l_this.h_func = arg1;
    l_this.h_local = arg2;
    return l_this;
}

function mc_gml_action_call_func_with_local3o() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_func", "h_local"];
    static __enumIndex__ = 84;
}

function gml_action_call_func_with_local3o(arg0, arg1, arg2)
{
    var l_this = new mc_gml_action_call_func_with_local3o();
    l_this.h_d = arg0;
    l_this.h_func = arg1;
    l_this.h_local = arg2;
    return l_this;
}

function mc_gml_action_call_func_with_local4() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_func", "h_local"];
    static __enumIndex__ = 85;
}

function gml_action_call_func_with_local4(arg0, arg1, arg2)
{
    var l_this = new mc_gml_action_call_func_with_local4();
    l_this.h_d = arg0;
    l_this.h_func = arg1;
    l_this.h_local = arg2;
    return l_this;
}

function mc_gml_action_call_func_with_local4o() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_func", "h_local"];
    static __enumIndex__ = 86;
}

function gml_action_call_func_with_local4o(arg0, arg1, arg2)
{
    var l_this = new mc_gml_action_call_func_with_local4o();
    l_this.h_d = arg0;
    l_this.h_func = arg1;
    l_this.h_local = arg2;
    return l_this;
}

function mc_gml_action_call_field() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_field", "h_argc"];
    static __enumIndex__ = 87;
}

function gml_action_call_field(arg0, arg1, arg2)
{
    var l_this = new mc_gml_action_call_field();
    l_this.h_d = arg0;
    l_this.h_field = arg1;
    l_this.h_argc = arg2;
    return l_this;
}

function mc_gml_action_construct() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_argc"];
    static __enumIndex__ = 88;
}

function gml_action_construct(arg0, arg1)
{
    var l_this = new mc_gml_action_construct();
    l_this.h_d = arg0;
    l_this.h_argc = arg1;
    return l_this;
}

function mc_gml_action_func_literal() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_name", "h_unbound"];
    static __enumIndex__ = 89;
}

function gml_action_func_literal(arg0, arg1, arg2)
{
    var l_this = new mc_gml_action_func_literal();
    l_this.h_d = arg0;
    l_this.h_name = arg1;
    l_this.h_unbound = arg2;
    return l_this;
}

function mc_gml_action_jump() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_p"];
    static __enumIndex__ = 90;
}

function gml_action_jump(arg0, arg1)
{
    var l_this = new mc_gml_action_jump();
    l_this.h_d = arg0;
    l_this.h_p = arg1;
    return l_this;
}

function mc_gml_action_jump_if() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_p"];
    static __enumIndex__ = 91;
}

function gml_action_jump_if(arg0, arg1)
{
    var l_this = new mc_gml_action_jump_if();
    l_this.h_d = arg0;
    l_this.h_p = arg1;
    return l_this;
}

function mc_gml_action_jump_unless() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_p"];
    static __enumIndex__ = 92;
}

function gml_action_jump_unless(arg0, arg1)
{
    var l_this = new mc_gml_action_jump_unless();
    l_this.h_d = arg0;
    l_this.h_p = arg1;
    return l_this;
}

function mc_gml_action_jump_placeholder() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d"];
    static __enumIndex__ = 93;
}

function gml_action_jump_placeholder(arg0)
{
    var l_this = new mc_gml_action_jump_placeholder();
    l_this.h_d = arg0;
    return l_this;
}

function mc_gml_action_bool_and() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_p"];
    static __enumIndex__ = 94;
}

function gml_action_bool_and(arg0, arg1)
{
    var l_this = new mc_gml_action_bool_and();
    l_this.h_d = arg0;
    l_this.h_p = arg1;
    return l_this;
}

function mc_gml_action_bool_or() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_p"];
    static __enumIndex__ = 95;
}

function gml_action_bool_or(arg0, arg1)
{
    var l_this = new mc_gml_action_bool_or();
    l_this.h_d = arg0;
    l_this.h_p = arg1;
    return l_this;
}

function mc_gml_action_null_co() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_p"];
    static __enumIndex__ = 96;
}

function gml_action_null_co(arg0, arg1)
{
    var l_this = new mc_gml_action_null_co();
    l_this.h_d = arg0;
    l_this.h_p = arg1;
    return l_this;
}

function mc_gml_action_switch_hx() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_jumptable", "h_defaultPos"];
    static __enumIndex__ = 97;
}

function gml_action_switch_hx(arg0, arg1, arg2)
{
    var l_this = new mc_gml_action_switch_hx();
    l_this.h_d = arg0;
    l_this.h_jumptable = arg1;
    l_this.h_defaultPos = arg2;
    return l_this;
}

function mc_gml_action_switch_case() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_p"];
    static __enumIndex__ = 98;
}

function gml_action_switch_case(arg0, arg1)
{
    var l_this = new mc_gml_action_switch_case();
    l_this.h_d = arg0;
    l_this.h_p = arg1;
    return l_this;
}

function mc_gml_action_repeat_jump() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_p"];
    static __enumIndex__ = 99;
}

function gml_action_repeat_jump(arg0, arg1)
{
    var l_this = new mc_gml_action_repeat_jump();
    l_this.h_d = arg0;
    l_this.h_p = arg1;
    return l_this;
}

function mc_gml_action_repeat_pre() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_p"];
    static __enumIndex__ = 100;
}

function gml_action_repeat_pre(arg0, arg1)
{
    var l_this = new mc_gml_action_repeat_pre();
    l_this.h_d = arg0;
    l_this.h_p = arg1;
    return l_this;
}

function mc_gml_action_with_pre() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d"];
    static __enumIndex__ = 101;
}

function gml_action_with_pre(arg0)
{
    var l_this = new mc_gml_action_with_pre();
    l_this.h_d = arg0;
    return l_this;
}

function mc_gml_action_with_next() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_p"];
    static __enumIndex__ = 102;
}

function gml_action_with_next(arg0, arg1)
{
    var l_this = new mc_gml_action_with_next();
    l_this.h_d = arg0;
    l_this.h_p = arg1;
    return l_this;
}

function mc_gml_action_with_post() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d"];
    static __enumIndex__ = 103;
}

function gml_action_with_post(arg0)
{
    var l_this = new mc_gml_action_with_post();
    l_this.h_d = arg0;
    return l_this;
}

function mc_gml_action_break_hx() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_lp"];
    static __enumIndex__ = 104;
}

function gml_action_break_hx(arg0, arg1)
{
    var l_this = new mc_gml_action_break_hx();
    l_this.h_d = arg0;
    l_this.h_lp = arg1;
    return l_this;
}

function mc_gml_action_continue_hx() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_lp"];
    static __enumIndex__ = 105;
}

function gml_action_continue_hx(arg0, arg1)
{
    var l_this = new mc_gml_action_continue_hx();
    l_this.h_d = arg0;
    l_this.h_lp = arg1;
    return l_this;
}

function mc_gml_action_return_hx() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d"];
    static __enumIndex__ = 106;
}

function gml_action_return_hx(arg0)
{
    var l_this = new mc_gml_action_return_hx();
    l_this.h_d = arg0;
    return l_this;
}

function mc_gml_action_return_const() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_val"];
    static __enumIndex__ = 107;
}

function gml_action_return_const(arg0, arg1)
{
    var l_this = new mc_gml_action_return_const();
    l_this.h_d = arg0;
    l_this.h_val = arg1;
    return l_this;
}

function mc_gml_action_result() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d"];
    static __enumIndex__ = 108;
}

function gml_action_result(arg0)
{
    var l_this = new mc_gml_action_result();
    l_this.h_d = arg0;
    return l_this;
}

function mc_gml_action_try_hx() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_hdl"];
    static __enumIndex__ = 109;
}

function gml_action_try_hx(arg0, arg1)
{
    var l_this = new mc_gml_action_try_hx();
    l_this.h_d = arg0;
    l_this.h_hdl = arg1;
    return l_this;
}

function mc_gml_action_catch_hx() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_v"];
    static __enumIndex__ = 110;
}

function gml_action_catch_hx(arg0, arg1)
{
    var l_this = new mc_gml_action_catch_hx();
    l_this.h_d = arg0;
    l_this.h_v = arg1;
    return l_this;
}

function mc_gml_action_finally_hx() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_p"];
    static __enumIndex__ = 111;
}

function gml_action_finally_hx(arg0, arg1)
{
    var l_this = new mc_gml_action_finally_hx();
    l_this.h_d = arg0;
    l_this.h_p = arg1;
    return l_this;
}

function mc_gml_action_throw_hx() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d"];
    static __enumIndex__ = 112;
}

function gml_action_throw_hx(arg0)
{
    var l_this = new mc_gml_action_throw_hx();
    l_this.h_d = arg0;
    return l_this;
}

function mc_gml_action_wait() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d"];
    static __enumIndex__ = 113;
}

function gml_action_wait(arg0)
{
    var l_this = new mc_gml_action_wait();
    l_this.h_d = arg0;
    return l_this;
}

function mc_gml_action_fork() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_out"];
    static __enumIndex__ = 114;
}

function gml_action_fork(arg0, arg1)
{
    var l_this = new mc_gml_action_fork();
    l_this.h_d = arg0;
    l_this.h_out = arg1;
    return l_this;
}

function mc_gml_action_ensure_array_for_local() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_ind"];
    static __enumIndex__ = 115;
}

function gml_action_ensure_array_for_local(arg0, arg1)
{
    var l_this = new mc_gml_action_ensure_array_for_local();
    l_this.h_d = arg0;
    l_this.h_ind = arg1;
    return l_this;
}

function mc_gml_action_ensure_array_for_global() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_name"];
    static __enumIndex__ = 116;
}

function gml_action_ensure_array_for_global(arg0, arg1)
{
    var l_this = new mc_gml_action_ensure_array_for_global();
    l_this.h_d = arg0;
    l_this.h_name = arg1;
    return l_this;
}

function mc_gml_action_ensure_array_for_field() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_field"];
    static __enumIndex__ = 117;
}

function gml_action_ensure_array_for_field(arg0, arg1)
{
    var l_this = new mc_gml_action_ensure_array_for_field();
    l_this.h_d = arg0;
    l_this.h_field = arg1;
    return l_this;
}

function mc_gml_action_ensure_array_for_index() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d"];
    static __enumIndex__ = 118;
}

function gml_action_ensure_array_for_index(arg0)
{
    var l_this = new mc_gml_action_ensure_array_for_index();
    l_this.h_d = arg0;
    return l_this;
}

function mc_gml_action_ensure_array_for_index2d() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d"];
    static __enumIndex__ = 119;
}

function gml_action_ensure_array_for_index2d(arg0)
{
    var l_this = new mc_gml_action_ensure_array_for_index2d();
    l_this.h_d = arg0;
    return l_this;
}

function mc_gml_action_alarm() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d"];
    static __enumIndex__ = 120;
}

function gml_action_alarm(arg0)
{
    var l_this = new mc_gml_action_alarm();
    l_this.h_d = arg0;
    return l_this;
}

function mc_gml_action_alarm_set_hx() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d"];
    static __enumIndex__ = 121;
}

function gml_action_alarm_set_hx(arg0)
{
    var l_this = new mc_gml_action_alarm_set_hx();
    l_this.h_d = arg0;
    return l_this;
}

function mc_gml_action_alarm_aop() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_op"];
    static __enumIndex__ = 122;
}

function gml_action_alarm_aop(arg0, arg1)
{
    var l_this = new mc_gml_action_alarm_aop();
    l_this.h_d = arg0;
    l_this.h_op = arg1;
    return l_this;
}

function mc_gml_action_closure() : mc_gml_action() constructor
{
    static __enumParams__ = ["h_d", "h_tag", "h_ctx", "h_fn"];
    static __enumIndex__ = 123;
}

function gml_action_closure(arg0, arg1, arg2, arg3)
{
    var l_this = new mc_gml_action_closure();
    l_this.h_d = arg0;
    l_this.h_tag = arg1;
    l_this.h_ctx = arg2;
    l_this.h_fn = arg3;
    return l_this;
}

function compile_gml_compile_args_get_simple(arg0)
{
    var l__g = arg0;
    switch (l__g[0])
    {
        case UnknownEnum.Value_55:
            if (l__g[2][0] == 14)
            {
                var l__field = l__g[3];
                var l_fastGetter = global.gml_compile_curr_program.h_get_fast_getter(l__field);
                if (l_fastGetter != undefined)
                {
                    global.compile_gml_compile_args_get_simple_val = l_fastGetter;
                    global.compile_gml_compile_args_get_simple_kind = 3;
                }
                else
                {
                    global.compile_gml_compile_args_get_simple_val = l__field;
                    global.compile_gml_compile_args_get_simple_kind = 2;
                }
            }
            else if (gml_compile_const_val_of(arg0))
            {
                global.compile_gml_compile_args_get_simple_val = global.gml_compile_const_val_of_val;
                global.compile_gml_compile_args_get_simple_kind = 0;
            }
            else
            {
                return false;
            }
            break;
        case UnknownEnum.Value_43:
            global.compile_gml_compile_args_get_simple_val = variable_struct_get(global.gml_compile_curr_script.h_local_map, l__g[2]);
            global.compile_gml_compile_args_get_simple_kind = 1;
            break;
        default:
            if (gml_compile_const_val_of(arg0))
            {
                global.compile_gml_compile_args_get_simple_val = global.gml_compile_const_val_of_val;
                global.compile_gml_compile_args_get_simple_kind = 0;
                break;
            }
            return false;
    }
    return true;
}

function compile_gml_compile_args_proc_lf(arg0, arg1, arg2, arg3)
{
    var l_arr = self.values;
    var l_count = self.count;
    var l_i = arg3[0];
    var l_next = l_i + l_count;
    while (l_next >= array_length(arg3))
    {
        array_set(arg3, array_length(arg3) * 2, 0);
    }
    array_copy(arg3, l_i + 1, l_arr, 0, l_count);
    array_set(arg3, 0, l_next);
    return 0;
}

function compile_gml_compile_args_proc_lf1(arg0, arg1, arg2, arg3)
{
    var l_params = self.params;
    var l_kinds = self.kinds;
    var l_locals = arg2[4];
    var l_self1;
    if (self.usesSelf)
    {
        var l_this1 = arg2[6];
        l_self1 = l_this1[l_this1[0]];
    }
    else
    {
        l_self1 = undefined;
    }
    var l_count = self.count;
    var l_i = arg3[0];
    var l_next = l_i + l_count;
    while (l_next >= array_length(arg3))
    {
        array_set(arg3, array_length(arg3) * 2, 0);
    }
    array_set(arg3, 0, l_next);
    var l_k = 0;
    for (var l__ = 0; l__ < l_count; l__++)
    {
        l_i++;
        var l_v;
        switch (l_kinds[l_k])
        {
            case 1:
                l_v = l_locals[l_params[l_k]];
                break;
            case 0:
                l_v = l_params[l_k];
                break;
            case 3:
                l_v = l_params[l_k](l_self1);
                break;
            case 2:
                var l_field = l_params[l_k];
                var l_val = variable_struct_get(l_self1, l_field);
                if (l_val == undefined)
                {
                    if (!variable_struct_exists(l_self1, l_field))
                    {
                        if (is_numeric(l_self1))
                        {
                            if (object_exists(l_self1))
                            {
                                gml_thread_error(gml_std_Std_stringify(l_self1) + " (" + object_get_name(l_self1) + ") does not have a variable `" + l_field + "`.");
                            }
                            else if (instance_exists(l_self1))
                            {
                                gml_thread_error(gml_std_Std_stringify(l_self1) + " (" + object_get_name(l_self1.object_index) + ") does not have a variable `" + l_field + "`.");
                            }
                            else
                            {
                                gml_thread_error(gml_value_dump(l_self1) + " does not have a variable `" + l_field + "`.");
                            }
                        }
                        else if (typeof(l_self1) == "ref")
                        {
                            if (instance_exists(l_self1))
                            {
                                gml_thread_error(gml_std_Std_stringify(l_self1) + " (" + object_get_name(l_self1.object_index) + ") does not have a variable `" + l_field + "`.");
                            }
                            else
                            {
                                gml_thread_error(gml_value_dump(l_self1) + " does not have a variable `" + l_field + "`.");
                            }
                        }
                        else
                        {
                            gml_thread_error(gml_value_dump(l_self1) + " does not have a variable `" + l_field + "`.");
                        }
                    }
                }
                l_v = l_val;
                break;
        }
        array_set(arg3, l_i, l_v);
        l_k++;
    }
    return 0;
}

function compile_gml_compile_args_proc(arg0, arg1, arg2 = 0, arg3 = array_length(arg1))
{
    var l_i = arg2;
    while (l_i < arg3)
    {
        var l_q = arg1[l_i];
        if (!compile_gml_compile_args_get_simple(l_q))
        {
            if (gml_compile_node(l_q, arg0, true))
            {
                return true;
            }
            l_i++;
            continue;
        }
        var l_kind = global.compile_gml_compile_args_get_simple_kind;
        var l_count = 1;
        var l_kinds = [l_kind];
        var l_params = [global.compile_gml_compile_args_get_simple_val];
        var l_allConsts = l_kind == 0;
        var l_usesLocals = l_kind == 1;
        var l_usesSelf = l_kind == 2 || l_kind == 3;
        while ((l_i + l_count) < arg3)
        {
            if (!compile_gml_compile_args_get_simple(arg1[l_i + l_count]))
            {
                break;
            }
            l_kind = global.compile_gml_compile_args_get_simple_kind;
            array_push(l_params, global.compile_gml_compile_args_get_simple_val);
            array_push(l_kinds, l_kind);
            if (l_kind != 0)
            {
                l_allConsts = false;
                switch (l_kind)
                {
                    case 1:
                        l_usesLocals = true;
                        break;
                    case 2:
                    case 3:
                        l_usesSelf = true;
                        break;
                }
            }
            l_count++;
        }
        var l_d = gml_std_haxe_enum_tools_getParameter(l_q, 0);
        if (l_count == 1)
        {
            if (gml_compile_node(l_q, arg0, true))
            {
                return true;
            }
        }
        else if (l_allConsts)
        {
            ds_list_add(arg0, vm_v2_gml_action_closure_bind(l_d, "...push(consts)", 
            {
                values: l_params,
                count: l_count
            }, compile_gml_compile_args_proc_lf));
        }
        else
        {
            ds_list_add(arg0, vm_v2_gml_action_closure_bind(l_d, "...push(simple)", 
            {
                params: l_params,
                kinds: l_kinds,
                count: l_count,
                usesLocals: l_usesLocals,
                usesSelf: l_usesSelf
            }, compile_gml_compile_args_proc_lf1));
        }
        l_i += l_count;
    }
    return false;
}

function gml_func_copy(arg0, arg1, arg2)
{
    var l_f0 = variable_struct_get(global.gml_func_map, arg1);
    if (l_f0 == undefined)
    {
        show_error("Can't find " + arg1 + " to add an alias for.", true);
    }
    variable_struct_set(global.gml_func_map, arg0, l_f0.h_copy(arg0));
    var l_tmp = arg2 != undefined && arg2 != "";
}

function gml_var_add(arg0, arg1)
{
    var l_v = new api_api_var();
    l_v.h_set(arg0, arg1);
    variable_struct_set(global.api_api_var_map, l_v.h_name, l_v);
}

function gml_remove_var(arg0)
{
    if (variable_struct_get(global.api_api_var_map, arg0) == undefined)
    {
        return false;
    }
    else
    {
        variable_struct_remove(global.api_api_var_map, arg0);
        return true;
    }
}

function gml_const_add(arg0, arg1)
{
    var l_s = arg0 + " = " + gml_value_print(arg1);
    variable_struct_set(global.gml_const_map, arg0, true);
    variable_struct_set(global.gml_const_val, arg0, arg1);
}

function gml_remove_const(arg0)
{
    if (variable_struct_exists(global.gml_const_map, arg0))
    {
        variable_struct_remove(global.gml_const_map, arg0);
        variable_struct_remove(global.gml_const_val, arg0);
        return true;
    }
    else
    {
        return false;
    }
}

function gml_asset_add(arg0, arg1)
{
    variable_struct_set(global.gml_asset_index, arg0, arg1);
}

function compile_gml_compile_call_func_proc_lf(arg0, arg1, arg2, arg3)
{
    var l_argc = self.argc;
    var l_i = arg3[0] - l_argc;
    array_set(arg3, 0, l_i);
    arg0.h_result = undefined;
    var l_pr = self.func(arg0, arg2, arg3, l_i + 1, l_argc);
    if (l_pr != 3)
    {
        array_set(arg2, 2, @@array_get@@(arg2, 2) + 1);
        l_i = arg3[0] + 1;
        if (l_i >= array_length(arg3))
        {
            array_set(arg3, array_length(arg3) * 2, 0);
        }
        array_set(arg3, l_i, arg0.h_result);
        array_set(arg3, 0, l_i);
    }
    return l_pr;
}

function compile_gml_compile_call_func_proc_lf1(arg0, arg1, arg2, arg3)
{
    var l_argc = self.argc;
    var l_i = arg3[0] - l_argc;
    array_set(arg3, 0, l_i);
    return self.func(arg0, arg2, arg3, l_i + 1, l_argc);
}

function compile_gml_compile_call_func_proc(arg0, arg1, arg2, arg3, arg4)
{
    var l_fname = arg2.h_name;
    var l_argc = array_length(arg3);
    var l_func = arg2.h_func;
    var l_funcFlags = arg2.h_call_type;
    if (l_funcFlags == undefined)
    {
        l_funcFlags = 0;
    }
    if (l_func == -1)
    {
        return gml_compile_error("Function `" + l_fname + "` is pointing at an invalid script.", arg1);
    }
    var l_startArg = 0;
    var l_firstArgVar = -1;
    if (l_funcFlags == 0 && l_argc > 0 && l_argc <= 5)
    {
        var l__g = arg3[0];
        if (l__g[0] == 43)
        {
            l_firstArgVar = variable_struct_get(global.gml_compile_curr_script.h_local_map, l__g[2]);
            l_startArg++;
        }
    }
    compile_gml_compile_args_proc(arg0, arg3, l_startArg);
    if (l_funcFlags == -5)
    {
        ds_list_add(arg0, gml_action_call_func(arg1, l_func, l_argc, arg2.h_arg_type_checks, arg2.h_rest_type_check, l_funcFlags, false));
        if (arg4)
        {
            ds_list_add(arg0, gml_action_result(arg1));
        }
        return false;
    }
    if (l_funcFlags == -7)
    {
        if (arg4)
        {
            ds_list_add(arg0, vm_v2_gml_action_closure_bind(arg1, "action call", 
            {
                func: l_func,
                argc: l_argc
            }, compile_gml_compile_call_func_proc_lf));
            ds_list_add(arg0, gml_action_result(arg1));
        }
        else
        {
            ds_list_add(arg0, vm_v2_gml_action_closure_bind(arg1, "action call", 
            {
                func: l_func,
                argc: l_argc
            }, compile_gml_compile_call_func_proc_lf1));
        }
        return false;
    }
    if (l_firstArgVar >= 0)
    {
        switch (l_argc)
        {
            case 1:
                if (arg4)
                {
                    ds_list_add(arg0, gml_action_call_func_with_local0o(arg1, l_func, l_firstArgVar));
                    return false;
                }
                else
                {
                    ds_list_add(arg0, gml_action_call_func_with_local0(arg1, l_func, l_firstArgVar));
                    return false;
                }
            case 2:
                if (arg4)
                {
                    ds_list_add(arg0, gml_action_call_func_with_local1o(arg1, l_func, l_firstArgVar));
                    return false;
                }
                else
                {
                    ds_list_add(arg0, gml_action_call_func_with_local1(arg1, l_func, l_firstArgVar));
                    return false;
                }
            case 3:
                if (arg4)
                {
                    ds_list_add(arg0, gml_action_call_func_with_local2o(arg1, l_func, l_firstArgVar));
                    return false;
                }
                else
                {
                    ds_list_add(arg0, gml_action_call_func_with_local2(arg1, l_func, l_firstArgVar));
                    return false;
                }
            case 4:
                if (arg4)
                {
                    ds_list_add(arg0, gml_action_call_func_with_local3o(arg1, l_func, l_firstArgVar));
                    return false;
                }
                else
                {
                    ds_list_add(arg0, gml_action_call_func_with_local3(arg1, l_func, l_firstArgVar));
                    return false;
                }
            case 5:
                if (arg4)
                {
                    ds_list_add(arg0, gml_action_call_func_with_local4o(arg1, l_func, l_firstArgVar));
                    return false;
                    break;
                }
                ds_list_add(arg0, gml_action_call_func_with_local4(arg1, l_func, l_firstArgVar));
                return false;
        }
    }
    if (l_funcFlags == 0 && l_argc <= 4)
    {
        switch (l_argc)
        {
            case 0:
                if (arg4)
                {
                    ds_list_add(arg0, gml_action_call_func0o(arg1, l_func));
                    return false;
                }
                else
                {
                    ds_list_add(arg0, gml_action_call_func0(arg1, l_func));
                    return false;
                }
            case 1:
                if (arg4)
                {
                    ds_list_add(arg0, gml_action_call_func1o(arg1, l_func));
                    return false;
                }
                else
                {
                    ds_list_add(arg0, gml_action_call_func1(arg1, l_func));
                    return false;
                }
            case 2:
                if (arg4)
                {
                    ds_list_add(arg0, gml_action_call_func2o(arg1, l_func));
                    return false;
                }
                else
                {
                    ds_list_add(arg0, gml_action_call_func2(arg1, l_func));
                    return false;
                }
            case 3:
                if (arg4)
                {
                    ds_list_add(arg0, gml_action_call_func3o(arg1, l_func));
                    return false;
                }
                else
                {
                    ds_list_add(arg0, gml_action_call_func3(arg1, l_func));
                    return false;
                }
            case 4:
                if (arg4)
                {
                    ds_list_add(arg0, gml_action_call_func4o(arg1, l_func));
                    return false;
                    break;
                }
                ds_list_add(arg0, gml_action_call_func4(arg1, l_func));
                return false;
        }
    }
    ds_list_add(arg0, gml_action_call_func(arg1, l_func, l_argc, arg2.h_arg_type_checks, arg2.h_rest_type_check, l_funcFlags, arg4));
    return false;
}

function vm_v2_gml_action_closure_bind(arg0, arg1, arg2, arg3)
{
    return gml_action_closure(arg0, arg1, arg2, method(arg2, arg3));
}

function compile_gml_compile_adjfix_proc_lf(arg0, arg1, arg2, arg3)
{
    var l_locals = arg2[4];
    var l_tmp = self.ind;
    var l_v = l_locals[l_tmp] + 1;
    array_set(l_locals, l_tmp, l_v);
    var l_i = arg3[0] + 1;
    if (l_i >= array_length(arg3))
    {
        array_set(arg3, array_length(arg3) * 2, 0);
    }
    array_set(arg3, l_i, l_v);
    array_set(arg3, 0, l_i);
    return 0;
}

function compile_gml_compile_adjfix_proc_lf1(arg0, arg1, arg2, arg3)
{
    var l_locals = arg2[4];
    var l_tmp = self.ind;
    var l_v = l_locals[l_tmp] - 1;
    array_set(l_locals, l_tmp, l_v);
    var l_i = arg3[0] + 1;
    if (l_i >= array_length(arg3))
    {
        array_set(arg3, array_length(arg3) * 2, 0);
    }
    array_set(arg3, l_i, l_v);
    array_set(arg3, 0, l_i);
    return 0;
}

function compile_gml_compile_adjfix_proc_lf2(arg0, arg1, arg2, arg3)
{
    var l_locals = arg2[4];
    var l_tmp = self.ind;
    var l_tmp1 = l_locals[l_tmp];
    array_set(l_locals, l_tmp, l_tmp1 + 1);
    var l_i = arg3[0] + 1;
    if (l_i >= array_length(arg3))
    {
        array_set(arg3, array_length(arg3) * 2, 0);
    }
    array_set(arg3, l_i, l_tmp1);
    array_set(arg3, 0, l_i);
    return 0;
}

function compile_gml_compile_adjfix_proc_lf3(arg0, arg1, arg2, arg3)
{
    var l_locals = arg2[4];
    var l_tmp = self.ind;
    var l_tmp1 = l_locals[l_tmp];
    array_set(l_locals, l_tmp, l_tmp1 - 1);
    var l_i = arg3[0] + 1;
    if (l_i >= array_length(arg3))
    {
        array_set(arg3, array_length(arg3) * 2, 0);
    }
    array_set(arg3, l_i, l_tmp1);
    array_set(arg3, 0, l_i);
    return 0;
}

function compile_gml_compile_adjfix_proc(arg0, arg1, arg2, arg3, arg4, arg5)
{
    var l_diff = arg3 ? 1 : -1;
    var l__g = arg1;
    switch (l__g[0])
    {
        case UnknownEnum.Value_43:
            var l_localInd = variable_struct_get(global.gml_compile_curr_script.h_local_map, l__g[2]);
            if (arg2)
            {
                if (arg3)
                {
                    ds_list_add(arg4, vm_v2_gml_action_closure_bind(arg0, "push(++local)", 
                    {
                        ind: l_localInd
                    }, compile_gml_compile_adjfix_proc_lf));
                    return false;
                }
                else
                {
                    ds_list_add(arg4, vm_v2_gml_action_closure_bind(arg0, "push(--local)", 
                    {
                        ind: l_localInd
                    }, compile_gml_compile_adjfix_proc_lf1));
                    return false;
                }
            }
            else if (arg3)
            {
                ds_list_add(arg4, vm_v2_gml_action_closure_bind(arg0, "push(local++)", 
                {
                    ind: l_localInd
                }, compile_gml_compile_adjfix_proc_lf2));
                return false;
            }
            else
            {
                ds_list_add(arg4, vm_v2_gml_action_closure_bind(arg0, "push(local--)", 
                {
                    ind: l_localInd
                }, compile_gml_compile_adjfix_proc_lf3));
                return false;
            }
        case UnknownEnum.Value_46:
            return compile_groups_gml_compile_group_static_proc_static_adjfix(arg4, arg0, l__g[2], arg2, arg3);
        case UnknownEnum.Value_52:
            return compile_groups_gml_compile_group_static_proc_script_static_adjfix(arg4, arg0, l__g[2], l__g[3], arg2, arg3);
        case UnknownEnum.Value_49:
            var l_s = l__g[2];
            ds_list_add(arg4, gml_action_global_hx(arg0, l_s));
            if (arg2)
            {
                ds_list_add(arg4, gml_action_add_int(arg0, l_diff));
            }
            if (arg5)
            {
                ds_list_add(arg4, gml_action_dup(arg0));
            }
            if (!arg2)
            {
                ds_list_add(arg4, gml_action_add_int(arg0, l_diff));
            }
            ds_list_add(arg4, gml_action_global_set(arg0, l_s));
            break;
        case UnknownEnum.Value_55:
            var l_obj = l__g[2];
            var l_field = l__g[3];
            if (gml_compile_node(l_obj, arg4, true))
            {
                return true;
            }
            var l_fastGetter = global.gml_compile_curr_program.h_get_fast_getter(l_field);
            var l_fastSetter = global.gml_compile_curr_program.h_get_fast_setter_after_getter(l_field);
            if (l_fastGetter != undefined && l_fastSetter != undefined)
            {
                ds_list_add(arg4, gml_action_dup(arg0));
                ds_list_add(arg4, gml_action_call_func1o(arg0, l_fastGetter));
                if (arg2)
                {
                    ds_list_add(arg4, gml_action_add_int(arg0, l_diff));
                }
                if (arg5)
                {
                    ds_list_add(arg4, gml_action_dup_in(arg0, 2));
                }
                if (!arg2)
                {
                    ds_list_add(arg4, gml_action_add_int(arg0, l_diff));
                }
                ds_list_add(arg4, gml_action_call_func2(arg0, l_fastSetter));
            }
            else
            {
                ds_list_add(arg4, gml_action_dup(arg0));
                ds_list_add(arg4, gml_action_field(arg0, l_field));
                if (arg2)
                {
                    ds_list_add(arg4, gml_action_add_int(arg0, l_diff));
                }
                if (arg5)
                {
                    ds_list_add(arg4, gml_action_dup_in(arg0, 2));
                }
                if (!arg2)
                {
                    ds_list_add(arg4, gml_action_add_int(arg0, l_diff));
                }
                ds_list_add(arg4, gml_action_field_set(arg0, l_field));
            }
            break;
        case UnknownEnum.Value_70:
            if (compile_gml_compile_args_proc(arg4, [l__g[2], l__g[3]]))
            {
                return true;
            }
            ds_list_add(arg4, gml_action_dup2x(arg0));
            ds_list_add(arg4, gml_action_index(arg0));
            if (arg2)
            {
                ds_list_add(arg4, gml_action_add_int(arg0, l_diff));
            }
            if (arg5)
            {
                ds_list_add(arg4, gml_action_dup_in(arg0, 3));
            }
            if (!arg2)
            {
                ds_list_add(arg4, gml_action_add_int(arg0, l_diff));
            }
            ds_list_add(arg4, gml_action_index_set(arg0));
            break;
        case UnknownEnum.Value_76:
            if (compile_gml_compile_args_proc(arg4, [l__g[2], l__g[3]]))
            {
                return true;
            }
            ds_list_add(arg4, gml_action_dup2x(arg0));
            ds_list_add(arg4, gml_action_index(arg0));
            if (arg2)
            {
                ds_list_add(arg4, gml_action_add_int(arg0, l_diff));
            }
            if (arg5)
            {
                ds_list_add(arg4, gml_action_dup_in(arg0, 3));
            }
            if (!arg2)
            {
                ds_list_add(arg4, gml_action_add_int(arg0, l_diff));
            }
            ds_list_add(arg4, gml_action_index_set(arg0));
            break;
        case UnknownEnum.Value_73:
            if (compile_gml_compile_args_proc(arg4, [l__g[2], l__g[3], l__g[4]]))
            {
                return true;
            }
            ds_list_add(arg4, gml_action_dup3x(arg0));
            ds_list_add(arg4, gml_action_index2d(arg0));
            if (arg2)
            {
                ds_list_add(arg4, gml_action_add_int(arg0, l_diff));
            }
            if (arg5)
            {
                ds_list_add(arg4, gml_action_dup_in(arg0, 4));
            }
            if (!arg2)
            {
                ds_list_add(arg4, gml_action_add_int(arg0, l_diff));
            }
            ds_list_add(arg4, gml_action_index2d_set(arg0));
            break;
        case UnknownEnum.Value_79:
            if (compile_gml_compile_args_proc(arg4, [l__g[2], l__g[3], l__g[4]]))
            {
                return true;
            }
            ds_list_add(arg4, gml_action_dup3x(arg0));
            ds_list_add(arg4, gml_action_index2d(arg0));
            if (arg2)
            {
                ds_list_add(arg4, gml_action_add_int(arg0, l_diff));
            }
            if (arg5)
            {
                ds_list_add(arg4, gml_action_dup_in(arg0, 4));
            }
            if (!arg2)
            {
                ds_list_add(arg4, gml_action_add_int(arg0, l_diff));
            }
            ds_list_add(arg4, gml_action_index2d_set(arg0));
            break;
        case UnknownEnum.Value_91:
            if (compile_gml_compile_args_proc(arg4, [l__g[2], l__g[3]]))
            {
                return true;
            }
            var l_fget = struct_get_from_hash(global.gml_func_map, variable_get_hash("variable_struct_get"));
            var l_fset = struct_get_from_hash(global.gml_func_map, variable_get_hash("variable_struct_set"));
            if (l_fget != undefined && l_fset != undefined)
            {
                ds_list_add(arg4, gml_action_dup2x(arg0));
                ds_list_add(arg4, gml_action_call_func(arg0, l_fget.h_func, 2, l_fget.h_arg_type_checks, l_fget.h_rest_type_check, 0, true));
                if (arg2)
                {
                    ds_list_add(arg4, gml_action_add_int(arg0, l_diff));
                }
                if (arg5)
                {
                    ds_list_add(arg4, gml_action_dup_in(arg0, 3));
                }
                if (!arg2)
                {
                    ds_list_add(arg4, gml_action_add_int(arg0, l_diff));
                }
                ds_list_add(arg4, gml_action_call_func(arg0, l_fset.h_func, 3, l_fset.h_arg_type_checks, l_fset.h_rest_type_check, 0, false));
                return false;
            }
            else
            {
                return gml_compile_error("Operation not supported - requires variable_struct_get and variable_struct_set functions.", arg0);
            }
        case UnknownEnum.Value_82:
            if (compile_gml_compile_args_proc(arg4, [l__g[2], l__g[3]]))
            {
                return true;
            }
            l_fget = struct_get_from_hash(global.gml_func_map, variable_get_hash("ds_list_find_value"));
            l_fset = struct_get_from_hash(global.gml_func_map, variable_get_hash("ds_list_set"));
            if (l_fget != undefined && l_fset != undefined)
            {
                ds_list_add(arg4, gml_action_dup2x(arg0));
                ds_list_add(arg4, gml_action_call_func(arg0, l_fget.h_func, 2, l_fget.h_arg_type_checks, l_fget.h_rest_type_check, 0, true));
                if (arg2)
                {
                    ds_list_add(arg4, gml_action_add_int(arg0, l_diff));
                }
                if (arg5)
                {
                    ds_list_add(arg4, gml_action_dup_in(arg0, 3));
                }
                if (!arg2)
                {
                    ds_list_add(arg4, gml_action_add_int(arg0, l_diff));
                }
                ds_list_add(arg4, gml_action_call_func(arg0, l_fset.h_func, 3, l_fset.h_arg_type_checks, l_fset.h_rest_type_check, 0, false));
                return false;
            }
            else
            {
                return gml_compile_error("Operation not supported - requires ds_list_find_value and ds_list_set functions.", arg0);
            }
        case UnknownEnum.Value_85:
            if (compile_gml_compile_args_proc(arg4, [l__g[2], l__g[3]]))
            {
                return true;
            }
            l_fget = struct_get_from_hash(global.gml_func_map, variable_get_hash("ds_map_find_value"));
            l_fset = struct_get_from_hash(global.gml_func_map, variable_get_hash("ds_map_set"));
            if (l_fget != undefined && l_fset != undefined)
            {
                ds_list_add(arg4, gml_action_dup2x(arg0));
                ds_list_add(arg4, gml_action_call_func(arg0, l_fget.h_func, 2, l_fget.h_arg_type_checks, l_fget.h_rest_type_check, 0, true));
                if (arg2)
                {
                    ds_list_add(arg4, gml_action_add_int(arg0, l_diff));
                }
                if (arg5)
                {
                    ds_list_add(arg4, gml_action_dup_in(arg0, 3));
                }
                if (!arg2)
                {
                    ds_list_add(arg4, gml_action_add_int(arg0, l_diff));
                }
                ds_list_add(arg4, gml_action_call_func(arg0, l_fset.h_func, 3, l_fset.h_arg_type_checks, l_fset.h_rest_type_check, 0, false));
                return false;
            }
            else
            {
                return gml_compile_error("Operation not supported - requires ds_map_find_value and ds_map_set functions.", arg0);
            }
        case UnknownEnum.Value_88:
            if (compile_gml_compile_args_proc(arg4, [l__g[2], l__g[3], l__g[4]]))
            {
                return true;
            }
            l_fget = struct_get_from_hash(global.gml_func_map, variable_get_hash("ds_grid_get"));
            l_fset = struct_get_from_hash(global.gml_func_map, variable_get_hash("ds_grid_set"));
            if (l_fget != undefined && l_fset != undefined)
            {
                ds_list_add(arg4, gml_action_dup3x(arg0));
                ds_list_add(arg4, gml_action_call_func(arg0, l_fget.h_func, 3, l_fget.h_arg_type_checks, l_fget.h_rest_type_check, 0, true));
                if (arg2)
                {
                    ds_list_add(arg4, gml_action_add_int(arg0, l_diff));
                }
                if (arg5)
                {
                    ds_list_add(arg4, gml_action_dup_in(arg0, 4));
                }
                if (!arg2)
                {
                    ds_list_add(arg4, gml_action_add_int(arg0, l_diff));
                }
                ds_list_add(arg4, gml_action_call_func(arg0, l_fset.h_func, 4, l_fset.h_arg_type_checks, l_fset.h_rest_type_check, 0, false));
                return false;
            }
            else
            {
                return gml_compile_error("Operation not supported - requires ds_grid_get and ds_grid_set functions.", arg0);
            }
        default:
            return gml_compile_error("Can't apply " + (arg2 ? "prefix" : "postfix") + (arg3 ? "++" : "--") + " to " + gml_std_Type_enumConstructor(arg1), arg0);
    }
    return false;
}

function compile_groups_gml_compile_group_static_has_statics_init()
{
    try
    {
        return static_get != undefined;
    }
    catch (l__g)
    {
    }
    return false;
}

function compile_groups_gml_compile_group_static_no_static_writes(arg0)
{
    return gml_compile_error("Cannot modify static variables in a constructor", arg0);
}

function compile_groups_gml_compile_group_static_proc_dot_static_lf(arg0, arg1, arg2, arg3)
{
    var l_v = variable_struct_get(static_get(self.gmlScript), self.name);
    var l_i = arg3[0] + 1;
    if (l_i >= array_length(arg3))
    {
        array_set(arg3, array_length(arg3) * 2, 0);
    }
    array_set(arg3, l_i, l_v);
    array_set(arg3, 0, l_i);
    return 0;
}

function compile_groups_gml_compile_group_static_proc_dot_static_lf1(arg0, arg1, arg2, arg3)
{
    var l_v = variable_struct_get(static_get(self.gmlScript), self.name);
    var l_i = arg3[0] + 1;
    if (l_i >= array_length(arg3))
    {
        array_set(arg3, array_length(arg3) * 2, 0);
    }
    array_set(arg3, l_i, l_v);
    array_set(arg3, 0, l_i);
    return 0;
}

function compile_groups_gml_compile_group_static_proc_dot_static_lf2(arg0, arg1, arg2, arg3)
{
    var l_this1 = static_get(self.gmlScript);
    var l_i = arg3[0];
    var l_r = arg3[l_i];
    array_set(arg3, l_i, 0);
    array_set(arg3, 0, l_i - 1);
    variable_struct_set(l_this1, self.name, l_r);
    return 0;
}

function compile_groups_gml_compile_group_static_proc_dot_static_lf3(arg0, arg1, arg2, arg3)
{
    var l_this1 = static_get(self.gmlScript);
    var l_i = arg3[0];
    var l_r = arg3[l_i];
    array_set(arg3, l_i, 0);
    array_set(arg3, 0, l_i - 1);
    variable_struct_set(l_this1, self.name, l_r);
    return 0;
}

function compile_groups_gml_compile_group_static_proc_dot_static_lf4(arg0, arg1, arg2, arg3)
{
    var l_statics = static_get(self.gmlScript);
    variable_struct_set(l_statics, self.name, self.op(variable_struct_get(l_statics, self.name), gml_stack_pop(arg3)));
    return 0;
}

function compile_groups_gml_compile_group_static_proc_dot_static_lf5(arg0, arg1, arg2, arg3)
{
    var l_statics = static_get(self.gmlScript);
    variable_struct_set(l_statics, self.name, self.op(variable_struct_get(l_statics, self.name), gml_stack_pop(arg3)));
    return 0;
}

function compile_groups_gml_compile_group_static_proc_dot_static(arg0, arg1, arg2, arg3)
{
    var l__g = arg0;
    switch (l__g[0])
    {
        case UnknownEnum.Value_46:
            ds_list_add(arg1, vm_v2_gml_action_closure_bind(l__g[1], "script.static[]", 
            {
                gmlScript: arg3,
                name: l__g[2]
            }, compile_groups_gml_compile_group_static_proc_dot_static_lf1));
            break;
        case UnknownEnum.Value_52:
            ds_list_add(arg1, vm_v2_gml_action_closure_bind(l__g[1], "script.static[]", 
            {
                gmlScript: arg3,
                name: l__g[3]
            }, compile_groups_gml_compile_group_static_proc_dot_static_lf));
            break;
        case UnknownEnum.Value_47:
            if (gml_compile_node(l__g[3], arg1, true))
            {
                return true;
            }
            ds_list_add(arg1, vm_v2_gml_action_closure_bind(l__g[1], "script.static[] = pop()", 
            {
                gmlScript: arg3,
                name: l__g[2]
            }, compile_groups_gml_compile_group_static_proc_dot_static_lf2));
            break;
        case UnknownEnum.Value_53:
            if (gml_compile_node(l__g[4], arg1, true))
            {
                return true;
            }
            ds_list_add(arg1, vm_v2_gml_action_closure_bind(l__g[1], "script.static[] = pop()", 
            {
                gmlScript: arg3,
                name: l__g[3]
            }, compile_groups_gml_compile_group_static_proc_dot_static_lf3));
            break;
        case UnknownEnum.Value_48:
            if (gml_compile_node(l__g[4], arg1, true))
            {
                return true;
            }
            ds_list_add(arg1, vm_v2_gml_action_closure_bind(l__g[1], "script.static[] op= pop()", 
            {
                gmlScript: arg3,
                name: l__g[2],
                op: global.gml_op_apply_fns[l__g[3]]
            }, compile_groups_gml_compile_group_static_proc_dot_static_lf4));
            break;
        case UnknownEnum.Value_54:
            if (gml_compile_node(l__g[5], arg1, true))
            {
                return true;
            }
            ds_list_add(arg1, vm_v2_gml_action_closure_bind(l__g[1], "script.static[] op= pop()", 
            {
                gmlScript: arg3,
                name: l__g[3],
                op: global.gml_op_apply_fns[l__g[4]]
            }, compile_groups_gml_compile_group_static_proc_dot_static_lf5));
            break;
        default:
            return undefined;
    }
    return false;
}

function compile_groups_gml_compile_group_static_proc_dot_static_adjfix_lf(arg0, arg1, arg2, arg3)
{
    var l_statics = static_get(self.gmlScript);
    var l_val = variable_struct_get(l_statics, self.name) + self.delta;
    variable_struct_set(l_statics, self.name, l_val);
    var l_i = arg3[0] + 1;
    if (l_i >= array_length(arg3))
    {
        array_set(arg3, array_length(arg3) * 2, 0);
    }
    array_set(arg3, l_i, l_val);
    array_set(arg3, 0, l_i);
    return 0;
}

function compile_groups_gml_compile_group_static_proc_dot_static_adjfix_lf1(arg0, arg1, arg2, arg3)
{
    var l_statics = static_get(self.gmlScript);
    var l_val = variable_struct_get(l_statics, self.name);
    variable_struct_set(l_statics, self.name, l_val + self.delta);
    var l_i = arg3[0] + 1;
    if (l_i >= array_length(arg3))
    {
        array_set(arg3, array_length(arg3) * 2, 0);
    }
    array_set(arg3, l_i, l_val);
    array_set(arg3, 0, l_i);
    return 0;
}

function compile_groups_gml_compile_group_static_proc_dot_static_adjfix(arg0, arg1, arg2, arg3, arg4, arg5)
{
    var l_ctx = 
    {
        gmlScript: arg5,
        name: arg2,
        delta: arg4 ? 1 : -1
    };
    if (arg3)
    {
        ds_list_add(arg0, vm_v2_gml_action_closure_bind(arg1, arg4 ? "push(++static)" : "push(--static)", l_ctx, compile_groups_gml_compile_group_static_proc_dot_static_adjfix_lf));
    }
    else
    {
        ds_list_add(arg0, vm_v2_gml_action_closure_bind(arg1, arg4 ? "push(static++)" : "push(static--)", l_ctx, compile_groups_gml_compile_group_static_proc_dot_static_adjfix_lf1));
    }
    return false;
}

function compile_groups_gml_compile_group_static_proc_static_lf(arg0, arg1, arg2, arg3)
{
    var l_v = self.values[self.ind];
    var l_i = arg3[0] + 1;
    if (l_i >= array_length(arg3))
    {
        array_set(arg3, array_length(arg3) * 2, 0);
    }
    array_set(arg3, l_i, l_v);
    array_set(arg3, 0, l_i);
    return 0;
}

function compile_groups_gml_compile_group_static_proc_static_lf1(arg0, arg1, arg2, arg3)
{
    var l_i = arg3[0];
    var l_r = arg3[l_i];
    array_set(arg3, l_i, 0);
    array_set(arg3, 0, l_i - 1);
    array_set(self.values, self.ind, l_r);
    return 0;
}

function compile_groups_gml_compile_group_static_proc_static_lf2(arg0, arg1, arg2, arg3)
{
    var l_v = self.values;
    array_set(l_v, self.ind, self.op(self.values[self.ind], gml_stack_pop(arg3)));
    return 0;
}

function compile_groups_gml_compile_group_static_proc_static(arg0, arg1, arg2)
{
    var l__this = global.gml_compile_curr_script;
    if (!l__this.h_is_constructor && l__this.h_script_id != -1)
    {
        return compile_groups_gml_compile_group_static_proc_dot_static(arg0, arg1, arg2, global.gml_compile_curr_script.h_script_id);
    }
    var l__g = arg0;
    switch (l__g[0])
    {
        case UnknownEnum.Value_46:
            ds_list_add(arg1, vm_v2_gml_action_closure_bind(l__g[1], "static[]", 
            {
                ind: variable_struct_get(global.gml_compile_curr_script.h_static_map, l__g[2]),
                values: global.gml_compile_curr_script.h_static_values
            }, compile_groups_gml_compile_group_static_proc_static_lf));
            break;
        case UnknownEnum.Value_47:
            var l_d = l__g[1];
            var l_val = l__g[3];
            var l_isInit = l__g[4];
            if (global.gml_compile_curr_script.h_is_constructor && !l_isInit)
            {
                return compile_groups_gml_compile_group_static_no_static_writes(l_d);
            }
            if (l_isInit)
            {
                var l__g1 = l_val;
                if (l__g1[0] == 32)
                {
                    if (l__g1[3] == false)
                    {
                        gml_std_haxe_enum_tools_setTo(l_val, [UnknownEnum.Value_32, l__g1[1], l__g1[2], true]);
                    }
                }
            }
            if (gml_compile_node(l_val, arg1, true))
            {
                return true;
            }
            ds_list_add(arg1, vm_v2_gml_action_closure_bind(l_d, "static[] = pop()", 
            {
                ind: variable_struct_get(global.gml_compile_curr_script.h_static_map, l__g[2]),
                values: global.gml_compile_curr_script.h_static_values
            }, compile_groups_gml_compile_group_static_proc_static_lf1));
            break;
        case UnknownEnum.Value_48:
            var l_d = l__g[1];
            if (global.gml_compile_curr_script.h_is_constructor)
            {
                return compile_groups_gml_compile_group_static_no_static_writes(l_d);
            }
            if (gml_compile_node(l__g[4], arg1, true))
            {
                return true;
            }
            ds_list_add(arg1, vm_v2_gml_action_closure_bind(l_d, "static[] op= pop()", 
            {
                ind: variable_struct_get(global.gml_compile_curr_script.h_static_map, l__g[2]),
                values: global.gml_compile_curr_script.h_static_values,
                op: global.gml_op_apply_fns[l__g[3]]
            }, compile_groups_gml_compile_group_static_proc_static_lf2));
            break;
        default:
            return undefined;
    }
    return false;
}

function compile_groups_gml_compile_group_static_proc_static_adjfix_lf(arg0, arg1, arg2, arg3)
{
    var l_v = array_set_pre(self.values, self.ind, @@array_get@@(self.values, self.ind) + 1);
    var l_i = arg3[0] + 1;
    if (l_i >= array_length(arg3))
    {
        array_set(arg3, array_length(arg3) * 2, 0);
    }
    array_set(arg3, l_i, l_v);
    array_set(arg3, 0, l_i);
    return 0;
}

function compile_groups_gml_compile_group_static_proc_static_adjfix_lf1(arg0, arg1, arg2, arg3)
{
    var l_v = array_set_pre(self.values, self.ind, @@array_get@@(self.values, self.ind) - 1);
    var l_i = arg3[0] + 1;
    if (l_i >= array_length(arg3))
    {
        array_set(arg3, array_length(arg3) * 2, 0);
    }
    array_set(arg3, l_i, l_v);
    array_set(arg3, 0, l_i);
    return 0;
}

function compile_groups_gml_compile_group_static_proc_static_adjfix_lf2(arg0, arg1, arg2, arg3)
{
    var l_v = array_set_post(self.values, self.ind, @@array_get@@(self.values, self.ind) + 1);
    var l_i = arg3[0] + 1;
    if (l_i >= array_length(arg3))
    {
        array_set(arg3, array_length(arg3) * 2, 0);
    }
    array_set(arg3, l_i, l_v);
    array_set(arg3, 0, l_i);
    return 0;
}

function compile_groups_gml_compile_group_static_proc_static_adjfix_lf3(arg0, arg1, arg2, arg3)
{
    var l_v = array_set_post(self.values, self.ind, @@array_get@@(self.values, self.ind) - 1);
    var l_i = arg3[0] + 1;
    if (l_i >= array_length(arg3))
    {
        array_set(arg3, array_length(arg3) * 2, 0);
    }
    array_set(arg3, l_i, l_v);
    array_set(arg3, 0, l_i);
    return 0;
}

function compile_groups_gml_compile_group_static_proc_static_adjfix(arg0, arg1, arg2, arg3, arg4)
{
    var l__this = global.gml_compile_curr_script;
    if (!l__this.h_is_constructor && l__this.h_script_id != -1)
    {
        return compile_groups_gml_compile_group_static_proc_dot_static_adjfix(arg0, arg1, arg2, arg3, arg4, global.gml_compile_curr_script.h_script_id);
    }
    if (global.gml_compile_curr_script.h_is_constructor)
    {
        return compile_groups_gml_compile_group_static_no_static_writes(arg1);
    }
    var l_ctx = 
    {
        ind: variable_struct_get(global.gml_compile_curr_script.h_static_map, arg2),
        name: arg2,
        values: global.gml_compile_curr_script.h_static_values
    };
    if (arg3)
    {
        if (arg4)
        {
            ds_list_add(arg0, vm_v2_gml_action_closure_bind(arg1, "push(++static)", l_ctx, compile_groups_gml_compile_group_static_proc_static_adjfix_lf));
        }
        else
        {
            ds_list_add(arg0, vm_v2_gml_action_closure_bind(arg1, "push(--static)", l_ctx, compile_groups_gml_compile_group_static_proc_static_adjfix_lf1));
        }
    }
    else if (arg4)
    {
        ds_list_add(arg0, vm_v2_gml_action_closure_bind(arg1, "push(static++)", l_ctx, compile_groups_gml_compile_group_static_proc_static_adjfix_lf2));
    }
    else
    {
        ds_list_add(arg0, vm_v2_gml_action_closure_bind(arg1, "push(static--)", l_ctx, compile_groups_gml_compile_group_static_proc_static_adjfix_lf3));
    }
    return false;
}

function compile_groups_gml_compile_group_static_proc_script_static(arg0, arg1, arg2)
{
    var l__g = arg0;
    var l_scrName;
    switch (l__g[0])
    {
        case UnknownEnum.Value_52:
            l_scrName = l__g[2];
            break;
        case UnknownEnum.Value_53:
            l_scrName = l__g[2];
            break;
        case UnknownEnum.Value_54:
            l_scrName = l__g[2];
            break;
        default:
            return undefined;
    }
    return compile_groups_gml_compile_group_static_proc_dot_static(arg0, arg1, arg2, asset_get_index(l_scrName));
}

function compile_groups_gml_compile_group_static_proc_script_static_adjfix(arg0, arg1, arg2, arg3, arg4, arg5)
{
    return compile_groups_gml_compile_group_static_proc_dot_static_adjfix(arg0, arg1, arg3, arg4, arg5, asset_get_index(arg2));
}

function compile_groups_gml_compile_group_static_proc_dot_static_init_lf(arg0, arg1, arg2, arg3)
{
    if (variable_struct_names_count(static_get(self.gmlScript)) != 0)
    {
        array_set(arg2, 2, self.dest);
        return 2;
    }
    else
    {
        return 0;
    }
}

function compile_groups_gml_compile_group_static_proc_dot_static_init_lf1(arg0, arg1, arg2, arg3)
{
    var l_this1 = arg2[6];
    static_set(l_this1[l_this1[0]], static_get(self.gmlScript));
    return 0;
}

function compile_groups_gml_compile_group_static_proc_dot_static_init(arg0, arg1, arg2)
{
    ds_list_add(arg0, undefined);
    var l_start = ds_list_size(arg0) - 1;
    var l__g = 0;
    while (l__g < array_length(arg1))
    {
        var l_item = arg1[l__g];
        l__g++;
        if (gml_compile_node(l_item, arg0, false))
        {
            return true;
        }
    }
    ds_list_set(arg0, l_start, vm_v2_gml_action_closure_bind(global.gml_compile_curr_script.h_pos, "if script_static jump", 
    {
        gmlScript: arg2,
        dest: ds_list_size(arg0)
    }, compile_groups_gml_compile_group_static_proc_dot_static_init_lf));
    if (global.gml_compile_curr_script.h_is_constructor)
    {
        ds_list_add(arg0, vm_v2_gml_action_closure_bind(global.gml_compile_curr_script.h_pos, "static_set(self, script)", 
        {
            gmlScript: arg2
        }, compile_groups_gml_compile_group_static_proc_dot_static_init_lf1));
    }
    return false;
}

function compile_groups_gml_compile_group_static_proc_static_init_lf(arg0, arg1, arg2, arg3)
{
    if (self.ready[0])
    {
        array_set(arg2, 2, self.dest);
        return 2;
    }
    else
    {
        array_set(self.ready, 0, true);
        return 0;
    }
}

function compile_groups_gml_compile_group_static_proc_static_init_lf1(arg0, arg1, arg2, arg3)
{
    var l_this1 = arg2[6];
    var l_self1 = l_this1[l_this1[0]];
    var l_i = 0;
    var l__g1 = array_length(self.names);
    while (l_i < l__g1)
    {
        var l_val = self.values[l_i];
        if (is_method(l_val))
        {
            l_val = live_method(l_self1, l_val);
        }
        variable_struct_set(l_self1, self.names[l_i], l_val);
        l_i++;
    }
    return 0;
}

function compile_groups_gml_compile_group_static_proc_static_init(arg0)
{
    var l_initArr = global.gml_compile_curr_script.h_static_init;
    if (array_length(l_initArr) == 0)
    {
        return false;
    }
    var l__this = global.gml_compile_curr_script;
    if (!l__this.h_is_constructor && l__this.h_script_id != -1)
    {
        return compile_groups_gml_compile_group_static_proc_dot_static_init(arg0, l_initArr, global.gml_compile_curr_script.h_script_id);
    }
    ds_list_add(arg0, undefined);
    var l_start = ds_list_size(arg0) - 1;
    var l__g = 0;
    while (l__g < array_length(l_initArr))
    {
        var l_item = l_initArr[l__g];
        l__g++;
        if (gml_compile_node(l_item, arg0, false))
        {
            return true;
        }
    }
    ds_list_set(arg0, l_start, vm_v2_gml_action_closure_bind(global.gml_compile_curr_script.h_pos, "if static_ready jump", 
    {
        ready: global.gml_compile_curr_script.h_static_ready,
        dest: ds_list_size(arg0)
    }, compile_groups_gml_compile_group_static_proc_static_init_lf));
    if (global.gml_compile_curr_script.h_is_constructor)
    {
        ds_list_add(arg0, vm_v2_gml_action_closure_bind(global.gml_compile_curr_script.h_pos, "copy statics", 
        {
            names: global.gml_compile_curr_script.h_static_names,
            values: global.gml_compile_curr_script.h_static_values
        }, compile_groups_gml_compile_group_static_proc_static_init_lf1));
    }
    return false;
}

function compile_groups_gml_compile_group_static_init()
{
    gml_compile_set_handlers(compile_groups_gml_compile_group_static_proc_static, ["static", "static_set", "static_aop"]);
    gml_compile_set_handlers(compile_groups_gml_compile_group_static_proc_script_static, ["script_static", "script_static_set", "script_static_aop"]);
}

function gml_func() constructor
{
    static h_name = undefined;
    static h_signature = undefined;
    static h_is_const = undefined;
    static h_func = undefined;
    static h_raw_func = undefined;
    static h_call_type = undefined;
    static h_is_script = undefined;
    static h_arg_count = undefined;
    static h_min_args = undefined;
    static h_max_args = undefined;
    static h_arg_type_checks = undefined;
    static h_rest_type_check = undefined;
    
    static h_copy = function(arg0)
    {
        var l_f = new gml_func();
        var l_sig = self.h_signature;
        var l_pos = gml_std_string_pos_ext_haxe(l_sig, self.h_name);
        l_sig = gml_std_string_substring(l_sig, 0, l_pos) + arg0 + gml_std_string_substring(l_sig, l_pos + string_length(self.h_name));
        l_f.h_name = arg0;
        l_f.h_signature = l_sig;
        l_f.h_is_const = self.h_is_const;
        l_f.h_func = self.h_func;
        l_f.h_call_type = self.h_call_type;
        l_f.h_arg_count = self.h_arg_count;
        l_f.h_min_args = self.h_min_args;
        l_f.h_max_args = self.h_max_args;
        l_f.h_arg_type_checks = self.h_arg_type_checks;
        l_f.h_rest_type_check = self.h_rest_type_check;
        return l_f;
    };
    
    static h_init_mystery = function(arg0, arg1)
    {
        self.h_name = arg0;
        self.h_signature = arg0 + "(...)";
        self.h_is_const = false;
        self.h_func = method(undefined, arg1);
        self.h_raw_func = arg1;
        self.h_call_type = 3;
        self.h_is_script = true;
        self.h_arg_count = -1;
        self.h_min_args = 0;
        self.h_max_args = 81;
        self.h_arg_type_checks = [];
        self.h_rest_type_check = gml_type_check_any;
    };
    
    static h_set = function(arg0, arg1)
    {
        self.h_signature = arg0;
        var l_parStart = gml_std_string_pos_ext_haxe(arg0, "(") + 1;
        if (l_parStart == 0)
        {
            show_error(self.h_signature + " has no `(`", true);
        }
        var l_parEnd = gml_std_string_pos_ext_haxe(arg0, ")");
        if (l_parEnd < 0)
        {
            show_error(self.h_signature + " has no `)`", true);
        }
        var l_argText = gml_std_StringTools_trim(gml_std_string_substring(arg0, l_parStart, l_parEnd));
        var l_flags = gml_std_string_substring(arg0, l_parEnd + 1);
        var l_minArgs = -1;
        var l_restCheck = gml_type_check_any;
        var l_argCount, l_args1, l_argCheck, l_maxArgs;
        if (l_argText == "")
        {
            l_argCount = 0;
            l_maxArgs = 0;
            l_argCheck = [];
            l_args1 = undefined;
        }
        else
        {
            l_args1 = gml_std_string_split(l_argText, ",");
            l_argCount = array_length(l_args1);
            l_maxArgs = l_argCount;
            l_argCheck = array_create(l_argCount);
        }
        var l_i = 0;
        var l__g1 = l_argCount;
        while (l_i < l__g1)
        {
            var l_arg = l_args1[l_i];
            var l_isRest = false;
            l_pos = gml_std_string_pos_ext_haxe(l_arg, "=");
            var l_opt;
            if (l_pos >= 0)
            {
                l_opt = true;
                l_arg = gml_std_string_substring(l_arg, 0, l_pos);
            }
            else if (gml_std_string_pos_ext_haxe(l_arg, "...") >= 0)
            {
                l_isRest = true;
                l_opt = true;
                l_maxArgs = 81;
            }
            else
            {
                l_opt = false;
            }
            l_pos = gml_std_string_pos_ext_haxe(l_arg, ":");
            if (l_pos >= 0)
            {
                var l_typeStr = gml_std_StringTools_trim(gml_std_string_substring(l_arg, l_pos + 1));
                l_arg = gml_std_string_substring(l_arg, 0, l_pos);
                array_set(l_argCheck, l_i, gml_type_check_any);
            }
            else
            {
                array_set(l_argCheck, l_i, gml_type_check_any);
            }
            if (gml_std_string_pos_ext_haxe(l_arg, "?") >= 0 || gml_std_string_pos_ext_haxe(l_arg, "[") >= 0)
            {
                l_opt = true;
            }
            if (l_opt)
            {
                l_argCount = -1;
                if (l_minArgs < 0)
                {
                    l_minArgs = l_i;
                }
            }
            l_i++;
        }
        if (l_argCount < 0)
        {
            if (l_minArgs < 0)
            {
                l_minArgs = 0;
            }
        }
        else
        {
            l_minArgs = l_argCount;
            l_maxArgs = l_argCount;
        }
        var l_pos = 0;
        var l_inst = 0;
        for (var l__ = 0; l__ < 3; l__++)
        {
            if (string_ord_at(arg0, l_pos + 1) == 58)
            {
                l_pos++;
                l_inst++;
            }
            else
            {
                break;
            }
        }
        if (string_ord_at(arg0, l_pos + 1) == 36 && string_ord_at(arg0, l_pos + 1 + 1) == 123)
        {
            var l_start = l_pos + 2;
            l_pos = gml_std_string_pos_ext_haxe(arg0, "}", l_pos) + 1;
            switch (gml_std_string_substring(arg0, l_start, l_pos - 1))
            {
                case "raw":
                    l_inst = -5;
                    break;
                case "acall":
                    l_inst = -7;
                    break;
                default:
                    show_error("Unknown meta ${" + gml_std_string_substring(arg0, l_start, l_pos) + "} in " + arg0, true);
            }
        }
        var l_name = gml_api_parse_name(arg0, l_pos);
        var l_rawFunc;
        if (is_method(arg1))
        {
            l_rawFunc = method_get_index(arg1);
            var l__self = method_get_self(arg1);
            if (l__self != undefined)
            {
                if (instanceof(l__self) == "instance" || is_numeric(l__self))
                {
                    arg1 = method(undefined, arg1);
                }
                else
                {
                    switch (l_inst)
                    {
                        case 1:
                        case 2:
                        case 3:
                            show_error("self/other functions cannot have struct bindings in " + arg0, true);
                            break;
                    }
                }
            }
        }
        else
        {
            l_rawFunc = arg1;
            arg1 = method(undefined, arg1);
            if (arg1 >= 100000)
            {
                self.h_is_script = true;
            }
        }
        if (!global.gml_std_haxe_boot_isJS)
        {
            ds_map_set(global.gml_func_name, l_rawFunc, l_name);
        }
        self.h_raw_func = l_rawFunc;
        self.h_name = l_name;
        self.h_func = arg1;
        self.h_call_type = l_inst;
        self.h_is_const = gml_std_string_pos_ext_haxe(l_flags, "#") >= 0;
        self.h_arg_count = l_argCount;
        self.h_min_args = l_minArgs;
        self.h_max_args = l_maxArgs;
        self.h_arg_type_checks = l_argCheck;
        self.h_rest_type_check = l_restCheck;
    };
    
    static __class__ = global.mt_gml_func;
    
    self.h_is_script = false;
}

function gml_func_add(arg0, arg1)
{
    var l_f = new gml_func();
    l_f.h_set(arg0, arg1);
    variable_struct_set(global.gml_func_map, l_f.h_name, l_f);
}

function gml_func_remove(arg0)
{
    if (variable_struct_get(global.gml_func_map, arg0) == undefined)
    {
        return false;
    }
    variable_struct_remove(global.gml_func_map, arg0);
    return true;
}

function compile_gml_compile_bin_op_proc_lf(arg0, arg1, arg2, arg3)
{
    var l_v = global.gml_op_apply_fns[self.op](arg2[4][self.ind1], arg2[4][self.ind2]);
    var l_i = arg3[0] + 1;
    if (l_i >= array_length(arg3))
    {
        array_set(arg3, array_length(arg3) * 2, 0);
    }
    array_set(arg3, l_i, l_v);
    array_set(arg3, 0, l_i);
    return 0;
}

function compile_gml_compile_bin_op_proc_lf1(arg0, arg1, arg2, arg3)
{
    var l_v = global.gml_op_apply_fns[self.op](arg2[4][self.ind], self.val);
    var l_i = arg3[0] + 1;
    if (l_i >= array_length(arg3))
    {
        array_set(arg3, array_length(arg3) * 2, 0);
    }
    array_set(arg3, l_i, l_v);
    array_set(arg3, 0, l_i);
    return 0;
}

function compile_gml_compile_bin_op_proc_lf2(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0];
    array_set(arg3, l_z, global.gml_op_apply_fns[self.op](arg2[4][self.ind], arg3[l_z]));
    return 0;
}

function compile_gml_compile_bin_op_proc_lf3(arg0, arg1, arg2, arg3)
{
    var l_v = global.gml_op_apply_fns[self.op](self.val, arg2[4][self.ind]);
    var l_i = arg3[0] + 1;
    if (l_i >= array_length(arg3))
    {
        array_set(arg3, array_length(arg3) * 2, 0);
    }
    array_set(arg3, l_i, l_v);
    array_set(arg3, 0, l_i);
    return 0;
}

function compile_gml_compile_bin_op_proc_lf4(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0];
    array_set(arg3, l_z, global.gml_op_apply_fns[self.op](arg3[l_z], arg2[4][self.ind]));
    return 0;
}

function compile_gml_compile_bin_op_proc_lf5(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0];
    array_set(arg3, l_z, global.gml_op_apply_fns[self.op](self.val, arg3[l_z]));
    return 0;
}

function compile_gml_compile_bin_op_proc_lf6(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0];
    array_set(arg3, l_z, global.gml_op_apply_fns[self.op](arg3[l_z], self.val));
    return 0;
}

function compile_gml_compile_bin_op_proc(arg0, arg1, arg2, arg3, arg4)
{
    if (gml_op_is_simple(arg2))
    {
        var l__g = arg3;
        var l_ai;
        if (l__g[0] == 43)
        {
            l_ai = variable_struct_get(global.gml_compile_curr_script.h_local_map, l__g[2]);
        }
        else
        {
            l_ai = -1;
        }
        l__g = arg4;
        var l_bi;
        if (l__g[0] == 43)
        {
            l_bi = variable_struct_get(global.gml_compile_curr_script.h_local_map, l__g[2]);
        }
        else
        {
            l_bi = -1;
        }
        if (l_ai >= 0)
        {
            if (l_bi >= 0)
            {
                ds_list_add(arg0, vm_v2_gml_action_closure_bind(arg1, "push(local " + gml_op_to_string(arg2) + " local)", 
                {
                    ind1: l_ai,
                    ind2: l_bi,
                    op: arg2
                }, compile_gml_compile_bin_op_proc_lf));
                return false;
            }
            if (gml_compile_const_val_of(arg4))
            {
                ds_list_add(arg0, vm_v2_gml_action_closure_bind(arg1, "push(local " + gml_op_to_string(arg2) + " const)", 
                {
                    ind: l_ai,
                    val: global.gml_compile_const_val_of_val,
                    op: arg2
                }, compile_gml_compile_bin_op_proc_lf1));
                return false;
            }
            if (gml_compile_node(arg4, arg0, true))
            {
                return true;
            }
            ds_list_add(arg0, vm_v2_gml_action_closure_bind(arg1, "push(local " + gml_op_to_string(arg2) + " pop())", 
            {
                ind: l_ai,
                op: arg2
            }, compile_gml_compile_bin_op_proc_lf2));
            return false;
        }
        if (l_bi >= 0)
        {
            if (gml_compile_const_val_of(arg3))
            {
                ds_list_add(arg0, vm_v2_gml_action_closure_bind(arg1, "push(const " + gml_op_to_string(arg2) + " local)", 
                {
                    ind: l_bi,
                    val: global.gml_compile_const_val_of_val,
                    op: arg2
                }, compile_gml_compile_bin_op_proc_lf3));
                return false;
            }
            if (gml_compile_node(arg3, arg0, true))
            {
                return true;
            }
            ds_list_add(arg0, vm_v2_gml_action_closure_bind(arg1, "push(pop() " + gml_op_to_string(arg2) + " local)", 
            {
                ind: l_bi,
                op: arg2
            }, compile_gml_compile_bin_op_proc_lf4));
            return false;
        }
        if (gml_compile_const_val_of(arg3))
        {
            var l_val = global.gml_compile_const_val_of_val;
            if (gml_compile_node(arg4, arg0, true))
            {
                return true;
            }
            ds_list_add(arg0, vm_v2_gml_action_closure_bind(arg1, "push(const " + gml_op_to_string(arg2) + " pop())", 
            {
                val: l_val,
                op: arg2
            }, compile_gml_compile_bin_op_proc_lf5));
            return false;
        }
        if (gml_compile_const_val_of(arg4))
        {
            var l_val = global.gml_compile_const_val_of_val;
            if (gml_compile_node(arg3, arg0, true))
            {
                return true;
            }
            ds_list_add(arg0, vm_v2_gml_action_closure_bind(arg1, "push(pop() " + gml_op_to_string(arg2) + " const)", 
            {
                val: l_val,
                op: arg2
            }, compile_gml_compile_bin_op_proc_lf6));
            return false;
        }
    }
    switch (arg2)
    {
        case 18:
            if (compile_gml_compile_args_proc(arg0, [arg3, arg4]))
            {
                return true;
            }
            ds_list_add(arg0, gml_action_concat(arg1));
            break;
        case 64:
            if (compile_gml_compile_args_proc(arg0, [arg3, arg4]))
            {
                return true;
            }
            ds_list_add(arg0, gml_action_equ_op(arg1));
            break;
        case 65:
            if (compile_gml_compile_args_proc(arg0, [arg3, arg4]))
            {
                return true;
            }
            ds_list_add(arg0, gml_action_neq_op(arg1));
            break;
        case 80:
            if (gml_compile_node(arg3, arg0, true))
            {
                return true;
            }
            var l_p0 = ds_list_size(arg0);
            ds_list_add(arg0, gml_action_bool_and(arg1, 0));
            if (gml_compile_node(arg4, arg0, true))
            {
                return true;
            }
            ds_list_set(arg0, l_p0, gml_action_bool_and(arg1, ds_list_size(arg0)));
            break;
        case 96:
            if (gml_compile_node(arg3, arg0, true))
            {
                return true;
            }
            var l_p0 = ds_list_size(arg0);
            ds_list_add(arg0, gml_action_bool_or(arg1, 0));
            if (gml_compile_node(arg4, arg0, true))
            {
                return true;
            }
            ds_list_set(arg0, l_p0, gml_action_bool_or(arg1, ds_list_size(arg0)));
            break;
        default:
            if (compile_gml_compile_args_proc(arg0, [arg3, arg4]))
            {
                return true;
            }
            ds_list_add(arg0, gml_action_bin_op(arg1, arg2));
    }
    return false;
}

function gml_value_get_type(arg0)
{
    if (arg0 == undefined)
    {
        return "undefined";
    }
    else if (is_numeric(arg0))
    {
        return "number";
    }
    else if (is_string(arg0))
    {
        return "string";
    }
    else if (is_struct(arg0))
    {
        return "struct";
    }
    else if (is_array(arg0))
    {
        return "array";
    }
    else
    {
        return typeof(arg0);
    }
}

function gml_value_print(arg0)
{
    ds_map_clear(global.vm_value_gml_value_printer_print_refs);
    global.vm_value_gml_value_printer_print_num = 0;
    var l_r = vm_value_gml_value_printer_print_rec(arg0, 0);
    ds_map_clear(global.vm_value_gml_value_printer_print_refs);
    return l_r;
}

function gml_value_dump(arg0)
{
    if (instanceof(arg0) == "instance")
    {
        return "`" + gml_value_print(arg0) + "` (instance of " + object_get_name(arg0.object_index) + ")";
    }
    return "`" + gml_value_print(arg0) + "` (" + gml_value_get_type(arg0) + ")";
}

function vm_value_gml_value_printer_print_rec(arg0, arg1)
{
    var l_id = global.vm_value_gml_value_printer_print_num++;
    if (arg0 == undefined)
    {
        return "undefined";
    }
    if (is_int64(arg0))
    {
        return string(arg0);
    }
    if (is_bool(arg0))
    {
        if (arg0)
        {
            return "true";
        }
        else
        {
            return "false";
        }
    }
    if (is_numeric(arg0))
    {
        if (sign(frac(arg0)) == 0)
        {
            return string(arg0);
        }
        else
        {
            return json_stringify(arg0);
        }
    }
    if (is_string(arg0))
    {
        return json_stringify(arg0);
    }
    else if (is_array(arg0))
    {
        var l_r = ds_map_find_value(global.vm_value_gml_value_printer_print_refs, arg0);
        if (l_r != undefined)
        {
            return l_r;
        }
        ds_map_set(global.vm_value_gml_value_printer_print_refs, arg0, "@" + string(l_id));
        var l_n = array_length(arg0);
        if (l_n > 0)
        {
            if (++arg1 > 8)
            {
                return "[...]";
            }
            l_r = "[" + vm_value_gml_value_printer_print_rec(arg0[0], arg1);
            for (var l_i = 1; l_i < l_n; l_i++)
            {
                l_r += (", " + vm_value_gml_value_printer_print_rec(arg0[l_i], arg1));
            }
            return l_r + "]";
        }
        else
        {
            return "[]";
        }
    }
    if (instanceof(arg0) == "instance")
    {
        var l_q = arg0;
        return "instance#" + string(l_q.id) + "(" + object_get_name(l_q.object_index) + ")";
    }
    return string(arg0);
}

function gml_std_Std_stringify(arg0)
{
    if (arg0 == undefined)
    {
        return "null";
    }
    if (is_string(arg0))
    {
        return arg0;
    }
    if (is_struct(arg0))
    {
        var l_e = struct_get_from_hash(arg0, variable_get_hash("__enum__"));
        if (l_e == undefined)
        {
            return string(arg0);
        }
        var l_ects = l_e.h_constructors;
        var l_s;
        if (l_ects != undefined)
        {
            l_i = arg0.__enumIndex__;
            if (l_i >= 0 && l_i < array_length(l_ects))
            {
                l_s = l_ects[l_i];
            }
            else
            {
                l_s = "?";
            }
        }
        else
        {
            l_s = instanceof(arg0);
            if (string_copy(l_s, 1, 3) == "mc_")
            {
                l_s = string_delete(l_s, 1, 3);
            }
            l_n = string_length(l_e.h_name);
            if (string_copy(l_s, 1, l_n) == l_e.h_name)
            {
                l_s = string_delete(l_s, 1, l_n + 1);
            }
        }
        l_s += "(";
        var l_fields = arg0.__enumParams__;
        var l_n = array_length(l_fields);
        var l_i = -1;
        while (++l_i < l_n)
        {
            if (l_i > 0)
            {
                l_s += ", ";
            }
            l_s += gml_std_Std_stringify(variable_struct_get(arg0, l_fields[l_i]));
        }
        return l_s + ")";
    }
    if (is_real(arg0))
    {
        var l_s = string_format(arg0, 0, 16);
        var l_n = string_byte_length(l_s);
        var l_i = l_n;
        while (l_i > 0)
        {
            switch (string_byte_at(l_s, l_i))
            {
                case 48:
                    l_i--;
                    continue;
                case 46:
                    l_i--;
                    break;
            }
            break;
        }
        return string_copy(l_s, 1, l_i);
    }
    return string(arg0);
}

function gml_std_Std_parseFloat(arg0)
{
    var l_l = string_length(arg0);
    var l_n = string_length(string_digits(arg0));
    var l_p = string_pos(".", arg0);
    var l_e = string_pos("e", arg0);
    if (l_e == 0)
    {
        l_e = string_pos("E", arg0);
    }
    switch (l_e)
    {
        case 0:
            break;
        case 1:
            return NaN;
        case 2:
            if (l_p > 0)
            {
                return NaN;
            }
            break;
        default:
            if (l_p > 0 && l_e < l_p)
            {
                return NaN;
            }
    }
    if (l_e != 0 && l_e < (l_l - 1))
    {
        switch (string_ord_at(arg0, l_e + 1))
        {
            case 43:
            case 45:
                l_l--;
                break;
        }
    }
    if (l_n && l_n == (l_l - (string_ord_at(arg0, 1) == 45) - (l_p != 0) - (l_e != 0)))
    {
        return real(arg0);
    }
    else
    {
        return NaN;
    }
}

function gml_std_Std_parseInt(arg0)
{
    var l_n = string_length(string_digits(arg0));
    if (l_n && l_n == (string_length(arg0) - (string_ord_at(arg0, 1) == 45)))
    {
        return real(arg0);
    }
    else
    {
        return undefined;
    }
}

function gml_std_string_pos_ext_haxe(arg0, arg1, arg2 = 0)
{
    if (arg2 <= 0)
    {
        return string_pos(arg1, arg0) - 1;
    }
    return string_pos_ext(arg1, arg0, arg2) - 1;
}

function gml_std_string_last_pos_haxe(arg0, arg1, arg2)
{
    if (arg2 == undefined || arg2 >= string_length(arg0))
    {
        return string_last_pos(arg1, arg0) - 1;
    }
    return string_last_pos_ext(arg1, arg0, arg2) - 1;
}

function gml_std_string_split(arg0, arg1)
{
    var l_str = arg0;
    var l_num = 0;
    var l_arr = array_create(string_count(arg1, l_str) + 1);
    var l_pos = string_pos(arg1, l_str);
    while (l_pos > 0)
    {
        array_set(l_arr, l_num, string_copy(l_str, 1, l_pos - 1));
        l_num++;
        l_str = string_delete(l_str, 1, l_pos);
        l_pos = string_pos(arg1, l_str);
    }
    array_set(l_arr, l_num, l_str);
    return l_arr;
}

function gml_std_string_substr(arg0, arg1, arg2)
{
    if (arg1 < 0)
    {
        arg1 += string_length(arg0);
    }
    if (arg2 == undefined)
    {
        return string_delete(arg0, 1, arg1);
    }
    else
    {
        return string_copy(arg0, 1 + arg1, arg2);
    }
}

function gml_std_string_substring(arg0, arg1, arg2)
{
    if (arg2 == undefined)
    {
        if (arg1 > 0)
        {
            return string_delete(arg0, 1, arg1);
        }
        else
        {
            return arg0;
        }
    }
    if (arg1 < 0)
    {
        arg1 = 0;
    }
    if (arg2 < 0)
    {
        arg2 = 0;
    }
    if (arg1 > arg2)
    {
        var l_tmp = arg1;
        arg1 = arg2;
        arg2 = l_tmp;
    }
    var l_len = string_length(arg0);
    if (arg1 >= l_len)
    {
        return "";
    }
    else if (arg2 >= l_len)
    {
        if (arg1 > 0)
        {
            return string_delete(arg0, 1, arg1);
        }
        else
        {
            return arg0;
        }
    }
    else
    {
        return string_copy(arg0, arg1 + 1, arg2 - arg1);
    }
}

function gml_op_is_simple(arg0)
{
    switch (arg0)
    {
        case 18:
        case 80:
        case 96:
            return false;
        default:
            return true;
    }
}

function gml_op_get_priority(arg0)
{
    return arg0 >> 4;
}

function gml_op_to_string(arg0)
{
    switch (arg0)
    {
        case -1:
            return "";
        case 0:
            return "*";
        case 1:
            return "/";
        case 3:
            return "div";
        case 2:
            return "%";
        case 16:
            return "+";
        case 17:
            return "-";
        case 18:
            return "+";
        case 32:
            return "<<";
        case 33:
            return ">>";
        case 48:
            return "|";
        case 49:
            return "&";
        case 50:
            return "^";
        case 64:
            return "==";
        case 65:
            return "!=";
        case 68:
            return ">";
        case 66:
            return "<";
        case 69:
            return ">=";
        case 67:
            return "<=";
        case 80:
            return "&&";
        case 96:
            return "||";
        default:
            return gml_op_get_name(arg0);
    }
}

function gml_op_apply_init_lf(arg0, arg1)
{
    return arg0 + arg1;
}

function gml_op_apply_init_lf1(arg0, arg1)
{
    return arg0 - arg1;
}

function gml_op_apply_init_lf2(arg0, arg1)
{
    return arg0 * arg1;
}

function gml_op_apply_init_lf3(arg0, arg1)
{
    return arg0 / arg1;
}

function gml_op_apply_init_lf4(arg0, arg1)
{
    return arg0 % arg1;
}

function gml_op_apply_init_lf5(arg0, arg1)
{
    if (arg1 == 0 && is_int64(arg1) && is_int64(arg0))
    {
        show_error("Division by zero", true);
    }
    return arg0 div arg1;
}

function gml_op_apply_init_lf6(arg0, arg1)
{
    return arg0 & arg1;
}

function gml_op_apply_init_lf7(arg0, arg1)
{
    return arg0 | arg1;
}

function gml_op_apply_init_lf8(arg0, arg1)
{
    return arg0 ^ arg1;
}

function gml_op_apply_init_lf9(arg0, arg1)
{
    return arg0 << arg1;
}

function gml_op_apply_init_lf10(arg0, arg1)
{
    return arg0 >> arg1;
}

function gml_op_apply_init_lf11(arg0, arg1)
{
    return arg0 == arg1;
}

function gml_op_apply_init_lf12(arg0, arg1)
{
    return arg0 != arg1;
}

function gml_op_apply_init_lf13(arg0, arg1)
{
    return arg0 > arg1;
}

function gml_op_apply_init_lf14(arg0, arg1)
{
    return arg0 >= arg1;
}

function gml_op_apply_init_lf15(arg0, arg1)
{
    return arg0 < arg1;
}

function gml_op_apply_init_lf16(arg0, arg1)
{
    return arg0 <= arg1;
}

function gml_op_apply_init_lf17(arg0, arg1)
{
    if (!is_string(arg1))
    {
        arg1 = gml_value_print(arg1);
    }
    if (!is_string(arg0))
    {
        arg0 = gml_value_print(arg0);
    }
    return arg0 + arg1;
}

function gml_op_apply_init_lf18(arg0, arg1)
{
    show_error("No handler for operator " + string(self.ind), true);
    return 0;
}

function gml_op_apply_init()
{
    var l_out = [];
    var l__ = 0;
    var l__g1 = 97;
    while (l__ < l__g1)
    {
        array_push(l_out, undefined);
        l__++;
    }
    array_set(l_out, 16, gml_op_apply_init_lf);
    array_set(l_out, 17, gml_op_apply_init_lf1);
    array_set(l_out, 0, gml_op_apply_init_lf2);
    array_set(l_out, 1, gml_op_apply_init_lf3);
    array_set(l_out, 2, gml_op_apply_init_lf4);
    array_set(l_out, 3, gml_op_apply_init_lf5);
    array_set(l_out, 49, gml_op_apply_init_lf6);
    array_set(l_out, 48, gml_op_apply_init_lf7);
    array_set(l_out, 50, gml_op_apply_init_lf8);
    array_set(l_out, 32, gml_op_apply_init_lf9);
    array_set(l_out, 33, gml_op_apply_init_lf10);
    array_set(l_out, 64, gml_op_apply_init_lf11);
    array_set(l_out, 65, gml_op_apply_init_lf12);
    array_set(l_out, 68, gml_op_apply_init_lf13);
    array_set(l_out, 69, gml_op_apply_init_lf14);
    array_set(l_out, 66, gml_op_apply_init_lf15);
    array_set(l_out, 67, gml_op_apply_init_lf16);
    array_set(l_out, 18, gml_op_apply_init_lf17);
    var l_oi = 0;
    l__g1 = 97;
    while (l_oi < l__g1)
    {
        if (l_out[l_oi] == undefined)
        {
            array_set(l_out, l_oi, method(
            {
                ind: l_oi
            }, gml_op_apply_init_lf18));
        }
        l_oi++;
    }
    return l_out;
}

function gml_op_get_name(arg0)
{
    switch (arg0)
    {
        case 1:
            return "Div";
        case 2:
            return "Mod";
        case 7:
            return "priorities";
        case 16:
            return "Add";
        case 17:
            return "Sub";
        case 18:
            return "Cct";
        case 32:
            return "Shl";
        case 33:
            return "Shr";
        case 48:
            return "Or";
        case 49:
            return "And";
        case 64:
            return "EQ";
        case 65:
            return "NE";
        case 66:
            return "LT";
        case 67:
            return "LE";
        case 68:
            return "GT";
        case 69:
            return "GE";
        case 80:
            return "BAnd";
        case 96:
            return "BOr";
        case 50:
            return "Xor";
        case 3:
            return "IDiv";
        case 0:
            return "Mul";
        case -1:
            return "Set";
        default:
            return undefined;
    }
}

function compile_gml_compile_delete_proc_lf(arg0, arg1, arg2, arg3)
{
    arg2[4][self.varind] = undefined;
    return 0;
}

function compile_gml_compile_delete_proc_lf1(arg0, arg1, arg2, arg3)
{
    var l_global = global;
    variable_struct_set(l_global, self.varname, undefined);
    return 0;
}

function compile_gml_compile_delete_proc_lf2(arg0, arg1, arg2, arg3)
{
    var l_this1 = arg2[6];
    variable_struct_remove(l_this1[l_this1[0]], self.varname);
    return 0;
}

function compile_gml_compile_delete_proc_lf3(arg0, arg1, arg2, arg3)
{
    var l_i = arg3[0];
    var l_r = arg3[l_i];
    array_set(arg3, l_i, 0);
    array_set(arg3, 0, l_i - 1);
    variable_struct_remove(l_r, self.varname);
    return 0;
}

function compile_gml_compile_delete_proc_lf4(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0] - 1;
    array_set(arg3, 0, l_z - 1);
    arg3[l_z][arg3[l_z + 1]] = undefined;
    array_set(arg3, l_z, 0);
    array_set(arg3, l_z + 1, 0);
    return 0;
}

function compile_gml_compile_delete_proc_lf5(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0] - 1;
    array_set(arg3, 0, l_z - 1);
    ds_list_set(@@array_get@@(arg3, l_z), @@array_get@@(arg3, l_z + 1), undefined);
    array_set(arg3, l_z, 0);
    array_set(arg3, l_z + 1, 0);
    return 0;
}

function compile_gml_compile_delete_proc_lf6(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0] - 1;
    array_set(arg3, 0, l_z - 1);
    ds_map_set(@@array_get@@(arg3, l_z), @@array_get@@(arg3, l_z + 1), undefined);
    array_set(arg3, l_z, 0);
    array_set(arg3, l_z + 1, 0);
    return 0;
}

function compile_gml_compile_delete_proc_lf7(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0] - 2;
    array_set(arg3, 0, l_z - 1);
    ds_grid_set(@@array_get@@(arg3, l_z), @@array_get@@(arg3, l_z + 1), @@array_get@@(arg3, l_z + 2), undefined);
    array_set(arg3, l_z, 0);
    array_set(arg3, l_z + 1, 0);
    array_set(arg3, l_z + 2, 0);
    return 0;
}

function compile_gml_compile_delete_proc_lf8(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0] - 1;
    array_set(arg3, 0, l_z - 1);
    variable_struct_remove(arg3[l_z], arg3[l_z + 1]);
    array_set(arg3, l_z, 0);
    array_set(arg3, l_z + 1, 0);
    return 0;
}

function compile_gml_compile_delete_proc(arg0, arg1, arg2)
{
    var l__g = arg2;
    switch (l__g[0])
    {
        case UnknownEnum.Value_43:
            var l_s = l__g[2];
            ds_list_add(arg0, vm_v2_gml_action_closure_bind(arg1, "delete local", 
            {
                varname: l_s,
                varind: variable_struct_get(global.gml_compile_curr_script.h_local_map, l_s)
            }, compile_gml_compile_delete_proc_lf));
            break;
        case UnknownEnum.Value_49:
            ds_list_add(arg0, vm_v2_gml_action_closure_bind(arg1, "delete global", 
            {
                varname: l__g[2]
            }, compile_gml_compile_delete_proc_lf1));
            break;
        case UnknownEnum.Value_55:
            var l__g1 = l__g[2];
            if (l__g1[0] == 14)
            {
                if (gml_compile_node(arg2, arg0, true))
                {
                    return true;
                }
                ds_list_add(arg0, vm_v2_gml_action_closure_bind(arg1, "delete self.field", 
                {
                    varname: l__g[3]
                }, compile_gml_compile_delete_proc_lf2));
            }
            else
            {
                if (gml_compile_node(l__g1, arg0, true))
                {
                    return true;
                }
                ds_list_add(arg0, vm_v2_gml_action_closure_bind(arg1, "delete field", 
                {
                    varname: l__g[3]
                }, compile_gml_compile_delete_proc_lf3));
            }
            break;
        case UnknownEnum.Value_70:
            if (compile_gml_compile_args_proc(arg0, [l__g[2], l__g[3]]))
            {
                return true;
            }
            ds_list_add(arg0, vm_v2_gml_action_closure_bind(arg1, "delete array index", {}, compile_gml_compile_delete_proc_lf4));
            break;
        case UnknownEnum.Value_82:
            if (compile_gml_compile_args_proc(arg0, [l__g[2], l__g[3]]))
            {
                return true;
            }
            ds_list_add(arg0, vm_v2_gml_action_closure_bind(arg1, "delete list index", {}, compile_gml_compile_delete_proc_lf5));
            break;
        case UnknownEnum.Value_85:
            if (compile_gml_compile_args_proc(arg0, [l__g[2], l__g[3]]))
            {
                return true;
            }
            ds_list_add(arg0, vm_v2_gml_action_closure_bind(arg1, "delete map index", {}, compile_gml_compile_delete_proc_lf6));
            break;
        case UnknownEnum.Value_88:
            if (compile_gml_compile_args_proc(arg0, [l__g[2], l__g[3], l__g[4]]))
            {
                return true;
            }
            ds_list_add(arg0, vm_v2_gml_action_closure_bind(arg1, "delete grid index", {}, compile_gml_compile_delete_proc_lf7));
            break;
        case UnknownEnum.Value_91:
            if (compile_gml_compile_args_proc(arg0, [l__g[2], l__g[3]]))
            {
                return true;
            }
            ds_list_add(arg0, vm_v2_gml_action_closure_bind(arg1, "delete struct field", {}, compile_gml_compile_delete_proc_lf8));
            break;
        default:
            return gml_compile_error("Can't delete " + gml_std_Type_enumConstructor(arg2), gml_std_haxe_enum_tools_getParameter(arg2, 0));
    }
    return false;
}

function gml_std_haxe_enum_tools_getParameter(arg0, arg1)
{
    if (is_struct(arg0))
    {
        var l_params = arg0.__enumParams__;
        return variable_struct_get(arg0, l_params[arg1]);
    }
    else if (is_array(arg0))
    {
        return arg0[arg1 + 1];
    }
    else
    {
        show_error("Not an EnumValue", true);
    }
}

function gml_std_haxe_enum_tools_getParameterCount(arg0)
{
    if (is_struct(arg0))
    {
        return array_length(arg0.__enumParams__);
    }
    else if (is_array(arg0))
    {
        return array_length(arg0) - 1;
    }
    else
    {
        show_error("Not an EnumValue", true);
    }
}

function gml_std_haxe_enum_tools_setParameter(arg0, arg1, arg2)
{
    if (is_struct(arg0))
    {
        var l_params = arg0.__enumParams__;
        variable_struct_set(arg0, l_params[arg1], arg2);
    }
    else if (is_array(arg0))
    {
        array_set(arg0, arg1 + 1, arg2);
    }
    else
    {
        show_error("Not an EnumValue", true);
    }
}

function gml_std_haxe_enum_tools_setTo(arg0, arg1)
{
    if (is_struct(arg0))
    {
        var l_qp = arg0.__enumParams__;
        var l_vp = arg1.__enumParams__;
        var l_n = array_length(l_qp);
        var l_i = -1;
        while (++l_i < l_n)
        {
            variable_struct_set(arg0, l_qp[l_i], undefined);
        }
        l_i = -1;
        l_n = array_length(l_vp);
        while (++l_i < l_n)
        {
            variable_struct_set(arg0, l_vp[l_i], variable_struct_get(arg1, l_vp[l_i]));
        }
        arg0.__enumParams__ = l_vp;
        arg0.__enumIndex__ = arg1.__enumIndex__;
    }
    else if (is_array(arg0))
    {
        var l_qx = arg0;
        var l_vx = arg1;
        var l_n = array_length(l_vx);
        if (array_length(l_qx) != l_n)
        {
            array_resize(l_qx, l_n);
        }
        array_copy(l_qx, 0, l_vx, 0, l_n);
    }
    else
    {
        show_error("Not an EnumValue", true);
    }
}

function gml_node_tools_unpack(arg0)
{
    while (arg0 != undefined)
    {
        var l__g = arg0;
        if (l__g[0] == 95)
        {
            var l__g2 = l__g[2];
            if (array_length(l__g2) == 1)
            {
                arg0 = l__g2[0];
            }
            else
            {
                return arg0;
            }
        }
        else
        {
            return arg0;
        }
    }
    return arg0;
}

function gml_node_tools_is_statement(arg0)
{
    switch (arg0[0])
    {
        case UnknownEnum.Value_23:
            return true;
        case UnknownEnum.Value_37:
            return true;
        case UnknownEnum.Value_94:
            return true;
        case UnknownEnum.Value_33:
            return true;
        case UnknownEnum.Value_34:
            return true;
        case UnknownEnum.Value_95:
            return true;
        case UnknownEnum.Value_96:
            return true;
        case UnknownEnum.Value_98:
            return true;
        case UnknownEnum.Value_105:
            return true;
        case UnknownEnum.Value_101:
            return true;
        case UnknownEnum.Value_104:
            return true;
        case UnknownEnum.Value_103:
            return true;
        case UnknownEnum.Value_102:
            return true;
        case UnknownEnum.Value_106:
            return true;
        case UnknownEnum.Value_110:
            return true;
        case UnknownEnum.Value_111:
            return true;
        case UnknownEnum.Value_109:
            return true;
        case UnknownEnum.Value_108:
            return true;
        case UnknownEnum.Value_99:
            return true;
        case UnknownEnum.Value_112:
            return true;
        case UnknownEnum.Value_113:
            return true;
        case UnknownEnum.Value_114:
            return true;
        default:
            return false;
    }
}

function gml_node_tools_is_in_block(arg0, arg1)
{
    if (arg1 == undefined || arg0 == undefined)
    {
        return false;
    }
    var l__g = arg1;
    switch (l__g[0])
    {
        case UnknownEnum.Value_95:
            return true;
        case UnknownEnum.Value_96:
            if (arg0 != l__g[3])
            {
                return arg0 == l__g[4];
            }
            else
            {
                return true;
            }
        case UnknownEnum.Value_101:
            return arg0 == l__g[3];
        case UnknownEnum.Value_103:
            return arg0 == l__g[2];
        case UnknownEnum.Value_102:
            return arg0 == l__g[2];
        case UnknownEnum.Value_104:
            return arg0 == l__g[3];
        case UnknownEnum.Value_106:
            return arg0 == l__g[3];
        case UnknownEnum.Value_105:
            return (arg0 == l__g[2] || arg0 == l__g[4]) || arg0 == l__g[5];
        case UnknownEnum.Value_98:
            var l__cases = l__g[3];
            if (arg0 == l__g[4])
            {
                return true;
            }
            var l_i = 0;
            var l__g2 = array_length(l__cases);
            while (l_i < l__g2)
            {
                if (l__cases[l_i].expr == arg0)
                {
                    return true;
                }
                l_i++;
            }
            return false;
        case UnknownEnum.Value_113:
            return arg0 == l__g[2];
        default:
            return false;
    }
}

function gml_node_tools_to_case_value(arg0)
{
    var l__g = arg0;
    switch (l__g[0])
    {
        case UnknownEnum.Value_2:
            var l_f = l__g[2];
            if (is_real(l_f) && sign(frac(l_f)) != 0)
            {
                return undefined;
            }
            if (int64(l_f) != l_f)
            {
                return undefined;
            }
            return l_f;
        case UnknownEnum.Value_3:
            return l__g[2];
        case UnknownEnum.Value_5:
            return l__g[3].h_value;
        default:
            return undefined;
    }
}

function gml_node_tools_equals_list(arg0, arg1)
{
    var l_n = array_length(arg0);
    if (array_length(arg1) != l_n)
    {
        return false;
    }
    var l_i = 0;
    while (l_i < l_n)
    {
        if (gml_node_tools_equals(arg0[l_i], arg1[l_i]))
        {
            l_i++;
        }
        else
        {
            return false;
        }
    }
    return true;
}

function gml_node_tools_equals_lf(arg0, arg1, arg2, arg3)
{
    var l_tmp;
    switch (arg3.h_type)
    {
        case 0:
            l_tmp = gml_node_tools_equals(arg1, arg2);
            break;
        case 13:
            l_tmp = arg1 == arg2;
            break;
        case 1:
            l_tmp = gml_node_tools_equals_list(arg1, arg2);
            break;
        case 5:
        case 6:
        case 7:
            l_tmp = arg1 == arg2;
            break;
        case 10:
        case 11:
        case 12:
            l_tmp = arg1 == arg2;
            break;
        case 8:
        case 9:
            l_tmp = arg1 == arg2;
            break;
        case 14:
            return array_equals(arg1, arg2);
        case 4:
            var l_cca = arg1;
            var l_ccb = arg2;
            var l_n = array_length(l_cca);
            var l_i = -1;
            var l_ok = l_n == array_length(l_ccb);
            if (l_ok)
            {
                while (++l_i < l_n)
                {
                    if (!gml_node_tools_equals(l_cca[l_i].expr, l_ccb[l_i].expr))
                    {
                        l_ok = false;
                        break;
                    }
                    if (!gml_node_tools_equals_list(l_cca[l_i].values, l_ccb[l_i].values))
                    {
                        l_ok = false;
                        break;
                    }
                }
            }
            l_tmp = l_ok;
            break;
        default:
            l_tmp = true;
    }
    return !l_tmp;
}

function gml_node_tools_equals(arg0, arg1)
{
    if (arg0 == undefined)
    {
        return arg1 == undefined;
    }
    if (arg1 == undefined)
    {
        return false;
    }
    if (arg0[0] != arg1[0])
    {
        return false;
    }
    var l_params = global.ast_gml_node_def_info_array[gml_std_Type_enumIndex(arg0)].h_params;
    var l_result = false;
    var l_i = 0;
    var l__g1 = array_length(l_params);
    while (l_i < l__g1)
    {
        if (gml_node_tools_equals_lf(l_i, arg0[l_i + 1], arg1[l_i + 1], l_params[l_i]))
        {
            l_result = true;
            break;
        }
        l_i++;
    }
    return !l_result;
}

function gml_node_tools_clone_list(arg0)
{
    if (arg0 == undefined)
    {
        return undefined;
    }
    var l_arr = gml_std_gml_internal_ArrayImpl_copy(arg0);
    var l_i = array_length(l_arr);
    while (--l_i >= 0)
    {
        array_set(l_arr, l_i, gml_node_tools_clone(l_arr[l_i]));
    }
    return l_arr;
}

function gml_node_tools_clone_case(arg0)
{
    return 
    {
        values: gml_node_tools_clone_list(arg0.values),
        expr: gml_node_tools_clone(arg0.expr),
        pre: gml_node_tools_clone_list(arg0.pre)
    };
}

function gml_node_tools_clone(arg0)
{
    if (arg0 == undefined)
    {
        return undefined;
    }
    var l_ndef = gml_std_gml_internal_ArrayImpl_concatFront(gml_std_Type_enumParameters(arg0), gml_std_Type_enumIndex(arg0));
    var l_params = global.ast_gml_node_def_info_array[gml_std_Type_enumIndex(arg0)].h_params;
    var l_i = 0;
    var l__g1 = array_length(l_params);
    while (l_i < l__g1)
    {
        var l_v = l_ndef[l_i + 1];
        var l_val;
        switch (l_params[l_i].h_type)
        {
            case 2:
                l_val = l_v;
                break;
            case 8:
            case 9:
                l_val = l_v;
                break;
            case 13:
                l_val = l_v;
                break;
            case 14:
                l_val = gml_std_gml_internal_ArrayImpl_copy(l_v);
                break;
            case 1:
                l_val = gml_node_tools_clone_list(l_v);
                break;
            case 0:
                l_val = gml_node_tools_clone(l_v);
                break;
            case 5:
            case 6:
            case 7:
                l_val = l_v;
                break;
            case 10:
            case 11:
            case 12:
                l_val = l_v;
                break;
            case 3:
                l_val = gml_node_tools_clone_case(l_v);
                break;
            case 4:
                var l_cc = gml_std_gml_internal_ArrayImpl_copy(l_v);
                var l_i1 = array_length(l_cc);
                while (--l_i1 >= 0)
                {
                    array_set(l_cc, l_i1, gml_node_tools_clone_case(l_cc[l_i1]));
                }
                l_val = l_cc;
                break;
        }
        array_set(l_ndef, l_i + 1, l_val);
        l_i++;
    }
    return l_ndef;
}

function gml_node_tools_seek_all_out(arg0, arg1, arg2, arg3, arg4)
{
    var l_par = ds_list_find_value(arg1, arg3);
    if (l_par == undefined)
    {
        return false;
    }
    var l__g = l_par;
    switch (l__g[0])
    {
        case UnknownEnum.Value_95:
            var l_w = l__g[2];
            var l_i = array_length(l_w);
            while (--l_i >= 0)
            {
                if (l_w[l_i] == arg0)
                {
                    break;
                }
            }
            while (--l_i >= 0)
            {
                if (arg2(l_w[l_i], undefined))
                {
                    return true;
                }
            }
            break;
        case UnknownEnum.Value_96:
            var l_c1 = l__g[2];
            if (l_c1 != arg0 && arg2(l_c1, undefined))
            {
                return true;
            }
            break;
        case UnknownEnum.Value_101:
            var l_c1 = l__g[2];
            if (l_c1 != arg0 && arg2(l_c1, undefined))
            {
                return true;
            }
            break;
        case UnknownEnum.Value_103:
            var l_c1 = l__g[2];
            if (l_c1 != arg0 && arg2(l_c1, undefined))
            {
                return true;
            }
            break;
        case UnknownEnum.Value_102:
            var l_c1 = l__g[2];
            if (l_c1 != arg0 && arg2(l_c1, undefined))
            {
                return true;
            }
            break;
        case UnknownEnum.Value_104:
            var l_c1 = l__g[2];
            if (l_c1 != arg0 && arg2(l_c1, undefined))
            {
                return true;
            }
            break;
        case UnknownEnum.Value_105:
            var l_c1 = l__g[2];
            if (l_c1 != arg0 && arg2(l_c1, undefined))
            {
                return true;
            }
            break;
        case UnknownEnum.Value_98:
            var l_c1 = l__g[2];
            if (l_c1 != arg0 && arg2(l_c1, undefined))
            {
                return true;
            }
            break;
        case UnknownEnum.Value_106:
            var l_c1 = l__g[2];
            if (l_c1 != arg0 && arg2(l_c1, undefined))
            {
                return true;
            }
            break;
        default:
            show_error("Can't seekAllOut over " + ast_gml_node_tools_ni_get_pos_string(l_par, arg4) + " " + gml_std_Type_enumConstructor(l_par), true);
    }
    return gml_node_tools_seek_all_out(l_par, arg1, arg2, arg3 + 1, arg4);
}

function gml_node_tools_seek_arr(arg0, arg1, arg2)
{
    var l_i = 0;
    var l__g1 = array_length(arg0);
    while (l_i < l__g1)
    {
        if (arg1(arg0[l_i], undefined))
        {
            return true;
        }
        l_i++;
    }
    return false;
}

function gml_node_tools_seek_or2(arg0, arg1, arg2, arg3)
{
    return arg2(arg0, undefined) || arg2(arg1, undefined);
}

function gml_node_tools_seek_or3(arg0, arg1, arg2, arg3, arg4)
{
    return (arg3(arg0, undefined) || arg3(arg1, undefined)) || arg3(arg2, undefined);
}

function gml_node_tools_seek_or4(arg0, arg1, arg2, arg3, arg4, arg5)
{
    return (arg4(arg0, undefined) || arg4(arg1, undefined) || arg4(arg2, undefined)) || arg4(arg3, undefined);
}

function gml_node_tools_seek_1or_arr(arg0, arg1, arg2, arg3)
{
    if (arg2(arg0, undefined))
    {
        return true;
    }
    var l_i = 0;
    var l__g1 = array_length(arg1);
    while (l_i < l__g1)
    {
        if (arg2(arg1[l_i], undefined))
        {
            return true;
        }
        l_i++;
    }
    return false;
}

function gml_node_tools_seek_all(arg0, arg1, arg2, arg3)
{
    if (arg1 != undefined)
    {
        ds_list_insert(arg1, 0, arg0);
    }
    var l_r = false;
    var l_trouble = false;
    var l__g = arg0;
    switch (l__g[0])
    {
        case UnknownEnum.Value_10:
            l_r = arg2(l__g[2], undefined);
            break;
        case UnknownEnum.Value_21:
            l_r = arg2(l__g[2], undefined);
            break;
        case UnknownEnum.Value_33:
            l_r = arg2(l__g[2], undefined);
            break;
        case UnknownEnum.Value_34:
            l_r = arg2(l__g[2], undefined);
            break;
        case UnknownEnum.Value_38:
            l_r = arg2(l__g[2], undefined);
            break;
        case UnknownEnum.Value_40:
            l_r = arg2(l__g[2], undefined);
            break;
        case UnknownEnum.Value_41:
            l_r = arg2(l__g[2], undefined);
            break;
        case UnknownEnum.Value_44:
            l_r = arg2(l__g[3], undefined);
            break;
        case UnknownEnum.Value_45:
            l_r = arg2(l__g[4], undefined);
            break;
        case UnknownEnum.Value_47:
            l_r = arg2(l__g[3], undefined);
            break;
        case UnknownEnum.Value_48:
            l_r = arg2(l__g[4], undefined);
            break;
        case UnknownEnum.Value_50:
            l_r = arg2(l__g[3], undefined);
            break;
        case UnknownEnum.Value_51:
            l_r = arg2(l__g[4], undefined);
            break;
        case UnknownEnum.Value_53:
            l_r = arg2(l__g[4], undefined);
            break;
        case UnknownEnum.Value_54:
            l_r = arg2(l__g[5], undefined);
            break;
        case UnknownEnum.Value_59:
            l_r = arg2(l__g[3], undefined);
            break;
        case UnknownEnum.Value_60:
            l_r = arg2(l__g[4], undefined);
            break;
        case UnknownEnum.Value_99:
            l_r = arg2(l__g[2], undefined);
            break;
        case UnknownEnum.Value_107:
            l_r = arg2(l__g[2], undefined);
            break;
        case UnknownEnum.Value_108:
            l_r = arg2(l__g[2], undefined);
            break;
        case UnknownEnum.Value_114:
            l_r = arg2(l__g[2], undefined);
            break;
        case UnknownEnum.Value_0:
            l_r = false;
            break;
        case UnknownEnum.Value_1:
            l_r = false;
            break;
        case UnknownEnum.Value_2:
            l_r = false;
            break;
        case UnknownEnum.Value_3:
            l_r = false;
            break;
        case UnknownEnum.Value_4:
            l_r = false;
            break;
        case UnknownEnum.Value_5:
            l_r = false;
            break;
        case UnknownEnum.Value_8:
            l_r = false;
            break;
        case UnknownEnum.Value_9:
            l_r = false;
            break;
        case UnknownEnum.Value_13:
            l_r = false;
            break;
        case UnknownEnum.Value_14:
            l_r = false;
            break;
        case UnknownEnum.Value_15:
            l_r = false;
            break;
        case UnknownEnum.Value_16:
            l_r = false;
            break;
        case UnknownEnum.Value_17:
            l_r = false;
            break;
        case UnknownEnum.Value_18:
            l_r = false;
            break;
        case UnknownEnum.Value_19:
            l_r = false;
            break;
        case UnknownEnum.Value_20:
            l_r = false;
            break;
        case UnknownEnum.Value_22:
            l_r = false;
            break;
        case UnknownEnum.Value_32:
            l_r = false;
            break;
        case UnknownEnum.Value_43:
            l_r = false;
            break;
        case UnknownEnum.Value_46:
            l_r = false;
            break;
        case UnknownEnum.Value_49:
            l_r = false;
            break;
        case UnknownEnum.Value_52:
            l_r = false;
            break;
        case UnknownEnum.Value_58:
            l_r = false;
            break;
        case UnknownEnum.Value_100:
            l_r = false;
            break;
        case UnknownEnum.Value_109:
            l_r = false;
            break;
        case UnknownEnum.Value_110:
            l_r = false;
            break;
        case UnknownEnum.Value_111:
            l_r = false;
            break;
        case UnknownEnum.Value_112:
            l_r = false;
            break;
        case UnknownEnum.Value_36:
            switch (l__g[2])
            {
                case 80:
                    var l_a = l__g[3];
                    var l_b = l__g[4];
                    l_r = arg2(l_a, undefined) && arg2(l_b, undefined);
                    break;
                case 96:
                    l_r = arg2(l__g[3], undefined);
                    break;
                default:
                    l_r = gml_node_tools_seek_or2(l__g[3], l__g[4], arg2, arg1);
            }
            break;
        case UnknownEnum.Value_6:
            gml_node_tools_seek_arr(l__g[2], arg2, arg1);
            break;
        case UnknownEnum.Value_7:
            gml_node_tools_seek_arr(l__g[3], arg2, arg1);
            break;
        case UnknownEnum.Value_94:
            var l_v = l__g[3];
            l_r = l_v != undefined && arg2(l_v, undefined);
            break;
        case UnknownEnum.Value_39:
            l_r = arg2(l__g[2], undefined);
            break;
        case UnknownEnum.Value_35:
            l_r = arg2(l__g[2], undefined);
            break;
        case UnknownEnum.Value_95:
            l_r = gml_node_tools_seek_arr(l__g[2], arg2, arg1);
            break;
        case UnknownEnum.Value_23:
            l_r = gml_node_tools_seek_1or_arr(l__g[2], l__g[3], arg2, arg1);
            break;
        case UnknownEnum.Value_26:
            l_r = gml_node_tools_seek_1or_arr(l__g[2], l__g[3], arg2, arg1);
            break;
        case UnknownEnum.Value_31:
            l_r = gml_node_tools_seek_1or_arr(l__g[2], l__g[3], arg2, arg1);
            break;
        case UnknownEnum.Value_25:
            l_r = gml_node_tools_seek_1or_arr(l__g[2], l__g[4], arg2, arg1);
            break;
        case UnknownEnum.Value_28:
            l_r = gml_node_tools_seek_1or_arr(l__g[2], l__g[4], arg2, arg1);
            break;
        case UnknownEnum.Value_30:
            l_r = gml_node_tools_seek_1or_arr(l__g[2], l__g[4], arg2, arg1);
            break;
        case UnknownEnum.Value_24:
            l_r = gml_node_tools_seek_arr(l__g[3], arg2, arg1);
            break;
        case UnknownEnum.Value_29:
            l_r = gml_node_tools_seek_arr(l__g[3], arg2, arg1);
            break;
        case UnknownEnum.Value_27:
            var l_x1 = l__g[2];
            var l_y = l__g[3];
            l_r = arg2(l_x1, undefined) || arg2(l_y, undefined);
            break;
        case UnknownEnum.Value_96:
            var l_c1 = l__g[2];
            var l_a = l__g[3];
            var l_b = l__g[4];
            l_r = arg2(l_c1, undefined) || (l_b != undefined && arg2(l_a, undefined) && arg2(l_b, undefined));
            break;
        case UnknownEnum.Value_97:
            var l_c1 = l__g[2];
            var l_a = l__g[3];
            var l_b = l__g[4];
            l_r = arg2(l_c1, undefined) || (arg2(l_a, undefined) && arg2(l_b, undefined));
            break;
        case UnknownEnum.Value_105:
            l_r = gml_node_tools_seek_or2(l__g[2], l__g[3], arg2, undefined);
            break;
        case UnknownEnum.Value_101:
            l_r = arg2(l__g[2], undefined);
            break;
        case UnknownEnum.Value_106:
            l_r = arg2(l__g[2], undefined);
            break;
        case UnknownEnum.Value_103:
            l_r = arg2(l__g[2], undefined);
            break;
        case UnknownEnum.Value_102:
            l_r = arg2(l__g[2], undefined);
            break;
        case UnknownEnum.Value_104:
            l_r = arg2(l__g[2], undefined);
            break;
        case UnknownEnum.Value_98:
            var l__x = l__g[2];
            var l__cc = l__g[3];
            var l__d = l__g[4];
            if (arg2(l__x, undefined))
            {
                l_r = true;
            }
            else
            {
                var l_x = l__d;
                if (l_x != undefined && arg2(l_x, undefined))
                {
                    var l_n = array_length(l__cc);
                    var l_i = 0;
                    while (l_i < l_n)
                    {
                        if (arg2(l_x, undefined))
                        {
                            l_i++;
                        }
                        else
                        {
                            break;
                        }
                    }
                    l_r = l_i >= l_n;
                }
                else
                {
                    l_r = false;
                }
            }
            break;
        case UnknownEnum.Value_113:
            var l_x = l__g[2];
            var l_e = l__g[4];
            l_r = arg2(l_x, undefined) || arg2(l_e, undefined);
            break;
        case UnknownEnum.Value_37:
            l_r = gml_node_tools_seek_or2(l__g[3], l__g[4], arg2, arg1);
            break;
        case UnknownEnum.Value_42:
            l_r = gml_node_tools_seek_or2(l__g[2], l__g[3], arg2, arg1);
            break;
        case UnknownEnum.Value_64:
            l_r = arg2(l__g[3], undefined);
            break;
        case UnknownEnum.Value_65:
            l_r = gml_node_tools_seek_or2(l__g[3], l__g[4], arg2, arg1);
            break;
        case UnknownEnum.Value_66:
            l_r = gml_node_tools_seek_or2(l__g[3], l__g[5], arg2, arg1);
            break;
        case UnknownEnum.Value_67:
            l_r = gml_node_tools_seek_or2(l__g[2], l__g[3], arg2, arg1);
            break;
        case UnknownEnum.Value_68:
            l_r = gml_node_tools_seek_or3(l__g[2], l__g[3], l__g[4], arg2, arg1);
            break;
        case UnknownEnum.Value_69:
            l_r = gml_node_tools_seek_or3(l__g[2], l__g[3], l__g[5], arg2, arg1);
            break;
        case UnknownEnum.Value_11:
            l_r = gml_node_tools_seek_or2(l__g[2], l__g[3], arg2, arg1);
            break;
        case UnknownEnum.Value_12:
            l_r = gml_node_tools_seek_or3(l__g[2], l__g[3], l__g[4], arg2, arg1);
            break;
        case UnknownEnum.Value_70:
            l_r = gml_node_tools_seek_or2(l__g[2], l__g[3], arg2, arg1);
            break;
        case UnknownEnum.Value_71:
            l_r = gml_node_tools_seek_or3(l__g[2], l__g[3], l__g[4], arg2, arg1);
            break;
        case UnknownEnum.Value_72:
            l_r = gml_node_tools_seek_or3(l__g[2], l__g[3], l__g[5], arg2, arg1);
            break;
        case UnknownEnum.Value_73:
            l_r = gml_node_tools_seek_or3(l__g[2], l__g[3], l__g[4], arg2, arg1);
            break;
        case UnknownEnum.Value_74:
            l_r = gml_node_tools_seek_or4(l__g[2], l__g[3], l__g[4], l__g[5], arg2, arg1);
            break;
        case UnknownEnum.Value_75:
            l_r = gml_node_tools_seek_or4(l__g[2], l__g[3], l__g[4], l__g[6], arg2, arg1);
            break;
        case UnknownEnum.Value_76:
            l_r = gml_node_tools_seek_or2(l__g[2], l__g[3], arg2, arg1);
            break;
        case UnknownEnum.Value_77:
            l_r = gml_node_tools_seek_or3(l__g[2], l__g[3], l__g[4], arg2, arg1);
            break;
        case UnknownEnum.Value_78:
            l_r = gml_node_tools_seek_or3(l__g[2], l__g[3], l__g[5], arg2, arg1);
            break;
        case UnknownEnum.Value_79:
            l_r = gml_node_tools_seek_or3(l__g[2], l__g[3], l__g[4], arg2, arg1);
            break;
        case UnknownEnum.Value_80:
            l_r = gml_node_tools_seek_or4(l__g[2], l__g[3], l__g[4], l__g[5], arg2, arg1);
            break;
        case UnknownEnum.Value_81:
            l_r = gml_node_tools_seek_or4(l__g[2], l__g[3], l__g[4], l__g[6], arg2, arg1);
            break;
        case UnknownEnum.Value_55:
            l_r = arg2(l__g[2], undefined);
            break;
        case UnknownEnum.Value_56:
            l_r = gml_node_tools_seek_or2(l__g[2], l__g[4], arg2, arg1);
            break;
        case UnknownEnum.Value_57:
            l_r = gml_node_tools_seek_or2(l__g[2], l__g[5], arg2, arg1);
            break;
        case UnknownEnum.Value_61:
            l_r = arg2(l__g[2], undefined);
            break;
        case UnknownEnum.Value_62:
            l_r = gml_node_tools_seek_or2(l__g[2], l__g[4], arg2, arg1);
            break;
        case UnknownEnum.Value_63:
            l_r = gml_node_tools_seek_or2(l__g[2], l__g[5], arg2, arg1);
            break;
        case UnknownEnum.Value_82:
            l_r = gml_node_tools_seek_or2(l__g[2], l__g[3], arg2, arg1);
            break;
        case UnknownEnum.Value_83:
            l_r = gml_node_tools_seek_or3(l__g[2], l__g[3], l__g[4], arg2, arg1);
            break;
        case UnknownEnum.Value_84:
            l_r = gml_node_tools_seek_or3(l__g[2], l__g[3], l__g[5], arg2, arg1);
            break;
        case UnknownEnum.Value_85:
            l_r = gml_node_tools_seek_or2(l__g[2], l__g[3], arg2, arg1);
            break;
        case UnknownEnum.Value_86:
            l_r = gml_node_tools_seek_or3(l__g[2], l__g[3], l__g[4], arg2, arg1);
            break;
        case UnknownEnum.Value_87:
            l_r = gml_node_tools_seek_or3(l__g[2], l__g[3], l__g[5], arg2, arg1);
            break;
        case UnknownEnum.Value_88:
            l_r = gml_node_tools_seek_or3(l__g[2], l__g[3], l__g[4], arg2, arg1);
            break;
        case UnknownEnum.Value_89:
            l_r = gml_node_tools_seek_or4(l__g[2], l__g[3], l__g[4], l__g[5], arg2, arg1);
            break;
        case UnknownEnum.Value_90:
            l_r = gml_node_tools_seek_or4(l__g[2], l__g[3], l__g[4], l__g[6], arg2, arg1);
            break;
        case UnknownEnum.Value_91:
            l_r = gml_node_tools_seek_or2(l__g[2], l__g[3], arg2, arg1);
            break;
        case UnknownEnum.Value_92:
            l_r = gml_node_tools_seek_or3(l__g[2], l__g[3], l__g[4], arg2, arg1);
            break;
        case UnknownEnum.Value_93:
            l_r = gml_node_tools_seek_or3(l__g[2], l__g[3], l__g[5], arg2, arg1);
            break;
    }
    if (l_trouble)
    {
        show_error("Can't seekAll over " + ast_gml_node_tools_ni_get_pos_string(arg0, arg3) + " " + gml_std_Type_enumConstructor(arg0), true);
    }
    if (arg1 != undefined)
    {
        ds_list_delete(arg1, 0);
    }
    return false;
}

function gml_node_tools_seek(arg0, arg1, arg2)
{
    if (arg0 == undefined)
    {
        return false;
    }
    if (arg1 != undefined)
    {
        ds_list_insert(arg1, 0, arg0);
    }
    var l__g = arg0;
    if (l__g[0] == 98)
    {
        var l_x = l__g[2];
        var l_m = l__g[3];
        var l_o = l__g[4];
        if (arg2(l_x, arg1))
        {
            l_result = true;
        }
        else
        {
            var l_n = array_length(l_m);
            for (l_i = 0; l_i < l_n; l_i++)
            {
                var l_w = l_m[l_i].values;
                var l_l = array_length(l_w);
                var l_k;
                for (l_k = 0; l_k < l_l; l_k++)
                {
                    if (arg2(l_w[l_k], arg1))
                    {
                        break;
                    }
                }
                if (l_k < l_l || arg2(l_m[l_i].expr, arg1))
                {
                    break;
                }
            }
            if (l_i < l_n)
            {
                l_result = true;
            }
            else
            {
                l_result = l_o != undefined && arg2(l_o, arg1);
            }
        }
        if (arg1 != undefined)
        {
            ds_list_delete(arg1, 0);
        }
        return l_result;
    }
    var l_inf = global.ast_gml_node_def_info_array[gml_std_Type_enumIndex(arg0)];
    var l_def = arg0;
    var l_params = l_inf.h_params;
    var l_result1 = false;
    var l_i = 0;
    var l__g1 = array_length(l_params);
    while (l_i < l__g1)
    {
        var l_v = l_def[l_i + 1];
        var l_result2;
        switch (l_params[l_i].h_type)
        {
            case 0:
                l_result2 = l_v != undefined && arg2(l_v, arg1);
                break;
            case 1:
                var l_arr = l_v;
                var l_found = false;
                var l_i1 = 0;
                var l__g3 = array_length(l_arr);
                while (l_i1 < l__g3)
                {
                    if (arg2(l_arr[l_i1], arg1))
                    {
                        l_found = true;
                        break;
                    }
                    l_i1++;
                }
                l_result2 = l_found;
                break;
            default:
                l_result2 = false;
        }
        if (l_result2)
        {
            l_result1 = true;
            break;
        }
        l_i++;
    }
    var l_result = l_result1;
    if (arg1 != undefined)
    {
        ds_list_delete(arg1, 0);
    }
    return l_result;
}

function gml_thread(arg0, arg1, arg2, arg3, arg4, arg5, arg6) constructor
{
    static h_result = undefined;
    static h_status = undefined;
    static h_callback = undefined;
    static h_scope = undefined;
    static h_wait_time = undefined;
    static h_time_tag = undefined;
    static h_error_text = undefined;
    static h_error_pos = undefined;
    
    static h_get_error = function()
    {
        return self.h_error_text;
    };
    
    static h_get_error_ptr = function()
    {
        if (self.h_error_pos != undefined)
        {
            return gml_pos_to_string(self.h_error_pos, self.h_scope[9]);
        }
        else
        {
            return "?";
        }
    };
    
    static h_get_callstack = function()
    {
        var l_q = self.h_scope;
        var l_n = 0;
        var l_qn = l_q;
        while (l_qn != undefined)
        {
            l_n++;
            l_qn = l_qn[10];
        }
        var l_arr = array_create(l_n);
        for (var l_i = 0; l_i < l_n; l_i++)
        {
            var l_p = l_q[2] - 1;
            array_set(l_arr, l_i, gml_pos_to_string(gml_std_haxe_enum_tools_getParameter(ds_list_find_value(l_q[1], (l_p > 0) ? (l_p - 1) : 0), 0), self.h_scope[9]));
            l_q = l_q[10];
        }
        return l_arr;
    };
    
    static h_stack_error = function(arg0, arg1)
    {
        var l_text;
        if (is_struct(arg1) && variable_struct_exists(arg1, "stacktrace"))
        {
            l_text = variable_struct_exists(arg1, "message") ? string(arg1.message) : "(error without a message?)";
            var l_st = arg1.stacktrace;
            if (global.gml_thread_verbose_stack_traces)
            {
                var l_i = 0;
                var l__g1 = array_length(l_st);
                while (l_i < l__g1)
                {
                    var l_js = l_st[l_i];
                    if (is_string(l_js))
                    {
                        if (gml_std_StringTools_startsWith(l_js, "gml_Script_vm_group_"))
                        {
                            l_text += ("\n called from vm:" + gml_std_string_substring(l_js, 20));
                        }
                        else if (gml_std_StringTools_startsWith(l_js, "gml_Script_") || gml_std_StringTools_startsWith(l_js, "gml_Object_"))
                        {
                            l_text += ("\n called from " + gml_std_string_substring(l_js, 11));
                        }
                        else
                        {
                            l_text += ("\n called from " + l_js);
                        }
                    }
                    else
                    {
                        l_text += ("\n called from " + string(l_js));
                    }
                    l_i++;
                }
            }
        }
        else
        {
            l_text = gml_std_Std_stringify(arg1);
        }
        var l_s = "[error] " + l_text + "\n called from " + gml_pos_to_string(arg0, self.h_scope[9]);
        var l_q = self.h_scope;
        if (l_q != undefined)
        {
            l_q = self.h_scope[10];
            while (l_q != undefined)
            {
                var l_p = l_q[2];
                l_s += ("\n called from " + gml_pos_to_string(gml_std_haxe_enum_tools_getParameter(ds_list_find_value(l_q[1], (l_p > 0) ? (l_p - 1) : 0), 0), self.h_scope[9]));
                l_q = l_q[10];
            }
        }
        return l_s;
    };
    
    static h_proc_error = function(arg0, arg1)
    {
        var l_pos = gml_std_haxe_enum_tools_getParameter(arg1, 0);
        self.h_error_text = self.h_stack_error(l_pos, arg0);
        self.h_error_pos = l_pos;
        self.h_status = 4;
        return false;
    };
    
    static h_proc_error2 = function(arg0, arg1)
    {
        var l_pos = gml_std_haxe_enum_tools_getParameter(arg1, 0);
        self.h_error_text = self.h_stack_error(l_pos, arg0);
        self.h_error_pos = l_pos;
        self.h_status = 4;
        return 1;
    };
    
    static h_exec = function()
    {
        var l__gthis = self;
        var l_prevKind = global.gml_thread_current_kind;
        global.gml_thread_current_kind = 1;
        var l_previous = global.gml_thread_current;
        global.gml_thread_current = self;
        var l_scope = self.h_scope;
        var l_actions = l_scope[1];
        var l_len = ds_list_size(l_actions);
        var l_stack = l_scope[5];
        var l_allowExceptions = global.gml_thread_allow_exceptions;
        self.h_status = 1;
        while (true)
        {
            var l_act = undefined;
            var l_loop = true;
            var l_pos = l_scope[2];
            while (l_pos < l_len && l_loop)
            {
                if (l_allowExceptions)
                {
                    l_act = ds_list_find_value(l_actions, l_pos);
                    array_set(l_scope, 2, l_pos + 1);
                    var l_ar = l_act.__func__(l__gthis, l_act, l_scope, l_stack);
                    if (l__gthis.h_status >= 4)
                    {
                        l_loop = false;
                    }
                    else if (l_ar == 3)
                    {
                        l_scope = l__gthis.h_scope;
                        l_actions = l_scope[1];
                        l_len = ds_list_size(l_actions);
                        l_stack = l_scope[5];
                    }
                }
                else
                {
                    try
                    {
                        l_act = ds_list_find_value(l_actions, l_pos);
                        array_set(l_scope, 2, l_pos + 1);
                        var l_ar1 = l_act.__func__(l__gthis, l_act, l_scope, l_stack);
                        if (l__gthis.h_status >= 4)
                        {
                            l_loop = false;
                        }
                        else if (l_ar1 == 3)
                        {
                            l_scope = l__gthis.h_scope;
                            l_actions = l_scope[1];
                            l_len = ds_list_size(l_actions);
                            l_stack = l_scope[5];
                        }
                    }
                    catch (l__g)
                    {
                        var l_x = gml_std_haxe_Exception_caught(l__g).h_unwrap();
                        l_loop = false;
                        if (l_act == undefined)
                        {
                            self.h_error_pos = l_scope[9].h_sources[0].h_get_eof();
                            self.h_error_text = self.h_stack_error(self.h_error_pos, "program is destroyed");
                            self.h_status = 4;
                        }
                        else
                        {
                            self.h_proc_error(l_x, l_act);
                        }
                    }
                }
                l_pos = l_scope[2];
            }
            if (self.h_status == 4)
            {
                var l_proc = false;
                while (l_scope != undefined)
                {
                    if (l_scope[8] != undefined)
                    {
                        array_set(l_scope, 2, l_scope[8].h_value);
                        self.h_status = 1;
                        break;
                    }
                    else
                    {
                        l_scope = l_scope[10];
                        l_proc = true;
                    }
                }
                if (l_scope == undefined)
                {
                    self.h_result = undefined;
                    var l__callback = self.h_callback;
                    if (l__callback != undefined)
                    {
                        l__callback(self);
                    }
                    break;
                }
                else if (l_proc)
                {
                    if (l_scope[7] != undefined)
                    {
                        gml_with_scope_destroy(l_scope[7]);
                    }
                    l_actions = l_scope[1];
                    l_len = ds_list_size(l_actions);
                    l_stack = l_scope[5];
                }
            }
            else if (l_scope[2] >= l_len && self.h_status == 1)
            {
                if (l_scope[7] != undefined)
                {
                    gml_with_scope_destroy(l_scope[7]);
                }
                l_scope[5] = undefined;
                l_scope[6] = undefined;
                l_scope[4] = undefined;
                l_scope = l_scope[10];
                if (l_scope != undefined)
                {
                    self.h_scope = l_scope;
                    l_actions = l_scope[1];
                    l_len = ds_list_size(l_actions);
                    l_stack = l_scope[5];
                }
                else
                {
                    self.h_status = 3;
                    var l__callback = self.h_callback;
                    if (l__callback != undefined)
                    {
                        l__callback(self);
                    }
                    break;
                }
            }
            else
            {
                break;
            }
        }
        global.gml_thread_current = l_previous;
        global.gml_thread_current_kind = l_prevKind;
    };
    
    static h_fork = function()
    {
        var l_q = self.h_scope;
        var l_q_inst = l_q[6];
        var l_r = new gml_thread(l_q[9], l_q[1], gml_value_list_copy(l_q[3]), gml_value_list_copy(l_q[4]), l_q_inst[l_q_inst[0]], l_q_inst[l_q_inst[0] - 1], l_q[2]);
        l_r.h_callback = self.h_callback;
        var l_n = l_r.h_scope;
        array_set(l_n, 6, gml_std_gml_internal_ArrayImpl_copy(l_q_inst));
        array_set(l_n, 5, gml_std_gml_internal_ArrayImpl_copy(l_q[5]));
        array_set(l_n, 7, gml_with_scope_copy(l_q[7]));
        return l_r;
    };
    
    if (arg6 == undefined)
    {
        arg6 = 0;
    }
    self.h_error_pos = undefined;
    self.h_error_text = undefined;
    self.h_time_tag = undefined;
    self.h_callback = undefined;
    self.h_status = 0;
    self.h_result = undefined;
    self.h_callback = global.gml_thread_default_callback;
    if (arg4 == undefined)
    {
        arg4 = global.live_custom_self;
    }
    if (arg5 == undefined)
    {
        arg5 = global.live_custom_other;
    }
    if (arg4 == undefined)
    {
        arg4 = global.live_custom_self;
    }
    if (arg5 == undefined)
    {
        arg5 = global.live_custom_other;
    }
    self.h_scope = gml_thread_scope_create(arg1, arg6, arg2, arg3, arg4, arg5, undefined, arg0);
}

function gml_thread_error(arg0)
{
    show_error(arg0, true);
    return undefined;
}

function compile_groups_gml_compile_group_ds_proc(arg0, arg1, arg2)
{
    var l__g = arg0;
    switch (l__g[0])
    {
        case UnknownEnum.Value_82:
            var l_fn = struct_get_from_hash(global.gml_func_map, variable_get_hash("ds_list_find_value"));
            if (l_fn != undefined)
            {
                return compile_gml_compile_call_func_proc(arg1, l__g[1], l_fn, [l__g[2], l__g[3]], arg2);
            }
            else
            {
                return gml_compile_error("Accessor not supported", l__g[1]);
            }
        case UnknownEnum.Value_83:
            l_fn = struct_get_from_hash(global.gml_func_map, variable_get_hash("ds_list_set"));
            if (l_fn != undefined)
            {
                return compile_gml_compile_call_func_proc(arg1, l__g[1], l_fn, [l__g[2], l__g[3], l__g[4]], arg2);
            }
            else
            {
                return gml_compile_error("Accessor not supported", l__g[1]);
            }
        case UnknownEnum.Value_84:
            var l_args1 = [l__g[2], l__g[3], l__g[5]];
            l_fn = struct_get_from_hash(global.gml_func_map, variable_get_hash("ds_list_find_value"));
            var l_fn2 = struct_get_from_hash(global.gml_func_map, variable_get_hash("ds_list_set"));
            if (l_fn != undefined && l_fn2 != undefined)
            {
                compile_gml_compile_args_proc(arg1, l_args1);
                ds_list_add(arg1, gml_action_ds_aop(l__g[1], l__g[4], array_length(l_args1), l_fn.h_func, l_fn2.h_func, arg2));
                return false;
            }
            else
            {
                return gml_compile_error("Accessor not supported", l__g[1]);
            }
        case UnknownEnum.Value_85:
            l_fn = struct_get_from_hash(global.gml_func_map, variable_get_hash("ds_map_find_value"));
            if (l_fn != undefined)
            {
                return compile_gml_compile_call_func_proc(arg1, l__g[1], l_fn, [l__g[2], l__g[3]], arg2);
            }
            else
            {
                return gml_compile_error("Accessor not supported", l__g[1]);
            }
        case UnknownEnum.Value_86:
            l_fn = struct_get_from_hash(global.gml_func_map, variable_get_hash("ds_map_set"));
            if (l_fn != undefined)
            {
                return compile_gml_compile_call_func_proc(arg1, l__g[1], l_fn, [l__g[2], l__g[3], l__g[4]], arg2);
            }
            else
            {
                return gml_compile_error("Accessor not supported", l__g[1]);
            }
        case UnknownEnum.Value_87:
            l_args1 = [l__g[2], l__g[3], l__g[5]];
            l_fn = struct_get_from_hash(global.gml_func_map, variable_get_hash("ds_map_find_value"));
            l_fn2 = struct_get_from_hash(global.gml_func_map, variable_get_hash("ds_map_set"));
            if (l_fn != undefined && l_fn2 != undefined)
            {
                compile_gml_compile_args_proc(arg1, l_args1);
                ds_list_add(arg1, gml_action_ds_aop(l__g[1], l__g[4], array_length(l_args1), l_fn.h_func, l_fn2.h_func, arg2));
                return false;
            }
            else
            {
                return gml_compile_error("Accessor not supported", l__g[1]);
            }
        case UnknownEnum.Value_91:
            l_fn = struct_get_from_hash(global.gml_func_map, variable_get_hash("variable_struct_get"));
            if (l_fn != undefined)
            {
                return compile_gml_compile_call_func_proc(arg1, l__g[1], l_fn, [l__g[2], l__g[3]], arg2);
            }
            else
            {
                return gml_compile_error("Accessor not supported", l__g[1]);
            }
        case UnknownEnum.Value_92:
            l_fn = struct_get_from_hash(global.gml_func_map, variable_get_hash("variable_struct_set"));
            if (l_fn != undefined)
            {
                return compile_gml_compile_call_func_proc(arg1, l__g[1], l_fn, [l__g[2], l__g[3], l__g[4]], arg2);
            }
            else
            {
                return gml_compile_error("Accessor not supported", l__g[1]);
            }
        case UnknownEnum.Value_93:
            l_args1 = [l__g[2], l__g[3], l__g[5]];
            l_fn = struct_get_from_hash(global.gml_func_map, variable_get_hash("variable_struct_get"));
            l_fn2 = struct_get_from_hash(global.gml_func_map, variable_get_hash("variable_struct_set"));
            if (l_fn != undefined && l_fn2 != undefined)
            {
                compile_gml_compile_args_proc(arg1, l_args1);
                ds_list_add(arg1, gml_action_ds_aop(l__g[1], l__g[4], array_length(l_args1), l_fn.h_func, l_fn2.h_func, arg2));
                return false;
            }
            else
            {
                return gml_compile_error("Accessor not supported", l__g[1]);
            }
        case UnknownEnum.Value_88:
            l_fn = struct_get_from_hash(global.gml_func_map, variable_get_hash("ds_grid_get"));
            if (l_fn != undefined)
            {
                return compile_gml_compile_call_func_proc(arg1, l__g[1], l_fn, [l__g[2], l__g[3], l__g[4]], arg2);
            }
            else
            {
                return gml_compile_error("Accessor not supported", l__g[1]);
            }
        case UnknownEnum.Value_89:
            l_fn = struct_get_from_hash(global.gml_func_map, variable_get_hash("ds_grid_set"));
            if (l_fn != undefined)
            {
                return compile_gml_compile_call_func_proc(arg1, l__g[1], l_fn, [l__g[2], l__g[3], l__g[4], l__g[5]], arg2);
            }
            else
            {
                return gml_compile_error("Accessor not supported", l__g[1]);
            }
        case UnknownEnum.Value_90:
            l_args1 = [l__g[2], l__g[3], l__g[4], l__g[6]];
            l_fn = struct_get_from_hash(global.gml_func_map, variable_get_hash("ds_grid_get"));
            l_fn2 = struct_get_from_hash(global.gml_func_map, variable_get_hash("ds_grid_set"));
            if (l_fn != undefined && l_fn2 != undefined)
            {
                compile_gml_compile_args_proc(arg1, l_args1);
                ds_list_add(arg1, gml_action_ds_aop(l__g[1], l__g[5], array_length(l_args1), l_fn.h_func, l_fn2.h_func, arg2));
                return false;
            }
            else
            {
                return gml_compile_error("Accessor not supported", l__g[1]);
            }
        default:
            return undefined;
    }
}

function compile_groups_gml_compile_group_ds_init()
{
    gml_compile_set_handlers(compile_groups_gml_compile_group_ds_proc, ["ds_list", "ds_list_set", "ds_list_aop", "ds_map", "ds_map_set", "ds_map_aop", "ds_grid", "ds_grid_set", "ds_grid_aop", "key_id", "key_id_set", "key_id_aop"]);
}

function compile_groups_gml_compile_group_array_proc_lf(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0];
    array_set(arg3, l_z, arg2[4][self.ind][arg3[l_z] | 0]);
    return 0;
}

function compile_groups_gml_compile_group_array_proc_lf1(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0];
    var l_this1 = arg2[6];
    array_set(arg3, l_z, @@array_get@@(self.func(l_this1[l_this1[0]]), arg3[l_z]));
    return 0;
}

function compile_groups_gml_compile_group_array_proc_lf2(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0];
    var l_this1 = arg2[6];
    array_set(arg3, l_z, @@array_get@@(variable_struct_get(l_this1[l_this1[0]], self.field), arg3[l_z]));
    return 0;
}

function compile_groups_gml_compile_group_array_proc_lf3(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0];
    array_set(arg3, l_z, arg2[4][self.ind][arg3[l_z] | 0]);
    return 0;
}

function compile_groups_gml_compile_group_array_proc_lf4(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0];
    var l_this1 = arg2[6];
    array_set(arg3, l_z, @@array_get@@(self.func(l_this1[l_this1[0]]), arg3[l_z]));
    return 0;
}

function compile_groups_gml_compile_group_array_proc_lf5(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0];
    var l_this1 = arg2[6];
    array_set(arg3, l_z, @@array_get@@(variable_struct_get(l_this1[l_this1[0]], self.field), arg3[l_z]));
    return 0;
}

function compile_groups_gml_compile_group_array_proc_lf6(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0] - 1;
    array_set(arg3, 0, l_z - 1);
    array_set(@@array_get@@(@@array_get@@(arg2, 4), self.ind), @@array_get@@(arg3, l_z), arg3[l_z + 1]);
    array_set(arg3, l_z, 0);
    array_set(arg3, l_z + 1, 0);
    return 0;
}

function compile_groups_gml_compile_group_array_proc_lf7(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0] - 1;
    array_set(arg3, 0, l_z - 1);
    var l_this1 = arg2[6];
    var l_this2 = self.func(l_this1[l_this1[0]]);
    array_set(l_this2, @@array_get@@(arg3, l_z), arg3[l_z + 1]);
    array_set(arg3, l_z, 0);
    array_set(arg3, l_z + 1, 0);
    return 0;
}

function compile_groups_gml_compile_group_array_proc_lf8(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0] - 1;
    array_set(arg3, 0, l_z - 1);
    var l_this1 = arg2[6];
    var l_arr = variable_struct_get(l_this1[l_this1[0]], self.field);
    array_set(l_arr, @@array_get@@(arg3, l_z), arg3[l_z + 1]);
    array_set(arg3, l_z, 0);
    array_set(arg3, l_z + 1, 0);
    return 0;
}

function compile_groups_gml_compile_group_array_proc_lf9(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0] - 1;
    array_set(arg3, 0, l_z - 1);
    array_set(@@array_get@@(@@array_get@@(arg2, 4), self.ind), @@array_get@@(arg3, l_z), arg3[l_z + 1]);
    array_set(arg3, l_z, 0);
    array_set(arg3, l_z + 1, 0);
    return 0;
}

function compile_groups_gml_compile_group_array_proc_lf10(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0] - 1;
    array_set(arg3, 0, l_z - 1);
    var l_this1 = arg2[6];
    var l_this2 = self.func(l_this1[l_this1[0]]);
    array_set(l_this2, @@array_get@@(arg3, l_z), arg3[l_z + 1]);
    array_set(arg3, l_z, 0);
    array_set(arg3, l_z + 1, 0);
    return 0;
}

function compile_groups_gml_compile_group_array_proc_lf11(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0] - 1;
    array_set(arg3, 0, l_z - 1);
    var l_this1 = arg2[6];
    var l_arr = variable_struct_get(l_this1[l_this1[0]], self.field);
    array_set(l_arr, @@array_get@@(arg3, l_z), arg3[l_z + 1]);
    array_set(arg3, l_z, 0);
    array_set(arg3, l_z + 1, 0);
    return 0;
}

function compile_groups_gml_compile_group_array_proc_lf12(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0] - 1;
    array_set(arg3, 0, l_z - 1);
    var l_w = arg2[4][self.ind];
    var l_k = arg3[l_z];
    array_set(l_w, l_k, global.gml_op_apply_fns[self.op](l_w[l_k], arg3[l_z + 1]));
    array_set(arg3, l_z, 0);
    array_set(arg3, l_z + 1, 0);
    return 0;
}

function compile_groups_gml_compile_group_array_proc_lf13(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0] - 1;
    array_set(arg3, 0, l_z - 1);
    var l_this1 = arg2[6];
    var l_w = self.func(l_this1[l_this1[0]]);
    var l_k = arg3[l_z];
    array_set(l_w, l_k, global.gml_op_apply_fns[self.op](l_w[l_k], arg3[l_z + 1]));
    array_set(arg3, l_z, 0);
    array_set(arg3, l_z + 1, 0);
    return 0;
}

function compile_groups_gml_compile_group_array_proc_lf14(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0] - 1;
    array_set(arg3, 0, l_z - 1);
    var l_this1 = arg2[6];
    var l_w = variable_struct_get(l_this1[l_this1[0]], self.field);
    var l_k = arg3[l_z];
    array_set(l_w, l_k, global.gml_op_apply_fns[self.op](l_w[l_k], arg3[l_z + 1]));
    array_set(arg3, l_z, 0);
    array_set(arg3, l_z + 1, 0);
    return 0;
}

function compile_groups_gml_compile_group_array_proc_lf15(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0] - 1;
    array_set(arg3, 0, l_z - 1);
    var l_w = arg2[4][self.ind];
    var l_k = arg3[l_z];
    array_set(l_w, l_k, global.gml_op_apply_fns[self.op](l_w[l_k], arg3[l_z + 1]));
    array_set(arg3, l_z, 0);
    array_set(arg3, l_z + 1, 0);
    return 0;
}

function compile_groups_gml_compile_group_array_proc_lf16(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0] - 1;
    array_set(arg3, 0, l_z - 1);
    var l_this1 = arg2[6];
    var l_w = self.func(l_this1[l_this1[0]]);
    var l_k = arg3[l_z];
    array_set(l_w, l_k, global.gml_op_apply_fns[self.op](l_w[l_k], arg3[l_z + 1]));
    array_set(arg3, l_z, 0);
    array_set(arg3, l_z + 1, 0);
    return 0;
}

function compile_groups_gml_compile_group_array_proc_lf17(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0] - 1;
    array_set(arg3, 0, l_z - 1);
    var l_this1 = arg2[6];
    var l_w = variable_struct_get(l_this1[l_this1[0]], self.field);
    var l_k = arg3[l_z];
    array_set(l_w, l_k, global.gml_op_apply_fns[self.op](l_w[l_k], arg3[l_z + 1]));
    array_set(arg3, l_z, 0);
    array_set(arg3, l_z + 1, 0);
    return 0;
}

function compile_groups_gml_compile_group_array_proc(arg0, arg1, arg2)
{
    var l__g = arg0;
    switch (l__g[0])
    {
        case UnknownEnum.Value_70:
            var l_d = l__g[1];
            var l_arr = l__g[2];
            var l_ind = l__g[3];
            var l__g1 = l_arr;
            var l_i;
            if (l__g1[0] == 43)
            {
                l_i = variable_struct_get(global.gml_compile_curr_script.h_local_map, l__g1[2]);
            }
            else
            {
                l_i = -1;
            }
            if (l_i >= 0)
            {
                if (gml_compile_node(l_ind, arg1, true))
                {
                    return true;
                }
                ds_list_add(arg1, vm_v2_gml_action_closure_bind(l_d, "local[]", 
                {
                    ind: l_i
                }, compile_groups_gml_compile_group_array_proc_lf3));
                return false;
            }
            l__g1 = l_arr;
            if (l__g1[0] == 55)
            {
                if (l__g1[2][0] == 14)
                {
                    var l_s = l__g1[3];
                    if (gml_compile_node(l_ind, arg1, true))
                    {
                        return true;
                    }
                    var l_fastGetter = global.gml_compile_curr_program.h_get_fast_getter(l_s);
                    if (l_fastGetter != undefined)
                    {
                        ds_list_add(arg1, vm_v2_gml_action_closure_bind(l_d, "self.fast_field[]", 
                        {
                            func: l_fastGetter
                        }, compile_groups_gml_compile_group_array_proc_lf4));
                        return false;
                    }
                    else
                    {
                        ds_list_add(arg1, vm_v2_gml_action_closure_bind(l_d, "self.field[]", 
                        {
                            field: l_s
                        }, compile_groups_gml_compile_group_array_proc_lf5));
                        return false;
                    }
                }
            }
            if (compile_gml_compile_args_proc(arg1, [l_arr, l_ind]))
            {
                return true;
            }
            ds_list_add(arg1, gml_action_index(l_d));
            break;
        case UnknownEnum.Value_76:
            var l_d = l__g[1];
            var l_arr = l__g[2];
            var l_ind = l__g[3];
            var l__g1 = l_arr;
            var l_i;
            if (l__g1[0] == 43)
            {
                l_i = variable_struct_get(global.gml_compile_curr_script.h_local_map, l__g1[2]);
            }
            else
            {
                l_i = -1;
            }
            if (l_i >= 0)
            {
                if (gml_compile_node(l_ind, arg1, true))
                {
                    return true;
                }
                ds_list_add(arg1, vm_v2_gml_action_closure_bind(l_d, "local[]", 
                {
                    ind: l_i
                }, compile_groups_gml_compile_group_array_proc_lf));
                return false;
            }
            l__g1 = l_arr;
            if (l__g1[0] == 55)
            {
                if (l__g1[2][0] == 14)
                {
                    var l_s = l__g1[3];
                    if (gml_compile_node(l_ind, arg1, true))
                    {
                        return true;
                    }
                    var l_fastGetter = global.gml_compile_curr_program.h_get_fast_getter(l_s);
                    if (l_fastGetter != undefined)
                    {
                        ds_list_add(arg1, vm_v2_gml_action_closure_bind(l_d, "self.fast_field[]", 
                        {
                            func: l_fastGetter
                        }, compile_groups_gml_compile_group_array_proc_lf1));
                        return false;
                    }
                    else
                    {
                        ds_list_add(arg1, vm_v2_gml_action_closure_bind(l_d, "self.field[]", 
                        {
                            field: l_s
                        }, compile_groups_gml_compile_group_array_proc_lf2));
                        return false;
                    }
                }
            }
            if (compile_gml_compile_args_proc(arg1, [l_arr, l_ind]))
            {
                return true;
            }
            ds_list_add(arg1, gml_action_index(l_d));
            break;
        case UnknownEnum.Value_71:
            var l_d = l__g[1];
            var l_arr = l__g[2];
            var l_ind = l__g[3];
            var l_val = l__g[4];
            var l__g1 = l_arr;
            var l_i;
            if (l__g1[0] == 43)
            {
                l_i = variable_struct_get(global.gml_compile_curr_script.h_local_map, l__g1[2]);
            }
            else
            {
                l_i = -1;
            }
            if (l_i >= 0)
            {
                if (compile_gml_compile_args_proc(arg1, [l_ind, l_val]))
                {
                    return true;
                }
                ds_list_add(arg1, vm_v2_gml_action_closure_bind(l_d, "local[]=", 
                {
                    ind: l_i
                }, compile_groups_gml_compile_group_array_proc_lf9));
                return false;
            }
            l__g1 = l_arr;
            if (l__g1[0] == 55)
            {
                if (l__g1[2][0] == 14)
                {
                    var l_s = l__g1[3];
                    if (compile_gml_compile_args_proc(arg1, [l_ind, l_val]))
                    {
                        return true;
                    }
                    var l_fastGetter = global.gml_compile_curr_program.h_get_fast_getter(l_s);
                    if (l_fastGetter != undefined)
                    {
                        ds_list_add(arg1, vm_v2_gml_action_closure_bind(l_d, "self.fast_field[]=", 
                        {
                            func: l_fastGetter
                        }, compile_groups_gml_compile_group_array_proc_lf10));
                        return false;
                    }
                    else
                    {
                        ds_list_add(arg1, vm_v2_gml_action_closure_bind(l_d, "self.field[]=", 
                        {
                            field: l_s
                        }, compile_groups_gml_compile_group_array_proc_lf11));
                        return false;
                    }
                }
            }
            if (compile_gml_compile_args_proc(arg1, [l_arr, l_ind, l_val]))
            {
                return true;
            }
            ds_list_add(arg1, gml_action_index_set(l_d));
            break;
        case UnknownEnum.Value_77:
            var l_d = l__g[1];
            var l_arr = l__g[2];
            var l_ind = l__g[3];
            var l_val = l__g[4];
            var l__g1 = l_arr;
            var l_i;
            if (l__g1[0] == 43)
            {
                l_i = variable_struct_get(global.gml_compile_curr_script.h_local_map, l__g1[2]);
            }
            else
            {
                l_i = -1;
            }
            if (l_i >= 0)
            {
                if (compile_gml_compile_args_proc(arg1, [l_ind, l_val]))
                {
                    return true;
                }
                ds_list_add(arg1, vm_v2_gml_action_closure_bind(l_d, "local[]=", 
                {
                    ind: l_i
                }, compile_groups_gml_compile_group_array_proc_lf6));
                return false;
            }
            l__g1 = l_arr;
            if (l__g1[0] == 55)
            {
                if (l__g1[2][0] == 14)
                {
                    var l_s = l__g1[3];
                    if (compile_gml_compile_args_proc(arg1, [l_ind, l_val]))
                    {
                        return true;
                    }
                    var l_fastGetter = global.gml_compile_curr_program.h_get_fast_getter(l_s);
                    if (l_fastGetter != undefined)
                    {
                        ds_list_add(arg1, vm_v2_gml_action_closure_bind(l_d, "self.fast_field[]=", 
                        {
                            func: l_fastGetter
                        }, compile_groups_gml_compile_group_array_proc_lf7));
                        return false;
                    }
                    else
                    {
                        ds_list_add(arg1, vm_v2_gml_action_closure_bind(l_d, "self.field[]=", 
                        {
                            field: l_s
                        }, compile_groups_gml_compile_group_array_proc_lf8));
                        return false;
                    }
                }
            }
            if (compile_gml_compile_args_proc(arg1, [l_arr, l_ind, l_val]))
            {
                return true;
            }
            ds_list_add(arg1, gml_action_index_set(l_d));
            break;
        case UnknownEnum.Value_72:
            var l_d = l__g[1];
            var l_arr = l__g[2];
            var l_ind = l__g[3];
            var l_op = l__g[4];
            var l_val = l__g[5];
            var l__g1 = l_arr;
            var l_i;
            if (l__g1[0] == 43)
            {
                l_i = variable_struct_get(global.gml_compile_curr_script.h_local_map, l__g1[2]);
            }
            else
            {
                l_i = -1;
            }
            if (l_i >= 0)
            {
                if (compile_gml_compile_args_proc(arg1, [l_ind, l_val]))
                {
                    return true;
                }
                ds_list_add(arg1, vm_v2_gml_action_closure_bind(l_d, "local[]=", 
                {
                    ind: l_i,
                    op: l_op
                }, compile_groups_gml_compile_group_array_proc_lf12));
                return false;
            }
            l__g1 = l_arr;
            if (l__g1[0] == 55)
            {
                if (l__g1[2][0] == 14)
                {
                    var l_s = l__g1[3];
                    if (compile_gml_compile_args_proc(arg1, [l_ind, l_val]))
                    {
                        return true;
                    }
                    var l_fastGetter = global.gml_compile_curr_program.h_get_fast_getter(l_s);
                    if (l_fastGetter != undefined)
                    {
                        ds_list_add(arg1, vm_v2_gml_action_closure_bind(l_d, "self.fast_field[]=", 
                        {
                            func: l_fastGetter,
                            op: l_op
                        }, compile_groups_gml_compile_group_array_proc_lf13));
                        return false;
                    }
                    else
                    {
                        ds_list_add(arg1, vm_v2_gml_action_closure_bind(l_d, "self.field[]=", 
                        {
                            field: l_s,
                            op: l_op
                        }, compile_groups_gml_compile_group_array_proc_lf14));
                        return false;
                    }
                }
            }
            if (compile_gml_compile_args_proc(arg1, [l_arr, l_ind, l_val]))
            {
                return true;
            }
            ds_list_add(arg1, gml_action_index_aop(l_d, l_op));
            break;
        case UnknownEnum.Value_78:
            var l_d = l__g[1];
            var l_arr = l__g[2];
            var l_ind = l__g[3];
            var l_op = l__g[4];
            var l_val = l__g[5];
            var l__g1 = l_arr;
            var l_i;
            if (l__g1[0] == 43)
            {
                l_i = variable_struct_get(global.gml_compile_curr_script.h_local_map, l__g1[2]);
            }
            else
            {
                l_i = -1;
            }
            if (l_i >= 0)
            {
                if (compile_gml_compile_args_proc(arg1, [l_ind, l_val]))
                {
                    return true;
                }
                ds_list_add(arg1, vm_v2_gml_action_closure_bind(l_d, "local[]=", 
                {
                    ind: l_i,
                    op: l_op
                }, compile_groups_gml_compile_group_array_proc_lf15));
                return false;
            }
            l__g1 = l_arr;
            if (l__g1[0] == 55)
            {
                if (l__g1[2][0] == 14)
                {
                    var l_s = l__g1[3];
                    if (compile_gml_compile_args_proc(arg1, [l_ind, l_val]))
                    {
                        return true;
                    }
                    var l_fastGetter = global.gml_compile_curr_program.h_get_fast_getter(l_s);
                    if (l_fastGetter != undefined)
                    {
                        ds_list_add(arg1, vm_v2_gml_action_closure_bind(l_d, "self.fast_field[]=", 
                        {
                            func: l_fastGetter,
                            op: l_op
                        }, compile_groups_gml_compile_group_array_proc_lf16));
                        return false;
                    }
                    else
                    {
                        ds_list_add(arg1, vm_v2_gml_action_closure_bind(l_d, "self.field[]=", 
                        {
                            field: l_s,
                            op: l_op
                        }, compile_groups_gml_compile_group_array_proc_lf17));
                        return false;
                    }
                }
            }
            if (compile_gml_compile_args_proc(arg1, [l_arr, l_ind, l_val]))
            {
                return true;
            }
            ds_list_add(arg1, gml_action_index_aop(l_d, l_op));
            break;
        case UnknownEnum.Value_73:
            if (compile_gml_compile_args_proc(arg1, [l__g[2], l__g[3], l__g[4]]))
            {
                return true;
            }
            ds_list_add(arg1, gml_action_index2d(l__g[1]));
            break;
        case UnknownEnum.Value_79:
            if (compile_gml_compile_args_proc(arg1, [l__g[2], l__g[3], l__g[4]]))
            {
                return true;
            }
            ds_list_add(arg1, gml_action_index2d(l__g[1]));
            break;
        case UnknownEnum.Value_74:
            if (compile_gml_compile_args_proc(arg1, [l__g[2], l__g[3], l__g[4], l__g[5]]))
            {
                return true;
            }
            ds_list_add(arg1, gml_action_index2d_set(l__g[1]));
            break;
        case UnknownEnum.Value_80:
            if (compile_gml_compile_args_proc(arg1, [l__g[2], l__g[3], l__g[4], l__g[5]]))
            {
                return true;
            }
            ds_list_add(arg1, gml_action_index2d_set(l__g[1]));
            break;
        case UnknownEnum.Value_75:
            if (compile_gml_compile_args_proc(arg1, [l__g[2], l__g[3], l__g[4], l__g[6]]))
            {
                return true;
            }
            ds_list_add(arg1, gml_action_index2d_aop(l__g[1], l__g[5]));
            break;
        case UnknownEnum.Value_81:
            if (compile_gml_compile_args_proc(arg1, [l__g[2], l__g[3], l__g[4], l__g[6]]))
            {
                return true;
            }
            ds_list_add(arg1, gml_action_index2d_aop(l__g[1], l__g[5]));
            break;
        default:
            return undefined;
    }
    return false;
}

function compile_groups_gml_compile_group_array_init()
{
    gml_compile_set_handlers(compile_groups_gml_compile_group_array_proc, ["index", "index_set", "index_aop", "raw_id", "raw_id_set", "raw_id_aop", "index2d", "index2d_set", "index2d_aop", "raw_id2d", "raw_id2d_set", "raw_id2d_aop"]);
}

function compile_groups_gml_compile_group_local_proc_lf(arg0, arg1, arg2, arg3)
{
    array_set(@@array_get@@(arg2, 4), self.ind, self.val);
    return 0;
}

function compile_groups_gml_compile_group_local_proc_lf1(arg0, arg1, arg2, arg3)
{
    array_set(@@array_get@@(arg2, 4), self.ind, self.val);
    return 0;
}

function compile_groups_gml_compile_group_local_proc_lf2(arg0, arg1, arg2, arg3)
{
    array_set(@@array_get@@(arg2, 4), self.ind, @@array_get@@(@@array_get@@(arg2, 4), self.ind) / self.num);
    return 0;
}

function compile_groups_gml_compile_group_local_proc_lf3(arg0, arg1, arg2, arg3)
{
    var l_this1 = arg2[4];
    array_set(l_this1, self.ind, arg2[4][self.ind] div self.num);
    return 0;
}

function compile_groups_gml_compile_group_local_proc_lf4(arg0, arg1, arg2, arg3)
{
    array_set(@@array_get@@(arg2, 4), self.ind, @@array_get@@(@@array_get@@(arg2, 4), self.ind) - self.num);
    return 0;
}

function compile_groups_gml_compile_group_local_proc_lf5(arg0, arg1, arg2, arg3)
{
    array_set(@@array_get@@(arg2, 4), self.ind, arg2[4][self.ind] << self.num);
    return 0;
}

function compile_groups_gml_compile_group_local_proc_lf6(arg0, arg1, arg2, arg3)
{
    array_set(@@array_get@@(arg2, 4), self.ind, arg2[4][self.ind] >> self.num);
    return 0;
}

function compile_groups_gml_compile_group_local_proc_lf7(arg0, arg1, arg2, arg3)
{
    array_set(@@array_get@@(arg2, 4), self.ind, @@array_get@@(@@array_get@@(arg2, 4), self.ind) | self.num);
    return 0;
}

function compile_groups_gml_compile_group_local_proc_lf8(arg0, arg1, arg2, arg3)
{
    array_set(@@array_get@@(arg2, 4), self.ind, @@array_get@@(@@array_get@@(arg2, 4), self.ind) & self.num);
    return 0;
}

function compile_groups_gml_compile_group_local_proc_lf9(arg0, arg1, arg2, arg3)
{
    array_set(@@array_get@@(arg2, 4), self.ind, @@array_get@@(@@array_get@@(arg2, 4), self.ind) ^ self.num);
    return 0;
}

function compile_groups_gml_compile_group_local_proc_lf10(arg0, arg1, arg2, arg3)
{
    array_set(@@array_get@@(arg2, 4), self.ind, arg2[4][self.ind] == self.num);
    return 0;
}

function compile_groups_gml_compile_group_local_proc_lf11(arg0, arg1, arg2, arg3)
{
    array_set(@@array_get@@(arg2, 4), self.ind, arg2[4][self.ind] != self.num);
    return 0;
}

function compile_groups_gml_compile_group_local_proc_lf12(arg0, arg1, arg2, arg3)
{
    array_set(@@array_get@@(arg2, 4), self.ind, arg2[4][self.ind] <= self.num);
    return 0;
}

function compile_groups_gml_compile_group_local_proc_lf13(arg0, arg1, arg2, arg3)
{
    array_set(@@array_get@@(arg2, 4), self.ind, arg2[4][self.ind] > self.num);
    return 0;
}

function compile_groups_gml_compile_group_local_proc_lf14(arg0, arg1, arg2, arg3)
{
    array_set(@@array_get@@(arg2, 4), self.ind, arg2[4][self.ind] >= self.num);
    return 0;
}

function compile_groups_gml_compile_group_local_proc_lf15(arg0, arg1, arg2, arg3)
{
    array_set(@@array_get@@(arg2, 4), self.ind, arg2[4][self.ind] < self.num);
    return 0;
}

function compile_groups_gml_compile_group_local_proc_lf16(arg0, arg1, arg2, arg3)
{
    array_set(@@array_get@@(arg2, 4), self.ind, @@array_get@@(@@array_get@@(arg2, 4), self.ind) + self.num);
    return 0;
}

function compile_groups_gml_compile_group_local_proc_lf17(arg0, arg1, arg2, arg3)
{
    array_set(@@array_get@@(arg2, 4), self.ind, @@array_get@@(@@array_get@@(arg2, 4), self.ind) / self.num);
    return 0;
}

function compile_groups_gml_compile_group_local_proc_lf18(arg0, arg1, arg2, arg3)
{
    array_set(@@array_get@@(arg2, 4), self.ind, @@array_get@@(@@array_get@@(arg2, 4), self.ind) * self.num);
    return 0;
}

function compile_groups_gml_compile_group_local_proc(arg0, arg1, arg2)
{
    var l__g = arg0;
    switch (l__g[0])
    {
        case UnknownEnum.Value_94:
            var l_d = l__g[1];
            var l_s = l__g[2];
            var l_x = l__g[3];
            if (l_x != undefined)
            {
                var l_i = variable_struct_get(global.gml_compile_curr_script.h_local_map, l_s);
                if (gml_compile_const_val_of(l_x))
                {
                    ds_list_add(arg1, vm_v2_gml_action_closure_bind(l_d, "local = const", 
                    {
                        ind: l_i,
                        name: l_s,
                        val: global.gml_compile_const_val_of_val
                    }, compile_groups_gml_compile_group_local_proc_lf));
                    return false;
                }
                if (gml_compile_node(l_x, arg1, true))
                {
                    return true;
                }
                ds_list_add(arg1, gml_action_local_set(l_d, l_i, l_s));
            }
            break;
        case UnknownEnum.Value_43:
            var l_s = l__g[2];
            ds_list_add(arg1, gml_action_local_hx(l__g[1], variable_struct_get(global.gml_compile_curr_script.h_local_map, l_s), l_s));
            break;
        case UnknownEnum.Value_44:
            var l_d = l__g[1];
            var l_s = l__g[2];
            var l_x = l__g[3];
            var l_i = variable_struct_get(global.gml_compile_curr_script.h_local_map, l_s);
            if (gml_compile_const_val_of(l_x))
            {
                ds_list_add(arg1, vm_v2_gml_action_closure_bind(l_d, "local = const", 
                {
                    ind: l_i,
                    name: l_s,
                    val: global.gml_compile_const_val_of_val
                }, compile_groups_gml_compile_group_local_proc_lf1));
                return false;
            }
            if (gml_compile_node(l_x, arg1, true))
            {
                return true;
            }
            ds_list_add(arg1, gml_action_local_set(l_d, l_i, l_s));
            break;
        case UnknownEnum.Value_45:
            var l_d = l__g[1];
            var l_s = l__g[2];
            var l_o = l__g[3];
            var l_x = l__g[4];
            var l_i = variable_struct_get(global.gml_compile_curr_script.h_local_map, l_s);
            if (gml_compile_const_val_of(l_x))
            {
                switch (l_o)
                {
                    case 2:
                        ds_list_add(arg1, vm_v2_gml_action_closure_bind(l_d, "local %= number", 
                        {
                            ind: l_i,
                            name: l_s,
                            num: global.gml_compile_const_val_of_val,
                            op: l_o
                        }, compile_groups_gml_compile_group_local_proc_lf2));
                        return false;
                    case 3:
                        ds_list_add(arg1, vm_v2_gml_action_closure_bind(l_d, "local div= number", 
                        {
                            ind: l_i,
                            name: l_s,
                            num: global.gml_compile_const_val_of_val,
                            op: l_o
                        }, compile_groups_gml_compile_group_local_proc_lf3));
                        return false;
                    case 17:
                        ds_list_add(arg1, vm_v2_gml_action_closure_bind(l_d, "local -= number", 
                        {
                            ind: l_i,
                            name: l_s,
                            num: global.gml_compile_const_val_of_val,
                            op: l_o
                        }, compile_groups_gml_compile_group_local_proc_lf4));
                        return false;
                    case 32:
                        ds_list_add(arg1, vm_v2_gml_action_closure_bind(l_d, "local <<= number", 
                        {
                            ind: l_i,
                            name: l_s,
                            num: global.gml_compile_const_val_of_val,
                            op: l_o
                        }, compile_groups_gml_compile_group_local_proc_lf5));
                        return false;
                    case 33:
                        ds_list_add(arg1, vm_v2_gml_action_closure_bind(l_d, "local >>= number", 
                        {
                            ind: l_i,
                            name: l_s,
                            num: global.gml_compile_const_val_of_val,
                            op: l_o
                        }, compile_groups_gml_compile_group_local_proc_lf6));
                        return false;
                    case 48:
                        ds_list_add(arg1, vm_v2_gml_action_closure_bind(l_d, "local |= number", 
                        {
                            ind: l_i,
                            name: l_s,
                            num: global.gml_compile_const_val_of_val,
                            op: l_o
                        }, compile_groups_gml_compile_group_local_proc_lf7));
                        return false;
                    case 49:
                        ds_list_add(arg1, vm_v2_gml_action_closure_bind(l_d, "local &= number", 
                        {
                            ind: l_i,
                            name: l_s,
                            num: global.gml_compile_const_val_of_val,
                            op: l_o
                        }, compile_groups_gml_compile_group_local_proc_lf8));
                        return false;
                    case 50:
                        ds_list_add(arg1, vm_v2_gml_action_closure_bind(l_d, "local ^= number", 
                        {
                            ind: l_i,
                            name: l_s,
                            num: global.gml_compile_const_val_of_val,
                            op: l_o
                        }, compile_groups_gml_compile_group_local_proc_lf9));
                        return false;
                    case 64:
                        ds_list_add(arg1, vm_v2_gml_action_closure_bind(l_d, "local eq= number", 
                        {
                            ind: l_i,
                            name: l_s,
                            num: global.gml_compile_const_val_of_val,
                            op: l_o
                        }, compile_groups_gml_compile_group_local_proc_lf10));
                        return false;
                    case 65:
                        ds_list_add(arg1, vm_v2_gml_action_closure_bind(l_d, "local ne= number", 
                        {
                            ind: l_i,
                            name: l_s,
                            num: global.gml_compile_const_val_of_val,
                            op: l_o
                        }, compile_groups_gml_compile_group_local_proc_lf11));
                        return false;
                    case 67:
                        ds_list_add(arg1, vm_v2_gml_action_closure_bind(l_d, "local le= number", 
                        {
                            ind: l_i,
                            name: l_s,
                            num: global.gml_compile_const_val_of_val,
                            op: l_o
                        }, compile_groups_gml_compile_group_local_proc_lf12));
                        return false;
                    case 68:
                        ds_list_add(arg1, vm_v2_gml_action_closure_bind(l_d, "local gt= number", 
                        {
                            ind: l_i,
                            name: l_s,
                            num: global.gml_compile_const_val_of_val,
                            op: l_o
                        }, compile_groups_gml_compile_group_local_proc_lf13));
                        return false;
                    case 69:
                        ds_list_add(arg1, vm_v2_gml_action_closure_bind(l_d, "local ge= number", 
                        {
                            ind: l_i,
                            name: l_s,
                            num: global.gml_compile_const_val_of_val,
                            op: l_o
                        }, compile_groups_gml_compile_group_local_proc_lf14));
                        return false;
                    case 66:
                        ds_list_add(arg1, vm_v2_gml_action_closure_bind(l_d, "local lt= number", 
                        {
                            ind: l_i,
                            name: l_s,
                            num: global.gml_compile_const_val_of_val,
                            op: l_o
                        }, compile_groups_gml_compile_group_local_proc_lf15));
                        return false;
                    case 16:
                        ds_list_add(arg1, vm_v2_gml_action_closure_bind(l_d, "local += number", 
                        {
                            ind: l_i,
                            name: l_s,
                            num: global.gml_compile_const_val_of_val,
                            op: l_o
                        }, compile_groups_gml_compile_group_local_proc_lf16));
                        return false;
                    case 1:
                        ds_list_add(arg1, vm_v2_gml_action_closure_bind(l_d, "local /= number", 
                        {
                            ind: l_i,
                            name: l_s,
                            num: global.gml_compile_const_val_of_val,
                            op: l_o
                        }, compile_groups_gml_compile_group_local_proc_lf17));
                        return false;
                    case 0:
                        ds_list_add(arg1, vm_v2_gml_action_closure_bind(l_d, "local *= number", 
                        {
                            ind: l_i,
                            name: l_s,
                            num: global.gml_compile_const_val_of_val,
                            op: l_o
                        }, compile_groups_gml_compile_group_local_proc_lf18));
                        return false;
                }
            }
            if (gml_compile_node(l_x, arg1, true))
            {
                return true;
            }
            ds_list_add(arg1, gml_action_local_aop(l_d, l_o, variable_struct_get(global.gml_compile_curr_script.h_local_map, l_s), l_s));
            break;
        default:
            return undefined;
    }
    return false;
}

function compile_groups_gml_compile_group_local_init()
{
    gml_compile_set_handlers(compile_groups_gml_compile_group_local_proc, ["var_decl", "local", "local_set", "local_aop"]);
}

function gml_stack_push(arg0, arg1)
{
    var l_i = arg0[0] + 1;
    if (l_i >= array_length(arg0))
    {
        array_set(arg0, array_length(arg0) * 2, 0);
    }
    array_set(arg0, l_i, arg1);
    array_set(arg0, 0, l_i);
}

function gml_stack_pop(arg0)
{
    var l_i = arg0[0];
    var l_r = arg0[l_i];
    array_set(arg0, l_i, 0);
    array_set(arg0, 0, l_i - 1);
    return l_r;
}

function gml_stack_pop_multi(arg0, arg1)
{
    var l_arr = [];
    var l_k = arg0[0] - arg1;
    array_copy(l_arr, 0, arg0, l_k + 1, arg1);
    array_copy(arg0, l_k + 1, global.gml_stack_fill_value_arr, 0, arg1);
    array_set(arg0, 0, l_k);
    return l_arr;
}

function gml_stack_discard(arg0)
{
    var l_i = arg0[0];
    array_set(arg0, l_i, 0);
    array_set(arg0, 0, l_i - 1);
}

function gml_stack_discard_multi(arg0, arg1)
{
    var l_i = arg0[0] - arg1;
    array_copy(arg0, l_i + 1, global.gml_stack_fill_value_arr, 0, arg1);
    array_set(arg0, 0, l_i);
}

function gml_compile_error(arg0, arg1)
{
    global.gml_compile_error_text = gml_pos_to_string(arg1, global.gml_compile_curr_program) + " " + arg0;
    global.gml_compile_error_pos = arg1;
    return true;
}

function gml_compile_const_val_of(arg0)
{
    var l__g = arg0;
    var l_tmp;
    switch (l__g[0])
    {
        case UnknownEnum.Value_0:
            l_tmp = undefined;
            break;
        case UnknownEnum.Value_2:
            l_tmp = l__g[2];
            break;
        case UnknownEnum.Value_3:
            l_tmp = l__g[2];
            break;
        case UnknownEnum.Value_4:
            l_tmp = l__g[2];
            break;
        case UnknownEnum.Value_19:
            l_tmp = variable_struct_get(global.gml_const_val, l__g[2]);
            break;
        default:
            return false;
    }
    global.gml_compile_const_val_of_val = l_tmp;
    return true;
}

function gml_compile_set_handlers(arg0, arg1)
{
    var l__g = 0;
    while (l__g < array_length(arg1))
    {
        var l_defName = arg1[l__g];
        l__g++;
        var l_i = variable_struct_get(global.gml_compile_def_indexes.h_obj, l_defName);
        if (l_i == undefined)
        {
            show_error("Couldn't find " + l_defName, true);
        }
        if (global.gml_compile_handlers[l_i] != undefined)
        {
            show_debug_message("Handler re-definition for " + l_defName);
        }
        array_set(global.gml_compile_handlers, l_i, arg0);
    }
}

function gml_compile_init()
{
    global.gml_compile_def_indexes = new haxe_ds_string_map();
    var l_names = gml_std_gml_internal_ArrayImpl_copy(global.g_gml_node_constructors);
    var l__g_current = 0;
    var l__g_array = l_names;
    while (l__g_current < array_length(l__g_array))
    {
        var l_name = l__g_array[l__g_current];
        var l_i = l__g_current++;
        if (gml_std_StringTools_endsWith(l_name, "_hx"))
        {
            l_name = gml_std_string_substring(l_name, 0, string_length(l_name) - 3);
        }
        variable_struct_set(global.gml_compile_def_indexes.h_obj, l_name, l_i);
    }
    global.gml_compile_handlers = array_create(array_length(l_names), undefined);
    compile_groups_gml_compile_group_literal_init();
    compile_groups_gml_compile_group_ds_init();
    compile_groups_gml_compile_group_array_init();
    compile_groups_gml_compile_group_local_init();
    compile_groups_gml_compile_group_static_init();
    return undefined;
}

function gml_compile_node(arg0, arg1, arg2)
{
    var l_h = global.gml_compile_handlers[arg0[0]];
    if (l_h != undefined)
    {
        var l_z = l_h(arg0, arg1, arg2);
        if (l_z != undefined)
        {
            return l_z;
        }
    }
    var l__g = arg0;
    switch (l__g[0])
    {
        case UnknownEnum.Value_8:
            ds_list_add(arg1, gml_action_ensure_array_for_local(l__g[1], variable_struct_get(global.gml_compile_curr_script.h_local_map, l__g[2])));
            break;
        case UnknownEnum.Value_9:
            ds_list_add(arg1, gml_action_ensure_array_for_global(l__g[1], l__g[2]));
            break;
        case UnknownEnum.Value_10:
            if (gml_compile_node(l__g[2], arg1, true))
            {
                return true;
            }
            ds_list_add(arg1, gml_action_ensure_array_for_field(l__g[1], l__g[3]));
            break;
        case UnknownEnum.Value_11:
            if (compile_gml_compile_args_proc(arg1, [l__g[2], l__g[3]]))
            {
                return true;
            }
            ds_list_add(arg1, gml_action_ensure_array_for_index(l__g[1]));
            break;
        case UnknownEnum.Value_12:
            if (compile_gml_compile_args_proc(arg1, [l__g[2], l__g[3], l__g[4]]))
            {
                return true;
            }
            ds_list_add(arg1, gml_action_ensure_array_for_index2d(l__g[1]));
            break;
        case UnknownEnum.Value_42:
            var l__field = l__g[2];
            var l__g1 = l__field;
            if (l__g1[0] == 3)
            {
                if (gml_compile_node(l__g[3], arg1, true))
                {
                    return true;
                }
                ds_list_add(arg1, gml_action_in_const(l__g[1], l__g1[2], l__g[4]));
            }
            else
            {
                if (compile_gml_compile_args_proc(arg1, [l__field, l__g[3]]))
                {
                    return true;
                }
                ds_list_add(arg1, gml_action_in(l__g[1], l__g[4]));
            }
            break;
        case UnknownEnum.Value_49:
            ds_list_add(arg1, gml_action_global_hx(l__g[1], l__g[2]));
            break;
        case UnknownEnum.Value_50:
            if (gml_compile_node(l__g[3], arg1, true))
            {
                return true;
            }
            ds_list_add(arg1, gml_action_global_set(l__g[1], l__g[2]));
            break;
        case UnknownEnum.Value_51:
            if (gml_compile_node(l__g[4], arg1, true))
            {
                return true;
            }
            ds_list_add(arg1, gml_action_global_aop(l__g[1], l__g[3], l__g[2]));
            break;
        case UnknownEnum.Value_55:
            var l_x1 = l__g[2];
            var l_s = l__g[3];
            var l_fastGetter = global.gml_compile_curr_program.h_get_fast_getter(l_s);
            var l__g1 = l_x1;
            switch (l__g1[0])
            {
                case UnknownEnum.Value_14:
                    if (l_fastGetter != undefined)
                    {
                        ds_list_add(arg1, gml_action_fast_self_field(l__g[1], l_fastGetter));
                    }
                    else
                    {
                        ds_list_add(arg1, gml_action_self_field(l__g[1], l_s));
                    }
                    break;
                case UnknownEnum.Value_43:
                    var l_i1 = variable_struct_get(global.gml_compile_curr_script.h_local_map, l__g1[2]);
                    if (l_fastGetter != undefined)
                    {
                        ds_list_add(arg1, gml_action_fast_local_field(l__g[1], l_i1, l_fastGetter));
                    }
                    else
                    {
                        ds_list_add(arg1, gml_action_local_field(l__g[1], l_i1, l_s));
                    }
                    break;
                default:
                    if (gml_compile_node(l_x1, arg1, true))
                    {
                        return true;
                    }
                    if (l_fastGetter != undefined)
                    {
                        ds_list_add(arg1, gml_action_call_func1o(l__g[1], l_fastGetter));
                        break;
                    }
                    ds_list_add(arg1, gml_action_field(l__g[1], l_s));
            }
            break;
        case UnknownEnum.Value_56:
            var l_x1 = l__g[2];
            var l_s = l__g[3];
            var l_fastSetter = global.gml_compile_curr_program.h_get_fast_setter(l_s);
            var l__g1 = l_x1;
            switch (l__g1[0])
            {
                case UnknownEnum.Value_14:
                    if (gml_compile_node(l__g[4], arg1, true))
                    {
                        return true;
                    }
                    if (l_fastSetter != undefined)
                    {
                        ds_list_add(arg1, gml_action_fast_self_field_set(l__g[1], l_fastSetter));
                    }
                    else
                    {
                        ds_list_add(arg1, gml_action_self_field_set(l__g[1], l_s));
                    }
                    break;
                case UnknownEnum.Value_43:
                    var l_i1 = variable_struct_get(global.gml_compile_curr_script.h_local_map, l__g1[2]);
                    if (gml_compile_node(l__g[4], arg1, true))
                    {
                        return true;
                    }
                    if (l_fastSetter != undefined)
                    {
                        ds_list_add(arg1, gml_action_fast_local_field_set(l__g[1], l_i1, l_fastSetter));
                    }
                    else
                    {
                        ds_list_add(arg1, gml_action_local_field_set(l__g[1], l_i1, l_s));
                    }
                    break;
                default:
                    if (compile_gml_compile_args_proc(arg1, [l_x1, l__g[4]]))
                    {
                        return true;
                    }
                    if (l_fastSetter != undefined)
                    {
                        ds_list_add(arg1, gml_action_call_func2(l__g[1], l_fastSetter));
                        break;
                    }
                    ds_list_add(arg1, gml_action_field_set(l__g[1], l_s));
            }
            break;
        case UnknownEnum.Value_57:
            var l_x1 = l__g[2];
            var l_s = l__g[3];
            var l_fastGetter = global.gml_compile_curr_program.h_get_fast_getter(l_s);
            var l_fastSetter = global.gml_compile_curr_program.h_get_fast_setter_after_getter(l_s);
            var l__g1 = l_x1;
            switch (l__g1[0])
            {
                case UnknownEnum.Value_14:
                    if (gml_compile_node(l__g[5], arg1, true))
                    {
                        return true;
                    }
                    if (l_fastGetter != undefined && l_fastSetter != undefined)
                    {
                        ds_list_add(arg1, gml_action_fast_self_field_aop(l__g[1], l__g[4], l_fastGetter, l_fastSetter));
                    }
                    else
                    {
                        ds_list_add(arg1, gml_action_self_field_aop(l__g[1], l__g[4], l_s));
                    }
                    break;
                case UnknownEnum.Value_43:
                    var l_i1 = variable_struct_get(global.gml_compile_curr_script.h_local_map, l__g1[2]);
                    if (gml_compile_node(l__g[5], arg1, true))
                    {
                        return true;
                    }
                    if (l_fastGetter != undefined && l_fastSetter != undefined)
                    {
                        ds_list_add(arg1, gml_action_fast_local_field_aop(l__g[1], l_i1, l__g[4], l_fastGetter, l_fastSetter));
                    }
                    else
                    {
                        ds_list_add(arg1, gml_action_local_field_aop(l__g[1], l_i1, l__g[4], l_s));
                    }
                    break;
                default:
                    if (compile_gml_compile_args_proc(arg1, [l_x1, l__g[5]]))
                    {
                        return true;
                    }
                    if (l_fastGetter != undefined && l_fastSetter != undefined)
                    {
                        ds_list_add(arg1, gml_action_fast_field_aop(l__g[1], l__g[4], l_fastGetter, l_fastSetter));
                        break;
                    }
                    ds_list_add(arg1, gml_action_field_aop(l__g[1], l__g[4], l_s));
            }
            break;
        case UnknownEnum.Value_67:
            if (compile_gml_compile_args_proc(arg1, [l__g[2], l__g[3]]))
            {
                return true;
            }
            ds_list_add(arg1, gml_action_alarm(l__g[1]));
            break;
        case UnknownEnum.Value_68:
            if (compile_gml_compile_args_proc(arg1, [l__g[2], l__g[3], l__g[4]]))
            {
                return true;
            }
            ds_list_add(arg1, gml_action_alarm_set_hx(l__g[1]));
            break;
        case UnknownEnum.Value_69:
            if (compile_gml_compile_args_proc(arg1, [l__g[2], l__g[3], l__g[5]]))
            {
                return true;
            }
            ds_list_add(arg1, gml_action_alarm_aop(l__g[1], l__g[4]));
            break;
        case UnknownEnum.Value_58:
            ds_list_add(arg1, gml_action_env(l__g[1], l__g[2].h_func));
            break;
        case UnknownEnum.Value_59:
            var l_av = l__g[2];
            if (gml_compile_node(l__g[3], arg1, true))
            {
                return true;
            }
            ds_list_add(arg1, gml_action_env_set(l__g[1], l_av.h_func, l_av.h_type_check));
            break;
        case UnknownEnum.Value_60:
            if (gml_compile_node(l__g[4], arg1, true))
            {
                return true;
            }
            ds_list_add(arg1, gml_action_env_aop(l__g[1], l__g[3], l__g[2].h_func));
            break;
        case UnknownEnum.Value_64:
            if (gml_compile_node(l__g[3], arg1, true))
            {
                return true;
            }
            ds_list_add(arg1, gml_action_env1d(l__g[1], l__g[2].h_func));
            break;
        case UnknownEnum.Value_65:
            var l_av = l__g[2];
            if (compile_gml_compile_args_proc(arg1, [l__g[3], l__g[4]]))
            {
                return true;
            }
            ds_list_add(arg1, gml_action_env1d_set(l__g[1], l_av.h_func, l_av.h_type_check));
            break;
        case UnknownEnum.Value_66:
            if (compile_gml_compile_args_proc(arg1, [l__g[3], l__g[5]]))
            {
                return true;
            }
            ds_list_add(arg1, gml_action_env1d_aop(l__g[1], l__g[4], l__g[2].h_func));
            break;
        case UnknownEnum.Value_20:
            ds_list_add(arg1, gml_action_arg_const(l__g[1], l__g[2]));
            break;
        case UnknownEnum.Value_21:
            if (gml_compile_node(l__g[2], arg1, true))
            {
                return true;
            }
            ds_list_add(arg1, gml_action_arg_index(l__g[1]));
            break;
        case UnknownEnum.Value_22:
            ds_list_add(arg1, gml_action_arg_count(l__g[1]));
            break;
        case UnknownEnum.Value_37:
            var l_d = l__g[1];
            var l_o = l__g[2];
            var l_x = l__g[3];
            var l_x2 = l__g[4];
            var l__g1 = l_x;
            switch (l__g1[0])
            {
                case UnknownEnum.Value_20:
                    var l_i = l__g1[2];
                    if (gml_compile_node(l_x2, arg1, true))
                    {
                        return true;
                    }
                    if (l_o != -1)
                    {
                        ds_list_add(arg1, gml_action_arg_const_aop(l_d, l_o, l_i));
                    }
                    else
                    {
                        ds_list_add(arg1, gml_action_arg_const_set(l_d, l_i));
                    }
                    break;
                case UnknownEnum.Value_21:
                    if (gml_compile_node(l__g1[2], arg1, true))
                    {
                        return true;
                    }
                    if (gml_compile_node(l_x2, arg1, true))
                    {
                        return true;
                    }
                    if (l_o != -1)
                    {
                        ds_list_add(arg1, gml_action_arg_index_aop(l_d, l_o));
                    }
                    else
                    {
                        ds_list_add(arg1, gml_action_arg_index_set(l_d));
                    }
                    break;
                default:
                    return gml_compile_error("Cannot set " + gml_std_Type_enumConstructor(l_x), l_d);
            }
            break;
        case UnknownEnum.Value_36:
            return compile_gml_compile_bin_op_proc(arg1, l__g[1], l__g[2], l__g[3], l__g[4]);
        case UnknownEnum.Value_35:
            if (gml_compile_node(l__g[2], arg1, true))
            {
                return true;
            }
            ds_list_add(arg1, gml_action_un_op(l__g[1], l__g[3]));
            break;
        case UnknownEnum.Value_33:
            return compile_gml_compile_adjfix_proc(l__g[1], l__g[2], true, l__g[3], arg1, arg2);
        case UnknownEnum.Value_34:
            return compile_gml_compile_adjfix_proc(l__g[1], l__g[2], false, l__g[3], arg1, arg2);
        case UnknownEnum.Value_24:
            var l_d = l__g[1];
            var l_w = l__g[3];
            var l_n = array_length(l_w);
            for (var l_i = 0; l_i < l_n; l_i++)
            {
                if (gml_compile_node(l_w[l_i], arg1, true))
                {
                    return true;
                }
            }
            ds_list_add(arg1, gml_action_call_script(l_d, variable_struct_get(global.gml_compile_curr_program.h_script_map, l__g[2]), l_n));
            if (arg2)
            {
                ds_list_add(arg1, gml_action_result(l_d));
            }
            break;
        case UnknownEnum.Value_26:
            var l_d = l__g[1];
            var l_w = l__g[3];
            var l_n = array_length(l_w);
            if (gml_compile_node(l__g[2], arg1, true))
            {
                return true;
            }
            for (var l_i = 0; l_i < l_n; l_i++)
            {
                if (gml_compile_node(l_w[l_i], arg1, true))
                {
                    return true;
                }
            }
            ds_list_add(arg1, gml_action_call_script_id(l_d, l_n));
            if (arg2)
            {
                ds_list_add(arg1, gml_action_result(l_d));
            }
            break;
        case UnknownEnum.Value_28:
            var l_d = l__g[1];
            if (gml_compile_node(l__g[2], arg1, true))
            {
                return true;
            }
            var l_w = l__g[4];
            var l_n = array_length(l_w);
            for (var l_i = 0; l_i < l_n; l_i++)
            {
                gml_compile_node(l_w[l_i], arg1, true);
            }
            ds_list_add(arg1, gml_action_call_field(l_d, l__g[3], l_n));
            if (arg2)
            {
                ds_list_add(arg1, gml_action_result(l_d));
            }
            break;
        case UnknownEnum.Value_30:
            var l_d = l__g[1];
            if (gml_compile_node(l__g[2], arg1, true))
            {
                return true;
            }
            var l_w = l__g[4];
            var l_n = array_length(l_w);
            for (var l_i = 0; l_i < l_n; l_i++)
            {
                gml_compile_node(l_w[l_i], arg1, true);
            }
            ds_list_add(arg1, gml_action_call_field(l_d, l__g[3], l_n));
            if (arg2)
            {
                ds_list_add(arg1, gml_action_result(l_d));
            }
            break;
        case UnknownEnum.Value_31:
            var l_d = l__g[1];
            var l_w = l__g[3];
            var l_n = array_length(l_w);
            if (gml_compile_node(l__g[2], arg1, true))
            {
                return true;
            }
            for (var l_i = 0; l_i < l_n; l_i++)
            {
                if (gml_compile_node(l_w[l_i], arg1, true))
                {
                    return true;
                }
            }
            ds_list_add(arg1, gml_action_construct(l_d, l_n));
            if (arg2)
            {
                ds_list_add(arg1, gml_action_result(l_d));
            }
            break;
        case UnknownEnum.Value_27:
            var l_d = l__g[1];
            if (gml_compile_node(l__g[2], arg1, true))
            {
                return true;
            }
            if (gml_compile_node(l__g[3], arg1, true))
            {
                return true;
            }
            ds_list_add(arg1, gml_action_call_script_with_array(l_d));
            if (arg2)
            {
                ds_list_add(arg1, gml_action_result(l_d));
            }
            break;
        case UnknownEnum.Value_25:
            var l_d = l__g[1];
            return gml_compile_error("dot-calls are currently not supported.", l_d);
        case UnknownEnum.Value_29:
            return compile_gml_compile_call_func_proc(arg1, l__g[1], l__g[2], l__g[3], arg2);
        case UnknownEnum.Value_32:
            ds_list_add(arg1, gml_action_func_literal(l__g[1], l__g[2], l__g[3]));
            break;
        case UnknownEnum.Value_95:
            var l_w = l__g[2];
            var l_n = array_length(l_w);
            if (l_n > 0)
            {
                l_n--;
                var l_i;
                for (l_i = 0; l_i < l_n; l_i++)
                {
                    if (gml_compile_node(l_w[l_i], arg1, false))
                    {
                        return true;
                    }
                }
                if (gml_compile_node(l_w[l_i], arg1, arg2))
                {
                    return true;
                }
            }
            break;
        case UnknownEnum.Value_96:
            var l_d = l__g[1];
            var l_x = l__g[4];
            if (gml_compile_node(l__g[2], arg1, true))
            {
                return true;
            }
            var l_i = ds_list_size(arg1);
            ds_list_add(arg1, gml_action_jump_unless(l_d, 0));
            if (gml_compile_node(l__g[3], arg1, false))
            {
                return true;
            }
            if (l_x != undefined)
            {
                var l_n = ds_list_size(arg1);
                ds_list_add(arg1, gml_action_jump(l_d, 0));
                ds_list_set(arg1, l_i, gml_action_jump_unless(l_d, ds_list_size(arg1)));
                if (gml_compile_node(l_x, arg1, false))
                {
                    return true;
                }
                ds_list_set(arg1, l_n, gml_action_jump(l_d, ds_list_size(arg1)));
            }
            else
            {
                ds_list_set(arg1, l_i, gml_action_jump_unless(l_d, ds_list_size(arg1)));
            }
            break;
        case UnknownEnum.Value_97:
            var l_d = l__g[1];
            if (gml_compile_node(l__g[2], arg1, true))
            {
                return true;
            }
            var l_i = ds_list_size(arg1);
            ds_list_add(arg1, gml_action_jump_unless(l_d, 0));
            if (gml_compile_node(l__g[3], arg1, arg2))
            {
                return true;
            }
            var l_n = ds_list_size(arg1);
            ds_list_add(arg1, gml_action_jump(l_d, 0));
            ds_list_set(arg1, l_i, gml_action_jump_unless(l_d, ds_list_size(arg1)));
            if (gml_compile_node(l__g[4], arg1, arg2))
            {
                return true;
            }
            ds_list_set(arg1, l_n, gml_action_jump(l_d, ds_list_size(arg1)));
            break;
        case UnknownEnum.Value_39:
            var l_d = l__g[1];
            if (gml_compile_node(l__g[2], arg1, true))
            {
                return true;
            }
            var l_i = ds_list_size(arg1);
            ds_list_add(arg1, gml_action_jump_placeholder(l_d));
            if (gml_compile_node(l__g[3], arg1, true))
            {
                return true;
            }
            ds_list_set(arg1, l_i, gml_action_null_co(l_d, ds_list_size(arg1)));
            if (!arg2)
            {
                ds_list_add(arg1, gml_action_discard(l_d));
            }
            break;
        case UnknownEnum.Value_104:
            var l_d = l__g[1];
            if (gml_compile_node(l__g[2], arg1, true))
            {
                return true;
            }
            var l_n = ds_list_size(arg1);
            ds_list_add(arg1, gml_action_repeat_pre(l_d, 0));
            var l_p0 = ds_list_size(arg1);
            var l_pc = global.gml_compile_curr_continue;
            var l_pb = global.gml_compile_curr_break;
            global.gml_compile_curr_continue = l_p0;
            global.gml_compile_curr_break = l_p0;
            if (gml_compile_node(l__g[3], arg1, false))
            {
                return true;
            }
            global.gml_compile_curr_continue = l_pc;
            global.gml_compile_curr_break = l_pb;
            var l_p1 = ds_list_size(arg1);
            ds_list_add(arg1, gml_action_repeat_jump(l_d, l_p0));
            var l_p2 = ds_list_size(arg1);
            ds_list_add(arg1, gml_action_discard(l_d));
            for (var l_k = l_p0; l_k < l_p2; l_k++)
            {
                var l__g1 = ds_list_find_value(arg1, l_k);
                switch (l__g1.__enumIndex__)
                {
                    case 105:
                        if (l__g1.h_lp == l_p0)
                        {
                            ds_list_set(arg1, l_k, gml_action_jump(l__g1.h_d, l_p1));
                        }
                        break;
                    case 104:
                        if (l__g1.h_lp == l_p0)
                        {
                            ds_list_set(arg1, l_k, gml_action_jump(l__g1.h_d, l_p2));
                        }
                        break;
                }
            }
            ds_list_set(arg1, l_n, gml_action_repeat_pre(l_d, ds_list_size(arg1)));
            break;
        case UnknownEnum.Value_101:
            var l_d = l__g[1];
            var l_p0 = ds_list_size(arg1);
            if (gml_compile_node(l__g[2], arg1, true))
            {
                return true;
            }
            var l_p1 = ds_list_size(arg1);
            ds_list_add(arg1, gml_action_jump_unless(l_d, 0));
            var l_pc = global.gml_compile_curr_continue;
            var l_pb = global.gml_compile_curr_break;
            global.gml_compile_curr_continue = l_p0;
            global.gml_compile_curr_break = l_p0;
            if (gml_compile_node(l__g[3], arg1, false))
            {
                return true;
            }
            global.gml_compile_curr_continue = l_pc;
            global.gml_compile_curr_break = l_pb;
            ds_list_add(arg1, gml_action_jump(l_d, l_p0));
            var l_p2 = ds_list_size(arg1);
            ds_list_set(arg1, l_p1, gml_action_jump_unless(l_d, l_p2));
            for (var l_k = l_p1; l_k < l_p2; l_k++)
            {
                var l__g1 = ds_list_find_value(arg1, l_k);
                switch (l__g1.__enumIndex__)
                {
                    case 105:
                        if (l__g1.h_lp == l_p0)
                        {
                            ds_list_set(arg1, l_k, gml_action_jump(l__g1.h_d, l_p0));
                        }
                        break;
                    case 104:
                        if (l__g1.h_lp == l_p0)
                        {
                            ds_list_set(arg1, l_k, gml_action_jump(l__g1.h_d, l_p2));
                        }
                        break;
                }
            }
            break;
        case UnknownEnum.Value_102:
            var l_d = l__g[1];
            var l_p0 = ds_list_size(arg1);
            var l_pc = global.gml_compile_curr_continue;
            var l_pb = global.gml_compile_curr_break;
            global.gml_compile_curr_continue = l_p0;
            global.gml_compile_curr_break = l_p0;
            if (gml_compile_node(l__g[2], arg1, false))
            {
                return true;
            }
            global.gml_compile_curr_continue = l_pc;
            global.gml_compile_curr_break = l_pb;
            var l_p1 = ds_list_size(arg1);
            if (gml_compile_node(l__g[3], arg1, true))
            {
                return true;
            }
            var l__g1 = arg0;
            if (l__g1[0] == 102)
            {
                ds_list_add(arg1, gml_action_jump_unless(l_d, l_p0));
            }
            else
            {
                ds_list_add(arg1, gml_action_jump_if(l_d, l_p0));
            }
            var l_p2 = ds_list_size(arg1);
            for (var l_k = l_p0; l_k < l_p1; l_k++)
            {
                l__g1 = ds_list_find_value(arg1, l_k);
                switch (l__g1.__enumIndex__)
                {
                    case 105:
                        if (l__g1.h_lp == l_p0)
                        {
                            ds_list_set(arg1, l_k, gml_action_jump(l__g1.h_d, l_p1));
                        }
                        break;
                    case 104:
                        if (l__g1.h_lp == l_p0)
                        {
                            ds_list_set(arg1, l_k, gml_action_jump(l__g1.h_d, l_p2));
                        }
                        break;
                }
            }
            break;
        case UnknownEnum.Value_103:
            var l_d = l__g[1];
            var l_p0 = ds_list_size(arg1);
            var l_pc = global.gml_compile_curr_continue;
            var l_pb = global.gml_compile_curr_break;
            global.gml_compile_curr_continue = l_p0;
            global.gml_compile_curr_break = l_p0;
            if (gml_compile_node(l__g[2], arg1, false))
            {
                return true;
            }
            global.gml_compile_curr_continue = l_pc;
            global.gml_compile_curr_break = l_pb;
            var l_p1 = ds_list_size(arg1);
            if (gml_compile_node(l__g[3], arg1, true))
            {
                return true;
            }
            var l__g1 = arg0;
            if (l__g1[0] == 102)
            {
                ds_list_add(arg1, gml_action_jump_unless(l_d, l_p0));
            }
            else
            {
                ds_list_add(arg1, gml_action_jump_if(l_d, l_p0));
            }
            var l_p2 = ds_list_size(arg1);
            for (var l_k = l_p0; l_k < l_p1; l_k++)
            {
                l__g1 = ds_list_find_value(arg1, l_k);
                switch (l__g1.__enumIndex__)
                {
                    case 105:
                        if (l__g1.h_lp == l_p0)
                        {
                            ds_list_set(arg1, l_k, gml_action_jump(l__g1.h_d, l_p1));
                        }
                        break;
                    case 104:
                        if (l__g1.h_lp == l_p0)
                        {
                            ds_list_set(arg1, l_k, gml_action_jump(l__g1.h_d, l_p2));
                        }
                        break;
                }
            }
            break;
        case UnknownEnum.Value_105:
            var l_d = l__g[1];
            if (gml_compile_node(l__g[2], arg1, false))
            {
                return true;
            }
            var l_p0 = ds_list_size(arg1);
            if (gml_compile_node(l__g[3], arg1, true))
            {
                return true;
            }
            var l_p1 = ds_list_size(arg1);
            ds_list_add(arg1, gml_action_jump_unless(l_d, 0));
            var l_pc = global.gml_compile_curr_continue;
            var l_pb = global.gml_compile_curr_break;
            global.gml_compile_curr_continue = l_p0;
            global.gml_compile_curr_break = l_p0;
            if (gml_compile_node(l__g[5], arg1, false))
            {
                return true;
            }
            global.gml_compile_curr_continue = l_pc;
            global.gml_compile_curr_break = l_pb;
            var l_p2 = ds_list_size(arg1);
            l_pb = global.gml_compile_curr_break;
            global.gml_compile_curr_break = l_p0;
            if (gml_compile_node(l__g[4], arg1, false))
            {
                return true;
            }
            global.gml_compile_curr_break = l_pb;
            ds_list_add(arg1, gml_action_jump(l_d, l_p0));
            var l_p3 = ds_list_size(arg1);
            ds_list_set(arg1, l_p1, gml_action_jump_unless(l_d, l_p3));
            for (var l_k = l_p1; l_k < l_p3; l_k++)
            {
                var l__g1 = ds_list_find_value(arg1, l_k);
                switch (l__g1.__enumIndex__)
                {
                    case 105:
                        if (l__g1.h_lp == l_p0)
                        {
                            ds_list_set(arg1, l_k, gml_action_jump(l__g1.h_d, l_p2));
                        }
                        break;
                    case 104:
                        if (l__g1.h_lp == l_p0)
                        {
                            ds_list_set(arg1, l_k, gml_action_jump(l__g1.h_d, l_p3));
                        }
                        break;
                }
            }
            break;
        case UnknownEnum.Value_98:
            var l__cc = l__g[3];
            var l_d = l__g[1];
            var l_jt = ds_map_create();
            if (gml_compile_node(l__g[2], arg1, true))
            {
                return true;
            }
            var l_p0 = ds_list_size(arg1);
            var l_n = array_length(l__cc);
            var l_i;
            for (l_i = 0; l_i < l_n; l_i++)
            {
                var l__cv = l__cc[l_i].values;
                var l_z = array_length(l__cv);
                var l_k;
                for (l_k = 0; l_k < l_z; l_k++)
                {
                    if (gml_node_tools_to_case_value(l__cv[l_k]) == undefined)
                    {
                        break;
                    }
                }
                if (l_k < l_z)
                {
                    break;
                }
            }
            if (l_i < l_n)
            {
                var l_caseLabels = [];
                var l_pb = global.gml_compile_curr_break;
                global.gml_compile_curr_break = l_p0;
                for (l_i = 0; l_i < l_n; l_i++)
                {
                    var l__cv = l__cc[l_i].values;
                    var l_z = array_length(l__cv);
                    var l_cl1 = [];
                    for (var l_k = 0; l_k < l_z; l_k++)
                    {
                        if (gml_compile_node(l__cv[l_k], arg1, true))
                        {
                            return true;
                        }
                        array_set(l_cl1, l_k, ds_list_size(arg1));
                        ds_list_add(arg1, gml_action_switch_case(l_d, 0));
                    }
                    array_set(l_caseLabels, l_i, l_cl1);
                }
                ds_list_add(arg1, gml_action_discard(l_d));
                var l_defCasePos = ds_list_size(arg1);
                ds_list_add(arg1, gml_action_jump(l_d, 0));
                for (l_i = 0; l_i < l_n; l_i++)
                {
                    var l_cl1 = l_caseLabels[l_i];
                    var l_z = array_length(l_cl1);
                    for (var l_k = 0; l_k < l_z; l_k++)
                    {
                        ds_list_set(arg1, l_cl1[l_k], gml_action_switch_case(l_d, ds_list_size(arg1)));
                    }
                    if (gml_compile_node(l__cc[l_i].expr, arg1, false))
                    {
                        return true;
                    }
                }
                ds_list_set(arg1, l_defCasePos, gml_action_jump(l_d, ds_list_size(arg1)));
                var l_x = l__g[4];
                if (l_x != undefined)
                {
                    if (gml_compile_node(l_x, arg1, false))
                    {
                        return true;
                    }
                }
                global.gml_compile_curr_break = l_pb;
            }
            else
            {
                ds_list_add(arg1, gml_action_switch_hx(l_d, l_jt, 0));
                var l_pb = global.gml_compile_curr_break;
                global.gml_compile_curr_break = l_p0;
                l_n = array_length(l__cc);
                for (l_i = 0; l_i < l_n; l_i++)
                {
                    var l__cv = l__cc[l_i].values;
                    var l_z = array_length(l__cv);
                    for (var l_k = 0; l_k < l_z; l_k++)
                    {
                        ds_map_set(l_jt, gml_node_tools_to_case_value(l__cv[l_k]), ds_list_size(arg1));
                    }
                    if (gml_compile_node(l__cc[l_i].expr, arg1, false))
                    {
                        return true;
                    }
                }
                var l_p1 = ds_list_size(arg1);
                var l_x = l__g[4];
                if (l_x != undefined)
                {
                    if (gml_compile_node(l_x, arg1, false))
                    {
                        return true;
                    }
                }
                global.gml_compile_curr_break = l_pb;
                ds_list_set(arg1, l_p0, gml_action_switch_hx(l_d, l_jt, l_p1));
            }
            var l_p2 = ds_list_size(arg1);
            for (var l_k = l_p0; l_k < l_p2; l_k++)
            {
                var l__g1 = ds_list_find_value(arg1, l_k);
                if (l__g1.__enumIndex__ == 104)
                {
                    var l_d1 = l__g1.h_d;
                    if (l__g1.h_lp == l_p0)
                    {
                        ds_list_set(arg1, l_k, gml_action_jump(l_d1, l_p2));
                    }
                }
            }
            break;
        case UnknownEnum.Value_106:
            var l_d = l__g[1];
            if (gml_compile_node(l__g[2], arg1, true))
            {
                return true;
            }
            ds_list_add(arg1, gml_action_with_pre(l_d));
            var l_p0 = ds_list_size(arg1);
            ds_list_add(arg1, gml_action_with_next(l_d, 0));
            var l_pc = global.gml_compile_curr_continue;
            var l_pb = global.gml_compile_curr_break;
            global.gml_compile_curr_continue = l_p0;
            global.gml_compile_curr_break = l_p0;
            if (gml_compile_node(l__g[3], arg1, false))
            {
                return true;
            }
            global.gml_compile_curr_continue = l_pc;
            global.gml_compile_curr_break = l_pb;
            ds_list_add(arg1, gml_action_jump(l_d, l_p0));
            var l_p1 = ds_list_size(arg1);
            ds_list_add(arg1, gml_action_with_post(l_d));
            ds_list_set(arg1, l_p0, gml_action_with_next(l_d, l_p1));
            for (var l_k = l_p0; l_k < l_p1; l_k++)
            {
                var l__g1 = ds_list_find_value(arg1, l_k);
                switch (l__g1.__enumIndex__)
                {
                    case 105:
                        if (l__g1.h_lp == l_p0)
                        {
                            ds_list_set(arg1, l_k, gml_action_jump(l__g1.h_d, l_p0));
                        }
                        break;
                    case 104:
                        if (l__g1.h_lp == l_p0)
                        {
                            ds_list_set(arg1, l_k, gml_action_jump(l__g1.h_d, l_p1));
                        }
                        break;
                }
            }
            break;
        case UnknownEnum.Value_113:
            var l_d = l__g[1];
            var l_p0 = ds_list_size(arg1);
            ds_list_add(arg1, gml_action_try_hx(l_d, 0));
            if (gml_compile_node(l__g[2], arg1, false))
            {
                return true;
            }
            var l_p1 = ds_list_size(arg1);
            ds_list_add(arg1, gml_action_finally_hx(l_d, 0));
            ds_list_set(arg1, l_p0, gml_action_try_hx(l_d, ds_list_size(arg1)));
            ds_list_add(arg1, gml_action_catch_hx(l_d, variable_struct_get(global.gml_compile_curr_script.h_local_map, l__g[3])));
            if (gml_compile_node(l__g[4], arg1, false))
            {
                return true;
            }
            ds_list_set(arg1, l_p1, gml_action_finally_hx(l_d, ds_list_size(arg1)));
            break;
        case UnknownEnum.Value_114:
            if (gml_compile_node(l__g[2], arg1, true))
            {
                return true;
            }
            ds_list_add(arg1, gml_action_throw_hx(l__g[1]));
            break;
        case UnknownEnum.Value_110:
            var l_d = l__g[1];
            var l_i = global.gml_compile_curr_break;
            if (l_i >= 0)
            {
                ds_list_add(arg1, gml_action_break_hx(l_d, l_i));
            }
            else
            {
                return gml_compile_error("Cannot `break` here", l_d);
            }
            break;
        case UnknownEnum.Value_111:
            var l_d = l__g[1];
            var l_i = global.gml_compile_curr_continue;
            if (l_i >= 0)
            {
                ds_list_add(arg1, gml_action_continue_hx(l_d, l_i));
            }
            else
            {
                return gml_compile_error("Cannot `continue` here", l_d);
            }
            break;
        case UnknownEnum.Value_108:
            if (gml_compile_node(l__g[2], arg1, true))
            {
                return true;
            }
            ds_list_add(arg1, gml_action_return_hx(l__g[1]));
            break;
        case UnknownEnum.Value_109:
            var l_d = l__g[1];
            ds_list_add(arg1, gml_action_return_const(l_d, global.gml_compile_curr_program.h_get_source(l_d[0]).h_version.h_default_ret_value));
            break;
        case UnknownEnum.Value_99:
            if (gml_compile_node(l__g[2], arg1, true))
            {
                return true;
            }
            ds_list_add(arg1, gml_action_wait(l__g[1]));
            break;
        case UnknownEnum.Value_38:
            if (compile_gml_compile_delete_proc(arg1, l__g[1], l__g[2]))
            {
                return true;
            }
            break;
        case UnknownEnum.Value_100:
            ds_list_add(arg1, gml_action_fork(l__g[1], arg2));
            break;
        default:
            return gml_compile_error("Cannot compile " + gml_std_Type_enumConstructor(arg0), gml_std_haxe_enum_tools_getParameter(arg0, 0));
    }
    return false;
}

function gml_compile_add_exit(arg0)
{
    gml_compile_node([UnknownEnum.Value_109, global.gml_compile_curr_script.h_pos], arg0, false);
}

function gml_compile_script(arg0)
{
    var l_actions = ds_list_create();
    arg0.h_actions = l_actions;
    global.gml_compile_curr_script = arg0;
    global.gml_compile_curr_break = -1;
    global.gml_compile_curr_continue = -1;
    var l_trouble = compile_groups_gml_compile_group_static_proc_static_init(l_actions);
    if (!l_trouble)
    {
        l_trouble = gml_compile_node(arg0.h_node, l_actions, false);
    }
    if (!l_trouble)
    {
        gml_compile_add_exit(l_actions);
    }
    if (!l_trouble)
    {
        var l_i = 0;
        var l__g1 = ds_list_size(l_actions);
        while (l_i < l__g1)
        {
            var l_a = ds_list_find_value(l_actions, l_i);
            if (l_a.__enumIndex__ == 123)
            {
                l_a.__func__ = l_a.h_fn;
            }
            else
            {
                l_a.__func__ = global.vm_v2_gml_thread_v2_handlers[l_a.__enumIndex__];
            }
            l_i++;
        }
    }
    global.gml_compile_curr_script = undefined;
    return l_trouble;
}

function gml_compile_program(arg0)
{
    global.gml_compile_curr_program = arg0;
    var l_arr = arg0.h_script_array;
    var l_num = array_length(l_arr);
    var l_i;
    for (l_i = 0; l_i < l_num; l_i++)
    {
        if (gml_compile_script(l_arr[l_i]))
        {
            break;
        }
    }
    global.gml_compile_curr_program = undefined;
    return l_i < l_num;
}

function haxe_ds__vector_vector_impl__fill(arg0, arg1)
{
    var l_i = 0;
    var l__g1 = array_length(arg0);
    while (l_i < l__g1)
    {
        array_set(arg0, l_i, arg1);
        l_i++;
    }
}

function api_api_version(arg0) constructor
{
    static h_name = undefined;
    static h_has_string_escape_characters = undefined;
    static h_has_literal_strings = undefined;
    static h_has_template_strings = undefined;
    static h_has_js_template_strings = undefined;
    static h_has_struct_accessor = undefined;
    static h_has_func_literal = undefined;
    static h_has_constructor = undefined;
    static h_has_try_catch = undefined;
    static h_has_value_calls = undefined;
    static h_has_delete = undefined;
    static h_default_ret_value = undefined;
    static h_expr_macros = undefined;
    static h_int_self = undefined;
    static h_script_dot_static = undefined;
    static h_has_nameof = undefined;
    
    static h_to_string = function()
    {
        return "ApiVersion(\"" + self.h_name + "\")";
    };
    
    static __class__ = global.mt_api_api_version;
    
    self.h_has_nameof = false;
    self.h_script_dot_static = false;
    self.h_int_self = false;
    self.h_expr_macros = false;
    self.h_default_ret_value = undefined;
    self.h_has_delete = false;
    self.h_has_value_calls = false;
    self.h_has_try_catch = false;
    self.h_has_constructor = false;
    self.h_has_func_literal = false;
    self.h_has_struct_accessor = false;
    self.h_has_js_template_strings = false;
    self.h_has_template_strings = false;
    self.h_has_literal_strings = false;
    self.h_has_string_escape_characters = false;
    self.h_name = arg0;
}

function api_api_version_create(arg0)
{
    var l_v = new api_api_version("v" + string(floor(arg0 / 10)) + "." + string(arg0 % 10));
    var l_v2 = arg0 >= 20;
    var l_v23 = arg0 >= 23;
    var l_mod = false;
    l_v.h_int_self = !l_v23;
    l_v.h_has_string_escape_characters = l_v2;
    l_v.h_has_literal_strings = l_v2;
    l_v.h_has_template_strings = l_v23;
    l_v.h_has_js_template_strings = l_mod;
    l_v.h_has_func_literal = l_v23;
    l_v.h_has_struct_accessor = l_v23;
    l_v.h_has_constructor = l_v23;
    l_v.h_has_try_catch = l_v23 || l_mod;
    l_v.h_has_value_calls = l_v23;
    l_v.h_expr_macros = !l_v23;
    l_v.h_has_delete = l_v23;
    l_v.h_has_nameof = l_v23;
    l_v.h_script_dot_static = l_v23 && global.compile_groups_gml_compile_group_static_has_statics;
    l_v.h_default_ret_value = l_v23 ? undefined : 0;
    return l_v;
}

function gml_parser(arg0) constructor
{
    static h_tokens = undefined;
    static h_token_count = undefined;
    static h_macros = undefined;
    static h_curr_macro = undefined;
    static h_curr_template = undefined;
    static h_source = undefined;
    static h_pos_source = undefined;
    static h_pos = undefined;
    static h_row_start = undefined;
    static h_row = undefined;
    static h_len = undefined;
    
    static h_add = function(arg0)
    {
        if (self.h_curr_macro != undefined)
        {
            array_push(self.h_curr_macro.h_tokens, arg0);
        }
        else
        {
            ds_list_add(global.gml_parser_token_acc, arg0);
        }
    };
    
    static h_set_source = function(arg0)
    {
        var l_code = arg0.h_code;
        var l_sb = global.gml_parser_str_buf;
        buffer_seek(l_sb, buffer_seek_start, 0);
        buffer_write(l_sb, buffer_string, l_code);
        self.h_len = buffer_tell(l_sb) - 1;
        if (buffer_get_size(global.gml_parser_fast_buf) < self.h_len)
        {
            buffer_resize(global.gml_parser_fast_buf, self.h_len);
        }
        buffer_copy(l_sb, 0, self.h_len, global.gml_parser_fast_buf, 0);
        ds_list_clear(global.gml_parser_token_acc);
    };
    
    static h_to_string = function()
    {
        return "GmlParser(src:\"" + self.h_source.h_name + "\")";
    };
    
    static h_error = function(arg0, arg1 = gml_pos_create(self.h_pos_source, self.h_row, self.h_pos - self.h_row_start, self.h_pos))
    {
        global.gml_parser_error_text = gml_pos_to_string_in(arg1, self.h_source) + ": " + arg0;
        global.gml_parser_error_pos = arg1;
        ds_list_clear(global.gml_parser_token_acc);
        return undefined;
    };
    
    static h_finish = function()
    {
        self.h_curr_macro = undefined;
        if (self.h_source.h___eof == undefined)
        {
            self.h_source.h___eof = gml_pos_create(self.h_pos_source, self.h_row, self.h_pos - self.h_row_start, self.h_pos);
        }
        var l_tkList = global.gml_parser_token_acc;
        var l_tkCount = ds_list_size(l_tkList);
        var l_tkArr = array_create(l_tkCount);
        var l_i = 0;
        for (var l__ = 0; l__ < l_tkCount; l__++)
        {
            array_set(l_tkArr, l_i, ds_list_find_value(l_tkList, l_i));
            l_i++;
        }
        ds_list_clear(l_tkList);
        self.h_tokens = l_tkArr;
        self.h_token_count = l_tkCount;
        return l_tkArr;
    };
    
    static h_skip_till_line_end = function()
    {
        while (self.h_pos < self.h_len)
        {
            var l_c = buffer_peek(global.gml_parser_fast_buf, self.h_pos, buffer_u8);
            if (l_c == 13 || l_c == 10)
            {
                break;
            }
            self.h_pos += 1;
        }
    };
    
    static h_skip_line_spaces = function()
    {
        while (self.h_pos < self.h_len)
        {
            var l_c = buffer_peek(global.gml_parser_fast_buf, self.h_pos, buffer_u8);
            if (l_c == 13 || l_c == 10)
            {
                break;
            }
            if (!(global.gml_parser_char_is_space[l_c] || (l_c == 194 && buffer_peek(global.gml_parser_fast_buf, self.h_pos + 1, buffer_u8) == 160)))
            {
                break;
            }
            self.h_pos += 1;
        }
    };
    
    static h_proc_macro = function(arg0)
    {
        switch (arg0)
        {
            case 92:
                var l_z = true;
                while (self.h_pos < self.h_len && l_z)
                {
                    arg0 = buffer_peek(global.gml_parser_fast_buf, self.h_pos++, buffer_u8);
                    switch (arg0)
                    {
                        case 47:
                            if (buffer_peek(global.gml_parser_fast_buf, self.h_pos, buffer_u8) == 47)
                            {
                                self.h_skip_till_line_end();
                            }
                            else if (buffer_peek(global.gml_parser_fast_buf, self.h_pos, buffer_u8) == 42)
                            {
                                return self.h_error("Should not be having block comments after a \\ in a macro");
                            }
                            else
                            {
                                return self.h_error("Unexpected character `" + chr(arg0) + "` after a \\ in a macro");
                            }
                            break;
                        case 9:
                        case 32:
                            continue;
                        case 13:
                            if (buffer_peek(global.gml_parser_fast_buf, self.h_pos, buffer_u8) == 10)
                            {
                                self.h_pos += 1;
                            }
                            break;
                        case 10:
                            break;
                        default:
                            return self.h_error("Unexpected character `" + chr(arg0) + "` after a \\ in a macro");
                    }
                    break;
                }
                return -1;
            case 47:
                if (buffer_peek(global.gml_parser_fast_buf, self.h_pos, buffer_u8) == 47)
                {
                    l_z = false;
                    while (self.h_pos < self.h_len)
                    {
                        arg0 = buffer_peek(global.gml_parser_fast_buf, self.h_pos, buffer_u8);
                        if (arg0 == 13 || arg0 == 10)
                        {
                            break;
                        }
                        if (arg0 == 92)
                        {
                            l_z = true;
                        }
                        self.h_pos += 1;
                    }
                    if (l_z)
                    {
                        if (buffer_peek(global.gml_parser_fast_buf, self.h_pos, buffer_u8) == 13)
                        {
                            self.h_pos += 1;
                        }
                        if (buffer_peek(global.gml_parser_fast_buf, self.h_pos, buffer_u8) == 10)
                        {
                            self.h_pos += 1;
                        }
                    }
                }
                else if (buffer_peek(global.gml_parser_fast_buf, self.h_pos, buffer_u8) == 42)
                {
                    l_z = false;
                    while (self.h_pos < self.h_len)
                    {
                        arg0 = buffer_peek(global.gml_parser_fast_buf, self.h_pos, buffer_u8);
                        if (arg0 == 92)
                        {
                            l_z = true;
                            continue;
                        }
                        if (arg0 == 13 || arg0 == 10)
                        {
                            self.h_pos += 1;
                            if (arg0 == 13 && buffer_peek(global.gml_parser_fast_buf, self.h_pos, buffer_u8) == 10)
                            {
                                self.h_pos += 1;
                            }
                            if (!l_z)
                            {
                                return self.h_error("Multi-line comments inside macros must use \\ before line end");
                            }
                            l_z = false;
                        }
                        self.h_pos += 1;
                    }
                }
                break;
            case 10:
            case 13:
                self.h_curr_macro = undefined;
                return -1;
        }
        return arg0;
    };
    
    static h_proc_hexadecimal = function(arg0, arg1)
    {
        var l_start = self.h_pos;
        var l_val = 0;
        var l_found = 0;
        while (self.h_pos < self.h_len)
        {
            var l_c = buffer_peek(global.gml_parser_fast_buf, self.h_pos, buffer_u8);
            if (l_c == 95)
            {
                self.h_pos += 1;
                continue;
            }
            else if (l_c >= 48 && l_c <= 57)
            {
                l_val = (l_val << 4) | (l_c - 48);
            }
            else if (l_c >= 97 && l_c <= 102)
            {
                l_val = (l_val << 4) | (l_c - 87);
            }
            else if (l_c >= 65 && l_c <= 70)
            {
                l_val = (l_val << 4) | (l_c - 55);
            }
            else
            {
                break;
            }
            self.h_pos += 1;
            l_found++;
        }
        if (l_found == 0)
        {
            return self.h_error("Empty hex literal", arg0);
        }
        if (l_found > 8)
        {
            return self.h_error("Too many digits in a hex literal (max: 8)", arg0);
        }
        self.h_add([UnknownEnum.Value_15, arg0, l_val, gml_parser_buf_sub(global.gml_parser_fast_buf, global.gml_parser_buf_sub_buf, l_start, self.h_pos)]);
        return true;
    };
    
    static h_proc_binary = function(arg0)
    {
        var l_start = self.h_pos - 2;
        var l_i = 0;
        while (self.h_pos < self.h_len)
        {
            var l_c = buffer_peek(global.gml_parser_fast_buf, self.h_pos, buffer_u8);
            if (l_c == 95)
            {
                self.h_pos += 1;
                continue;
            }
            else if (l_c == 48 || l_c == 49)
            {
                l_i = (l_i << 1) | ((l_c - 48) | 0);
            }
            else
            {
                break;
            }
            self.h_pos += 1;
        }
        self.h_add([UnknownEnum.Value_15, arg0, l_i, gml_parser_buf_sub(global.gml_parser_fast_buf, global.gml_parser_buf_sub_buf, l_start, self.h_pos)]);
        return true;
    };
    
    static h_read_ident = function()
    {
        if (self.h_pos >= self.h_len)
        {
            return undefined;
        }
        var l_start = self.h_pos;
        var l_c = buffer_peek(global.gml_parser_fast_buf, self.h_pos, buffer_u8);
        if (!(l_c == 95 || (l_c >= 97 && l_c <= 122) || (l_c >= 65 && l_c <= 90)))
        {
            return undefined;
        }
        self.h_pos += 1;
        while (self.h_pos < self.h_len)
        {
            l_c = buffer_peek(global.gml_parser_fast_buf, self.h_pos, buffer_u8);
            if (l_c == 95 || (l_c >= 97 && l_c <= 122) || (l_c >= 65 && l_c <= 90) || (l_c >= 48 && l_c <= 57))
            {
                self.h_pos += 1;
            }
            else
            {
                break;
            }
        }
        return gml_parser_buf_sub(global.gml_parser_fast_buf, global.gml_parser_buf_sub_buf, l_start, self.h_pos);
    };
    
    static h_read_literal_string = function(arg0, arg1)
    {
        var l_start = self.h_pos;
        var l_closed = false;
        while (self.h_pos < self.h_len)
        {
            var l_c = buffer_peek(global.gml_parser_fast_buf, self.h_pos++, buffer_u8);
            if (l_c == arg0)
            {
                l_closed = true;
                break;
            }
            if (l_c == 10)
            {
                self.h_row += 1;
                self.h_row_start = self.h_pos;
                continue;
            }
            if (l_c >= 192)
            {
                if (l_c >= 224)
                {
                    if (l_c >= 240)
                    {
                        self.h_row_start += 3;
                    }
                    else
                    {
                        self.h_row_start += 2;
                    }
                }
                else
                {
                    self.h_row_start += 1;
                }
            }
        }
        if (l_closed)
        {
            return gml_parser_buf_sub(global.gml_parser_fast_buf, global.gml_parser_buf_sub_buf, l_start, self.h_pos - 1);
        }
        else
        {
            return self.h_error("Unclosed string", arg1);
        }
    };
    
    static h_add_op = function(arg0, arg1)
    {
        if (buffer_peek(global.gml_parser_fast_buf, self.h_pos, buffer_u8) == 61)
        {
            self.h_pos += 1;
            self.h_add([UnknownEnum.Value_20, arg0, arg1]);
        }
        else
        {
            self.h_add([UnknownEnum.Value_19, arg0, arg1]);
        }
    };
    
    static h_proc_string_escape_char = function(arg0)
    {
        var l_c = buffer_peek(global.gml_parser_fast_buf, self.h_pos++, buffer_u8);
        switch (l_c)
        {
            case 97:
                buffer_write(arg0, buffer_u8, 7);
                break;
            case 98:
                buffer_write(arg0, buffer_u8, 8);
                break;
            case 116:
                buffer_write(arg0, buffer_u8, 9);
                break;
            case 110:
                buffer_write(arg0, buffer_u8, 10);
                break;
            case 118:
                buffer_write(arg0, buffer_u8, 11);
                break;
            case 102:
                buffer_write(arg0, buffer_u8, 12);
                break;
            case 114:
                buffer_write(arg0, buffer_u8, 13);
                break;
            case 13:
                if (buffer_peek(global.gml_parser_fast_buf, self.h_pos, buffer_u8) == 10)
                {
                    self.h_pos += 1;
                }
                break;
            case 10:
                break;
            case 117:
            case 120:
                var l_isu = l_c == 117;
                var l_val = 0;
                var l_found = 0;
                while (self.h_pos < self.h_len)
                {
                    l_c = buffer_peek(global.gml_parser_fast_buf, self.h_pos, buffer_u8);
                    if (l_c >= 48 && l_c <= 57)
                    {
                        l_c -= 48;
                    }
                    else if (l_c >= 97 && l_c <= 102)
                    {
                        l_c -= 87;
                    }
                    else if (l_c >= 65 && l_c <= 70)
                    {
                        l_c -= 55;
                    }
                    else
                    {
                        l_c = -1;
                    }
                    if (l_c < 0)
                    {
                        break;
                    }
                    l_val = (l_val << 4) | l_c;
                    self.h_pos += 1;
                    if (l_isu)
                    {
                        if (++l_found >= 6)
                        {
                            break;
                        }
                    }
                    else if (++l_found >= 2)
                    {
                        break;
                    }
                }
                if (!l_isu && l_found != 2)
                {
                    return self.h_error("Expected 2 hex characters in \\x");
                }
                _gml_parser_gml_parser_string_buf_impl__add_code_point(arg0, l_val);
                break;
            default:
                if (l_c >= 48 && l_c <= 55)
                {
                    var l_val = 0;
                    var l_found = 0;
                    while (self.h_pos < self.h_len)
                    {
                        l_c = buffer_peek(global.gml_parser_fast_buf, self.h_pos, buffer_u8);
                        if (l_c >= 48 && l_c <= 55)
                        {
                            l_val = (l_val << 3) | (l_c - 48);
                        }
                        else
                        {
                            break;
                        }
                        self.h_pos += 1;
                        if (++l_found >= 3)
                        {
                            break;
                        }
                    }
                    if (l_val > 255)
                    {
                        return self.h_error("Can't do \\oct for codes over 255");
                    }
                    _gml_parser_gml_parser_string_buf_impl__add_code_point(arg0, l_val);
                    break;
                }
                buffer_write(arg0, buffer_u8, l_c);
        }
        return true;
    };
    
    static h_read_esc_string = function(arg0)
    {
        var l_sb = _gml_parser_gml_parser_string_buf_impl__start();
        var l_pure = true;
        var l_start = self.h_pos;
        var l_closed = false;
        while (self.h_pos < self.h_len)
        {
            var l_c = buffer_peek(global.gml_parser_fast_buf, self.h_pos++, buffer_u8);
            if (l_c >= 192)
            {
                if (l_c >= 224)
                {
                    if (l_c >= 240)
                    {
                        self.h_row_start += 3;
                    }
                    else
                    {
                        self.h_row_start += 2;
                    }
                }
                else
                {
                    self.h_row_start += 1;
                }
            }
            switch (l_c)
            {
                case 34:
                    if (!l_pure)
                    {
                        var l_till = self.h_pos - 1;
                        if (l_till > l_start)
                        {
                            buffer_write(l_sb, buffer_text, gml_parser_buf_sub(global.gml_parser_fast_buf, global.gml_parser_buf_sub_buf, l_start, l_till));
                        }
                    }
                    l_closed = true;
                    break;
                case 92:
                    l_pure = false;
                    var l_till1 = self.h_pos - 1;
                    if (l_till1 > l_start)
                    {
                        buffer_write(l_sb, buffer_text, gml_parser_buf_sub(global.gml_parser_fast_buf, global.gml_parser_buf_sub_buf, l_start, l_till1));
                    }
                    if (self.h_proc_string_escape_char(l_sb) == undefined)
                    {
                        return undefined;
                    }
                    l_start = self.h_pos;
                    continue;
                case 10:
                case 13:
                    return self.h_error("Unclosed string - unescaped newline mid-string", arg0);
                default:
                    continue;
            }
            break;
        }
        if (!l_closed)
        {
            return self.h_error("Unclosed string", arg0);
        }
        if (l_pure)
        {
            return gml_parser_buf_sub(global.gml_parser_fast_buf, global.gml_parser_buf_sub_buf, l_start, self.h_pos - 1);
        }
        return _gml_parser_gml_parser_string_buf_impl__to_string(l_sb);
    };
    
    static h_proc_define = function(arg0)
    {
        self.h_skip_line_spaces();
        var l_name = self.h_read_ident();
        if (l_name == undefined)
        {
            return self.h_error("Expected a script name");
        }
        self.h_add([UnknownEnum.Value_0, arg0, l_name, false]);
        return true;
    };
    
    static h_proc_macro_def = function(arg0)
    {
        var l__gthis = self;
        if (global.gml_parser_curr_version.h_expr_macros)
        {
            self.h_add([UnknownEnum.Value_2, arg0]);
        }
        else
        {
            var l_config = undefined;
            l__gthis.h_skip_line_spaces();
            var l_name = l__gthis.h_read_ident();
            var l_tmp;
            if (l_name == undefined)
            {
                l_tmp = true;
            }
            else
            {
                l__gthis.h_skip_line_spaces();
                if (buffer_peek(global.gml_parser_fast_buf, l__gthis.h_pos, buffer_u8) == 58)
                {
                    l__gthis.h_pos += 1;
                    l_config = l_name;
                    l__gthis.h_skip_line_spaces();
                    l_name = l__gthis.h_read_ident();
                    if (l_name == undefined)
                    {
                        l_name = l_config;
                        l_config = undefined;
                    }
                }
                l_tmp = false;
            }
            if (l_tmp)
            {
                return undefined;
            }
            self.h_curr_macro = new gml_parser_macro(l_name, l_config, arg0);
            array_push(self.h_macros, self.h_curr_macro);
        }
        return true;
    };
    
    static h_proc_template_segment = function(arg0)
    {
        var l_sb = _gml_parser_gml_parser_string_buf_impl__start();
        var l_tpl = self.h_curr_template;
        var l_stop = l_tpl.h_stop;
        var l_start = self.h_pos;
        var l_isJS = l_tpl.h_is_js;
        while (self.h_pos < self.h_len)
        {
            var l_c = buffer_peek(global.gml_parser_fast_buf, self.h_pos++, buffer_u8);
            if (l_c == l_stop)
            {
                var l_till = self.h_pos - 1;
                if (l_till > l_start)
                {
                    buffer_write(l_sb, buffer_text, gml_parser_buf_sub(global.gml_parser_fast_buf, global.gml_parser_buf_sub_buf, l_start, l_till));
                }
                l_tpl.h_str += _gml_parser_gml_parser_string_buf_impl__to_string(l_sb);
                self.h_add([UnknownEnum.Value_22, gml_pos_create(self.h_pos_source, self.h_row, self.h_pos - self.h_row_start, self.h_pos)]);
                ds_list_set(global.gml_parser_token_acc, l_tpl.h_tk_index, [UnknownEnum.Value_16, l_tpl.h_pos, l_tpl.h_str]);
                self.h_curr_template = l_tpl.h_next;
                return true;
            }
            if (l_isJS ? (l_c == 36 && buffer_peek(global.gml_parser_fast_buf, self.h_pos, buffer_u8) == 123) : (l_c == 123))
            {
                var l_till1 = self.h_pos - 1;
                if (l_till1 > l_start)
                {
                    buffer_write(l_sb, buffer_text, gml_parser_buf_sub(global.gml_parser_fast_buf, global.gml_parser_buf_sub_buf, l_start, l_till1));
                }
                if (l_isJS)
                {
                    self.h_pos += 1;
                }
                self.h_add([UnknownEnum.Value_5, l_tpl.h_pos]);
                buffer_write(l_sb, buffer_text, "{" + string(l_tpl.h_arg_count++) + "}");
                l_tpl.h_str += _gml_parser_gml_parser_string_buf_impl__to_string(l_sb);
                var l_till2 = self.h_pos - 1;
                if (l_till2 > l_start)
                {
                    buffer_write(l_sb, buffer_text, gml_parser_buf_sub(global.gml_parser_fast_buf, global.gml_parser_buf_sub_buf, l_start, l_till2));
                }
                return true;
            }
            if (l_c == 92)
            {
                var l_till3 = self.h_pos - 1;
                if (l_till3 > l_start)
                {
                    buffer_write(l_sb, buffer_text, gml_parser_buf_sub(global.gml_parser_fast_buf, global.gml_parser_buf_sub_buf, l_start, l_till3));
                }
                self.h_proc_string_escape_char(l_sb);
                l_start = self.h_pos;
            }
        }
        return true;
    };
    
    static h_proc_number = function(arg0)
    {
        var l_start = self.h_pos;
        var l_z = false;
        var l_s = undefined;
        while (self.h_pos < self.h_len)
        {
            var l_c = buffer_peek(global.gml_parser_fast_buf, self.h_pos, buffer_u8);
            if (l_c == 46)
            {
                if (l_z)
                {
                    return self.h_error("Extra dot in a number");
                }
                else
                {
                    self.h_pos += 1;
                    l_c = buffer_peek(global.gml_parser_fast_buf, self.h_pos, buffer_u8);
                    if (l_c == 95 || (l_c >= 97 && l_c <= 122) || (l_c >= 65 && l_c <= 90))
                    {
                        l_s = gml_parser_buf_sub(global.gml_parser_fast_buf, global.gml_parser_buf_sub_buf, l_start, self.h_pos - 1);
                        self.h_add([UnknownEnum.Value_15, arg0, gml_std_Std_parseFloat(l_s), l_s]);
                        arg0 = gml_pos_create(self.h_pos_source, self.h_row, self.h_pos - self.h_row_start, self.h_pos);
                        self.h_add([UnknownEnum.Value_6, arg0]);
                        break;
                    }
                    l_z = true;
                }
            }
            else if ((l_c >= 48 && l_c <= 57) || l_c == 95)
            {
                self.h_pos += 1;
            }
            else
            {
                break;
            }
        }
        if (l_s == undefined)
        {
            while (buffer_peek(global.gml_parser_fast_buf, l_start, buffer_u8) == 48)
            {
                l_start++;
                if (l_start >= self.h_pos)
                {
                    l_start--;
                    break;
                }
                else if (buffer_peek(global.gml_parser_fast_buf, l_start, buffer_u8) == 46)
                {
                    l_start--;
                    break;
                }
            }
            l_s = gml_parser_buf_sub(global.gml_parser_fast_buf, global.gml_parser_buf_sub_buf, l_start, self.h_pos);
            l_s = string_replace_all(l_s, "_", "");
            var l_f = gml_std_Std_parseFloat(l_s);
            if (!l_z)
            {
                if (string_format(l_f, 0, 0) != l_s)
                {
                    var l_i64 = int64(l_s);
                    if (string(l_i64) == l_s)
                    {
                        l_f = l_i64;
                    }
                }
            }
            self.h_add([UnknownEnum.Value_15, arg0, l_f, l_s]);
        }
        return true;
    };
    
    static h_run = function(arg0 = -1)
    {
        var l__gthis = self;
        var l_ver = self.h_source.h_version;
        if (l_ver == undefined)
        {
            l_ver = global.gml_parser_default_version;
            self.h_source.h_version = l_ver;
        }
        global.gml_parser_curr_version = l_ver;
        self.h_set_source(self.h_source);
        var l_checkLineBreakForHeader = false;
        while (self.h_pos < self.h_len)
        {
            var l_c = buffer_peek(global.gml_parser_fast_buf, self.h_pos++, buffer_u8);
            if (self.h_curr_macro != undefined)
            {
                l_c = self.h_proc_macro(l_c);
                if (l_c < 0)
                {
                    continue;
                }
            }
            var l_tmp;
            if (l_c == 10)
            {
                self.h_row += 1;
                self.h_row_start = self.h_pos;
                l_tmp = true;
            }
            else
            {
                l_tmp = false;
            }
            if (l_tmp)
            {
                if (l_checkLineBreakForHeader)
                {
                    l_checkLineBreakForHeader = false;
                    var l_i = ds_list_size(global.gml_parser_token_acc) - 1;
                    var l__g = ds_list_find_value(global.gml_parser_token_acc, l_i);
                    if (l__g[0] == 0)
                    {
                        if (l__g[3] == false)
                        {
                            ds_list_set(global.gml_parser_token_acc, l_i, [UnknownEnum.Value_0, l__g[1], l__g[2], true]);
                        }
                    }
                }
                continue;
            }
            if (global.gml_parser_char_is_space[l_c] || (l_c == 194 && buffer_peek(global.gml_parser_fast_buf, self.h_pos, buffer_u8) == 160))
            {
                continue;
            }
            var l_start = self.h_pos - 1;
            var l_d = gml_pos_create(self.h_pos_source, self.h_row, self.h_pos - self.h_row_start, l_start);
            switch (l_c)
            {
                case 59:
                    self.h_add([UnknownEnum.Value_4, l_d]);
                    break;
                case 44:
                    self.h_add([UnknownEnum.Value_5, l_d]);
                    break;
                case 46:
                    l_c = buffer_peek(global.gml_parser_fast_buf, self.h_pos, buffer_u8);
                    if (l_c >= 48 && l_c <= 57)
                    {
                        do
                        {
                            self.h_pos += 1;
                            l_c = buffer_peek(global.gml_parser_fast_buf, self.h_pos, buffer_u8);
                        }
                        until (!(l_c >= 48 && l_c <= 57));
                        var l_s = gml_parser_buf_sub(global.gml_parser_fast_buf, global.gml_parser_buf_sub_buf, l_start, self.h_pos);
                        self.h_add([UnknownEnum.Value_15, l_d, gml_std_Std_parseFloat(l_s), l_s]);
                    }
                    else
                    {
                        self.h_add([UnknownEnum.Value_6, l_d]);
                    }
                    break;
                case 58:
                    if (buffer_peek(global.gml_parser_fast_buf, self.h_pos, buffer_u8) == 61)
                    {
                        self.h_pos += 1;
                        self.h_add([UnknownEnum.Value_20, l_d, -1]);
                    }
                    else
                    {
                        self.h_add([UnknownEnum.Value_7, l_d]);
                    }
                    break;
                case 47:
                    switch (buffer_peek(global.gml_parser_fast_buf, self.h_pos, buffer_u8))
                    {
                        case 47:
                            self.h_pos += 1;
                            l_start = self.h_pos;
                            self.h_skip_till_line_end();
                            break;
                        case 42:
                            self.h_pos += 1;
                            while (self.h_pos < self.h_len)
                            {
                                l_c = buffer_peek(global.gml_parser_fast_buf, self.h_pos++, buffer_u8);
                                if (l_c >= 192)
                                {
                                    if (l_c >= 224)
                                    {
                                        if (l_c >= 240)
                                        {
                                            self.h_row_start += 3;
                                        }
                                        else
                                        {
                                            self.h_row_start += 2;
                                        }
                                    }
                                    else
                                    {
                                        self.h_row_start += 1;
                                    }
                                }
                                if (l_c == 10)
                                {
                                    self.h_row += 1;
                                    self.h_row_start = self.h_pos;
                                }
                                if ((self.h_pos + 1) < self.h_len)
                                {
                                    if (l_c == 42 && buffer_peek(global.gml_parser_fast_buf, self.h_pos, buffer_u8) == 47)
                                    {
                                        self.h_pos += 1;
                                        break;
                                    }
                                }
                            }
                            break;
                        case 61:
                            self.h_pos += 1;
                            self.h_add([UnknownEnum.Value_20, l_d, 1]);
                            break;
                        default:
                            self.h_add([UnknownEnum.Value_19, l_d, 1]);
                    }
                    break;
                case 63:
                    if (buffer_peek(global.gml_parser_fast_buf, self.h_pos, buffer_u8) == 63)
                    {
                        self.h_pos += 1;
                        if (buffer_peek(global.gml_parser_fast_buf, self.h_pos, buffer_u8) == 61)
                        {
                            self.h_pos += 1;
                            self.h_add([UnknownEnum.Value_29, l_d]);
                        }
                        else
                        {
                            self.h_add([UnknownEnum.Value_28, l_d]);
                        }
                    }
                    else
                    {
                        self.h_add([UnknownEnum.Value_8, l_d]);
                    }
                    break;
                case 61:
                    if (buffer_peek(global.gml_parser_fast_buf, self.h_pos, buffer_u8) == 61)
                    {
                        self.h_pos += 1;
                        self.h_add([UnknownEnum.Value_19, l_d, 64]);
                    }
                    else
                    {
                        self.h_add([UnknownEnum.Value_20, l_d, -1]);
                    }
                    break;
                case 43:
                    switch (buffer_peek(global.gml_parser_fast_buf, self.h_pos, buffer_u8))
                    {
                        case 61:
                            self.h_pos += 1;
                            self.h_add([UnknownEnum.Value_20, l_d, 16]);
                            break;
                        case 43:
                            self.h_pos += 1;
                            self.h_add([UnknownEnum.Value_18, l_d, true]);
                            break;
                        default:
                            self.h_add([UnknownEnum.Value_19, l_d, 16]);
                    }
                    break;
                case 45:
                    switch (buffer_peek(global.gml_parser_fast_buf, self.h_pos, buffer_u8))
                    {
                        case 61:
                            self.h_pos += 1;
                            self.h_add([UnknownEnum.Value_20, l_d, 17]);
                            break;
                        case 45:
                            self.h_pos += 1;
                            self.h_add([UnknownEnum.Value_18, l_d, false]);
                            break;
                        default:
                            self.h_add([UnknownEnum.Value_19, l_d, 17]);
                    }
                    break;
                case 42:
                    self.h_add_op(l_d, 0);
                    break;
                case 37:
                    self.h_add_op(l_d, 2);
                    break;
                case 38:
                    if (buffer_peek(global.gml_parser_fast_buf, self.h_pos, buffer_u8) == 38)
                    {
                        self.h_pos += 1;
                        self.h_add_op(l_d, 80);
                    }
                    else
                    {
                        self.h_add_op(l_d, 49);
                    }
                    break;
                case 124:
                    if (buffer_peek(global.gml_parser_fast_buf, self.h_pos, buffer_u8) == 124)
                    {
                        self.h_pos += 1;
                        self.h_add_op(l_d, 96);
                    }
                    else
                    {
                        self.h_add_op(l_d, 48);
                    }
                    break;
                case 94:
                    if (buffer_peek(global.gml_parser_fast_buf, self.h_pos, buffer_u8) == 94)
                    {
                        self.h_pos += 1;
                        self.h_add_op(l_d, 65);
                    }
                    else
                    {
                        self.h_add_op(l_d, 50);
                    }
                    break;
                case 62:
                    switch (buffer_peek(global.gml_parser_fast_buf, self.h_pos, buffer_u8))
                    {
                        case 61:
                            self.h_pos += 1;
                            self.h_add([UnknownEnum.Value_19, l_d, 69]);
                            break;
                        case 62:
                            self.h_pos += 1;
                            self.h_add_op(l_d, 33);
                            break;
                        default:
                            self.h_add([UnknownEnum.Value_19, l_d, 68]);
                    }
                    break;
                case 60:
                    switch (buffer_peek(global.gml_parser_fast_buf, self.h_pos, buffer_u8))
                    {
                        case 61:
                            self.h_pos += 1;
                            self.h_add([UnknownEnum.Value_19, l_d, 67]);
                            break;
                        case 60:
                            self.h_pos += 1;
                            self.h_add_op(l_d, 32);
                            break;
                        case 62:
                            self.h_pos += 1;
                            self.h_add_op(l_d, 65);
                            break;
                        default:
                            self.h_add([UnknownEnum.Value_19, l_d, 66]);
                    }
                    break;
                case 33:
                    if (buffer_peek(global.gml_parser_fast_buf, self.h_pos, buffer_u8) == 61)
                    {
                        self.h_pos += 1;
                        self.h_add_op(l_d, 65);
                    }
                    else
                    {
                        self.h_add([UnknownEnum.Value_17, l_d, 1]);
                    }
                    break;
                case 126:
                    self.h_add([UnknownEnum.Value_17, l_d, 2]);
                    break;
                case 40:
                    self.h_add([UnknownEnum.Value_21, l_d]);
                    break;
                case 41:
                    self.h_add([UnknownEnum.Value_22, l_d]);
                    break;
                case 91:
                    l_c = buffer_peek(global.gml_parser_fast_buf, self.h_pos, buffer_u8);
                    switch (l_c)
                    {
                        case 35:
                        case 63:
                        case 64:
                        case 124:
                            self.h_pos += 1;
                            self.h_add([UnknownEnum.Value_23, l_d, l_c]);
                            break;
                        case 36:
                            if (l_ver.h_has_struct_accessor)
                            {
                                self.h_pos += 1;
                                var l_c1 = buffer_peek(global.gml_parser_fast_buf, self.h_pos, buffer_u8);
                                if (l_c1 == 95 || (l_c1 >= 97 && l_c1 <= 122) || (l_c1 >= 65 && l_c1 <= 90) || (l_c1 >= 48 && l_c1 <= 57))
                                {
                                    return self.h_error("Ambiguity: use either `[$ key` or `[ $hex`", l_d);
                                }
                                self.h_add([UnknownEnum.Value_23, l_d, 36]);
                            }
                            else
                            {
                                self.h_add([UnknownEnum.Value_23, l_d, 0]);
                            }
                            break;
                        default:
                            self.h_add([UnknownEnum.Value_23, l_d, 0]);
                    }
                    break;
                case 93:
                    self.h_add([UnknownEnum.Value_24, l_d]);
                    break;
                case 123:
                    if (self.h_curr_template != undefined)
                    {
                        self.h_curr_template.h_curly_depth++;
                    }
                    self.h_add([UnknownEnum.Value_25, l_d]);
                    break;
                case 125:
                    var l_z = true;
                    if (self.h_curr_template != undefined)
                    {
                        if (self.h_curr_template.h_curly_depth > 0)
                        {
                            self.h_curr_template.h_curly_depth--;
                        }
                        else
                        {
                            l_z = false;
                            if (self.h_proc_template_segment(l_d) == undefined)
                            {
                                return undefined;
                            }
                        }
                    }
                    if (l_z)
                    {
                        self.h_add([UnknownEnum.Value_26, l_d]);
                    }
                    break;
                case 64:
                    if (l_ver.h_has_literal_strings)
                    {
                        l_c = buffer_peek(global.gml_parser_fast_buf, self.h_pos, buffer_u8);
                        if (l_c == 34 || l_c == 39)
                        {
                            self.h_pos += 1;
                            var l_s = self.h_read_literal_string(l_c, l_d);
                            if (l_s == undefined)
                            {
                                return undefined;
                            }
                            self.h_add([UnknownEnum.Value_16, l_d, l_s]);
                        }
                        else
                        {
                            self.h_add([UnknownEnum.Value_9, l_d]);
                        }
                    }
                    else
                    {
                        self.h_add([UnknownEnum.Value_9, l_d]);
                    }
                    break;
                case 34:
                    var l_s;
                    if (l_ver.h_has_string_escape_characters)
                    {
                        l_s = self.h_read_esc_string(l_d);
                    }
                    else
                    {
                        l_s = self.h_read_literal_string(34, l_d);
                    }
                    if (l_s == undefined)
                    {
                        return undefined;
                    }
                    self.h_add([UnknownEnum.Value_16, l_d, l_s]);
                    break;
                case 39:
                    if (l_ver.h_has_string_escape_characters)
                    {
                        return self.h_error("Single quotes are not allowed for strings", l_d);
                    }
                    else
                    {
                        var l_s = self.h_read_literal_string(39, l_d);
                        if (l_s == undefined)
                        {
                            return undefined;
                        }
                        self.h_add([UnknownEnum.Value_16, l_d, l_s]);
                    }
                    break;
                case 96:
                    if (l_ver.h_has_js_template_strings)
                    {
                        self.h_add([UnknownEnum.Value_12, l_d, global.gml_parser_template_func]);
                        self.h_add([UnknownEnum.Value_21, l_d]);
                        self.h_curr_template = new gml_parser_template_state(l_d, ds_list_size(global.gml_parser_token_acc), true, self.h_curr_template);
                        self.h_add([UnknownEnum.Value_16, l_d, "ERROR"]);
                        if (self.h_proc_template_segment(l_d) == undefined)
                        {
                            return undefined;
                        }
                    }
                    else if (l_c == 95 || (l_c >= 97 && l_c <= 122) || (l_c >= 65 && l_c <= 90))
                    {
                        while (self.h_pos < self.h_len)
                        {
                            l_c = buffer_peek(global.gml_parser_fast_buf, self.h_pos, buffer_u8);
                            if (l_c == 95 || (l_c >= 97 && l_c <= 122) || (l_c >= 65 && l_c <= 90) || (l_c >= 48 && l_c <= 57))
                            {
                                self.h_pos += 1;
                            }
                            else
                            {
                                break;
                            }
                        }
                        var l_s = gml_parser_buf_sub(global.gml_parser_fast_buf, global.gml_parser_buf_sub_buf, l_start, self.h_pos);
                        var l_fn = variable_struct_get(global.data_gml_keyword_mapper_map, l_s);
                        if (l_fn != undefined)
                        {
                            var l_tk = l_fn(l_d);
                            if (l_tk != undefined)
                            {
                                self.h_add(l_tk);
                            }
                            else
                            {
                                l__gthis.h_add([UnknownEnum.Value_12, l_d, l_s]);
                            }
                        }
                        else if (l_s == "gml_GlobalScript_GMLive")
                        {
                            self.h_add([UnknownEnum.Value_16, l_d, "live:" + self.h_source.h_name]);
                        }
                        else if (gml_std_StringTools_startsWith(l_s, "argument"))
                        {
                            var l_s_8 = gml_std_string_substring(l_s, 8);
                            if (string_digits(l_s_8) == l_s_8 && string_length(l_s_8) <= 2)
                            {
                                self.h_add([UnknownEnum.Value_27, l_d, gml_std_Std_parseInt(l_s_8)]);
                            }
                            else
                            {
                                l__gthis.h_add([UnknownEnum.Value_12, l_d, l_s]);
                            }
                        }
                        else
                        {
                            l__gthis.h_add([UnknownEnum.Value_12, l_d, l_s]);
                        }
                    }
                    else if ((l_c >= 48 && l_c <= 57) || l_c == 46)
                    {
                        if (l_c == 48)
                        {
                            var l_i = buffer_peek(global.gml_parser_fast_buf, self.h_pos, buffer_u8);
                            if (l_i == 120)
                            {
                                self.h_pos += 1;
                                if (self.h_proc_hexadecimal(l_d, true) == undefined)
                                {
                                    continue;
                                }
                                continue;
                            }
                            if (l_i == 98)
                            {
                                self.h_pos += 1;
                                if (self.h_proc_binary(l_d) == undefined)
                                {
                                    continue;
                                }
                                continue;
                            }
                        }
                        self.h_pos--;
                        if (self.h_proc_number(l_d) == undefined)
                        {
                            return undefined;
                        }
                    }
                    else
                    {
                        return self.h_error("Unexpected character `" + chr(l_c) + "` (ord " + string(l_c) + ")");
                    }
                    break;
                case 36:
                    if (l_ver.h_has_template_strings && buffer_peek(global.gml_parser_fast_buf, self.h_pos, buffer_u8) == 34)
                    {
                        self.h_pos += 1;
                        self.h_add([UnknownEnum.Value_12, l_d, global.gml_parser_template_func]);
                        self.h_add([UnknownEnum.Value_21, l_d]);
                        self.h_curr_template = new gml_parser_template_state(l_d, ds_list_size(global.gml_parser_token_acc), false, self.h_curr_template);
                        self.h_add([UnknownEnum.Value_16, l_d, "ERROR"]);
                        if (self.h_proc_template_segment(l_d) == undefined)
                        {
                            return undefined;
                        }
                    }
                    else
                    {
                        self.h_proc_hexadecimal(l_d, false);
                    }
                    break;
                case 35:
                    while (self.h_pos < self.h_len)
                    {
                        l_c = buffer_peek(global.gml_parser_fast_buf, self.h_pos, buffer_u8);
                        if (l_c == 95 || (l_c >= 97 && l_c <= 122) || (l_c >= 65 && l_c <= 90) || (l_c >= 48 && l_c <= 57))
                        {
                            self.h_pos += 1;
                        }
                        else
                        {
                            break;
                        }
                    }
                    var l_s = gml_parser_buf_sub(global.gml_parser_fast_buf, global.gml_parser_buf_sub_buf, l_start + 1, self.h_pos);
                    switch (l_s)
                    {
                        case "define":
                            if (self.h_proc_define(l_d) == undefined)
                            {
                                return undefined;
                            }
                            l_checkLineBreakForHeader = true;
                            break;
                        case "macro":
                            if (self.h_proc_macro_def(l_d) == undefined)
                            {
                                return undefined;
                            }
                            break;
                        case "endregion":
                        case "region":
                            self.h_skip_till_line_end();
                            break;
                        default:
                            var l_z;
                            if (string_length(l_s) == 6)
                            {
                                var l_i = -1;
                                var l_col = 0;
                                l_z = false;
                                while (++l_i < 6)
                                {
                                    l_c = string_ord_at(l_s, l_i + 1);
                                    if (l_c >= 48 && l_c <= 57)
                                    {
                                        l_c -= 48;
                                    }
                                    else if (l_c >= 97 && l_c <= 102)
                                    {
                                        l_c -= 87;
                                    }
                                    else if (l_c >= 65 && l_c <= 70)
                                    {
                                        l_c -= 55;
                                    }
                                    else
                                    {
                                        l_c = -1;
                                    }
                                    if (l_c < 0)
                                    {
                                        l_z = true;
                                        break;
                                    }
                                    l_col = (l_col << 4) | l_c;
                                }
                                if (!l_z)
                                {
                                    l_col = (l_col & 65280) | ((l_col & 16711680) >> 16) | ((l_col & 255) << 16);
                                    self.h_add([UnknownEnum.Value_15, l_d, l_col, undefined]);
                                }
                            }
                            else
                            {
                                l_z = true;
                            }
                            if (l_z)
                            {
                                self.h_add([UnknownEnum.Value_3, l_d]);
                                self.h_pos = l_start + 1;
                            }
                    }
                    break;
                default:
                    if (l_c == 95 || (l_c >= 97 && l_c <= 122) || (l_c >= 65 && l_c <= 90))
                    {
                        while (self.h_pos < self.h_len)
                        {
                            l_c = buffer_peek(global.gml_parser_fast_buf, self.h_pos, buffer_u8);
                            if (l_c == 95 || (l_c >= 97 && l_c <= 122) || (l_c >= 65 && l_c <= 90) || (l_c >= 48 && l_c <= 57))
                            {
                                self.h_pos += 1;
                            }
                            else
                            {
                                break;
                            }
                        }
                        var l_s = gml_parser_buf_sub(global.gml_parser_fast_buf, global.gml_parser_buf_sub_buf, l_start, self.h_pos);
                        var l_fn1 = variable_struct_get(global.data_gml_keyword_mapper_map, l_s);
                        if (l_fn1 != undefined)
                        {
                            var l_tk1 = l_fn1(l_d);
                            if (l_tk1 != undefined)
                            {
                                self.h_add(l_tk1);
                            }
                            else
                            {
                                l__gthis.h_add([UnknownEnum.Value_12, l_d, l_s]);
                            }
                        }
                        else if (l_s == "gml_GlobalScript_GMLive")
                        {
                            self.h_add([UnknownEnum.Value_16, l_d, "live:" + self.h_source.h_name]);
                        }
                        else if (gml_std_StringTools_startsWith(l_s, "argument"))
                        {
                            var l_s_81 = gml_std_string_substring(l_s, 8);
                            if (string_digits(l_s_81) == l_s_81 && string_length(l_s_81) <= 2)
                            {
                                self.h_add([UnknownEnum.Value_27, l_d, gml_std_Std_parseInt(l_s_81)]);
                            }
                            else
                            {
                                l__gthis.h_add([UnknownEnum.Value_12, l_d, l_s]);
                            }
                        }
                        else
                        {
                            l__gthis.h_add([UnknownEnum.Value_12, l_d, l_s]);
                        }
                    }
                    else if ((l_c >= 48 && l_c <= 57) || l_c == 46)
                    {
                        if (l_c == 48)
                        {
                            var l_i = buffer_peek(global.gml_parser_fast_buf, self.h_pos, buffer_u8);
                            if (l_i == 120)
                            {
                                self.h_pos += 1;
                                if (self.h_proc_hexadecimal(l_d, true) == undefined)
                                {
                                    continue;
                                }
                                continue;
                            }
                            if (l_i == 98)
                            {
                                self.h_pos += 1;
                                if (self.h_proc_binary(l_d) == undefined)
                                {
                                    continue;
                                }
                                continue;
                            }
                        }
                        self.h_pos--;
                        if (self.h_proc_number(l_d) == undefined)
                        {
                            return undefined;
                        }
                    }
                    else
                    {
                        return self.h_error("Unexpected character `" + chr(l_c) + "` (ord " + string(l_c) + ")");
                    }
            }
        }
        return self.h_finish();
    };
    
    static __class__ = global.mt_gml_parser;
    
    self.h_row = 1;
    self.h_row_start = 0;
    self.h_pos = 0;
    self.h_curr_template = undefined;
    self.h_curr_macro = undefined;
    self.h_macros = [];
    self.h_token_count = -1;
    self.h_tokens = undefined;
    self.h_source = arg0;
    self.h_pos_source = arg0.h_index;
}

function gml_parser_set_version(arg0)
{
    if (arg0 < 10)
    {
        show_error("Supported versions are 14,20,23", true);
    }
    else if (arg0 < 20)
    {
        global.gml_parser_default_version = global.api_api_version_v1;
    }
    else if (arg0 < 23)
    {
        global.gml_parser_default_version = global.api_api_version_v2;
    }
    else
    {
        global.gml_parser_default_version = global.api_api_version_v23;
    }
}

function gml_parser_buf_sub(arg0, arg1, arg2, arg3)
{
    var l_len = arg3 - arg2;
    buffer_copy(arg0, arg2, l_len, arg1, 0);
    buffer_poke(arg1, l_len, buffer_u8, 0);
    buffer_seek(arg1, buffer_seek_start, 0);
    return buffer_read(arg1, buffer_string);
}

function gml_parser_char_is_space_init()
{
    var l_vec = array_create(256, undefined);
    haxe_ds__vector_vector_impl__fill(l_vec, false);
    array_set(l_vec, 32, true);
    array_set(l_vec, 9, true);
    array_set(l_vec, 13, true);
    array_set(l_vec, 10, true);
    return l_vec;
}

function gml_parser_template_state(arg0, arg1, arg2, arg3) constructor
{
    static h_curly_depth = undefined;
    static h_tk_index = undefined;
    static h_next = undefined;
    static h_arg_count = undefined;
    static h_str = undefined;
    static h_stop = undefined;
    static h_pos = undefined;
    static h_is_js = undefined;
    static __class__ = global.mt_gml_parser_template_state;
    
    self.h_str = "";
    self.h_arg_count = 0;
    self.h_curly_depth = 0;
    self.h_pos = arg0;
    self.h_tk_index = arg1;
    self.h_next = arg3;
    self.h_stop = arg2 ? 96 : 34;
    self.h_is_js = arg2;
}

function _gml_parser_gml_parser_string_buf_impl__start()
{
    var l_buf = global._gml_parser_gml_parser_string_buf_impl____buf;
    buffer_seek(l_buf, buffer_seek_start, 0);
    return l_buf;
}

function _gml_parser_gml_parser_string_buf_impl__add_code_point(arg0, arg1)
{
    if (arg1 <= 127)
    {
        buffer_write(arg0, buffer_u8, arg1);
    }
    else if (arg1 <= 2047)
    {
        buffer_write(arg0, buffer_u8, 192 | (arg1 >> 6));
        buffer_write(arg0, buffer_u8, 128 | (arg1 & 63));
    }
    else if (arg1 <= 65535)
    {
        buffer_write(arg0, buffer_u8, 192 | (arg1 >> 12));
        buffer_write(arg0, buffer_u8, 128 | ((arg1 >> 6) & 63));
        buffer_write(arg0, buffer_u8, 128 | (arg1 & 63));
    }
    else
    {
        buffer_write(arg0, buffer_u8, 192 | (arg1 >> 18));
        buffer_write(arg0, buffer_u8, 128 | ((arg1 >> 12) & 63));
        buffer_write(arg0, buffer_u8, 128 | ((arg1 >> 6) & 63));
        buffer_write(arg0, buffer_u8, 128 | (arg1 & 63));
    }
}

function _gml_parser_gml_parser_string_buf_impl__to_string(arg0)
{
    buffer_write(arg0, buffer_u8, 0);
    buffer_seek(arg0, buffer_seek_start, 0);
    return buffer_read(arg0, buffer_string);
}

function gml_parser_macro(arg0, arg1, arg2) constructor
{
    static h_pos = undefined;
    static h_name = undefined;
    static h_config = undefined;
    static h_tokens = undefined;
    static __class__ = global.mt_gml_parser_macro;
    
    self.h_tokens = [];
    self.h_name = arg0;
    self.h_config = arg1;
    self.h_pos = arg2;
}

function gml_program(arg0) constructor
{
    static h_sources = undefined;
    
    static h_get_source = function(arg0)
    {
        if (arg0 == -2)
        {
            return global.gml_source_builtin;
        }
        if (arg0 >= 0 && arg0 < array_length(self.h_sources))
        {
            return self.h_sources[arg0];
        }
        return global.gml_source_unknown;
    };
    
    static h_script_array = undefined;
    static h_script_map = undefined;
    static h_enum_array = undefined;
    static h_enum_map = undefined;
    static h_macro_map = undefined;
    static h_wait_list = undefined;
    static h_wait_list_swap = undefined;
    static h_callback = undefined;
    static h_time_tag = undefined;
    static h_error_text = undefined;
    static h_error_pos = undefined;
    static h_is_ready = undefined;
    static h_tag = undefined;
    static h_live_ident = undefined;
    
    static h_has_fast_getter = function(arg0)
    {
        return variable_struct_exists(global.gml_fast_field_getters, arg0);
    };
    
    static h_get_fast_getter = function(arg0)
    {
        return variable_struct_get(global.gml_fast_field_getters, arg0);
    };
    
    static h_get_fast_setter = function(arg0)
    {
        return variable_struct_get(global.gml_fast_field_setters, arg0);
    };
    
    static h_get_fast_setter_after_getter = function(arg0)
    {
        return variable_struct_get(global.gml_fast_field_setters, arg0);
    };
    
    static h_error = function(arg0, arg1)
    {
        var l_pos = arg1;
        self.h_error_text = gml_pos_to_string(l_pos, self) + " " + arg0;
        self.h_error_pos = l_pos;
        return true;
    };
    
    static h_merge_builder_results = function(arg0)
    {
        var l_main = arg0.h_source.h_main;
        var l__g = 0;
        var l__g1 = arg0.h_scripts;
        while (l__g < array_length(l__g1))
        {
            var l_scr = l__g1[l__g];
            l__g++;
            if (variable_struct_exists(self.h_script_map, l_scr.h_name))
            {
                if (l_scr.h_name == l_main)
                {
                    var l__g2 = variable_struct_get(self.h_script_map, l_main).h_node;
                    var l_tmp;
                    if (l__g2[0] == 95)
                    {
                        l_tmp = array_length(l__g2[2]) == 0;
                    }
                    else
                    {
                        l_tmp = false;
                    }
                    if (l_tmp)
                    {
                        var l_w = self.h_script_array;
                        l_i = 0;
                        var l_n = array_length(l_w);
                        while (l_i < l_n)
                        {
                            if (l_w[l_i].h_name == l_main)
                            {
                                while (++l_i < l_n)
                                {
                                    array_set(l_w, l_i - 1, l_w[l_i]);
                                }
                                array_set(l_w, l_n - 1, l_scr);
                            }
                            else
                            {
                                l_i++;
                            }
                        }
                        variable_struct_set(self.h_script_map, l_scr.h_name, l_scr);
                    }
                    else
                    {
                        self.h_error("Cannot override prefix-script \"" + l_main + "\" because it is not empty", l_scr.h_pos);
                        exit;
                    }
                }
                else
                {
                    self.h_error("Script " + l_scr.h_name + " is already defined at " + gml_pos_to_string(variable_struct_get(self.h_script_map, l_scr.h_name).h_pos, self), l_scr.h_pos);
                    exit;
                }
            }
            else
            {
                array_push(self.h_script_array, l_scr);
                variable_struct_set(self.h_script_map, l_scr.h_name, l_scr);
            }
        }
        l__g = 0;
        l__g1 = arg0.h_enums;
        while (l__g < array_length(l__g1))
        {
            var l_e = l__g1[l__g];
            l__g++;
            array_push(self.h_enum_array, l_e);
            variable_struct_set(self.h_enum_map, l_e.h_name, l_e);
        }
        var l_mcrNames = arg0.h_macro_names;
        var l_mcrNodes = arg0.h_macro_nodes;
        var l_mcrMap = self.h_macro_map;
        var l_i = 0;
        l__g1 = array_length(l_mcrNames);
        while (l_i < l__g1)
        {
            variable_struct_set(l_mcrMap, l_mcrNames[l_i], l_mcrNodes[l_i]);
            l_i++;
        }
    };
    
    static h_destroy = function()
    {
        var l__g = 0;
        var l__g1 = self.h_script_array;
        while (l__g < array_length(l__g1))
        {
            var l_q = l__g1[l__g];
            l__g++;
            l_q.h_destroy();
        }
        self.h_script_array = undefined;
        self.h_script_map = undefined;
        self.h_enum_map = undefined;
        self.h_macro_map = undefined;
        ds_list_destroy(self.h_wait_list);
        self.h_wait_list = undefined;
        ds_list_destroy(self.h_wait_list_swap);
        self.h_wait_list_swap = undefined;
    };
    
    static h_call_v = function(arg0, arg1, arg2 = true)
    {
        var l_scr = variable_struct_get(self.h_script_map, arg0);
        if (l_scr != undefined)
        {
            var l_locals = array_create(l_scr.h_locals);
            if (arg2)
            {
                arg1 = gml_value_list_copy(arg1);
            }
            gml_value_list_pad_to_size_with_null(arg1, l_scr.h_arguments);
            var l_th = new gml_thread(self, l_scr.h_actions, arg1, l_locals);
            l_th.h_callback = self.h_callback;
            l_th.h_time_tag = self.h_time_tag;
            l_th.h_exec();
            return l_th;
        }
        else
        {
            return undefined;
        }
    };
    
    static h_print = function()
    {
        var l_r = new gml_std_StringBuf();
        var l_i = 0;
        var l__g1 = array_length(self.h_script_array);
        while (l_i < l__g1)
        {
            if (l_i > 0)
            {
                l_r.h_addChar(10);
            }
            var l_scr = self.h_script_array[l_i];
            l_r.h_add("#define ");
            l_r.h_add(l_scr.h_name);
            l_r.h_add("\n// locals: {");
            var l_localNames = l_scr.h_local_names;
            var l_k = 0;
            var l__g3 = array_length(l_localNames);
            while (l_k < l__g3)
            {
                if (l_k > 0)
                {
                    l_r.h_add(", ");
                }
                else
                {
                    l_r.h_add(" ");
                }
                l_r.h_add(l_k);
                l_r.h_add(": \"");
                l_r.h_add(l_localNames[l_k]);
                l_r.h_add("\"");
                l_k++;
            }
            l_r.h_add(" }\n");
            l_r.h_add(gml_action_list_print(l_scr.h_actions));
            l_i++;
        }
        return l_r.h_toString();
    };
    
    static h_seek = function(arg0, arg1 = false)
    {
        var l_w = arg1 ? ds_list_create() : undefined;
        global.gml_program_seek_func = arg0;
        var l_m = self.h_script_array;
        var l_n = array_length(l_m);
        var l_i = 0;
        while (l_i < l_n)
        {
            var l_scr = l_m[l_i];
            global.gml_program_seek_script = l_scr;
            var l_scrNode = l_scr.h_node;
            if (l_scrNode != undefined && arg0(l_scrNode, l_w))
            {
                break;
            }
            else
            {
                l_i++;
            }
        }
        global.gml_program_seek_script = undefined;
        global.gml_program_seek_func = undefined;
        if (arg1)
        {
            ds_list_destroy(l_w);
        }
        return l_i < l_n;
    };
    
    static h_check = function()
    {
        global.gml_program_seek_inst = self;
        if (self.h_seek(gml_seek_arguments_proc, false))
        {
            return true;
        }
        if (self.h_seek(gml_seek_locals_proc, false))
        {
            return true;
        }
        if (self.h_seek(gml_seek_idents_proc, true))
        {
            return true;
        }
        if (self.h_seek(gml_seek_fields_proc, false))
        {
            return true;
        }
        if (self.h_seek(gml_seek_calls_proc, false))
        {
            return true;
        }
        if (gml_seek_enum_values_proc())
        {
            return true;
        }
        if (self.h_seek(gml_seek_enum_fields_proc, false))
        {
            return true;
        }
        if (gml_seek_eval_opt())
        {
            return true;
        }
        if (self.h_seek(gml_seek_self_fields_proc, false))
        {
            return true;
        }
        if (self.h_seek(gml_seek_alarms_proc, false))
        {
            return true;
        }
        if (self.h_seek(gml_seek_adjfix_proc, true))
        {
            return true;
        }
        if (self.h_seek(gml_seek_set_op_proc, true))
        {
            return true;
        }
        global.gml_program_seek_inst = undefined;
        return false;
    };
    
    static h_eval_value = undefined;
    
    static h_eval = function(arg0)
    {
        var l__g = arg0;
        var l_r;
        switch (l__g[0])
        {
            case UnknownEnum.Value_2:
                l_r = l__g[2];
                break;
            case UnknownEnum.Value_3:
                l_r = l__g[2];
                break;
            case UnknownEnum.Value_55:
                var l__hx_tmp = l__g[2];
                if (l__hx_tmp[0] == 13)
                {
                    var l_d = l__g[1];
                    var l_s = l__hx_tmp[2];
                    var l_f = l__g[3];
                    var l_e = variable_struct_get(self.h_enum_map, l_s);
                    if (l_e != undefined)
                    {
                        var l_c = variable_struct_get(l_e.h_ctr_map, l_f);
                        if (l_c != undefined)
                        {
                            l_r = l_c.h_value;
                            if (l_r == undefined)
                            {
                                return self.h_error("Value of " + l_s + "." + l_f + " is not known here", l_d);
                            }
                        }
                        else
                        {
                            return self.h_error("Enum `" + l_s + "` does not contain field `" + l_f + "`", l_d);
                        }
                    }
                    else
                    {
                        return self.h_error("Could not find enum " + l_s, l_d);
                    }
                }
                else
                {
                    return self.h_error("Can not evaluate this compile-time", gml_std_haxe_enum_tools_getParameter(arg0, 0));
                }
                break;
            case UnknownEnum.Value_36:
                if (self.h_eval(l__g[3]))
                {
                    return true;
                }
                l_r = self.h_eval_value;
                if (self.h_eval(l__g[4]))
                {
                    return true;
                }
                var l_v = self.h_eval_value;
                switch (l__g[2])
                {
                    case 16:
                        l_r += l_v;
                        break;
                    case 17:
                        l_r -= l_v;
                        break;
                    case 0:
                        l_r *= l_v;
                        break;
                    case 1:
                        l_r /= l_v;
                        break;
                    case 2:
                        l_r %= l_v;
                        break;
                    case 3:
                        var l_a = l_r;
                        var l_b = l_v;
                        if (l_b == 0 && is_int64(l_b) && is_int64(l_a))
                        {
                            show_error("Division by zero", true);
                        }
                        l_r = l_a div l_b;
                        break;
                    case 49:
                        l_r &= l_v;
                        break;
                    case 48:
                        l_r |= l_v;
                        break;
                    case 50:
                        l_r ^= l_v;
                        break;
                    case 32:
                        l_r = l_r << l_v;
                        break;
                    case 33:
                        l_r = l_r >> l_v;
                        break;
                    default:
                        return self.h_error("Can not evaluate this compile-time", gml_std_haxe_enum_tools_getParameter(arg0, 0));
                }
                break;
            default:
                return self.h_error("Can not evaluate this compile-time", gml_std_haxe_enum_tools_getParameter(arg0, 0));
        }
        self.h_eval_value = l_r;
        return false;
    };
    
    static __class__ = global.mt_gml_program;
    
    self.h_is_ready = false;
    self.h_error_text = undefined;
    self.h_time_tag = undefined;
    self.h_callback = undefined;
    self.h_wait_list_swap = ds_list_create();
    self.h_wait_list = ds_list_create();
    self.h_macro_map = {};
    self.h_enum_map = {};
    self.h_enum_array = [];
    self.h_script_map = {};
    self.h_script_array = [];
    self.h_sources = undefined;
    var l_i = 0;
    var l__g1 = array_length(arg0);
    while (l_i < l__g1)
    {
        arg0[l_i].h_index = l_i;
        l_i++;
    }
    self.h_sources = arg0;
    var l_builders = [];
    var l__g = 0;
    while (l__g < array_length(arg0))
    {
        var l_src = arg0[l__g];
        l__g++;
        array_push(l_builders, new gml_builder(self, l_src));
    }
    if (array_length(arg0) > 0 && !arg0[0].h_version.h_expr_macros)
    {
        if (ast_gml_macro_proc_run(self, l_builders))
        {
            exit;
        }
    }
    l__g = 0;
    while (l__g < array_length(l_builders))
    {
        var l_b = l_builders[l__g];
        l__g++;
        l_b.h_run();
        if (l_b.h_error_text == undefined)
        {
            self.h_merge_builder_results(l_b);
        }
        else if (l_b.h_source.h_opt)
        {
            var l_errorNext = l_b.h_error_text;
            if (self.h_error_text != undefined)
            {
                self.h_error_text += ("\n" + l_errorNext);
            }
            else
            {
                self.h_error_text = l_errorNext;
            }
        }
        else
        {
            self.h_error_text = l_b.h_error_text;
            self.h_error_pos = l_b.h_error_pos;
            exit;
        }
    }
    var l_n = array_length(self.h_script_array);
    for (l_i = 0; l_i < l_n; l_i++)
    {
        self.h_script_array[l_i].h_index = global.gml_script_index_offset + l_i;
    }
    if (self.h_check())
    {
        global.gml_program_seek_inst = undefined;
        exit;
    }
    if (gml_compile_program(self))
    {
        if (self.h_error_text != undefined)
        {
            self.h_error_text += ("\n" + global.gml_compile_error_text);
        }
        else
        {
            self.h_error_text = global.gml_compile_error_text;
        }
        self.h_error_pos = global.gml_compile_error_pos;
        exit;
    }
    l_builders = undefined;
    l_n = array_length(self.h_script_array);
    for (l_i = 0; l_i < l_n; l_i++)
    {
        self.h_script_array[l_i].h_node = undefined;
    }
    self.h_is_ready = true;
}

function gml_std_StringBuf() constructor
{
    static h_str = undefined;
    static h_strLen = undefined;
    static h_arr = undefined;
    static h_arrLen = undefined;
    static h_arrMax = undefined;
    static h_length = undefined;
    
    static h_store = function()
    {
        var l_i = self.h_arrLen++;
        var l_m = self.h_arrMax;
        var l_arr = self.h_arr;
        if (l_i >= l_m)
        {
            l_m *= 2;
            array_set(l_arr, l_m - 1, undefined);
            self.h_arrMax = l_m;
        }
        array_set(l_arr, l_i, self.h_str);
        self.h_str = "";
        self.h_strLen = 0;
    };
    
    static h_addChar = function(arg0)
    {
        self.h_str += chr(arg0);
        self.h_length += 1;
        if (++self.h_strLen >= 128)
        {
            self.h_store();
        }
    };
    
    static h_add = function(arg0)
    {
        var l_s = gml_std_Std_stringify(arg0);
        var l_n = string_byte_length(l_s);
        self.h_str += l_s;
        self.h_length += l_n;
        self.h_strLen += l_n;
        if (self.h_strLen >= 128)
        {
            self.h_store();
        }
    };
    
    static h_toString = function()
    {
        var l_arr = self.h_arr;
        var l_buf = global.gml_std_StringBuf_buffer;
        buffer_seek(l_buf, buffer_seek_start, 0);
        var l_i = 0;
        var l__g1 = self.h_arrLen;
        while (l_i < l__g1)
        {
            buffer_write(l_buf, buffer_text, l_arr[l_i]);
            l_i++;
        }
        buffer_write(l_buf, buffer_string, self.h_str);
        buffer_seek(l_buf, buffer_seek_start, 0);
        return buffer_read(l_buf, buffer_string);
    };
    
    static __class__ = global.mt_gml_std_StringBuf;
    
    self.h_length = 0;
    self.h_arrMax = 4;
    self.h_arrLen = 0;
    self.h_arr = array_create(4);
    self.h_strLen = 0;
    self.h_str = "";
}

function gml_api_parse_name(arg0, arg1)
{
    var l_c = string_ord_at(arg0, arg1 + 1);
    if ((l_c >= 97 && l_c <= 122) || (l_c >= 65 && l_c <= 90) || l_c == 95)
    {
        var l_k = arg1;
        do
        {
            arg1++;
            l_c = string_ord_at(arg0, arg1 + 1);
        }
        until (!(l_c == 95 || (l_c >= 97 && l_c <= 122) || (l_c >= 65 && l_c <= 90) || (l_c >= 48 && l_c <= 57)));
        return gml_std_string_substring(arg0, l_k, arg1);
    }
    else
    {
        show_error("API.parseName: wrong format in " + arg0, true);
    }
}

function api_api_var() constructor
{
    static h_name = undefined;
    static h_flags = undefined;
    static h_func = undefined;
    static h_type_check = undefined;
    
    static h_set = function(arg0, arg1)
    {
        var l_flags = 0;
        if (string_ord_at(arg0, 1) == 58)
        {
            arg0 = gml_std_string_substring(arg0, 1);
            l_flags |= 4;
        }
        var l_typeCheck = gml_type_check_any;
        var l_pos = gml_std_string_pos_ext_haxe(arg0, ":");
        if (l_pos >= 0)
        {
            var l_typeStr = gml_std_string_substring(arg0, l_pos + 1);
            l_typeCheck = variable_struct_get(global.gml_type_check_map, l_typeStr);
            if (l_typeCheck == undefined)
            {
                show_error("`" + l_typeStr + "` is not a known type in `" + arg0 + "`", true);
            }
            arg0 = gml_std_string_substring(arg0, 0, l_pos);
        }
        self.h_name = gml_api_parse_name(arg0, 0);
        if (gml_std_string_pos_ext_haxe(arg0, "[") >= 0)
        {
            l_flags |= 2;
        }
        if (gml_std_string_pos_ext_haxe(arg0, "*") >= 0)
        {
            l_flags |= 1;
        }
        self.h_flags = l_flags;
        self.h_func = arg1;
        self.h_type_check = l_typeCheck;
    };
    
    static __class__ = global.mt_api_api_var;
    
    self.h_flags = 0;
}

function gml_enum(arg0, arg1) constructor
{
    static h_name = undefined;
    static h_pos = undefined;
    static h_ctr_list = undefined;
    static h_ctr_map = undefined;
    static h_has_values = undefined;
    
    static h_add = function(arg0, arg1)
    {
        var l_ctr = new gml_enum_ctr(arg0, self.h_pos, [UnknownEnum.Value_2, self.h_pos, arg1, string(arg1)]);
        l_ctr.h_value = arg1;
        array_push(self.h_ctr_list, l_ctr);
        variable_struct_set(self.h_ctr_map, arg0, l_ctr);
    };
    
    static h_print = function()
    {
        var l_r = "(enum " + self.h_name + " { ";
        var l_z = false;
        var l__g = 0;
        var l__g1 = self.h_ctr_list;
        while (l__g < array_length(l__g1))
        {
            var l_ctr = l__g1[l__g];
            l__g++;
            if (l_z)
            {
                l_r += ", ";
            }
            else
            {
                l_z = true;
            }
            l_r += (l_ctr.h_name + " = " + gml_std_Std_stringify(l_ctr.h_value));
        }
        return l_r + " })";
    };
    
    static __class__ = global.mt_gml_enum;
    
    self.h_has_values = false;
    self.h_ctr_map = {};
    self.h_ctr_list = [];
    self.h_name = arg0;
    self.h_pos = arg1;
}

function gml_enum_create_builtin(arg0)
{
    var l_e = new gml_enum(arg0, gml_pos_create(-2, 0, 0, 0));
    variable_struct_set(global.gml_enum_map, arg0, l_e);
    return l_e;
}

function gml_enum_ctr(arg0, arg1, arg2) constructor
{
    static h_name = undefined;
    static h_pos = undefined;
    static h_node = undefined;
    static h_value = undefined;
    static __class__ = global.mt_gml_enum_ctr;
    
    self.h_value = undefined;
    self.h_name = arg0;
    self.h_pos = arg1;
    self.h_node = arg2;
}

function gml_macro(arg0, arg1, arg2, arg3) constructor
{
    static h_name = undefined;
    static h_node = undefined;
    static h_is_expr = undefined;
    static h_is_stat = undefined;
    static __class__ = global.mt_gml_macro;
    
    self.h_name = arg0;
    self.h_node = arg1;
    self.h_is_expr = arg2;
    self.h_is_stat = arg3;
}

function ast_gml_macro_proc_patch(arg0, arg1)
{
    var l_changed = false;
    var l_i = -1;
    var l_n = array_length(arg0);
    if (arg1)
    {
        ds_list_clear(global.ast_gml_macro_proc_next_exclude_list);
        tools__dictionary_dictionary_impl__clear(global.ast_gml_macro_proc_next_exclude_map);
    }
    while (++l_i < l_n)
    {
        var l_tk = arg0[l_i];
        var l_id;
        if (l_tk[0] == 12)
        {
            var l_pos = l_tk[1];
            l_id = l_tk[2];
        }
        else
        {
            continue;
        }
        var l_nm = variable_struct_get(global.ast_gml_macro_proc_map, l_id);
        if (l_nm == undefined)
        {
            continue;
        }
        if (variable_struct_exists(global.ast_gml_macro_proc_exclude_map, l_id))
        {
            continue;
        }
        if (!variable_struct_exists(global.ast_gml_macro_proc_next_exclude_map, l_id))
        {
            variable_struct_set(global.ast_gml_macro_proc_next_exclude_map, l_id, true);
            ds_list_add(global.ast_gml_macro_proc_next_exclude_list, l_id);
        }
        var l_ntks = l_nm.h_tokens;
        var l_ntkn = array_length(l_ntks);
        switch (l_ntkn)
        {
            case 0:
                gml_std_gml_internal_ArrayImpl_splice(arg0, l_i, 1);
                l_i--;
                l_n--;
                break;
            case 1:
                array_set(arg0, l_i, l_ntks[0]);
                break;
            default:
                array_set(arg0, l_i, l_ntks[0]);
                l_n += (l_ntkn - 1);
                var l_k = l_ntkn;
                while (--l_k >= 1)
                {
                    array_insert(arg0, l_i + 1, l_ntks[l_k]);
                }
        }
        l_changed = true;
    }
    if (l_changed && arg1)
    {
        var l_k = 0;
        var l__g1 = ds_list_size(global.ast_gml_macro_proc_next_exclude_list);
        while (l_k < l__g1)
        {
            variable_struct_set(global.ast_gml_macro_proc_exclude_map, ds_list_find_value(global.ast_gml_macro_proc_next_exclude_list, l_k), true);
            l_k++;
        }
    }
    return l_changed;
}

function ast_gml_macro_proc_patch_nameof(arg0, arg1)
{
    var l_changed = false;
    var l_i = -1;
    var l_n = array_length(arg0);
    while (++l_i < (l_n - 2))
    {
        var l_tk = arg0[l_i];
        var l_outData;
        if (l_tk[0] == 12)
        {
            if (l_tk[2] == "nameof")
            {
                l_outData = l_tk[1];
            }
            else
            {
                continue;
            }
        }
        else
        {
            continue;
        }
        var l_startInd = l_i;
        var l__g = arg0[l_i + 1];
        var l_startPos;
        if (l__g[0] == 21)
        {
            var l_d1 = l__g[1];
            l_startPos = l_d1[4] + 1;
        }
        else
        {
            continue;
        }
        l_i++;
        var l_depth = 1;
        var l_endPos = -1;
        while (++l_i < l_n)
        {
            l_tk = arg0[l_i];
            switch (l_tk[0])
            {
                case UnknownEnum.Value_21:
                    l_depth++;
                    break;
                case UnknownEnum.Value_22:
                    l_depth--;
                    break;
            }
            if (l_depth <= 0)
            {
                l_endPos = l_tk[1][4];
                l_i++;
                break;
            }
        }
        if (l_endPos < 0)
        {
            continue;
        }
        var l_count = l_i - l_startInd - 1;
        gml_std_gml_internal_ArrayImpl_splice(arg0, l_startInd + 1, l_count);
        l_i -= l_count;
        l_n -= l_count;
        var l_snip = gml_std_string_substring(arg1.h_code, l_startPos, l_endPos);
        l_snip = gml_std_StringTools_trim(l_snip);
        array_set(arg0, l_startInd, [UnknownEnum.Value_16, l_outData, l_snip]);
        l_changed = true;
    }
    return l_changed;
}

function ast_gml_macro_proc_run(arg0, arg1)
{
    tools__dictionary_dictionary_impl__clear(global.ast_gml_macro_proc_map);
    ds_list_clear(global.ast_gml_macro_proc_list);
    var l__g = 0;
    while (l__g < array_length(arg1))
    {
        var l_b = arg1[l__g];
        l__g++;
        if (l_b.h_error_text == undefined && l_b.h_source.h_version.h_has_nameof)
        {
            if (ast_gml_macro_proc_patch_nameof(l_b.h_tokens, l_b.h_source))
            {
                l_b.h_length = array_length(l_b.h_tokens);
            }
        }
    }
    l__g = 0;
    while (l__g < array_length(arg1))
    {
        var l_b = arg1[l__g];
        l__g++;
        if (l_b.h_error_text == undefined)
        {
            var l_macros = l_b.h_source.h_parser.h_macros;
            var l_i = 0;
            var l__g2 = array_length(l_macros);
            while (l_i < l__g2)
            {
                var l_m = l_macros[l_i];
                var l_config = l_m.h_config;
                if (l_config != undefined && l_config != global.live_config)
                {
                }
                else
                {
                    if (variable_struct_exists(global.ast_gml_macro_proc_map, l_m.h_name))
                    {
                        arg0.h_error_text = "Macro redifinition (first at " + gml_pos_to_string(variable_struct_get(global.ast_gml_macro_proc_map, l_m.h_name).h_pos, arg0) + ")";
                        arg0.h_error_pos = l_m.h_pos;
                        return true;
                    }
                    variable_struct_set(global.ast_gml_macro_proc_map, l_m.h_name, l_m);
                    ds_list_add(global.ast_gml_macro_proc_list, l_m);
                }
                l_i++;
            }
        }
    }
    l__g = 0;
    var l__g1 = global.ast_gml_macro_proc_list;
    while (l__g < ds_list_size(l__g1))
    {
        var l_m = ds_list_find_value(l__g1, l__g);
        l__g++;
        tools__dictionary_dictionary_impl__clear(global.ast_gml_macro_proc_exclude_map);
        variable_struct_set(global.ast_gml_macro_proc_exclude_map, l_m.h_name, true);
        var l_tks = l_m.h_tokens;
        for (var l_step = 0; l_step < 64; l_step++)
        {
            if (!ast_gml_macro_proc_patch(l_tks, true))
            {
                break;
            }
        }
    }
    tools__dictionary_dictionary_impl__clear(global.ast_gml_macro_proc_exclude_map);
    l__g = 0;
    while (l__g < array_length(arg1))
    {
        var l_b = arg1[l__g];
        l__g++;
        if (l_b.h_error_text == undefined)
        {
            if (ast_gml_macro_proc_patch(l_b.h_tokens, false))
            {
                l_b.h_length = array_length(l_b.h_tokens);
            }
        }
    }
    return false;
}

function ast_gml_node_def_param(arg0, arg1) constructor
{
    static h_name = undefined;
    static h_type = undefined;
    static __class__ = global.mt_ast_gml_node_def_param;
    
    self.h_name = arg0;
    self.h_type = arg1;
}

function ast_gml_node_def_ctr(arg0, arg1) constructor
{
    static h_name = undefined;
    static h_params = undefined;
    static h_has_children = undefined;
    static __class__ = global.mt_ast_gml_node_def_ctr;
    
    self.h_has_children = false;
    self.h_name = arg0;
    self.h_params = arg1;
    var l__g = 0;
    while (l__g < array_length(arg1))
    {
        var l_param = arg1[l__g];
        l__g++;
        var l_t = l_param.h_type;
        if (l_t == 2 || l_t == 1)
        {
            self.h_has_children = true;
            break;
        }
    }
}

function ast_gml_node_tools_ni_concat_pos_iter(arg0, arg1)
{
    gml_std_haxe_enum_tools_setParameter(arg0, 0, gml_pos_concat(gml_std_haxe_enum_tools_getParameter(arg0, 0), global.ast_gml_node_tools_ni_concat_pos_pos));
    return gml_node_tools_seek(arg0, undefined, ast_gml_node_tools_ni_concat_pos_iter);
}

function ast_gml_node_tools_ni_concat_pos_rec(arg0, arg1)
{
    global.ast_gml_node_tools_ni_concat_pos_pos = arg1;
    ast_gml_node_tools_ni_concat_pos_iter(arg0, undefined);
}

function ast_gml_node_tools_ni_get_pos_string(arg0, arg1)
{
    return gml_pos_to_string(gml_std_haxe_enum_tools_getParameter(arg0, 0), arg1);
}

function gml_pos_create(arg0, arg1, arg2, arg3)
{
    var l_this = array_create(5);
    array_set(l_this, 3, undefined);
    array_set(l_this, 0, arg0);
    array_set(l_this, 1, arg1);
    array_set(l_this, 2, arg2);
    array_set(l_this, 4, arg3);
    return l_this;
}

function gml_pos_get_source(arg0, arg1)
{
    return arg1.h_get_source(arg0[0]);
}

function gml_pos_copy(arg0)
{
    var l_r = gml_pos_create(arg0[0], arg0[1], arg0[2], arg0[4]);
    if (arg0[3] != undefined)
    {
        array_set(l_r, 3, gml_pos_copy(arg0[3]));
    }
    return l_r;
}

function gml_pos_concat(arg0, arg1)
{
    var l_r = gml_pos_copy(arg1);
    var l_l = l_r;
    while (l_l[3] != undefined)
    {
        l_l = l_l[3];
    }
    array_set(l_l, 3, arg0);
    return l_r;
}

function gml_pos_to_string(arg0, arg1)
{
    var l_name;
    if (arg1 != undefined)
    {
        l_name = arg1.h_get_source(arg0[0]).h_name;
    }
    else
    {
        l_name = "?";
    }
    var l_r = l_name + (" [line " + string(arg0[1]) + ", col " + string(arg0[2]) + "]");
    if (arg0[3] != undefined)
    {
        l_r += (">" + gml_pos_to_string(arg0[3], arg1));
    }
    return l_r;
}

function gml_pos_to_string_in(arg0, arg1)
{
    return arg1.h_name + ("[L" + string(arg0[1]) + ",c" + string(arg0[2]) + "]");
}

function gml_script(arg0, arg1, arg2) constructor
{
    static h_name = undefined;
    static h_pos = undefined;
    static h_index = undefined;
    static h_node = undefined;
    static h_source = undefined;
    static h_local_map = undefined;
    static h_local_names = undefined;
    static h_locals = undefined;
    static h_prefix_statements = undefined;
    static h_is_function = undefined;
    static h_is_constructor = undefined;
    static h_parent_name = undefined;
    static h_parent_is_global = undefined;
    static h_parent_argc = undefined;
    static h_static_map = undefined;
    static h_static_names = undefined;
    static h_static_count = undefined;
    static h_static_init = undefined;
    static h_script_id = undefined;
    
    static h_get_uses_script_static = function()
    {
        return !self.h_is_constructor && self.h_script_id != -1;
    };
    
    static h_static_struct = undefined;
    
    static h_get_uses_static_struct = function()
    {
        return false;
    };
    
    static h_static_values = undefined;
    static h_static_ready = undefined;
    static h_arguments = undefined;
    static h_named_args = undefined;
    static h_uses_args = undefined;
    static h_actions = undefined;
    
    static h_destroy = function()
    {
        self.h_local_map = undefined;
        self.h_static_map = undefined;
        if (self.h_actions != undefined)
        {
            var l_this1 = self.h_actions;
            var l_i = 0;
            var l__g1 = ds_list_size(l_this1);
            while (l_i < l__g1)
            {
                var l_q = ds_list_find_value(l_this1, l_i);
                if (l_q != undefined)
                {
                    if (l_q.__enumIndex__ == 97)
                    {
                        ds_map_destroy(l_q.h_jumptable);
                    }
                }
                l_i++;
            }
            ds_list_destroy(l_this1);
            self.h_actions = undefined;
        }
    };
    
    static h_is_valid = function()
    {
        return self.h_actions != undefined;
    };
    
    static h_seek = function(arg0, arg1)
    {
        var l__scr = global.gml_program_seek_script;
        global.gml_program_seek_script = self;
        arg0(self.h_node, arg1);
        global.gml_program_seek_script = l__scr;
    };
    
    static __class__ = global.mt_gml_script;
    
    self.h_actions = undefined;
    self.h_uses_args = false;
    self.h_named_args = undefined;
    self.h_arguments = 0;
    self.h_static_ready = [false];
    self.h_static_values = [];
    self.h_static_struct = global.compile_groups_gml_compile_group_static_has_statics ? {} : undefined;
    self.h_script_id = -1;
    self.h_static_init = [];
    self.h_static_count = 0;
    self.h_static_names = [];
    self.h_static_map = {};
    self.h_parent_argc = 0;
    self.h_parent_is_global = false;
    self.h_parent_name = undefined;
    self.h_is_constructor = false;
    self.h_is_function = false;
    self.h_prefix_statements = undefined;
    self.h_locals = 0;
    self.h_local_names = [];
    self.h_local_map = {};
    self.h_source = arg0;
    self.h_name = arg1;
    self.h_pos = arg2;
}

function gml_source(arg0, arg1, arg2, arg3) constructor
{
    static h_index = undefined;
    static h_name = undefined;
    static h_code = undefined;
    static h_main = undefined;
    static h_length = undefined;
    static h_opt = undefined;
    static h_parser = undefined;
    static h___eof = undefined;
    
    static h_get_pos_source = function()
    {
        return self.h_index;
    };
    
    static h_get_eof = function()
    {
        if (self.h___eof == undefined)
        {
            self.h___eof = gml_pos_create(self.h_index, string_count("\n", self.h_code) + 2, 1, self.h_length);
        }
        return self.h___eof;
    };
    
    static h_version = undefined;
    
    static h_to_string = function()
    {
        return "GmlSource(\"" + self.h_name + "\")";
    };
    
    static __class__ = global.mt_gml_source;
    
    if (arg3 == undefined)
    {
        arg3 = false;
    }
    self.h_version = undefined;
    self.h___eof = undefined;
    self.h_index = -1;
    self.h_name = arg0;
    self.h_code = arg1;
    self.h_opt = arg3;
    if (arg2 == undefined)
    {
        arg2 = arg0;
        var l_i = gml_std_string_last_pos_haxe(arg2, "/");
        var l_k = gml_std_string_last_pos_haxe(arg2, "\\");
        if (l_i < 0 || l_k > l_i)
        {
            l_i = l_k;
        }
        l_i = gml_std_string_pos_ext_haxe(arg2, ".");
        if (l_i >= 0)
        {
            arg2 = gml_std_string_substring(arg2, 0, l_i);
        }
    }
    self.h_main = arg2;
    self.h_length = string_length(arg1);
}

function gml_source_init_unknown()
{
    var l_src = new gml_source("unknown", "", undefined, true);
    l_src.h_index = -1;
    l_src.h_version = global.gml_parser_default_version;
    return l_src;
}

function gml_source_init_builtin()
{
    var l_src = new gml_source("built-in", "", undefined, true);
    l_src.h_index = -2;
    l_src.h_version = global.gml_parser_default_version;
    return l_src;
}

function data_gml_keyword_mapper_init_v(arg0)
{
    return [UnknownEnum.Value_11, arg0, 0];
}

function data_gml_keyword_mapper_init_v1(arg0)
{
    return [UnknownEnum.Value_14, arg0, true];
}

function data_gml_keyword_mapper_init_v2(arg0)
{
    return [UnknownEnum.Value_14, arg0, false];
}

function data_gml_keyword_mapper_init_v3(arg0)
{
    return [UnknownEnum.Value_15, arg0, -3, undefined];
}

function data_gml_keyword_mapper_init_v4(arg0)
{
    return [UnknownEnum.Value_15, arg0, -4, undefined];
}

function data_gml_keyword_mapper_init_v5(arg0)
{
    return [UnknownEnum.Value_13, arg0];
}

function data_gml_keyword_mapper_init_v6(arg0)
{
    return [UnknownEnum.Value_25, arg0];
}

function data_gml_keyword_mapper_init_v7(arg0)
{
    return [UnknownEnum.Value_26, arg0];
}

function data_gml_keyword_mapper_init_v8(arg0)
{
    return [UnknownEnum.Value_11, arg0, 1];
}

function data_gml_keyword_mapper_init_v9(arg0)
{
    return [UnknownEnum.Value_11, arg0, 2];
}

function data_gml_keyword_mapper_init_v10(arg0)
{
    return [UnknownEnum.Value_11, arg0, 3];
}

function data_gml_keyword_mapper_init_v11(arg0)
{
    return [UnknownEnum.Value_11, arg0, 4];
}

function data_gml_keyword_mapper_init_v12(arg0)
{
    return [UnknownEnum.Value_11, arg0, 5];
}

function data_gml_keyword_mapper_init_v13(arg0)
{
    return [UnknownEnum.Value_11, arg0, 6];
}

function data_gml_keyword_mapper_init_v14(arg0)
{
    return [UnknownEnum.Value_11, arg0, 7];
}

function data_gml_keyword_mapper_init_v15(arg0)
{
    return [UnknownEnum.Value_11, arg0, 8];
}

function data_gml_keyword_mapper_init_v16(arg0)
{
    return [UnknownEnum.Value_11, arg0, 9];
}

function data_gml_keyword_mapper_init_v17(arg0)
{
    return [UnknownEnum.Value_11, arg0, 14];
}

function data_gml_keyword_mapper_init_v18(arg0)
{
    return [UnknownEnum.Value_11, arg0, 10];
}

function data_gml_keyword_mapper_init_v19(arg0)
{
    return [UnknownEnum.Value_11, arg0, 11];
}

function data_gml_keyword_mapper_init_v20(arg0)
{
    return [UnknownEnum.Value_11, arg0, 13];
}

function data_gml_keyword_mapper_init_v21(arg0)
{
    return [UnknownEnum.Value_11, arg0, 12];
}

function data_gml_keyword_mapper_init_v22(arg0)
{
    return [UnknownEnum.Value_11, arg0, 15];
}

function data_gml_keyword_mapper_init_v23(arg0)
{
    return [UnknownEnum.Value_11, arg0, 19];
}

function data_gml_keyword_mapper_init_v24(arg0)
{
    return [UnknownEnum.Value_11, arg0, 18];
}

function data_gml_keyword_mapper_init_v25(arg0)
{
    return [UnknownEnum.Value_11, arg0, 17];
}

function data_gml_keyword_mapper_init_v26(arg0)
{
    return [UnknownEnum.Value_11, arg0, 16];
}

function data_gml_keyword_mapper_init_v27(arg0)
{
    if (global.gml_parser_curr_version.h_has_try_catch)
    {
        return [UnknownEnum.Value_11, arg0, 21];
    }
    else
    {
        return undefined;
    }
}

function data_gml_keyword_mapper_init_v28(arg0)
{
    if (global.gml_parser_curr_version.h_has_try_catch)
    {
        return [UnknownEnum.Value_11, arg0, 22];
    }
    else
    {
        return undefined;
    }
}

function data_gml_keyword_mapper_init_v29(arg0)
{
    if (global.gml_parser_curr_version.h_has_try_catch)
    {
        return [UnknownEnum.Value_11, arg0, 23];
    }
    else
    {
        return undefined;
    }
}

function data_gml_keyword_mapper_init_v30(arg0)
{
    if (global.gml_parser_curr_version.h_has_constructor)
    {
        return [UnknownEnum.Value_11, arg0, 25];
    }
    else
    {
        return undefined;
    }
}

function data_gml_keyword_mapper_init_v31(arg0)
{
    if (global.gml_parser_curr_version.h_has_delete)
    {
        return [UnknownEnum.Value_11, arg0, 29];
    }
    else
    {
        return undefined;
    }
}

function data_gml_keyword_mapper_init_v32(arg0)
{
    if (global.gml_parser_curr_version.h_has_func_literal)
    {
        return [UnknownEnum.Value_11, arg0, 24];
    }
    else
    {
        return undefined;
    }
}

function data_gml_keyword_mapper_init_v33(arg0)
{
    return [UnknownEnum.Value_19, arg0, 3];
}

function data_gml_keyword_mapper_init_v34(arg0)
{
    return [UnknownEnum.Value_19, arg0, 2];
}

function data_gml_keyword_mapper_init_v35(arg0)
{
    return [UnknownEnum.Value_19, arg0, 80];
}

function data_gml_keyword_mapper_init_v36(arg0)
{
    return [UnknownEnum.Value_19, arg0, 96];
}

function data_gml_keyword_mapper_init_v37(arg0)
{
    return [UnknownEnum.Value_19, arg0, 65];
}

function data_gml_keyword_mapper_init_v38(arg0)
{
    return [UnknownEnum.Value_17, arg0, 1];
}

function data_gml_keyword_mapper_init_v39(arg0)
{
    return [UnknownEnum.Value_11, arg0, 26];
}

function data_gml_keyword_mapper_init_v40(arg0)
{
    return [UnknownEnum.Value_11, arg0, 27];
}

function data_gml_keyword_mapper_init_v41(arg0)
{
    return [UnknownEnum.Value_15, arg0, arg0[1], undefined];
}

function data_gml_keyword_mapper_init()
{
    var l_m = {};
    l_m.global = data_gml_keyword_mapper_init_v;
    l_m.true = data_gml_keyword_mapper_init_v1;
    l_m.false = data_gml_keyword_mapper_init_v2;
    l_m.all = data_gml_keyword_mapper_init_v3;
    l_m.noone = data_gml_keyword_mapper_init_v4;
    l_m.undefined = data_gml_keyword_mapper_init_v5;
    l_m.begin = data_gml_keyword_mapper_init_v6;
    l_m.end = data_gml_keyword_mapper_init_v7;
    l_m.globalvar = data_gml_keyword_mapper_init_v8;
    l_m.var = data_gml_keyword_mapper_init_v9;
    l_m.enum = data_gml_keyword_mapper_init_v10;
    l_m.if = data_gml_keyword_mapper_init_v11;
    l_m.then = data_gml_keyword_mapper_init_v12;
    l_m.else = data_gml_keyword_mapper_init_v13;
    l_m.switch = data_gml_keyword_mapper_init_v14;
    l_m.case = data_gml_keyword_mapper_init_v15;
    l_m.default = data_gml_keyword_mapper_init_v16;
    l_m.for = data_gml_keyword_mapper_init_v17;
    l_m.repeat = data_gml_keyword_mapper_init_v18;
    l_m.while = data_gml_keyword_mapper_init_v19;
    l_m.do = data_gml_keyword_mapper_init_v20;
    l_m.until = data_gml_keyword_mapper_init_v21;
    l_m.with = data_gml_keyword_mapper_init_v22;
    l_m.exit = data_gml_keyword_mapper_init_v23;
    l_m.return = data_gml_keyword_mapper_init_v24;
    l_m.break = data_gml_keyword_mapper_init_v25;
    l_m.continue = data_gml_keyword_mapper_init_v26;
    l_m.try = data_gml_keyword_mapper_init_v27;
    l_m.catch = data_gml_keyword_mapper_init_v28;
    l_m.throw = data_gml_keyword_mapper_init_v29;
    l_m.new = data_gml_keyword_mapper_init_v30;
    l_m.delete = data_gml_keyword_mapper_init_v31;
    l_m.function = data_gml_keyword_mapper_init_v32;
    l_m.div = data_gml_keyword_mapper_init_v33;
    l_m.mod = data_gml_keyword_mapper_init_v34;
    l_m.and = data_gml_keyword_mapper_init_v35;
    l_m.or = data_gml_keyword_mapper_init_v36;
    l_m.xor = data_gml_keyword_mapper_init_v37;
    l_m.not = data_gml_keyword_mapper_init_v38;
    l_m.argument = data_gml_keyword_mapper_init_v39;
    l_m.argument_count = data_gml_keyword_mapper_init_v40;
    l_m._GMLINE_ = data_gml_keyword_mapper_init_v41;
    return l_m;
}

function gml_std_haxe_class(arg0, arg1) constructor
{
    static h_superClass = undefined;
    static h_marker = undefined;
    static h_index = undefined;
    static h_name = undefined;
    static __class__ = "class";
    
    self.h_superClass = undefined;
    self.h_marker = global.gml_std_haxe_type_markerValue;
    self.h_index = arg0;
    self.h_name = arg1;
}

function gml_std_haxe_enum(arg0, arg1, arg2, arg3) constructor
{
    static h_constructors = undefined;
    static h_functions = undefined;
    static h_marker = undefined;
    static h_index = undefined;
    static h_name = undefined;
    static __class__ = "enum";
    
    self.h_marker = global.gml_std_haxe_type_markerValue;
    self.h_index = arg0;
    self.h_name = arg1;
    self.h_constructors = arg2;
    self.h_functions = arg3;
}

function gml_seek_adjfix_proc(arg0, arg1)
{
    var l__g = arg0;
    switch (l__g[0])
    {
        case UnknownEnum.Value_33:
            var l_d = l__g[1];
            var l_x = l__g[2];
            var l_pre = arg0[0] == 33;
            var l_inBlock = gml_node_tools_is_in_block(arg0, ds_list_find_value(arg1, 0));
            if (l_pre || l_inBlock)
            {
                var l__g1 = l_x;
                switch (l__g1[0])
                {
                    case UnknownEnum.Value_85:
                        var l_o = l__g[3] ? 16 : 17;
                        gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_87, l_d, l__g1[2], l__g1[3], l_o, [UnknownEnum.Value_2, l_d, 1, undefined]]);
                        break;
                    case UnknownEnum.Value_82:
                        var l_o = l__g[3] ? 16 : 17;
                        gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_84, l_d, l__g1[2], l__g1[3], l_o, [UnknownEnum.Value_2, l_d, 1, undefined]]);
                        break;
                    case UnknownEnum.Value_88:
                        var l_o = l__g[3] ? 16 : 17;
                        gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_90, l_d, l__g1[2], l__g1[3], l__g1[4], l_o, [UnknownEnum.Value_2, l_d, 1, undefined]]);
                        break;
                    case UnknownEnum.Value_91:
                        var l_o = l__g[3] ? 16 : 17;
                        gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_93, l_d, l__g1[2], l__g1[3], l_o, [UnknownEnum.Value_2, l_d, 1, undefined]]);
                        break;
                    default:
                        if (l_inBlock)
                        {
                            var l_o = l__g[3] ? 16 : 17;
                            gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_37, l_d, l_o, l_x, [UnknownEnum.Value_2, l_d, 1, undefined]]);
                        }
                }
            }
            break;
        case UnknownEnum.Value_34:
            var l_d = l__g[1];
            var l_x = l__g[2];
            var l_b = l__g[3];
            var l_pre = arg0[0] == 33;
            var l_inBlock = gml_node_tools_is_in_block(arg0, ds_list_find_value(arg1, 0));
            if (l_pre || l_inBlock)
            {
                l__g = l_x;
                switch (l__g[0])
                {
                    case UnknownEnum.Value_85:
                        var l_o = l_b ? 16 : 17;
                        gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_87, l_d, l__g[2], l__g[3], l_o, [UnknownEnum.Value_2, l_d, 1, undefined]]);
                        break;
                    case UnknownEnum.Value_82:
                        var l_o = l_b ? 16 : 17;
                        gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_84, l_d, l__g[2], l__g[3], l_o, [UnknownEnum.Value_2, l_d, 1, undefined]]);
                        break;
                    case UnknownEnum.Value_88:
                        var l_o = l_b ? 16 : 17;
                        gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_90, l_d, l__g[2], l__g[3], l__g[4], l_o, [UnknownEnum.Value_2, l_d, 1, undefined]]);
                        break;
                    case UnknownEnum.Value_91:
                        var l_o = l_b ? 16 : 17;
                        gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_93, l_d, l__g[2], l__g[3], l_o, [UnknownEnum.Value_2, l_d, 1, undefined]]);
                        break;
                    default:
                        if (l_inBlock)
                        {
                            var l_o = l_b ? 16 : 17;
                            gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_37, l_d, l_o, l_x, [UnknownEnum.Value_2, l_d, 1, undefined]]);
                        }
                }
            }
            break;
    }
    return gml_node_tools_seek(arg0, arg1, global.gml_program_seek_func);
}

function gml_seek_alarms_check(arg0)
{
    var l__g = arg0;
    if (l__g[0] == 55)
    {
        if (l__g[3] == "alarm")
        {
            return l__g[2];
        }
        else
        {
            return undefined;
        }
    }
    else
    {
        return undefined;
    }
}

function gml_seek_alarms_proc(arg0, arg1)
{
    var l__g = arg0;
    switch (l__g[0])
    {
        case UnknownEnum.Value_70:
            var l_r = gml_seek_alarms_check(l__g[2]);
            if (l_r != undefined)
            {
                gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_67, l__g[1], l_r, l__g[3]]);
            }
            break;
        case UnknownEnum.Value_76:
            var l_r = gml_seek_alarms_check(l__g[2]);
            if (l_r != undefined)
            {
                gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_67, l__g[1], l_r, l__g[3]]);
            }
            break;
    }
    return gml_node_tools_seek(arg0, arg1, global.gml_program_seek_func);
}

function gml_seek_arguments_proc(arg0, arg1)
{
    gml_node_tools_seek(arg0, arg1, global.gml_program_seek_func);
    var l__g = arg0;
    switch (l__g[0])
    {
        case UnknownEnum.Value_20:
            var l_i = l__g[2];
            if (global.gml_program_seek_script.h_arguments <= l_i)
            {
                global.gml_program_seek_script.h_arguments = l_i + 1;
            }
            break;
        case UnknownEnum.Value_21:
            global.gml_program_seek_script.h_uses_args = true;
            break;
    }
    return false;
}

function gml_seek_calls_proc_func(arg0, arg1, arg2, arg3)
{
    var l_fname = arg2.h_name;
    var l_argCount = array_length(arg3);
    var l_minArgs = arg2.h_min_args;
    var l_maxArgs = arg2.h_max_args;
    if (global.live_allow_trailing_args)
    {
        l_maxArgs = 65536;
    }
    if (l_fname == "live_call")
    {
        if (l_argCount != global.gml_program_seek_script.h_arguments)
        {
            global.live_log_script(global.gml_program_seek_script.h_name + " at " + gml_pos_to_string(global.gml_program_seek_script.h_pos, global.gml_program_seek_inst) + " has " + string(global.gml_program_seek_script.h_arguments) + "argument(s), but " + string(l_argCount) + " are passed to live_call (check documentation for more details)", 1);
        }
        else if (global.gml_program_seek_script.h_uses_args && l_argCount == 0)
        {
            global.live_log_script(global.gml_program_seek_script.h_name + " at " + gml_pos_to_string(global.gml_program_seek_script.h_pos, global.gml_program_seek_inst) + " uses argument[], therefore live_call_ext should be used instead of live_call (check documentation for more details)", 1);
        }
    }
    if (l_argCount < l_minArgs || l_argCount > l_maxArgs)
    {
        var l_e;
        if (l_minArgs == l_maxArgs)
        {
            l_e = "`" + l_fname + "` takes " + string(l_minArgs) + " argument";
            if (l_minArgs != 1)
            {
                l_e += "s";
            }
        }
        else if (l_argCount < l_minArgs)
        {
            l_e = "`" + l_fname + "` requires at least " + string(l_minArgs) + " argument";
            if (l_minArgs != 1)
            {
                l_e += "s";
            }
        }
        else
        {
            l_e = "`" + l_fname + "` takes no more than " + string(l_maxArgs) + " argument";
            if (l_maxArgs != 1)
            {
                l_e += "s";
            }
        }
        l_e += (", got " + string(l_argCount));
        return global.gml_program_seek_inst.h_error(l_e, gml_std_haxe_enum_tools_getParameter(arg0, 0));
    }
    gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_29, arg1, arg2, arg3]);
    return false;
}

function gml_seek_calls_proc(arg0, arg1)
{
    var l__g = arg0;
    if (l__g[0] == 23)
    {
        var l_d = l__g[1];
        var l_x = l__g[2];
        var l_args1 = l__g[3];
        l__g = l_x;
        switch (l__g[0])
        {
            case UnknownEnum.Value_17:
                var l_o = l__g[2];
                var l_n = l_o.h_arguments;
                var l_s = l_o.h_name;
                gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_24, l_d, l_s, l_args1]);
                break;
            case UnknownEnum.Value_55:
                gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_28, l_d, l__g[2], l__g[3], l_args1]);
                break;
            case UnknownEnum.Value_13:
                var l_s1 = l__g[2];
                var l_fn = variable_struct_get(global.gml_func_map, l_s1);
                if (l_fn == undefined)
                {
                    if (global.gml_program_seek_inst.h_get_source(l_d[0]).h_version.h_has_value_calls)
                    {
                        gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_26, l_d, l_x, l_args1]);
                    }
                    else
                    {
                        return global.gml_program_seek_inst.h_error("`" + l_s1 + "` is not a function or script", gml_std_haxe_enum_tools_getParameter(l_x, 0));
                    }
                }
                else if (gml_seek_calls_proc_func(arg0, l_d, l_fn, l_args1))
                {
                    return true;
                }
                break;
            case UnknownEnum.Value_18:
                var l_s = l__g[2];
                var l_fn = variable_struct_get(global.gml_func_map, l_s);
                if (l_fn == undefined)
                {
                    if (global.gml_program_seek_inst.h_get_source(l_d[0]).h_version.h_has_value_calls)
                    {
                        gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_26, l_d, l_x, l_args1]);
                    }
                    else
                    {
                        return global.gml_program_seek_inst.h_error("`" + l_s + "` is not a function or script", gml_std_haxe_enum_tools_getParameter(l_x, 0));
                    }
                }
                else if (gml_seek_calls_proc_func(arg0, l_d, l_fn, l_args1))
                {
                    return true;
                }
                break;
            default:
                if (global.gml_program_seek_inst.h_get_source(l_d[0]).h_version.h_has_value_calls)
                {
                    gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_26, l_d, l_x, l_args1]);
                    break;
                }
                return global.gml_program_seek_inst.h_error("Expression is not callable", gml_std_haxe_enum_tools_getParameter(l_x, 0));
        }
    }
    return gml_node_tools_seek(arg0, arg1, global.gml_program_seek_func);
}

function gml_seek_enum_fields_proc_one(arg0, arg1)
{
    var l__g = arg0;
    if (l__g[0] == 55)
    {
        var l_d = l__g[1];
        var l_x = l__g[2];
        var l_f = l__g[3];
        l__g = l_x;
        switch (l__g[0])
        {
            case UnknownEnum.Value_13:
                var l_s = l__g[2];
                var l_e = variable_struct_get(global.gml_program_seek_inst.h_enum_map, l_s);
                if (l_e == undefined)
                {
                    l_e = variable_struct_get(global.gml_enum_map, l_s);
                }
                if (l_e != undefined)
                {
                    if (!l_e.h_has_values)
                    {
                        gml_seek_enum_values_proc_one(l_e);
                    }
                    var l_c = variable_struct_get(l_e.h_ctr_map, l_f);
                    if (l_c != undefined)
                    {
                        if (l_c.h_value == undefined)
                        {
                            return global.gml_program_seek_inst.h_error("Recursive enum reference to " + l_s + "." + l_f, l_d);
                        }
                        gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_2, l_d, l_c.h_value, undefined]);
                        return false;
                    }
                    else
                    {
                        return global.gml_program_seek_inst.h_error("Enum `" + l_s + "` does not contain field `" + l_f + "`", l_d);
                    }
                }
                break;
            case UnknownEnum.Value_18:
                var l_s = l__g[2];
                if (l__g[3] >= global.gml_script_index_offset)
                {
                    gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_52, l_d, l_s, l_f]);
                    return false;
                }
                break;
            case UnknownEnum.Value_17:
                var l_scr = l__g[2];
                if (!l_scr.h_is_constructor && l_scr.h_script_id != -1)
                {
                    gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_52, l_d, l_scr.h_name, l_f]);
                    return false;
                }
                break;
        }
        var l_av = variable_struct_get(global.api_api_var_map, l_f);
        if (l_av != undefined)
        {
            if ((l_av.h_flags & 4) == 0)
            {
                return global.gml_program_seek_inst.h_error("`" + l_f + "` is not an instance-specific variable.", l_d);
            }
        }
    }
    return gml_node_tools_seek(arg0, arg1, gml_seek_enum_fields_proc_one);
}

function gml_seek_enum_fields_proc(arg0, arg1)
{
    return gml_seek_enum_fields_proc_one(arg0, arg1);
}

function gml_seek_enum_values_proc_one(arg0)
{
    arg0.h_has_values = true;
    var l_next = 0;
    var l__g = 0;
    var l__g1 = arg0.h_ctr_list;
    while (l__g < array_length(l__g1))
    {
        var l_c = l__g1[l__g];
        l__g++;
        if (l_c.h_node != undefined)
        {
            var l_st = ds_list_create();
            var l__seekFunc = global.gml_program_seek_func;
            global.gml_program_seek_func = gml_seek_idents_proc;
            global.gml_program_seek_script = undefined;
            gml_seek_idents_proc(l_c.h_node, l_st);
            global.gml_program_seek_func = l__seekFunc;
            ds_list_destroy(l_st);
            gml_seek_enum_fields_proc_one(l_c.h_node, undefined);
            gml_seek_eval_eval(l_c.h_node);
            var l_node = l_c.h_node;
            var l_v = gml_seek_eval_node_to_value(l_node);
            if (is_numeric(l_v))
            {
                l_c.h_value = floor(l_v);
                l_next = l_c.h_value + 1;
            }
            else if (l_v != global.gml_seek_eval_invalid_value)
            {
                return global.gml_program_seek_inst.h_error("Enum values should be integer", gml_std_haxe_enum_tools_getParameter(l_node, 0));
            }
            else
            {
                return global.gml_program_seek_inst.h_error("Enum values should be constant" + global.g_gml_node_constructors[l_node[0]], gml_std_haxe_enum_tools_getParameter(l_c.h_node, 0));
            }
        }
        else
        {
            l_c.h_value = l_next++;
        }
    }
    return false;
}

function gml_seek_enum_values_proc()
{
    var l__g = 0;
    var l__g1 = global.gml_program_seek_inst.h_enum_array;
    while (l__g < array_length(l__g1))
    {
        var l_e = l__g1[l__g];
        l__g++;
        if (gml_seek_enum_values_proc_one(l_e))
        {
            return true;
        }
    }
    return false;
}

function gml_seek_eval_node_to_value(arg0)
{
    var l__g = arg0;
    switch (l__g[0])
    {
        case UnknownEnum.Value_0:
            return undefined;
        case UnknownEnum.Value_2:
            return l__g[2];
        case UnknownEnum.Value_3:
            return l__g[2];
        case UnknownEnum.Value_19:
            return variable_struct_get(global.gml_const_val, l__g[2]);
        case UnknownEnum.Value_5:
            return l__g[3].h_value;
        case UnknownEnum.Value_18:
            return l__g[3];
        default:
            return global.gml_seek_eval_invalid_value;
    }
}

function gml_seek_eval_value_to_node(arg0, arg1)
{
    if (is_bool(arg0))
    {
        return [UnknownEnum.Value_1, arg1, arg0];
    }
    if (is_numeric(arg0))
    {
        return [UnknownEnum.Value_2, arg1, arg0, undefined];
    }
    if (is_string(arg0))
    {
        return [UnknownEnum.Value_3, arg1, arg0];
    }
    if (arg0 == undefined)
    {
        return [UnknownEnum.Value_0, arg1];
    }
    if (is_ptr(arg0))
    {
        return [UnknownEnum.Value_4, arg1, arg0];
    }
    return undefined;
}

function gml_seek_eval_proc(arg0, arg1)
{
    var l_z = true;
    var l__g = arg0;
    switch (l__g[0])
    {
        case UnknownEnum.Value_0:
            break;
        case UnknownEnum.Value_2:
            break;
        case UnknownEnum.Value_3:
            break;
        case UnknownEnum.Value_19:
            break;
        case UnknownEnum.Value_36:
            var l__g2 = l__g[2];
            if (l__g2 == 16)
            {
                var l_d = l__g[1];
                var l_a = l__g[3];
                var l_b = l__g[4];
                if (gml_seek_eval_proc(l_a, arg1))
                {
                    l_z = false;
                }
                if (gml_seek_eval_proc(l_b, arg1))
                {
                    l_z = false;
                }
                if (l_z)
                {
                    var l_v1 = gml_seek_eval_node_to_value(l_a);
                    var l_v2 = gml_seek_eval_node_to_value(l_b);
                    if (is_string(l_v1))
                    {
                        if (is_string(l_v2))
                        {
                            gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_3, l_d, l_v1 + l_v2]);
                        }
                        else
                        {
                            l__g = l_b;
                            if (l__g[0] == 36)
                            {
                                if (l__g[2] == 16)
                                {
                                    var l__hx_tmp = l__g[3];
                                    if (l__hx_tmp[0] == 3)
                                    {
                                        gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_36, l_d, 16, [UnknownEnum.Value_3, l_d, l_v1 + l__hx_tmp[2]], l__g[4]]);
                                    }
                                    else
                                    {
                                        global.gml_seek_eval_error_text = "Can't add " + gml_std_Type_enumConstructor(l_a) + " and " + gml_std_Type_enumConstructor(l_b) + " at compile time";
                                        global.gml_seek_eval_error_pos = gml_std_haxe_enum_tools_getParameter(arg0, 0);
                                        l_z = false;
                                    }
                                }
                                else
                                {
                                    global.gml_seek_eval_error_text = "Can't add " + gml_std_Type_enumConstructor(l_a) + " and " + gml_std_Type_enumConstructor(l_b) + " at compile time";
                                    global.gml_seek_eval_error_pos = gml_std_haxe_enum_tools_getParameter(arg0, 0);
                                    l_z = false;
                                }
                            }
                            else
                            {
                                global.gml_seek_eval_error_text = "Can't add " + gml_std_Type_enumConstructor(l_a) + " and " + gml_std_Type_enumConstructor(l_b) + " at compile time";
                                global.gml_seek_eval_error_pos = gml_std_haxe_enum_tools_getParameter(arg0, 0);
                                l_z = false;
                            }
                        }
                    }
                    else if (is_numeric(l_v1))
                    {
                        if (is_numeric(l_v2))
                        {
                            gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_2, l_d, l_v1 + l_v2, undefined]);
                        }
                        else
                        {
                            global.gml_seek_eval_error_text = "Can't add " + gml_std_Type_enumConstructor(l_a) + " and " + gml_std_Type_enumConstructor(l_b) + " at compile time";
                            global.gml_seek_eval_error_pos = gml_std_haxe_enum_tools_getParameter(arg0, 0);
                            l_z = false;
                        }
                    }
                    else if (is_string(l_v2))
                    {
                        l__g = l_a;
                        if (l__g[0] == 36)
                        {
                            if (l__g[2] == 16)
                            {
                                var l__hx_tmp = l__g[4];
                                if (l__hx_tmp[0] == 3)
                                {
                                    gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_36, l_d, 16, l__g[3], [UnknownEnum.Value_3, l_d, l__hx_tmp[2] + l_v2]]);
                                }
                                else
                                {
                                    global.gml_seek_eval_error_text = "Can't add " + gml_std_Type_enumConstructor(l_a) + " and " + gml_std_Type_enumConstructor(l_b) + " at compile time";
                                    global.gml_seek_eval_error_pos = gml_std_haxe_enum_tools_getParameter(arg0, 0);
                                    l_z = false;
                                }
                            }
                            else
                            {
                                global.gml_seek_eval_error_text = "Can't add " + gml_std_Type_enumConstructor(l_a) + " and " + gml_std_Type_enumConstructor(l_b) + " at compile time";
                                global.gml_seek_eval_error_pos = gml_std_haxe_enum_tools_getParameter(arg0, 0);
                                l_z = false;
                            }
                        }
                        else
                        {
                            global.gml_seek_eval_error_text = "Can't add " + gml_std_Type_enumConstructor(l_a) + " and " + gml_std_Type_enumConstructor(l_b) + " at compile time";
                            global.gml_seek_eval_error_pos = gml_std_haxe_enum_tools_getParameter(arg0, 0);
                            l_z = false;
                        }
                    }
                    else
                    {
                        global.gml_seek_eval_error_text = "Can't add " + gml_std_Type_enumConstructor(l_a) + " and " + gml_std_Type_enumConstructor(l_b) + " at compile time";
                        global.gml_seek_eval_error_pos = gml_std_haxe_enum_tools_getParameter(arg0, 0);
                        l_z = false;
                    }
                }
            }
            else
            {
                var l_o = l__g2;
                var l_d = l__g[1];
                var l_a1 = l__g[3];
                var l_b1 = l__g[4];
                if (gml_seek_eval_proc(l_a1, arg1))
                {
                    l_z = false;
                }
                if (gml_seek_eval_proc(l_b1, arg1))
                {
                    l_z = false;
                }
                if (l_z)
                {
                    var l_v1 = gml_seek_eval_node_to_value(l_a1);
                    var l_v2 = gml_seek_eval_node_to_value(l_b1);
                    if (is_numeric(l_v1) && is_numeric(l_v2))
                    {
                        var l_f1 = l_v1;
                        var l_f2 = l_v2;
                        switch (l_o)
                        {
                            case 16:
                                l_f1 += l_f2;
                                break;
                            case 17:
                                l_f1 -= l_f2;
                                break;
                            case 0:
                                l_f1 *= l_f2;
                                break;
                            case 1:
                                l_f1 /= l_f2;
                                break;
                            case 2:
                                l_f1 %= l_f2;
                                break;
                            case 3:
                                if (l_f2 == 0 && is_int64(l_f2) && is_int64(l_f1))
                                {
                                    show_error("Division by zero", true);
                                }
                                l_f1 = l_f1 div l_f2;
                                break;
                            case 49:
                                l_f1 = l_f1 & l_f2;
                                break;
                            case 48:
                                l_f1 = l_f1 | l_f2;
                                break;
                            case 50:
                                l_f1 = l_f1 ^ l_f2;
                                break;
                            case 32:
                                l_f1 = l_f1 << l_f2;
                                break;
                            case 33:
                                l_f1 = l_f1 >> l_f2;
                                break;
                            case 64:
                                l_f1 = l_f1 == l_f2;
                                break;
                            case 65:
                                l_f1 = l_f1 != l_f2;
                                break;
                            case 67:
                                l_f1 = l_f1 <= l_f2;
                                break;
                            case 69:
                                l_f1 = l_f1 >= l_f2;
                                break;
                            case 66:
                                l_f1 = l_f1 < l_f2;
                                break;
                            case 68:
                                l_f1 = l_f1 > l_f2;
                                break;
                            case 80:
                                l_f1 = l_f1 && l_f2;
                                break;
                            case 96:
                                l_f1 = l_f1 || l_f2;
                                break;
                            default:
                                global.gml_seek_eval_error_text = "Can't apply " + gml_op_get_name(l_o);
                                global.gml_seek_eval_error_pos = gml_std_haxe_enum_tools_getParameter(arg0, 0);
                                l_z = false;
                        }
                        if (l_z)
                        {
                            gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_2, l_d, l_f1, undefined]);
                        }
                    }
                    else
                    {
                        global.gml_seek_eval_error_text = "Can't apply " + gml_op_get_name(l_o) + " to " + gml_std_Type_enumConstructor(l_a1) + " and " + gml_std_Type_enumConstructor(l_b1);
                        global.gml_seek_eval_error_pos = gml_std_haxe_enum_tools_getParameter(arg0, 0);
                        l_z = false;
                    }
                }
            }
            break;
        case UnknownEnum.Value_29:
            var l_fn = l__g[2];
            var l_args1 = l__g[3];
            var l_n = array_length(l_args1);
            for (var l_i = 0; l_i < l_n; l_i++)
            {
                if (gml_seek_eval_proc(l_args1[l_i], arg1))
                {
                    l_z = false;
                }
            }
            if (l_z && l_fn.h_is_const)
            {
                var l_evalArgs = array_create(l_n);
                var l_i = 0;
                while (l_i < l_n)
                {
                    var l_val = gml_seek_eval_node_to_value(l_args1[l_i]);
                    if (l_val != global.gml_seek_eval_invalid_value)
                    {
                        array_set(l_evalArgs, l_i, l_val);
                        l_i++;
                    }
                    else
                    {
                        break;
                    }
                }
                if (l_i >= l_n)
                {
                    var l_th = global.gml_seek_eval_eval_thread;
                    if (l_th == undefined)
                    {
                        l_th = new gml_thread(global.gml_program_seek_inst, global.gml_seek_eval_eval_actions, array_create(0), array_create(0), undefined, undefined, 0);
                        global.gml_seek_eval_eval_thread = l_th;
                    }
                    var l_th0 = global.gml_thread_current;
                    global.gml_thread_current = l_th;
                    l_th.h_status = 1;
                    var l_fn1 = l_fn.h_func;
                    var l_val = (l_n < 81) ? script_execute(global.vm_gml_thread_exec_slice_funcs[l_n], l_fn1, l_evalArgs, 0) : vm_gml_thread_exec_slice_longcall(l_fn1, l_evalArgs, 0, l_n);
                    global.gml_thread_current = l_th0;
                    if (l_th.h_status != 4)
                    {
                        var l_next = gml_seek_eval_value_to_node(l_val, gml_std_haxe_enum_tools_getParameter(arg0, 0));
                        if (l_next != undefined)
                        {
                            gml_std_haxe_enum_tools_setTo(arg0, l_next);
                        }
                        else
                        {
                            global.gml_seek_eval_error_text = "Could not translate " + gml_value_print(l_val) + " (" + gml_value_get_type(l_val) + ") compile-time";
                            global.gml_seek_eval_error_pos = gml_std_haxe_enum_tools_getParameter(arg0, 0);
                        }
                    }
                    else
                    {
                        global.gml_seek_eval_error_text = "Could not evaluate compile-time: " + l_th.h_error_text;
                        global.gml_seek_eval_error_pos = gml_std_haxe_enum_tools_getParameter(arg0, 0);
                    }
                }
            }
            break;
        default:
            if (global.gml_seek_eval_eval_rec)
            {
                if (gml_node_tools_seek(arg0, arg1, gml_seek_eval_proc))
                {
                    l_z = false;
                }
                break;
            }
            global.gml_seek_eval_error_text = gml_std_Type_enumConstructor(arg0) + " doesn't seem to be a constant expression.";
            global.gml_seek_eval_error_pos = gml_std_haxe_enum_tools_getParameter(arg0, 0);
            l_z = false;
    }
    return !l_z;
}

function gml_seek_eval_eval(arg0)
{
    global.gml_seek_eval_eval_rec = false;
    var l_r = gml_seek_eval_proc(arg0, undefined);
    global.gml_seek_eval_eval_thread = undefined;
    return l_r;
}

function gml_seek_eval_opt()
{
    global.gml_seek_eval_eval_rec = true;
    global.gml_program_seek_inst.h_seek(gml_seek_eval_proc);
    global.gml_seek_eval_eval_thread = undefined;
    return false;
}

function gml_seek_fields_proc(arg0, arg1)
{
    var l__g = arg0;
    if (l__g[0] == 55)
    {
        var l_d = l__g[1];
        var l_x = l__g[2];
        var l_s = l__g[3];
        if (l_x[0] == 16)
        {
            gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_49, l_d, l_s]);
        }
    }
    return gml_node_tools_seek(arg0, arg1, global.gml_program_seek_func);
}

function gml_seek_idents_proc(arg0, arg1)
{
    var l__g = arg0;
    var l_d, l_s;
    if (l__g[0] == 13)
    {
        l_d = l__g[1];
        l_s = l__g[2];
    }
    else
    {
        l_d = undefined;
        l_s = undefined;
    }
    if (l_d != undefined)
    {
        for (var l__ = 0; l__ < 1; l__++)
        {
            var l_scr = global.gml_program_seek_script;
            if (l_scr != undefined)
            {
                var l_i = variable_struct_get(l_scr.h_named_args, l_s);
                if (l_i != undefined)
                {
                    gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_20, l_d, l_i]);
                    continue;
                }
                l_i = variable_struct_get(l_scr.h_local_map, l_s);
                if (l_i != undefined)
                {
                    gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_43, l_d, l_s]);
                    continue;
                }
                l_i = variable_struct_get(l_scr.h_static_map, l_s);
                if (l_i != undefined)
                {
                    gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_46, l_d, l_s]);
                    continue;
                }
            }
            var l_mcr = variable_struct_get(global.gml_program_seek_inst.h_macro_map, l_s);
            if (l_mcr != undefined)
            {
                gml_std_haxe_enum_tools_setTo(arg0, gml_node_tools_clone(l_mcr.h_node));
                ast_gml_node_tools_ni_concat_pos_rec(arg0, l_d);
                gml_seek_idents_proc(arg0, arg1);
            }
            else if (variable_struct_get(global.gml_const_map, l_s) == true)
            {
                var l_val = variable_struct_get(global.gml_const_val, l_s);
                var l_valNode = gml_seek_eval_value_to_node(l_val, l_d);
                if (l_valNode != undefined)
                {
                    gml_std_haxe_enum_tools_setTo(arg0, l_valNode);
                }
                else
                {
                    return global.gml_program_seek_inst.h_error("Cannot create a node for `" + l_s + "` (" + typeof(l_val) + ")", l_d);
                }
            }
            else
            {
                var l_v = variable_struct_get(global.api_api_var_map, l_s);
                if (l_v != undefined)
                {
                    var l_flags = l_v.h_flags;
                    if ((l_flags & 4) != 0)
                    {
                        gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_61, l_d, [UnknownEnum.Value_14, l_d], l_v]);
                    }
                    else
                    {
                        gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_58, l_d, l_v]);
                    }
                    if (ds_list_size(arg1) > 0)
                    {
                        var l__g1 = ds_list_find_value(arg1, 0);
                        switch (l__g1[0])
                        {
                            case UnknownEnum.Value_70:
                                var l_d1 = l__g1[1];
                                var l_k = l__g1[3];
                                if ((l_flags & 2) != 0)
                                {
                                    gml_std_haxe_enum_tools_setTo(ds_list_find_value(arg1, 0), [UnknownEnum.Value_64, l_d1, l_v, l_k]);
                                }
                                else
                                {
                                    return global.gml_program_seek_inst.h_error("`" + l_s + "` is not an array.", l_d1);
                                }
                                break;
                            case UnknownEnum.Value_73:
                                return global.gml_program_seek_inst.h_error("`" + l_s + "` is not a 2d array.", l__g1[1]);
                            default:
                                if ((l_flags & 2) != 0)
                                {
                                    gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_64, l_d, l_v, [UnknownEnum.Value_2, l_d, 0, undefined]]);
                                }
                        }
                    }
                }
                else
                {
                    var l_scr1 = variable_struct_get(global.gml_program_seek_inst.h_script_map, l_s);
                    if (l_scr1 != undefined)
                    {
                        gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_17, l_d, l_scr1]);
                    }
                    else
                    {
                        var l_fscr = variable_struct_get(global.gml_func_script_id, l_s);
                        if (l_fscr != undefined)
                        {
                            gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_18, l_d, l_s, l_fscr]);
                        }
                        else
                        {
                            var l_fn = variable_struct_get(global.gml_func_map, l_s);
                            if (l_fn != undefined)
                            {
                                gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_18, l_d, l_s, l_fn.h_raw_func]);
                            }
                            else
                            {
                            }
                        }
                    }
                }
            }
        }
    }
    return gml_node_tools_seek(arg0, arg1, global.gml_program_seek_func);
}

function gml_seek_locals_proc(arg0, arg1)
{
    var l__g = arg0;
    switch (l__g[0])
    {
        case UnknownEnum.Value_94:
            var l_s = l__g[2];
            if (!variable_struct_exists(global.gml_program_seek_script.h_local_map, l_s))
            {
                variable_struct_set(global.gml_program_seek_script.h_local_map, l_s, global.gml_program_seek_script.h_locals++);
                array_push(global.gml_program_seek_script.h_local_names, l_s);
            }
            break;
        case UnknownEnum.Value_113:
            var l_s = l__g[3];
            if (!variable_struct_exists(global.gml_program_seek_script.h_local_map, l_s))
            {
                variable_struct_set(global.gml_program_seek_script.h_local_map, l_s, global.gml_program_seek_script.h_locals++);
                array_push(global.gml_program_seek_script.h_local_names, l_s);
            }
            break;
    }
    return gml_node_tools_seek(arg0, arg1, global.gml_program_seek_func);
}

function gml_seek_self_fields_proc(arg0, arg1)
{
    var l__g = arg0;
    if (l__g[0] == 13)
    {
        var l_d = l__g[1];
        gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_55, l_d, [UnknownEnum.Value_14, l_d], l__g[2]]);
    }
    return gml_node_tools_seek(arg0, arg1, global.gml_program_seek_func);
}

function gml_seek_set_op_resolve_set_op_rfn(arg0, arg1)
{
    var l__g = arg0;
    switch (l__g[0])
    {
        case UnknownEnum.Value_71:
            if (gml_node_tools_equals(global.gml_seek_set_op_resolve_set_op_xw, l__g[2]))
            {
                global.gml_seek_set_op_resolve_set_op_safe = true;
                return true;
            }
            break;
        case UnknownEnum.Value_72:
            if (gml_node_tools_equals(global.gml_seek_set_op_resolve_set_op_xw, l__g[2]))
            {
                global.gml_seek_set_op_resolve_set_op_safe = true;
                return true;
            }
            break;
        case UnknownEnum.Value_74:
            if (gml_node_tools_equals(global.gml_seek_set_op_resolve_set_op_xw, l__g[2]))
            {
                global.gml_seek_set_op_resolve_set_op_safe = true;
                return true;
            }
            break;
        case UnknownEnum.Value_75:
            if (gml_node_tools_equals(global.gml_seek_set_op_resolve_set_op_xw, l__g[2]))
            {
                global.gml_seek_set_op_resolve_set_op_safe = true;
                return true;
            }
            break;
        case UnknownEnum.Value_37:
            var l_x2 = l__g[3];
            var l_v2 = l__g[4];
            if (gml_node_tools_equals(global.gml_seek_set_op_resolve_set_op_xw, l_x2))
            {
                var l__g1 = l_v2;
                global.gml_seek_set_op_resolve_set_op_safe = l__g1[0] == 6;
                return true;
            }
            break;
    }
    return gml_node_tools_seek_all(arg0, arg1, gml_seek_set_op_resolve_set_op_rfn, global.gml_program_seek_inst);
}

function gml_seek_set_op_proc(arg0, arg1)
{
    var l__g = arg0;
    if (l__g[0] == 37)
    {
        var l_d = l__g[1];
        var l_o = l__g[2];
        var l_x = l__g[3];
        var l_v = l__g[4];
        var l_xu = gml_node_tools_unpack(l_x);
        l__g = l_xu;
        switch (l__g[0])
        {
            case UnknownEnum.Value_43:
                var l_s = l__g[2];
                if (l_o != -1)
                {
                    gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_45, l_d, l_s, l_o, l_v]);
                }
                else
                {
                    gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_44, l_d, l_s, l_v]);
                }
                break;
            case UnknownEnum.Value_46:
                var l_s = l__g[2];
                if (l_o != -1)
                {
                    gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_48, l_d, l_s, l_o, l_v]);
                }
                else
                {
                    gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_47, l_d, l_s, l_v, false]);
                }
                break;
            case UnknownEnum.Value_49:
                var l_s = l__g[2];
                if (l_o != -1)
                {
                    gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_51, l_d, l_s, l_o, l_v]);
                }
                else
                {
                    gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_50, l_d, l_s, l_v]);
                }
                break;
            case UnknownEnum.Value_20:
                break;
            case UnknownEnum.Value_21:
                break;
            case UnknownEnum.Value_55:
                var l_x1 = l__g[2];
                var l_s = l__g[3];
                if (l_o != -1)
                {
                    gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_57, l_d, l_x1, l_s, l_o, l_v]);
                }
                else
                {
                    gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_56, l_d, l_x1, l_s, l_v]);
                }
                break;
            case UnknownEnum.Value_67:
                var l_x1 = l__g[2];
                var l_i = l__g[3];
                if (l_o != -1)
                {
                    gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_69, l_d, l_x1, l_i, l_o, l_v]);
                }
                else
                {
                    gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_68, l_d, l_x1, l_i, l_v]);
                }
                break;
            case UnknownEnum.Value_70:
                var l_xd = l__g[1];
                var l_xw = l__g[2];
                var l__g1 = l_x;
                switch (l__g1[0])
                {
                    case UnknownEnum.Value_70:
                        var l_xi = l__g1[3];
                        if (l_o != -1)
                        {
                            gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_72, l_xd, l_xw, l_xi, l_o, l_v]);
                        }
                        else
                        {
                            gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_71, l_xd, l_xw, l_xi, l_v]);
                        }
                        break;
                    case UnknownEnum.Value_73:
                        var l_i1 = l__g1[3];
                        var l_i2 = l__g1[4];
                        if (l_o != -1)
                        {
                            gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_75, l_xd, l_xw, l_i1, l_i2, l_o, l_v]);
                        }
                        else
                        {
                            gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_74, l_xd, l_xw, l_i1, l_i2, l_v]);
                        }
                        break;
                }
                global.gml_seek_set_op_resolve_set_op_safe = false;
                global.gml_seek_set_op_resolve_set_op_xw = l_xw;
                gml_node_tools_seek_all_out(arg0, arg1, gml_seek_set_op_resolve_set_op_rfn, 0, global.gml_program_seek_inst);
                var l_expr = l_xw;
                while (l_expr != undefined)
                {
                    l__g1 = l_expr;
                    switch (l__g1[0])
                    {
                        case UnknownEnum.Value_43:
                            gml_std_haxe_enum_tools_setTo(l_expr, [UnknownEnum.Value_8, l__g1[1], l__g1[2]]);
                            l_expr = undefined;
                            break;
                        case UnknownEnum.Value_49:
                            gml_std_haxe_enum_tools_setTo(l_expr, [UnknownEnum.Value_9, l__g1[1], l__g1[2]]);
                            l_expr = undefined;
                            break;
                        case UnknownEnum.Value_55:
                            gml_std_haxe_enum_tools_setTo(l_expr, [UnknownEnum.Value_10, l__g1[1], l__g1[2], l__g1[3]]);
                            l_expr = undefined;
                            break;
                        case UnknownEnum.Value_70:
                            var l_x2 = l__g1[2];
                            gml_std_haxe_enum_tools_setTo(l_expr, [UnknownEnum.Value_11, l__g1[1], l_x2, l__g1[3]]);
                            l_expr = l_x2;
                            break;
                        case UnknownEnum.Value_73:
                            var l_x3 = l__g1[2];
                            gml_std_haxe_enum_tools_setTo(l_expr, [UnknownEnum.Value_12, l__g1[1], l_x3, l__g1[3], l__g1[4]]);
                            l_expr = l_x3;
                            break;
                        default:
                            l_expr = undefined;
                    }
                }
                break;
            case UnknownEnum.Value_73:
                var l_xd = l__g[1];
                var l_xw = l__g[2];
                var l__g1 = l_x;
                switch (l__g1[0])
                {
                    case UnknownEnum.Value_70:
                        var l_xi = l__g1[3];
                        if (l_o != -1)
                        {
                            gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_72, l_xd, l_xw, l_xi, l_o, l_v]);
                        }
                        else
                        {
                            gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_71, l_xd, l_xw, l_xi, l_v]);
                        }
                        break;
                    case UnknownEnum.Value_73:
                        var l_i1 = l__g1[3];
                        var l_i2 = l__g1[4];
                        if (l_o != -1)
                        {
                            gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_75, l_xd, l_xw, l_i1, l_i2, l_o, l_v]);
                        }
                        else
                        {
                            gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_74, l_xd, l_xw, l_i1, l_i2, l_v]);
                        }
                        break;
                }
                global.gml_seek_set_op_resolve_set_op_safe = false;
                global.gml_seek_set_op_resolve_set_op_xw = l_xw;
                gml_node_tools_seek_all_out(arg0, arg1, gml_seek_set_op_resolve_set_op_rfn, 0, global.gml_program_seek_inst);
                var l_expr = l_xw;
                while (l_expr != undefined)
                {
                    l__g1 = l_expr;
                    switch (l__g1[0])
                    {
                        case UnknownEnum.Value_43:
                            gml_std_haxe_enum_tools_setTo(l_expr, [UnknownEnum.Value_8, l__g1[1], l__g1[2]]);
                            l_expr = undefined;
                            break;
                        case UnknownEnum.Value_49:
                            gml_std_haxe_enum_tools_setTo(l_expr, [UnknownEnum.Value_9, l__g1[1], l__g1[2]]);
                            l_expr = undefined;
                            break;
                        case UnknownEnum.Value_55:
                            gml_std_haxe_enum_tools_setTo(l_expr, [UnknownEnum.Value_10, l__g1[1], l__g1[2], l__g1[3]]);
                            l_expr = undefined;
                            break;
                        case UnknownEnum.Value_70:
                            var l_x2 = l__g1[2];
                            gml_std_haxe_enum_tools_setTo(l_expr, [UnknownEnum.Value_11, l__g1[1], l_x2, l__g1[3]]);
                            l_expr = l_x2;
                            break;
                        case UnknownEnum.Value_73:
                            var l_x3 = l__g1[2];
                            gml_std_haxe_enum_tools_setTo(l_expr, [UnknownEnum.Value_12, l__g1[1], l_x3, l__g1[3], l__g1[4]]);
                            l_expr = l_x3;
                            break;
                        default:
                            l_expr = undefined;
                    }
                }
                break;
            case UnknownEnum.Value_58:
                var l_av = l__g[2];
                var l_f = l_av.h_flags;
                if ((l_f & 1) == 0)
                {
                    if ((l_f & 2) != 0)
                    {
                        var l_k = [UnknownEnum.Value_2, l_d, 0, undefined];
                        if (l_o != -1)
                        {
                            gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_66, l_d, l_av, l_k, l_o, l_v]);
                        }
                        else
                        {
                            gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_65, l_d, l_av, l_k, l_v]);
                        }
                    }
                    else if (l_o != -1)
                    {
                        gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_60, l_d, l_av, l_o, l_v]);
                    }
                    else
                    {
                        gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_59, l_d, l_av, l_v]);
                    }
                }
                else
                {
                    return global.gml_program_seek_inst.h_error("`" + l_av.h_name + "` is read-only", l__g[1]);
                }
                break;
            case UnknownEnum.Value_52:
                if (l_o != -1)
                {
                    gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_54, l_d, l__g[2], l__g[3], l_o, l_v]);
                }
                else
                {
                    gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_53, l_d, l__g[2], l__g[3], l_v]);
                }
                break;
            case UnknownEnum.Value_61:
                var l_av = l__g[3];
                if ((l_av.h_flags & 1) == 0)
                {
                    if (l_o != -1)
                    {
                        gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_63, l_d, l__g[2], l_av, l_o, l_v]);
                    }
                    else
                    {
                        gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_62, l_d, l__g[2], l_av, l_v]);
                    }
                }
                else
                {
                    return global.gml_program_seek_inst.h_error("`" + l_av.h_name + "` is read-only", l__g[1]);
                }
                break;
            case UnknownEnum.Value_64:
                var l_av = l__g[2];
                if ((l_av.h_flags & 1) == 0)
                {
                    if (l_o != -1)
                    {
                        gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_66, l_d, l_av, l__g[3], l_o, l_v]);
                    }
                    else
                    {
                        gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_65, l_d, l_av, l__g[3], l_v]);
                    }
                }
                else
                {
                    return global.gml_program_seek_inst.h_error("`" + l_av.h_name + "` is read-only", l__g[1]);
                }
                break;
            case UnknownEnum.Value_82:
                var l_x1 = l__g[2];
                var l_k = l__g[3];
                if (l_o != -1)
                {
                    gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_84, l_d, l_x1, l_k, l_o, l_v]);
                }
                else
                {
                    gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_83, l_d, l_x1, l_k, l_v]);
                }
                break;
            case UnknownEnum.Value_85:
                var l_x1 = l__g[2];
                var l_k = l__g[3];
                if (l_o != -1)
                {
                    gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_87, l_d, l_x1, l_k, l_o, l_v]);
                }
                else
                {
                    gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_86, l_d, l_x1, l_k, l_v]);
                }
                break;
            case UnknownEnum.Value_88:
                var l_x1 = l__g[2];
                var l_i = l__g[3];
                var l_k = l__g[4];
                if (l_o != -1)
                {
                    gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_90, l_d, l_x1, l_i, l_k, l_o, l_v]);
                }
                else
                {
                    gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_89, l_d, l_x1, l_i, l_k, l_v]);
                }
                break;
            case UnknownEnum.Value_76:
                var l_x1 = l__g[2];
                var l_k = l__g[3];
                if (l_o != -1)
                {
                    gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_78, l_d, l_x1, l_k, l_o, l_v]);
                }
                else
                {
                    gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_77, l_d, l_x1, l_k, l_v]);
                }
                break;
            case UnknownEnum.Value_79:
                var l_x1 = l__g[2];
                var l_i = l__g[3];
                var l_k = l__g[4];
                if (l_o != -1)
                {
                    gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_81, l_d, l_x1, l_i, l_k, l_o, l_v]);
                }
                else
                {
                    gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_80, l_d, l_x1, l_i, l_k, l_v]);
                }
                break;
            case UnknownEnum.Value_91:
                var l_x1 = l__g[2];
                var l_k = l__g[3];
                if (l_o != -1)
                {
                    gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_93, l_d, l_x1, l_k, l_o, l_v]);
                }
                else
                {
                    gml_std_haxe_enum_tools_setTo(arg0, [UnknownEnum.Value_92, l_d, l_x1, l_k, l_v]);
                }
                break;
            default:
                return global.gml_program_seek_inst.h_error("Expression (" + global.g_gml_node_constructors[l_xu[0]] + ") is not settable", gml_std_haxe_enum_tools_getParameter(l_x, 0));
        }
    }
    return gml_node_tools_seek(arg0, arg1, global.gml_program_seek_func);
}

function gml_std_gml_internal_ArrayImpl_shift(arg0)
{
    if (array_length(arg0) == 0)
    {
        return undefined;
    }
    var l_result = arg0[0];
    array_delete(arg0, 0, 1);
    return l_result;
}

function gml_std_gml_internal_ArrayImpl_splice(arg0, arg1, arg2)
{
    if (arg1 < 0)
    {
        arg1 += array_length(arg0);
        if (arg1 < 0)
        {
            arg1 = 0;
        }
    }
    var l_n = array_length(arg0);
    if ((arg1 + arg2) > l_n)
    {
        arg2 = l_n - arg1;
    }
    if (arg2 <= 0)
    {
        return [];
    }
    var l_r = array_create(arg2);
    array_copy(l_r, 0, arg0, arg1, arg2);
    array_delete(arg0, arg1, arg2);
    return l_r;
}

function gml_std_gml_internal_ArrayImpl_indexOf(arg0, arg1, arg2 = 0)
{
    var l_len = array_length(arg0);
    if (arg2 < 0)
    {
        arg2 += l_len;
        if (arg2 < 0)
        {
            arg2 = 0;
        }
    }
    while (arg2 < l_len)
    {
        if (arg0[arg2] == arg1)
        {
            return arg2;
        }
        arg2++;
    }
    return -1;
}

function gml_std_gml_internal_ArrayImpl_concatFront(arg0, arg1)
{
    if (!is_array(arg0))
    {
        return [arg1];
    }
    var l_n = array_length(arg0);
    var l_res = array_create(1 + l_n);
    array_set(l_res, 0, arg1);
    array_copy(l_res, 1, arg0, 0, l_n);
    return l_res;
}

function gml_std_gml_internal_ArrayImpl_join(arg0, arg1)
{
    var l_len = array_length(arg0);
    if (l_len == 0)
    {
        return "";
    }
    var l_buf = global.gml_std_gml_internal_ArrayImpl_join_buf;
    if (l_buf == undefined)
    {
        l_buf = buffer_create(1024, buffer_grow, 1);
        global.gml_std_gml_internal_ArrayImpl_join_buf = l_buf;
    }
    buffer_seek(l_buf, buffer_seek_start, 0);
    buffer_write(l_buf, buffer_text, gml_std_Std_stringify(arg0[0]));
    for (var l_i = 1; l_i < l_len; l_i++)
    {
        buffer_write(l_buf, buffer_text, arg1);
        buffer_write(l_buf, buffer_text, gml_std_Std_stringify(arg0[l_i]));
    }
    buffer_write(l_buf, buffer_u8, 0);
    buffer_seek(l_buf, buffer_seek_start, 0);
    return buffer_read(l_buf, buffer_string);
}

function gml_std_gml_internal_ArrayImpl_copy(arg0)
{
    var l_len = array_length(arg0);
    var l_out;
    if (l_len > 0)
    {
        l_out = array_create(l_len);
        array_copy(l_out, 0, arg0, 0, l_len);
    }
    else
    {
        l_out = [];
    }
    return l_out;
}

function haxe__dynamic_access_dynamic_access_impl__copy(arg0)
{
    var l_fields = variable_struct_get_names(arg0);
    var l_r = {};
    var l_i = 0;
    var l__g1 = array_length(l_fields);
    while (l_i < l__g1)
    {
        var l_fd = l_fields[l_i];
        variable_struct_set(l_r, l_fd, variable_struct_get(arg0, l_fd));
        l_i++;
    }
    return l_r;
}

function gml_std_haxe_Exception_new(arg0, arg1, arg2)
{
    self.h_message = arg0;
    self.h_previous = arg1;
    if (arg2 == undefined)
    {
        var l_natEx = undefined;
        try
        {
            show_error(arg0, true);
        }
        catch (_e)
        {
            l_natEx = _e;
        }
        array_delete(l_natEx.stacktrace, 0, 1);
        l_natEx.hxException = self;
        arg2 = l_natEx;
    }
    self.h_native = arg2;
}

function gml_std_haxe_Exception(arg0, arg1, arg2) constructor
{
    static h_message = undefined;
    static h_previous = undefined;
    static h_native = undefined;
    static h_unwrap = method(undefined, gml_std_haxe_Exception_h_unwrap);
    static h_toString = method(undefined, gml_std_haxe_Exception_h_toString);
    static __class__ = global.mt_gml_std_haxe_Exception;
    
    switch (argument_count)
    {
        case 1:
            method(self, gml_std_haxe_Exception_new)(argument[0]);
            break;
        case 2:
            method(self, gml_std_haxe_Exception_new)(argument[0], argument[1]);
            break;
        case 3:
            method(self, gml_std_haxe_Exception_new)(argument[0], argument[1], argument[2]);
            break;
        default:
            show_error("Expected 1..3 arguments.", true);
    }
}

function gml_std_haxe_Exception_caught(arg0)
{
    if (is_struct(arg0))
    {
        if (variable_struct_exists(arg0, "stack"))
        {
            return arg0;
        }
        var l_hxEx = struct_get_from_hash(arg0, variable_get_hash("hxException"));
        if (l_hxEx != undefined)
        {
            return l_hxEx;
        }
        if (variable_struct_exists(arg0, "stacktrace"))
        {
            l_hxEx = new gml_std_haxe_Exception(arg0.message, undefined, arg0);
            arg0.hxException = l_hxEx;
            return l_hxEx;
        }
    }
    return new gml_std_haxe_Exception(string(arg0));
}

function gml_std_haxe_Exception_thrown(arg0)
{
    if (is_struct(arg0))
    {
        if (variable_struct_exists(arg0, "stack"))
        {
            return arg0.h_native;
        }
        if (variable_struct_exists(arg0, "stacktrace"))
        {
            return arg0;
        }
    }
    var l_message = is_string(arg0) ? arg0 : string(arg0);
    var l_natEx = undefined;
    try
    {
        show_error(l_message, true);
    }
    catch (_e)
    {
        l_natEx = _e;
    }
    return l_natEx;
}

function gml_std_haxe_Exception_h_unwrap()
{
    return self.h_native;
}

function gml_std_haxe_Exception_h_toString()
{
    return self.h_message;
}

function haxe_ds_basic_map_new()
{
    self.h_obj = {};
}

function haxe_ds_basic_map() constructor
{
    static h_obj = undefined;
    static __class__ = global.mt_haxe_ds_basic_map;
    
    method(self, haxe_ds_basic_map_new)();
}

function haxe_ds_string_map() constructor
{
    static h_obj = undefined;
    static __class__ = global.mt_haxe_ds_string_map;
    
    method(self, haxe_ds_basic_map_new)();
}

function live_set_live_impl(arg0, arg1, arg2, arg3, arg4)
{
    if (arg1 != undefined)
    {
        var l_cur = ds_map_find_value(arg2, arg0);
        if (l_cur == undefined)
        {
            ds_map_set(arg2, arg0, arg1);
            var l_i = ds_list_find_index(arg4, arg0);
            if (l_i >= 0)
            {
                ds_list_delete(arg4, l_i);
            }
            ds_list_add(arg3, arg0);
        }
        else if (l_cur != arg1)
        {
            ds_map_set(arg2, arg0, arg1);
            var l_i = ds_list_find_index(arg4, arg0);
            if (l_i < 0)
            {
                ds_list_add(arg4, arg0);
            }
            l_i = ds_list_find_index(arg3, arg0);
            if (l_i < 0)
            {
                ds_list_add(arg3, arg0);
            }
        }
    }
    else
    {
        if (!ds_map_exists(arg2, arg0))
        {
            exit;
        }
        var l_i = ds_list_find_index(arg3, arg0);
        if (l_i >= 0)
        {
            ds_list_delete(arg3, l_i);
        }
        ds_list_add(arg4, arg0);
    }
}

function live_set_live_simple(arg0, arg1, arg2, arg3, arg4)
{
    var l_val1 = arg1 ? true : undefined;
    if (l_val1 != undefined)
    {
        var l_cur = ds_map_find_value(arg2, arg0);
        if (l_cur == undefined)
        {
            ds_map_set(arg2, arg0, l_val1);
            var l_i = ds_list_find_index(arg4, arg0);
            if (l_i >= 0)
            {
                ds_list_delete(arg4, l_i);
            }
            ds_list_add(arg3, arg0);
        }
        else if (l_cur != l_val1)
        {
            ds_map_set(arg2, arg0, l_val1);
            var l_i = ds_list_find_index(arg4, arg0);
            if (l_i < 0)
            {
                ds_list_add(arg4, arg0);
            }
            l_i = ds_list_find_index(arg3, arg0);
            if (l_i < 0)
            {
                ds_list_add(arg3, arg0);
            }
        }
    }
    else if (ds_map_exists(arg2, arg0))
    {
        var l_i = ds_list_find_index(arg3, arg0);
        if (l_i >= 0)
        {
            ds_list_delete(arg3, l_i);
        }
        ds_list_add(arg4, arg0);
    }
}

function sprite_set_live(arg0, arg1)
{
    var l_map = global.live_live_sprites;
    var l_start = global.live_live_sprites_start;
    var l_stop = global.live_live_sprites_stop;
    var l_val = arg1 ? true : undefined;
    if (l_val != undefined)
    {
        var l_cur = ds_map_find_value(l_map, arg0);
        if (l_cur == undefined)
        {
            ds_map_set(l_map, arg0, l_val);
            var l_i = ds_list_find_index(l_stop, arg0);
            if (l_i >= 0)
            {
                ds_list_delete(l_stop, l_i);
            }
            ds_list_add(l_start, arg0);
        }
        else if (l_cur != l_val)
        {
            ds_map_set(l_map, arg0, l_val);
            var l_i = ds_list_find_index(l_stop, arg0);
            if (l_i < 0)
            {
                ds_list_add(l_stop, arg0);
            }
            l_i = ds_list_find_index(l_start, arg0);
            if (l_i < 0)
            {
                ds_list_add(l_start, arg0);
            }
        }
    }
    else if (ds_map_exists(l_map, arg0))
    {
        var l_i = ds_list_find_index(l_start, arg0);
        if (l_i >= 0)
        {
            ds_list_delete(l_start, l_i);
        }
        ds_list_add(l_stop, arg0);
    }
}

function path_set_live(arg0, arg1)
{
    var l_map = global.live_live_point_paths;
    var l_start = global.live_live_point_paths_start;
    var l_stop = global.live_live_point_paths_stop;
    var l_val = arg1 ? true : undefined;
    if (l_val != undefined)
    {
        var l_cur = ds_map_find_value(l_map, arg0);
        if (l_cur == undefined)
        {
            ds_map_set(l_map, arg0, l_val);
            var l_i = ds_list_find_index(l_stop, arg0);
            if (l_i >= 0)
            {
                ds_list_delete(l_stop, l_i);
            }
            ds_list_add(l_start, arg0);
        }
        else if (l_cur != l_val)
        {
            ds_map_set(l_map, arg0, l_val);
            var l_i = ds_list_find_index(l_stop, arg0);
            if (l_i < 0)
            {
                ds_list_add(l_stop, arg0);
            }
            l_i = ds_list_find_index(l_start, arg0);
            if (l_i < 0)
            {
                ds_list_add(l_start, arg0);
            }
        }
    }
    else if (ds_map_exists(l_map, arg0))
    {
        var l_i = ds_list_find_index(l_start, arg0);
        if (l_i >= 0)
        {
            ds_list_delete(l_start, l_i);
        }
        ds_list_add(l_stop, arg0);
    }
}

function animcurve_set_live(arg0, arg1, arg2 = 16)
{
    var l_val = arg1 ? arg2 : undefined;
    var l_map = global.live_live_anim_curves;
    var l_start = global.live_live_anim_curves_start;
    var l_stop = global.live_live_anim_curves_stop;
    if (l_val != undefined)
    {
        var l_cur = ds_map_find_value(l_map, arg0);
        if (l_cur == undefined)
        {
            ds_map_set(l_map, arg0, l_val);
            var l_i = ds_list_find_index(l_stop, arg0);
            if (l_i >= 0)
            {
                ds_list_delete(l_stop, l_i);
            }
            ds_list_add(l_start, arg0);
        }
        else if (l_cur != l_val)
        {
            ds_map_set(l_map, arg0, l_val);
            var l_i = ds_list_find_index(l_stop, arg0);
            if (l_i < 0)
            {
                ds_list_add(l_stop, arg0);
            }
            l_i = ds_list_find_index(l_start, arg0);
            if (l_i < 0)
            {
                ds_list_add(l_start, arg0);
            }
        }
    }
    else if (ds_map_exists(l_map, arg0))
    {
        var l_i = ds_list_find_index(l_start, arg0);
        if (l_i >= 0)
        {
            ds_list_delete(l_start, l_i);
        }
        ds_list_add(l_stop, arg0);
    }
}

function file_set_live(arg0, arg1, arg2)
{
    if (arg1 != undefined)
    {
        if (ds_map_exists(global.live_live_included_files, arg0))
        {
            exit;
        }
        var l_k;
        if (arg2 == undefined)
        {
            switch (string_lower(filename_ext(arg0)))
            {
                case ".csv":
                    l_k = 4;
                    break;
                case ".json":
                    l_k = 2;
                    break;
                case ".txt":
                    l_k = 1;
                    break;
                case ".bin":
                    l_k = 0;
                    break;
                case ".b64":
                case ".base64":
                    l_k = 3;
                    break;
                default:
                    show_error("Cannot auto-detect kind for \"" + arg0 + "\"", false);
                    exit;
            }
        }
        else
        {
            switch (arg2)
            {
                case "text":
                    l_k = 1;
                    break;
                case "json":
                    l_k = 2;
                    break;
                case "csv":
                    l_k = 4;
                    break;
                case "base64":
                    l_k = 3;
                    break;
                case "buffer":
                    l_k = 0;
                    break;
                case "auto":
                    switch (string_lower(filename_ext(arg0)))
                    {
                        case ".csv":
                            l_k = 4;
                            break;
                        case ".json":
                            l_k = 2;
                            break;
                        case ".txt":
                            l_k = 1;
                            break;
                        case ".bin":
                            l_k = 0;
                            break;
                        case ".b64":
                        case ".base64":
                            l_k = 3;
                            break;
                        default:
                            show_error("Cannot auto-detect kind for \"" + arg0 + "\"", false);
                            exit;
                    }
                    break;
                default:
                    show_error("Unrecognized kind \"" + gml_std_Std_stringify(arg2) + "\"", false);
                    exit;
            }
        }
        ds_map_set(global.live_live_included_files, arg0, 
        {
            func: arg1,
            kind: l_k
        });
        var l_i = ds_list_find_index(global.live_live_included_files_stop, arg0);
        if (l_i >= 0)
        {
            ds_list_delete(global.live_live_included_files_stop, l_i);
        }
        ds_list_add(global.live_live_included_files_start, arg0);
    }
    else
    {
        if (!ds_map_exists(global.live_live_included_files, arg0))
        {
            exit;
        }
        if (arg2 != undefined)
        {
            show_error("Kind should not be specified without a callback", false);
            exit;
        }
        ds_map_delete(global.live_live_included_files, arg0);
        var l_i = ds_list_find_index(global.live_live_included_files_start, arg0);
        if (l_i >= 0)
        {
            ds_list_delete(global.live_live_included_files_start, l_i);
        }
        ds_list_add(global.live_live_included_files_stop, arg0);
    }
}

function room_set_live(arg0, arg1)
{
    if (arg1)
    {
        if (ds_map_exists(global.live_live_rooms, arg0))
        {
            exit;
        }
        ds_map_set(global.live_live_rooms, arg0, true);
        var l_i = ds_list_find_index(global.live_live_rooms_stop, arg0);
        if (l_i >= 0)
        {
            ds_list_delete(global.live_live_rooms_stop, l_i);
        }
        ds_list_add(global.live_live_rooms_start, arg0);
    }
    else
    {
        if (!ds_map_exists(global.live_live_rooms, arg0))
        {
            exit;
        }
        ds_map_delete(global.live_live_rooms, arg0);
        ds_map_delete(global.live_live_room_data, arg0);
        var l_i = ds_list_find_index(global.live_live_rooms_start, arg0);
        if (l_i >= 0)
        {
            ds_list_delete(global.live_live_rooms_start, l_i);
        }
        ds_list_add(global.live_live_rooms_stop, arg0);
    }
}

function room_goto_live(arg0)
{
    if (ds_map_exists(global.live_live_rooms, arg0) && ds_map_exists(global.live_live_room_data, arg0))
    {
        global.live_live_room = arg0;
        if (!room_exists(global.live_blank_room))
        {
            show_error("Please add a completely empty room, add live_room_start(); to it's Creation Code, and assign it to live_blank_room in obj_gmlive's create event.", true);
        }
        room_goto(global.live_blank_room);
        exit;
    }
    room_goto(arg0);
}

function live_get_update_tail()
{
    var l_url = "";
    var l_sl = global.live_live_sprites_stop;
    var l_sln = ds_list_size(l_sl);
    if (l_sln > 0)
    {
        l_url += ("&sprites0=" + sprite_get_name(ds_list_find_value(l_sl, 0)));
        for (var l_i = 1; l_i < l_sln; l_i++)
        {
            l_url += ("+" + sprite_get_name(ds_list_find_value(l_sl, l_i)));
        }
        ds_list_clear(l_sl);
    }
    l_sl = global.live_live_sprites_start;
    l_sln = ds_list_size(l_sl);
    if (l_sln > 0)
    {
        l_url += ("&sprites1=" + sprite_get_name(ds_list_find_value(l_sl, 0)));
        for (var l_i = 1; l_i < l_sln; l_i++)
        {
            l_url += ("+" + sprite_get_name(ds_list_find_value(l_sl, l_i)));
        }
        ds_list_clear(l_sl);
    }
    l_sl = global.live_shader_live_shaders_stop;
    l_sln = ds_list_size(l_sl);
    if (l_sln > 0)
    {
        l_url += ("&shaders0=" + shader_get_name(ds_list_find_value(l_sl, 0)));
        for (var l_i = 1; l_i < l_sln; l_i++)
        {
            l_url += ("+" + shader_get_name(ds_list_find_value(l_sl, l_i)));
        }
        ds_list_clear(l_sl);
    }
    l_sl = global.live_shader_live_shaders_start;
    l_sln = ds_list_size(l_sl);
    if (l_sln > 0)
    {
        l_url += ("&shaders1=" + shader_get_name(ds_list_find_value(l_sl, 0)));
        for (var l_i = 1; l_i < l_sln; l_i++)
        {
            l_url += ("+" + shader_get_name(ds_list_find_value(l_sl, l_i)));
        }
        ds_list_clear(l_sl);
    }
    var l_rl = global.live_live_rooms_stop;
    var l_rln = ds_list_size(l_rl);
    if (l_rln > 0)
    {
        l_url += ("&rooms0=" + room_get_name(ds_list_find_value(l_rl, 0)));
        for (var l_i = 1; l_i < l_rln; l_i++)
        {
            l_url += ("+" + room_get_name(ds_list_find_value(l_rl, l_i)));
        }
        ds_list_clear(l_rl);
    }
    l_rl = global.live_live_rooms_start;
    l_rln = ds_list_size(l_rl);
    if (l_rln > 0)
    {
        l_url += ("&rooms1=" + room_get_name(ds_list_find_value(l_rl, 0)));
        for (var l_i = 1; l_i < l_rln; l_i++)
        {
            l_url += ("+" + room_get_name(ds_list_find_value(l_rl, l_i)));
        }
        ds_list_clear(l_rl);
    }
    l_rl = global.live_live_point_paths_stop;
    l_rln = ds_list_size(l_rl);
    if (l_rln > 0)
    {
        l_url += ("&paths0=" + path_get_name(ds_list_find_value(l_rl, 0)));
        for (var l_i = 1; l_i < l_rln; l_i++)
        {
            l_url += ("+" + path_get_name(ds_list_find_value(l_rl, l_i)));
        }
        ds_list_clear(l_rl);
    }
    l_rl = global.live_live_point_paths_start;
    l_rln = ds_list_size(l_rl);
    if (l_rln > 0)
    {
        l_url += ("&paths1=" + path_get_name(ds_list_find_value(l_rl, 0)));
        for (var l_i = 1; l_i < l_rln; l_i++)
        {
            l_url += ("+" + path_get_name(ds_list_find_value(l_rl, l_i)));
        }
        ds_list_clear(l_rl);
    }
    l_rl = global.live_live_anim_curves_stop;
    l_rln = ds_list_size(l_rl);
    if (l_rln > 0)
    {
        l_url += "&animCurves0=";
        for (var l_i = 0; l_i < l_rln; l_i++)
        {
            var l_ac = ds_list_find_value(l_rl, l_i);
            if (l_i > 0)
            {
                l_url += ("+" + animcurve_get(l_ac).name);
            }
            else
            {
                l_url += animcurve_get(l_ac).name;
            }
        }
        ds_list_clear(l_rl);
    }
    l_rl = global.live_live_anim_curves_start;
    l_rln = ds_list_size(l_rl);
    if (l_rln > 0)
    {
        l_url += "&animCurves1=";
        for (var l_i = 0; l_i < l_rln; l_i++)
        {
            var l_ac = ds_list_find_value(l_rl, l_i);
            if (l_i > 0)
            {
                l_url += ("+" + animcurve_get(l_ac).name);
            }
            else
            {
                l_url += animcurve_get(l_ac).name;
            }
            l_url += ("-" + gml_std_Std_stringify(ds_map_find_value(global.live_live_anim_curves, l_ac)));
        }
        ds_list_clear(l_rl);
    }
    l_rl = global.live_live_included_files_stop;
    l_rln = ds_list_size(l_rl);
    if (l_rln > 0)
    {
        l_url += ("&incFiles0=" + ds_list_find_value(l_rl, 0));
        for (var l_i = 1; l_i < l_rln; l_i++)
        {
            l_url += ("+" + ds_list_find_value(l_rl, l_i));
        }
        ds_list_clear(l_rl);
    }
    l_rl = global.live_live_included_files_start;
    l_rln = ds_list_size(l_rl);
    if (l_rln > 0)
    {
        l_url += ("&incFiles1=" + ds_list_find_value(l_rl, 0));
        for (var l_i = 1; l_i < l_rln; l_i++)
        {
            l_url += ("+" + ds_list_find_value(l_rl, l_i));
        }
        ds_list_clear(l_rl);
    }
    return l_url;
}

function live_default_update(arg0)
{
}

function live_room_updated_impl(arg0)
{
    room_goto_live(arg0);
}

function live_proc_call_origin(arg0)
{
    var l_data = undefined;
    var l_co = gml_std_string_pos_ext_haxe(arg0, ":");
    if (l_co >= 0)
    {
        var l_oclip = gml_std_string_substr(arg0, 0, l_co);
        l_data = variable_struct_get(global.live_live_map, l_oclip);
        if (l_data == undefined && gml_std_string_substr(l_oclip, 0, 11) == "gml_Script_")
        {
            l_oclip = gml_std_string_substring(l_oclip, 11);
            l_data = variable_struct_get(global.live_live_map, l_oclip);
        }
        if (l_data != undefined)
        {
            variable_struct_set(global.live_live_map, arg0, l_data);
        }
    }
    else if (gml_std_string_substr(arg0, 0, 11) == "gml_Script_")
    {
        l_data = variable_struct_get(global.live_live_map, gml_std_string_substring(arg0, 11));
        if (l_data != undefined)
        {
            variable_struct_set(global.live_live_map, arg0, l_data);
        }
    }
    return l_data;
}

function live_proc_call_impl(arg0, arg1, arg2)
{
    var l_pg = arg0[0];
    if (l_pg == undefined)
    {
        return false;
    }
    global.live_custom_self = self;
    global.live_custom_other = other;
    var l_scriptName = l_pg.h_tag;
    var l_th = l_pg.h_call_v(l_scriptName, arg1, false);
    if (l_th == undefined)
    {
        global.live_result = arg2;
        global.live_log_script("`" + ((l_scriptName == undefined) ? "null" : gml_std_Std_stringify(l_scriptName)) + "` is missing from the live program for some reason (?)", 2);
        return false;
    }
    else if (l_th.h_status == 3)
    {
        global.live_result = l_th.h_result;
        return true;
    }
    else if (l_th.h_status == 4)
    {
        global.live_result = arg2;
        global.live_log_script("Runtime error: " + l_th.h_get_error(), 2);
        return true;
    }
    else
    {
        return false;
    }
}

function live_call()
{
    var l_def = undefined;
    var l_origin;
    if (global.live_request_guid == undefined)
    {
        global.live_name = undefined;
        l_origin = undefined;
    }
    else
    {
        var l_now = (current_time / 1000) * 1000;
        if (l_now > (global.live_last_update_at + 5000) && l_now > (global.live_last_warn_at + 5000))
        {
            var l_stack = debug_get_callstack(2);
            global.live_last_warn_at = l_now;
            global.live_log_script("Calling live_call from " + l_stack[1] + ", but live_update was last called " + string(ceil((l_now - global.live_last_update_at) / 1000)) + " seconds ago. Did you deactivate/delete GMLive's object?", 1);
        }
        var l_origin1;
        if (global.live_name != undefined)
        {
            l_origin1 = global.live_name;
            global.live_name = undefined;
        }
        else
        {
            var l_stack = debug_get_callstack(2);
            l_origin1 = l_stack[1];
        }
        l_origin = l_origin1;
    }
    if (l_origin == undefined)
    {
        return false;
    }
    else
    {
        var l_data = variable_struct_get(global.live_live_map, l_origin);
        if (l_data == undefined)
        {
            l_data = live_proc_call_origin(l_origin);
        }
        if (l_data == undefined)
        {
            return false;
        }
        else
        {
            var l_argc = argument_count;
            var l_vals = array_create(l_argc);
            while (--l_argc >= 0)
            {
                array_set(l_vals, l_argc, argument[l_argc]);
            }
            return live_proc_call_impl(l_data, l_vals, l_def);
        }
    }
}

function live_defcall()
{
    var l_argc = argument_count - 1;
    var l_def = argument[l_argc];
    var l_origin;
    if (global.live_request_guid == undefined)
    {
        global.live_name = undefined;
        l_origin = undefined;
    }
    else
    {
        var l_now = (current_time / 1000) * 1000;
        if (l_now > (global.live_last_update_at + 5000) && l_now > (global.live_last_warn_at + 5000))
        {
            var l_stack = debug_get_callstack(2);
            global.live_last_warn_at = l_now;
            global.live_log_script("Calling live_defcall from " + l_stack[1] + ", but live_update was last called " + string(ceil((l_now - global.live_last_update_at) / 1000)) + " seconds ago. Did you deactivate/delete GMLive's object?", 1);
        }
        var l_origin1;
        if (global.live_name != undefined)
        {
            l_origin1 = global.live_name;
            global.live_name = undefined;
        }
        else
        {
            var l_stack = debug_get_callstack(2);
            l_origin1 = l_stack[1];
        }
        l_origin = l_origin1;
    }
    if (l_origin == undefined)
    {
        return false;
    }
    else
    {
        var l_data = variable_struct_get(global.live_live_map, l_origin);
        if (l_data == undefined)
        {
            l_data = live_proc_call_origin(l_origin);
        }
        if (l_data == undefined)
        {
            return false;
        }
        else
        {
            var l_vals = array_create(l_argc);
            while (--l_argc >= 0)
            {
                array_set(l_vals, l_argc, argument[l_argc]);
            }
            return live_proc_call_impl(l_data, l_vals, l_def);
        }
    }
}

function live_call_ext(arg0)
{
    var l_origin;
    if (global.live_request_guid == undefined)
    {
        global.live_name = undefined;
        l_origin = undefined;
    }
    else
    {
        var l_now = (current_time / 1000) * 1000;
        if (l_now > (global.live_last_update_at + 5000) && l_now > (global.live_last_warn_at + 5000))
        {
            var l_stack = debug_get_callstack(2);
            global.live_last_warn_at = l_now;
            global.live_log_script("Calling live_call_ext from " + l_stack[1] + ", but live_update was last called " + string(ceil((l_now - global.live_last_update_at) / 1000)) + " seconds ago. Did you deactivate/delete GMLive's object?", 1);
        }
        var l_origin1;
        if (global.live_name != undefined)
        {
            l_origin1 = global.live_name;
            global.live_name = undefined;
        }
        else
        {
            var l_stack = debug_get_callstack(2);
            l_origin1 = l_stack[1];
        }
        l_origin = l_origin1;
    }
    if (l_origin == undefined)
    {
        return false;
    }
    else
    {
        var l_data = variable_struct_get(global.live_live_map, l_origin);
        if (l_data == undefined)
        {
            l_data = live_proc_call_origin(l_origin);
        }
        if (l_data == undefined)
        {
            return false;
        }
        else
        {
            return live_proc_call_impl(l_data, gml_value_list_copy(arg0), undefined);
        }
    }
}

function live_defcall_ext(arg0, arg1)
{
    var l_origin;
    if (global.live_request_guid == undefined)
    {
        global.live_name = undefined;
        l_origin = undefined;
    }
    else
    {
        var l_now = (current_time / 1000) * 1000;
        if (l_now > (global.live_last_update_at + 5000) && l_now > (global.live_last_warn_at + 5000))
        {
            var l_stack = debug_get_callstack(2);
            global.live_last_warn_at = l_now;
            global.live_log_script("Calling live_defcall_ext from " + l_stack[1] + ", but live_update was last called " + string(ceil((l_now - global.live_last_update_at) / 1000)) + " seconds ago. Did you deactivate/delete GMLive's object?", 1);
        }
        var l_origin1;
        if (global.live_name != undefined)
        {
            l_origin1 = global.live_name;
            global.live_name = undefined;
        }
        else
        {
            var l_stack = debug_get_callstack(2);
            l_origin1 = l_stack[1];
        }
        l_origin = l_origin1;
    }
    if (l_origin == undefined)
    {
        return false;
    }
    else
    {
        var l_data = variable_struct_get(global.live_live_map, l_origin);
        if (l_data == undefined)
        {
            l_data = live_proc_call_origin(l_origin);
        }
        if (l_data == undefined)
        {
            return false;
        }
        else
        {
            return live_proc_call_impl(l_data, gml_value_list_copy(arg0), arg1);
        }
    }
}

function live_auto_call_1()
{
    var l_origin;
    if (global.live_request_guid == undefined)
    {
        global.live_name = undefined;
        l_origin = undefined;
    }
    else
    {
        var l_now = (current_time / 1000) * 1000;
        if (l_now > (global.live_last_update_at + 5000) && l_now > (global.live_last_warn_at + 5000))
        {
            var l_stack = debug_get_callstack(2);
            global.live_last_warn_at = l_now;
            global.live_log_script("Calling live_auto_call from " + l_stack[1] + ", but live_update was last called " + string(ceil((l_now - global.live_last_update_at) / 1000)) + " seconds ago. Did you deactivate/delete GMLive's object?", 1);
        }
        var l_origin1;
        if (global.live_name != undefined)
        {
            l_origin1 = global.live_name;
            global.live_name = undefined;
        }
        else
        {
            var l_stack = debug_get_callstack(2);
            l_origin1 = l_stack[1];
        }
        l_origin = l_origin1;
    }
    if (l_origin == undefined)
    {
        return false;
    }
    var l_data = variable_struct_get(global.live_live_map, l_origin);
    if (l_data == undefined)
    {
        l_data = live_proc_call_origin(l_origin);
    }
    if (l_data == undefined)
    {
        return false;
    }
    global.live_auto_call_data = l_data;
    return true;
}

function live_auto_call_2(arg0)
{
    return live_proc_call_impl(global.live_auto_call_data, arg0, undefined);
}

function live_async_http_0(arg0)
{
    global.live_is_ready = true;
    global.live_request_guid = ds_map_find_value(arg0, "guid");
    if (ds_map_find_value(arg0, "version") == undefined || ds_map_find_value(arg0, "version") < 106)
    {
        show_error("Outdated GMLive server detected! Please update the included files from the extension.", true);
    }
    var l_list = ds_map_find_value(arg0, "shaders");
    var l_n = ds_list_size(l_list);
    for (var l_i = 0; l_i < l_n; l_i++)
    {
        var l_s = ds_list_find_value(l_list, l_i);
        gml_asset_add(l_s, asset_get_index(l_s));
    }
    for (var l__ = 0; l__ < 1; l__++)
    {
        l_list = ds_map_find_value(arg0, "animCurves");
        if (l_list == undefined)
        {
            global.live_log_script("Server init response is missing an animCurves list. You may need to update the server.", 1);
        }
        else
        {
            l_n = ds_list_size(l_list);
            for (var l_i = 0; l_i < l_n; l_i++)
            {
                var l_s = ds_list_find_value(l_list, l_i);
                gml_asset_add(l_s, asset_get_index(l_s));
            }
        }
    }
    l_list = ds_map_find_value(arg0, "globals");
    l_n = ds_list_size(l_list);
    if (l_n > 0)
    {
        var l_buf = buffer_create(1024, buffer_grow, 1);
        buffer_seek(l_buf, buffer_seek_start, 0);
        buffer_write(l_buf, buffer_text, "globalvar ");
        buffer_write(l_buf, buffer_text, ds_list_find_value(l_list, 0));
        for (var l_i = 1; l_i < l_n; l_i++)
        {
            buffer_write(l_buf, buffer_text, ", ");
            buffer_write(l_buf, buffer_text, ds_list_find_value(l_list, l_i));
        }
        buffer_write(l_buf, buffer_string, ";");
        buffer_seek(l_buf, buffer_seek_start, 0);
        global.live_live_globals = new gml_source("globalvar", buffer_read(l_buf, buffer_string), "globalvar", true);
        buffer_delete(l_buf);
    }
    else
    {
        global.live_live_globals = undefined;
    }
    var l_srcMap = global.live_live_macros;
    tools__dictionary_dictionary_impl__clear(l_srcMap);
    l_list = ds_map_find_value(arg0, "macros");
    l_n = ds_list_size(l_list);
    for (var l_i = 0; l_i < l_n; l_i += 2)
    {
        var l_s = ds_list_find_value(l_list, l_i);
        var l_s1 = "macro:" + l_s;
        variable_struct_set(l_srcMap, l_s, new gml_source(l_s1, "#macro " + l_s + " " + gml_std_Std_stringify(ds_list_find_value(l_list, l_i + 1)), l_s1, true));
    }
    l_srcMap = global.live_live_enums;
    tools__dictionary_dictionary_impl__clear(l_srcMap);
    l_list = ds_map_find_value(arg0, "enums");
    var l_names = ds_map_find_value(arg0, "enumnames");
    l_n = ds_list_size(l_list);
    for (var l_i = 0; l_i < l_n; l_i++)
    {
        var l_s = ds_list_find_value(l_list, l_i);
        l_s = ds_list_find_value(l_names, l_i);
        variable_struct_set(l_srcMap, l_s, new gml_source("enum " + l_s, ds_list_find_value(l_list, l_i), "enum " + l_s, true));
    }
    global.live_log_script("Ready!", 0);
}

function live_async_http_1(arg0)
{
    var l_list = ds_map_find_value(arg0, "files");
    var l_n = ds_list_size(l_list);
    var l_i = -1;
    while (++l_i < l_n)
    {
        var l_fmap = ds_list_find_value(l_list, l_i);
        var l_ident = ds_map_find_value(l_fmap, "ident");
        var l_code = ds_map_find_value(l_fmap, "code");
        var l_name = ds_map_find_value(l_fmap, "name");
        global.live_update_script(l_name, l_ident, l_code);
    }
    l_list = ds_map_find_value(arg0, "sprites");
    var l__g2;
    if (l_list != undefined)
    {
        l_n = ds_list_size(l_list);
        l_i = -1;
        while (++l_i < l_n)
        {
            var l_sup = ds_list_find_value(l_list, l_i);
            var l_name = ds_map_find_value(l_sup, "name");
            var l_spr = asset_get_index(l_name);
            if (l_spr == -1)
            {
                global.live_log_script("Error: can't find sprite " + l_name + " for reload.", 2);
                continue;
            }
            var l_sx = ds_map_find_value(l_sup, "xorig");
            var l_sy = ds_map_find_value(l_sup, "yorig");
            var l_frames = ds_map_find_value(l_sup, "frames");
            var l_out = -1;
            var l_tmp = global.live_temp_path + ".png";
            var l_i1 = 0;
            var l__g1 = ds_list_size(l_frames);
            while (l_i1 < l__g1)
            {
                var l_tb = buffer_base64_decode(ds_list_find_value(l_frames, l_i1));
                if (l_tb == -1)
                {
                    global.live_log_script("Error: couldn't decode base64 for " + l_name + ".", 2);
                }
                else
                {
                    buffer_save(l_tb, l_tmp);
                    buffer_delete(l_tb);
                    var l_ts = sprite_add(l_tmp, 1, false, false, l_sx, l_sy);
                    if (l_ts == -1)
                    {
                        global.live_log_script("Error: couldn't load image " + string(l_i1) + " for " + l_name + ".", 2);
                    }
                    else if (l_i1 != 0)
                    {
                        sprite_merge(l_out, l_ts);
                    }
                    else
                    {
                        l_out = l_ts;
                    }
                }
                l_i1++;
            }
            if (l_out != -1)
            {
                sprite_assign(l_spr, l_out);
                sprite_collision_mask(l_spr, ds_map_find_value(l_sup, "sepMasks"), ds_map_find_value(l_sup, "bboxMode"), ds_map_find_value(l_sup, "bboxLeft"), ds_map_find_value(l_sup, "bboxTop"), ds_map_find_value(l_sup, "bboxRight"), ds_map_find_value(l_sup, "bboxBottom"), ds_map_find_value(l_sup, "colKind"), ds_map_find_value(l_sup, "colTolerance"));
                var l_obj = ds_map_find_value(l_sup, "nineslice");
                if (l_obj != undefined && l_obj != pointer_null && ds_map_find_value(l_obj, "enabled"))
                {
                    var l_nine = sprite_nineslice_create();
                    l_nine.enabled = true;
                    l_nine.left = ds_map_find_value(l_obj, "left");
                    l_nine.top = ds_map_find_value(l_obj, "top");
                    l_nine.right = ds_map_find_value(l_obj, "right");
                    l_nine.bottom = ds_map_find_value(l_obj, "bottom");
                    var l_tm = ds_map_find_value(l_obj, "tileMode");
                    l__g2 = [];
                    var l_i2 = 0;
                    var l__g4 = ds_list_size(l_tm);
                    while (l_i2 < l__g4)
                    {
                        array_push(l__g2, ds_list_find_value(l_tm, l_i2));
                        l_i2++;
                    }
                    l_nine.tileMode = l__g2;
                    sprite_set_nineslice(l_spr, l_nine);
                }
                sprite_delete(l_out);
                global.live_log_script("Reloaded " + l_name + ".", 0);
                global.live_sprite_updated(l_spr);
            }
            file_delete(l_tmp);
        }
    }
    l_list = ds_map_find_value(arg0, "shadersUpd");
    if (l_list != undefined)
    {
        l_n = ds_list_size(l_list);
        l_i = -1;
        while (++l_i < l_n)
        {
            var l_sup = ds_list_find_value(l_list, l_i);
            var l_name = ds_map_find_value(l_sup, "name");
            global.live_shader_updated(asset_get_index(l_name), ds_map_find_value(l_sup, "vertex"), ds_map_find_value(l_sup, "fragment"));
            global.live_log_script("Reloaded " + l_name + ".", 0);
        }
    }
    l_list = ds_map_find_value(arg0, "rooms");
    if (l_list != undefined)
    {
        l_n = ds_list_size(l_list);
        l_i = -1;
        while (++l_i < l_n)
        {
            var l_ru = ds_list_find_value(l_list, l_i);
            var l_rq = asset_get_index(ds_map_find_value(l_ru, "name"));
            ds_map_set(global.live_live_room_data, l_rq, ds_map_find_value(l_ru, "json"));
            global.live_room_updated(l_rq);
        }
    }
    l_list = ds_map_find_value(arg0, "pathsUpd");
    if (l_list != undefined)
    {
        l_i = 0;
        var l__g1 = ds_list_size(l_list);
        while (l_i < l__g1)
        {
            var l_pup = ds_list_find_value(l_list, l_i);
            var l_name = ds_map_find_value(l_pup, "name");
            var l_pt = asset_get_index(l_name);
            if (!path_exists(l_pt))
            {
                global.live_log_script("Couldn't find path '" + l_name + "'", 1);
            }
            else
            {
                path_clear_points(l_pt);
                path_set_closed(l_pt, ds_map_find_value(l_pup, "closed"));
                path_set_kind(l_pt, ds_map_find_value(l_pup, "kind"));
                path_set_precision(l_pt, ds_map_find_value(l_pup, "precision"));
                var l__g_list = ds_map_find_value(l_pup, "points");
                var l__g_index = 0;
                while (l__g_index < ds_list_size(l__g_list))
                {
                    var l_point = ds_list_find_value(l__g_list, l__g_index++);
                    path_add_point(l_pt, ds_map_find_value(l_point, "x"), ds_map_find_value(l_point, "y"), ds_map_find_value(l_point, "speed"));
                }
                global.live_log_script("Reloaded " + l_name + ".", 0);
                global.live_path_updated(l_pt);
            }
            l_i++;
        }
    }
    l_list = ds_map_find_value(arg0, "animCurvesUpd");
    if (l_list != undefined)
    {
        l_i = 0;
        var l__g1 = ds_list_size(l_list);
        while (l_i < l__g1)
        {
            var l_acu = ds_list_find_value(l_list, l_i);
            var l_name = ds_map_find_value(l_acu, "name");
            var l_ac = asset_get_index(l_name);
            if (!animcurve_exists(l_ac))
            {
                global.live_log_script("Couldn't find animcurve \"" + l_name + "\"", 1);
            }
            else
            {
                var l_acStruct = animcurve_get(l_ac);
                var l_acuChannels = ds_map_find_value(l_acu, "channels");
                var l_acuType = ds_map_find_value(l_acu, "type");
                var l_acChannels = [];
                var l_i1 = 0;
                var l__g3 = ds_list_size(l_acuChannels);
                while (l_i1 < l__g3)
                {
                    var l_acuChannel = ds_list_find_value(l_acuChannels, l_i1);
                    var l_acChannel = animcurve_channel_new();
                    l_acChannel.name = ds_map_find_value(l_acuChannel, "name");
                    l_acChannel.type = l_acuType;
                    var l_acuData = ds_map_find_value(l_acuChannel, "data");
                    var l_acPoints = [];
                    var l_acuInd = 0;
                    var l__ = 0;
                    var l__g5 = ds_list_size(l_acuData) >> 1;
                    while (l__ < l__g5)
                    {
                        var l_acPoint = animcurve_point_new();
                        l_acPoint.posx = ds_list_find_value(l_acuData, l_acuInd++);
                        l_acPoint.value = ds_list_find_value(l_acuData, l_acuInd++);
                        array_push(l_acPoints, l_acPoint);
                        l__++;
                    }
                    l_acChannel.points = l_acPoints;
                    array_push(l_acChannels, l_acChannel);
                    l_i1++;
                }
                l_acStruct.channels = l_acChannels;
                global.live_log_script("Reloaded " + l_name + ".", 0);
                global.live_animcurve_updated(l_ac);
            }
            l_i++;
        }
    }
    l_list = ds_map_find_value(arg0, "incFilesUpd");
    if (l_list != undefined)
    {
        l_i = 0;
        var l__g1 = ds_list_size(l_list);
        for (; l_i < l__g1; l_i++)
        {
            var l_sub = ds_list_find_value(l_list, l_i);
            var l_name = ds_map_find_value(l_sub, "path");
            var l_ip = ds_map_find_value(global.live_live_included_files, l_name);
            if (l_ip == undefined)
            {
                global.live_log_script("Couldn't find live included file \"" + l_name + "\"", 1);
            }
            else
            {
                var l_b64 = ds_map_find_value(l_sub, "data");
                switch (l_ip.kind)
                {
                    case 1:
                        l_ip.func(base64_decode(l_b64), l_name);
                        break;
                    case 4:
                        var l_tmp1 = global.live_temp_path + ".csv";
                        buffer_save(buffer_base64_decode(l_b64), l_tmp1);
                        var l_grid = load_csv(l_tmp1);
                        l_ip.func(l_grid, l_name);
                        ds_grid_destroy(l_grid);
                        file_delete(l_tmp1);
                        break;
                    case 0:
                        var l_buf = buffer_base64_decode(l_b64);
                        l_ip.func(l_buf, l_name);
                        buffer_delete(l_buf);
                        break;
                    case 2:
                        var l_val;
                        try
                        {
                            l_val = json_parse(base64_decode(l_b64));
                        }
                        catch (l__g2)
                        {
                            global.live_log_script("Couldn't decode JSON for \"" + l_name + "\": " + gml_std_Std_stringify(gml_std_haxe_Exception_caught(l__g2).h_unwrap()), 1);
                            continue;
                        }
                        l_ip.func(l_val, l_name);
                        break;
                    case 3:
                        l_ip.func(l_b64, l_name);
                        break;
                }
            }
        }
    }
}

function live_async_http_check(arg0)
{
    return ds_map_find_value(arg0, "id") == global.live_request_id && ds_map_find_value(arg0, "status") <= 0;
}

function live_async_http(arg0 = async_load)
{
    if (!live_async_http_check(arg0))
    {
        exit;
    }
    global.live_request_id = undefined;
    if (ds_map_find_value(arg0, "status") < 0 || ds_map_find_value(arg0, "result") == undefined)
    {
        exit;
    }
    var l_json1 = ds_map_find_value(arg0, "result");
    var l_map = json_decode(l_json1);
    if (l_map == -1 || ds_map_exists(l_map, "default"))
    {
        if (string_char_at(l_json1, 1) == "{" && string_char_at(l_json1, (string_length(l_json1) - 1) + 1) == "]")
        {
            l_json1 += "}";
        }
        l_map = json_decode(l_json1);
        if (l_map == -1 || ds_map_exists(l_map, "default"))
        {
            global.live_log_script("Invalid JSON response (" + gml_std_Std_stringify(string_length(l_json1) / 1000) + " KB)", 2);
            exit;
        }
    }
    if (global.live_request_guid == undefined)
    {
        live_async_http_0(l_map);
    }
    live_async_http_1(l_map);
    ds_map_destroy(l_map);
}

function live_gmlive_patcher_add_source(arg0, arg1, arg2, arg3)
{
    variable_struct_set(arg2, arg0, true);
    var l_parser = arg3.h_parser;
    var l_tokens;
    if (l_parser != undefined)
    {
        if (l_parser.h_token_count < 0)
        {
            exit;
        }
        l_tokens = l_parser.h_tokens;
    }
    else
    {
        arg3.h_index = ds_list_size(arg1) + 1;
        l_parser = new gml_parser(arg3);
        arg3.h_parser = l_parser;
        l_tokens = l_parser.h_run();
        if (l_tokens == undefined)
        {
            exit;
        }
    }
    var l_tokenCount = l_parser.h_token_count;
    ds_list_add(arg1, arg3);
    live_gmlive_patcher_index_rec(l_tokens, l_tokenCount, arg1, arg2);
    var l_macros = l_parser.h_macros;
    var l_i = 0;
    var l__g1 = array_length(l_macros);
    while (l_i < l__g1)
    {
        var l_mtokens = l_macros[l_i].h_tokens;
        live_gmlive_patcher_index_rec(l_mtokens, array_length(l_mtokens), arg1, arg2);
        l_i++;
    }
}

function live_gmlive_patcher_index_rec(arg0, arg1, arg2, arg3)
{
    var l_tokensLen1 = arg1 - 1;
    var l_tokensPos = -1;
    var l_macros = global.live_live_macros;
    var l_enums = global.live_live_enums;
    while (++l_tokensPos < arg1)
    {
        var l_tk = arg0[l_tokensPos];
        var l_id;
        if (l_tk[0] == 12)
        {
            l_id = l_tk[2];
        }
        else
        {
            continue;
        }
        if (variable_struct_exists(arg3, l_id))
        {
            continue;
        }
        var l_src = variable_struct_get(l_macros, l_id);
        if (l_src != undefined)
        {
            live_gmlive_patcher_add_source(l_id, arg2, arg3, l_src);
            continue;
        }
        l_src = variable_struct_get(l_enums, l_id);
        if (l_src != undefined)
        {
            if (l_tokensPos > 0)
            {
                var l__g1 = arg0[l_tokensPos - 1];
                if (l__g1[0] == 6)
                {
                    continue;
                }
            }
            if (l_tokensPos < l_tokensLen1)
            {
                var l__g3 = arg0[l_tokensPos + 1];
                if (l__g3[0] == 6)
                {
                    live_gmlive_patcher_add_source(l_id, arg2, arg3, l_src);
                }
            }
            continue;
        }
        variable_struct_set(arg3, l_id, true);
    }
}

function live_gmlive_patcher_patch_live_patch_source_rec(arg0, arg1, arg2)
{
    if (++arg2 >= 16)
    {
        exit;
    }
    if (arg0[0] == -3)
    {
        array_set(arg0, 0, arg1);
    }
    if (arg0[3] != undefined)
    {
        live_gmlive_patcher_patch_live_patch_source_rec(arg0[3], arg1, arg2);
    }
}

function live_gmlive_patcher_compile_ex(arg0, arg1)
{
    var l_source = new gml_source(arg0, arg1, arg0);
    l_source.h_index = -3;
    var l_parser = new gml_parser(l_source);
    l_source.h_parser = l_parser;
    var l_tokens = l_parser.h_run();
    if (l_tokens == undefined)
    {
        global.live_gmlive_patcher_error_text = global.gml_parser_error_text;
        return undefined;
    }
    var l_found = global.live_async_http_1_found;
    var l_acc = global.live_async_http_1_acc;
    tools__dictionary_dictionary_impl__clear(l_found);
    ds_list_clear(l_acc);
    if (global.live_live_globals != undefined)
    {
        ds_list_add(l_acc, global.live_live_globals);
    }
    l_source.h_parser = l_parser;
    live_gmlive_patcher_index_rec(l_tokens, l_parser.h_token_count, l_acc, l_found);
    var l_baseSourceID = ds_list_size(l_acc);
    ds_list_add(l_acc, l_source);
    var l_tks = l_parser.h_tokens;
    var l_ti = 0;
    var l__g1 = array_length(l_tks);
    while (l_ti < l__g1)
    {
        live_gmlive_patcher_patch_live_patch_source_rec(l_tks[l_ti][1], l_baseSourceID, 0);
        l_ti++;
    }
    var l_srci = ds_list_size(l_acc);
    var l_sources = array_create(l_srci);
    while (--l_srci >= 0)
    {
        array_set(l_sources, l_srci, ds_list_find_value(l_acc, l_srci));
    }
    var l_pg = new gml_program(l_sources);
    global.live_gmlive_patcher_error_text = l_pg.h_error_text;
    if (!l_pg.h_is_ready)
    {
        l_pg.h_destroy();
        return undefined;
    }
    l_pg.h_tag = arg0;
    return l_pg;
}

function live_shader_updated_default()
{
    show_error("Can't update shader! You have not assigned a script to live_shader_updated. Please check documentation", true);
}

function shader_set_live(arg0, arg1)
{
    if (arg1)
    {
        if (ds_map_exists(global.live_shader_live_shaders, arg0))
        {
            exit;
        }
        ds_map_set(global.live_shader_live_shaders, arg0, true);
        var l_i = ds_list_find_index(global.live_shader_live_shaders_stop, arg0);
        if (l_i >= 0)
        {
            ds_list_delete(global.live_shader_live_shaders_stop, l_i);
        }
        ds_list_add(global.live_shader_live_shaders_start, arg0);
    }
    else
    {
        if (!ds_map_exists(global.live_shader_live_shaders, arg0))
        {
            exit;
        }
        ds_map_delete(global.live_shader_live_shaders, arg0);
        var l_i = ds_list_find_index(global.live_shader_live_shaders_start, arg0);
        if (l_i >= 0)
        {
            ds_list_delete(global.live_shader_live_shaders_start, l_i);
        }
        ds_list_add(global.live_shader_live_shaders_stop, arg0);
    }
}

function live_validate_scripts()
{
    var l_names = ["GMLive_call", "live_call", "GMLive_tools", "live_execute_string", "GMLive_parser", "gml_parser_buf_sub", "GMLive_nodeTools", "gml_node_tools_seek", "GMLive_builder", "gml_builder", "GMLive_compiler", "gml_compile_program", "GMLive_seekEval", "gml_seek_eval_eval", "GMLive_seekSetOp", "gml_seek_set_op_proc", "GMLive_action", "mc_gml_action", "GMLive_new", "vm_impl_gml_thread_construct_init", "GMLive_exec", "vm_gml_thread_exec_slice_init", "GMLive_program", "gml_program", "GMLive_thread", "gml_thread", "GMLive_vm", "vm_group_op_impl", "GMLive_vm_init", "vm_v2_gml_thread_v2_handlers_init", "GMLive_vm_call", "live_method", "GMLiveAPI", "live_preinit_api", "GMLive_roomLoader", "live_room_start", "GMLive_http", "live_async_http"];
    var l_i = 0;
    var l_count = array_length(l_names);
    while (l_i < l_count)
    {
        var l_scr = l_names[l_i++];
        var l_ref = l_names[l_i++];
        if (-1 == asset_get_index(l_ref))
        {
            show_error("Function `" + l_ref + "` is missing!" + ("\nCheck that script resource `" + l_scr + "` exists (Ctrl+T) and is not just a single empty function;") + "\ndelete and re-import if necessary!", false);
        }
    }
}

function live_cache_data_create()
{
    var l_this = array_create(1);
    array_set(l_this, 0, undefined);
    return l_this;
}

function tools__dictionary_dictionary_impl__clear(arg0)
{
    var l_keys = variable_struct_get_names(arg0);
    var l__g = 0;
    while (l__g < array_length(l_keys))
    {
        var l_key = l_keys[l__g];
        l__g++;
        variable_struct_remove(arg0, l_key);
    }
}

function live_method(arg0, arg1)
{
    if (is_method(arg1))
    {
        var l_meta = method_get_self(arg1);
        if (is_struct(l_meta) && variable_struct_exists(l_meta, "live:self"))
        {
            var l_nmeta = haxe__dynamic_access_dynamic_access_impl__copy(l_meta);
            variable_struct_set(l_nmeta, "live:self", arg0);
            return method(l_nmeta, arg1);
        }
    }
    return method(arg0, arg1);
}

function live_method_get_self(arg0)
{
    var l_fnSelf = method_get_self(arg0);
    if (is_struct(l_fnSelf) && variable_struct_exists(l_fnSelf, "live:self"))
    {
        return variable_struct_get(l_fnSelf, "live:self");
    }
    return l_fnSelf;
}

function gml_thread_method_script()
{
    var l_argc = argument_count;
    var l_args1 = array_create(l_argc);
    for (var l_i = 0; l_i < l_argc; l_i++)
    {
        array_set(l_args1, l_i, argument[l_i]);
    }
    var l_meta = self;
    var l_meta1 = l_meta;
    var l_self1 = variable_struct_get(l_meta, "live:self");
    var l_result;
    do
    {
        var l_ctx = variable_struct_get(l_meta1, "live:context");
        var l_pg;
        if (l_ctx != undefined)
        {
            var l_livedata = variable_struct_get(global.live_live_map, l_ctx);
            if (l_livedata == undefined)
            {
                show_error("Trying to call a nonexistent GMLive program: " + gml_std_Std_stringify(l_ctx), true);
            }
            l_pg = l_livedata[0];
            if (l_pg == undefined)
            {
                global.live_log_script("Trying to call a broken GMLive program " + gml_std_Std_stringify(l_ctx) + ", returning undefined", 2);
                l_result = undefined;
                break;
            }
        }
        else
        {
            l_pg = variable_struct_get(l_meta1, "live:program");
            if (l_pg == undefined)
            {
                show_error("It would appear that you've re-bound a GMLive function to a different scope. Please use live_method() rather than method() to do so.", true);
            }
        }
        global.live_custom_self = l_self1;
        global.live_custom_other = other;
        var l_th = l_pg.h_call_v(variable_struct_get(l_meta1, "live:function"), l_args1, false);
        if (l_th == undefined)
        {
            l_result = undefined;
            break;
        }
        if (l_th.h_status == 3)
        {
            l_result = l_th.h_result;
        }
        else if (l_th.h_status == 4)
        {
            global.live_log_script("Runtime error: " + l_th.h_get_error(), 2);
            l_result = undefined;
        }
        else
        {
            l_result = undefined;
        }
    }
    until (true);
    return l_result;
}

function vm_v2_gml_thread_group_func_literal_ctr_impl()
{
    show_error("\"live\" constructors should be invoked through live_new", true);
}

function vm_v2_gml_thread_group_func_literal_create_function(arg0, arg1, arg2)
{
    var l_meta = {};
    var l_funcSelf = arg2;
    if (!is_struct(l_funcSelf) && instanceof(l_funcSelf) == "instance")
    {
        l_funcSelf = l_funcSelf.id;
    }
    variable_struct_set(l_meta, "live:self", l_funcSelf);
    var l_th = global.gml_thread_current;
    if (l_th.h_scope[9].h_live_ident != undefined)
    {
        variable_struct_set(l_meta, "live:context", l_th.h_scope[9].h_live_ident);
    }
    else
    {
        variable_struct_set(l_meta, "live:program", l_th.h_scope[9]);
    }
    variable_struct_set(l_meta, "live:function", arg1);
    var l_isCtr = variable_struct_get(arg0.h_script_map, arg1).h_is_constructor;
    variable_struct_set(l_meta, "live:isConstructor", l_isCtr);
    if (l_isCtr)
    {
        return method(l_meta, vm_v2_gml_thread_group_func_literal_ctr_impl);
    }
    else
    {
        return method(l_meta, gml_thread_method_script);
    }
}

function vm_v2_gml_thread_group_func_literal_on_func_literal(arg0, arg1, arg2, arg3)
{
    if (arg1.__enumIndex__ == 89)
    {
        var l_self1;
        if (arg1.h_unbound)
        {
            l_self1 = undefined;
        }
        else
        {
            var l_this1 = arg2[6];
            l_self1 = l_this1[l_this1[0]];
        }
        gml_stack_push(arg3, vm_v2_gml_thread_group_func_literal_create_function(arg2[9], arg1.h_name, l_self1));
    }
    return 0;
}

function vm_v2_gml_thread_v2_handlers_init_set(arg0, arg1, arg2, arg3)
{
    var l_id = variable_struct_get(arg1, arg2);
    if (l_id != undefined)
    {
        array_set(arg0, l_id, arg3);
    }
    else
    {
        show_error("Can't find " + arg2, true);
    }
}

function vm_v2_gml_thread_v2_handlers_init()
{
    var l_names = gml_std_Type_getEnumConstructs(global.mt_gml_action);
    var l_map = {};
    var l_funcs = array_create(array_length(l_names), undefined);
    var l_i = 0;
    var l__g1 = array_length(l_names);
    while (l_i < l__g1)
    {
        var l_name = l_names[l_i];
        if (gml_std_StringTools_endsWith(l_name, "_hx"))
        {
            l_name = gml_std_string_substring(l_name, 0, string_length(l_name) - 3);
        }
        variable_struct_set(l_map, l_name, l_i);
        array_set(l_funcs, l_i, vm_v2_gml_thread_v2_on_unknown);
        l_i++;
    }
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "discard", vm_group_stack_on_discard);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "dup", vm_group_stack_on_dup);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "dup2x", vm_group_stack_on_dup2x);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "dup3x", vm_group_stack_on_dup3x);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "dup_in", vm_group_stack_on_dup_in);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "undefined", vm_group_literal_on_undefined);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "number", vm_group_literal_on_number);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "cstring", vm_group_literal_on_cstring);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "const", vm_group_literal_on_const);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "self", vm_group_literal_on_self);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "other", vm_group_literal_on_other);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "result", vm_group_literal_on_result);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "array_decl", vm_group_literal_on_array_decl);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "object_decl", vm_group_literal_on_object_decl);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "bin_op", vm_group_op_on_bin_op);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "un_op", vm_group_op_on_un_op);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "equ_op", vm_group_op_on_equ_op);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "neq_op", vm_group_op_on_neq_op);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "add_int", vm_group_op_on_add_int);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "concat", vm_group_op_on_concat);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "ds_aop", vm_group_op_on_ds_aop);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "arg_count", vm_group_arg_on_arg_count);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "arg_const", vm_group_arg_on_arg_const);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "arg_const_set", vm_group_arg_on_arg_const_set);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "arg_const_aop", vm_group_arg_on_arg_const_aop);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "arg_index", vm_group_arg_on_arg_index);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "arg_index_set", vm_group_arg_on_arg_index_set);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "arg_index_aop", vm_group_arg_on_arg_index_aop);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "local", vm_group_local_on_local);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "local_set", vm_group_local_on_local_set);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "local_aop", vm_group_local_on_local_aop);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "global", vm_group_global_on_global);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "global_set", vm_group_global_on_global_set);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "global_aop", vm_group_global_on_global_aop);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "field", vm_group_field_on_field);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "field_set", vm_group_field_on_field_set);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "field_aop", vm_group_field_on_field_aop);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "self_field", vm_group_field_on_self_field);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "self_field_set", vm_group_field_on_self_field_set);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "self_field_aop", vm_group_field_on_self_field_aop);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "fast_self_field", vm_group_field_on_fast_self_field);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "fast_self_field_set", vm_group_field_on_fast_self_field_set);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "fast_self_field_aop", vm_group_field_on_fast_self_field_aop);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "local_field", vm_group_field_on_local_field);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "local_field_set", vm_group_field_on_local_field_set);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "local_field_aop", vm_group_field_on_local_field_aop);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "fast_local_field", vm_group_field_on_fast_local_field);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "fast_local_field_set", vm_group_field_on_fast_local_field_set);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "fast_local_field_aop", vm_group_field_on_fast_local_field_aop);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "fast_field_aop", vm_group_field_on_fast_field_aop);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "in", vm_group_field_on_in);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "in_const", vm_group_field_on_in_const);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "with_pre", vm_group_with_on_with_pre);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "with_next", vm_group_with_on_with_next);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "with_post", vm_group_with_on_with_post);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "env", vm_group_env_on_env);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "env_set", vm_group_env_on_env_set);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "env_aop", vm_group_env_on_env_aop);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "env1d", vm_group_env_on_env1d);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "env1d_set", vm_group_env_on_env1d_set);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "env1d_aop", vm_group_env_on_env1d_aop);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "index", vm_group_array_on_index);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "index_set", vm_group_array_on_index_set);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "index_aop", vm_group_array_on_index_aop);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "index2d", vm_group_array_on_index2d);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "index2d_set", vm_group_array_on_index2d_set);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "index2d_aop", vm_group_array_on_index2d_aop);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "ensure_array_for_local", vm_group_ensure_plus_on_ensure_array_for_local);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "ensure_array_for_global", vm_group_ensure_plus_on_ensure_array_for_global);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "ensure_array_for_field", vm_group_ensure_plus_on_ensure_array_for_field);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "ensure_array_for_index", vm_group_ensure_plus_on_ensure_array_for_index);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "ensure_array_for_index2d", vm_group_ensure_plus_on_ensure_array_for_index2d);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "alarm", vm_group_alarm_on_alarm);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "alarm_set", vm_group_alarm_on_alarm_set);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "alarm_aop", vm_group_alarm_on_alarm_aop);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "jump", vm_group_jump_on_jump);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "jump_if", vm_group_jump_on_jump_if);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "jump_unless", vm_group_jump_on_jump_unless);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "bool_and", vm_group_jump_on_bool_and);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "bool_or", vm_group_jump_on_bool_or);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "switch", vm_group_jump_on_switch);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "switch_case", vm_group_jump_on_switch_case);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "null_co", vm_group_jump_on_null_co);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "repeat_pre", vm_group_jump_on_repeat_pre);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "repeat_jump", vm_group_jump_on_repeat_jump);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "break", vm_group_jump_on_break);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "continue", vm_group_jump_on_continue);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "return", vm_group_jump_on_return);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "return_const", vm_group_jump_on_return_const);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "wait", vm_group_special_on_wait);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "fork", vm_group_special_on_fork);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "try", vm_group_special_on_try);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "catch", vm_group_special_on_catch);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "finally", vm_group_special_on_finally);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "throw", vm_group_special_on_throw);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_script", vm_group_call_on_call_script);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_script_id", vm_group_call_on_call_script_id);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_script_with_array", vm_group_call_on_call_script_with_array);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_func", vm_group_call_on_call_func);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_field", vm_group_call_on_call_field);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "construct", vm_group_call_on_construct);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "func_literal", vm_v2_gml_thread_group_func_literal_on_func_literal);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_func0", vm_group_fast_call_on_call_func0);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_func0o", vm_group_fast_call_on_call_func0o);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_func1", vm_group_fast_call_on_call_func1);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_func1o", vm_group_fast_call_on_call_func1o);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_func2", vm_group_fast_call_on_call_func2);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_func2o", vm_group_fast_call_on_call_func2o);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_func3", vm_group_fast_call_on_call_func3);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_func3o", vm_group_fast_call_on_call_func3o);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_func4", vm_group_fast_call_on_call_func4);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_func4o", vm_group_fast_call_on_call_func4o);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_func_with_local0", vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local0);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_func_with_local0o", vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local0o);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_func_with_local1", vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local1);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_func_with_local1o", vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local1o);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_func_with_local2", vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local2);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_func_with_local2o", vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local2o);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_func_with_local3", vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local3);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_func_with_local3o", vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local3o);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_func_with_local4", vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local4);
    vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_func_with_local4o", vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local4o);
    return l_funcs;
}

function vm_v2_gml_thread_v2_ready()
{
    global.vm_v2_gml_thread_v2_handlers = vm_v2_gml_thread_v2_handlers_init();
}

function vm_v2_gml_thread_v2_on_unknown(arg0, arg1, arg2, arg3)
{
    arg0.h_proc_error("Can't execute " + gml_std_Type_enumConstructor(arg1), arg1);
    return 1;
}

function live_temp_path_init()
{
    return "gmlive-" + gml_std_Std_stringify(gml_std_Date_now().h_getTime());
}

function live_script_get_index(arg0)
{
    return asset_get_index(arg0);
}

function live_log_impl(arg0, arg1)
{
    if (arg1 == 0)
    {
        show_debug_message("[GMLive][" + date_datetime_string(gml_std_Date_now().h_date) + "] " + arg0);
    }
    else
    {
        show_debug_message("[GMLive][" + date_datetime_string(gml_std_Date_now().h_date) + "][" + global.live_log_impl_levels[arg1] + "] " + arg0);
    }
}

function live_log(arg0, arg1)
{
    global.live_log_script(arg0, arg1);
}

function live_update_script_impl(arg0, arg1, arg2)
{
    var l_data = variable_struct_get(global.live_live_map, arg1);
    if (l_data == undefined)
    {
        l_data = live_cache_data_create();
        variable_struct_set(global.live_live_map, arg1, l_data);
    }
    var l_pg = live_gmlive_patcher_compile_ex(arg0, arg2);
    if (l_pg == undefined)
    {
        global.live_log_script("Error in " + arg0 + ":", 2);
        global.live_log_script(global.live_gmlive_patcher_error_text, 2);
        exit;
    }
    if (l_pg.h_error_text != undefined)
    {
        global.live_log_script("Warning in " + arg0 + ":", 1);
        global.live_log_script(l_pg.h_error_text, 1);
    }
    l_pg.h_live_ident = arg1;
    global.live_log_script("Reloaded " + arg0 + ".", 0);
    global.live_code_updated(arg1, arg0);
    if (l_data[0] != undefined)
    {
        l_data[0].h_destroy();
    }
    array_set(l_data, 0, l_pg);
}

function live_constant_add(arg0, arg1)
{
    gml_const_add(arg0, arg1);
}

function live_constant_delete(arg0)
{
    return gml_remove_const(arg0);
}

function live_variable_add(arg0, arg1)
{
    gml_var_add(arg0, arg1);
}

function live_variable_delete(arg0)
{
    return gml_remove_var(arg0);
}

function live_function_add(arg0, arg1)
{
    var l_f = new gml_func();
    l_f.h_set(arg0, arg1);
    variable_struct_set(global.gml_func_map, l_f.h_name, l_f);
}

function live_function_delete(arg0)
{
    if (variable_struct_get(global.gml_func_map, arg0) == undefined)
    {
        return false;
    }
    else
    {
        variable_struct_remove(global.gml_func_map, arg0);
        return true;
    }
}

function live_throw_error(arg0)
{
    gml_thread_error(arg0);
}

function live_execute_string(arg0)
{
    var l_pg = new gml_program([new gml_source("execute_string", arg0, "execute_string")]);
    global.live_custom_self = self;
    global.live_custom_other = other;
    var l_ok;
    if (l_pg.h_error_text == undefined)
    {
        var l_argc = argument_count - 1;
        var l_argv = array_create(l_argc);
        var l_i = 0;
        for (var l__ = 0; l__ < l_argc; l__++)
        {
            array_set(l_argv, l_i, argument[l_i + 1]);
            l_i++;
        }
        var l_th = l_pg.h_call_v("execute_string", l_argv, false);
        if (l_th.h_status == 3)
        {
            l_ok = true;
            global.live_result = l_th.h_result;
        }
        else
        {
            l_ok = false;
            global.live_result = l_th.h_error_text;
            if (global.live_result == undefined)
            {
                global.live_result = "(unknown error)";
            }
        }
    }
    else
    {
        l_ok = false;
        global.live_result = l_pg.h_error_text;
    }
    l_pg.h_destroy();
    return l_ok;
}

function live_snippet_create(arg0, arg1 = "snippet")
{
    var l_pg = new gml_program([new gml_source(arg1, arg0, "snippet")]);
    if (l_pg.h_error_text == undefined)
    {
        return l_pg;
    }
    else
    {
        global.live_result = l_pg.h_error_text;
        l_pg.h_destroy();
        return undefined;
    }
}

function live_snippet_destroy(arg0)
{
    if (arg0.h_script_array != undefined)
    {
        arg0.h_destroy();
    }
    else
    {
        show_error("This snippet is already destroyed", true);
    }
}

function live_snippet_call(arg0)
{
    var l_argc = argument_count - 1;
    var l_argv = array_create(l_argc);
    var l_i = 0;
    for (var l__ = 0; l__ < l_argc; l__++)
    {
        array_set(l_argv, l_i, argument[l_i + 1]);
        l_i++;
    }
    global.live_custom_self = self;
    global.live_custom_other = other;
    var l_th = arg0.h_call_v("snippet", l_argv, false);
    if (l_th == undefined)
    {
        global.live_result = "(script missing)";
        return false;
    }
    else if (l_th.h_status == 3)
    {
        global.live_result = l_th.h_result;
        return true;
    }
    else
    {
        global.live_result = l_th.h_error_text;
        if (global.live_result == undefined)
        {
            global.live_result = "(unknown error)";
        }
        return false;
    }
}

function live_update()
{
    if (global.live_request_url == undefined)
    {
        exit;
    }
    if (global.live_request_id == undefined)
    {
        var l_now = (current_time / 1000) * 1000;
        global.live_last_update_at = l_now;
        if (l_now > global.live_request_time)
        {
            global.live_request_time = l_now + (global.live_request_rate * 1000);
            var l_url;
            if (global.live_request_guid == undefined)
            {
                global.live_init_attempts -= 1;
                if (current_time > (global.live_init_timeout * 1000) && global.live_init_attempts < 0)
                {
                    if (!global.live_warned_about_init_timeout)
                    {
                        global.live_warned_about_init_timeout = true;
                        show_debug_message("Didn't receive a response from the server in " + string(global.live_init_timeout) + "s (live_init_timeout) - no longer retrying a connection");
                    }
                    exit;
                }
                global.live_log_script("Trying to connect to gmlive-server...", 0);
                l_url = global.live_request_url + "/init?password=" + global.live_request_password + "&version=" + "106" + "&noscripts=1&config=" + global.live_config + "&runtime=" + global.live_runtime_version + "&buildDate=" + gml_std_Std_stringify(global.live_build_date);
            }
            else
            {
                l_url = global.live_request_url + "/update?guid=" + ((global.live_request_guid == undefined) ? "null" : global.live_request_guid);
                l_url += live_get_update_tail();
            }
            global.live_request_id = http_get(l_url);
        }
    }
}

function live_init(arg0, arg1, arg2)
{
    global.live_log_script("GMLive.gml v1.0.76 for GM2022+", 0);
    if (arg1 != undefined)
    {
        var l_url_last = string_length(arg1) - 1;
        if (string_ord_at(arg1, l_url_last + 1) == 47)
        {
            arg1 = gml_std_string_substring(arg1, 0, l_url_last);
        }
    }
    global.live_log_script("Initializing...", 0);
    global.live_config = "Default";
    global.live_runtime_version = "2024.14.3.260";
    var l_date1 = gml_std_Date_now();
    l_date1.h_date = 46120.37177886718;
    global.live_build_date = l_date1.h_getTime();
    global.live_request_rate = arg0;
    global.live_request_url = arg1;
    global.live_request_password = arg2;
    var l_srs = asset_get_index("shader_replace_simple");
    if (l_srs != -1)
    {
        global.live_shader_updated = l_srs;
    }
    global.live_log_script("Indexing assets...", 0);
    live_bits_gmlive_indexer_add_assets();
    live_bits_gmlive_indexer_add_scripts();
    global.live_log_script("Indexed OK!", 0);
}

function live_preinit_project_fake_call()
{
    global.live_name = undefined;
    return false;
}

function live_preinit_project_lf(arg0, arg1)
{
    if (arg0)
    {
        global.live_name = arg1;
        return arg1;
    }
    else
    {
        return global.live_name;
    }
}

function live_preinit_project()
{
    gml_var_add("live_name", live_preinit_project_lf);
    gml_const_add("live_result", false);
    var l_f = new gml_func();
    l_f.h_set("live_call(...):", live_preinit_project_fake_call);
    variable_struct_set(global.gml_func_map, l_f.h_name, l_f);
    l_f = new gml_func();
    l_f.h_set("live_defcall(...):", live_preinit_project_fake_call);
    variable_struct_set(global.gml_func_map, l_f.h_name, l_f);
    l_f = new gml_func();
    l_f.h_set("live_call_ext(...):", live_preinit_project_fake_call);
    variable_struct_set(global.gml_func_map, l_f.h_name, l_f);
    l_f = new gml_func();
    l_f.h_set("live_defcall_ext(...):", live_preinit_project_fake_call);
    variable_struct_set(global.gml_func_map, l_f.h_name, l_f);
    l_f = new gml_func();
    l_f.h_set("live_auto_call_1():", live_preinit_project_fake_call);
    variable_struct_set(global.gml_func_map, l_f.h_name, l_f);
    l_f = new gml_func();
    l_f.h_set("live_method(self, func):", live_method);
    variable_struct_set(global.gml_func_map, l_f.h_name, l_f);
    l_f = new gml_func();
    l_f.h_set("method(self, func):", live_method);
    variable_struct_set(global.gml_func_map, l_f.h_name, l_f);
    l_f = new gml_func();
    l_f.h_set("live_method_get_self(func):", live_method_get_self);
    variable_struct_set(global.gml_func_map, l_f.h_name, l_f);
    l_f = new gml_func();
    l_f.h_set("method_get_self(func):", live_method_get_self);
    variable_struct_set(global.gml_func_map, l_f.h_name, l_f);
    l_f = new gml_func();
    l_f.h_set("live_execute_string(:string):", live_execute_string);
    variable_struct_set(global.gml_func_map, l_f.h_name, l_f);
    l_f = new gml_func();
    l_f.h_set("live_snippet_create(:string, :string=\"snippet\"):", live_snippet_create);
    variable_struct_set(global.gml_func_map, l_f.h_name, l_f);
    l_f = new gml_func();
    l_f.h_set("live_snippet_call(snip, ...rest):", live_snippet_call);
    variable_struct_set(global.gml_func_map, l_f.h_name, l_f);
    l_f = new gml_func();
    l_f.h_set("live_snippet_destroy(snip):", live_snippet_destroy);
    variable_struct_set(global.gml_func_map, l_f.h_name, l_f);
    l_f = new gml_func();
    l_f.h_set("sprite_set_live(spr:index, status:bool)", sprite_set_live);
    variable_struct_set(global.gml_func_map, l_f.h_name, l_f);
    l_f = new gml_func();
    l_f.h_set("shader_set_live(sh:index, status:bool)", shader_set_live);
    variable_struct_set(global.gml_func_map, l_f.h_name, l_f);
    l_f = new gml_func();
    l_f.h_set("path_set_live(pt:index, status:bool)", path_set_live);
    variable_struct_set(global.gml_func_map, l_f.h_name, l_f);
    l_f = new gml_func();
    l_f.h_set("room_set_live(rm:index, status:bool)", room_set_live);
    variable_struct_set(global.gml_func_map, l_f.h_name, l_f);
    l_f = new gml_func();
    l_f.h_set("room_goto_live(rm:index)", room_goto_live);
    variable_struct_set(global.gml_func_map, l_f.h_name, l_f);
}

function live_room_loader_run_cc(arg0, arg1)
{
    var l_ccProgram = live_gmlive_patcher_compile_ex(arg1, arg0);
    var l_ccError;
    if (l_ccProgram == undefined)
    {
        l_ccError = global.live_gmlive_patcher_error_text;
    }
    else
    {
        l_ccError = l_ccProgram.h_error_text;
    }
    if (l_ccError == undefined)
    {
        global.live_custom_self = self;
        global.live_custom_other = other;
        var l_ccThread = l_ccProgram.h_call_v(arg1, array_create(0));
        if (l_ccThread.h_status != 3)
        {
            l_ccError = l_ccThread.h_error_text;
            if (l_ccError == undefined)
            {
                l_ccError = arg1 + ": unknown execution error";
            }
        }
    }
    if (l_ccProgram != undefined)
    {
        l_ccProgram.h_destroy();
    }
    if (l_ccError != undefined)
    {
        global.live_log_script(l_ccError, 2);
    }
}

function live_room_loader_init_physics(arg0)
{
    if (arg0 == undefined)
    {
        exit;
    }
    if (ds_map_find_value(arg0, "PhysicsWorld"))
    {
        global.live_room_loader_use_physics = true;
        physics_world_create(ds_map_find_value(arg0, "PhysicsWorldPixToMeters"));
        physics_world_gravity(ds_map_find_value(arg0, "PhysicsWorldGravityX"), ds_map_find_value(arg0, "PhysicsWorldGravityY"));
    }
    else
    {
        global.live_room_loader_use_physics = false;
    }
}

function live_room_loader_anim_speed(arg0, arg1)
{
    if (arg1 == "0")
    {
        return arg0 / room_speed;
    }
    else
    {
        return arg0;
    }
}

function live_room_loader_run_yy_inst_cc(arg0, arg1)
{
    with (arg0)
    {
        var l_rname = ds_map_find_value(arg1, "name");
        event_perform(ev_pre_create, 0);
        var l_rcc = ds_map_find_value(arg1, "propertyCode");
        if (l_rcc != undefined && l_rcc != "")
        {
            live_room_loader_run_cc(l_rcc, l_rname + ":Properties");
        }
        event_perform(ev_create, 0);
        l_rcc = ds_map_find_value(arg1, "creationCode");
        if (l_rcc != undefined && l_rcc != "")
        {
            live_room_loader_run_cc(l_rcc, l_rname + ":CreationCode");
        }
    }
}

function live_room_loader_add_layer(arg0)
{
    var l_ql_depth = ds_map_find_value(arg0, "depth");
    var l_ql_name = ds_map_find_value(arg0, "name");
    var l_ql_sublayers = ds_map_find_value(arg0, "layers");
    var l_ql_sublayer_count = ds_list_size(l_ql_sublayers);
    var l__g = ds_map_find_value(arg0, "modelName");
    if (l__g == undefined)
    {
        show_debug_message("Unknown layer type " + gml_std_Std_stringify(ds_map_find_value(arg0, "modelName")));
    }
    else
    {
        switch (l__g)
        {
            case "GMRLayer":
                var l_rl = layer_get_id(l_ql_name);
                if (l_rl == -1)
                {
                    l_rl = layer_create(l_ql_depth, l_ql_name);
                    if (ds_map_find_value(arg0, "visible") != undefined)
                    {
                        layer_set_visible(l_rl, ds_map_find_value(arg0, "visible"));
                    }
                }
                if (l_ql_sublayers != undefined && l_ql_sublayers != pointer_null)
                {
                    var l_ql_sublayer_index = 0;
                    while (l_ql_sublayer_index < l_ql_sublayer_count)
                    {
                        live_room_loader_add_layer(ds_list_find_value(l_ql_sublayers, l_ql_sublayer_index++));
                    }
                }
                break;
            case "GMRBackgroundLayer":
                if (global.live_room_loader_apply_backgrounds)
                {
                    var l_rl = layer_get_id(l_ql_name);
                    if (l_rl == -1)
                    {
                        l_rl = layer_create(l_ql_depth, l_ql_name);
                        if (ds_map_find_value(arg0, "visible") != undefined)
                        {
                            layer_set_visible(l_rl, ds_map_find_value(arg0, "visible"));
                        }
                    }
                    if (l_ql_sublayers != undefined && l_ql_sublayers != pointer_null)
                    {
                        var l_ql_sublayer_index = 0;
                        while (l_ql_sublayer_index < l_ql_sublayer_count)
                        {
                            live_room_loader_add_layer(ds_list_find_value(l_ql_sublayers, l_ql_sublayer_index++));
                        }
                    }
                    var l_qb = arg0;
                    var l_s = ds_map_find_value(l_qb, "sprite");
                    var l_rb = layer_background_create(l_rl, (l_s != undefined) ? asset_get_index(l_s) : -1);
                    var l_aval = ds_map_find_value(l_qb, "color");
                    if (l_aval < 0)
                    {
                        l_aval += 4294967296;
                    }
                    if (l_aval != undefined)
                    {
                        layer_background_blend(l_rb, l_aval & c_white);
                        layer_background_alpha(l_rb, (l_aval >> 24) / 255);
                    }
                    l_aval = ds_map_find_value(l_qb, "htiled");
                    if (l_aval != undefined)
                    {
                        layer_background_htiled(l_rb, l_aval);
                    }
                    else
                    {
                        layer_background_htiled(l_rb, true);
                    }
                    l_aval = ds_map_find_value(l_qb, "vtiled");
                    if (l_aval != undefined)
                    {
                        layer_background_vtiled(l_rb, l_aval);
                    }
                    else
                    {
                        layer_background_vtiled(l_rb, true);
                    }
                    l_aval = ds_map_find_value(l_qb, "stretch");
                    if (l_aval != undefined)
                    {
                        layer_background_stretch(l_rb, l_aval);
                    }
                    else
                    {
                        layer_background_stretch(l_rb, false);
                    }
                    l_aval = ds_map_find_value(l_qb, "animationFPS");
                    if (l_aval != undefined)
                    {
                        layer_background_speed(l_rb, live_room_loader_anim_speed(l_aval, ds_map_find_value(l_qb, "animationSpeedType")));
                    }
                    l_aval = ds_map_find_value(l_qb, "x");
                    if (l_aval == undefined)
                    {
                        l_aval = 0;
                    }
                    layer_x(l_rl, global.live_room_loader_room_x + l_aval);
                    l_aval = ds_map_find_value(l_qb, "y");
                    if (l_aval == undefined)
                    {
                        l_aval = 0;
                    }
                    layer_y(l_rl, global.live_room_loader_room_y + l_aval);
                }
                break;
            case "GMRTileLayer":
                if (global.live_room_loader_apply_tiles)
                {
                    var l_rl = layer_get_id(l_ql_name);
                    if (l_rl == -1)
                    {
                        l_rl = layer_create(l_ql_depth, l_ql_name);
                        if (ds_map_find_value(arg0, "visible") != undefined)
                        {
                            layer_set_visible(l_rl, ds_map_find_value(arg0, "visible"));
                        }
                    }
                    if (l_ql_sublayers != undefined && l_ql_sublayers != pointer_null)
                    {
                        var l_ql_sublayer_index = 0;
                        while (l_ql_sublayer_index < l_ql_sublayer_count)
                        {
                            live_room_loader_add_layer(ds_list_find_value(l_ql_sublayers, l_ql_sublayer_index++));
                        }
                    }
                    var l_qt = arg0;
                    var l_qtt = ds_map_find_value(l_qt, "tiles");
                    var l_qtb64 = ds_map_find_value(l_qtt, "TileSerialiseDataZL");
                    var l_qtw = ds_map_find_value(l_qtt, "SerialiseWidth");
                    var l_qth = ds_map_find_value(l_qtt, "SerialiseHeight");
                    var l_tileset1 = is_string(ds_map_find_value(l_qt, "tileset")) ? asset_get_index(ds_map_find_value(l_qt, "tileset")) : -1;
                    var l_rx = 0;
                    var l_ry = 0;
                    var l_rt = layer_tilemap_create(l_rl, global.live_room_loader_room_x + ds_map_find_value(l_qt, "x"), global.live_room_loader_room_y + ds_map_find_value(l_qt, "y"), l_tileset1, l_qtw, l_qth);
                    if (is_string(l_qtb64))
                    {
                        var l_qtbz = buffer_base64_decode(l_qtb64);
                        if (l_qtbz == -1)
                        {
                            show_error("Couldn't decode base64-decoded data", true);
                        }
                        var l_qtb = buffer_decompress(l_qtbz);
                        if (l_qtb == -1)
                        {
                            show_error("Couldn't decompress ZLIB-compressed tile data", true);
                        }
                        var l_qti = 0;
                        for (var l_y = 0; l_y < l_qth; l_y++)
                        {
                            for (var l_x = 0; l_x < l_qtw; l_x++)
                            {
                                var l_td = buffer_peek(l_qtb, l_qti * 4, buffer_u32);
                                l_qti++;
                                if (tile_get_empty(l_td))
                                {
                                    l_td = 0;
                                }
                                tilemap_set(l_rt, l_td, l_rx + l_x, l_ry + l_y);
                            }
                        }
                        buffer_delete(l_qtbz);
                        buffer_delete(l_qtb);
                    }
                    else
                    {
                        var l_qtd = ds_map_find_value(l_qtt, "TileSerialiseData");
                        var l_qti = 0;
                        for (var l_y = 0; l_y < l_qth; l_y++)
                        {
                            for (var l_x = 0; l_x < l_qtw; l_x++)
                            {
                                var l_td = ds_list_find_value(l_qtd, l_qti++);
                                if (tile_get_empty(l_td))
                                {
                                    l_td = 0;
                                }
                                tilemap_set(l_rt, l_td, l_rx + l_x, l_ry + l_y);
                            }
                        }
                    }
                }
                break;
            case "GMRInstanceLayer":
                if (global.live_room_loader_apply_instances)
                {
                    var l_rl = layer_get_id(l_ql_name);
                    if (l_rl == -1)
                    {
                        l_rl = layer_create(l_ql_depth, l_ql_name);
                        if (ds_map_find_value(arg0, "visible") != undefined)
                        {
                            layer_set_visible(l_rl, ds_map_find_value(arg0, "visible"));
                        }
                    }
                    if (l_ql_sublayers != undefined && l_ql_sublayers != pointer_null)
                    {
                        var l_ql_sublayer_index = 0;
                        while (l_ql_sublayer_index < l_ql_sublayer_count)
                        {
                            live_room_loader_add_layer(ds_list_find_value(l_ql_sublayers, l_ql_sublayer_index++));
                        }
                    }
                    var l_qi = arg0;
                    var l_rx = global.live_room_loader_room_x;
                    var l_ry = global.live_room_loader_room_y;
                    var l_instances = ds_map_find_value(l_qi, "instances");
                    var l_n = ds_list_size(l_instances);
                    var l_base = global.live_blank_object;
                    if (l_n != 0)
                    {
                        if (!object_exists(l_base))
                        {
                            show_error("Please add a blank object and set live_blank_object to point at it in obj_gmlive's create event.", true);
                        }
                    }
                    var l_lco = global.live_room_loader_object_cache;
                    var l_i = -1;
                    while (++l_i < l_n)
                    {
                        var l_qinst = ds_list_find_value(l_instances, l_i);
                        var l_rnext = instance_create_layer(l_rx + ds_map_find_value(l_qinst, "x"), l_ry + ds_map_find_value(l_qinst, "y"), l_rl, l_base);
                        var l_qid = ds_map_find_value(l_qinst, "name");
                        ds_map_set(global.live_room_loader_inst_map_yy, l_qid, l_qinst);
                        ds_map_set(global.live_room_loader_inst_map_gml, l_qid, l_rnext);
                        with (l_rnext)
                        {
                            gml_const_add(ds_map_find_value(l_qinst, "name"), real(int64(self.id)));
                            var l_aval = ds_map_find_value(l_qinst, "rotation");
                            if (l_aval != undefined)
                            {
                                self.image_angle = l_aval;
                            }
                            l_aval = ds_map_find_value(l_qinst, "scaleX");
                            if (l_aval != undefined)
                            {
                                self.image_xscale = l_aval;
                            }
                            l_aval = ds_map_find_value(l_qinst, "scaleY");
                            if (l_aval != undefined)
                            {
                                self.image_yscale = l_aval;
                            }
                            l_aval = ds_map_find_value(l_qinst, "imageIndex");
                            if (l_aval != undefined)
                            {
                                self.image_index = l_aval;
                            }
                            l_aval = ds_map_find_value(l_qinst, "imageSpeed");
                            if (l_aval != undefined)
                            {
                                self.image_speed = l_aval;
                            }
                            var l_f = ds_map_find_value(l_qinst, "color");
                            if (l_f < 0)
                            {
                                l_f += 4294967296;
                            }
                            if (l_f != undefined)
                            {
                                self.image_blend = l_f & c_white;
                                self.image_alpha = (l_f >> 24) / 255;
                            }
                            var l_s = ds_map_find_value(l_qinst, "obj");
                            var l_id = ds_map_find_value(l_lco, l_s);
                            if (l_id == undefined)
                            {
                                l_id = asset_get_index(l_s);
                                ds_map_set(l_lco, l_s, l_id);
                            }
                            instance_change(l_id, false);
                        }
                    }
                }
                break;
            case "GMRAssetLayer":
                if (global.live_room_loader_apply_sprites)
                {
                    var l_rl = layer_get_id(l_ql_name);
                    if (l_rl == -1)
                    {
                        l_rl = layer_create(l_ql_depth, l_ql_name);
                        if (ds_map_find_value(arg0, "visible") != undefined)
                        {
                            layer_set_visible(l_rl, ds_map_find_value(arg0, "visible"));
                        }
                    }
                    if (l_ql_sublayers != undefined && l_ql_sublayers != pointer_null)
                    {
                        var l_ql_sublayer_index = 0;
                        while (l_ql_sublayer_index < l_ql_sublayer_count)
                        {
                            live_room_loader_add_layer(ds_list_find_value(l_ql_sublayers, l_ql_sublayer_index++));
                        }
                    }
                    var l_sprites = ds_map_find_value(arg0, "assets");
                    var l_n = ds_list_size(l_sprites);
                    var l_lcs = global.live_room_loader_sprite_cache;
                    var l_rx = global.live_room_loader_room_x;
                    var l_ry = global.live_room_loader_room_y;
                    var l_i = l_n;
                    while (--l_i >= 0)
                    {
                        var l_qspr = ds_list_find_value(l_sprites, l_i);
                        var l_s = ds_map_find_value(l_qspr, "sprite");
                        var l_rspr = l_rx + ds_map_find_value(l_qspr, "x");
                        var l_rspr1 = l_ry + ds_map_find_value(l_qspr, "y");
                        var l_id = ds_map_find_value(l_lcs, l_s);
                        if (l_id == undefined)
                        {
                            l_id = asset_get_index(l_s);
                            ds_map_set(l_lcs, l_s, l_id);
                        }
                        var l_rspr2 = layer_sprite_create(l_rl, l_rspr, l_rspr1, l_id);
                        var l_aval = ds_map_find_value(l_qspr, "frameIndex");
                        if (l_aval != undefined)
                        {
                            layer_sprite_index(l_rspr2, l_aval);
                        }
                        l_aval = ds_map_find_value(l_qspr, "scaleX");
                        if (l_aval != undefined)
                        {
                            layer_sprite_xscale(l_rspr2, l_aval);
                        }
                        l_aval = ds_map_find_value(l_qspr, "scaleY");
                        if (l_aval != undefined)
                        {
                            layer_sprite_yscale(l_rspr2, l_aval);
                        }
                        l_aval = ds_map_find_value(l_qspr, "rotation");
                        if (l_aval != undefined)
                        {
                            layer_sprite_angle(l_rspr2, l_aval);
                        }
                        var l_f = ds_map_find_value(l_qspr, "color");
                        if (l_f < 0)
                        {
                            l_f += 4294967296;
                        }
                        if (l_f != undefined)
                        {
                            layer_sprite_blend(l_rspr2, l_f & 16777215);
                            layer_sprite_alpha(l_rspr2, (l_f >> 24) / 255);
                        }
                        if (ds_map_find_value(l_qspr, "animationFPS") != undefined)
                        {
                            layer_sprite_speed(l_rspr2, live_room_loader_anim_speed(ds_map_find_value(l_qspr, "animationFPS"), ds_map_find_value(l_qspr, "animationSpeedType")));
                        }
                    }
                }
                break;
            case "GMREffectLayer":
                if (global.live_room_loader_apply_filters)
                {
                    var l_rl = layer_get_id(l_ql_name);
                    if (l_rl == -1)
                    {
                        l_rl = layer_create(l_ql_depth, l_ql_name);
                        if (ds_map_find_value(arg0, "visible") != undefined)
                        {
                            layer_set_visible(l_rl, ds_map_find_value(arg0, "visible"));
                        }
                    }
                    if (l_ql_sublayers != undefined && l_ql_sublayers != pointer_null)
                    {
                        var l_ql_sublayer_index = 0;
                        while (l_ql_sublayer_index < l_ql_sublayer_count)
                        {
                            live_room_loader_add_layer(ds_list_find_value(l_ql_sublayers, l_ql_sublayer_index++));
                        }
                    }
                    var l_fxl = arg0;
                    var l_s = ds_map_find_value(l_fxl, "effectType");
                    if (l_s == undefined || l_s == pointer_null)
                    {
                        exit;
                    }
                    var l_fx1 = fx_create(l_s);
                    var l__g_list = ds_map_find_value(l_fxl, "properties");
                    var l__g_index = 0;
                    while (l__g_index < ds_list_size(l__g_list))
                    {
                        var l_pp = ds_list_find_value(l__g_list, l__g_index++);
                        switch (ds_map_find_value(l_pp, "type"))
                        {
                            case 1:
                                l_s = ds_map_find_value(l_pp, "value");
                                if (string_ord_at(l_s, 1) != 35)
                                {
                                    continue;
                                }
                                var l_f = real(int64(ptr(string_delete(l_s, 1, 1))));
                                if (l_f < 0)
                                {
                                    l_f += 4294967296;
                                }
                                fx_set_parameter(l_fx1, ds_map_find_value(l_pp, "name"), (l_f % 256) / 255, (((l_f / 256) | 0) % 256) / 255, (((l_f / 65536) | 0) % 256) / 255, ((l_f / 16777216) | 0) / 255);
                                break;
                            case 0:
                                var l_f = real(ds_map_find_value(l_pp, "value"));
                                fx_set_parameter(l_fx1, ds_map_find_value(l_pp, "name"), l_f);
                                break;
                            case 2:
                                l_s = ds_map_find_value(l_pp, "value");
                                if (l_s == undefined || l_s == pointer_null)
                                {
                                    continue;
                                }
                                var l_f = asset_get_index(l_s);
                                if (l_f != -1)
                                {
                                    fx_set_parameter(l_fx1, ds_map_find_value(l_pp, "name"), l_f);
                                }
                                break;
                            default:
                        }
                    }
                    layer_set_fx(l_rl, l_fx1);
                }
                break;
            case "GMRPathLayer":
                break;
            default:
                show_debug_message("Unknown layer type " + gml_std_Std_stringify(ds_map_find_value(arg0, "modelName")));
        }
    }
}

function live_room_loader_run_impl2(arg0)
{
    global.live_log_script("Loading " + ds_map_find_value(arg0, "name") + "...", 0);
    ds_map_clear(global.live_room_loader_inst_map_gml);
    ds_map_clear(global.live_room_loader_inst_map_yy);
    if (global.live_room_loader_apply_settings)
    {
        room_width = ds_map_find_value(ds_map_find_value(arg0, "roomSettings"), "Width");
        room_height = ds_map_find_value(ds_map_find_value(arg0, "roomSettings"), "Height");
        live_room_loader_init_physics(ds_map_find_value(arg0, "physicsSettings"));
    }
    if (global.live_room_loader_apply_views)
    {
        var l_aval = ds_map_find_value(ds_map_find_value(arg0, "viewSettings"), "enableViews");
        if (l_aval != undefined)
        {
            view_enabled = l_aval;
        }
        else
        {
            view_enabled = false;
        }
        var l_qvs = ds_map_find_value(arg0, "views");
        if (l_qvs != undefined)
        {
            var l_i = 0;
            l__g1 = ds_list_size(l_qvs);
            while (l_i < l__g1)
            {
                var l_qv = ds_list_find_value(l_qvs, l_i);
                if (l_qv == undefined)
                {
                }
                else
                {
                    var l_rv = l_i;
                    l_aval = ds_map_find_value(l_qv, "visible");
                    if (l_aval != undefined)
                    {
                        view_visible[l_rv] = l_aval;
                    }
                    else
                    {
                        view_visible[l_rv] = false;
                    }
                    l_aval = ds_map_find_value(l_qv, "xport");
                    if (l_aval != undefined)
                    {
                        view_xport[l_rv] = l_aval;
                    }
                    else
                    {
                        view_xport[l_rv] = 0;
                    }
                    l_aval = ds_map_find_value(l_qv, "yport");
                    if (l_aval != undefined)
                    {
                        view_yport[l_rv] = l_aval;
                    }
                    else
                    {
                        view_yport[l_rv] = 0;
                    }
                    l_aval = ds_map_find_value(l_qv, "wport");
                    if (l_aval != undefined)
                    {
                        view_wport[l_rv] = l_aval;
                    }
                    else
                    {
                        view_wport[l_rv] = 1024;
                    }
                    l_aval = ds_map_find_value(l_qv, "hport");
                    if (l_aval != undefined)
                    {
                        view_hport[l_rv] = l_aval;
                    }
                    else
                    {
                        view_hport[l_rv] = 768;
                    }
                    var l_rc = view_camera[l_rv];
                    var l_vx = ds_map_find_value(l_qv, "xview");
                    if (l_vx == undefined)
                    {
                        l_vx = 0;
                    }
                    var l_vy = ds_map_find_value(l_qv, "yview");
                    if (l_vy == undefined)
                    {
                        l_vy = 0;
                    }
                    camera_set_view_pos(l_rc, global.live_room_loader_room_x + l_vx, global.live_room_loader_room_y + l_vy);
                    l_vx = ds_map_find_value(l_qv, "wview");
                    if (l_vx == undefined)
                    {
                        l_vx = 1024;
                    }
                    l_vy = ds_map_find_value(l_qv, "hview");
                    if (l_vy == undefined)
                    {
                        l_vy = 768;
                    }
                    camera_set_view_size(l_rc, l_vx, l_vy);
                    l_aval = ds_map_find_value(l_qv, "obj");
                    if (l_aval != undefined)
                    {
                        camera_set_view_target(l_rc, asset_get_index(l_aval));
                    }
                    l_vx = ds_map_find_value(l_qv, "hspeed");
                    if (l_vx == undefined)
                    {
                        l_vx = -1;
                    }
                    l_vy = ds_map_find_value(l_qv, "vspeed");
                    if (l_vy == undefined)
                    {
                        l_vy = -1;
                    }
                    camera_set_view_speed(l_rc, l_vx, l_vy);
                    l_vx = ds_map_find_value(l_qv, "hborder");
                    if (l_vx == undefined)
                    {
                        l_vx = 32;
                    }
                    l_vy = ds_map_find_value(l_qv, "vborder");
                    if (l_vy == undefined)
                    {
                        l_vy = 32;
                    }
                    camera_set_view_border(l_rc, l_vx, l_vy);
                }
                l_i++;
            }
        }
    }
    var l_lrs = ds_map_find_value(arg0, "layers");
    var l_lrk = ds_list_size(l_lrs);
    var l_lri = 0;
    var l__g1 = ds_list_size(l_lrs);
    while (l_lri < l__g1)
    {
        live_room_loader_add_layer(ds_list_find_value(l_lrs, l_lrk));
        l_lri++;
    }
    var l__g_list = ds_map_find_value(arg0, "instanceCreationOrderIDs");
    var l__g_index = 0;
    while (l__g_index < ds_list_size(l__g_list))
    {
        var l_id = ds_list_find_value(l__g_list, l__g_index++);
        var l_qinst = ds_map_find_value(global.live_room_loader_inst_map_yy, l_id);
        if (l_qinst == undefined)
        {
            global.live_log_script(l_id + " is in instanceCreationOrderIDs but no instance exists.", 1);
            continue;
        }
        live_room_loader_run_yy_inst_cc(ds_map_find_value(global.live_room_loader_inst_map_gml, l_id), l_qinst);
    }
    ds_map_clear(global.live_room_loader_inst_map_gml);
    ds_map_clear(global.live_room_loader_inst_map_yy);
    var l_s = ds_map_find_value(arg0, "creationCode");
    if (l_s != undefined && l_s != "")
    {
        live_room_loader_run_cc(l_s, ds_map_find_value(arg0, "name") + ":CreationCode");
    }
}

function live_room_start()
{
    var l_rq = global.live_live_room;
    if (!room_exists(l_rq))
    {
        show_error("No live room was specified.", true);
    }
    var l_rd = ds_map_find_value(global.live_live_room_data, l_rq);
    if (l_rd == undefined)
    {
        global.live_log_script("Warning: no live data had been received yet for " + room_get_name(l_rq) + ", transitioning to the regular version.", 1);
        room_goto(l_rq);
        exit;
    }
    var l_rm2 = json_decode(l_rd);
    live_room_loader_run_impl2(l_rm2);
    ds_map_destroy(l_rm2);
}

function live_bits_gmlive_indexer_add_assets()
{
    for (var l_i = 0; sprite_exists(l_i); l_i++)
    {
        gml_asset_add(sprite_get_name(l_i), l_i);
    }
    for (var l_i = 0; font_exists(l_i); l_i++)
    {
        gml_asset_add(font_get_name(l_i), l_i);
    }
    for (var l_i = 0; object_exists(l_i); l_i++)
    {
        gml_asset_add(object_get_name(l_i), l_i);
    }
    for (var l_i = 0; audio_exists(l_i); l_i++)
    {
        gml_asset_add(audio_get_name(l_i), l_i);
    }
    for (var l_i = 0; l_i < 1024 && string_ord_at(tileset_get_name(l_i), 1) != 60; l_i++)
    {
        gml_asset_add(tileset_get_name(l_i), l_i);
    }
    for (var l_i = 0; room_exists(l_i); l_i++)
    {
        gml_asset_add(room_get_name(l_i), l_i);
    }
    for (var l_i = 0; path_exists(l_i); l_i++)
    {
        gml_asset_add(path_get_name(l_i), l_i);
    }
    for (var l_i = 0; timeline_exists(l_i); l_i++)
    {
        gml_asset_add(timeline_get_name(l_i), l_i);
    }
    for (var l_i = 0; l_i < 256; l_i++)
    {
        var l_s = audio_group_name(l_i);
        if (l_s == "<undefined>" || l_s == "" || l_s == undefined)
        {
            break;
        }
        gml_asset_add(l_s, l_i);
    }
}

function live_bits_gmlive_indexer_add_scripts()
{
    var l_start = 100000;
    var l_k = l_start;
    var l__g1 = l_start + 100000;
    while (l_k < l__g1)
    {
        if (!script_exists(l_k))
        {
            break;
        }
        var l_name = script_get_name(l_k);
        if (string_ord_at(l_name, 1) == 60)
        {
        }
        else if (variable_struct_exists(global.gml_func_map, l_name))
        {
        }
        else if (asset_get_index(l_name) != l_k)
        {
        }
        else
        {
            var l_f = new gml_func();
            l_f.h_init_mystery(l_name, l_k);
            variable_struct_set(global.gml_func_map, l_name, l_f);
        }
        l_k++;
    }
}

function live_bits_gmlive_ready_run()
{
    global.vm_gml_thread_exec_slice_funcs = vm_gml_thread_exec_slice_init();
    global.vm_impl_gml_thread_construct_funcs = vm_impl_gml_thread_construct_init();
    global.vm_group_op_funcs = vm_group_op_impl();
    global.vm_v2_gml_thread_v2_handlers = vm_v2_gml_thread_v2_handlers_init();
}

function gml_link(arg0, arg1) constructor
{
    static h_value = undefined;
    static h_next = undefined;
    
    self.h_value = arg0;
    self.h_next = arg1;
}

function gml_action_list_print_action_value(arg0)
{
    if (arg0 == undefined)
    {
        return "null";
    }
    else if (is_numeric(arg0))
    {
        if (!is_real(arg0) || sign(frac(arg0)) == 0)
        {
            return string(arg0);
        }
        else
        {
            return json_stringify(arg0);
        }
    }
    else if (is_string(arg0))
    {
        return json_stringify(arg0);
    }
    else
    {
        if (is_struct(arg0) && variable_struct_exists(arg0, "dump"))
        {
            return arg0.dump();
        }
        return gml_std_Std_stringify(arg0);
    }
}

function gml_action_list_print_action_get_func_name(arg0)
{
    var l_label = undefined;
    var l_name;
    if (is_method(arg0))
    {
        var l_scr = method_get_index(arg0);
        l_name = script_get_name(l_scr);
        l_label = ds_map_find_value(global.gml_func_name, l_scr);
    }
    else if (is_numeric(arg0) && script_exists(arg0))
    {
        l_name = script_get_name(arg0);
        l_label = ds_map_find_value(global.gml_func_name, arg0);
    }
    else
    {
        l_name = string(arg0);
    }
    if (l_label == undefined || l_label == l_name)
    {
        return l_name;
    }
    else
    {
        return l_label + "@" + l_name;
    }
}

function gml_action_list_print_action(arg0)
{
    var l_pos = gml_std_haxe_enum_tools_getParameter(arg0, 0);
    var l_pre = "L" + string(l_pos[1]) + "\tc" + string(l_pos[2]) + "\t";
    var l_r = l_pre + gml_std_Type_enumConstructor(arg0);
    switch (arg0.__enumIndex__)
    {
        case 123:
            return l_pre + ("{ tag : \"" + arg0.h_tag + "\",") + string_delete(string(arg0.h_ctx), 1, 1);
        case 63:
            return l_r + "(" + arg0.h_script.h_name + ", " + string(arg0.h_argc) + ")";
        case 9:
            return l_r + "(" + gml_std_gml_internal_ArrayImpl_join(arg0.h_fields, ",") + ")";
        case 42:
            return l_r + "(\"" + gml_action_list_print_action_get_func_name(arg0.h_f) + "\", \"" + gml_action_list_print_action_get_func_name(arg0.h_ch) + "\")";
        case 41:
            return l_r + "(\"" + gml_action_list_print_action_get_func_name(arg0.h_f) + "\")";
        case 66:
            var l_args1 = arg0.h_args;
            l_r += ("(\"" + gml_action_list_print_action_get_func_name(arg0.h_func) + "\", " + string(arg0.h_argc) + ", [");
            var l_sep = false;
            var l__g = 0;
            while (l__g < array_length(l_args1))
            {
                var l_f = l_args1[l__g];
                l__g++;
                if (l_sep)
                {
                    l_r += ",";
                }
                else
                {
                    l_sep = true;
                }
                l_r += script_get_name(l_f);
            }
            l_r += ("], " + script_get_name(arg0.h_rest) + (", " + gml_std_Std_stringify(arg0.h_inst) + ", " + string(arg0.h_out) + ")"));
            return l_r;
        case 97:
            return l_r + "(jt: " + vm__gml_value_map_gml_value_map_impl__print(arg0.h_jumptable) + ", default: " + string(arg0.h_defaultPos) + ")";
        case 67:
            return l_r + "(func: " + gml_action_list_print_action_get_func_name(arg0.h_func) + ")";
        case 68:
            return l_r + "(func: " + gml_action_list_print_action_get_func_name(arg0.h_func) + ")";
        case 69:
            return l_r + "(func: " + gml_action_list_print_action_get_func_name(arg0.h_func) + ")";
        case 70:
            return l_r + "(func: " + gml_action_list_print_action_get_func_name(arg0.h_func) + ")";
        case 71:
            return l_r + "(func: " + gml_action_list_print_action_get_func_name(arg0.h_func) + ")";
        case 72:
            return l_r + "(func: " + gml_action_list_print_action_get_func_name(arg0.h_func) + ")";
        case 73:
            return l_r + "(func: " + gml_action_list_print_action_get_func_name(arg0.h_func) + ")";
        case 74:
            return l_r + "(func: " + gml_action_list_print_action_get_func_name(arg0.h_func) + ")";
        case 75:
            return l_r + "(func: " + gml_action_list_print_action_get_func_name(arg0.h_func) + ")";
        case 76:
            return l_r + "(func: " + gml_action_list_print_action_get_func_name(arg0.h_func) + ")";
        case 77:
            return l_r + "(ind: " + string(arg0.h_local) + ", func: " + gml_action_list_print_action_get_func_name(arg0.h_func) + ")";
        case 78:
            return l_r + "(ind: " + string(arg0.h_local) + ", func: " + gml_action_list_print_action_get_func_name(arg0.h_func) + ")";
        case 79:
            return l_r + "(ind: " + string(arg0.h_local) + ", func: " + gml_action_list_print_action_get_func_name(arg0.h_func) + ")";
        case 80:
            return l_r + "(ind: " + string(arg0.h_local) + ", func: " + gml_action_list_print_action_get_func_name(arg0.h_func) + ")";
        case 81:
            return l_r + "(ind: " + string(arg0.h_local) + ", func: " + gml_action_list_print_action_get_func_name(arg0.h_func) + ")";
        case 82:
            return l_r + "(ind: " + string(arg0.h_local) + ", func: " + gml_action_list_print_action_get_func_name(arg0.h_func) + ")";
        case 83:
            return l_r + "(ind: " + string(arg0.h_local) + ", func: " + gml_action_list_print_action_get_func_name(arg0.h_func) + ")";
        case 84:
            return l_r + "(ind: " + string(arg0.h_local) + ", func: " + gml_action_list_print_action_get_func_name(arg0.h_func) + ")";
        case 85:
            return l_r + "(ind: " + string(arg0.h_local) + ", func: " + gml_action_list_print_action_get_func_name(arg0.h_func) + ")";
        case 86:
            return l_r + "(ind: " + string(arg0.h_local) + ", func: " + gml_action_list_print_action_get_func_name(arg0.h_func) + ")";
    }
    if (is_struct(arg0))
    {
        var l_enumParams = arg0.__enumParams__;
        l_argc = array_length(l_enumParams);
        if (l_argc > 1)
        {
            l_r += "(";
            for (var l_k = 1; l_k < l_argc; l_k++)
            {
                if (l_k > 1)
                {
                    l_r += ", ";
                }
                var l_f = l_enumParams[l_k];
                l_r += (l_f + ": " + gml_action_list_print_action_value(variable_struct_get(arg0, l_f)));
            }
            l_r += ")";
        }
        return l_r;
    }
    var l_argc = gml_std_haxe_enum_tools_getParameterCount(arg0);
    if (l_argc > 1)
    {
        l_r += "(";
        for (var l_k = 1; l_k < l_argc; l_k++)
        {
            if (l_k > 1)
            {
                l_r += ", ";
            }
            l_r += gml_action_list_print_action_value(gml_std_haxe_enum_tools_getParameter(arg0, l_k));
        }
        l_r += ")";
    }
    return l_r;
}

function gml_action_list_print(arg0)
{
    var l_r = new gml_std_StringBuf();
    var l_i = 0;
    var l__g1 = ds_list_size(arg0);
    while (l_i < l__g1)
    {
        var l_act = ds_list_find_value(arg0, l_i);
        if (l_i > 0)
        {
            l_r.h_addChar(10);
        }
        var l_actStr = gml_action_list_print_action(l_act);
        l_act.__string__ = l_actStr;
        l_r.h_add(l_i);
        l_r.h_addChar(9);
        l_r.h_add(l_actStr);
        l_i++;
    }
    return l_r.h_toString();
}

function gml_thread_scope_create(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
{
    var l_this = [global.mt_gml_thread_scope];
    array_copy(l_this, 1, global.mq_gml_thread_scope, 1, 10);
    array_set(l_this, 8, undefined);
    array_set(l_this, 7, undefined);
    array_set(l_this, 5, array_create(16));
    array_set(l_this, 1, arg0);
    array_set(l_this, 2, arg1);
    array_set(l_this, 3, arg2);
    array_set(l_this, 4, arg3);
    array_set(l_this, 9, arg7);
    array_set(l_this, 6, [2, arg5, arg4]);
    array_set(l_this, 10, arg6);
    return l_this;
}

function vm_gml_thread_exec_slice_longcall(arg0, arg1, arg2, arg3)
{
    if (is_method(arg0))
    {
        var l_scr = method_get_index(arg0);
        var l_me = method_get_self(arg0);
        if (l_me == undefined)
        {
            return script_execute_ext(l_scr, arg1, arg2, arg3);
        }
        else
        {
            with (l_me)
            {
                return script_execute_ext(l_scr, arg1, arg2, arg3);
            }
        }
        gml_thread_error("Instance that the function is bound to no longer exists");
        return undefined;
    }
    else
    {
        return script_execute_ext(arg0, arg1, arg2, arg3);
    }
}

function vm_gml_thread_exec_slice_init()
{
    return [vm_gml_thread_exec_slice_with0, vm_gml_thread_exec_slice_with1, vm_gml_thread_exec_slice_with2, vm_gml_thread_exec_slice_with3, vm_gml_thread_exec_slice_with4, vm_gml_thread_exec_slice_with5, vm_gml_thread_exec_slice_with6, vm_gml_thread_exec_slice_with7, vm_gml_thread_exec_slice_with8, vm_gml_thread_exec_slice_with9, vm_gml_thread_exec_slice_with10, vm_gml_thread_exec_slice_with11, vm_gml_thread_exec_slice_with12, vm_gml_thread_exec_slice_with13, vm_gml_thread_exec_slice_with14, vm_gml_thread_exec_slice_with15, vm_gml_thread_exec_slice_with16, vm_gml_thread_exec_slice_with17, vm_gml_thread_exec_slice_with18, vm_gml_thread_exec_slice_with19, vm_gml_thread_exec_slice_with20, vm_gml_thread_exec_slice_with21, vm_gml_thread_exec_slice_with22, vm_gml_thread_exec_slice_with23, vm_gml_thread_exec_slice_with24, vm_gml_thread_exec_slice_with25, vm_gml_thread_exec_slice_with26, vm_gml_thread_exec_slice_with27, vm_gml_thread_exec_slice_with28, vm_gml_thread_exec_slice_with29, vm_gml_thread_exec_slice_with30, vm_gml_thread_exec_slice_with31, vm_gml_thread_exec_slice_with32, vm_gml_thread_exec_slice_with33, vm_gml_thread_exec_slice_with34, vm_gml_thread_exec_slice_with35, vm_gml_thread_exec_slice_with36, vm_gml_thread_exec_slice_with37, vm_gml_thread_exec_slice_with38, vm_gml_thread_exec_slice_with39, vm_gml_thread_exec_slice_with40, vm_gml_thread_exec_slice_with41, vm_gml_thread_exec_slice_with42, vm_gml_thread_exec_slice_with43, vm_gml_thread_exec_slice_with44, vm_gml_thread_exec_slice_with45, vm_gml_thread_exec_slice_with46, vm_gml_thread_exec_slice_with47, vm_gml_thread_exec_slice_with48, vm_gml_thread_exec_slice_with49, vm_gml_thread_exec_slice_with50, vm_gml_thread_exec_slice_with51, vm_gml_thread_exec_slice_with52, vm_gml_thread_exec_slice_with53, vm_gml_thread_exec_slice_with54, vm_gml_thread_exec_slice_with55, vm_gml_thread_exec_slice_with56, vm_gml_thread_exec_slice_with57, vm_gml_thread_exec_slice_with58, vm_gml_thread_exec_slice_with59, vm_gml_thread_exec_slice_with60, vm_gml_thread_exec_slice_with61, vm_gml_thread_exec_slice_with62, vm_gml_thread_exec_slice_with63, vm_gml_thread_exec_slice_with64, vm_gml_thread_exec_slice_with65, vm_gml_thread_exec_slice_with66, vm_gml_thread_exec_slice_with67, vm_gml_thread_exec_slice_with68, vm_gml_thread_exec_slice_with69, vm_gml_thread_exec_slice_with70, vm_gml_thread_exec_slice_with71, vm_gml_thread_exec_slice_with72, vm_gml_thread_exec_slice_with73, vm_gml_thread_exec_slice_with74, vm_gml_thread_exec_slice_with75, vm_gml_thread_exec_slice_with76, vm_gml_thread_exec_slice_with77, vm_gml_thread_exec_slice_with78, vm_gml_thread_exec_slice_with79, vm_gml_thread_exec_slice_with80];
}

function vm_gml_thread_exec_slice_with0(arg0, arg1, arg2)
{
    return arg0();
}

function vm_gml_thread_exec_slice_with1(arg0, arg1, arg2)
{
    return arg0(arg1[arg2]);
}

function vm_gml_thread_exec_slice_with2(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1]);
}

function vm_gml_thread_exec_slice_with3(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2]);
}

function vm_gml_thread_exec_slice_with4(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3]);
}

function vm_gml_thread_exec_slice_with5(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4]);
}

function vm_gml_thread_exec_slice_with6(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5]);
}

function vm_gml_thread_exec_slice_with7(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6]);
}

function vm_gml_thread_exec_slice_with8(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7]);
}

function vm_gml_thread_exec_slice_with9(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8]);
}

function vm_gml_thread_exec_slice_with10(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9]);
}

function vm_gml_thread_exec_slice_with11(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10]);
}

function vm_gml_thread_exec_slice_with12(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11]);
}

function vm_gml_thread_exec_slice_with13(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12]);
}

function vm_gml_thread_exec_slice_with14(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13]);
}

function vm_gml_thread_exec_slice_with15(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14]);
}

function vm_gml_thread_exec_slice_with16(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15]);
}

function vm_gml_thread_exec_slice_with17(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16]);
}

function vm_gml_thread_exec_slice_with18(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17]);
}

function vm_gml_thread_exec_slice_with19(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18]);
}

function vm_gml_thread_exec_slice_with20(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19]);
}

function vm_gml_thread_exec_slice_with21(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20]);
}

function vm_gml_thread_exec_slice_with22(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21]);
}

function vm_gml_thread_exec_slice_with23(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22]);
}

function vm_gml_thread_exec_slice_with24(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23]);
}

function vm_gml_thread_exec_slice_with25(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24]);
}

function vm_gml_thread_exec_slice_with26(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25]);
}

function vm_gml_thread_exec_slice_with27(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26]);
}

function vm_gml_thread_exec_slice_with28(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27]);
}

function vm_gml_thread_exec_slice_with29(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28]);
}

function vm_gml_thread_exec_slice_with30(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29]);
}

function vm_gml_thread_exec_slice_with31(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30]);
}

function vm_gml_thread_exec_slice_with32(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31]);
}

function vm_gml_thread_exec_slice_with33(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32]);
}

function vm_gml_thread_exec_slice_with34(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33]);
}

function vm_gml_thread_exec_slice_with35(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34]);
}

function vm_gml_thread_exec_slice_with36(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35]);
}

function vm_gml_thread_exec_slice_with37(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36]);
}

function vm_gml_thread_exec_slice_with38(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37]);
}

function vm_gml_thread_exec_slice_with39(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38]);
}

function vm_gml_thread_exec_slice_with40(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39]);
}

function vm_gml_thread_exec_slice_with41(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40]);
}

function vm_gml_thread_exec_slice_with42(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41]);
}

function vm_gml_thread_exec_slice_with43(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42]);
}

function vm_gml_thread_exec_slice_with44(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43]);
}

function vm_gml_thread_exec_slice_with45(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44]);
}

function vm_gml_thread_exec_slice_with46(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45]);
}

function vm_gml_thread_exec_slice_with47(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46]);
}

function vm_gml_thread_exec_slice_with48(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47]);
}

function vm_gml_thread_exec_slice_with49(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48]);
}

function vm_gml_thread_exec_slice_with50(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49]);
}

function vm_gml_thread_exec_slice_with51(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50]);
}

function vm_gml_thread_exec_slice_with52(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51]);
}

function vm_gml_thread_exec_slice_with53(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52]);
}

function vm_gml_thread_exec_slice_with54(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53]);
}

function vm_gml_thread_exec_slice_with55(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54]);
}

function vm_gml_thread_exec_slice_with56(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55]);
}

function vm_gml_thread_exec_slice_with57(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55], arg1[arg2 + 56]);
}

function vm_gml_thread_exec_slice_with58(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55], arg1[arg2 + 56], arg1[arg2 + 57]);
}

function vm_gml_thread_exec_slice_with59(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55], arg1[arg2 + 56], arg1[arg2 + 57], arg1[arg2 + 58]);
}

function vm_gml_thread_exec_slice_with60(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55], arg1[arg2 + 56], arg1[arg2 + 57], arg1[arg2 + 58], arg1[arg2 + 59]);
}

function vm_gml_thread_exec_slice_with61(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55], arg1[arg2 + 56], arg1[arg2 + 57], arg1[arg2 + 58], arg1[arg2 + 59], arg1[arg2 + 60]);
}

function vm_gml_thread_exec_slice_with62(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55], arg1[arg2 + 56], arg1[arg2 + 57], arg1[arg2 + 58], arg1[arg2 + 59], arg1[arg2 + 60], arg1[arg2 + 61]);
}

function vm_gml_thread_exec_slice_with63(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55], arg1[arg2 + 56], arg1[arg2 + 57], arg1[arg2 + 58], arg1[arg2 + 59], arg1[arg2 + 60], arg1[arg2 + 61], arg1[arg2 + 62]);
}

function vm_gml_thread_exec_slice_with64(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55], arg1[arg2 + 56], arg1[arg2 + 57], arg1[arg2 + 58], arg1[arg2 + 59], arg1[arg2 + 60], arg1[arg2 + 61], arg1[arg2 + 62], arg1[arg2 + 63]);
}

function vm_gml_thread_exec_slice_with65(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55], arg1[arg2 + 56], arg1[arg2 + 57], arg1[arg2 + 58], arg1[arg2 + 59], arg1[arg2 + 60], arg1[arg2 + 61], arg1[arg2 + 62], arg1[arg2 + 63], arg1[arg2 + 64]);
}

function vm_gml_thread_exec_slice_with66(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55], arg1[arg2 + 56], arg1[arg2 + 57], arg1[arg2 + 58], arg1[arg2 + 59], arg1[arg2 + 60], arg1[arg2 + 61], arg1[arg2 + 62], arg1[arg2 + 63], arg1[arg2 + 64], arg1[arg2 + 65]);
}

function vm_gml_thread_exec_slice_with67(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55], arg1[arg2 + 56], arg1[arg2 + 57], arg1[arg2 + 58], arg1[arg2 + 59], arg1[arg2 + 60], arg1[arg2 + 61], arg1[arg2 + 62], arg1[arg2 + 63], arg1[arg2 + 64], arg1[arg2 + 65], arg1[arg2 + 66]);
}

function vm_gml_thread_exec_slice_with68(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55], arg1[arg2 + 56], arg1[arg2 + 57], arg1[arg2 + 58], arg1[arg2 + 59], arg1[arg2 + 60], arg1[arg2 + 61], arg1[arg2 + 62], arg1[arg2 + 63], arg1[arg2 + 64], arg1[arg2 + 65], arg1[arg2 + 66], arg1[arg2 + 67]);
}

function vm_gml_thread_exec_slice_with69(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55], arg1[arg2 + 56], arg1[arg2 + 57], arg1[arg2 + 58], arg1[arg2 + 59], arg1[arg2 + 60], arg1[arg2 + 61], arg1[arg2 + 62], arg1[arg2 + 63], arg1[arg2 + 64], arg1[arg2 + 65], arg1[arg2 + 66], arg1[arg2 + 67], arg1[arg2 + 68]);
}

function vm_gml_thread_exec_slice_with70(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55], arg1[arg2 + 56], arg1[arg2 + 57], arg1[arg2 + 58], arg1[arg2 + 59], arg1[arg2 + 60], arg1[arg2 + 61], arg1[arg2 + 62], arg1[arg2 + 63], arg1[arg2 + 64], arg1[arg2 + 65], arg1[arg2 + 66], arg1[arg2 + 67], arg1[arg2 + 68], arg1[arg2 + 69]);
}

function vm_gml_thread_exec_slice_with71(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55], arg1[arg2 + 56], arg1[arg2 + 57], arg1[arg2 + 58], arg1[arg2 + 59], arg1[arg2 + 60], arg1[arg2 + 61], arg1[arg2 + 62], arg1[arg2 + 63], arg1[arg2 + 64], arg1[arg2 + 65], arg1[arg2 + 66], arg1[arg2 + 67], arg1[arg2 + 68], arg1[arg2 + 69], arg1[arg2 + 70]);
}

function vm_gml_thread_exec_slice_with72(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55], arg1[arg2 + 56], arg1[arg2 + 57], arg1[arg2 + 58], arg1[arg2 + 59], arg1[arg2 + 60], arg1[arg2 + 61], arg1[arg2 + 62], arg1[arg2 + 63], arg1[arg2 + 64], arg1[arg2 + 65], arg1[arg2 + 66], arg1[arg2 + 67], arg1[arg2 + 68], arg1[arg2 + 69], arg1[arg2 + 70], arg1[arg2 + 71]);
}

function vm_gml_thread_exec_slice_with73(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55], arg1[arg2 + 56], arg1[arg2 + 57], arg1[arg2 + 58], arg1[arg2 + 59], arg1[arg2 + 60], arg1[arg2 + 61], arg1[arg2 + 62], arg1[arg2 + 63], arg1[arg2 + 64], arg1[arg2 + 65], arg1[arg2 + 66], arg1[arg2 + 67], arg1[arg2 + 68], arg1[arg2 + 69], arg1[arg2 + 70], arg1[arg2 + 71], arg1[arg2 + 72]);
}

function vm_gml_thread_exec_slice_with74(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55], arg1[arg2 + 56], arg1[arg2 + 57], arg1[arg2 + 58], arg1[arg2 + 59], arg1[arg2 + 60], arg1[arg2 + 61], arg1[arg2 + 62], arg1[arg2 + 63], arg1[arg2 + 64], arg1[arg2 + 65], arg1[arg2 + 66], arg1[arg2 + 67], arg1[arg2 + 68], arg1[arg2 + 69], arg1[arg2 + 70], arg1[arg2 + 71], arg1[arg2 + 72], arg1[arg2 + 73]);
}

function vm_gml_thread_exec_slice_with75(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55], arg1[arg2 + 56], arg1[arg2 + 57], arg1[arg2 + 58], arg1[arg2 + 59], arg1[arg2 + 60], arg1[arg2 + 61], arg1[arg2 + 62], arg1[arg2 + 63], arg1[arg2 + 64], arg1[arg2 + 65], arg1[arg2 + 66], arg1[arg2 + 67], arg1[arg2 + 68], arg1[arg2 + 69], arg1[arg2 + 70], arg1[arg2 + 71], arg1[arg2 + 72], arg1[arg2 + 73], arg1[arg2 + 74]);
}

function vm_gml_thread_exec_slice_with76(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55], arg1[arg2 + 56], arg1[arg2 + 57], arg1[arg2 + 58], arg1[arg2 + 59], arg1[arg2 + 60], arg1[arg2 + 61], arg1[arg2 + 62], arg1[arg2 + 63], arg1[arg2 + 64], arg1[arg2 + 65], arg1[arg2 + 66], arg1[arg2 + 67], arg1[arg2 + 68], arg1[arg2 + 69], arg1[arg2 + 70], arg1[arg2 + 71], arg1[arg2 + 72], arg1[arg2 + 73], arg1[arg2 + 74], arg1[arg2 + 75]);
}

function vm_gml_thread_exec_slice_with77(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55], arg1[arg2 + 56], arg1[arg2 + 57], arg1[arg2 + 58], arg1[arg2 + 59], arg1[arg2 + 60], arg1[arg2 + 61], arg1[arg2 + 62], arg1[arg2 + 63], arg1[arg2 + 64], arg1[arg2 + 65], arg1[arg2 + 66], arg1[arg2 + 67], arg1[arg2 + 68], arg1[arg2 + 69], arg1[arg2 + 70], arg1[arg2 + 71], arg1[arg2 + 72], arg1[arg2 + 73], arg1[arg2 + 74], arg1[arg2 + 75], arg1[arg2 + 76]);
}

function vm_gml_thread_exec_slice_with78(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55], arg1[arg2 + 56], arg1[arg2 + 57], arg1[arg2 + 58], arg1[arg2 + 59], arg1[arg2 + 60], arg1[arg2 + 61], arg1[arg2 + 62], arg1[arg2 + 63], arg1[arg2 + 64], arg1[arg2 + 65], arg1[arg2 + 66], arg1[arg2 + 67], arg1[arg2 + 68], arg1[arg2 + 69], arg1[arg2 + 70], arg1[arg2 + 71], arg1[arg2 + 72], arg1[arg2 + 73], arg1[arg2 + 74], arg1[arg2 + 75], arg1[arg2 + 76], arg1[arg2 + 77]);
}

function vm_gml_thread_exec_slice_with79(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55], arg1[arg2 + 56], arg1[arg2 + 57], arg1[arg2 + 58], arg1[arg2 + 59], arg1[arg2 + 60], arg1[arg2 + 61], arg1[arg2 + 62], arg1[arg2 + 63], arg1[arg2 + 64], arg1[arg2 + 65], arg1[arg2 + 66], arg1[arg2 + 67], arg1[arg2 + 68], arg1[arg2 + 69], arg1[arg2 + 70], arg1[arg2 + 71], arg1[arg2 + 72], arg1[arg2 + 73], arg1[arg2 + 74], arg1[arg2 + 75], arg1[arg2 + 76], arg1[arg2 + 77], arg1[arg2 + 78]);
}

function vm_gml_thread_exec_slice_with80(arg0, arg1, arg2)
{
    return arg0(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55], arg1[arg2 + 56], arg1[arg2 + 57], arg1[arg2 + 58], arg1[arg2 + 59], arg1[arg2 + 60], arg1[arg2 + 61], arg1[arg2 + 62], arg1[arg2 + 63], arg1[arg2 + 64], arg1[arg2 + 65], arg1[arg2 + 66], arg1[arg2 + 67], arg1[arg2 + 68], arg1[arg2 + 69], arg1[arg2 + 70], arg1[arg2 + 71], arg1[arg2 + 72], arg1[arg2 + 73], arg1[arg2 + 74], arg1[arg2 + 75], arg1[arg2 + 76], arg1[arg2 + 77], arg1[arg2 + 78], arg1[arg2 + 79]);
}

function gml_type_check_init()
{
    var l_r = {};
    l_r.any = gml_type_check_any;
    l_r.bool = gml_type_check_number;
    l_r.number = gml_type_check_number;
    variable_struct_set(l_r, "?number", gml_type_check_z_number);
    l_r.float = gml_type_check_number;
    variable_struct_set(l_r, "?float", gml_type_check_z_number);
    l_r.real = gml_type_check_number;
    variable_struct_set(l_r, "?real", gml_type_check_z_number);
    l_r.color = gml_type_check_number;
    l_r.date = gml_type_check_number;
    l_r.int = gml_type_check_int;
    l_r.index = gml_type_check_index;
    variable_struct_set(l_r, "id", gml_type_check_index);
    l_r.sprite = gml_type_check_index;
    l_r.background = gml_type_check_index;
    l_r.sound = gml_type_check_index;
    l_r.font = gml_type_check_index;
    l_r.script = gml_type_check_index;
    l_r.shader = gml_type_check_index;
    l_r.timeline = gml_type_check_index;
    l_r.object = gml_type_check_index;
    l_r.room = gml_type_check_index;
    l_r.buffer = gml_type_check_index;
    l_r.list = gml_type_check_index;
    l_r.grid = gml_type_check_index;
    l_r.string = gml_type_check_string;
    variable_struct_set(l_r, "?string", gml_type_check_z_string);
    l_r.array = gml_type_check_array;
    variable_struct_set(l_r, "?array", gml_type_check_z_array);
    l_r.sprite = gml_type_check_index;
    l_r.background = gml_type_check_index;
    l_r.sound = gml_type_check_index;
    l_r.font = gml_type_check_index;
    l_r.path = gml_type_check_index;
    l_r.timeline = gml_type_check_index;
    l_r.script = gml_type_check_index;
    l_r.object = gml_type_check_index;
    l_r.room = gml_type_check_index;
    return l_r;
}

function gml_type_check_any(arg0)
{
    return "";
}

function gml_type_check_number(arg0)
{
    if (is_numeric(arg0))
    {
        return "";
    }
    return "Expected a number";
}

function gml_type_check_int(arg0)
{
    if (is_real(arg0) && (arg0 % 1) == 0)
    {
        return "";
    }
    if (is_numeric(arg0))
    {
        return "";
    }
    if (is_string(arg0))
    {
        return "";
    }
    return "Expected an integer";
}

function gml_type_check_index(arg0)
{
    if (is_real(arg0) && (arg0 % 1) == 0)
    {
        return "";
    }
    if (is_numeric(arg0))
    {
        return "";
    }
    if (is_string(arg0))
    {
        return "";
    }
    return "Expected an index";
}

function gml_type_check_string(arg0)
{
    if (is_string(arg0))
    {
        return "";
    }
    if (is_numeric(arg0))
    {
        return "";
    }
    return "Expected a string";
}

function gml_type_check_array(arg0)
{
    if (is_array(arg0))
    {
        return "";
    }
    return "Expected an array";
}

function gml_type_check_z_number(arg0)
{
    if (arg0 == undefined || is_numeric(arg0))
    {
        return "";
    }
    if (is_string(arg0))
    {
        return "";
    }
    return "Expected a number or null";
}

function gml_type_check_z_string(arg0)
{
    if (arg0 == undefined || is_string(arg0))
    {
        return "";
    }
    if (is_numeric(arg0))
    {
        return "";
    }
    return "Expected a string or null";
}

function gml_type_check_z_array(arg0)
{
    if (arg0 == undefined || is_array(arg0))
    {
        return "";
    }
    return "Expected an array or null";
}

function gml_value_list_copy(arg0)
{
    var l_n = array_length(arg0);
    var l_r = array_create(l_n);
    array_copy(l_r, 0, arg0, 0, l_n);
    return l_r;
}

function gml_value_list_pad_to_size_with_null(arg0, arg1)
{
    var l_curSize = array_length(arg0);
    if (l_curSize < arg1)
    {
        array_resize(arg0, arg1);
        while (l_curSize < arg1)
        {
            array_set(arg0, l_curSize, undefined);
            l_curSize++;
        }
    }
}

function vm__gml_value_map_gml_value_map_impl__print(arg0)
{
    var l_r = "{";
    var l_keys = ds_map_keys_to_array(arg0);
    var l_i = 0;
    var l__g1 = array_length(l_keys);
    while (l_i < l__g1)
    {
        var l_k = l_keys[l_i];
        if (l_i > 0)
        {
            l_r += ", ";
        }
        else
        {
            l_r += " ";
        }
        l_r += (gml_value_print(l_keys[l_i]) + ": " + gml_std_Std_stringify(ds_map_find_value(arg0, l_k)));
        l_i++;
    }
    return l_r + " }";
}

function gml_with_scope(arg0, arg1) constructor
{
    static h_index = undefined;
    static h_length = undefined;
    static h_array = undefined;
    static h_next = undefined;
    static h_data = undefined;
    static __class__ = global.mt_gml_with_scope;
    
    self.h_index = 0;
    self.h_data = arg0;
    self.h_length = arg0.length;
    self.h_array = arg0.items;
    self.h_next = arg1;
}

function gml_with_scope_copy(arg0)
{
    if (arg0 == undefined)
    {
        return undefined;
    }
    var l_q_data = arg0.h_data;
    l_q_data.refc++;
    var l_r = new gml_with_scope(l_q_data, gml_with_scope_copy(arg0.h_next));
    l_r.h_index = arg0.h_index;
    return l_r;
}

function gml_with_scope_destroy(arg0)
{
    while (arg0 != undefined)
    {
        vm__gml_with_data_gml_with_data_impl__destroy(arg0.h_data);
        arg0 = arg0.h_next;
    }
}

function vm__gml_with_data_gml_with_data_impl__init()
{
    var l_pools = array_create(5, undefined);
    array_set(l_pools, 0, ds_stack_create());
    array_set(l_pools, 1, ds_stack_create());
    array_set(l_pools, 2, ds_stack_create());
    array_set(l_pools, 3, ds_stack_create());
    array_set(l_pools, 4, ds_stack_create());
    return l_pools;
}

function vm__gml_with_data_gml_with_data_impl__alloc(arg0)
{
    var l_sln = (arg0 > 0) ? (log10(arg0) | 0) : 0;
    if (l_sln >= 5)
    {
        return array_create(arg0);
    }
    var l_pool = global.vm__gml_with_data_gml_with_data_impl__pools[l_sln];
    if (ds_stack_empty(l_pool))
    {
        return array_create(power(10, l_sln) | 0);
    }
    else
    {
        return ds_stack_pop(l_pool);
    }
}

function vm__gml_with_data_gml_with_data_impl__destroy(arg0)
{
    if (--arg0.refc != 0)
    {
        exit;
    }
    var l_size = arg0.length;
    var l_sln = (l_size > 0) ? (log10(l_size) | 0) : 0;
    if (l_sln >= 5)
    {
        exit;
    }
    ds_stack_push(global.vm__gml_with_data_gml_with_data_impl__pools[l_sln], arg0.items);
}

function gml_type_ref(arg0, arg1) constructor
{
    static h_name = undefined;
    static h_path = undefined;
    static __class__ = global.mt_gml_type_ref;
    
    if (arg1 == undefined)
    {
        arg1 = "";
    }
    self.h_name = arg0;
    self.h_path = arg1;
    variable_struct_set(self, "\a", global.gml_type_ref_root);
}

function gml_type_ref_init()
{
    global.gml_type_ref_root = undefined;
    var l_t = new gml_type_ref("typeref");
    variable_struct_set(l_t, "\a", l_t);
    return l_t;
}

function vm_impl_gml_thread_construct_error()
{
    gml_thread_error("Calls only support up to 81 arguments at this time");
    return undefined;
}

function vm_impl_gml_thread_construct_init()
{
    return [vm_impl_gml_thread_construct_with0, vm_impl_gml_thread_construct_with1, vm_impl_gml_thread_construct_with2, vm_impl_gml_thread_construct_with3, vm_impl_gml_thread_construct_with4, vm_impl_gml_thread_construct_with5, vm_impl_gml_thread_construct_with6, vm_impl_gml_thread_construct_with7, vm_impl_gml_thread_construct_with8, vm_impl_gml_thread_construct_with9, vm_impl_gml_thread_construct_with10, vm_impl_gml_thread_construct_with11, vm_impl_gml_thread_construct_with12, vm_impl_gml_thread_construct_with13, vm_impl_gml_thread_construct_with14, vm_impl_gml_thread_construct_with15, vm_impl_gml_thread_construct_with16, vm_impl_gml_thread_construct_with17, vm_impl_gml_thread_construct_with18, vm_impl_gml_thread_construct_with19, vm_impl_gml_thread_construct_with20, vm_impl_gml_thread_construct_with21, vm_impl_gml_thread_construct_with22, vm_impl_gml_thread_construct_with23, vm_impl_gml_thread_construct_with24, vm_impl_gml_thread_construct_with25, vm_impl_gml_thread_construct_with26, vm_impl_gml_thread_construct_with27, vm_impl_gml_thread_construct_with28, vm_impl_gml_thread_construct_with29, vm_impl_gml_thread_construct_with30, vm_impl_gml_thread_construct_with31, vm_impl_gml_thread_construct_with32, vm_impl_gml_thread_construct_with33, vm_impl_gml_thread_construct_with34, vm_impl_gml_thread_construct_with35, vm_impl_gml_thread_construct_with36, vm_impl_gml_thread_construct_with37, vm_impl_gml_thread_construct_with38, vm_impl_gml_thread_construct_with39, vm_impl_gml_thread_construct_with40, vm_impl_gml_thread_construct_with41, vm_impl_gml_thread_construct_with42, vm_impl_gml_thread_construct_with43, vm_impl_gml_thread_construct_with44, vm_impl_gml_thread_construct_with45, vm_impl_gml_thread_construct_with46, vm_impl_gml_thread_construct_with47, vm_impl_gml_thread_construct_with48, vm_impl_gml_thread_construct_with49, vm_impl_gml_thread_construct_with50, vm_impl_gml_thread_construct_with51, vm_impl_gml_thread_construct_with52, vm_impl_gml_thread_construct_with53, vm_impl_gml_thread_construct_with54, vm_impl_gml_thread_construct_with55, vm_impl_gml_thread_construct_with56, vm_impl_gml_thread_construct_with57, vm_impl_gml_thread_construct_with58, vm_impl_gml_thread_construct_with59, vm_impl_gml_thread_construct_with60, vm_impl_gml_thread_construct_with61, vm_impl_gml_thread_construct_with62, vm_impl_gml_thread_construct_with63, vm_impl_gml_thread_construct_with64, vm_impl_gml_thread_construct_with65, vm_impl_gml_thread_construct_with66, vm_impl_gml_thread_construct_with67, vm_impl_gml_thread_construct_with68, vm_impl_gml_thread_construct_with69, vm_impl_gml_thread_construct_with70, vm_impl_gml_thread_construct_with71, vm_impl_gml_thread_construct_with72, vm_impl_gml_thread_construct_with73, vm_impl_gml_thread_construct_with74, vm_impl_gml_thread_construct_with75, vm_impl_gml_thread_construct_with76, vm_impl_gml_thread_construct_with77, vm_impl_gml_thread_construct_with78, vm_impl_gml_thread_construct_with79, vm_impl_gml_thread_construct_with80];
}

function vm_impl_gml_thread_construct_with0(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c();
}

function vm_impl_gml_thread_construct_with1(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2]);
}

function vm_impl_gml_thread_construct_with2(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1]);
}

function vm_impl_gml_thread_construct_with3(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2]);
}

function vm_impl_gml_thread_construct_with4(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3]);
}

function vm_impl_gml_thread_construct_with5(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4]);
}

function vm_impl_gml_thread_construct_with6(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5]);
}

function vm_impl_gml_thread_construct_with7(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6]);
}

function vm_impl_gml_thread_construct_with8(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7]);
}

function vm_impl_gml_thread_construct_with9(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8]);
}

function vm_impl_gml_thread_construct_with10(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9]);
}

function vm_impl_gml_thread_construct_with11(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10]);
}

function vm_impl_gml_thread_construct_with12(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11]);
}

function vm_impl_gml_thread_construct_with13(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12]);
}

function vm_impl_gml_thread_construct_with14(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13]);
}

function vm_impl_gml_thread_construct_with15(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14]);
}

function vm_impl_gml_thread_construct_with16(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15]);
}

function vm_impl_gml_thread_construct_with17(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16]);
}

function vm_impl_gml_thread_construct_with18(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17]);
}

function vm_impl_gml_thread_construct_with19(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18]);
}

function vm_impl_gml_thread_construct_with20(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19]);
}

function vm_impl_gml_thread_construct_with21(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20]);
}

function vm_impl_gml_thread_construct_with22(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21]);
}

function vm_impl_gml_thread_construct_with23(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22]);
}

function vm_impl_gml_thread_construct_with24(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23]);
}

function vm_impl_gml_thread_construct_with25(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24]);
}

function vm_impl_gml_thread_construct_with26(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25]);
}

function vm_impl_gml_thread_construct_with27(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26]);
}

function vm_impl_gml_thread_construct_with28(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27]);
}

function vm_impl_gml_thread_construct_with29(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28]);
}

function vm_impl_gml_thread_construct_with30(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29]);
}

function vm_impl_gml_thread_construct_with31(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30]);
}

function vm_impl_gml_thread_construct_with32(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31]);
}

function vm_impl_gml_thread_construct_with33(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32]);
}

function vm_impl_gml_thread_construct_with34(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33]);
}

function vm_impl_gml_thread_construct_with35(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34]);
}

function vm_impl_gml_thread_construct_with36(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35]);
}

function vm_impl_gml_thread_construct_with37(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36]);
}

function vm_impl_gml_thread_construct_with38(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37]);
}

function vm_impl_gml_thread_construct_with39(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38]);
}

function vm_impl_gml_thread_construct_with40(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39]);
}

function vm_impl_gml_thread_construct_with41(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40]);
}

function vm_impl_gml_thread_construct_with42(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41]);
}

function vm_impl_gml_thread_construct_with43(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42]);
}

function vm_impl_gml_thread_construct_with44(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43]);
}

function vm_impl_gml_thread_construct_with45(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44]);
}

function vm_impl_gml_thread_construct_with46(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45]);
}

function vm_impl_gml_thread_construct_with47(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46]);
}

function vm_impl_gml_thread_construct_with48(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47]);
}

function vm_impl_gml_thread_construct_with49(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48]);
}

function vm_impl_gml_thread_construct_with50(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49]);
}

function vm_impl_gml_thread_construct_with51(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50]);
}

function vm_impl_gml_thread_construct_with52(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51]);
}

function vm_impl_gml_thread_construct_with53(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52]);
}

function vm_impl_gml_thread_construct_with54(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53]);
}

function vm_impl_gml_thread_construct_with55(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54]);
}

function vm_impl_gml_thread_construct_with56(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55]);
}

function vm_impl_gml_thread_construct_with57(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55], arg1[arg2 + 56]);
}

function vm_impl_gml_thread_construct_with58(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55], arg1[arg2 + 56], arg1[arg2 + 57]);
}

function vm_impl_gml_thread_construct_with59(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55], arg1[arg2 + 56], arg1[arg2 + 57], arg1[arg2 + 58]);
}

function vm_impl_gml_thread_construct_with60(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55], arg1[arg2 + 56], arg1[arg2 + 57], arg1[arg2 + 58], arg1[arg2 + 59]);
}

function vm_impl_gml_thread_construct_with61(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55], arg1[arg2 + 56], arg1[arg2 + 57], arg1[arg2 + 58], arg1[arg2 + 59], arg1[arg2 + 60]);
}

function vm_impl_gml_thread_construct_with62(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55], arg1[arg2 + 56], arg1[arg2 + 57], arg1[arg2 + 58], arg1[arg2 + 59], arg1[arg2 + 60], arg1[arg2 + 61]);
}

function vm_impl_gml_thread_construct_with63(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55], arg1[arg2 + 56], arg1[arg2 + 57], arg1[arg2 + 58], arg1[arg2 + 59], arg1[arg2 + 60], arg1[arg2 + 61], arg1[arg2 + 62]);
}

function vm_impl_gml_thread_construct_with64(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55], arg1[arg2 + 56], arg1[arg2 + 57], arg1[arg2 + 58], arg1[arg2 + 59], arg1[arg2 + 60], arg1[arg2 + 61], arg1[arg2 + 62], arg1[arg2 + 63]);
}

function vm_impl_gml_thread_construct_with65(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55], arg1[arg2 + 56], arg1[arg2 + 57], arg1[arg2 + 58], arg1[arg2 + 59], arg1[arg2 + 60], arg1[arg2 + 61], arg1[arg2 + 62], arg1[arg2 + 63], arg1[arg2 + 64]);
}

function vm_impl_gml_thread_construct_with66(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55], arg1[arg2 + 56], arg1[arg2 + 57], arg1[arg2 + 58], arg1[arg2 + 59], arg1[arg2 + 60], arg1[arg2 + 61], arg1[arg2 + 62], arg1[arg2 + 63], arg1[arg2 + 64], arg1[arg2 + 65]);
}

function vm_impl_gml_thread_construct_with67(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55], arg1[arg2 + 56], arg1[arg2 + 57], arg1[arg2 + 58], arg1[arg2 + 59], arg1[arg2 + 60], arg1[arg2 + 61], arg1[arg2 + 62], arg1[arg2 + 63], arg1[arg2 + 64], arg1[arg2 + 65], arg1[arg2 + 66]);
}

function vm_impl_gml_thread_construct_with68(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55], arg1[arg2 + 56], arg1[arg2 + 57], arg1[arg2 + 58], arg1[arg2 + 59], arg1[arg2 + 60], arg1[arg2 + 61], arg1[arg2 + 62], arg1[arg2 + 63], arg1[arg2 + 64], arg1[arg2 + 65], arg1[arg2 + 66], arg1[arg2 + 67]);
}

function vm_impl_gml_thread_construct_with69(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55], arg1[arg2 + 56], arg1[arg2 + 57], arg1[arg2 + 58], arg1[arg2 + 59], arg1[arg2 + 60], arg1[arg2 + 61], arg1[arg2 + 62], arg1[arg2 + 63], arg1[arg2 + 64], arg1[arg2 + 65], arg1[arg2 + 66], arg1[arg2 + 67], arg1[arg2 + 68]);
}

function vm_impl_gml_thread_construct_with70(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55], arg1[arg2 + 56], arg1[arg2 + 57], arg1[arg2 + 58], arg1[arg2 + 59], arg1[arg2 + 60], arg1[arg2 + 61], arg1[arg2 + 62], arg1[arg2 + 63], arg1[arg2 + 64], arg1[arg2 + 65], arg1[arg2 + 66], arg1[arg2 + 67], arg1[arg2 + 68], arg1[arg2 + 69]);
}

function vm_impl_gml_thread_construct_with71(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55], arg1[arg2 + 56], arg1[arg2 + 57], arg1[arg2 + 58], arg1[arg2 + 59], arg1[arg2 + 60], arg1[arg2 + 61], arg1[arg2 + 62], arg1[arg2 + 63], arg1[arg2 + 64], arg1[arg2 + 65], arg1[arg2 + 66], arg1[arg2 + 67], arg1[arg2 + 68], arg1[arg2 + 69], arg1[arg2 + 70]);
}

function vm_impl_gml_thread_construct_with72(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55], arg1[arg2 + 56], arg1[arg2 + 57], arg1[arg2 + 58], arg1[arg2 + 59], arg1[arg2 + 60], arg1[arg2 + 61], arg1[arg2 + 62], arg1[arg2 + 63], arg1[arg2 + 64], arg1[arg2 + 65], arg1[arg2 + 66], arg1[arg2 + 67], arg1[arg2 + 68], arg1[arg2 + 69], arg1[arg2 + 70], arg1[arg2 + 71]);
}

function vm_impl_gml_thread_construct_with73(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55], arg1[arg2 + 56], arg1[arg2 + 57], arg1[arg2 + 58], arg1[arg2 + 59], arg1[arg2 + 60], arg1[arg2 + 61], arg1[arg2 + 62], arg1[arg2 + 63], arg1[arg2 + 64], arg1[arg2 + 65], arg1[arg2 + 66], arg1[arg2 + 67], arg1[arg2 + 68], arg1[arg2 + 69], arg1[arg2 + 70], arg1[arg2 + 71], arg1[arg2 + 72]);
}

function vm_impl_gml_thread_construct_with74(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55], arg1[arg2 + 56], arg1[arg2 + 57], arg1[arg2 + 58], arg1[arg2 + 59], arg1[arg2 + 60], arg1[arg2 + 61], arg1[arg2 + 62], arg1[arg2 + 63], arg1[arg2 + 64], arg1[arg2 + 65], arg1[arg2 + 66], arg1[arg2 + 67], arg1[arg2 + 68], arg1[arg2 + 69], arg1[arg2 + 70], arg1[arg2 + 71], arg1[arg2 + 72], arg1[arg2 + 73]);
}

function vm_impl_gml_thread_construct_with75(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55], arg1[arg2 + 56], arg1[arg2 + 57], arg1[arg2 + 58], arg1[arg2 + 59], arg1[arg2 + 60], arg1[arg2 + 61], arg1[arg2 + 62], arg1[arg2 + 63], arg1[arg2 + 64], arg1[arg2 + 65], arg1[arg2 + 66], arg1[arg2 + 67], arg1[arg2 + 68], arg1[arg2 + 69], arg1[arg2 + 70], arg1[arg2 + 71], arg1[arg2 + 72], arg1[arg2 + 73], arg1[arg2 + 74]);
}

function vm_impl_gml_thread_construct_with76(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55], arg1[arg2 + 56], arg1[arg2 + 57], arg1[arg2 + 58], arg1[arg2 + 59], arg1[arg2 + 60], arg1[arg2 + 61], arg1[arg2 + 62], arg1[arg2 + 63], arg1[arg2 + 64], arg1[arg2 + 65], arg1[arg2 + 66], arg1[arg2 + 67], arg1[arg2 + 68], arg1[arg2 + 69], arg1[arg2 + 70], arg1[arg2 + 71], arg1[arg2 + 72], arg1[arg2 + 73], arg1[arg2 + 74], arg1[arg2 + 75]);
}

function vm_impl_gml_thread_construct_with77(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55], arg1[arg2 + 56], arg1[arg2 + 57], arg1[arg2 + 58], arg1[arg2 + 59], arg1[arg2 + 60], arg1[arg2 + 61], arg1[arg2 + 62], arg1[arg2 + 63], arg1[arg2 + 64], arg1[arg2 + 65], arg1[arg2 + 66], arg1[arg2 + 67], arg1[arg2 + 68], arg1[arg2 + 69], arg1[arg2 + 70], arg1[arg2 + 71], arg1[arg2 + 72], arg1[arg2 + 73], arg1[arg2 + 74], arg1[arg2 + 75], arg1[arg2 + 76]);
}

function vm_impl_gml_thread_construct_with78(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55], arg1[arg2 + 56], arg1[arg2 + 57], arg1[arg2 + 58], arg1[arg2 + 59], arg1[arg2 + 60], arg1[arg2 + 61], arg1[arg2 + 62], arg1[arg2 + 63], arg1[arg2 + 64], arg1[arg2 + 65], arg1[arg2 + 66], arg1[arg2 + 67], arg1[arg2 + 68], arg1[arg2 + 69], arg1[arg2 + 70], arg1[arg2 + 71], arg1[arg2 + 72], arg1[arg2 + 73], arg1[arg2 + 74], arg1[arg2 + 75], arg1[arg2 + 76], arg1[arg2 + 77]);
}

function vm_impl_gml_thread_construct_with79(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55], arg1[arg2 + 56], arg1[arg2 + 57], arg1[arg2 + 58], arg1[arg2 + 59], arg1[arg2 + 60], arg1[arg2 + 61], arg1[arg2 + 62], arg1[arg2 + 63], arg1[arg2 + 64], arg1[arg2 + 65], arg1[arg2 + 66], arg1[arg2 + 67], arg1[arg2 + 68], arg1[arg2 + 69], arg1[arg2 + 70], arg1[arg2 + 71], arg1[arg2 + 72], arg1[arg2 + 73], arg1[arg2 + 74], arg1[arg2 + 75], arg1[arg2 + 76], arg1[arg2 + 77], arg1[arg2 + 78]);
}

function vm_impl_gml_thread_construct_with80(arg0, arg1, arg2)
{
    var l_c = arg0;
    return new l_c(arg1[arg2], arg1[arg2 + 1], arg1[arg2 + 2], arg1[arg2 + 3], arg1[arg2 + 4], arg1[arg2 + 5], arg1[arg2 + 6], arg1[arg2 + 7], arg1[arg2 + 8], arg1[arg2 + 9], arg1[arg2 + 10], arg1[arg2 + 11], arg1[arg2 + 12], arg1[arg2 + 13], arg1[arg2 + 14], arg1[arg2 + 15], arg1[arg2 + 16], arg1[arg2 + 17], arg1[arg2 + 18], arg1[arg2 + 19], arg1[arg2 + 20], arg1[arg2 + 21], arg1[arg2 + 22], arg1[arg2 + 23], arg1[arg2 + 24], arg1[arg2 + 25], arg1[arg2 + 26], arg1[arg2 + 27], arg1[arg2 + 28], arg1[arg2 + 29], arg1[arg2 + 30], arg1[arg2 + 31], arg1[arg2 + 32], arg1[arg2 + 33], arg1[arg2 + 34], arg1[arg2 + 35], arg1[arg2 + 36], arg1[arg2 + 37], arg1[arg2 + 38], arg1[arg2 + 39], arg1[arg2 + 40], arg1[arg2 + 41], arg1[arg2 + 42], arg1[arg2 + 43], arg1[arg2 + 44], arg1[arg2 + 45], arg1[arg2 + 46], arg1[arg2 + 47], arg1[arg2 + 48], arg1[arg2 + 49], arg1[arg2 + 50], arg1[arg2 + 51], arg1[arg2 + 52], arg1[arg2 + 53], arg1[arg2 + 54], arg1[arg2 + 55], arg1[arg2 + 56], arg1[arg2 + 57], arg1[arg2 + 58], arg1[arg2 + 59], arg1[arg2 + 60], arg1[arg2 + 61], arg1[arg2 + 62], arg1[arg2 + 63], arg1[arg2 + 64], arg1[arg2 + 65], arg1[arg2 + 66], arg1[arg2 + 67], arg1[arg2 + 68], arg1[arg2 + 69], arg1[arg2 + 70], arg1[arg2 + 71], arg1[arg2 + 72], arg1[arg2 + 73], arg1[arg2 + 74], arg1[arg2 + 75], arg1[arg2 + 76], arg1[arg2 + 77], arg1[arg2 + 78], arg1[arg2 + 79]);
}

function vm_group_alarm_on_alarm(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0] - 1;
    array_set(arg3, 0, l_z);
    array_set(arg3, l_z, arg3[l_z].alarm[arg3[l_z + 1]]);
    array_set(arg3, l_z + 1, 0);
    return 0;
}

function vm_group_alarm_on_alarm_set(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0] - 2;
    array_set(arg3, 0, l_z - 1);
    arg3[l_z].alarm[arg3[l_z + 1]] = arg3[l_z + 2];
    array_set(arg3, l_z, 0);
    array_set(arg3, l_z + 1, 0);
    array_set(arg3, l_z + 2, 0);
    return 0;
}

function vm_group_alarm_on_alarm_aop(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0] - 2;
    array_set(arg3, 0, l_z - 1);
    var l_a = arg3[l_z];
    var l_i = arg3[l_z + 1];
    var l_v = l_a.alarm[l_i];
    l_v = global.vm_group_op_funcs[arg1.h_op](l_v, arg3[l_z + 2]);
    l_a.alarm[l_i] = l_v | 0;
    array_set(arg3, l_z, 0);
    array_set(arg3, l_z + 1, 0);
    array_set(arg3, l_z + 2, 0);
    return 0;
}

function vm_group_arg_on_arg_count(arg0, arg1, arg2, arg3)
{
    var l_i = arg3[0] + 1;
    if (l_i >= array_length(arg3))
    {
        array_set(arg3, array_length(arg3) * 2, 0);
    }
    array_set(arg3, l_i, array_length(arg2[3]));
    array_set(arg3, 0, l_i);
    return 0;
}

function vm_group_arg_on_arg_const(arg0, arg1, arg2, arg3)
{
    var l_i = arg1.h_i;
    var l_args1 = arg2[3];
    if (l_i >= 0 && l_i < array_length(l_args1))
    {
        var l_i1 = arg3[0] + 1;
        if (l_i1 >= array_length(arg3))
        {
            array_set(arg3, array_length(arg3) * 2, 0);
        }
        array_set(arg3, l_i1, l_args1[l_i]);
        array_set(arg3, 0, l_i1);
    }
    else
    {
        return arg0.h_proc_error2("Argument index " + string(l_i) + " is out of range (0.." + string(array_length(l_args1)) + ")", arg1);
    }
    return 0;
}

function vm_group_arg_on_arg_const_set(arg0, arg1, arg2, arg3)
{
    var l_i = arg1.h_i;
    var l_args1 = arg2[3];
    if (l_i >= 0 && l_i < array_length(l_args1))
    {
        var l_i1 = arg3[0];
        var l_r = arg3[l_i1];
        array_set(arg3, l_i1, 0);
        array_set(arg3, 0, l_i1 - 1);
        array_set(l_args1, l_i, l_r);
    }
    else
    {
        return arg0.h_proc_error2("Argument index " + string(l_i) + " is out of range (0.." + string(array_length(l_args1)) + ")", arg1);
    }
    return 0;
}

function vm_group_arg_on_arg_const_aop(arg0, arg1, arg2, arg3)
{
    var l_o = arg1.h_o;
    var l_i = arg1.h_i;
    var l_args1 = arg2[3];
    if (l_i >= 0 && l_i < array_length(l_args1))
    {
        var l_arg = l_args1[l_i];
        var l_i1 = arg3[0];
        var l_val = arg3[l_i1];
        array_set(arg3, l_i1, 0);
        array_set(arg3, 0, l_i1 - 1);
        l_val = global.vm_group_op_funcs[l_o](l_arg, l_val);
        array_set(l_args1, l_i, l_val);
    }
    else
    {
        return arg0.h_proc_error2("Argument index " + string(l_i) + " is out of range (0.." + string(array_length(l_args1)) + ")", arg1);
    }
    return 0;
}

function vm_group_arg_on_arg_index(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0];
    var l_k = arg3[l_z];
    if (is_numeric(l_k))
    {
        var l_i = l_k | 0;
        var l_args1 = arg2[3];
        if (l_i >= 0 && l_i < array_length(l_args1))
        {
            array_set(arg3, l_z, l_args1[l_i]);
        }
        else
        {
            return arg0.h_proc_error2("Argument index " + string(l_i) + " is out of range (0.." + string(array_length(l_args1)) + ")", arg1);
        }
    }
    else
    {
        return arg0.h_proc_error2("Index is not a number", arg1);
    }
    return 0;
}

function vm_group_arg_on_arg_index_set(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0] - 1;
    array_set(arg3, 0, l_z - 1);
    var l_k = arg3[l_z];
    var l_v = arg3[l_z + 1];
    array_set(arg3, l_z, 0);
    array_set(arg3, l_z + 1, 0);
    if (is_numeric(l_k))
    {
        var l_i = l_k | 0;
        var l_args1 = arg2[3];
        if (l_i >= 0 && l_i < array_length(l_args1))
        {
            array_set(l_args1, l_i, l_v);
        }
        else
        {
            return arg0.h_proc_error2("Argument index " + string(l_i) + " is out of range (0.." + string(array_length(l_args1)) + ")", arg1);
        }
    }
    else
    {
        return arg0.h_proc_error2("Index is not a number", arg1);
    }
    return 0;
}

function vm_group_arg_on_arg_index_aop(arg0, arg1, arg2, arg3)
{
    var l_o = arg1.h_o;
    var l_z = arg3[0] - 1;
    array_set(arg3, 0, l_z - 1);
    var l_k = arg3[l_z];
    var l_v = arg3[l_z + 1];
    array_set(arg3, l_z, 0);
    array_set(arg3, l_z + 1, 0);
    if (is_numeric(l_k))
    {
        var l_i = l_k | 0;
        var l_args1 = arg2[3];
        if (l_i >= 0 && l_i < array_length(l_args1))
        {
            l_v = global.vm_group_op_funcs[l_o](l_args1[l_i], l_v);
            array_set(l_args1, l_i, l_v);
        }
        else
        {
            return arg0.h_proc_error2("Argument index " + string(l_i) + " is out of range (0.." + string(array_length(l_args1)) + ")", arg1);
        }
    }
    else
    {
        return arg0.h_proc_error2("Index is not a number", arg1);
    }
    return 0;
}

function vm_group_array_on_index(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0] - 1;
    array_set(arg3, 0, l_z);
    array_set(arg3, l_z, arg3[l_z][arg3[l_z + 1]]);
    array_set(arg3, l_z + 1, 0);
    return 0;
}

function vm_group_array_on_index_set(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0] - 2;
    array_set(arg3, 0, l_z - 1);
    array_set(@@array_get@@(arg3, l_z), @@array_get@@(arg3, l_z + 1), arg3[l_z + 2]);
    array_set(arg3, l_z, 0);
    array_set(arg3, l_z + 1, 0);
    array_set(arg3, l_z + 2, 0);
    return 0;
}

function vm_group_array_on_index_aop(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0] - 2;
    array_set(arg3, 0, l_z - 1);
    var l_a = arg3[l_z];
    var l_i = arg3[l_z + 1];
    array_set(l_a, l_i, global.vm_group_op_funcs[arg1.h_o](l_a[l_i], arg3[l_z + 2]));
    array_set(arg3, l_z, 0);
    array_set(arg3, l_z + 1, 0);
    array_set(arg3, l_z + 2, 0);
    return 0;
}

function vm_group_array_on_index2d(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0] - 2;
    array_set(arg3, 0, l_z);
    var l_a = arg3[l_z];
    array_set(arg3, l_z, l_a[arg3[l_z + 1]][arg3[l_z + 2]]);
    array_set(arg3, l_z + 1, 0);
    array_set(arg3, l_z + 2, 0);
    return 0;
}

function vm_group_array_on_index2d_set(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0] - 3;
    array_set(arg3, 0, l_z - 1);
    var l_arr = arg3[l_z];
    array_set_2D(l_arr, @@array_get@@(arg3, l_z + 1), @@array_get@@(arg3, l_z + 2), arg3[l_z + 3]);
    array_set(arg3, l_z, 0);
    array_set(arg3, l_z + 1, 0);
    array_set(arg3, l_z + 2, 0);
    array_set(arg3, l_z + 3, 0);
    return 0;
}

function vm_group_array_on_index2d_aop(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0] - 3;
    array_set(arg3, 0, l_z - 1);
    var l_a = arg3[l_z];
    var l_i = arg3[l_z + 1];
    var l_k = arg3[l_z + 2];
    array_set_2D(l_a, l_i, l_k, global.vm_group_op_funcs[arg1.h_o](l_a[l_i][l_k], arg3[l_z + 3]));
    array_set(arg3, l_z, 0);
    array_set(arg3, l_z + 1, 0);
    array_set(arg3, l_z + 2, 0);
    array_set(arg3, l_z + 3, 0);
    return 0;
}

function vm_group_call_call_value(arg0, arg1, arg2, arg3, arg4, arg5)
{
    if (is_method(arg2))
    {
        if (vm_v2_gml_thread_group_call_gml23_call_self_other_soft(arg0, arg1, arg2, arg3, arg4, arg5))
        {
            arg0.h_result = global.vm_group_call_call_func_result;
            return global.vm_group_call_call_func_status;
        }
        else
        {
            return 1;
        }
    }
    if (is_numeric(arg2))
    {
        if (script_exists(arg2))
        {
            if (vm_v2_gml_thread_group_call_gml23_call_self_other_soft(arg0, arg1, arg2, arg3, arg4, arg5))
            {
                arg0.h_result = global.vm_group_call_call_func_result;
                return global.vm_group_call_call_func_status;
            }
            else
            {
                return 1;
            }
        }
        else
        {
            return arg0.h_proc_error2("Trying to call invalid script index " + gml_value_print(arg2), arg1);
        }
    }
    else
    {
        return arg0.h_proc_error2("Script index must be a number, got " + gml_value_dump(arg2), arg1);
    }
}

function vm_group_call_on_call_script(arg0, arg1, arg2, arg3)
{
    var l_scr = arg1.h_script;
    var l_n = arg1.h_argc;
    var l_arr = [];
    var l_k = arg3[0] - l_n;
    array_copy(l_arr, 0, arg3, l_k + 1, l_n);
    array_copy(arg3, l_k + 1, global.gml_stack_fill_value_arr, 0, l_n);
    array_set(arg3, 0, l_k);
    var l_args1 = l_arr;
    gml_value_list_pad_to_size_with_null(l_args1, l_scr.h_arguments);
    var l_inst = arg2[6];
    arg0.h_scope = gml_thread_scope_create(l_scr.h_actions, 0, l_args1, array_create(l_scr.h_locals), l_inst[l_inst[0]], l_inst[l_inst[0] - 1], arg2, arg2[9]);
    return 3;
}

function vm_group_call_on_call_script_id(arg0, arg1, arg2, arg3)
{
    var l_n = arg1.h_argc;
    var l_v1 = arg3[arg3[0] - l_n];
    var l_argOffset = (arg3[0] - l_n) + 1;
    array_set(arg3, 0, arg3[0] - (l_n + 1));
    return vm_group_call_call_value(arg0, arg1, l_v1, arg3, l_argOffset, l_n);
    return 0;
}

function vm_group_call_on_call_field(arg0, arg1, arg2, arg3)
{
    var l_s = arg1.h_field;
    var l_n = arg1.h_argc;
    var l_ctx = arg3[arg3[0] - l_n];
    var l_argOffset = (arg3[0] - l_n) + 1;
    var l_val = undefined;
    var l_notFound = true;
    if (typeof(l_ctx) == "ref" || (is_numeric(l_ctx) && l_ctx >= 100000))
    {
        l_val = variable_instance_get(l_ctx, l_s);
        if (l_val != undefined || variable_instance_exists(l_ctx, l_s))
        {
            l_notFound = false;
        }
        else if (variable_instance_exists(l_ctx, "id"))
        {
            return arg0.h_proc_error2("`" + gml_std_Std_stringify(l_ctx) + "` (" + object_get_name(l_ctx.object_index) + ") does not have a variable `" + l_s + "`", arg1);
        }
    }
    else
    {
        with (l_ctx)
        {
            l_val = variable_instance_get(self, l_s);
            if (l_val != undefined || variable_instance_exists(self, l_s))
            {
                l_notFound = false;
                break;
            }
            else if (is_struct(l_ctx) && instanceof(l_ctx) == "instance")
            {
                return arg0.h_proc_error2("`" + gml_std_Std_stringify(self) + "` (" + object_get_name(self.object_index) + ") does not have a variable `" + l_s + "`", arg1);
            }
            else
            {
                return arg0.h_proc_error2("`" + gml_std_Std_stringify(self) + "` does not have a variable `" + l_s + "`", arg1);
            }
        }
    }
    if (is_method(l_val))
    {
        if (method_get_self(l_val) == undefined)
        {
            l_val = method(l_ctx, l_val);
        }
        var l_this1 = arg2[6];
        var l_me = l_this1[l_this1[0]];
        with (l_me)
        {
            if (global.gml_thread_allow_exceptions)
            {
                var l_r = vm_group_call_call_value(arg0, arg1, l_val, arg3, l_argOffset, l_n);
                gml_stack_discard_multi(arg3, l_n + 1);
                return l_r;
            }
            else
            {
                try
                {
                    var l_r1 = vm_group_call_call_value(arg0, arg1, l_val, arg3, l_argOffset, l_n);
                    gml_stack_discard_multi(arg3, l_n + 1);
                    return l_r1;
                }
                catch (l__g)
                {
                    var l_x = gml_std_haxe_Exception_caught(l__g).h_unwrap();
                    gml_stack_discard_multi(arg3, l_n + 1);
                    return arg0.h_proc_error2(l_x, arg1);
                }
            }
        }
    }
    if (global.gml_thread_allow_exceptions)
    {
        var l_r = vm_group_call_call_value(arg0, arg1, l_val, arg3, l_argOffset, l_n);
        gml_stack_discard_multi(arg3, l_n + 1);
        return l_r;
    }
    else
    {
        try
        {
            var l_r = vm_group_call_call_value(arg0, arg1, l_val, arg3, l_argOffset, l_n);
            gml_stack_discard_multi(arg3, l_n + 1);
            return l_r;
        }
        catch (l__g)
        {
            var l_x = gml_std_haxe_Exception_caught(l__g).h_unwrap();
            gml_stack_discard_multi(arg3, l_n + 1);
            return arg0.h_proc_error2(l_x, arg1);
        }
    }
    return 0;
}

function vm_group_call_on_construct(arg0, arg1, arg2, arg3)
{
    var l__argc = arg1.h_argc;
    var l_args1 = gml_stack_pop_multi(arg3, l__argc + 1);
    var l_v1 = l_args1[0];
    if (is_numeric(l_v1))
    {
        if (!script_exists(l_v1 | 0))
        {
            return arg0.h_proc_error2(gml_value_print(l_v1) + " is not a valid script index.", arg1);
        }
    }
    else if (is_method(l_v1))
    {
        var l_isCtr, l_ctx;
        if (global.gml_std_haxe_boot_isJS)
        {
            l_ctx = method_get_self(l_v1);
            l_isCtr = is_struct(l_ctx) && variable_struct_get(l_ctx, "live:isConstructor");
        }
        else
        {
            l_isCtr = method_get_index(l_v1) == vm_v2_gml_thread_group_func_literal_ctr_impl;
            l_ctx = l_isCtr ? method_get_self(l_v1) : undefined;
        }
        if (l_isCtr)
        {
            with (new vm_v2_GmlStructBase())
            {
                gml_std_gml_internal_ArrayImpl_shift(l_args1);
                var l_args2 = l_args1;
                var l_self1 = self;
                do
                {
                    var l_ctx1 = variable_struct_get(l_ctx, "live:context");
                    var l_pg;
                    if (l_ctx1 != undefined)
                    {
                        var l_livedata = variable_struct_get(global.live_live_map, l_ctx1);
                        if (l_livedata == undefined)
                        {
                            show_error("Trying to call a nonexistent GMLive program: " + gml_std_Std_stringify(l_ctx1), true);
                        }
                        l_pg = l_livedata[0];
                        if (l_pg == undefined)
                        {
                            global.live_log_script("Trying to call a broken GMLive program " + gml_std_Std_stringify(l_ctx1) + ", returning undefined", 2);
                            var l_result = undefined;
                            break;
                        }
                    }
                    else
                    {
                        l_pg = variable_struct_get(l_ctx, "live:program");
                        if (l_pg == undefined)
                        {
                            show_error("It would appear that you've re-bound a GMLive function to a different scope. Please use live_method() rather than method() to do so.", true);
                        }
                    }
                    global.live_custom_self = l_self1;
                    global.live_custom_other = other;
                    var l_th1 = l_pg.h_call_v(variable_struct_get(l_ctx, "live:function"), l_args2, false);
                    if (l_th1 == undefined)
                    {
                        var l_result = undefined;
                        break;
                    }
                    if (l_th1.h_status == 3)
                    {
                        var l_result = l_th1.h_result;
                    }
                    else if (l_th1.h_status == 4)
                    {
                        global.live_log_script("Runtime error: " + l_th1.h_get_error(), 2);
                        var l_result = undefined;
                    }
                    else
                    {
                        var l_result = undefined;
                    }
                }
                until (true);
                arg0.h_result = self;
            }
            return 0;
        }
    }
    else
    {
        return arg0.h_proc_error2(gml_value_print(l_v1) + " (" + gml_value_get_type(l_v1) + ") is not a callable type.", arg1);
    }
    if (vm_v2_gml_thread_group_call_gml23_call_construct(arg0, arg1, l_v1, l_args1, 1, l__argc))
    {
        arg0.h_result = global.vm_group_call_call_func_result;
        return global.vm_group_call_call_func_status;
    }
    else
    {
        return 1;
    }
    return 0;
}

function vm_group_call_on_call_script_with_array(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0] - 1;
    array_set(arg3, 0, l_z - 1);
    var l_v1 = arg3[l_z];
    var l_arr = arg3[l_z + 1];
    array_set(arg3, l_z, 0);
    array_set(arg3, l_z + 1, 0);
    if (is_array(l_arr))
    {
        return vm_group_call_call_value(arg0, arg1, l_v1, l_arr, 0, array_length(l_arr));
    }
    else
    {
        return arg0.h_proc_error2("Expected an array with arguments, got " + gml_value_dump(l_arr), arg1);
    }
    return 0;
}

function vm_group_call_on_call_func(arg0, arg1, arg2, arg3)
{
    var l__func = arg1.h_func;
    var l__argc = arg1.h_argc;
    var l__inst = arg1.h_inst;
    var l__out = arg1.h_out;
    var l_k = arg3[0] - l__argc;
    array_set(arg3, 0, l_k);
    l_k++;
    if (global.vm_v2_gml_thread_group_call_gml23_funcs[l__inst + 7](arg0, arg1, l__func, arg3, l_k, l__argc))
    {
        if (l__out)
        {
            var l_i = arg3[0] + 1;
            if (l_i >= array_length(arg3))
            {
                array_set(arg3, array_length(arg3) * 2, 0);
            }
            array_set(arg3, l_i, global.vm_group_call_call_func_result);
            array_set(arg3, 0, l_i);
        }
        return global.vm_group_call_call_func_status;
    }
    else
    {
        return 1;
    }
    return 0;
}

function vm_v2_GmlStructBase() constructor
{
    static __class__ = global.mt_vm_v2_GmlStructBase;
}

function vm_v2_gml_thread_group_call_gml23_init()
{
    var l_arr = [];
    var l__ = 0;
    var l__g1 = 11;
    while (l__ < l__g1)
    {
        array_push(l_arr, vm_v2_gml_thread_group_call_gml23_call_unknown);
        l__++;
    }
    array_set(l_arr, 7, vm_v2_gml_thread_group_call_gml23_call_basic);
    array_set(l_arr, 10, vm_v2_gml_thread_group_call_gml23_call_self_other_soft);
    array_set(l_arr, 9, vm_v2_gml_thread_group_call_gml23_call_self_other_soft);
    array_set(l_arr, 8, vm_v2_gml_thread_group_call_gml23_call_self);
    array_set(l_arr, 2, vm_v2_gml_thread_group_call_gml23_call_raw);
    array_set(l_arr, 1, vm_v2_gml_thread_group_call_gml23_call_construct);
    return l_arr;
}

function vm_v2_gml_thread_group_call_gml23_call_unknown(arg0, arg1, arg2, arg3, arg4, arg5)
{
    global.vm_group_call_call_func_result = undefined;
    global.vm_group_call_call_func_status = arg0.h_proc_error2("Call type not supported", arg1);
    return false;
}

function vm_v2_gml_thread_group_call_gml23_call_basic(arg0, arg1, arg2, arg3, arg4, arg5)
{
    global.vm_group_call_call_func_result = (arg5 < 81) ? script_execute(global.vm_gml_thread_exec_slice_funcs[arg5], arg2, arg3, arg4) : vm_gml_thread_exec_slice_longcall(arg2, arg3, arg4, arg5);
    global.vm_group_call_call_func_status = 0;
    return true;
}

function vm_v2_gml_thread_group_call_gml23_call_self_other_soft(arg0, arg1, arg2, arg3, arg4, arg5)
{
    var l_inst = arg0.h_scope[6];
    var l__other = l_inst[l_inst[0] - 1];
    var l__self = l_inst[l_inst[0]];
    var l_val = l__self;
    if (!(instanceof(l_val) == "instance" || is_struct(l_val) || is_numeric(l_val) || typeof(l_val) == "ref"))
    {
        global.vm_group_call_call_func_result = (arg5 < 81) ? script_execute(global.vm_gml_thread_exec_slice_funcs[arg5], arg2, arg3, arg4) : vm_gml_thread_exec_slice_longcall(arg2, arg3, arg4, arg5);
        global.vm_group_call_call_func_status = 0;
        return true;
    }
    l_val = l__other;
    if (!(instanceof(l_val) == "instance" || is_struct(l_val) || is_numeric(l_val) || typeof(l_val) == "ref"))
    {
        with (l__self)
        {
            global.vm_group_call_call_func_result = (arg5 < 81) ? script_execute(global.vm_gml_thread_exec_slice_funcs[arg5], arg2, arg3, arg4) : vm_gml_thread_exec_slice_longcall(arg2, arg3, arg4, arg5);
            global.vm_group_call_call_func_status = 0;
            return true;
        }
        return arg0.h_proc_error("Can't call instance-specific function - instance `" + gml_value_print(l_inst[l_inst[0]]) + ("` (" + gml_value_get_type(l_inst[l_inst[0]]) + ") does not exist."), arg1);
    }
    with (l__other)
    {
        with (l__self)
        {
            global.vm_group_call_call_func_result = (arg5 < 81) ? script_execute(global.vm_gml_thread_exec_slice_funcs[arg5], arg2, arg3, arg4) : vm_gml_thread_exec_slice_longcall(arg2, arg3, arg4, arg5);
            global.vm_group_call_call_func_status = 0;
            return true;
        }
    }
    with (l__self)
    {
        global.vm_group_call_call_func_result = (arg5 < 81) ? script_execute(global.vm_gml_thread_exec_slice_funcs[arg5], arg2, arg3, arg4) : vm_gml_thread_exec_slice_longcall(arg2, arg3, arg4, arg5);
        global.vm_group_call_call_func_status = 0;
        return true;
    }
    return arg0.h_proc_error("Can't call instance-specific function - instance `" + gml_value_print(l_inst[l_inst[0]]) + ("` (" + gml_value_get_type(l_inst[l_inst[0]]) + ") does not exist."), arg1);
}

function vm_v2_gml_thread_group_call_gml23_call_self(arg0, arg1, arg2, arg3, arg4, arg5)
{
    var l_inst = arg0.h_scope[6];
    with (l_inst[l_inst[0]])
    {
        global.vm_group_call_call_func_result = (arg5 < 81) ? script_execute(global.vm_gml_thread_exec_slice_funcs[arg5], arg2, arg3, arg4) : vm_gml_thread_exec_slice_longcall(arg2, arg3, arg4, arg5);
        global.vm_group_call_call_func_status = 0;
        return true;
    }
    return arg0.h_proc_error("Can't call instance-specific function - instance `" + gml_value_print(l_inst[l_inst[0]]) + ("` (" + gml_value_get_type(l_inst[l_inst[0]]) + ") does not exist."), arg1);
}

function vm_v2_gml_thread_group_call_gml23_call_construct(arg0, arg1, arg2, arg3, arg4, arg5)
{
    global.vm_group_call_call_func_status = 0;
    var l_inst = arg0.h_scope[6];
    with (l_inst[l_inst[0]])
    {
        global.vm_group_call_call_func_result = (arg5 < 81) ? script_execute(global.vm_impl_gml_thread_construct_funcs[arg5], arg2, arg3, arg4) : vm_impl_gml_thread_construct_error();
        return true;
    }
    global.vm_group_call_call_func_result = (arg5 < 81) ? script_execute(global.vm_impl_gml_thread_construct_funcs[arg5], arg2, arg3, arg4) : vm_impl_gml_thread_construct_error();
    return true;
}

function vm_v2_gml_thread_group_call_gml23_call_raw(arg0, arg1, arg2, arg3, arg4, arg5)
{
    arg0.h_result = undefined;
    global.vm_group_call_call_func_result = undefined;
    global.vm_group_call_call_func_status = arg2(arg3, arg4, arg5);
    return true;
}

function vm_group_ensure_plus_on_ensure_array_for_local(arg0, arg1, arg2, arg3)
{
    var l_ind = arg1.h_ind;
    var l_locals = arg2[4];
    var l_val = l_locals[l_ind];
    if (!is_array(l_val))
    {
        l_val = [];
        array_set(l_locals, l_ind, l_val);
    }
    var l_i = arg3[0] + 1;
    if (l_i >= array_length(arg3))
    {
        array_set(arg3, array_length(arg3) * 2, 0);
    }
    array_set(arg3, l_i, l_val);
    array_set(arg3, 0, l_i);
    return 0;
}

function vm_group_ensure_plus_on_ensure_array_for_global(arg0, arg1, arg2, arg3)
{
    var l_name = arg1.h_name;
    var l_val = variable_global_get(l_name);
    if (!is_array(l_val))
    {
        l_val = [];
        variable_global_set(l_name, l_val);
    }
    var l_i = arg3[0] + 1;
    if (l_i >= array_length(arg3))
    {
        array_set(arg3, array_length(arg3) * 2, 0);
    }
    array_set(arg3, l_i, l_val);
    array_set(arg3, 0, l_i);
    return 0;
}

function vm_group_ensure_plus_on_ensure_array_for_field(arg0, arg1, arg2, arg3)
{
    var l_name = arg1.h_field;
    var l_z = arg3[0];
    var l_obj = arg3[l_z];
    var l_val = variable_instance_get(l_obj, l_name);
    if (!is_array(l_val))
    {
        l_val = [];
        variable_instance_set(l_obj, l_name, l_val);
    }
    array_set(arg3, l_z, l_val);
    return 0;
}

function vm_group_ensure_plus_on_ensure_array_for_index(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0] - 1;
    array_set(arg3, 0, l_z);
    var l_arr = arg3[l_z];
    var l_ind = arg3[l_z + 1];
    var l_val;
    if (l_ind < array_length(l_arr))
    {
        l_val = l_arr[l_ind];
        if (!is_array(l_val))
        {
            l_val = [];
            array_set(l_arr, l_ind, l_val);
        }
    }
    else
    {
        l_val = [];
        array_set(l_arr, l_ind, l_val);
    }
    array_set(arg3, l_z, l_val);
    array_set(arg3, l_z + 1, 0);
    return 0;
}

function vm_group_ensure_plus_on_ensure_array_for_index2d(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0] - 2;
    array_set(arg3, 0, l_z);
    var l_arr = arg3[l_z];
    var l_ind = arg3[l_z + 1];
    var l_val;
    if (l_ind < array_length(l_arr))
    {
        l_val = l_arr[l_ind];
        if (!is_array(l_val))
        {
            l_val = [];
            array_set(l_arr, l_ind, l_val);
        }
    }
    else
    {
        l_val = [];
        array_set(l_arr, l_ind, l_val);
    }
    l_arr = l_val;
    l_ind = arg3[l_z + 2];
    if (l_ind < array_length(l_arr))
    {
        l_val = l_arr[l_ind];
        if (!is_array(l_val))
        {
            l_val = [];
            array_set(l_arr, l_ind, l_val);
        }
    }
    else
    {
        l_val = [];
        array_set(l_arr, l_ind, l_val);
    }
    l_arr = l_val;
    array_set(arg3, l_z, l_val);
    array_set(arg3, l_z + 1, 0);
    array_set(arg3, l_z + 2, 0);
    return 0;
}

function vm_group_env_on_env(arg0, arg1, arg2, arg3)
{
    var l_v = arg1.h_f(false, undefined);
    var l_i = arg3[0] + 1;
    if (l_i >= array_length(arg3))
    {
        array_set(arg3, array_length(arg3) * 2, 0);
    }
    array_set(arg3, l_i, l_v);
    array_set(arg3, 0, l_i);
    return 0;
}

function vm_group_env_on_env_set(arg0, arg1, arg2, arg3)
{
    var l_i = arg3[0];
    var l_r = arg3[l_i];
    array_set(arg3, l_i, 0);
    array_set(arg3, 0, l_i - 1);
    arg1.h_f(true, l_r);
    return 0;
}

function vm_group_env_on_env_aop(arg0, arg1, arg2, arg3)
{
    var l_op = arg1.h_o;
    var l_fn = arg1.h_f;
    var l_ev = l_fn(false, undefined);
    var l_i = arg3[0];
    var l_r = arg3[l_i];
    array_set(arg3, l_i, 0);
    array_set(arg3, 0, l_i - 1);
    l_ev = global.vm_group_op_funcs[l_op](l_ev, l_r);
    l_fn(true, l_ev);
    return 0;
}

function vm_group_env_on_env1d(arg0, arg1, arg2, arg3)
{
    var l_fn = arg1.h_f;
    var l_z = arg3[0];
    var l_i = arg3[l_z];
    if (is_numeric(l_i))
    {
        array_set(arg3, l_z, l_fn(false, undefined, l_i | 0));
    }
    else
    {
        return arg0.h_proc_error2("Index " + gml_value_print(l_i) + " is not a number.", arg1);
    }
    return 0;
}

function vm_group_env_on_env1d_set(arg0, arg1, arg2, arg3)
{
    var l_fn = arg1.h_f;
    var l_z = arg3[0] - 1;
    array_set(arg3, 0, l_z - 1);
    var l_i = arg3[l_z];
    var l_v = arg3[l_z + 1];
    array_set(arg3, l_z, 0);
    array_set(arg3, l_z + 1, 0);
    if (is_numeric(l_i))
    {
        l_fn(true, l_v, l_i | 0);
    }
    else
    {
        return arg0.h_proc_error2("Index " + gml_value_print(l_i) + " is not a number.", arg1);
    }
    return 0;
}

function vm_group_env_on_env1d_aop(arg0, arg1, arg2, arg3)
{
    var l_o = arg1.h_o;
    var l_fn = arg1.h_f;
    var l_z = arg3[0] - 1;
    array_set(arg3, 0, l_z - 1);
    var l_i = arg3[l_z];
    var l_v = arg3[l_z + 1];
    array_set(arg3, l_z, 0);
    array_set(arg3, l_z + 1, 0);
    if (!is_numeric(l_i))
    {
        return arg0.h_proc_error2("Index " + gml_value_print(l_i) + " is not a number.", arg1);
    }
    var l_ev = l_fn(false, undefined, l_i | 0);
    l_ev = global.vm_group_op_funcs[l_o](l_ev, l_v);
    l_fn(true, l_ev, l_i | 0);
    return 0;
}

function vm_group_fast_call_on_call_func0(arg0, arg1, arg2, arg3)
{
    arg1.h_func();
    return 0;
}

function vm_group_fast_call_on_call_func0o(arg0, arg1, arg2, arg3)
{
    var l_v = arg1.h_func();
    var l_i = arg3[0] + 1;
    if (l_i >= array_length(arg3))
    {
        array_set(arg3, array_length(arg3) * 2, 0);
    }
    array_set(arg3, l_i, l_v);
    array_set(arg3, 0, l_i);
    return 0;
}

function vm_group_fast_call_on_call_func1(arg0, arg1, arg2, arg3)
{
    var l__func = arg1.h_func;
    var l_i = arg3[0];
    var l_r = arg3[l_i];
    array_set(arg3, l_i, 0);
    array_set(arg3, 0, l_i - 1);
    l__func(l_r);
    return 0;
}

function vm_group_fast_call_on_call_func1o(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0];
    array_set(arg3, l_z, arg1.h_func(arg3[l_z]));
    return 0;
}

function vm_group_fast_call_on_call_func2(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0] - 1;
    array_set(arg3, 0, l_z - 1);
    arg1.h_func(arg3[l_z], arg3[l_z + 1]);
    array_set(arg3, l_z, 0);
    array_set(arg3, l_z + 1, 0);
    return 0;
}

function vm_group_fast_call_on_call_func2o(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0] - 1;
    array_set(arg3, 0, l_z);
    array_set(arg3, l_z, arg1.h_func(arg3[l_z], arg3[l_z + 1]));
    array_set(arg3, l_z + 1, 0);
    return 0;
}

function vm_group_fast_call_on_call_func3(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0] - 2;
    array_set(arg3, 0, l_z - 1);
    arg1.h_func(arg3[l_z], arg3[l_z + 1], arg3[l_z + 2]);
    array_set(arg3, l_z, 0);
    array_set(arg3, l_z + 1, 0);
    array_set(arg3, l_z + 2, 0);
    return 0;
}

function vm_group_fast_call_on_call_func3o(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0] - 2;
    array_set(arg3, 0, l_z);
    array_set(arg3, l_z, arg1.h_func(arg3[l_z], arg3[l_z + 1], arg3[l_z + 2]));
    array_set(arg3, l_z + 1, 0);
    array_set(arg3, l_z + 2, 0);
    return 0;
}

function vm_group_fast_call_on_call_func4(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0] - 3;
    array_set(arg3, 0, l_z - 1);
    arg1.h_func(arg3[l_z], arg3[l_z + 1], arg3[l_z + 2], arg3[l_z + 3]);
    array_set(arg3, l_z, 0);
    array_set(arg3, l_z + 1, 0);
    array_set(arg3, l_z + 2, 0);
    array_set(arg3, l_z + 3, 0);
    return 0;
}

function vm_group_fast_call_on_call_func4o(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0] - 3;
    array_set(arg3, 0, l_z);
    array_set(arg3, l_z, arg1.h_func(arg3[l_z], arg3[l_z + 1], arg3[l_z + 2], arg3[l_z + 3]));
    array_set(arg3, l_z + 1, 0);
    array_set(arg3, l_z + 2, 0);
    array_set(arg3, l_z + 3, 0);
    return 0;
}

function vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local0(arg0, arg1, arg2, arg3)
{
    if (arg1.__enumIndex__ == 77)
    {
        arg1.h_func(arg2[4][arg1.h_local]);
    }
    return 0;
}

function vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local0o(arg0, arg1, arg2, arg3)
{
    if (arg1.__enumIndex__ == 78)
    {
        var l_v = arg1.h_func(arg2[4][arg1.h_local]);
        var l_i = arg3[0] + 1;
        if (l_i >= array_length(arg3))
        {
            array_set(arg3, array_length(arg3) * 2, 0);
        }
        array_set(arg3, l_i, l_v);
        array_set(arg3, 0, l_i);
    }
    return 0;
}

function vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local1(arg0, arg1, arg2, arg3)
{
    if (arg1.__enumIndex__ == 79)
    {
        var l__func = arg1.h_func;
        var l_scope1 = arg2[4][arg1.h_local];
        var l_i = arg3[0];
        var l_r = arg3[l_i];
        array_set(arg3, l_i, 0);
        array_set(arg3, 0, l_i - 1);
        l__func(l_scope1, l_r);
    }
    return 0;
}

function vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local1o(arg0, arg1, arg2, arg3)
{
    if (arg1.__enumIndex__ == 80)
    {
        var l_z = arg3[0];
        array_set(arg3, l_z, arg1.h_func(arg2[4][arg1.h_local], arg3[l_z]));
    }
    return 0;
}

function vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local2(arg0, arg1, arg2, arg3)
{
    if (arg1.__enumIndex__ == 81)
    {
        var l_z = arg3[0] - 1;
        array_set(arg3, 0, l_z - 1);
        arg1.h_func(arg2[4][arg1.h_local], arg3[l_z], arg3[l_z + 1]);
        array_set(arg3, l_z, 0);
        array_set(arg3, l_z + 1, 0);
    }
    return 0;
}

function vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local2o(arg0, arg1, arg2, arg3)
{
    if (arg1.__enumIndex__ == 82)
    {
        var l_z = arg3[0] - 1;
        array_set(arg3, 0, l_z);
        array_set(arg3, l_z, arg1.h_func(arg2[4][arg1.h_local], arg3[l_z], arg3[l_z + 1]));
        array_set(arg3, l_z + 1, 0);
    }
    return 0;
}

function vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local3(arg0, arg1, arg2, arg3)
{
    if (arg1.__enumIndex__ == 83)
    {
        var l_z = arg3[0] - 2;
        array_set(arg3, 0, l_z - 1);
        arg1.h_func(arg2[4][arg1.h_local], arg3[l_z], arg3[l_z + 1], arg3[l_z + 2]);
        array_set(arg3, l_z, 0);
        array_set(arg3, l_z + 1, 0);
        array_set(arg3, l_z + 2, 0);
    }
    return 0;
}

function vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local3o(arg0, arg1, arg2, arg3)
{
    if (arg1.__enumIndex__ == 84)
    {
        var l_z = arg3[0] - 2;
        array_set(arg3, 0, l_z);
        array_set(arg3, l_z, arg1.h_func(arg2[4][arg1.h_local], arg3[l_z], arg3[l_z + 1], arg3[l_z + 2]));
        array_set(arg3, l_z + 1, 0);
        array_set(arg3, l_z + 2, 0);
    }
    return 0;
}

function vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local4(arg0, arg1, arg2, arg3)
{
    if (arg1.__enumIndex__ == 85)
    {
        var l_z = arg3[0] - 3;
        array_set(arg3, 0, l_z - 1);
        arg1.h_func(arg2[4][arg1.h_local], arg3[l_z], arg3[l_z + 1], arg3[l_z + 2], arg3[l_z + 3]);
        array_set(arg3, l_z, 0);
        array_set(arg3, l_z + 1, 0);
        array_set(arg3, l_z + 2, 0);
        array_set(arg3, l_z + 3, 0);
    }
    return 0;
}

function vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local4o(arg0, arg1, arg2, arg3)
{
    if (arg1.__enumIndex__ == 86)
    {
        var l_z = arg3[0] - 3;
        array_set(arg3, 0, l_z);
        array_set(arg3, l_z, arg1.h_func(arg2[4][arg1.h_local], arg3[l_z], arg3[l_z + 1], arg3[l_z + 2], arg3[l_z + 3]));
        array_set(arg3, l_z + 1, 0);
        array_set(arg3, l_z + 2, 0);
        array_set(arg3, l_z + 3, 0);
    }
    return 0;
}

function vm_group_field_dump_no_var(arg0, arg1, arg2, arg3)
{
    var l_post = " does not have a variable `" + arg3 + "`";
    if (is_numeric(arg2))
    {
        if (object_exists(arg2))
        {
            return arg0.h_proc_error2(gml_std_Std_stringify(arg2) + " (" + object_get_name(arg2) + l_post, arg1);
        }
        else if (variable_instance_exists(arg2, "id"))
        {
            return arg0.h_proc_error2(gml_std_Std_stringify(arg2) + " (" + object_get_name(arg2.object_index) + ")" + l_post, arg1);
        }
        else
        {
            return arg0.h_proc_error2(gml_value_print(arg2) + l_post, arg1);
        }
    }
    else if (instanceof(arg2) == "instance")
    {
        return arg0.h_proc_error2(string(arg2.id) + " (" + object_get_name(arg2.object_index) + ")" + l_post, arg1);
    }
    else
    {
        var l_val = arg2;
        return arg0.h_proc_error2(gml_value_print(l_val) + " (" + gml_value_get_type(l_val) + ")" + l_post, arg1);
    }
}

function vm_group_field_on_field(arg0, arg1, arg2, arg3)
{
    var l_s = arg1.h_fd;
    var l_z = arg3[0];
    var l_ctx = arg3[l_z];
    if (typeof(l_ctx) == "ref" || (is_numeric(l_ctx) && l_ctx >= 100000))
    {
        var l_val = variable_instance_get(l_ctx, l_s);
        if (l_val != undefined || variable_instance_exists(l_ctx, l_s))
        {
            array_set(arg3, l_z, l_val);
            return 0;
        }
        if (variable_instance_exists(l_ctx, "id"))
        {
            return vm_group_field_dump_no_var(arg0, arg1, l_ctx, l_s);
        }
    }
    else
    {
        with (l_ctx)
        {
            var l_val = variable_instance_get(self, l_s);
            if (l_val != undefined || variable_instance_exists(self, l_s))
            {
                array_set(arg3, l_z, l_val);
                return 0;
            }
            return vm_group_field_dump_no_var(arg0, arg1, l_ctx, l_s);
        }
    }
    if (is_numeric(l_ctx) && object_exists(l_ctx))
    {
        return arg0.h_proc_error2("Couldn't find any instances of " + gml_std_Std_stringify(l_ctx) + " (" + object_get_name(l_ctx) + ")", arg1);
    }
    else
    {
        return arg0.h_proc_error2("Couldn't find any instances of " + gml_std_Std_stringify(l_ctx) + ".", arg1);
    }
    return 0;
}

function vm_group_field_on_field_set(arg0, arg1, arg2, arg3)
{
    var l_varname = arg1.h_fd;
    var l_z = arg3[0] - 1;
    array_set(arg3, 0, l_z - 1);
    var l_ctx = arg3[l_z];
    var l_val = arg3[l_z + 1];
    if (typeof(l_ctx) == "ref" || (is_numeric(l_ctx) && l_ctx >= 100000))
    {
        try
        {
            var l_checkExists = l_ctx.id;
        }
        catch (l__g)
        {
            var l_x = gml_std_haxe_Exception_caught(l__g).h_unwrap();
            array_set(arg3, l_z, 0);
            array_set(arg3, l_z + 1, 0);
            return arg0.h_proc_error2(l_x, arg1);
        }
        variable_instance_set(l_ctx, l_varname, l_val);
        array_set(arg3, l_z, 0);
        array_set(arg3, l_z + 1, 0);
        return 0;
    }
    else
    {
        with (l_ctx)
        {
            variable_instance_set(self, l_varname, l_val);
            array_set(arg3, l_z, 0);
            array_set(arg3, l_z + 1, 0);
            return 0;
        }
    }
    array_set(arg3, l_z, 0);
    array_set(arg3, l_z + 1, 0);
    if (is_numeric(l_ctx) && object_exists(l_ctx))
    {
        return arg0.h_proc_error2("Couldn't find any instances of " + gml_std_Std_stringify(l_ctx) + " (" + object_get_name(l_ctx) + ")", arg1);
    }
    else
    {
        return arg0.h_proc_error2("Couldn't find any instances of " + gml_std_Std_stringify(l_ctx) + ".", arg1);
    }
    return 0;
}

function vm_group_field_on_fast_field_aop(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0] - 1;
    array_set(arg3, 0, l_z - 1);
    var l_obj = arg3[l_z];
    arg1.h_setter(l_obj, global.vm_group_op_funcs[arg1.h_o](arg1.h_getter(l_obj), arg3[l_z + 1]));
    array_set(arg3, l_z, 0);
    array_set(arg3, l_z + 1, 0);
    return 0;
}

function vm_group_field_on_field_aop(arg0, arg1, arg2, arg3)
{
    var l_o = arg1.h_o;
    var l_s = arg1.h_fd;
    var l_z = arg3[0] - 1;
    array_set(arg3, 0, l_z - 1);
    var l_ctx = arg3[l_z];
    var l_val = arg3[l_z + 1];
    if (typeof(l_ctx) == "ref" || (is_numeric(l_ctx) && l_ctx >= 100000))
    {
        try
        {
            var l_checkExists = l_ctx.id;
        }
        catch (l__g)
        {
            var l_x = gml_std_haxe_Exception_caught(l__g).h_unwrap();
            array_set(arg3, l_z, 0);
            array_set(arg3, l_z + 1, 0);
            return arg0.h_proc_error2(l_x, arg1);
        }
        var l_cur = variable_instance_get(l_ctx, l_s);
        if (l_cur != undefined || variable_instance_exists(l_ctx, l_s))
        {
            l_cur = global.vm_group_op_funcs[l_o](l_cur, l_val);
            variable_instance_set(l_ctx, l_s, l_cur);
            array_set(arg3, l_z, 0);
            array_set(arg3, l_z + 1, 0);
            return 0;
        }
        else
        {
            array_set(arg3, l_z, 0);
            array_set(arg3, l_z + 1, 0);
            return arg0.h_proc_error2("`" + gml_std_Std_stringify(l_ctx) + "` (" + object_get_name(l_ctx.object_index) + ") does not have a variable `" + l_s + "`", arg1);
        }
    }
    else
    {
        var l_checkExists = false;
        with (l_ctx)
        {
            var l_cur = variable_instance_get(self, l_s);
            if (l_cur != undefined || variable_instance_exists(l_ctx, l_s))
            {
                l_cur = global.vm_group_op_funcs[l_o](l_cur, l_val);
                variable_instance_set(self, l_s, l_cur);
                l_checkExists = true;
            }
            else if (is_numeric(l_ctx))
            {
                array_set(arg3, l_z, 0);
                array_set(arg3, l_z + 1, 0);
                return arg0.h_proc_error2("`" + gml_std_Std_stringify(l_ctx) + "` (" + object_get_name(l_ctx.object_index) + ") does not have a variable `" + l_s + "`", arg1);
            }
            else
            {
                array_set(arg3, l_z, 0);
                array_set(arg3, l_z + 1, 0);
                return arg0.h_proc_error2("`" + gml_value_print(l_ctx) + "` (" + typeof(l_ctx) + ") does not have a variable `" + l_s + "`", arg1);
            }
        }
        if (l_checkExists)
        {
            array_set(arg3, l_z, 0);
            array_set(arg3, l_z + 1, 0);
            return 0;
        }
    }
    array_set(arg3, l_z, 0);
    array_set(arg3, l_z + 1, 0);
    if (is_numeric(l_ctx) && object_exists(l_ctx))
    {
        return arg0.h_proc_error2("Couldn't find any instances of " + gml_std_Std_stringify(l_ctx) + " (" + object_get_name(l_ctx) + ")", arg1);
    }
    else
    {
        return arg0.h_proc_error2("Couldn't find any instances of " + gml_std_Std_stringify(l_ctx) + ".", arg1);
    }
    return 0;
}

function vm_group_field_on_self_field(arg0, arg1, arg2, arg3)
{
    var l__field = arg1.h_fd;
    var l_this1 = arg2[6];
    var l_obj = l_this1[l_this1[0]];
    var l_val = variable_struct_get(l_obj, l__field);
    if (l_val == undefined)
    {
        if (!variable_struct_exists(l_obj, l__field))
        {
            if (is_numeric(l_obj))
            {
                if (object_exists(l_obj))
                {
                    gml_thread_error(gml_std_Std_stringify(l_obj) + " (" + object_get_name(l_obj) + ") does not have a variable `" + l__field + "`.");
                }
                else if (instance_exists(l_obj))
                {
                    gml_thread_error(gml_std_Std_stringify(l_obj) + " (" + object_get_name(l_obj.object_index) + ") does not have a variable `" + l__field + "`.");
                }
                else
                {
                    gml_thread_error(gml_value_dump(l_obj) + " does not have a variable `" + l__field + "`.");
                }
            }
            else if (typeof(l_obj) == "ref")
            {
                if (instance_exists(l_obj))
                {
                    gml_thread_error(gml_std_Std_stringify(l_obj) + " (" + object_get_name(l_obj.object_index) + ") does not have a variable `" + l__field + "`.");
                }
                else
                {
                    gml_thread_error(gml_value_dump(l_obj) + " does not have a variable `" + l__field + "`.");
                }
            }
            else
            {
                gml_thread_error(gml_value_dump(l_obj) + " does not have a variable `" + l__field + "`.");
            }
        }
    }
    var l_i = arg3[0] + 1;
    if (l_i >= array_length(arg3))
    {
        array_set(arg3, array_length(arg3) * 2, 0);
    }
    array_set(arg3, l_i, l_val);
    array_set(arg3, 0, l_i);
    return 0;
}

function vm_group_field_on_self_field_set(arg0, arg1, arg2, arg3)
{
    var l__field = arg1.h_fd;
    var l_this1 = arg2[6];
    variable_struct_set(l_this1[l_this1[0]], l__field, gml_stack_pop(arg3));
    return 0;
}

function vm_group_field_on_self_field_aop(arg0, arg1, arg2, arg3)
{
    var l__op = arg1.h_o;
    var l__field = arg1.h_fd;
    var l_this1 = arg2[6];
    var l_obj = l_this1[l_this1[0]];
    var l_cur = variable_struct_get(l_obj, l__field);
    if (l_cur == undefined)
    {
        if (!variable_struct_exists(l_obj, l__field))
        {
            if (is_numeric(l_obj))
            {
                if (object_exists(l_obj))
                {
                    gml_thread_error(gml_std_Std_stringify(l_obj) + " (" + object_get_name(l_obj) + ") does not have a variable `" + l__field + "`.");
                }
                else if (instance_exists(l_obj))
                {
                    gml_thread_error(gml_std_Std_stringify(l_obj) + " (" + object_get_name(l_obj.object_index) + ") does not have a variable `" + l__field + "`.");
                }
                else
                {
                    gml_thread_error(gml_value_dump(l_obj) + " does not have a variable `" + l__field + "`.");
                }
            }
            else if (typeof(l_obj) == "ref")
            {
                if (instance_exists(l_obj))
                {
                    gml_thread_error(gml_std_Std_stringify(l_obj) + " (" + object_get_name(l_obj.object_index) + ") does not have a variable `" + l__field + "`.");
                }
                else
                {
                    gml_thread_error(gml_value_dump(l_obj) + " does not have a variable `" + l__field + "`.");
                }
            }
            else
            {
                gml_thread_error(gml_value_dump(l_obj) + " does not have a variable `" + l__field + "`.");
            }
        }
    }
    l_this1 = arg2[6];
    variable_struct_set(l_this1[l_this1[0]], l__field, global.vm_group_op_funcs[l__op](l_cur, gml_stack_pop(arg3)));
    return 0;
}

function vm_group_field_on_fast_self_field(arg0, arg1, arg2, arg3)
{
    var l_this1 = arg2[6];
    var l_v = arg1.h_getter(l_this1[l_this1[0]]);
    var l_i = arg3[0] + 1;
    if (l_i >= array_length(arg3))
    {
        array_set(arg3, array_length(arg3) * 2, 0);
    }
    array_set(arg3, l_i, l_v);
    array_set(arg3, 0, l_i);
    return 0;
}

function vm_group_field_on_fast_self_field_set(arg0, arg1, arg2, arg3)
{
    var l__setter = arg1.h_setter;
    var l_this1 = arg2[6];
    l__setter(l_this1[l_this1[0]], gml_stack_pop(arg3));
    return 0;
}

function vm_group_field_on_fast_self_field_aop(arg0, arg1, arg2, arg3)
{
    var l_this1 = arg2[6];
    var l_obj = l_this1[l_this1[0]];
    arg1.h_setter(l_obj, global.vm_group_op_funcs[arg1.h_o](arg1.h_getter(l_obj), gml_stack_pop(arg3)));
    return 0;
}

function vm_group_field_on_local_field(arg0, arg1, arg2, arg3)
{
    var l_i = arg1.h_localIndex;
    var l__field = arg1.h_fd;
    var l_obj = arg2[4][l_i];
    var l_val = variable_struct_get(l_obj, l__field);
    if (l_val == undefined)
    {
        if (!variable_struct_exists(l_obj, l__field))
        {
            if (is_numeric(l_obj))
            {
                if (object_exists(l_obj))
                {
                    gml_thread_error(gml_std_Std_stringify(l_obj) + " (" + object_get_name(l_obj) + ") does not have a variable `" + l__field + "`.");
                }
                else if (instance_exists(l_obj))
                {
                    gml_thread_error(gml_std_Std_stringify(l_obj) + " (" + object_get_name(l_obj.object_index) + ") does not have a variable `" + l__field + "`.");
                }
                else
                {
                    gml_thread_error(gml_value_dump(l_obj) + " does not have a variable `" + l__field + "`.");
                }
            }
            else if (typeof(l_obj) == "ref")
            {
                if (instance_exists(l_obj))
                {
                    gml_thread_error(gml_std_Std_stringify(l_obj) + " (" + object_get_name(l_obj.object_index) + ") does not have a variable `" + l__field + "`.");
                }
                else
                {
                    gml_thread_error(gml_value_dump(l_obj) + " does not have a variable `" + l__field + "`.");
                }
            }
            else
            {
                gml_thread_error(gml_value_dump(l_obj) + " does not have a variable `" + l__field + "`.");
            }
        }
    }
    l_i = arg3[0] + 1;
    if (l_i >= array_length(arg3))
    {
        array_set(arg3, array_length(arg3) * 2, 0);
    }
    array_set(arg3, l_i, l_val);
    array_set(arg3, 0, l_i);
    return 0;
}

function vm_group_field_on_local_field_set(arg0, arg1, arg2, arg3)
{
    variable_struct_set(arg2[4][arg1.h_localIndex], arg1.h_fd, gml_stack_pop(arg3));
    return 0;
}

function vm_group_field_on_local_field_aop(arg0, arg1, arg2, arg3)
{
    var l_i = arg1.h_localIndex;
    var l__op = arg1.h_o;
    var l__field = arg1.h_fd;
    var l_obj = arg2[4][l_i];
    var l_cur = variable_struct_get(l_obj, l__field);
    if (l_cur == undefined)
    {
        if (!variable_struct_exists(l_obj, l__field))
        {
            if (is_numeric(l_obj))
            {
                if (object_exists(l_obj))
                {
                    gml_thread_error(gml_std_Std_stringify(l_obj) + " (" + object_get_name(l_obj) + ") does not have a variable `" + l__field + "`.");
                }
                else if (instance_exists(l_obj))
                {
                    gml_thread_error(gml_std_Std_stringify(l_obj) + " (" + object_get_name(l_obj.object_index) + ") does not have a variable `" + l__field + "`.");
                }
                else
                {
                    gml_thread_error(gml_value_dump(l_obj) + " does not have a variable `" + l__field + "`.");
                }
            }
            else if (typeof(l_obj) == "ref")
            {
                if (instance_exists(l_obj))
                {
                    gml_thread_error(gml_std_Std_stringify(l_obj) + " (" + object_get_name(l_obj.object_index) + ") does not have a variable `" + l__field + "`.");
                }
                else
                {
                    gml_thread_error(gml_value_dump(l_obj) + " does not have a variable `" + l__field + "`.");
                }
            }
            else
            {
                gml_thread_error(gml_value_dump(l_obj) + " does not have a variable `" + l__field + "`.");
            }
        }
    }
    variable_struct_set(l_obj, l__field, global.vm_group_op_funcs[l__op](l_cur, gml_stack_pop(arg3)));
    return 0;
}

function vm_group_field_on_fast_local_field(arg0, arg1, arg2, arg3)
{
    var l_v = arg1.h_getter(arg2[4][arg1.h_localIndex]);
    var l_i = arg3[0] + 1;
    if (l_i >= array_length(arg3))
    {
        array_set(arg3, array_length(arg3) * 2, 0);
    }
    array_set(arg3, l_i, l_v);
    array_set(arg3, 0, l_i);
    return 0;
}

function vm_group_field_on_fast_local_field_set(arg0, arg1, arg2, arg3)
{
    arg1.h_setter(arg2[4][arg1.h_localIndex], gml_stack_pop(arg3));
    return 0;
}

function vm_group_field_on_fast_local_field_aop(arg0, arg1, arg2, arg3)
{
    var l_obj = arg2[4][arg1.h_localIndex];
    arg1.h_setter(l_obj, global.vm_group_op_funcs[arg1.h_o](arg1.h_getter(l_obj), gml_stack_pop(arg3)));
    return 0;
}

function vm_group_field_on_in(arg0, arg1, arg2, arg3)
{
    var l_not = arg1.h_not;
    var l_z = arg3[0] - 1;
    array_set(arg3, 0, l_z);
    var l_ctx = arg3[l_z + 1];
    if (typeof(l_ctx) == "ref" || (is_numeric(l_ctx) && l_ctx >= 100000))
    {
        array_set(arg3, l_z, l_not != variable_instance_exists(l_ctx, arg3[l_z]));
        return 0;
    }
    else
    {
        with (l_ctx)
        {
            array_set(arg3, l_z, l_not != variable_instance_exists(self, arg3[l_z]));
            return 0;
        }
    }
    if (is_numeric(l_ctx) && object_exists(l_ctx))
    {
        return arg0.h_proc_error2("Couldn't find any instances of " + gml_std_Std_stringify(l_ctx) + " (" + object_get_name(l_ctx) + ")", arg1);
    }
    else
    {
        return arg0.h_proc_error2("Couldn't find any instances of " + gml_std_Std_stringify(l_ctx) + ".", arg1);
    }
    return 0;
}

function vm_group_field_on_in_const(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0];
    array_set(arg3, l_z, arg1.h_not != variable_struct_exists(arg3[l_z], arg1.h_field));
    return 0;
}

function vm_group_global_on_global(arg0, arg1, arg2, arg3)
{
    var l_s = arg1.h_fd;
    if (variable_global_exists(l_s))
    {
        var l_v = variable_global_get(l_s);
        var l_i = arg3[0] + 1;
        if (l_i >= array_length(arg3))
        {
            array_set(arg3, array_length(arg3) * 2, 0);
        }
        array_set(arg3, l_i, l_v);
        array_set(arg3, 0, l_i);
    }
    else
    {
        return arg0.h_proc_error2("Global variable `" + l_s + "` is not set.", arg1);
    }
    return 0;
}

function vm_group_global_on_global_set(arg0, arg1, arg2, arg3)
{
    var l_i = arg3[0];
    var l_r = arg3[l_i];
    array_set(arg3, l_i, 0);
    array_set(arg3, 0, l_i - 1);
    variable_global_set(arg1.h_fd, l_r);
    return 0;
}

function vm_group_global_on_global_aop(arg0, arg1, arg2, arg3)
{
    var l_o = arg1.h_o;
    var l_s = arg1.h_fd;
    if (variable_global_exists(l_s))
    {
        var l_i = arg3[0];
        var l_r = arg3[l_i];
        array_set(arg3, l_i, 0);
        array_set(arg3, 0, l_i - 1);
        variable_global_set(l_s, global.vm_group_op_funcs[l_o](variable_global_get(l_s), l_r));
    }
    else
    {
        return arg0.h_proc_error2("Global variable `" + l_s + "` is not set.", arg1);
    }
    return 0;
}

function vm_group_jump_on_jump(arg0, arg1, arg2, arg3)
{
    array_set(arg2, 2, arg1.h_p);
    return 2;
}

function vm_group_jump_on_jump_if(arg0, arg1, arg2, arg3)
{
    var l_p = arg1.h_p;
    var l_i = arg3[0];
    var l_r = arg3[l_i];
    array_set(arg3, l_i, 0);
    array_set(arg3, 0, l_i - 1);
    if (l_r)
    {
        array_set(arg2, 2, l_p);
        return 2;
    }
    return 0;
}

function vm_group_jump_on_jump_unless(arg0, arg1, arg2, arg3)
{
    var l_p = arg1.h_p;
    var l_i = arg3[0];
    var l_r = arg3[l_i];
    array_set(arg3, l_i, 0);
    array_set(arg3, 0, l_i - 1);
    if (!l_r)
    {
        array_set(arg2, 2, l_p);
        return 2;
    }
    return 0;
}

function vm_group_jump_on_bool_and(arg0, arg1, arg2, arg3)
{
    var l_p = arg1.h_p;
    if (arg3[arg3[0]])
    {
        var l_i = arg3[0];
        array_set(arg3, l_i, 0);
        array_set(arg3, 0, l_i - 1);
    }
    else
    {
        array_set(arg2, 2, l_p);
        return 2;
    }
    return 0;
}

function vm_group_jump_on_bool_or(arg0, arg1, arg2, arg3)
{
    var l_p = arg1.h_p;
    if (arg3[arg3[0]])
    {
        array_set(arg2, 2, l_p);
        return 2;
    }
    else
    {
        var l_i = arg3[0];
        array_set(arg3, l_i, 0);
        array_set(arg3, 0, l_i - 1);
    }
    return 0;
}

function vm_group_jump_on_switch(arg0, arg1, arg2, arg3)
{
    var l_jt = arg1.h_jumptable;
    var l_p = arg1.h_defaultPos;
    var l_i = arg3[0];
    var l_val = arg3[l_i];
    array_set(arg3, l_i, 0);
    array_set(arg3, 0, l_i - 1);
    if (is_real(l_val))
    {
        if (frac(l_val) != 0)
        {
            array_set(arg2, 2, l_p);
            return 2;
        }
        var l_vi = int64(l_val);
        if (l_vi != l_val)
        {
            array_set(arg2, 2, l_p);
            return 2;
        }
        else
        {
            l_val = l_vi;
        }
    }
    if (global.gml_std_haxe_boot_isJS && is_int64(l_val))
    {
        var l_vr = real(l_val);
        if (l_vr == l_val && ds_map_exists(l_jt, l_vr))
        {
            array_set(arg2, 2, ds_map_find_value(l_jt, l_vr));
            return 2;
        }
    }
    if (ds_map_exists(l_jt, l_val))
    {
        array_set(arg2, 2, ds_map_find_value(l_jt, l_val));
    }
    else
    {
        array_set(arg2, 2, l_p);
    }
    return 2;
}

function vm_group_jump_on_switch_case(arg0, arg1, arg2, arg3)
{
    var l_p = arg1.h_p;
    var l_i = arg3[0];
    var l_r = arg3[l_i];
    array_set(arg3, l_i, 0);
    array_set(arg3, 0, l_i - 1);
    if (arg3[arg3[0]] == l_r)
    {
        gml_stack_discard(arg3);
        array_set(arg2, 2, l_p);
        return 2;
    }
    return 0;
}

function vm_group_jump_on_null_co(arg0, arg1, arg2, arg3)
{
    var l_p = arg1.h_p;
    var l_val = arg3[arg3[0]];
    if (l_val != undefined && l_val != pointer_null)
    {
        array_set(arg2, 2, l_p);
        return 2;
    }
    else
    {
        gml_stack_discard(arg3);
    }
    return 0;
}

function vm_group_jump_on_repeat_pre(arg0, arg1, arg2, arg3)
{
    var l_p = arg1.h_p;
    var l_val = arg3[arg3[0]];
    if (is_numeric(l_val))
    {
        if (l_val < 1)
        {
            array_set(arg2, 2, l_p);
            var l_i = arg3[0];
            array_set(arg3, l_i, 0);
            array_set(arg3, 0, l_i - 1);
            return 2;
        }
    }
    else
    {
        return arg0.h_proc_error2("Repeat `times` must be a number", arg1);
    }
    return 0;
}

function vm_group_jump_on_repeat_jump(arg0, arg1, arg2, arg3)
{
    var l_p = arg1.h_p;
    var l_f = arg3[arg3[0]] - 1;
    array_set(arg3, @@array_get@@(arg3, 0), l_f);
    if (l_f >= 1)
    {
        array_set(arg2, 2, l_p);
        return 2;
    }
    return 0;
}

function vm_group_jump_on_break(arg0, arg1, arg2, arg3)
{
    array_set(arg2, 2, arg1.h_lp);
    return 2;
}

function vm_group_jump_on_continue(arg0, arg1, arg2, arg3)
{
    array_set(arg2, 2, arg1.h_lp);
    return 2;
}

function vm_group_jump_on_return(arg0, arg1, arg2, arg3)
{
    var l_i = arg3[0];
    var l_r = arg3[l_i];
    array_set(arg3, l_i, 0);
    array_set(arg3, 0, l_i - 1);
    arg0.h_result = l_r;
    array_set(arg2, 2, ds_list_size(arg2[1]));
    return 2;
}

function vm_group_jump_on_return_const(arg0, arg1, arg2, arg3)
{
    arg0.h_result = arg1.h_val;
    array_set(arg2, 2, ds_list_size(arg2[1]));
    return 2;
}

function vm_group_literal_on_undefined(arg0, arg1, arg2, arg3)
{
    var l_i = arg3[0] + 1;
    if (l_i >= array_length(arg3))
    {
        array_set(arg3, array_length(arg3) * 2, 0);
    }
    array_set(arg3, l_i, undefined);
    array_set(arg3, 0, l_i);
    return 0;
}

function vm_group_literal_on_number(arg0, arg1, arg2, arg3)
{
    var l_i = arg3[0] + 1;
    if (l_i >= array_length(arg3))
    {
        array_set(arg3, array_length(arg3) * 2, 0);
    }
    array_set(arg3, l_i, arg1.h_f);
    array_set(arg3, 0, l_i);
    return 0;
}

function vm_group_literal_on_cstring(arg0, arg1, arg2, arg3)
{
    var l_i = arg3[0] + 1;
    if (l_i >= array_length(arg3))
    {
        array_set(arg3, array_length(arg3) * 2, 0);
    }
    array_set(arg3, l_i, arg1.h_s);
    array_set(arg3, 0, l_i);
    return 0;
}

function vm_group_literal_on_const(arg0, arg1, arg2, arg3)
{
    var l_i = arg3[0] + 1;
    if (l_i >= array_length(arg3))
    {
        array_set(arg3, array_length(arg3) * 2, 0);
    }
    array_set(arg3, l_i, arg1.h_v);
    array_set(arg3, 0, l_i);
    return 0;
}

function vm_group_literal_on_self(arg0, arg1, arg2, arg3)
{
    var l_inst = arg2[6];
    var l_i = arg3[0] + 1;
    if (l_i >= array_length(arg3))
    {
        array_set(arg3, array_length(arg3) * 2, 0);
    }
    array_set(arg3, l_i, l_inst[l_inst[0]]);
    array_set(arg3, 0, l_i);
    return 0;
}

function vm_group_literal_on_other(arg0, arg1, arg2, arg3)
{
    var l_inst = arg2[6];
    var l_i = arg3[0] + 1;
    if (l_i >= array_length(arg3))
    {
        array_set(arg3, array_length(arg3) * 2, 0);
    }
    array_set(arg3, l_i, l_inst[l_inst[0] - 1]);
    array_set(arg3, 0, l_i);
    return 0;
}

function vm_group_literal_on_result(arg0, arg1, arg2, arg3)
{
    var l_i = arg3[0] + 1;
    if (l_i >= array_length(arg3))
    {
        array_set(arg3, array_length(arg3) * 2, 0);
    }
    array_set(arg3, l_i, arg0.h_result);
    array_set(arg3, 0, l_i);
    return 0;
}

function vm_group_literal_on_array_decl(arg0, arg1, arg2, arg3)
{
    var l_n = arg1.h_size;
    var l_arr = [];
    var l_k = arg3[0] - l_n;
    array_copy(l_arr, 0, arg3, l_k + 1, l_n);
    array_copy(arg3, l_k + 1, global.gml_stack_fill_value_arr, 0, l_n);
    array_set(arg3, 0, l_k);
    var l_i = arg3[0] + 1;
    if (l_i >= array_length(arg3))
    {
        array_set(arg3, array_length(arg3) * 2, 0);
    }
    array_set(arg3, l_i, l_arr);
    array_set(arg3, 0, l_i);
    return 0;
}

function vm_group_literal_on_object_decl(arg0, arg1, arg2, arg3)
{
    var l_fields = arg1.h_fields;
    var l_obj = {};
    var l_n = array_length(l_fields);
    var l_stackStart = (arg3[0] - l_n) + 1;
    var l_i = l_n;
    while (--l_i >= 0)
    {
        var l_fd = l_fields[l_i];
        var l_val = arg3[l_stackStart + l_i];
        if (l_fd.bindFunc)
        {
            l_val = live_method(l_obj, l_val);
        }
        variable_struct_set(l_obj, l_fd.name, l_val);
    }
    gml_stack_discard_multi(arg3, l_n);
    l_i = arg3[0] + 1;
    if (l_i >= array_length(arg3))
    {
        array_set(arg3, array_length(arg3) * 2, 0);
    }
    array_set(arg3, l_i, l_obj);
    array_set(arg3, 0, l_i);
    return 0;
}

function vm_group_local_on_local(arg0, arg1, arg2, arg3)
{
    var l_i1 = arg3[0] + 1;
    if (l_i1 >= array_length(arg3))
    {
        array_set(arg3, array_length(arg3) * 2, 0);
    }
    array_set(arg3, l_i1, arg2[4][arg1.h_i]);
    array_set(arg3, 0, l_i1);
    return 0;
}

function vm_group_local_on_local_set(arg0, arg1, arg2, arg3)
{
    var l_i1 = arg3[0];
    var l_r = arg3[l_i1];
    array_set(arg3, l_i1, 0);
    array_set(arg3, 0, l_i1 - 1);
    array_set(@@array_get@@(arg2, 4), arg1.h_i, l_r);
    return 0;
}

function vm_group_local_on_local_aop(arg0, arg1, arg2, arg3)
{
    var l_op = arg1.h_o;
    var l_i = arg1.h_i;
    var l_locals = arg2[4];
    var l_i1 = arg3[0];
    var l_r = arg3[l_i1];
    array_set(arg3, l_i1, 0);
    array_set(arg3, 0, l_i1 - 1);
    array_set(l_locals, l_i, global.vm_group_op_funcs[l_op](l_locals[l_i], l_r));
    return 0;
}

function vm_group_op_impl_unknown(arg0, arg1)
{
    show_error("No idea how to apply this operator", true);
}

function vm_group_op_impl_add(arg0, arg1)
{
    return arg0 + arg1;
}

function vm_group_op_impl_sub(arg0, arg1)
{
    return arg0 - arg1;
}

function vm_group_op_impl_mul(arg0, arg1)
{
    return arg0 * arg1;
}

function vm_group_op_impl_div1(arg0, arg1)
{
    if (arg1 == 0 && is_int64(arg1) && is_int64(arg0))
    {
        gml_thread_error("Division by zero");
    }
    return arg0 / arg1;
}

function vm_group_op_impl_mod(arg0, arg1)
{
    return arg0 % arg1;
}

function vm_group_op_impl_idiv(arg0, arg1)
{
    return arg0 div arg1;
}

function vm_group_op_impl_and(arg0, arg1)
{
    return arg0 & arg1;
}

function vm_group_op_impl_or(arg0, arg1)
{
    return arg0 | arg1;
}

function vm_group_op_impl_xor(arg0, arg1)
{
    return arg0 ^ arg1;
}

function vm_group_op_impl_shl(arg0, arg1)
{
    return arg0 << arg1;
}

function vm_group_op_impl_shr(arg0, arg1)
{
    return arg0 >> arg1;
}

function vm_group_op_impl_eq(arg0, arg1)
{
    return arg0 == arg1;
}

function vm_group_op_impl_ne(arg0, arg1)
{
    return arg0 != arg1;
}

function vm_group_op_impl_gt(arg0, arg1)
{
    return arg0 > arg1;
}

function vm_group_op_impl_ge(arg0, arg1)
{
    return arg0 >= arg1;
}

function vm_group_op_impl_lt(arg0, arg1)
{
    return arg0 < arg1;
}

function vm_group_op_impl_le(arg0, arg1)
{
    return arg0 <= arg1;
}

function vm_group_op_impl()
{
    var l_num = 112;
    var l_fns = array_create(l_num, undefined);
    for (var l_i = 0; l_i < l_num; l_i++)
    {
        array_set(l_fns, l_i, vm_group_op_impl_unknown);
    }
    array_set(l_fns, 16, vm_group_op_impl_add);
    array_set(l_fns, 17, vm_group_op_impl_sub);
    array_set(l_fns, 0, vm_group_op_impl_mul);
    array_set(l_fns, 1, vm_group_op_impl_div1);
    array_set(l_fns, 2, vm_group_op_impl_mod);
    array_set(l_fns, 3, vm_group_op_impl_idiv);
    array_set(l_fns, 49, vm_group_op_impl_and);
    array_set(l_fns, 48, vm_group_op_impl_or);
    array_set(l_fns, 50, vm_group_op_impl_xor);
    array_set(l_fns, 32, vm_group_op_impl_shl);
    array_set(l_fns, 33, vm_group_op_impl_shr);
    array_set(l_fns, 64, vm_group_op_impl_eq);
    array_set(l_fns, 65, vm_group_op_impl_ne);
    array_set(l_fns, 68, vm_group_op_impl_gt);
    array_set(l_fns, 69, vm_group_op_impl_ge);
    array_set(l_fns, 66, vm_group_op_impl_lt);
    array_set(l_fns, 67, vm_group_op_impl_le);
    return l_fns;
}

function vm_group_op_on_bin_op(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0] - 1;
    array_set(arg3, 0, l_z);
    array_set(arg3, l_z, global.vm_group_op_funcs[arg1.h_o](arg3[l_z], arg3[l_z + 1]));
    array_set(arg3, l_z + 1, 0);
    return 0;
}

function vm_group_op_on_un_op(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0];
    switch (arg1.h_o)
    {
        case 2:
            array_set(arg3, l_z, ~arg3[l_z]);
            break;
        case 1:
            array_set(arg3, l_z, !arg3[l_z]);
            break;
        case 0:
            array_set(arg3, l_z, -arg3[l_z]);
            break;
    }
    return 0;
}

function vm_group_op_on_equ_op(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0] - 1;
    array_set(arg3, 0, l_z);
    array_set(arg3, l_z, arg3[l_z] == arg3[l_z + 1]);
    array_set(arg3, l_z + 1, 0);
    return 0;
}

function vm_group_op_on_neq_op(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0] - 1;
    array_set(arg3, 0, l_z);
    array_set(arg3, l_z, arg3[l_z] != arg3[l_z + 1]);
    array_set(arg3, l_z + 1, 0);
    return 0;
}

function vm_group_op_on_add_int(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0];
    array_set(arg3, l_z, arg3[l_z] + arg1.h_i);
    return 0;
}

function vm_group_op_on_concat(arg0, arg1, arg2, arg3)
{
    var l_z = arg3[0] - 1;
    array_set(arg3, 0, l_z);
    var l_v2 = arg3[l_z + 1];
    if (!is_string(l_v2))
    {
        l_v2 = gml_value_print(l_v2);
    }
    var l_v1 = arg3[l_z];
    if (!is_string(l_v1))
    {
        l_v1 = gml_value_print(l_v1);
    }
    array_set(arg3, l_z, l_v1 + l_v2);
    array_set(arg3, l_z + 1, 0);
    return 0;
}

function vm_group_op_on_ds_aop(arg0, arg1, arg2, arg3)
{
    var l__o = arg1.h_o;
    var l_setterArgc = arg1.h_argc;
    var l_getterFunc = arg1.h_get;
    var l_setterFunc = arg1.h_set;
    var l_k = (1 + arg3[0]) - l_setterArgc;
    var l_getterArgc = l_setterArgc - 1;
    var l_arr = arg3;
    var l_v = (l_getterArgc < 81) ? script_execute(global.vm_gml_thread_exec_slice_funcs[l_getterArgc], l_getterFunc, l_arr, l_k) : vm_gml_thread_exec_slice_longcall(l_getterFunc, l_arr, l_k, l_getterArgc);
    l_v = global.vm_group_op_funcs[l__o](l_v, arg3[l_k + l_getterArgc]);
    array_set(arg3, l_k + l_getterArgc, l_v);
    l_arr = arg3;
    if (l_setterArgc < 81)
    {
        script_execute(global.vm_gml_thread_exec_slice_funcs[l_setterArgc], l_setterFunc, l_arr, l_k);
    }
    else
    {
        vm_gml_thread_exec_slice_longcall(l_setterFunc, l_arr, l_k, l_setterArgc);
    }
    if (arg1.h_out)
    {
        gml_stack_pop_multi(arg3, l_getterArgc);
        array_set(arg3, @@array_get@@(arg3, 0), l_v);
    }
    else
    {
        gml_stack_pop_multi(arg3, l_setterArgc);
    }
    return 0;
}

function vm_group_special_on_wait(arg0, arg1, arg2, arg3)
{
    var l_t = gml_stack_pop(arg3);
    arg0.h_status = 5;
    arg0.h_wait_time = is_numeric(l_t) ? l_t : 0;
    ds_list_add(arg2[9].h_wait_list, arg0);
    return 1;
    return 0;
}

function vm_group_special_on_fork(arg0, arg1, arg2, arg3)
{
    var l_out = arg1.h_out;
    if (l_out)
    {
        gml_stack_push(arg3, 1);
    }
    arg0.h_fork().h_exec();
    if (l_out)
    {
        array_set(arg3, @@array_get@@(arg3, 0), 0);
    }
    return 2;
}

function vm_group_special_on_try(arg0, arg1, arg2, arg3)
{
    array_set(arg2, 8, new gml_link(arg1.h_hdl, arg2[8]));
    return 0;
}

function vm_group_special_on_catch(arg0, arg1, arg2, arg3)
{
    array_set(arg2, 8, arg2[8].h_next);
    array_set(@@array_get@@(arg2, 4), arg1.h_v, arg0.h_error_text);
    arg0.h_error_text = undefined;
    return 0;
}

function vm_group_special_on_finally(arg0, arg1, arg2, arg3)
{
    array_set(arg2, 8, arg2[8].h_next);
    array_set(arg2, 2, arg1.h_p);
    return 2;
}

function vm_group_special_on_throw(arg0, arg1, arg2, arg3)
{
    return arg0.h_proc_error2(gml_std_Std_stringify(gml_stack_pop(arg3)), arg1);
    return 0;
}

function vm_group_stack_on_discard(arg0, arg1, arg2, arg3)
{
    var l_i = arg3[0];
    array_set(arg3, l_i, 0);
    array_set(arg3, 0, l_i - 1);
    return 0;
}

function vm_group_stack_on_dup(arg0, arg1, arg2, arg3)
{
    var l_i = arg3[0] + 1;
    if (l_i >= array_length(arg3))
    {
        array_set(arg3, array_length(arg3) * 2, 0);
    }
    array_set(arg3, l_i, arg3[l_i - 1]);
    array_set(arg3, 0, l_i);
    return 0;
}

function vm_group_stack_on_dup2x(arg0, arg1, arg2, arg3)
{
    var l_i = arg3[0] + 2;
    if (l_i >= array_length(arg3))
    {
        array_set(arg3, array_length(arg3) * 2, 0);
    }
    array_set(arg3, l_i - 1, arg3[l_i - 3]);
    array_set(arg3, l_i, arg3[l_i - 2]);
    array_set(arg3, 0, l_i);
    return 0;
}

function vm_group_stack_on_dup3x(arg0, arg1, arg2, arg3)
{
    var l_i = arg3[0] + 3;
    if (l_i >= array_length(arg3))
    {
        array_set(arg3, array_length(arg3) * 2, 0);
    }
    array_set(arg3, l_i - 2, arg3[l_i - 5]);
    array_set(arg3, l_i - 1, arg3[l_i - 4]);
    array_set(arg3, l_i, arg3[l_i - 3]);
    array_set(arg3, 0, l_i);
    return 0;
}

function vm_group_stack_on_dup_in(arg0, arg1, arg2, arg3)
{
    var l_i = arg3[0];
    var l_v = arg3[l_i++];
    array_set(arg3, 0, l_i);
    var l_k = l_i - arg1.h_z;
    if (l_i >= array_length(arg3))
    {
        array_set(arg3, array_length(arg3) * 2, 0);
    }
    while (--l_i >= l_k)
    {
        array_set(arg3, l_i + 1, arg3[l_i]);
    }
    array_set(arg3, l_k, l_v);
    return 0;
}

function vm_group_with_on_with_pre(arg0, arg1, arg2, arg3)
{
    var l_i = arg3[0];
    var l_val = arg3[l_i];
    array_set(arg3, l_i, 0);
    array_set(arg3, 0, l_i - 1);
    var l_ctx = l_val;
    if (is_numeric(l_val))
    {
        if (l_ctx >= 100000)
        {
            var l_n, l_arr;
            if (instance_exists(l_ctx))
            {
                l_arr = vm__gml_with_data_gml_with_data_impl__alloc(1);
                array_set(l_arr, 0, l_ctx);
                var l__this = gml_std_haxe_enum_tools_getParameter(arg1, 0);
                if (!arg2[9].h_get_source(l__this[0]).h_version.h_int_self)
                {
                    with (l_ctx)
                    {
                        array_set(l_arr, 0, self);
                        break;
                    }
                }
                l_n = 1;
            }
            else
            {
                l_arr = vm__gml_with_data_gml_with_data_impl__alloc(0);
                l_n = 0;
            }
            array_set(arg2, 7, new gml_with_scope(
            {
                length: l_n,
                items: l_arr,
                refc: 1
            }, arg2[7]));
        }
        else
        {
            var l_n = instance_number(l_ctx);
            var l_arr = vm__gml_with_data_gml_with_data_impl__alloc(l_n);
            l_i = 0;
            with (l_ctx)
            {
                array_set(l_arr, l_i, self);
                l_i++;
            }
            array_set(arg2, 7, new gml_with_scope(
            {
                length: l_i,
                items: l_arr,
                refc: 1
            }, arg2[7]));
        }
    }
    else
    {
        var l_arr = vm__gml_with_data_gml_with_data_impl__alloc(1);
        l_i = 0;
        with (l_ctx)
        {
            array_set(l_arr, l_i, self);
            l_i++;
        }
        array_set(arg2, 7, new gml_with_scope(
        {
            length: l_i,
            items: l_arr,
            refc: 1
        }, arg2[7]));
    }
    var l_inst = arg2[6];
    l_i = l_inst[0] + 1;
    if (l_i >= array_length(l_inst))
    {
        array_set(l_inst, array_length(l_inst) * 2, 0);
    }
    array_set(l_inst, l_i, undefined);
    array_set(l_inst, 0, l_i);
    return 0;
}

function vm_group_with_on_with_next(arg0, arg1, arg2, arg3)
{
    var l_p = arg1.h_p;
    var l_with1 = arg2[7];
    if (l_with1.h_index < l_with1.h_length)
    {
        var l_inst = arg2[6];
        array_set(l_inst, @@array_get@@(l_inst, 0), l_with1.h_array[l_with1.h_index++]);
    }
    else
    {
        array_set(arg2, 2, l_p);
        return 2;
    }
    return 0;
}

function vm_group_with_on_with_post(arg0, arg1, arg2, arg3)
{
    var l_with1 = arg2[7];
    if (l_with1 != undefined)
    {
        var l_this1 = l_with1.h_data;
        if (--l_this1.refc == 0)
        {
            var l_size = l_this1.length;
            var l_sln = (l_size > 0) ? (log10(l_size) | 0) : 0;
            if (l_sln < 5)
            {
                ds_stack_push(global.vm__gml_with_data_gml_with_data_impl__pools[l_sln], l_this1.items);
            }
        }
        array_set(arg2, 7, l_with1.h_next);
        l_this1 = arg2[6];
        var l_i = l_this1[0];
        array_set(l_this1, l_i, 0);
        array_set(l_this1, 0, l_i - 1);
    }
    return 0;
}

global.gml_func_name = ds_map_create();
global.gml_func_script_id = {};
global.gml_const_map = {};
global.gml_const_val = {};
global.gml_asset_index = {};
global.gml_enum_map = {};
global.compile_groups_gml_compile_group_static_has_statics = compile_groups_gml_compile_group_static_has_statics_init();
global.gml_func_map = {};
global.vm_value_gml_value_printer_print_refs = ds_map_create();
global.vm_value_gml_value_printer_print_num = 0;
global.gml_op_apply_fns = gml_op_apply_init();
global.gml_thread_default_callback = undefined;
global.gml_thread_verbose_stack_traces = false;
global.gml_thread_allow_exceptions = false;
global.gml_thread_current = undefined;
global.gml_stack_fill_value_arr = array_create(1024, 0);
global.gml_compile_curr_script = gml_compile_init();
global.gml_compile_curr_break = -1;
global.gml_compile_curr_continue = -1;
global.api_api_version_v1 = api_api_version_create(14);
global.api_api_version_v2 = api_api_version_create(22);
global.api_api_version_v23 = api_api_version_create(23);
global.gml_parser_template_func = "string";
global.gml_parser_default_version = global.api_api_version_v23;
global.gml_parser_curr_version = undefined;
global.gml_parser_token_acc = ds_list_create();
global.gml_parser_fast_buf = buffer_create(1024, buffer_fast, 1);
global.gml_parser_str_buf = buffer_create(1024, buffer_grow, 1);
global.gml_parser_buf_sub_buf = buffer_create(1024, buffer_grow, 1);
global.gml_parser_char_is_space = gml_parser_char_is_space_init();
global._gml_parser_gml_parser_string_buf_impl____buf = buffer_create(1024, buffer_grow, 1);
global.gml_std_StringBuf_buffer = buffer_create(128, buffer_grow, 1);
global.gml_fast_field_getters = {};
global.gml_fast_field_setters = {};
global.api_api_var_map = {};
global.ast_gml_macro_proc_list = ds_list_create();
global.ast_gml_macro_proc_map = {};
global.ast_gml_macro_proc_exclude_map = {};
global.ast_gml_macro_proc_next_exclude_list = ds_list_create();
global.ast_gml_macro_proc_next_exclude_map = {};
global.ast_gml_node_def_info_array = [new ast_gml_node_def_ctr("Undefined", [new ast_gml_node_def_param("pos", 2)]), new ast_gml_node_def_ctr("Boolean", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("value", 13)]), new ast_gml_node_def_ctr("Number", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("value", 13), new ast_gml_node_def_param("src", 13)]), new ast_gml_node_def_ctr("CString", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("value", 13)]), new ast_gml_node_def_ctr("OtherConst", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("value", 13)]), new ast_gml_node_def_ctr("EnumCtr", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("e", 6), new ast_gml_node_def_param("ctr", 7)]), new ast_gml_node_def_ctr("ArrayDecl", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("values", 1)]), new ast_gml_node_def_ctr("ObjectDecl", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("keys", 14), new ast_gml_node_def_param("values", 1)]), new ast_gml_node_def_ctr("EnsureArrayForLocal", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("name", 13)]), new ast_gml_node_def_ctr("EnsureArrayForGlobal", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("name", 13)]), new ast_gml_node_def_ctr("EnsureArrayForField", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("obj", 0), new ast_gml_node_def_param("fd", 13)]), new ast_gml_node_def_ctr("EnsureArrayForIndex", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("arr", 0), new ast_gml_node_def_param("ind", 0)]), new ast_gml_node_def_ctr("EnsureArrayForIndex2d", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("arr", 0), new ast_gml_node_def_param("ind1", 0), new ast_gml_node_def_param("ind2", 0)]), new ast_gml_node_def_ctr("Ident", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("id", 13)]), new ast_gml_node_def_ctr("Self", [new ast_gml_node_def_param("pos", 2)]), new ast_gml_node_def_ctr("Other", [new ast_gml_node_def_param("pos", 2)]), new ast_gml_node_def_ctr("GlobalRef", [new ast_gml_node_def_param("pos", 2)]), new ast_gml_node_def_ctr("Script", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("ref", 5)]), new ast_gml_node_def_ctr("NativeScript", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("name", 13), new ast_gml_node_def_param("id", 12)]), new ast_gml_node_def_ctr("Const", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("name", 13)]), new ast_gml_node_def_ctr("ArgConst", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("index", 13)]), new ast_gml_node_def_ctr("ArgIndex", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("index", 0)]), new ast_gml_node_def_ctr("ArgCount", [new ast_gml_node_def_param("pos", 2)]), new ast_gml_node_def_ctr("Call", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("expr", 0), new ast_gml_node_def_param("args", 1)]), new ast_gml_node_def_ctr("CallScript", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("name", 13), new ast_gml_node_def_param("args", 1)]), new ast_gml_node_def_ctr("CallScriptAt", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("inst", 0), new ast_gml_node_def_param("script", 13), new ast_gml_node_def_param("args", 1)]), new ast_gml_node_def_ctr("CallScriptId", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("index", 0), new ast_gml_node_def_param("args", 1)]), new ast_gml_node_def_ctr("CallScriptWithArray", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("index", 0), new ast_gml_node_def_param("array", 0)]), new ast_gml_node_def_ctr("CallField", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("obj", 0), new ast_gml_node_def_param("field", 13), new ast_gml_node_def_param("args", 1)]), new ast_gml_node_def_ctr("CallFunc", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("func", 11), new ast_gml_node_def_param("args", 1)]), new ast_gml_node_def_ctr("CallFuncAt", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("expr", 0), new ast_gml_node_def_param("fname", 13), new ast_gml_node_def_param("args", 1)]), new ast_gml_node_def_ctr("Construct", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("ctr", 0), new ast_gml_node_def_param("args", 1)]), new ast_gml_node_def_ctr("FuncLiteral", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("name", 13), new ast_gml_node_def_param("unbound", 13)]), new ast_gml_node_def_ctr("Prefix", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("expr", 0), new ast_gml_node_def_param("inc", 13)]), new ast_gml_node_def_ctr("Postfix", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("expr", 0), new ast_gml_node_def_param("inc", 13)]), new ast_gml_node_def_ctr("UnOp", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("expr", 0), new ast_gml_node_def_param("op", 8)]), new ast_gml_node_def_ctr("BinOp", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("op", 9), new ast_gml_node_def_param("a", 0), new ast_gml_node_def_param("b", 0)]), new ast_gml_node_def_ctr("SetOp", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("op", 9), new ast_gml_node_def_param("a", 0), new ast_gml_node_def_param("b", 0)]), new ast_gml_node_def_ctr("Delete", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("expr", 0)]), new ast_gml_node_def_ctr("NullCo", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("a", 0), new ast_gml_node_def_param("b", 0)]), new ast_gml_node_def_ctr("ToBool", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("val", 0)]), new ast_gml_node_def_ctr("FromBool", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("val", 0)]), new ast_gml_node_def_ctr("In", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("fd", 0), new ast_gml_node_def_param("obj", 0), new ast_gml_node_def_param("not", 13)]), new ast_gml_node_def_ctr("Local", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("name", 13)]), new ast_gml_node_def_ctr("LocalSet", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("name", 13), new ast_gml_node_def_param("val", 0)]), new ast_gml_node_def_ctr("LocalAop", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("name", 13), new ast_gml_node_def_param("op", 9), new ast_gml_node_def_param("val", 0)]), new ast_gml_node_def_ctr("Static", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("name", 13)]), new ast_gml_node_def_ctr("StaticSet", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("name", 13), new ast_gml_node_def_param("val", 0), new ast_gml_node_def_param("isInit", 13)]), new ast_gml_node_def_ctr("StaticAop", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("name", 13), new ast_gml_node_def_param("op", 9), new ast_gml_node_def_param("val", 0)]), new ast_gml_node_def_ctr("Global", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("name", 13)]), new ast_gml_node_def_ctr("GlobalSet", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("name", 13), new ast_gml_node_def_param("val", 0)]), new ast_gml_node_def_ctr("GlobalAop", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("name", 13), new ast_gml_node_def_param("op", 9), new ast_gml_node_def_param("val", 0)]), new ast_gml_node_def_ctr("ScriptStatic", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("scr", 13), new ast_gml_node_def_param("name", 13)]), new ast_gml_node_def_ctr("ScriptStaticSet", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("scr", 13), new ast_gml_node_def_param("name", 13), new ast_gml_node_def_param("val", 0)]), new ast_gml_node_def_ctr("ScriptStaticAop", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("scr", 13), new ast_gml_node_def_param("name", 13), new ast_gml_node_def_param("op", 9), new ast_gml_node_def_param("val", 0)]), new ast_gml_node_def_ctr("Field", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("obj", 0), new ast_gml_node_def_param("field", 13)]), new ast_gml_node_def_ctr("FieldSet", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("obj", 0), new ast_gml_node_def_param("field", 13), new ast_gml_node_def_param("val", 0)]), new ast_gml_node_def_ctr("FieldAop", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("obj", 0), new ast_gml_node_def_param("field", 13), new ast_gml_node_def_param("op", 9), new ast_gml_node_def_param("val", 0)]), new ast_gml_node_def_ctr("Env", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("v", 10)]), new ast_gml_node_def_ctr("EnvSet", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("v", 10), new ast_gml_node_def_param("val", 0)]), new ast_gml_node_def_ctr("EnvAop", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("v", 10), new ast_gml_node_def_param("op", 9), new ast_gml_node_def_param("val", 0)]), new ast_gml_node_def_ctr("EnvFd", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("obj", 0), new ast_gml_node_def_param("v", 10)]), new ast_gml_node_def_ctr("EnvFdSet", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("obj", 0), new ast_gml_node_def_param("v", 10), new ast_gml_node_def_param("val", 0)]), new ast_gml_node_def_ctr("EnvFdAop", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("obj", 0), new ast_gml_node_def_param("v", 10), new ast_gml_node_def_param("op", 9), new ast_gml_node_def_param("val", 0)]), new ast_gml_node_def_ctr("Env1d", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("v", 10), new ast_gml_node_def_param("index", 0)]), new ast_gml_node_def_ctr("Env1dSet", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("v", 10), new ast_gml_node_def_param("index", 0), new ast_gml_node_def_param("val", 0)]), new ast_gml_node_def_ctr("Env1dAop", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("v", 10), new ast_gml_node_def_param("index", 0), new ast_gml_node_def_param("op", 9), new ast_gml_node_def_param("val", 0)]), new ast_gml_node_def_ctr("Alarm", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("obj", 0), new ast_gml_node_def_param("index", 0)]), new ast_gml_node_def_ctr("AlarmSet", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("obj", 0), new ast_gml_node_def_param("index", 0), new ast_gml_node_def_param("val", 0)]), new ast_gml_node_def_ctr("AlarmAop", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("obj", 0), new ast_gml_node_def_param("index", 0), new ast_gml_node_def_param("op", 9), new ast_gml_node_def_param("val", 0)]), new ast_gml_node_def_ctr("Index", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("arr", 0), new ast_gml_node_def_param("index", 0)]), new ast_gml_node_def_ctr("IndexSet", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("arr", 0), new ast_gml_node_def_param("index", 0), new ast_gml_node_def_param("val", 0)]), new ast_gml_node_def_ctr("IndexAop", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("arr", 0), new ast_gml_node_def_param("index", 0), new ast_gml_node_def_param("op", 9), new ast_gml_node_def_param("val", 0)]), new ast_gml_node_def_ctr("Index2d", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("arr", 0), new ast_gml_node_def_param("index1", 0), new ast_gml_node_def_param("index2", 0)]), new ast_gml_node_def_ctr("Index2dSet", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("arr", 0), new ast_gml_node_def_param("index1", 0), new ast_gml_node_def_param("index2", 0), new ast_gml_node_def_param("val", 0)]), new ast_gml_node_def_ctr("Index2dAop", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("arr", 0), new ast_gml_node_def_param("index1", 0), new ast_gml_node_def_param("index2", 0), new ast_gml_node_def_param("op", 9), new ast_gml_node_def_param("val", 0)]), new ast_gml_node_def_ctr("RawId", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("arr", 0), new ast_gml_node_def_param("index", 0)]), new ast_gml_node_def_ctr("RawIdSet", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("arr", 0), new ast_gml_node_def_param("index", 0), new ast_gml_node_def_param("val", 0)]), new ast_gml_node_def_ctr("RawIdAop", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("arr", 0), new ast_gml_node_def_param("index", 0), new ast_gml_node_def_param("op", 9), new ast_gml_node_def_param("val", 0)]), new ast_gml_node_def_ctr("RawId2d", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("arr", 0), new ast_gml_node_def_param("index1", 0), new ast_gml_node_def_param("index2", 0)]), new ast_gml_node_def_ctr("RawId2dSet", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("arr", 0), new ast_gml_node_def_param("index1", 0), new ast_gml_node_def_param("index2", 0), new ast_gml_node_def_param("val", 0)]), new ast_gml_node_def_ctr("RawId2dAop", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("arr", 0), new ast_gml_node_def_param("index1", 0), new ast_gml_node_def_param("index2", 0), new ast_gml_node_def_param("op", 9), new ast_gml_node_def_param("val", 0)]), new ast_gml_node_def_ctr("DsList", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("list", 0), new ast_gml_node_def_param("index", 0)]), new ast_gml_node_def_ctr("DsListSet", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("list", 0), new ast_gml_node_def_param("index", 0), new ast_gml_node_def_param("val", 0)]), new ast_gml_node_def_ctr("DsListAop", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("list", 0), new ast_gml_node_def_param("index", 0), new ast_gml_node_def_param("op", 9), new ast_gml_node_def_param("val", 0)]), new ast_gml_node_def_ctr("DsMap", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("map", 0), new ast_gml_node_def_param("key", 0)]), new ast_gml_node_def_ctr("DsMapSet", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("map", 0), new ast_gml_node_def_param("key", 0), new ast_gml_node_def_param("val", 0)]), new ast_gml_node_def_ctr("DsMapAop", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("map", 0), new ast_gml_node_def_param("key", 0), new ast_gml_node_def_param("op", 9), new ast_gml_node_def_param("val", 0)]), new ast_gml_node_def_ctr("DsGrid", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("grid", 0), new ast_gml_node_def_param("index1", 0), new ast_gml_node_def_param("index2", 0)]), new ast_gml_node_def_ctr("DsGridSet", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("grid", 0), new ast_gml_node_def_param("index1", 0), new ast_gml_node_def_param("index2", 0), new ast_gml_node_def_param("val", 0)]), new ast_gml_node_def_ctr("DsGridAop", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("grid", 0), new ast_gml_node_def_param("index1", 0), new ast_gml_node_def_param("index2", 0), new ast_gml_node_def_param("op", 9), new ast_gml_node_def_param("val", 0)]), new ast_gml_node_def_ctr("KeyId", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("obj", 0), new ast_gml_node_def_param("key", 0)]), new ast_gml_node_def_ctr("KeyIdSet", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("obj", 0), new ast_gml_node_def_param("key", 0), new ast_gml_node_def_param("val", 0)]), new ast_gml_node_def_ctr("KeyIdAop", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("obj", 0), new ast_gml_node_def_param("key", 0), new ast_gml_node_def_param("op", 9), new ast_gml_node_def_param("val", 0)]), new ast_gml_node_def_ctr("VarDecl", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("name", 13), new ast_gml_node_def_param("val", 0)]), new ast_gml_node_def_ctr("Block", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("nodes", 1)]), new ast_gml_node_def_ctr("IfThen", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("cond", 0), new ast_gml_node_def_param("then", 0), new ast_gml_node_def_param("not", 0)]), new ast_gml_node_def_ctr("Ternary", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("cond", 0), new ast_gml_node_def_param("then", 0), new ast_gml_node_def_param("not", 0)]), new ast_gml_node_def_ctr("Switch", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("expr", 0), new ast_gml_node_def_param("cases", 4), new ast_gml_node_def_param("def", 0)]), new ast_gml_node_def_ctr("Wait", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("time", 0)]), new ast_gml_node_def_ctr("Fork", [new ast_gml_node_def_param("pos", 2)]), new ast_gml_node_def_ctr("While", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("cond", 0), new ast_gml_node_def_param("loop", 0)]), new ast_gml_node_def_ctr("DoUntil", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("loop", 0), new ast_gml_node_def_param("cond", 0)]), new ast_gml_node_def_ctr("DoWhile", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("loop", 0), new ast_gml_node_def_param("cond", 0)]), new ast_gml_node_def_ctr("Repeat", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("times", 0), new ast_gml_node_def_param("loop", 0)]), new ast_gml_node_def_ctr("For", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("pre", 0), new ast_gml_node_def_param("cond", 0), new ast_gml_node_def_param("post", 0), new ast_gml_node_def_param("loop", 0)]), new ast_gml_node_def_ctr("With", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("ctx", 0), new ast_gml_node_def_param("loop", 0)]), new ast_gml_node_def_ctr("Once", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("loop", 0)]), new ast_gml_node_def_ctr("Return", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("val", 0)]), new ast_gml_node_def_ctr("Exit", [new ast_gml_node_def_param("pos", 2)]), new ast_gml_node_def_ctr("Break", [new ast_gml_node_def_param("pos", 2)]), new ast_gml_node_def_ctr("Continue", [new ast_gml_node_def_param("pos", 2)]), new ast_gml_node_def_ctr("Debugger", [new ast_gml_node_def_param("pos", 2)]), new ast_gml_node_def_ctr("TryCatch", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("block", 0), new ast_gml_node_def_param("capvar", 13), new ast_gml_node_def_param("catcher", 0)]), new ast_gml_node_def_ctr("Throw", [new ast_gml_node_def_param("pos", 2), new ast_gml_node_def_param("err", 0)])];
global.gml_script_index_offset = 0;
global.gml_source_unknown = gml_source_init_unknown();
global.gml_source_builtin = gml_source_init_builtin();
global.data_gml_keyword_mapper_map = data_gml_keyword_mapper_init();
global.gml_seek_eval_eval_thread = undefined;
global.gml_seek_eval_eval_actions = ds_list_create();
global.gml_seek_eval_invalid_value = [];
global.gml_std_gml_internal_ArrayImpl_join_buf = undefined;
global.gml_std_haxe_boot_isJS = false;
global.live_live_sprites = ds_map_create();
global.live_live_sprites_start = ds_list_create();
global.live_live_sprites_stop = ds_list_create();
global.live_live_point_paths = ds_map_create();
global.live_live_point_paths_start = ds_list_create();
global.live_live_point_paths_stop = ds_list_create();
global.live_live_anim_curves = ds_map_create();
global.live_live_anim_curves_start = ds_list_create();
global.live_live_anim_curves_stop = ds_list_create();
global.live_live_included_files = ds_map_create();
global.live_live_included_files_start = ds_list_create();
global.live_live_included_files_stop = ds_list_create();
global.live_live_room = -1;
global.live_live_room_data = ds_map_create();
global.live_live_rooms = ds_map_create();
global.live_live_rooms_start = ds_list_create();
global.live_live_rooms_stop = ds_list_create();
global.live_blank_object = -1;
global.live_blank_room = -1;
global.live_sprite_updated = live_default_update;
global.live_path_updated = live_default_update;
global.live_animcurve_updated = live_default_update;
global.live_code_updated = live_default_update;
global.live_room_updated = live_room_updated_impl;
global.live_last_warn_at = 0;
global.live_async_http_1_found = {};
global.live_async_http_1_acc = ds_list_create();
global.live_shader_updated = live_shader_updated_default;
global.live_shader_live_shaders = ds_map_create();
global.live_shader_live_shaders_start = ds_list_create();
global.live_shader_live_shaders_stop = ds_list_create();
global.live_log_impl_levels = ["info", "WARN", "ERROR"];
global.live_is_ready = false;
global.live_request_url = undefined;
global.live_request_guid = undefined;
global.live_request_id = undefined;
global.live_config = undefined;
global.live_runtime_version = "";
global.live_build_date = 0;
global.live_request_time = -100000;
global.live_request_rate = 1;
global.live_request_password = "";
global.live_result = "";
global.live_allow_trailing_args = true;
global.live_init_timeout = 30;
global.live_init_attempts = 5;
global.live_live_map = {};
global.live_live_enums = {};
global.live_live_macros = {};
global.live_live_globals = undefined;
global.live_temp_path = live_temp_path_init();
global.live_log_script = live_log_impl;
global.live_update_script = live_update_script_impl;
global.live_name = undefined;
global.live_custom_self = undefined;
global.live_custom_other = undefined;
global.live_last_update_at = 0;
global.live_warned_about_init_timeout = false;
global.live_room_loader_object_cache = ds_map_create();
global.live_room_loader_sprite_cache = ds_map_create();
global.live_room_loader_use_physics = false;
global.live_room_loader_room_x = 0;
global.live_room_loader_room_y = 0;
global.live_room_loader_apply_backgrounds = true;
global.live_room_loader_apply_instances = true;
global.live_room_loader_apply_tiles = true;
global.live_room_loader_apply_views = true;
global.live_room_loader_apply_settings = true;
global.live_room_loader_apply_sprites = true;
global.live_room_loader_apply_filters = true;
global.live_room_loader_inst_map_gml = ds_map_create();
global.live_room_loader_inst_map_yy = ds_map_create();
global.gml_thread_current_kind = 0;
global.gml_type_check_map = gml_type_check_init();
global.vm__gml_with_data_gml_with_data_impl__pools = vm__gml_with_data_gml_with_data_impl__init();
global.gml_type_ref_root = gml_type_ref_init();
global.vm_v2_gml_thread_group_call_gml23_funcs = vm_v2_gml_thread_group_call_gml23_init();
live_validate_scripts();
gml_parser_set_version(23);
live_bits_gmlive_ready_run();
live_preinit_api();
live_preinit_project();

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_7,
    Value_8,
    Value_9,
    Value_10,
    Value_11,
    Value_12,
    Value_13,
    Value_14,
    Value_15,
    Value_16,
    Value_17,
    Value_18,
    Value_19,
    Value_20,
    Value_21,
    Value_22,
    Value_23,
    Value_24,
    Value_25,
    Value_26,
    Value_27,
    Value_28,
    Value_29,
    Value_30,
    Value_31,
    Value_32,
    Value_33,
    Value_34,
    Value_35,
    Value_36,
    Value_37,
    Value_38,
    Value_39,
    Value_40,
    Value_41,
    Value_42,
    Value_43,
    Value_44,
    Value_45,
    Value_46,
    Value_47,
    Value_48,
    Value_49,
    Value_50,
    Value_51,
    Value_52,
    Value_53,
    Value_54,
    Value_55,
    Value_56,
    Value_57,
    Value_58,
    Value_59,
    Value_60,
    Value_61,
    Value_62,
    Value_63,
    Value_64,
    Value_65,
    Value_66,
    Value_67,
    Value_68,
    Value_69,
    Value_70,
    Value_71,
    Value_72,
    Value_73,
    Value_74,
    Value_75,
    Value_76,
    Value_77,
    Value_78,
    Value_79,
    Value_80,
    Value_81,
    Value_82,
    Value_83,
    Value_84,
    Value_85,
    Value_86,
    Value_87,
    Value_88,
    Value_89,
    Value_90,
    Value_91,
    Value_92,
    Value_93,
    Value_94,
    Value_95,
    Value_96,
    Value_97,
    Value_98,
    Value_99,
    Value_100,
    Value_101,
    Value_102,
    Value_103,
    Value_104,
    Value_105,
    Value_106,
    Value_107,
    Value_108,
    Value_109,
    Value_110,
    Value_111,
    Value_112,
    Value_113,
    Value_114
}
