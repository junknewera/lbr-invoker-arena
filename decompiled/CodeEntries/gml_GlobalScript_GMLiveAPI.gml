function __lnc__std_gml_NativeTypeHelper_isNumber(arg0)
{
    return (is_real(arg0) || is_bool(arg0) || is_int32(arg0)) || is_int64(arg0);
}

function live_preinit_init_funcs()
{
    gml_func_add("gml_pragma(setting, ...)", function()
    {
    });
    var l_fm = ds_map_create();
    var l_fl = ds_list_create();
    var l_isJS = false;
    if (!l_isJS)
    {
        for (var l_i = 0; l_i < 10000; l_i++)
        {
            var l_scr = l_i;
            var l_name = script_get_name(l_scr);
            if (string_ord_at(l_name, 1) == 60)
            {
                break;
            }
            if (string_length(l_name) >= 64)
            {
                l_name = string_copy(l_name, 1, 64);
            }
            var l_fc = string_ord_at(l_name, 1);
            if (l_fc == 60)
            {
                break;
            }
            if (!(l_fc == 95 || (l_fc >= 97 && l_fc <= 122) || (l_fc >= 65 && l_fc <= 90)))
            {
                continue;
            }
            var l_func = method(undefined, l_scr);
            var l_m = 
            {
                name: l_name,
                func: l_func,
                used: false
            };
            ds_map_set(l_fm, l_name, l_m);
            ds_list_add(l_fl, l_m);
        }
    }
    var l_jsDummy = l_isJS ? function()
    {
    } : undefined;
    var l_jsIndex = 0;
    var l_lines = file_text_open_from_string("nameof=(name)\nis_real=(val)#:bool\nis_numeric=(val):\nis_string=(val)#:bool\nis_array=(val)#:bool\nis_undefined=(val)#:bool\nis_int32=(val)#:bool\nis_int64=(val)#:bool\nis_ptr=(val)#:bool\nis_bool=(val)#:bool\nis_nan=(val):\nis_infinity=(val):\nis_struct=(val):\nis_method=(val):\nis_instanceof=(struct, constructor_name):\nis_callable=(val):\nis_handle=(val):\nstatic_get=(struct_or_func_name):\nstatic_set=(struct, struct)\ntypeof=(val)#:bool\ninstanceof=(any)#:string\nexception_unhandled_handler=(user_handler)\nvariable_global_exists=(name):\nvariable_global_get=(name):\nvariable_global_set=(name,val)\nvariable_instance_exists=(id,name):\nvariable_instance_get=(id,name):\nvariable_instance_set=(id,name,val)\nvariable_instance_get_names=(id):\nvariable_instance_names_count=(:any):int\nvariable_struct_exists=(struct,name):\nvariable_struct_get=(struct,name):\nvariable_struct_set=(struct,name,val)\nvariable_struct_get_names=(struct):\nvariable_struct_names_count=(struct):int\nvariable_struct_remove=(struct,name)\nvariable_get_hash=(name):\nvariable_clone=(var,[depth])\nstruct_exists=(struct,name):\nstruct_get=(struct,name):\nstruct_set=(struct,name,val)\nstruct_get_names=(struct):\nstruct_names_count=(struct)\nstruct_remove=(struct,name) \nstruct_foreach=(struct,func)\nstruct_get_from_hash=(struct,hash):\nstruct_set_from_hash=(struct,hash,val)\narray_length=(value):int\narray_equals=(one, two):\narray_create=(size:number, ?value:any):array\narray_copy=(dest,dest_index,src,src_index,length)\narray_resize=(variable,newsize)\narray_get=(variable,index):\narray_set=(variable,index,val)\narray_push=(array,val,...)\narray_pop=(array)\narray_shift=(array)\narray_insert=(array,index,val,...)\narray_delete=(array,index,number)\narray_sort=(array,sortType_or_function)\narray_shuffle=(array,[offset],[length])\narray_shuffle_ext=(array,[offset],[length])\narray_get_index=(array,value,[offset],[length]):\narray_contains=(array,value,[offset],[length])\narray_contains_ext=(array,values,[matchAll],[offset],[length])\narray_first=(array)\narray_last=(array)\narray_create_ext=(size,function):\narray_find_index=(array,function,[offset],[length]):\narray_any=(array,function,[offset],[length])\narray_all=(array,function,[offset],[length])\narray_foreach=(array,function,[offset],[length])\narray_reduce=(array,function,[init_value],[offset],[length])\narray_filter=(array,function,[offset],[length])\narray_filter_ext=(array,function,[offset],[length])\narray_map=(array,function,[offset],[length])\narray_map_ext=(array,function,[offset],[length])\narray_copy_while=(array,function,[offset],[length])\narray_unique=(array,[offset],[length])\narray_unique_ext=(array,[offset],[length])\narray_reverse=(array,[offset],[length])\narray_reverse_ext=(array,[offset],[length])\narray_concat=(...)\narray_union=(...)\narray_intersection=(...)\nrandom=(x:number):number\nrandom_range=(:number,:number):number\nirandom=(x:number):int\nirandom_range=(:number,:number):int\nrandom_set_seed=(seed)\nrandom_get_seed=():\nrandomize=():number\nrandomise=():number\nabs=(x:number)#:number\nround=(x:number)#:int\nfloor=(x:number)#:int\nceil=(x:number)#:int\nsign=(x:number)#:int\nfrac=(x:number)#:number\nsqrt=(x:number)#:number\nsqr=(x:number)#:number\nexp=(x:number)#:number\nln=(x:number)#:number\nlog2=(x:number)#:number\nlog10=(x:number)#:number\nsin=(radian_angle:number)#:number\ncos=(radian_angle:number)#:number\ntan=(radian_angle:number)#:number\narcsin=(x:number)#:number\narccos=(x:number)#:number\narctan=(x:number)#:number\narctan2=(y:number, x:number)#:number\ndsin=(degree_angle:number)#:number\ndcos=(degree_angle:number)#:number\ndtan=(degree_angle:number)#:number\ndarcsin=(x:number)#:number\ndarccos=(x:number)#:number\ndarctan=(x:number)#:number\ndarctan2=(y:number, x:number)#:number\ndegtorad=(x:number)#:number\nradtodeg=(x:number)#:number\npower=(x:number, n:number)#:number\nlogn=(n:number, x:number)#:number\nmean=(...:number)#:number\nmedian=(...:any)#:any\nclamp=(val:number, min:number, max:number)#:number\nlerp=(val1:number, val2:number, amount:number)#:number\ndot_product=(x1:number, y1:number, x2:number, y2:number)#:\ndot_product_3d=(x1:number, y1:number, z1:number, x2:number, y2:number, z2:number)#:\ndot_product_normalised=(x1:number, y1:number, x2:number, y2:number)£#:\ndot_product_3d_normalised=(x1:number, y1:number, z1:number, x2:number, y2:number, z2:number)£#:\ndot_product_normalized=(x1:number, y1:number, x2:number, y2:number)$#:\ndot_product_3d_normalized=(x1:number, y1:number, z1:number, x2:number, y2:number, z2:number)$#:\nmath_set_epsilon=(eps):\nmath_get_epsilon=():\nangle_difference=(src:number, dest:number)#:number\npoint_distance_3d=(x1:number, y1:number, z1:number, x2:number, y2:number, z2:number)#:number\npoint_distance=(x1:number, y1:number, x2:number, y2:number)#:number\npoint_direction=(x1:number, y1:number, x2:number, y2:number)#:number\nlengthdir_x=(len:number, dir:number)#:number\nlengthdir_y=(len:number, dir:number)#:number\nreal=(val)#:number\nbool=(val):\nstring=(val_or_template, ...)\nint64=(val)#:int\nptr=(val):bool\nhandle_parse=(val_string)\nstring_format=(val:number,total:number,dec:number)#:string\nchr=(val:int)#:string\nansi_char=(val)#:\nord=(char:string)#:int\nmethod=(struct_ref_or_instance_id, func):\nmethod_get_index=(method):\nmethod_get_self=(method):\nstring_length=(str:string)#:int\nstring_byte_length=(str:string)#:int\nstring_pos=(substr:string, str:string)#:int\nstring_pos_ext=(substr:string, str:string, start:int)#:int\nstring_last_pos=(substr:string, str:string)#:int\nstring_last_pos_ext=(substr:string, str:string, start:int)#:int\nstring_copy=(str:string, index:int, count:int)#:string\nstring_char_at=(str:string, index:int)#:string\nstring_ord_at=(str:string, index:int)#:int\nstring_byte_at=(str:string, index:int)#:int\nstring_set_byte_at=(str:string, index:int, val:int)#:string\nstring_delete=(str:string, index:int, count:int)#:string\nstring_insert=(substr:string, str:string, index:int)#:string\nstring_lower=(str:string)#:string\nstring_upper=(str:string)#:string\nstring_repeat=(str:string, count:int)#:string\nstring_letters=(str:string)#:string\nstring_digits=(str:string)#:string\nstring_lettersdigits=(str:string)#:string\nstring_replace=(str:string, substr:string, newstr:string)#:string\nstring_replace_all=(str:string, substr:string, newstr:string)#:string\nstring_count=(substr:string, str:string)#:int\nstring_hash_to_newline=(:string)#:string\nstring_ext=(format,arg_array)\nstring_trim_start=(str, [substrs])\nstring_trim_end=(str, [substrs])\nstring_trim=(str, [substrs])\nstring_starts_with=(str,substr)\nstring_ends_with=(str,substr)\nstring_split=(str,delim,[remove_empty],[max_splits])\nstring_split_ext=(str,delim_array,[remove_empty],[max_splits])\nstring_join=(delim,...)\nstring_join_ext=(delim,val_array)\nstring_concat=(...)\nstring_concat_ext=(val_array,[offset],[length])\nstring_foreach=(str,func,[pos],[length])\nclipboard_has_text=():\nclipboard_set_text=(str)\nclipboard_get_text=():\ndate_current_datetime=():date\ndate_create_datetime=(year,month,day,hour,minute,second):\ndate_valid_datetime=(year:int,month:int,day:int,hour:int,minute:int,second:int):date\ndate_inc_year=(:date,amount):date\ndate_inc_month=(:date,amount):date\ndate_inc_week=(:date,amount):date\ndate_inc_day=(:date,amount):date\ndate_inc_hour=(:date,amount):date\ndate_inc_minute=(:date,amount):date\ndate_inc_second=(:date,amount):date\ndate_get_year=(date):\ndate_get_month=(date):\ndate_get_week=(date):\ndate_get_day=(date):\ndate_get_hour=(date):\ndate_get_minute=(date):\ndate_get_second=(date):\ndate_get_weekday=(date):\ndate_get_day_of_year=(date):\ndate_get_hour_of_year=(date):\ndate_get_minute_of_year=(date):\ndate_get_second_of_year=(date):\ndate_year_span=(date1:date,date2:date):number\ndate_month_span=(date1:date,date2:date):number\ndate_week_span=(date1:date,date2:date):number\ndate_day_span=(date1:date,date2:date):number\ndate_hour_span=(date1:date,date2:date):number\ndate_minute_span=(date1:date,date2:date):number\ndate_second_span=(date1:date,date2:date):number\ndate_compare_datetime=(date1:date,date2:date):number\ndate_compare_date=(date1:date,date2:date):number\ndate_compare_time=(date1:date,date2:date):number\ndate_date_of=(:date):date\ndate_time_of=(:date):date\ndate_datetime_string=(:date):string\ndate_date_string=(:date):string\ndate_time_string=(:date):string\ndate_days_in_month=(:date):int\ndate_days_in_year=(:date):int\ndate_leap_year=(:date):bool\ndate_is_today=(:date):bool\ndate_set_timezone=(timezone)\ndate_get_timezone=():\ngame_set_speed=(value,type)\ngame_get_speed=(type):\nmotion_set=:(dir:number, speed:number)\nmotion_add=:(dir:number, speed:number)\nplace_free=:(x:number, y:number):bool\nplace_empty=:(x:number, y:number):bool\nplace_meeting=:(x:number, y:number, obj:index):\nplace_snapped=:(hsnap:number, vsnap:number):bool\nmove_random=:(hsnap:number, vsnap:number)\nmove_snap=:(hsnap:number, vsnap:number)\nmove_towards_point=:(x:number, y:number, sp:number)\nmove_contact_solid=:(dir:number, maxdist:number)\nmove_contact_all=:(dir:number, maxdist:number)\nmove_outside_solid=:(dir:number, maxdist:number)\nmove_outside_all=:(dir:number, maxdist:number)\nmove_bounce_solid=:(advanced:bool)\nmove_bounce_all=:(advanced:bool)\nmove_wrap=:(hor:bool, vert:bool, margin:number)\nmove_and_collide=:(dx,dy,obj,[num_iterations], [xoff],[yoff],[max_x_move],[max_y_move])\ndistance_to_point=:(x:number, y:number):number\ndistance_to_object=:(obj:index):number\nposition_empty=:(x:number, y:number):bool\nposition_meeting=:(x:number, y:number, obj:index):bool\npath_start=:(path,speed,endaction,absolute)\npath_end=:()\nmp_linear_step=:(x:number,y:number,speed:number,checkall:bool):\nmp_potential_step=:(x:number,y:number,speed:number,checkall:bool):\nmp_linear_step_object=:(x:number,y:number,speed:number,obj:index):\nmp_potential_step_object=:(x:number,y:number,speed:number,obj:index):\nmp_potential_settings=:(maxrot,rotstep,ahead,onspot)\nmp_linear_path=:(path:index,x:number,y:number,step:number,checkall:bool):\nmp_potential_path=:(path:index,x:number,y:number,step:number,factor:number,checkall:bool):\nmp_linear_path_object=:(path:index,x:number,y:number,step:number,obj:index):\nmp_potential_path_object=:(path:index,x:number,y:number,step:number,factor:number,obj:index):\nmp_grid_create=(left,top,hcells,vcells,cellwidth,cellheight):\nmp_grid_destroy=(id)\nmp_grid_clear_all=(id)\nmp_grid_clear_cell=(id,h,v)\nmp_grid_clear_rectangle=(id,left,top,right,bottom)\nmp_grid_add_cell=(id,h,v)\nmp_grid_get_cell=(id,h,v):\nmp_grid_add_rectangle=(id,left,top,right,bottom)\nmp_grid_add_instances=:(id,obj,prec)\nmp_grid_path=:(:index,path:index,xstart:number,ystart:number,xgoal:number,ygoal:number,allowdiag:bool):\nmp_grid_draw=(id)\nmp_grid_to_ds_grid=(src_mp_grid:index, dest_ds_grid:index):bool\ncollision_point=:(x:number, y:number, obj:index, prec:bool, notme:bool):\ncollision_rectangle=:(x1:number, y1:number, x2:number, y2:number, obj:index, prec, notme):\ncollision_circle=:(x1:number, y1:number, radius, obj:index, prec, notme):\ncollision_ellipse=:(x1:number, y1:number, x2:number, y2:number, obj:index, prec, notme):\ncollision_line=:(x1:number, y1:number, x2:number, y2:number, obj:index, prec, notme):\ncollision_point_list=(x,y,obj,prec,notme,list,ordered):\ncollision_rectangle_list=(x1,y1,x2,y2,obj,prec,notme,list,ordered):\ncollision_circle_list=(x1,y1,radius,obj,prec,notme,list,ordered):\ncollision_ellipse_list=(x1,y1,x2,y2,obj,prec,notme,list,ordered):\ncollision_line_list=(x1,y1,x2,y2,obj,prec,notme,list,ordered):\ninstance_position_list=:(x:number, y:number, obj:index, list, ordered:bool):\ninstance_place_list=:(x:number, y:number, obj:index, list, ordered:bool):\npoint_in_rectangle=(px, py, x1:number, y1:number, x2:number, y2:number):\npoint_in_triangle=(px, py, x1:number, y1:number, x2:number, y2:number, x3:number, y3:number):\npoint_in_circle=(px, py, cx, cy, rad):\nrectangle_in_rectangle=(sx1:number, sy1:number, sx2:number, sy2:number, dx1:number, dy1:number, dx2:number, dy2:number):\nrectangle_in_triangle=(sx1:number, sy1:number, sx2:number, sy2:number, x1:number, y1:number, x2:number, y2:number, x3:number, y3:number):\nrectangle_in_circle=(sx1:number, sy1:number, sx2:number, sy2:number, cx:number, cy:number, rad:number):\ninstance_find=(obj:id, n:int):any\ninstance_exists=(obj:any):bool\ninstance_number=(obj:any):int\ninstance_position=(x:number, y:number, obj:any):any\ninstance_nearest=:(x:number, y:number, obj:any):any\ninstance_furthest=:(x:number, y:number, obj:any):any\ninstance_place=:(x:number, y:number, obj:any):any\ninstance_create_depth=(x:number, y:number, depth:number, obj:id, ?obj):any\ninstance_create_layer=(x:number, y:number, layer, obj:id, ?obj):any\ninstance_copy=:(performevent:bool):any\ninstance_change=:(obj,performevents)\ninstance_destroy=:(?what:any, ?performevent:bool)\nposition_destroy=:(x,y)\nposition_change=:(x,y,obj,performevents)\ninstance_id_get=(index):\ninstance_deactivate_all=:(notme)\ninstance_deactivate_object=:(obj)\ninstance_deactivate_region=:(left,top,width,height,inside,notme)\ninstance_activate_all=:()\ninstance_activate_object=:(obj)\ninstance_activate_region=:(left,top,width,height,inside)\nroom_goto=(numb)\nroom_goto_previous=()\nroom_goto_next=()\nroom_previous=(numb):\nroom_next=(numb):\nroom_restart=()\ngame_end=()\ngame_restart=()\ngame_load=(filename):\ngame_save=(filename)\ngame_save_buffer=(buffer)\ngame_load_buffer=(buffer):\ngame_change=(working_directory,launch_parameters)\nscheduler_resolution_set=(milliseconds)\nscheduler_resolution_get=():\nevent_perform=:(type,numb)\nevent_perform_async=(type,ds_map)\nevent_user=:(numb)\nevent_perform_object=:(obj,type,numb)\nevent_inherited=:()\nshow_debug_message=(val_or_format, ...)\nshow_debug_message_ext=(format,array_value)\nshow_debug_overlay=(enable,[minimised],[scale],[alpha],...)\nis_debug_overlay_open=():\nis_mouse_over_debug_overlay=():\nis_keyboard_used_debug_overlay=():\nshow_debug_log=(enable)\ndebug_event=(str,...)\ndebug_get_callstack=([maxdepth],...):\nalarm_get=:(:int):\nalarm_set=:(:int, value:int)\ndbg_view=(name,visible,[x],[y],[width],[height],...)\ndbg_section=(name,[open])\ndbg_view_delete=(viewPTR)\ndbg_view_exists=(viewPTR):\ndbg_section_delete=(sectionPTR)\ndbg_section_exists=(sectionPTR):\ndbg_slider=(dbgRef,[minimum],[maximum],[label],...)\ndbg_slider_int=(dbgRef,[minimum],[maximum],[label],...)\ndbg_drop_down=(dbgRef,specifierOrArrayValues,[labelOrArrayLabels],[label]...)\ndbg_watch=(dbgRef,[label],...)\ndbg_text=(dbgRefOrString)\ndbg_sprite=(dbgRefSprite,dbgRefSpriteIndex,[label],[width],[height]...)\ndbg_text_input=(dbgRef,[label],[type]...)\ndbg_checkbox=(dbgRef,[label],...)\ndbg_colour=(dbgRef,[label],...)£\ndbg_color=(dbgRef,[label],...)$\ndbg_button=(label,dbgRef,[width],[height]...)\ndbg_same_line=()\ndbg_add_font_glyphs=(filenameTTF,[size],[fontRange]...)\nref_create=(dbgrefOrStruct,dbgrefOrName,[index],...):\nkeyboard_set_map=(key1, key2):bool\nkeyboard_get_map=(key):\nkeyboard_unset_map=()\nkeyboard_check=(key:index):\nkeyboard_check_pressed=(key:index):\nkeyboard_check_released=(key:index):\nkeyboard_check_direct=(key:index):\nkeyboard_get_numlock=():\nkeyboard_set_numlock=(on)\nkeyboard_key_press=(key)\nkeyboard_key_release=(key)\nkeyboard_clear=(key:index)\nio_clear=()\nmouse_check_button=(button:index):\nmouse_check_button_pressed=(button:index):\nmouse_check_button_released=(button:index):\nmouse_wheel_up=():\nmouse_wheel_down=():\nmouse_clear=(button)\ndraw_self=:()\ndraw_sprite=:(sprite,subimg,x,y)\ndraw_sprite_pos=:(sprite,subimg,x1,y1,x2,y2,x3,y3,x4,y4,alpha)\ndraw_sprite_ext=:(sprite,subimg,x,y,xscale,yscale,rot,col,alpha)\ndraw_sprite_stretched=:(sprite,subimg,x,y,w,h)\ndraw_sprite_stretched_ext=:(sprite,subimg,x,y,w,h,col,alpha)\ndraw_sprite_tiled=:(sprite,subimg,x,y)\ndraw_sprite_tiled_ext=:(sprite,subimg,x,y,xscale,yscale,col,alpha)\ndraw_sprite_part=:(sprite,subimg,left,top,width,height,x,y)\ndraw_sprite_part_ext=:(sprite,subimg,left,top,width,height,x,y,xscale,yscale,col,alpha)\ndraw_sprite_general=:(sprite,subimg,left,top,width,height,x,y,xscale,yscale,rot,c1,c2,c3,c4,alpha)\ndraw_clear=(col)\ndraw_clear_alpha=(col,alpha)\ndraw_point=(x,y)\ndraw_line=(x1,y1,x2,y2)\ndraw_line_width=(x1,y1,x2,y2,w)\ndraw_rectangle=(x1,y1,x2,y2,outline)\ndraw_roundrect=(x1,y1,x2,y2,outline)\ndraw_roundrect_ext=(x1,y1,x2,y2,radiusx,radiusy,outline)\ndraw_triangle=(x1,y1,x2,y2,x3,y3,outline)\ndraw_circle=(x,y,r,outline)\ndraw_ellipse=(x1,y1,x2,y2,outline)\ndraw_set_circle_precision=(precision)\ndraw_arrow=(x1,y1,x2,y2,size)\ndraw_button=(x1,y1,x2,y2,up)\ndraw_path=(path,x,y,absolute)\ndraw_healthbar=(x1,y1,x2,y2,amount,backcol,mincol,maxcol,direction,showback,showborder)\ndraw_getpixel=(x,y):\ndraw_getpixel_ext=(x,y):\ndraw_set_colour=(:color)\ndraw_set_color=(:color)\ndraw_set_alpha=(alpha:number)\ndraw_get_colour=():color\ndraw_get_color=():color\ndraw_get_alpha=():number\nmerge_colour=(col1:color, col2:color, amount:number)#:color\nmake_colour_rgb=(red:number, green:number, blue:number)#:color\nmake_colour_hsv=(hue:number, saturation:number, value:number)#:color\ncolour_get_red=(:color)#:int\ncolour_get_green=(:color)#:int\ncolour_get_blue=(:color)#:int\ncolour_get_hue=(:color)#:number\ncolour_get_saturation=(:color)#:number\ncolour_get_value=(:color)#:number\nmerge_color=(col1:color, col2:color, amount:number)#:color\nmake_color_rgb=(red:number, green:number, blue:number)#:color\nmake_color_hsv=(hue:number, saturation:number, value:number)#:color\ncolor_get_red=(:color)#:int\ncolor_get_green=(:color)#:int\ncolor_get_blue=(:color)#:int\ncolor_get_hue=(:color)#:number\ncolor_get_saturation=(:color)#:number\ncolor_get_value=(:color)#:number\nscreen_save=(fname)\nscreen_save_part=(fname,x,y,w,h)\ngif_open=(width:int, height:int, ?color:int):int\ngif_add_surface=(gif:int, surf, delay:number, ?xoffset:number, ?yoffset:number, ?quant:number):int\ngif_save=(gif:int, fname:string):int\ngif_save_buffer=(gif:int):int\ndraw_set_font=(:font)\ndraw_get_font=():\ndraw_set_halign=(halign:int)\ndraw_get_halign=():\ndraw_set_valign=(valign:int)\ndraw_get_valign=():\ndraw_text=(x,y,string)\ndraw_text_ext=(x,y,string,sep,w)\nstring_width=(:string):number\nstring_height=(:string):number\nstring_width_ext=(:string, sep:number, w:number):number\nstring_height_ext=(:string, sep:number, w:number):number\ndraw_text_transformed=(x,y,string,xscale,yscale,angle)\ndraw_text_ext_transformed=(x,y,string,sep,w,xscale,yscale,angle)\ndraw_text_colour=(x,y,string,c1,c2,c3,c4,alpha)£\ndraw_text_ext_colour=(x,y,string,sep,w,c1,c2,c3,c4,alpha)£\ndraw_text_transformed_colour=(x,y,string,xscale,yscale,angle,c1,c2,c3,c4,alpha)£\ndraw_text_ext_transformed_colour=(x,y,string,sep,w,xscale,yscale,angle,c1,c2,c3,c4,alpha)£\ndraw_text_color=(x,y,string,c1,c2,c3,c4,alpha)$\ndraw_text_ext_color=(x,y,string,sep,w,c1,c2,c3,c4,alpha)$\ndraw_text_transformed_color=(x,y,string,xscale,yscale,angle,c1,c2,c3,c4,alpha)$\ndraw_text_ext_transformed_color=(x,y,string,sep,w,xscale,yscale,angle,c1,c2,c3,c4,alpha)$\ndraw_point_colour=(x,y,col1)£\ndraw_line_colour=(x1,y1,x2,y2,col1,col2)£\ndraw_line_width_colour=(x1,y1,x2,y2,w,col1,col2)£\ndraw_rectangle_colour=(x1,y1,x2,y2,col1,col2,col3,col4,outline)£\ndraw_roundrect_colour=(x1,y1,x2,y2,col1,col2,outline)£\ndraw_roundrect_colour_ext=(x1,y1,x2,y2,radiusx,radiusy,col1,col2,outline)£\ndraw_triangle_colour=(x1,y1,x2,y2,x3,y3,col1,col2,col3,outline)£\ndraw_circle_colour=(x,y,r,col1,col2,outline)£\ndraw_ellipse_colour=(x1,y1,x2,y2,col1,col2,outline)£\ndraw_point_color=(x,y,col1)$\ndraw_line_color=(x1,y1,x2,y2,col1,col2)$\ndraw_line_width_color=(x1,y1,x2,y2,w,col1,col2)$\ndraw_rectangle_color=(x1,y1,x2,y2,col1,col2,col3,col4,outline)$\ndraw_roundrect_color=(x1,y1,x2,y2,col1,col2,outline)$\ndraw_roundrect_color_ext=(x1,y1,x2,y2,radiusx,radiusy,col1,col2,outline)$\ndraw_triangle_color=(x1,y1,x2,y2,x3,y3,col1,col2,col3,outline)$\ndraw_circle_color=(x,y,r,col1,col2,outline)$\ndraw_ellipse_color=(x1,y1,x2,y2,col1,col2,outline)$\ndraw_primitive_begin=(kind)\ndraw_vertex=(x,y)\ndraw_vertex_colour=(x,y,col,alpha)£\ndraw_vertex_color=(x,y,col,alpha)$\ndraw_primitive_end=()\nsprite_get_uvs=(spr:index, subimg:number):\nfont_get_uvs=(font:index):\nfont_get_info=(font):\nfont_cache_glyph=(font,glyphIndex)\nsprite_get_texture=(spr:index, subimg:number):\nfont_get_texture=(font:index):\ntexture_get_width=(texid):\ntexture_get_height=(texid):\ntexture_get_uvs=(texid):\ndraw_primitive_begin_texture=(kind,texid)\ndraw_vertex_texture=(x,y,xtex,ytex)\ndraw_vertex_texture_colour=(x,y,xtex,ytex,col,alpha)£\ndraw_vertex_texture_color=(x,y,xtex,ytex,col,alpha)$\ntexture_global_scale=(pow2integer)\nsurface_create=(w,h,[format]):\nsurface_create_ext=(name,w,h):\nsurface_resize=(id,width,height)\nsurface_free=(id)\nsurface_exists=(id):\nsurface_get_width=(id):\nsurface_get_height=(id):\nsurface_get_texture=(id):\nsurface_get_format=(id):\nsurface_set_target=(id)\nsurface_set_target_ext=(index:int, surf):bool\nsurface_get_target=():\nsurface_get_target_ext=(index):\nsurface_reset_target=()\nsurface_depth_disable=(disable)\nsurface_get_depth_disable=():\nsurface_format_is_supported=(format):\ndraw_surface=(id,x,y)\ndraw_surface_stretched=(id,x,y,w,h)\ndraw_surface_tiled=(id,x,y)\ndraw_surface_part=(id,left,top,width,height,x,y)\ndraw_surface_ext=(id,x,y,xscale,yscale,rot,col,alpha)\ndraw_surface_stretched_ext=(id,x,y,w,h,col,alpha)\ndraw_surface_tiled_ext=(id,x,y,xscale,yscale,col,alpha)\ndraw_surface_part_ext=(id,left,top,width,height,x,y,xscale,yscale,col,alpha)\ndraw_surface_general=(id,left,top,width,height,x,y,xscale,yscale,rot,c1,c2,c3,c4,alpha)\nsurface_getpixel=(id,x,y):\nsurface_getpixel_ext=(id,x,y):\nsurface_save=(id,fname)\nsurface_save_part=(id,fname,x,y,w,h)\nsurface_copy=(destination,x,y,source)\nsurface_copy_part=(destination,x,y,source,xs,ys,ws,hs)\napplication_surface_draw_enable=(on_off)\napplication_get_position=():\napplication_surface_enable=(enable)\napplication_surface_is_enabled=():\nvideo_open=(path)\nvideo_close=()\nvideo_set_volume=(vol)\nvideo_draw=()\nvideo_pause=()\nvideo_resume=()\nvideo_enable_loop=(enable)\nvideo_seek_to=(milliseconds)\nvideo_get_duration=():\nvideo_get_position=():\nvideo_get_status=():\nvideo_get_format=():\nvideo_is_looping=():\nvideo_get_volume=():\ndisplay_get_width=():\ndisplay_get_height=():\ndisplay_get_orientation=():\ndisplay_get_gui_width=():\ndisplay_get_gui_height=():\ndisplay_get_frequency=():\ndisplay_reset=(aa, vsync):\ndisplay_mouse_get_x=():\ndisplay_mouse_get_y=():\ndisplay_mouse_set=(x,y)\ndisplay_set_ui_visibility=(flags)\nwindow_set_showborder=(show)\nwindow_get_showborder=():\nwindow_set_fullscreen=(full)\nwindow_get_fullscreen=():\nwindow_set_caption=(caption)\nwindow_set_min_width=(minwidth)\nwindow_set_max_width=(maxwidth)\nwindow_set_min_height=(minheight)\nwindow_set_max_height=(maxheight)\nwindow_get_visible_rects=(startx,starty,endx,endy):\nwindow_get_caption=():\nwindow_set_cursor=(curs)\nwindow_enable_borderless_fullscreen=(enable)\nwindow_get_borderless_fullscreen=():\nwindow_get_cursor=():\nwindow_set_colour=(colour)£\nwindow_get_colour=()£:\nwindow_set_color=(color)$\nwindow_get_color=()$:\nwindow_set_position=(x,y)\nwindow_set_size=(w,h)\nwindow_set_rectangle=(x,y,w,h)\nwindow_center=()\nwindow_get_x=():\nwindow_get_y=():\nwindow_get_width=():\nwindow_get_height=():\nwindow_mouse_get_x=():\nwindow_mouse_get_y=():\nwindow_mouse_set=(x,y)\nwindow_mouse_set_locked=(enable)\nwindow_mouse_get_locked=():\nwindow_mouse_get_delta_x=():\nwindow_mouse_get_delta_y=():\nwindow_view_mouse_get_x=(id):\nwindow_view_mouse_get_y=(id):\nwindow_views_mouse_get_x=():\nwindow_views_mouse_get_y=():\naudio_listener_position=(x,y,z)\naudio_listener_velocity=(vx,vy,vz)\naudio_listener_orientation=(lookat_x,lookat_y,lookat_z,up_x,up_y,up_z)\naudio_emitter_position=(emitterid,x,y,z)\naudio_emitter_create=():\naudio_emitter_free=(emitterid)\naudio_emitter_exists=(emitterid):\naudio_emitter_pitch=(emitterid,pitch)\naudio_emitter_velocity=(emitterid,vx,vy,vz)\naudio_emitter_falloff=(emitterid, falloff_ref_dist,falloff_max_dist,falloff_factor)\naudio_emitter_gain=(emitterid,gain)\naudio_play_sound=(soundid:index,priority:number,loops:bool):\naudio_play_sound_on=(em:index,soundid:index,priority:number,loops:bool):\naudio_play_sound_at=(soundid:index,x:number,y:number,z:number, falloff_ref_dist:number,falloff_max_dist:number,falloff_factor:number,loops:bool, priority:number):\naudio_play_sound_ext=(params)\naudio_stop_sound=(soundid)\naudio_resume_sound=(soundid)\naudio_pause_sound=(soundid)\naudio_channel_num=(numchannels)\naudio_sound_length=(sound:index):\naudio_get_type=(soundid):\naudio_falloff_set_model=(falloffmode)\naudio_master_gain=(gain)\naudio_sound_gain=(index,level,time)\naudio_sound_pitch=(index,pitch)\naudio_stop_all=()\naudio_resume_all=()\naudio_pause_all=()\naudio_is_playing=(soundid):\naudio_is_paused=(soundid):\naudio_exists=(soundid):\naudio_system_is_available=():\naudio_system_is_initialised=():\naudio_sound_is_playable=(soundid):\naudio_emitter_get_gain=(emitterid):\naudio_emitter_get_pitch=(emitterid):\naudio_emitter_get_x=(emitterid):\naudio_emitter_get_y=(emitterid):\naudio_emitter_get_z=(emitterid):\naudio_emitter_get_vx=(emitterid):\naudio_emitter_get_vy=(emitterid):\naudio_emitter_get_vz=(emitterid):\naudio_listener_set_position=(index, x,y,z)\naudio_listener_set_velocity=(index, vx,vy,vz)\naudio_listener_set_orientation=(index, lookat_x,lookat_y,lookat_z,up_x,up_y,up_z)\naudio_listener_get_data=(index):\naudio_set_master_gain=(listenerIndex, gain)\naudio_get_master_gain=(listenerIndex):\naudio_sound_get_gain=(index):\naudio_sound_get_pitch=(index):\naudio_get_name=(index):\naudio_sound_set_track_position=(index, time)\naudio_sound_get_track_position=(index):\naudio_sound_loop=(voiceIndex, loopState)\naudio_sound_get_loop=(voiceIndex):\naudio_sound_loop_start=(index, time)\naudio_sound_get_loop_start=(index):\naudio_sound_loop_end=(index, time)\naudio_sound_get_loop_end=(index):\naudio_create_stream=(filename)!:\naudio_destroy_stream=(stream_sound_id)!\naudio_create_sync_group=(looping):\naudio_destroy_sync_group=(sync_group_id)\naudio_play_in_sync_group=(sync:index, snd:index):\naudio_start_sync_group=(sync_group_id)\naudio_stop_sync_group=(sync_group_id)\naudio_pause_sync_group=(sync_group_id)\naudio_resume_sync_group=(sync_group_id)\naudio_sync_group_get_track_pos=(sync_group_id):\naudio_sync_group_debug=(sync_group_id)\naudio_sync_group_is_playing=(sync_group_id):\naudio_sync_group_is_paused=(sync_group_id):\naudio_debug=(enable)\naudio_group_load=(groupId):\naudio_group_unload=(ind:int):bool\naudio_group_is_loaded=(groupId):\naudio_group_load_progress=(groupId):\naudio_group_name=(group:index):\naudio_group_stop_all=(groupId)\naudio_group_set_gain=(groupId, volume, time)\naudio_group_get_gain=(groupId):\naudio_group_get_assets=(groupId):\naudio_sound_get_audio_group=(index):\naudio_create_buffer_sound=(bufferId, format, rate, offset, length, channels)!:\naudio_free_buffer_sound=(soundId)!\naudio_create_play_queue=(bufferFormat, sampleRate, channels)!:\naudio_free_play_queue=(queueId)!\naudio_queue_sound=(queueId, buffer_id, offset, length)!\naudio_get_recorder_count=():\naudio_get_recorder_info=(recorder_num):\naudio_start_recording=(rec:number):\naudio_stop_recording=(channel_index)\naudio_sound_get_listener_mask=(soundid):\naudio_emitter_get_listener_mask=(emitterid):\naudio_get_listener_mask=():\naudio_sound_set_listener_mask=(soundid,mask)\naudio_emitter_set_listener_mask=(emitterid,mask)\naudio_set_listener_mask=(mask)\naudio_get_listener_count=():\naudio_get_listener_info=(index):\nshow_message=(str)\nshow_message_async=(:string):int\nclickable_add=(x,y,spritetpe,URL,target,params):\nclickable_add_ext=(x,y,spritetpe,URL,target,params,scale,alpha):\nclickable_change=(buttonid,spritetpe,x,y)\nclickable_change_ext=(buttonid,spritetpe,x,y,scale,alpha)\nclickable_delete=(buttonid)\nclickable_exists=(index):\nclickable_set_style=(buttonid,map)\nshow_question=(str:string):\nshow_question_async=(:string):\nget_integer=(:string,:number):\nget_string=(:string,:string):\nget_integer_async=(:string,:number):\nget_string_async=(:string,:string):\nget_login_async=(:string,:string):\nget_open_filename=(:string,:string):\nget_save_filename=(:string,:string):\nget_open_filename_ext=(:string,:string,:string,:string):\nget_save_filename_ext=(:string,:string,:string,:string):\nshow_error=(str,abort)\nhighscore_clear=()\nhighscore_add=(str,numb)\nhighscore_value=(:index):\nhighscore_name=(:index):\ndraw_highscore=(x1,y1,x2,y2)\nsprite_exists=(ind):\nsprite_get_name=(ind):\nsprite_get_number=(ind):\nsprite_get_width=(ind):\nsprite_get_height=(ind):\nsprite_get_xoffset=(ind):\nsprite_get_yoffset=(ind):\nsprite_get_bbox_mode=(ind):\nsprite_get_bbox_left=(ind):\nsprite_get_bbox_right=(ind):\nsprite_get_bbox_top=(ind):\nsprite_get_bbox_bottom=(ind):\nsprite_set_bbox_mode=(ind,mode)\nsprite_set_bbox=(ind,left,top,right,bottom)\nsprite_save=(ind,subimg,fname)\nsprite_save_strip=(ind,fname)\nsprite_set_cache_size=(ind, max)\nsprite_set_cache_size_ext=(ind, image, max)\nsprite_get_tpe=(index,subindex):\nsprite_prefetch=(ind)\nsprite_prefetch_multi=(indarray)\nsprite_flush=(ind)\nsprite_flush_multi=(indarray)\nsprite_set_speed=(ind,speed,type)\nsprite_get_speed_type=(ind):\nsprite_get_speed=(ind):\nsprite_get_info=(ind):\nsprite_get_nineslice=(ind):\nsprite_set_nineslice=(ind,nineslice)\nsprite_nineslice_create=():\ntexture_is_ready=(tex_id):\ntexture_prefetch=(tex_id_or_groupname)\ntexture_flush=(tex_id_or_groupname)\ntexturegroup_get_textures=(groupname):\ntexturegroup_get_sprites=(groupname):\ntexturegroup_get_fonts=(groupname):\ntexturegroup_get_tilesets=(groupname):\ntexturegroup_get_names=():\ntexturegroup_load=(groupname,[prefetch]):\ntexturegroup_unload=(groupname)\ntexturegroup_get_status=(groupname):\ntexturegroup_set_mode=(explicit,debug,default_sprite)\ntexture_debug_messages=(debug_level)\nfont_exists=(ind):\nfont_get_name=(ind):\nfont_get_fontname=(ind):\nfont_get_bold=(ind):\nfont_get_italic=(ind):\nfont_get_first=(ind):\nfont_get_last=(ind):\nfont_get_size=(ind):\nfont_set_cache_size=(font,max)\npath_exists=(ind):\npath_get_name=(ind):\npath_get_length=(ind):\npath_get_kind=(ind):\npath_get_closed=(ind):\npath_get_precision=(ind):\npath_get_number=(ind):\npath_get_point_x=(ind,n):\npath_get_point_y=(ind,n):\npath_get_point_speed=(ind,n):\npath_get_x=(ind,pos):\npath_get_y=(ind,pos):\npath_get_speed=(ind,pos):\nscript_exists=(ind):\nscript_get_name=(:id):string;\ntimeline_add=()!:\ntimeline_delete=(ind)!\ntimeline_clear=(ind)\ntimeline_exists=(ind):\ntimeline_get_name=(ind):\ntimeline_moment_clear=(ind,step)\ntimeline_moment_add_script=(ind,step,script)\ntimeline_size=(ind):\ntimeline_max_moment=(:index):\nobject_exists=(ind):\nobject_get_name=(o:id):string\nobject_get_sprite=(ind):\nobject_get_solid=(ind):\nobject_get_visible=(ind):\nobject_get_persistent=(ind):\nobject_get_mask=(ind):\nobject_get_parent=(ind):\nobject_get_physics=(ind):\nobject_is_ancestor=(ind_child,ind_parent):\nroom_exists=(ind):\nroom_get_name=(ind):\nroom_get_info=(ind,[views],[instances],[layers],[layer_elements],[tilemap_data]):\nsprite_set_offset=(ind,xoff,yoff)\nsprite_duplicate=(:index):\nsprite_assign=(ind,source)\nsprite_merge=(ind1,ind2)\nsprite_add=(fname:string,imgnumb:int,removeback:bool,smooth:bool,xorig:number,yorig:number)!:\nsprite_add_ext=(fname,imgnumb,xorig,yorig,prefetch)!\nsprite_replace=(ind,fname,imgnumb,removeback,smooth,xorig,yorig)!\nsprite_create_from_surface=(:index,x:number,y:number,w:number,h:number,removeback:bool,smooth:bool,xorig:number,yorig:number)!:\nsprite_add_from_surface=(ind:index,id:index,x:number,y:number,w:number,h:number,removeback:bool,smooth:bool)!:\nsprite_delete=(ind)!\nsprite_set_alpha_from_sprite=(ind,spr)\nsprite_collision_mask=(ind,sepmasks,bboxmode,bbleft,bbtop,bbright,bbbottom,kind,tolerance)\nfont_add_enable_aa=(enable)\nfont_add_get_enable_aa=():\nfont_add=(:string,:number,:bool,:bool,:int,:int)!:\nfont_add_sprite=(spr:index,first:int,prop:bool,sep:number)!:\nfont_add_sprite_ext=(spr:index,:string,:bool,:number)!:\nfont_replace_sprite=(ind,spr,first,prop,sep)!\nfont_replace_sprite_ext=(font,spr,string_map,prop,sep)!\nfont_delete=(ind)!\nfont_enable_sdf=(ind,enable)!\nfont_get_sdf_enabled=(ind)!:\nfont_sdf_spread=(ind,spread)!\nfont_get_sdf_spread=(ind)!:\nfont_enable_effects=(ind,enable, [params])!\npath_set_kind=(ind,kind)\npath_set_closed=(ind,closed)\npath_set_precision=(ind,prec)\npath_add=()!:\npath_assign=(ind,path)\npath_duplicate=(:index)!:\npath_append=(ind,path)\npath_delete=(ind)\npath_add_point=(ind,x,y,speed)\npath_insert_point=(ind,n,x,y,speed)\npath_change_point=(ind,n,x,y,speed)\npath_delete_point=(ind,n)!\npath_clear_points=(ind)\npath_reverse=(ind)\npath_mirror=(ind)\npath_flip=(ind)\npath_rotate=(ind,angle)\npath_rescale=(ind,xscale,yscale)\npath_shift=(ind,xshift,yshift)\nobject_set_sprite=(ind,spr)\nobject_set_solid=(ind,solid)\nobject_set_visible=(ind,vis)\nobject_set_persistent=(ind,pers)\nobject_set_mask=(ind,spr)\nroom_set_width=(ind,w)\nroom_set_height=(ind,h)\nroom_set_persistent=(ind,pers)\nroom_set_viewport=(ind,vind,vis,xport,yport,wport,hport)\nroom_get_viewport=(ind,vind):\nroom_set_view_enabled=(ind,val)\nroom_add=()!:\nroom_duplicate=(:index)!:\nroom_assign=(ind,source)\nroom_instance_add=(:index,:number,:number,:index):\nroom_instance_clear=(ind)\nroom_get_camera=(ind,vind):\nroom_set_camera=(ind,vind,camera)\nasset_get_index=(name):\nasset_get_type=(name):\nasset_get_ids=(asset_type):\nfile_text_open_from_string=(:string):\nfile_text_open_read=(fname):\nfile_text_open_write=(:string):\nfile_text_open_append=(:string):\nfile_text_close=(file)\nfile_text_write_string=(file,str)\nfile_text_write_real=(file,val)\nfile_text_writeln=(file)\nfile_text_read_string=(file):\nfile_text_read_real=(file):\nfile_text_readln=(file):\nfile_text_eof=(:index):\nfile_text_eoln=(:index):\nfile_exists=(fname):\nfile_delete=(:string):bool\nfile_rename=(:string, :string):bool\nfile_copy=(fname,newname)\ndirectory_exists=(dname):\ndirectory_create=(dname):\ndirectory_destroy=(dname)\nfile_find_first=(mask,attr):\nfile_find_next=():\nfile_find_close=():\nfile_attributes=(:string,:int):\nfilename_name=(:string):\nfilename_path=(:string):\nfilename_dir=(:string):\nfilename_drive=(:string):\nfilename_ext=(:string):\nfilename_change_ext=(:string,:string):\nfile_bin_open=(:string,mode):\nfile_bin_rewrite=(file)\nfile_bin_close=(file)\nfile_bin_position=(:index):\nfile_bin_size=(file):\nfile_bin_seek=(file,pos)\nfile_bin_write_byte=(file,byte)\nfile_bin_read_byte=(file):\nparameter_count=():\nparameter_string=(:index):\nenvironment_get_variable=(name):\nini_open_from_string=(content)\nini_open=(fname)\nini_close=():\nini_read_string=(section,key,default):\nini_read_real=(section,key,default):\nini_write_string=(section,key,str)\nini_write_real=(section,key,value)\nini_key_exists=(section,key):\nini_section_exists=(section):\nini_key_delete=(section,key)\nini_section_delete=(section)\nds_set_precision=(prec)\nds_exists=(id, type):\nds_stack_create=():index\nds_stack_destroy=(id)\nds_stack_clear=(id)\nds_stack_copy=(id,source)\nds_stack_size=(id):\nds_stack_empty=(:index):bool\nds_stack_push=(id,value,...)\nds_stack_pop=(:index):\nds_stack_top=(:index):\nds_stack_write=(:index):\nds_stack_read=(:index,:string,?legacy):\nds_queue_create=():\nds_queue_destroy=(id)\nds_queue_clear=(id)\nds_queue_copy=(id,source)\nds_queue_size=(id):\nds_queue_empty=(:index):\nds_queue_enqueue=(id,value,...)\nds_queue_dequeue=(:index):\nds_queue_head=(:index):\nds_queue_tail=(:index):\nds_queue_write=(:index):\nds_queue_read=(:index,:string,?legacy):\nds_list_create=():id\nds_list_destroy=(:id)\nds_list_clear=(:id)\nds_list_copy=(:id,source:id)\nds_list_size=(:id):int\nds_list_empty=(:id):bool\nds_list_add=(:id,...:any)\nds_list_insert=(:id,pos:int,value:any)\nds_list_replace=(:id,pos:int,value:any)\nds_list_delete=(:id,pos:int)\nds_list_find_index=(:id,value:any):int\nds_list_find_value=(:id,pos:int):any\nds_list_is_map=(id,pos):\nds_list_is_list=(id,pos):\nds_list_mark_as_list=(:index, :index)\nds_list_mark_as_map=(:index, :index)\nds_list_sort=(:id,ascending:bool)\nds_list_shuffle=(:id)\nds_list_write=(:id):string\nds_list_read=(:id,:string,?legacy:bool):\nds_list_set=(:id,pos:int,value:any)\nds_map_create=():index\nds_map_destroy=(:index)\nds_map_clear=(:index)\nds_map_copy=(:index,:index)\nds_map_size=(:index):int\nds_map_empty=(:index):bool\nds_map_add=(:index,:any,:any)\nds_map_add_list=(:index,:any,value)\nds_map_add_map=(:index,:any,value)\nds_map_replace=(:index,:any,value)\nds_map_replace_map=(:index,:any,value)\nds_map_replace_list=(:index,:any,value)\nds_map_delete=(:index,:any)\nds_map_exists=(:index,:any):bool\nds_map_values_to_array=(id,?$1,...)\nds_map_keys_to_array=(id,?$1,...)\nds_map_find_value=(:index,:any):any\nds_map_is_map=(id,key):\nds_map_is_list=(id,key):\nds_map_find_previous=(:index,:any):any\nds_map_find_next=(:index,:any):any\nds_map_find_first=(:index):any\nds_map_find_last=(:index):any\nds_map_write=(:index):string\nds_map_read=(:index,:string,?legacy:bool):\nds_map_secure_save=(:index, path:string)\nds_map_secure_load=(path:string):index\nds_map_secure_load_buffer=(:id):index\nds_map_secure_save_buffer=(:index,:id)\nds_map_set=(:index,:any,:any)\nds_priority_create=():\nds_priority_destroy=(id)\nds_priority_clear=(id)\nds_priority_copy=(id,source)\nds_priority_size=(id):\nds_priority_empty=(:index):\nds_priority_add=(id,value,priority)\nds_priority_change_priority=(id,value,priority)\nds_priority_find_priority=(id,value):\nds_priority_delete_value=(id,value)\nds_priority_delete_min=(:index):\nds_priority_find_min=(:index):\nds_priority_delete_max=(:index):\nds_priority_find_max=(:index):\nds_priority_write=(:index):\nds_priority_read=(:index,:string,?legacy):\nds_grid_create=(w,h):\nds_grid_destroy=(id)\nds_grid_copy=(id,source)\nds_grid_resize=(id,w,h)\nds_grid_width=(:index):\nds_grid_height=(:index):\nds_grid_clear=(id,val)\nds_grid_add=(id,x,y,val)\nds_grid_multiply=(id,x,y,val)\nds_grid_set_region=(id,x1,y1,x2,y2,val)\nds_grid_add_region=(id,x1,y1,x2,y2,val)\nds_grid_multiply_region=(id,x1,y1,x2,y2,val)\nds_grid_set_disk=(id,xm,ym,r,val)\nds_grid_add_disk=(id,xm,ym,r,val)\nds_grid_multiply_disk=(id,xm,ym,r,val)\nds_grid_set_grid_region=(id,source,x1,y1,x2,y2,xpos,ypos)\nds_grid_add_grid_region=(id,source,x1,y1,x2,y2,xpos,ypos)\nds_grid_multiply_grid_region=(id,source,x1,y1,x2,y2,xpos,ypos)\nds_grid_get_sum=(id,x1,y1,x2,y2):\nds_grid_get_max=(id,x1,y1,x2,y2):\nds_grid_get_min=(id,x1,y1,x2,y2):\nds_grid_get_mean=(id,x1,y1,x2,y2):\nds_grid_get_disk_sum=(id,xm,ym,r):\nds_grid_get_disk_min=(id,xm,ym,r):\nds_grid_get_disk_max=(id,xm,ym,r):\nds_grid_get_disk_mean=(id,xm,ym,r):\nds_grid_value_exists=(id,x1,y1,x2,y2,val):\nds_grid_value_x=(:index,x1:number,y1:number,x2:number,y2:number,val):\nds_grid_value_y=(:index,x1:number,y1:number,x2:number,y2:number,val):\nds_grid_value_disk_exists=(id,xm,ym,r,val):\nds_grid_value_disk_x=(:index,xm:number,ym:number,r:number,val):\nds_grid_value_disk_y=(:index,xm:number,ym:number,r:number,val):\nds_grid_shuffle=(id)\nds_grid_write=(:index):\nds_grid_read=(:index,:string,?legacy):\nds_grid_sort=(id,column,ascending)\nds_grid_set=(id,x,y,value)\nds_grid_get=(id,x,y):\nds_grid_to_mp_grid=(src,dest,[func])\neffect_create_below=(kind,x,y,size,col):\neffect_create_above=(kind,x,y,size,col):\neffect_create_layer=(layer_id_or_name,kind,x,y,size,col):\neffect_create_depth=(depth,kind,x,y,size,col):\neffect_clear=()\npart_type_create=():\npart_type_destroy=(ind)\npart_type_exists=(ind):\npart_type_clear=(ind)\npart_type_shape=(ind,shape)\npart_type_sprite=(ind,sprite,animat,stretch,random)\npart_type_subimage=(ind,subimg)\npart_type_size=(ind,size_min,size_max,size_incr,size_wiggle):\npart_type_size_x=(ind,size_min_x,size_max_x,size_incr_x,size_wiggle_y):\npart_type_size_y=(ind,size_min_y,size_max_y,size_incr_y,size_wiggle_y):\npart_type_scale=(ind,xscale,yscale)\npart_type_orientation=(ind,ang_min,ang_max,ang_incr,ang_wiggle,ang_relative)\npart_type_life=(ind,life_min,life_max)\npart_type_step=(ind,step_number,step_type)\npart_type_death=(ind,death_number,death_type)\npart_type_speed=(ind,speed_min,speed_max,speed_incr,speed_wiggle)\npart_type_direction=(ind,dir_min,dir_max,dir_incr,dir_wiggle)\npart_type_gravity=(ind,grav_amount,grav_dir)\npart_type_colour1=(ind,colour1)£\npart_type_colour2=(ind,colour1,colour2)£\npart_type_colour3=(ind,colour1,colour2,colour3)£\npart_type_colour_mix=(ind,colour1,colour2)£\npart_type_colour_rgb=(ind,rmin,rmax,gmin,gmax,bmin,bmax)£\npart_type_colour_hsv=(ind,hmin,hmax,smin,smax,vmin,vmax)£\npart_type_color1=(ind,color1)$\npart_type_color2=(ind,color1,color2)$\npart_type_color3=(ind,color1,color2,color3)$\npart_type_color_mix=(ind,color1,color2)$\npart_type_color_rgb=(ind,rmin,rmax,gmin,gmax,bmin,bmax)$\npart_type_color_hsv=(ind,hmin,hmax,smin,smax,vmin,vmax)$\npart_type_alpha1=(ind,alpha1)\npart_type_alpha2=(ind,alpha1,alpha2)\npart_type_alpha3=(ind,alpha1,alpha2,alpha3)\npart_type_blend=(ind,additive)\nparticle_get_info=(ind):\nparticle_exists=(ind):\npart_system_create=([partsys]):\npart_system_create_layer=(layer,persistent,[partsys]):\npart_system_destroy=(ind)\npart_system_exists=(ind):\npart_system_clear=(ind)\npart_system_draw_order=(ind,oldtonew)\npart_system_depth=(ind,depth)\npart_system_color=(ind,color,alpha)$\npart_system_colour=(ind,colour,alpha)£\npart_system_position=(ind,x,y)\npart_system_angle=(ind,angle)\npart_system_automatic_update=(ind,automatic)\npart_system_automatic_draw=(ind,draw)\npart_system_update=(ind)\npart_system_drawit=(ind)\npart_system_get_layer=(ind):\npart_system_layer=(ind,layer)\npart_system_global_space=(ind,enable)\npart_system_get_info=(ind):\npart_particles_create=(ind,x,y,parttype,number):\npart_particles_create_colour=(ind,x,y,parttype,colour,number)£:\npart_particles_create_color=(ind,x,y,parttype,color,number)$:\npart_particles_burst=(ind,x,y,partsys)\npart_particles_clear=(ind)\npart_particles_count=(ind)\npart_emitter_create=(ps):\npart_emitter_destroy=(ps,ind)\npart_emitter_destroy_all=(ps)\npart_emitter_enable=(ps,ind,enable)\npart_emitter_exists=(ps,ind):\npart_emitter_clear=(ps,ind)\npart_emitter_region=(ps,ind,xmin,xmax,ymin,ymax,shape,distribution)\npart_emitter_burst=(ps,ind,parttype,number)\npart_emitter_stream=(ps,ind,parttype,number)\npart_emitter_delay=(ps,ind,delay_min,delay_max,delay_unit)\npart_emitter_interval=(ps,ind,interval_min,interval_max,inerval_unit)\npart_emitter_relative=(ps,ind,enable)\nwindow_handle=():\nwindow_device=():\nmatrix_get=(type):\nmatrix_set=(type,matrix)\nmatrix_build_identity=():\nmatrix_build=(x,y,z,xrotation,yrotation,zrotation,xscale,yscale,zscale):\nmatrix_build_lookat=(xfrom,yfrom,zfrom,xto,yto,zto,xup,yup,zup):\nmatrix_build_projection_ortho=(width,height,znear,zfar):\nmatrix_build_projection_perspective=(width,height,znear,zfar):\nmatrix_build_projection_perspective_fov=(fov_y,aspect,znear,zfar):\nmatrix_multiply=(a, b):\nmatrix_transform_vertex=(matrix, x, y, z):\nmatrix_stack_push=(...)\nmatrix_stack_pop=():\nmatrix_stack_set=(matrix)\nmatrix_stack_clear=()\nmatrix_stack_top=():\nmatrix_stack_is_empty=():\nbrowser_input_capture=(enable)\nos_get_config=():\nos_get_info=():\nos_get_language=():\nos_get_region=():\nos_check_permission=(perm):\nos_request_permission=(perm):\nos_lock_orientation=(flag)\nos_set_orientation_lock=(landscape_enable,portrait_enable)\ndisplay_get_dpi_x=():\ndisplay_get_dpi_y=():\ndisplay_set_gui_size=(width,height)\ndisplay_set_gui_maximise=(xscale,yscale,xoffset,yoffset,...)£\ndisplay_set_gui_maximize=(xscale,yscale,xoffset,yoffset,...)$\ndevice_mouse_dbclick_enable=(enable)\ndisplay_set_timing_method=(method)\ndisplay_get_timing_method=():\ndisplay_set_sleep_margin=(milliseconds)\ndisplay_get_sleep_margin=():\nvirtual_key_add=(x,y,w,h,keycode)\nvirtual_key_hide=(id)\nvirtual_key_delete=(id)\nvirtual_key_show=(id)\ndraw_enable_drawevent=(enable)\ndraw_texture_flush=()\ndraw_flush=()\ngpu_set_blendenable=(enable)\ngpu_set_ztestenable=(enable)\ngpu_set_zfunc=(cmp_func)\ngpu_set_zwriteenable=(enable)\ngpu_set_depth=(depth)\ngpu_set_fog=(data_or_enable,?color,?start,?end)\ngpu_set_cullmode=(cullmode)\ngpu_set_blendmode=(mode)\ngpu_set_blendmode_ext=(src,dest)\ngpu_set_blendmode_ext_sepalpha=(src,dest,srcalpha,destalpha)\ngpu_set_blendequation=(equation)\ngpu_set_blendequation_sepalpha=(equation, equation_alpha)\ngpu_set_colorwriteenable=(red_or_array,?$1,?$1,?$1,...)$\ngpu_set_colourwriteenable=(red_or_arry,?$1,?$1,?$1,...)£\ngpu_set_alphatestenable=(enable)\ngpu_set_alphatestref=(value)\ngpu_set_texfilter=(linear)\ngpu_set_texfilter_ext=(sampler_id,linear)\ngpu_set_texrepeat=(repeat)\ngpu_set_texrepeat_ext=(sampler_id,repeat)\ngpu_set_tex_filter=(linear)\ngpu_set_tex_filter_ext=(sampler_id,linear)\ngpu_set_tex_repeat=(repeat)\ngpu_set_tex_repeat_ext=(sampler_id,repeat)\ngpu_set_tex_mip_filter=(filter)\ngpu_set_tex_mip_filter_ext=(sampler_id,filter)\ngpu_set_tex_mip_bias=(bias)\ngpu_set_tex_mip_bias_ext=(sampler_id,bias)\ngpu_set_tex_min_mip=(minmip)\ngpu_set_tex_min_mip_ext=(sampler_id,minmip)\ngpu_set_tex_max_mip=(maxmip)\ngpu_set_tex_max_mip_ext=(sampler_id,maxmip)\ngpu_set_tex_max_aniso=(maxaniso)\ngpu_set_tex_max_aniso_ext=(sampler_id,maxaniso)\ngpu_set_tex_mip_enable=(setting)\ngpu_set_tex_mip_enable_ext=(sampler_id,setting)\ngpu_get_blendenable=():\ngpu_get_ztestenable=():\ngpu_get_zfunc=():\ngpu_get_zwriteenable=():\ngpu_get_depth=():\ngpu_get_fog=():\ngpu_get_cullmode=():\ngpu_get_blendmode=():\ngpu_get_blendmode_ext=():\ngpu_get_blendmode_ext_sepalpha=():\ngpu_get_blendmode_src=():\ngpu_get_blendmode_dest=():\ngpu_get_blendmode_srcalpha=():\ngpu_get_blendmode_destalpha=():\ngpu_get_blendequation=():\ngpu_get_blendequation_sepalpha=():\ngpu_get_colorwriteenable=()$:\ngpu_get_colourwriteenable=()£:\ngpu_get_alphatestenable=():\ngpu_get_alphatestref=():\ngpu_get_texfilter=():\ngpu_get_texfilter_ext=(sampler_id):\ngpu_get_texrepeat=():\ngpu_get_texrepeat_ext=(sampler_id):\ngpu_get_tex_filter=():\ngpu_get_tex_filter_ext=(sampler_id):\ngpu_get_tex_repeat=():\ngpu_get_tex_repeat_ext=(sampler_id):\ngpu_get_tex_mip_filter=():\ngpu_get_tex_mip_filter_ext=(sampler_id):\ngpu_get_tex_mip_bias=():\ngpu_get_tex_mip_bias_ext=(sampler_id):\ngpu_get_tex_min_mip=():\ngpu_get_tex_min_mip_ext=(sampler_id):\ngpu_get_tex_max_mip=():\ngpu_get_tex_max_mip_ext=(sampler_id):\ngpu_get_tex_max_aniso=():\ngpu_get_tex_max_aniso_ext=(sampler_id):\ngpu_get_tex_mip_enable=():\ngpu_get_tex_mip_enable_ext=(sampler_id):\ngpu_push_state=()\ngpu_pop_state=()\ngpu_get_state=():\ngpu_set_state=(map)\ndraw_light_define_ambient=(col)\ndraw_light_define_direction=(ind,dx,dy,dz,col)\ndraw_light_define_point=(ind,x,y,z,range,col)\ndraw_light_enable=(ind,enable)\ndraw_set_lighting=(enable)\ndraw_light_get_ambient=():\ndraw_light_get=(ind):\ndraw_get_lighting=():\nshop_leave_rating=(text_string,yes_string,no_string,url)\nurl_get_domain=():\nurl_open=(url)\nurl_open_ext=(url,target)\nurl_open_full=(url,target,options)\nget_timer=():number\ndevice_get_tilt_x=():\ndevice_get_tilt_y=():\ndevice_get_tilt_z=():\ndevice_is_keypad_open=():\ndevice_mouse_check_button=(:index,:index):\ndevice_mouse_check_button_pressed=(:index,:index):\ndevice_mouse_check_button_released=(:index,:index):\ndevice_mouse_x=(:index):\ndevice_mouse_y=(:index):\ndevice_mouse_raw_x=(:index):\ndevice_mouse_raw_y=(:index):\ndevice_mouse_x_to_gui=(:index):\ndevice_mouse_y_to_gui=(:index):\ngamepad_is_supported=():\ngamepad_get_device_count=():\ngamepad_is_connected=(device):\ngamepad_get_description=(device):\ngamepad_get_button_threshold=(device):\ngamepad_set_button_threshold=(device, threshold)\ngamepad_get_axis_deadzone=(device):\ngamepad_set_axis_deadzone=(device, deadzone)\ngamepad_button_count=(device:index):\ngamepad_button_check=(device:index, buttonIndex:index):\ngamepad_button_check_pressed=(device:index, buttonIndex:index):\ngamepad_button_check_released=(device:index, buttonIndex:index):\ngamepad_button_value=(device:index, buttonIndex:index):\ngamepad_axis_count=(axis:index):\ngamepad_axis_value=(device:index, axisIndex:index):\ngamepad_set_vibration=(device, leftMotorSpeed, rightMotorSpeed)\ngamepad_set_colour=(index,colour)£\ngamepad_set_color=(index,color)$\ngamepad_hat_count=(axis)\ngamepad_hat_value=(device, axisIndex)\ngamepad_remove_mapping=(device)\ngamepad_test_mapping=(device, mapping_string)\ngamepad_get_mapping=(device):\ngamepad_get_guid=(device):\ngamepad_set_option=(gamepad_id, option_key, option_value)\ngamepad_get_option=(gamepad_id, option_key):\ngamepad_enumerate=()\nos_is_paused=():\nwindow_has_focus=():\ncode_is_compiled=():\nhttp_get=(url):\nhttp_get_file=(url, dest):\nhttp_post_string=(:string,:string):\nhttp_request=(url:string, method, header_map, body):\nhttp_get_request_crossorigin=():\nhttp_set_request_crossorigin=(crossorigin_type)\njson_encode=(:id):string\njson_decode=(:string):id\njson_stringify=(val, [prettify], [filter_func])\njson_parse=(json, [filter_func], [inhibit_string_convert])\nzip_unzip=(zip:string, path:string):int\nzip_unzip_async=(file, destPath)\nzip_create=():\nzip_add_file=(zip_object, dest, src)\nzip_save=(zip_object, path)\nload_csv=(:string):array2d\nbase64_encode=(:string):string\nbase64_decode=(:string):string\nmd5_string_unicode=(:string):string\nmd5_string_utf8=(:string):string\nmd5_file=(:string):string\nos_is_network_connected=(attempt_connection,...):\nsha1_string_unicode=(:string):string\nsha1_string_utf8=(:string):string\nsha1_file=(:string):string\nos_powersave_enable=(enable)\nphysics_world_create=(PixelToMetreScale):\nphysics_world_gravity=(gx, gy)\nphysics_world_update_speed=(speed)\nphysics_world_update_iterations=(iterations)\nphysics_world_draw_debug=(draw_flags)\nphysics_pause_enable=(pause)\nphysics_fixture_create=():\nphysics_fixture_set_kinematic=(fixture)\nphysics_fixture_set_density=(fixture, density)\nphysics_fixture_set_awake=(fixture, flag)\nphysics_fixture_set_restitution=(fixture, restitution)\nphysics_fixture_set_friction=(fixture,friction)\nphysics_fixture_set_collision_group=(fixture, group)\nphysics_fixture_set_sensor=(fixture, sensorState)\nphysics_fixture_set_linear_damping=(fixture, damping)\nphysics_fixture_set_angular_damping=(fixture, damping)\nphysics_fixture_set_circle_shape=(fixture, circleRadius)\nphysics_fixture_set_box_shape=(fixture, halfWidth, halfHeight)\nphysics_fixture_set_edge_shape=(fixture, x1,y1,x2,y2)\nphysics_fixture_set_polygon_shape=(fixture)\nphysics_fixture_set_chain_shape=(fixture, loop)\nphysics_fixture_add_point=(fixture, local_x, local_y)\nphysics_fixture_bind=:(fixture, target):\nphysics_fixture_bind_ext=:(fixture, target, xoffset, yoffset):\nphysics_fixture_delete=(fixture)\nphysics_apply_force=:(xpos, ypos, xforce, yforce)\nphysics_apply_impulse=:(xpos, ypos, ximpulse, yimpulse)\nphysics_apply_angular_impulse=:(impulse)\nphysics_apply_local_force=:(xlocal, ylocal, xforce_local, yforce_local)\nphysics_apply_local_impulse=:(xlocal, ylocal, ximpulse_local, yimpulse_local)\nphysics_apply_torque=:(torque)\nphysics_mass_properties=:(mass, local_centre_of_mass_x, local_centre_of_mass_y, inertia)\nphysics_draw_debug=:()\nphysics_test_overlap=:(x:number, y:number, angle:number, obj:index):\nphysics_remove_fixture=(inst, id)\nphysics_set_friction=:(fixture, friction)\nphysics_set_density=:(fixture, density)\nphysics_set_restitution=:(fixture, restitution)\nphysics_get_friction=:(fixture):\nphysics_get_density=:(fixture):\nphysics_get_restitution=:(fixture):\nphysics_joint_distance_create=(inst1, inst2, anchor_1_x, anchor_1_y, anchor_2_x, anchor_2_y, collideInstances):\nphysics_joint_rope_create=(inst1, inst2, anchor_1_x, anchor_1_y, anchor_2_x, anchor_2_y, maxLength, collideInstances):\nphysics_joint_revolute_create=(inst1, inst2, anchor_x, anchor_y, lower_angle_limit, upper_angle_limit, enable_limit, max_motor_torque, motor_speed, enable_motor, collideInstances):\nphysics_joint_prismatic_create=(inst1, inst2, anchor_x, anchor_y, axis_x, axis_y, lower_translation_limit, upper_translation_limit, enable_limit, max_motor_force, motor_speed, enable_motor, collideInstances):\nphysics_joint_pulley_create=(inst1, inst2, anchor_1_x, anchor_1_y, anchor_2_x, anchor_2_y, local_anchor_1_x, local_anchor_1_y, local_anchor_2_x, local_anchor_2_y, ratio, collideInstances):\nphysics_joint_wheel_create=(inst1, inst2, anchor_x, anchor_y, axis_x, axis_y, enableMotor, max_motor_torque, motor_speed, freq_hz, damping_ratio, collideInstances):\nphysics_joint_weld_create=(inst1, inst2, anchor_x, anchor_y, ref_angle, freq_hz, damping_ratio, collideInstances):\nphysics_joint_friction_create=(inst1, inst2, anchor_x, anchor_y, max_force, max_torque, collideInstances):\nphysics_joint_gear_create=(inst1, inst2, revoluteJoint, prismaticJoint, ratio):\nphysics_joint_enable_motor=(joint, motorState)\nphysics_joint_get_value=(joint, field):\nphysics_joint_set_value=(joint, field, value)\nphysics_joint_delete=(joint)\nphysics_particle_create=(typeflags, x, y, xv, yv, col, alpha, category):\nphysics_particle_delete=(ind)\nphysics_particle_delete_region_circle=(x, y, radius)\nphysics_particle_delete_region_box=(x, y, halfWidth, halfHeight)\nphysics_particle_delete_region_poly=(pointList)\nphysics_particle_set_flags=(ind, typeflags)\nphysics_particle_set_category_flags=(category, typeflags)\nphysics_particle_draw=(typemask, category, sprite, subimg)\nphysics_particle_draw_ext=(typemask, category, sprite, subimg, xscale, yscale, angle, col, alpha)\nphysics_particle_count=():\nphysics_particle_get_data=(buffer, dataFlags):\nphysics_particle_get_data_particle=(ind, buffer, dataFlags):\nphysics_particle_group_begin=(typeflags, groupflags, x, y, ang, xv, yv, angVelocity, col, alpha, strength, category)\nphysics_particle_group_circle=(radius)\nphysics_particle_group_box=(halfWidth, halfHeight)\nphysics_particle_group_polygon=()\nphysics_particle_group_add_point=(x, y)\nphysics_particle_group_end=():\nphysics_particle_group_join=(to, from)\nphysics_particle_group_delete=(ind)\nphysics_particle_group_count=(group)\nphysics_particle_group_get_data=(group, buffer, dataFlags):\nphysics_particle_group_get_mass=(group):\nphysics_particle_group_get_inertia=(group):\nphysics_particle_group_get_centre_x=(group):\nphysics_particle_group_get_centre_y=(group):\nphysics_particle_group_get_vel_x=(group):\nphysics_particle_group_get_vel_y=(group):\nphysics_particle_group_get_ang_vel=(group):\nphysics_particle_group_get_x=(group):\nphysics_particle_group_get_y=(group):\nphysics_particle_group_get_angle=(group):\nphysics_particle_set_group_flags=(group, groupflags)\nphysics_particle_get_group_flags=(group):\nphysics_particle_get_max_count=():\nphysics_particle_get_radius=():\nphysics_particle_get_density=():\nphysics_particle_get_damping=():\nphysics_particle_get_gravity_scale=():\nphysics_particle_set_max_count=(count)\nphysics_particle_set_radius=(radius)\nphysics_particle_set_density=(density)\nphysics_particle_set_damping=(damping)\nphysics_particle_set_gravity_scale=(scale)\nnetwork_create_socket=(type:int):id\nnetwork_create_socket_ext=(type:int, port:int):id\nnetwork_create_server=(type:int, port:int, maxclients:int):id\nnetwork_create_server_raw=(type:int, port:int, maxclients:int):id\nnetwork_connect=(:id, url:string, port:int):int\nnetwork_connect_raw=(:id, url:string, port:int):id\nnetwork_connect_async=(:id, url:string, port:int):int\nnetwork_connect_raw_async=(:id, url:string, port:int):int\nnetwork_send_packet=(:id, :id, size:int):int\nnetwork_send_raw=(:id, :id, size:int):int\nnetwork_send_broadcast=(:id, port:int, :id, size:int):int\nnetwork_send_udp=(:id, URL:string, port:int, data:id, size:int):int\nnetwork_send_udp_raw=(:id, URL:string, port:int, data:id, size:int):int\nnetwork_set_timeout=(:id, read:number, write:number)\nnetwork_set_config=(parameter, value)\nnetwork_resolve=(url:string):string\nnetwork_destroy=(:id)\nbuffer_create=(size:int, buffer_type:int, alignment:int):id\nbuffer_write=(:id, type:int, value)\nbuffer_read=(:id, type:int):\nbuffer_seek=(:id, base:int, offset:int)\nbuffer_get_surface=(:id, :id, mode:int, offset:int, modulo:int):\nbuffer_set_surface=(:id, :id, mode:int, offset:int, modulo:int)\nbuffer_set_used_size=(buffer,size)\nbuffer_delete=(:id)\nbuffer_exists=(:id):bool\nbuffer_get_type=(:id):int\nbuffer_get_alignment=(:id):int\nbuffer_poke=(:id, offset:int, type:int, value)\nbuffer_peek=(:id, offset:int, type:int):\nbuffer_save=(:id, filename:string)\nbuffer_save_ext=(:id, filename:string, offset:int, size:int)\nbuffer_load=(filename:string):id\nbuffer_load_ext=(:id, filename:string, offset:int):\nbuffer_load_partial=(:id, filename:string, src_offset:int, src_len:int, dest_offset:int):\nbuffer_copy=(src_buffer, src_offset:int, size:int, dest:id, dest_offset:int)\nbuffer_copy_stride=(src_buffer, src_offset, src_size, src_stride, src_count, dest_buffer, dest_offset, dest_stride)\nbuffer_fill=(:id, offset:int, type:int, value, size:int)\nbuffer_get_size=(:id):int\nbuffer_tell=(:id):int\nbuffer_resize=(:id, newsize:int)\nbuffer_md5=(:id, offset:int, size:int):string\nbuffer_sha1=(:id, offset:int, size:int):string\nbuffer_crc32=(:id, offset:int, size:int):int\nbuffer_base64_encode=(:id, offset:int, size:int):string\nbuffer_base64_decode=(string):id\nbuffer_base64_decode_ext=(:id, :string, offset:int)\nbuffer_sizeof=(type:int):int\nbuffer_get_address=(:id):\nbuffer_create_from_vertex_buffer=(:id, type, alignment):\nbuffer_create_from_vertex_buffer_ext=(:id, type, alignment, start_vertex, num_vertices):\nbuffer_copy_from_vertex_buffer=(vertex_buffer, start_vertex, num_vertices, dest_buffer, dest_offset)\nbuffer_async_group_begin=(groupname)\nbuffer_async_group_option=(optionname,optionvalue)\nbuffer_async_group_end=()\nbuffer_load_async=(:id,filename:string,offset:int,size:int):\nbuffer_save_async=(:id,filename:string,offset:int,size:int):\nbuffer_compress=(:id, offset:int, size:int):id\nbuffer_decompress=(:id):id\ngml_release_mode=(enable)\nshader_set=(shader)\nshader_get_name=(shader):\nshader_reset=()\nshader_current=():\nshader_is_compiled=(shader):\nshader_get_sampler_index=(shader,uniform_name):\nshader_get_uniform=(shader,uniform_name):\nshader_set_uniform_i=(uniform_id,val,....)\nshader_set_uniform_i_array=(uniform_id,array)\nshader_set_uniform_f=(uniform_id,val,....)\nshader_set_uniform_f_array=(uniform_id,array)\nshader_set_uniform_f_buffer=(uniform_id,buffer,offset,count)\nshader_set_uniform_matrix=(uniform_id)\nshader_set_uniform_matrix_array=(uniform_id,array)\nshader_enable_corner_id=(enable)\ntexture_set_stage=(sampled_id, texture_id)\ntexture_get_texel_width=(texture_id):\ntexture_get_texel_height=(texture_id):\nshaders_are_supported=():\nvertex_format_begin=()\nvertex_format_end=():\nvertex_format_delete=(format_id)\nvertex_format_add_position=()\nvertex_format_add_position_3d=()\nvertex_format_add_colour=()£\nvertex_format_add_color=()$\nvertex_format_add_normal=()\nvertex_format_add_texcoord=()\nvertex_format_add_custom=(type,usage)\nvertex_format_get_info=(format_id):\nvertex_create_buffer=():\nvertex_create_buffer_ext=(size):\nvertex_delete_buffer=(vbuff)\nvertex_begin=(vbuff,format)\nvertex_end=(vbuff)\nvertex_position=(vbuff,x,y)\nvertex_position_3d=(vbuff,x,y,z)\nvertex_colour=(vbuff,colour,alpha)£\nvertex_color=(vbuff,color,alpha)$\nvertex_argb=(vbuff,argb)\nvertex_texcoord=(vbuff,u,v)\nvertex_normal=(vbuff,nx,ny,nz)\nvertex_float1=(vbuff,f1)\nvertex_float2=(vbuff,f1,f2)\nvertex_float3=(vbuff,f1,f2,f3)\nvertex_float4=(vbuff,f1,f2,f3,f4)\nvertex_ubyte4=(vbuff,b1,b2,b3,b4)\nvertex_submit=(vbuff,prim,texture)\nvertex_submit_ext=(vbuff,prim,texture,offset,num)\nvertex_freeze=(vbuff)\nvertex_get_number=(vbuff):\nvertex_get_buffer_size=(vbuff):\nvertex_create_buffer_from_buffer=(src_buffer,format):\nvertex_create_buffer_from_buffer_ext=(src_buffer,format,src_offset,num_vertices):\nvertex_update_buffer_from_buffer=(dest_vbuff,dest_offset,src_buffer,[src_offset],[src_size])\nvertex_update_buffer_from_vertex=(dest_vbuff,dest_vert,src_vbuff,[src_vert],[src_vert_num])\nskeleton_animation_set=:(anim_name, [loop])!\nskeleton_animation_get=:()!:\nskeleton_animation_mix=:(anim_from,anim_to,duration)!\nskeleton_animation_set_ext=:(anim_name, track, [loop])!\nskeleton_animation_get_ext=:(track)!:\nskeleton_animation_get_duration=:(anim_name)!:\nskeleton_animation_get_frames=:(anim_name)!:\nskeleton_animation_clear=:(track,[reset],[duration])!\nskeleton_skin_set=:(skin_name)!\nskeleton_skin_get=:()!:\nskeleton_skin_create=:(skin_name, base_skins)!:\nskeleton_attachment_set=:(slot, attachment)!\nskeleton_attachment_get=:(slot)!:\nskeleton_attachment_create=:(name,sprite,ind,xo,yo,xs,ys,rot)!:\nskeleton_attachment_create_colour=:(name,sprite,ind,xo,yo,xs,ys,rot,col,alpha)!£:\nskeleton_attachment_create_color=:(name,sprite,ind,xo,yo,xs,ys,rot,col,alpha)!$:\nskeleton_attachment_exists=:(name)!:\nskeleton_attachment_replace=:(name,sprite,ind,xo,yo,xs,ys,rot)!\nskeleton_attachment_replace_colour=:(name,sprite,ind,xo,yo,xs,ys,rot,col,alpha)!£\nskeleton_attachment_replace_color=:(name,sprite,ind,xo,yo,xs,ys,rot,col,alpha)!$\nskeleton_attachment_destroy=:(name)!\nskeleton_collision_draw_set=:(val)!\nskeleton_bone_data_get=:(bone, map)!:\nskeleton_bone_data_set=:(bone, map)!\nskeleton_bone_state_get=:(bone, map)!:\nskeleton_bone_state_set=:(bone, map)!\nskeleton_slot_colour_set=:(slot,col,alpha)!£\nskeleton_slot_color_set=:(slot,col,alpha)!$\nskeleton_slot_colour_get=:(slot)!£:\nskeleton_slot_color_get=:(slot)!$:\nskeleton_slot_alpha_get=:(slot)!:\nskeleton_find_slot=:(x,y,list)!:\nskeleton_get_minmax=:()!:\nskeleton_get_num_bounds=:()!:\nskeleton_get_bounds=:(index)!:\nskeleton_animation_get_frame=:(track)!:\nskeleton_animation_set_frame=:(track,index)!\nskeleton_animation_get_position=:(track)!:\nskeleton_animation_set_position=:(track,position)!\nskeleton_animation_get_event_frames=:(anim_name,event_name)!:\nskeleton_animation_is_looping=:(track)!:\nskeleton_animation_is_finished=:(track)!:\ndraw_skeleton=:(sprite,animname,skinname,frame,x,y,xscale,yscale,rot,col,alpha)!\ndraw_skeleton_time=:(sprite, animname,skinname, time, x,y, xscale,yscale, rot, col,alpha)!\ndraw_skeleton_instance=:(instance, animname,skinname,frame,x,y,xscale,yscale,rot,col,alpha)!\ndraw_skeleton_collision=:(sprite,animname,frame,x,y,xscale,yscale,rot,col)!\ndraw_enable_skeleton_blendmodes=:(enable)!\ndraw_get_enable_skeleton_blendmodes=:()!:\nskeleton_animation_list=:(sprite, list)!\nskeleton_skin_list=:(sprite, list)!\nskeleton_bone_list=:(sprite, list)!\nskeleton_slot_list=:(sprite, list)!\nskeleton_slot_data=:(sprite, list)!\nskeleton_slot_data_instance=:(list)!\nlayer_get_id=(layer_name):\nlayer_get_id_at_depth=(depth):\nlayer_get_depth=(layer_id):\nlayer_create=(depth:number, ?name:string):\nlayer_destroy=(layer_id)\nlayer_destroy_instances=(layer_id)\nlayer_add_instance=(layer_id,instance)\nlayer_has_instance=(layer, inst):bool\nlayer_set_visible=(layer_id,visible)\nlayer_get_visible=(layer_id):\nlayer_exists=(layer_id):\nlayer_x=(layer_id,x)\nlayer_y=(layer_id,y)\nlayer_get_x=(layer_id):\nlayer_get_y=(layer_id):\nlayer_hspeed=(layer_id,speed)\nlayer_vspeed=(layer_id,speed)\nlayer_get_hspeed=(layer_id):\nlayer_get_vspeed=(layer_id):\nlayer_script_begin=(layer_id,script)\nlayer_script_end=(layer_id,script)\nlayer_shader=(layer_id,shader)\nlayer_get_script_begin=(layer_id):\nlayer_get_script_end=(layer_id):\nlayer_get_shader=(layer_id):\nlayer_set_target_room=(room)\nlayer_get_target_room=():\nlayer_reset_target_room=()\nlayer_get_all=():\nlayer_get_all_elements=(layer_id):\nlayer_get_name=(layer_id):\nlayer_depth=(layer_id, depth)\nlayer_get_element_layer=(element_id):\nlayer_get_element_type=(element_id):\nlayer_element_move=(element_id,layer_id)\nlayer_force_draw_depth=(force,depth)\nlayer_is_draw_depth_forced=():\nlayer_get_forced_depth=():\nlayer_background_get_id=(layer_id):\nlayer_background_exists=(layer_id,background_element_id):\nlayer_background_create=(layer_id,sprite):\nlayer_background_destroy=(background_element_id)\nlayer_background_visible=(background_element_id,visible)\nlayer_background_change=(background_element_id,sprite)\nlayer_background_sprite=(background_element_id,sprite)\nlayer_background_htiled=(background_element_id,tiled)\nlayer_background_vtiled=(background_element_id,tiled)\nlayer_background_stretch=(background_element_id,stretch)\nlayer_background_yscale=(background_element_id,yscale)\nlayer_background_xscale=(background_element_id,xscale)\nlayer_background_blend=(background_element_id,col)\nlayer_background_alpha=(background_element_id,alpha)\nlayer_background_index=(background_element_id,image_index)\nlayer_background_speed=(background_element_id,image_speed)\nlayer_background_get_visible=(background_element_id):\nlayer_background_get_sprite=(background_element_id):\nlayer_background_get_htiled=(background_element_id):\nlayer_background_get_vtiled=(background_element_id):\nlayer_background_get_stretch=(background_element_id):\nlayer_background_get_yscale=(background_element_id):\nlayer_background_get_xscale=(background_element_id):\nlayer_background_get_blend=(background_element_id):\nlayer_background_get_alpha=(background_element_id):\nlayer_background_get_index=(background_element_id):\nlayer_background_get_speed=(background_element_id):\nlayer_sprite_get_id=(layer_id,sprite_element_name):\nlayer_sprite_exists=(layer_id,sprite_element_id):\nlayer_sprite_create=(layer_id,x,y,sprite):\nlayer_sprite_destroy=(sprite_element_id)\nlayer_sprite_change=(sprite_element_id,sprite)\nlayer_sprite_index=(sprite_element_id,image_index)\nlayer_sprite_speed=(sprite_element_id,image_speed)\nlayer_sprite_xscale=(sprite_element_id,scale)\nlayer_sprite_yscale=(sprite_element_id,scale)\nlayer_sprite_angle=(sprite_element_id,angle)\nlayer_sprite_blend=(sprite_element_id,col)\nlayer_sprite_alpha=(sprite_element_id,alpha)\nlayer_sprite_x=(sprite_element_id,x)\nlayer_sprite_y=(sprite_element_id,y)\nlayer_sprite_get_sprite=(sprite_element_id):\nlayer_sprite_get_index=(sprite_element_id):\nlayer_sprite_get_speed=(sprite_element_id):\nlayer_sprite_get_xscale=(sprite_element_id):\nlayer_sprite_get_yscale=(sprite_element_id):\nlayer_sprite_get_angle=(sprite_element_id):\nlayer_sprite_get_blend=(sprite_element_id):\nlayer_sprite_get_alpha=(sprite_element_id):\nlayer_sprite_get_x=(sprite_element_id):\nlayer_sprite_get_y=(sprite_element_id):\nlayer_tilemap_get_id=(layer_id):\nlayer_tilemap_exists=(layer_id,tilemap_element_id):\nlayer_tilemap_create=(layer_id,x,y,tileset,width,height):\nlayer_tilemap_destroy=(tilemap_element_id)\ntilemap_tileset=(tilemap_element_id,tileset)\ntilemap_x=(tilemap_element_id,x)\ntilemap_y=(tilemap_element_id,y)\ntilemap_set=(tilemap_element_id,tiledata,cell_x,cell_y)\ntilemap_set_at_pixel=(tilemap_element_id,tiledata,x,y)\ntileset_get_texture=(tileset_id):\ntileset_get_uvs=(tileset_id):\ntileset_get_name=(tileset_id):\ntileset_get_info=(tileset_id):\ntilemap_get_tileset=(tilemap_element_id):\ntilemap_get_tile_width=(tilemap_element_id):\ntilemap_get_tile_height=(tilemap_element_id):\ntilemap_get_width=(tilemap_element_id):\ntilemap_get_height=(tilemap_element_id):\ntilemap_set_width=(tilemap_element_id, width)\ntilemap_set_height=(tilemap_element_id, height)\ntilemap_get_x=(tilemap_element_id):\ntilemap_get_y=(tilemap_element_id):\ntilemap_get=(tilemap_element_id,cell_x,cell_y):\ntilemap_get_at_pixel=(tilemap_element_id,x,y):\ntilemap_get_cell_x_at_pixel=(tilemap_element_id,x,y):\ntilemap_get_cell_y_at_pixel=(tilemap_element_id,x,y):\ntilemap_clear=(tilemap_element_id,tiledata)\ndraw_tilemap=(tilemap_element_id,x,y)\ndraw_tile=(tileset,tiledata,frame,x,y)\ntilemap_set_global_mask=(mask)\ntilemap_get_global_mask=():\ntilemap_set_mask=(tilemap_element_id, mask)\ntilemap_get_mask=(tilemap_element_id):\ntilemap_get_frame=(tilemap_element_id):\ntile_set_empty=(tiledata:number):\ntile_set_index=(tiledata:number,tileindex:index):\ntile_set_flip=(tiledata:number,flip:bool):\ntile_set_mirror=(tiledata:number,mirror:bool):\ntile_set_rotate=(tiledata:number,rotate:bool):\ntile_get_empty=(tiledata):\ntile_get_index=(tiledata):\ntile_get_flip=(tiledata):\ntile_get_mirror=(tiledata):\ntile_get_rotate=(tiledata):\nlayer_instance_get_instance=(instance_element_id):\ninstance_activate_layer=(layer_id)\ninstance_deactivate_layer=(layer_id)\ncamera_create=():\ncamera_create_view=(room_x, room_y, width, height, ?angle, ?object, ?x_speed, ?y_speed, ?x_border, ?y_border):\ncamera_destroy=(camera)\ncamera_apply=(camera)\ncamera_copy_transforms=(dest_camera,src_camera)\ncamera_get_active=():\ncamera_get_default=():\ncamera_set_default=(camera)\ncamera_set_view_mat=(camera,matrix)\ncamera_set_proj_mat=(camera,matrix)\ncamera_set_update_script=(camera,script)\ncamera_set_begin_script=(camera,script)\ncamera_set_end_script=(camera,script)\ncamera_set_view_pos=(camera,x,y)\ncamera_set_view_size=(camera,width,height)\ncamera_set_view_speed=(camera,x_speed,y_speed)\ncamera_set_view_border=(camera,x_border,y_border)\ncamera_set_view_angle=(camera,angle)\ncamera_set_view_target=(camera,object)\ncamera_get_view_mat=(camera):\ncamera_get_proj_mat=(camera):\ncamera_get_update_script=(camera):\ncamera_get_begin_script=(camera):\ncamera_get_end_script=(camera):\ncamera_get_view_x=(camera):\ncamera_get_view_y=(camera):\ncamera_get_view_width=(camera):\ncamera_get_view_height=(camera):\ncamera_get_view_speed_x=(camera):\ncamera_get_view_speed_y=(camera):\ncamera_get_view_border_x=(camera):\ncamera_get_view_border_y=(camera):\ncamera_get_view_angle=(camera):\ncamera_get_view_target=(camera):\nview_get_camera=(view):\nview_get_visible=(view):\nview_get_xport=(view):\nview_get_yport=(view):\nview_get_wport=(view):\nview_get_hport=(view):\nview_get_surface_id=(view):\nview_set_camera=(view,camera)\nview_set_visible=(view,visible)\nview_set_xport=(view,xport)\nview_set_yport=(view,yport)\nview_set_wport=(view,wport)\nview_set_hport=(view,hport)\nview_set_surface_id=(view,surface_id)\ngesture_drag_time=(time)\ngesture_drag_distance=(distance)\ngesture_flick_speed=(speed)\ngesture_double_tap_time=(time)\ngesture_double_tap_distance=(distance)\ngesture_pinch_distance=(distance)\ngesture_pinch_angle_towards=(angle)\ngesture_pinch_angle_away=(angle)\ngesture_rotate_time=(time)\ngesture_rotate_angle=(angle)\ngesture_tap_count=(enable)\ngesture_get_drag_time=():\ngesture_get_drag_distance=():\ngesture_get_flick_speed=():\ngesture_get_double_tap_time=():\ngesture_get_double_tap_distance=():\ngesture_get_pinch_distance=():\ngesture_get_pinch_angle_towards=():\ngesture_get_pinch_angle_away=():\ngesture_get_rotate_time=():\ngesture_get_rotate_angle=():\ngesture_get_tap_count=():\nkeyboard_virtual_show=(virtual_keyboard_type, virtual_return_key_type, auto_capitalization_type, predictive_text_enabled)\nkeyboard_virtual_hide=()\nkeyboard_virtual_status=()\nkeyboard_virtual_height=()\ntag_get_asset_ids=(tags,asset_type):\ntag_get_assets=(tags):\nasset_get_tags=(asset_name_or_id,[asset_type]):\nasset_add_tags=(asset_name_or_id,tags,?asset_type):\nasset_remove_tags=(asset_name_or_id,tags,?asset_type):\nasset_has_tags=(asset_name_or_id,tags,?asset_type):\nasset_has_any_tag=(asset_name_or_id,tags,?asset_type):\nasset_clear_tags=(asset_name_or_id,?asset_type):\nextension_exists=(ext_name):\nextension_get_version=(ext_name):\nextension_get_option_count=(ext_name):\nextension_get_option_names=(ext_name):\nextension_get_option_value=(ext_name, option_name):\nextension_get_options=(ext_name):\nlayer_sequence_get_instance=(sequence_element_id):\nlayer_sequence_create=(layer_id,x,y,sequence_id):\nlayer_sequence_destroy=(sequence_element_id)\nlayer_sequence_exists=(layer_id,sequence_element_id):\nlayer_sequence_x=(sequence_element_id,pos_x)\nlayer_sequence_y=(sequence_element_id,pos_y)\nlayer_sequence_angle=(sequence_element_id,angle)\nlayer_sequence_xscale=(sequence_element_id,xscale)\nlayer_sequence_yscale=(sequence_element_id,yscale)\nlayer_sequence_headpos=(sequence_element_id,position)\nlayer_sequence_headdir=(sequence_element_id,direction)\nlayer_sequence_pause=(sequence_element_id)\nlayer_sequence_play=(sequence_element_id)\nlayer_sequence_speedscale=(sequence_element_id,speedscale)\nlayer_sequence_get_x=(sequence_element_id):\nlayer_sequence_get_y=(sequence_element_id):\nlayer_sequence_get_angle=(sequence_element_id):\nlayer_sequence_get_xscale=(sequence_element_id):\nlayer_sequence_get_yscale=(sequence_element_id):\nlayer_sequence_get_headpos=(sequence_element_id):\nlayer_sequence_get_headdir=(sequence_element_id):\nlayer_sequence_get_sequence=(sequence_element_id):\nlayer_sequence_is_paused=(sequence_element_id):\nlayer_sequence_is_finished=(sequence_element_id):\nlayer_sequence_get_speedscale=(sequence_element_id):\nlayer_sequence_get_length=(sequence_element_id):\nanimcurve_get=(curve_id):\nanimcurve_get_channel=(curve_struct_or_id,channel_name_or_index):\nanimcurve_get_channel_index=(curve_struct_or_id,channel_name):\nanimcurve_channel_evaluate=(channel,posx):\nsequence_create=():\nsequence_destroy=(sequence_struct_or_id)\nsequence_exists=(sequence_struct_or_id):\nsequence_get=(sequence_id):\nsequence_keyframe_new=(type):\nsequence_keyframedata_new=(type):\nsequence_track_new=(type):\nsequence_get_objects=(sequence_struct_or_id):\nsequence_instance_override_object=(sequence_instance_struct,object_id,instance_or_object_id)\nanimcurve_create=():\nanimcurve_destroy=(curve_struct_or_id)\nanimcurve_exists=(curve_struct_or_id):\nanimcurve_channel_new=():\nanimcurve_point_new=():\nfx_create=(filter_or_effect_name):\nfx_get_name=(filter_or_effect):\nfx_get_parameter_names=(filter_or_effect):\nfx_get_parameter=(filter_or_effect,parameter_name):\nfx_get_parameters=(filter_or_effect):\nfx_get_single_layer=(filter_or_effect):\nfx_set_parameter=(filter_or_effect,parameter_name,val,...)\nfx_set_parameters=(filter_or_effect,parameter_struct)\nfx_set_single_layer=(filter_or_effect,enable)\nlayer_set_fx=(layer_name_or_id,filter_or_effect)\nlayer_get_fx=(layer_name_or_id):\nlayer_clear_fx=(layer_name_or_id)\nlayer_enable_fx=(layer_name_or_id,enable)\nlayer_fx_is_enabled=(layer_name_or_id):\ngc_collect=()\ngc_enable=(enable)\ngc_is_enabled=():\ngc_get_stats=():\ngc_target_frame_time=(time)\ngc_get_target_frame_time=():\nweak_ref_create=(thing_to_track):\nweak_ref_alive=(weak_ref)\nweak_ref_any_alive=(array,[index],[length])\ntime_source_create=(parent,period,units,callback,[args],[reps],[expiryType]):\ntime_source_destroy=(id, [destroyTree])\ntime_source_start=(id)\ntime_source_stop=(id)\ntime_source_pause=(id)\ntime_source_resume=(id)\ntime_source_reset=(id)\ntime_source_reconfigure=(id,period,units,callback,[args],[reps],[expiryType])\ntime_source_get_period=(id):\ntime_source_get_reps_completed=(id):\ntime_source_get_reps_remaining=(id):\ntime_source_get_units=(id):\ntime_source_get_time_remaining=(id):\ntime_source_get_state=(id):\ntime_source_get_parent=(id):\ntime_source_get_children=(id):\ntime_source_exists=(id):\ntime_seconds_to_bpm=(seconds)\ntime_bpm_to_seconds=(bpm)\ncall_later=(period, units, callback, [repeat])\ncall_cancel=(handle)\nrollback_use_manual_start=()^rollback\nrollback_use_late_join=()^rollback\nrollback_define_player=(player_obj,...)^rollback\nrollback_define_input=(input)^rollback\nrollback_define_mock_input=(player_id,input)^rollback\nrollback_define_input_frame_delay=(frames)^rollback\nrollback_define_extra_network_latency=(latency)^rollback\nrollback_create_game=(num_players,...)^rollback:\nrollback_join_game=(...)^rollback\nrollback_start_game=()^rollback\nrollback_leave_game=()^rollback\nrollback_get_input=(...)^rollback:\nrollback_chat=(message,...)^rollback\nrollback_use_player_prefs=(...)^rollback\nrollback_set_player_prefs=(preferences)^rollback\nrollback_get_player_prefs=(...)^rollback:\nrollback_get_info=(...)^rollback:\nrollback_use_random_input=(enabled)^rollback\nrollback_display_events=(enabled)^rollback\nrollback_sync_on_frame=()^rollback\nwallpaper_set_config=(config)^rollback\nwallpaper_set_subscriptions=(subscriptions)^live_wallpaper_subscription\naudio_bus_create=():\naudio_effect_create=(type, [params]):\naudio_emitter_bus=(emitter_idx, bus)\naudio_emitter_get_bus=(emitter_idx):\naudio_bus_get_emitters=(bus):\naudio_bus_clear_emitters=(bus)\nlin_to_db=(x)\ndb_to_lin=(x)");
    while (!file_text_eof(l_lines))
    {
        var l_line = file_text_read_string(l_lines);
        file_text_readln(l_lines);
        var l_sep = string_pos("=", l_line);
        var l_name = string_copy(l_line, 1, l_sep - 1);
        var l_sig = string_delete(l_line, 1, l_sep);
        l_sep = string_pos("(", l_sig);
        l_sig = string_insert(l_name, l_sig, l_sep);
        if (l_isJS)
        {
            var l_jsFunc;
            try
            {
                l_jsFunc = live_preinit_js_func(l_jsIndex);
                if (l_jsFunc == undefined)
                {
                    l_jsFunc = l_jsDummy;
                }
            }
            catch (l__g)
            {
                l_jsFunc = l_jsDummy;
            }
            l_jsIndex++;
            gml_func_add(l_sig, l_jsFunc);
        }
        else
        {
            var l_m = ds_map_find_value(l_fm, l_name);
            if (l_m == undefined)
            {
                continue;
            }
            l_m.used = true;
            var l_func = l_m.func;
            gml_func_add(l_sig, l_func);
        }
    }
    file_text_close(l_lines);
    if (!l_isJS)
    {
        var l_i = 0;
        var l__g1 = ds_list_size(l_fl);
        while (l_i < l__g1)
        {
            var l_m = ds_list_find_value(l_fl, l_i);
            if (l_m.used)
            {
            }
            else
            {
                gml_func_add(":::" + l_m.name + "(...):", l_m.func);
            }
            l_i++;
        }
    }
    ds_map_destroy(l_fm);
    ds_list_destroy(l_fl);
}

function live_preinit_collect_constants()
{
    var l_gmlConstValues = [];
    l_gmlConstValues = [undefined, pointer_invalid, pointer_null, 0, 1, 2, 3, pi, NaN, infinity, 46120.37177886718, "2.29.4.0", "2024.14.3.260", 0, 1, 0, 1, 0, 1, 3, 2, 5, 6, 4, 7, 8, 72, 73, 76, 77, 9, 10, 11, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 60, 61, 50, 51, 52, 53, 54, 55, 56, 57, 58, 16, 17, 18, 19, 21, 22, 23, 24, 25, 26, 27, 28, 31, 32, 33, 34, 36, 37, 38, 39, 40, 41, 42, 43, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 40, 41, 42, 43, 44, 45, 46, 47, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 0, 1, 2, 64, 74, 75, 12, 13, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 60, 62, 63, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 0, 1, 13, 13, 16, 17, 18, 27, 32, 8, 9, 19, 44, 37, 39, 38, 40, 36, 35, 46, 45, 33, 34, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 111, 106, 109, 107, 110, 160, 162, 164, 161, 163, 165, -1, 0, 1, 2, 3, 4, 5, 0, 1, 2, 0, 1, 2, 3, 16776960, 0, 16711680, 4210752, 4210752, 16711935, 8421504, 8421504, 32768, 65280, 12632256, 12632256, 128, 8388608, 32896, 8388736, 255, 12632256, 8421376, 16777215, 65535, 4235519, 0, 1, 2, 0, 1, 2, 1, 2, 3, 4, 5, 6, 0, 1, 2, 3, 1, 2, 3, 4, 3, 4, 5, 6, 7, 8, 9, 10, 9, 10, 11, 0, 1, 2, 0, 1, 2, 0, 1, 2, 3, 4, 5, 6, 0, 1, 0, -1, -2, -3, -4, -6, -7, -8, -9, -10, -11, -12, -19, -21, -22, 0, 1, 0, -1, 1, 2, 3, 4, 5, 6, 7, 13, 8, 9, 10, 1, 2, 4, 8, 16, 32, 1, 2, 3, 4, 5, 6, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 0, 1, 2, 0, 1, 2, 3, 0, 1, 2, 0, 1, 3, 4, 6, -1, 7, 9, 12, 14, 15, 16, 18, 20, 21, 22, 23, 24, -1, 0, 1, 2, 3, 4, 5, 6, 9, 11, 8, 10, -1, 0, 1, 2, 3, 4, 5, 6, 256, 2, 0, 2, 1, 3, 0, 1, 0, 1, 2, 1, 2, 3, 4, 5, 6, 7, 8, 0, 1, 2, 0, 1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 8, 64, 4, 32, 2, 16, 1, 0, 2, 4, 8, 16, 32, 64, 128, 256, 1, 2, 1, 2, 4, 8, 16, 0, 1, 6, 2, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 1, 2, 3, 4, 5, 6, 12, 7, 8, 9, 10, 13, 11, 0, 1, 2, 32769, 32770, 32771, 32772, 32773, 32774, 32775, 32776, 32777, 32778, 32779, 32780, 32781, 32782, 32783, 32784, 32785, 32786, 32787, 32788, 32789, 32790, 32791, 32792, 32793, 32794, 32795, 32796, 32797, 32798, 1, 2, 3, 4, 5, 6, 7, 8, 9, 12, 13, 14, 1, 2, 3, 4, 5, 6, 0, 1, 2, 3, 4, 5, 6, 7, 8, 1073741824, 536870912, 268435456, 524287, 0, 1, 2, 3, 4, 5, 6, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 0, 1, 2, 3, -1, 0, 1, 0, 1, 2, 3, 4, 4, 0, 1, 2, 3, 4, 1, 2, 3, 4, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 0, 1, 2, 1, -1, 0, 1, 0, 1, 0, 1];
    return l_gmlConstValues;
}

function live_preinit_init_consts()
{
    var l_gmlConstNames = undefined;
    var l_gmlConstValues = live_preinit_collect_constants();
    l_gmlConstNames = "undefined\npointer_invalid\npointer_null\npath_action_stop\npath_action_restart\npath_action_continue\npath_action_reverse\npi\nNaN\ninfinity\nGM_build_date\nGM_version\nGM_runtime_version\ntimezone_local\ntimezone_utc\ngamespeed_fps\ngamespeed_microseconds\nev_create\nev_destroy\nev_step\nev_alarm\nev_keyboard\nev_mouse\nev_collision\nev_other\nev_draw\nev_draw_begin\nev_draw_end\nev_draw_pre\nev_draw_post\nev_keypress\nev_keyrelease\nev_trigger\nev_left_button\nev_right_button\nev_middle_button\nev_no_button\nev_left_press\nev_right_press\nev_middle_press\nev_left_release\nev_right_release\nev_middle_release\nev_mouse_enter\nev_mouse_leave\nev_mouse_wheel_up\nev_mouse_wheel_down\nev_global_left_button\nev_global_right_button\nev_global_middle_button\nev_global_left_press\nev_global_right_press\nev_global_middle_press\nev_global_left_release\nev_global_right_release\nev_global_middle_release\nev_joystick1_left\nev_joystick1_right\nev_joystick1_up\nev_joystick1_down\nev_joystick1_button1\nev_joystick1_button2\nev_joystick1_button3\nev_joystick1_button4\nev_joystick1_button5\nev_joystick1_button6\nev_joystick1_button7\nev_joystick1_button8\nev_joystick2_left\nev_joystick2_right\nev_joystick2_up\nev_joystick2_down\nev_joystick2_button1\nev_joystick2_button2\nev_joystick2_button3\nev_joystick2_button4\nev_joystick2_button5\nev_joystick2_button6\nev_joystick2_button7\nev_joystick2_button8\nev_outside\nev_boundary\nev_game_start\nev_game_end\nev_room_start\nev_room_end\nev_no_more_lives\nev_animation_end\nev_end_of_path\nev_no_more_health\nev_user0\nev_user1\nev_user2\nev_user3\nev_user4\nev_user5\nev_user6\nev_user7\nev_user8\nev_user9\nev_user10\nev_user11\nev_user12\nev_user13\nev_user14\nev_user15\nev_outside_view0\nev_outside_view1\nev_outside_view2\nev_outside_view3\nev_outside_view4\nev_outside_view5\nev_outside_view6\nev_outside_view7\nev_boundary_view0\nev_boundary_view1\nev_boundary_view2\nev_boundary_view3\nev_boundary_view4\nev_boundary_view5\nev_boundary_view6\nev_boundary_view7\nev_animation_update\nev_animation_event\nev_web_image_load\nev_web_sound_load\nev_web_async\nev_dialog_async\nev_web_iap\nev_web_cloud\nev_web_networking\nev_web_steam\nev_social\nev_push_notification\nev_async_save_load\nev_audio_recording\nev_audio_playback\nev_system_event\nev_broadcast_message\nev_step_normal\nev_step_begin\nev_step_end\nev_gui\nev_gui_begin\nev_gui_end\nev_cleanup\nev_gesture\nev_gesture_tap\nev_gesture_double_tap\nev_gesture_drag_start\nev_gesture_dragging\nev_gesture_drag_end\nev_gesture_flick\nev_gesture_pinch_start\nev_gesture_pinch_in\nev_gesture_pinch_out\nev_gesture_pinch_end\nev_gesture_rotate_start\nev_gesture_rotating\nev_gesture_rotate_end\nev_global_gesture_tap\nev_global_gesture_double_tap\nev_global_gesture_drag_start\nev_global_gesture_dragging\nev_global_gesture_drag_end\nev_global_gesture_flick\nev_global_gesture_pinch_start\nev_global_gesture_pinch_in\nev_global_gesture_pinch_out\nev_global_gesture_pinch_end\nev_global_gesture_rotate_start\nev_global_gesture_rotating\nev_global_gesture_rotate_end\nev_async_web_image_load\nev_async_web\nev_async_dialog\nev_async_web_iap\nev_async_web_cloud\nev_async_web_networking\nev_async_web_steam\nev_async_social\nev_async_push_notification\nev_async_save_load\nev_async_audio_recording\nev_async_audio_playback\nev_async_system_event\nvk_nokey\nvk_anykey\nvk_enter\nvk_return\nvk_shift\nvk_control\nvk_alt\nvk_escape\nvk_space\nvk_backspace\nvk_tab\nvk_pause\nvk_printscreen\nvk_left\nvk_right\nvk_up\nvk_down\nvk_home\nvk_end\nvk_delete\nvk_insert\nvk_pageup\nvk_pagedown\nvk_f1\nvk_f2\nvk_f3\nvk_f4\nvk_f5\nvk_f6\nvk_f7\nvk_f8\nvk_f9\nvk_f10\nvk_f11\nvk_f12\nvk_numpad0\nvk_numpad1\nvk_numpad2\nvk_numpad3\nvk_numpad4\nvk_numpad5\nvk_numpad6\nvk_numpad7\nvk_numpad8\nvk_numpad9\nvk_divide\nvk_multiply\nvk_subtract\nvk_add\nvk_decimal\nvk_lshift\nvk_lcontrol\nvk_lalt\nvk_rshift\nvk_rcontrol\nvk_ralt\nmb_any\nmb_none\nmb_left\nmb_right\nmb_middle\nmb_side1\nmb_side2\nbboxmode_automatic\nbboxmode_fullimage\nbboxmode_manual\nbboxkind_precise\nbboxkind_rectangular\nbboxkind_ellipse\nbboxkind_diamond\nc_aqua\nc_black\nc_blue\nc_dkgray\nc_dkgrey\nc_fuchsia\nc_gray\nc_grey\nc_green\nc_lime\nc_ltgray\nc_ltgrey\nc_maroon\nc_navy\nc_olive\nc_purple\nc_red\nc_silver\nc_teal\nc_white\nc_yellow\nc_orange\nfa_left\nfa_center\nfa_right\nfa_top\nfa_middle\nfa_bottom\npr_pointlist\npr_linelist\npr_linestrip\npr_trianglelist\npr_trianglestrip\npr_trianglefan\nbm_normal\nbm_add\nbm_max\nbm_subtract\nbm_zero\nbm_one\nbm_src_colour\nbm_inv_src_colour\nbm_src_color\nbm_inv_src_color\nbm_src_alpha\nbm_inv_src_alpha\nbm_dest_alpha\nbm_inv_dest_alpha\nbm_dest_colour\nbm_inv_dest_colour\nbm_dest_color\nbm_inv_dest_color\nbm_src_alpha_sat\ntf_point\ntf_linear\ntf_anisotropic\nmip_off\nmip_on\nmip_markedonly\naudio_falloff_none\naudio_falloff_inverse_distance\naudio_falloff_inverse_distance_clamped\naudio_falloff_linear_distance\naudio_falloff_linear_distance_clamped\naudio_falloff_exponent_distance\naudio_falloff_exponent_distance_clamped\naudio_mono\naudio_stereo\ncr_default\ncr_none\ncr_arrow\ncr_cross\ncr_beam\ncr_size_nesw\ncr_size_ns\ncr_size_nwse\ncr_size_we\ncr_uparrow\ncr_hourglass\ncr_drag\ncr_appstart\ncr_handpoint\ncr_size_all\nspritespeed_framespersecond\nspritespeed_framespergameframe\nasset_object\nasset_unknown\nasset_sprite\nasset_sound\nasset_room\nasset_path\nasset_script\nasset_font\nasset_timeline\nasset_tiles\nasset_shader\nasset_sequence\nasset_animationcurve\nfa_readonly\nfa_hidden\nfa_sysfile\nfa_volumeid\nfa_directory\nfa_archive\nds_type_map\nds_type_list\nds_type_stack\nds_type_queue\nds_type_grid\nds_type_priority\nef_explosion\nef_ring\nef_ellipse\nef_firework\nef_smoke\nef_smokeup\nef_star\nef_spark\nef_flare\nef_cloud\nef_rain\nef_snow\npt_shape_pixel\npt_shape_disk\npt_shape_square\npt_shape_line\npt_shape_star\npt_shape_circle\npt_shape_ring\npt_shape_sphere\npt_shape_flare\npt_shape_spark\npt_shape_explosion\npt_shape_cloud\npt_shape_smoke\npt_shape_snow\nps_distr_linear\nps_distr_gaussian\nps_distr_invgaussian\nps_shape_rectangle\nps_shape_ellipse\nps_shape_diamond\nps_shape_line\nmatrix_view\nmatrix_projection\nmatrix_world\nos_windows\nos_macosx\nos_ios\nos_android\nos_linux\nos_unknown\nos_winphone\nos_win8native\nos_psvita\nos_ps4\nos_xboxone\nos_ps3\nos_uwp\nos_tvos\nos_switch\nos_ps5\nos_xboxseriesxs\nos_operagx\nbrowser_not_a_browser\nbrowser_unknown\nbrowser_ie\nbrowser_firefox\nbrowser_chrome\nbrowser_safari\nbrowser_safari_mobile\nbrowser_opera\nbrowser_tizen\nbrowser_edge\nbrowser_windows_store\nbrowser_ie_mobile\ndevice_ios_unknown\ndevice_ios_iphone\ndevice_ios_iphone_retina\ndevice_ios_ipad\ndevice_ios_ipad_retina\ndevice_ios_iphone5\ndevice_ios_iphone6\ndevice_ios_iphone6plus\ndevice_emulator\ndevice_tablet\ndisplay_landscape\ndisplay_landscape_flipped\ndisplay_portrait\ndisplay_portrait_flipped\ntm_sleep\ntm_countvsyncs\nof_challenge_win\nof_challenge_lose\nof_challenge_tie\ncmpfunc_never\ncmpfunc_less\ncmpfunc_equal\ncmpfunc_lessequal\ncmpfunc_greater\ncmpfunc_notequal\ncmpfunc_greaterequal\ncmpfunc_always\ncull_noculling\ncull_clockwise\ncull_counterclockwise\nlighttype_dir\nlighttype_point\nphy_joint_anchor_1_x\nphy_joint_anchor_1_y\nphy_joint_anchor_2_x\nphy_joint_anchor_2_y\nphy_joint_reaction_force_x\nphy_joint_reaction_force_y\nphy_joint_reaction_torque\nphy_joint_motor_speed\nphy_joint_angle\nphy_joint_motor_torque\nphy_joint_max_motor_torque\nphy_joint_translation\nphy_joint_speed\nphy_joint_motor_force\nphy_joint_max_motor_force\nphy_joint_length_1\nphy_joint_length_2\nphy_joint_damping_ratio\nphy_joint_frequency\nphy_joint_lower_angle_limit\nphy_joint_upper_angle_limit\nphy_joint_angle_limits\nphy_joint_max_length\nphy_joint_max_torque\nphy_joint_max_force\nphy_debug_render_aabb\nphy_debug_render_collision_pairs\nphy_debug_render_coms\nphy_debug_render_core_shapes\nphy_debug_render_joints\nphy_debug_render_obb\nphy_debug_render_shapes\nphy_particle_flag_water\nphy_particle_flag_zombie\nphy_particle_flag_wall\nphy_particle_flag_spring\nphy_particle_flag_elastic\nphy_particle_flag_viscous\nphy_particle_flag_powder\nphy_particle_flag_tensile\nphy_particle_flag_colourmixing\nphy_particle_group_flag_solid\nphy_particle_group_flag_rigid\nphy_particle_data_flag_typeflags\nphy_particle_data_flag_position\nphy_particle_data_flag_velocity\nphy_particle_data_flag_colour\nphy_particle_data_flag_category\nnetwork_socket_tcp\nnetwork_socket_udp\nnetwork_socket_ws\nnetwork_socket_bluetooth\nnetwork_type_connect\nnetwork_type_disconnect\nnetwork_type_data\nnetwork_type_non_blocking_connect\nnetwork_config_connect_timeout\nnetwork_config_use_non_blocking_socket\nnetwork_config_enable_reliable_udp\nnetwork_config_disable_reliable_udp\nnetwork_config_avoid_time_wait\nbuffer_fixed\nbuffer_grow\nbuffer_wrap\nbuffer_fast\nbuffer_vbuffer\nbuffer_u8\nbuffer_s8\nbuffer_u16\nbuffer_s16\nbuffer_u32\nbuffer_s32\nbuffer_u64\nbuffer_f16\nbuffer_f32\nbuffer_f64\nbuffer_bool\nbuffer_text\nbuffer_string\nbuffer_seek_start\nbuffer_seek_relative\nbuffer_seek_end\ngp_face1\ngp_face2\ngp_face3\ngp_face4\ngp_shoulderl\ngp_shoulderr\ngp_shoulderlb\ngp_shoulderrb\ngp_select\ngp_start\ngp_stickl\ngp_stickr\ngp_padu\ngp_padd\ngp_padl\ngp_padr\ngp_axislh\ngp_axislv\ngp_axisrh\ngp_axisrv\ngp_axis_acceleration_x\ngp_axis_acceleration_y\ngp_axis_acceleration_z\ngp_axis_angular_velocity_x\ngp_axis_angular_velocity_y\ngp_axis_angular_velocity_z\ngp_axis_orientation_x\ngp_axis_orientation_y\ngp_axis_orientation_z\ngp_axis_orientation_w\nvertex_usage_position\nvertex_usage_colour\nvertex_usage_normal\nvertex_usage_texcoord\nvertex_usage_blendweight\nvertex_usage_blendindices\nvertex_usage_psize\nvertex_usage_tangent\nvertex_usage_binormal\nvertex_usage_fog\nvertex_usage_depth\nvertex_usage_sample\nvertex_type_float1\nvertex_type_float2\nvertex_type_float3\nvertex_type_float4\nvertex_type_colour\nvertex_type_ubyte4\nlayerelementtype_undefined\nlayerelementtype_background\nlayerelementtype_instance\nlayerelementtype_oldtilemap\nlayerelementtype_sprite\nlayerelementtype_tilemap\nlayerelementtype_particlesystem\nlayerelementtype_tile\nlayerelementtype_sequence\ntile_rotate\ntile_flip\ntile_mirror\ntile_index_mask\nkbv_type_default\nkbv_type_ascii\nkbv_type_url\nkbv_type_email\nkbv_type_numbers\nkbv_type_phone\nkbv_type_phone_name\nkbv_returnkey_default\nkbv_returnkey_go\nkbv_returnkey_google\nkbv_returnkey_join\nkbv_returnkey_next\nkbv_returnkey_route\nkbv_returnkey_search\nkbv_returnkey_send\nkbv_returnkey_yahoo\nkbv_returnkey_done\nkbv_returnkey_continue\nkbv_returnkey_emergency\nkbv_autocapitalize_none\nkbv_autocapitalize_words\nkbv_autocapitalize_sentences\nkbv_autocapitalize_characters\nos_permission_denied_dont_request\nos_permission_denied\nos_permission_granted\nnineslice_left\nnineslice_top\nnineslice_right\nnineslice_bottom\nnineslice_centre\nnineslice_center\nnineslice_stretch\nnineslice_repeat\nnineslice_mirror\nnineslice_blank\nnineslice_hide\nseqtracktype_graphic\nseqtracktype_audio\nseqtracktype_real\nseqtracktype_color\nseqtracktype_colour\nseqtracktype_bool\nseqtracktype_string\nseqtracktype_sequence\nseqtracktype_clipmask\nseqtracktype_clipmask_mask\nseqtracktype_clipmask_subject\nseqtracktype_group\nseqtracktype_empty\nseqtracktype_spriteframes\nseqtracktype_instance\nseqtracktype_message\nseqtracktype_moment\nseqplay_oneshot\nseqplay_loop\nseqplay_pingpong\nseqdir_right\nseqdir_left\nseqinterpolation_assign\nseqinterpolation_lerp\nseqaudiokey_loop\nseqaudiokey_oneshot\nanimcurvetype_linear\nanimcurvetype_catmullrom";
    var l_lines = file_text_open_from_string(l_gmlConstNames);
    var l_index = -1;
    while (!file_text_eof(l_lines))
    {
        var l_name = file_text_read_string(l_lines);
        file_text_readln(l_lines);
        gml_const_add(l_name, l_gmlConstValues[++l_index]);
    }
    file_text_close(l_lines);
}

function live_preinit_init_new_consts()
{
    try
    {
        gml_const_add("GM_project_filename", "S:/gm-projects/blow-the-leaves-away/blow-the-leaves-away.yyp");
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("GM_build_type", "exe");
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("GM_is_sandboxed", true);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("_GMLINE_", 789);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("gml_GlobalScript_GMLiveAPI", "gml_GlobalScript_GMLiveAPI");
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("gml_Script_live_preinit_init_new_consts", "gml_Script_live_preinit_init_new_consts");
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("ev_pre_create", 14);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("ev_draw_normal", 0);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("ev_audio_playback_ended", 80);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("ev_async_audio_playback_ended", 80);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("m_axisx", 40960);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("m_axisy", 40961);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("m_axisx_gui", 40962);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("m_axisy_gui", 40963);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("m_scroll_up", 40964);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("m_scroll_down", 40965);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("bm_min", 4);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("bm_reverse_subtract", 5);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("bm_eq_add", 1);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("bm_eq_max", 2);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("bm_eq_subtract", 3);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("bm_eq_min", 4);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("bm_eq_reverse_subtract", 5);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("audio_falloff_inverse_distance_scaled", 7);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("audio_falloff_exponent_distance_scaled", 8);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("audio_3D", audio_3D);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("surface_rgba8unorm", 6);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("surface_r16float", 9);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("surface_r32float", 10);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("surface_rgba4unorm", 11);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("surface_r8unorm", 12);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("surface_rg8unorm", 13);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("surface_rgba16float", 14);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("surface_rgba32float", 15);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("video_format_rgba", 0);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("video_format_yuv", 1);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("video_status_closed", 0);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("video_status_preparing", 1);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("video_status_playing", 2);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("video_status_paused", 3);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("sprite_add_ext_error_unknown", -1);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("sprite_add_ext_error_cancelled", -2);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("sprite_add_ext_error_spritenotfound", -3);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("sprite_add_ext_error_loadfailed", -4);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("sprite_add_ext_error_decompressfailed", -5);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("sprite_add_ext_error_setupfailed", -6);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("fa_none", 0);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("ps_mode_stream", 0);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("ps_mode_burst", 1);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("os_gdk", 23);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("os_gxgames", 24);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("tm_systemtiming", 2);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("network_socket_wss", 7);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("network_type_up", 5);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("network_type_up_failed", 6);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("network_type_down", 7);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("network_send_binary", 1);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("network_send_text", 2);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("network_config_websocket_protocol", 5);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("network_config_enable_multicast", 6);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("network_config_disable_multicast", 7);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("network_connect_none", 0);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("network_connect_blocking", 1);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("network_connect_nonblocking", 2);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("network_connect_active", 2);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("network_connect_passive", 3);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("gp_home", 32799);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("gp_extra1", 32800);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("gp_extra2", 32801);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("gp_extra3", 32802);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("gp_extra4", 32803);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("gp_paddler", 32804);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("gp_paddlel", 32805);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("gp_paddlerb", 32806);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("gp_paddlelb", 32807);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("gp_touchpadbutton", 32808);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("gp_extra5", 32809);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("gp_extra6", 32810);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("texturegroup_status_unloaded", 0);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("texturegroup_status_loading", 1);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("texturegroup_status_loaded", 2);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("texturegroup_status_fetched", 3);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("seqtracktype_text", 17);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("seqtracktype_particlesystem", 18);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("seqtracktype_audioeffect", 19);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("seqtextkey_left", 0);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("seqtextkey_center", 1);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("seqtextkey_right", 2);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("seqtextkey_justify", 3);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("seqtextkey_top", 0);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("seqtextkey_middle", 1);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("seqtextkey_bottom", 2);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("animcurvetype_bezier", 2);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("time_source_global", 0);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("time_source_game", 1);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("time_source_units_seconds", 0);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("time_source_units_frames", 1);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("time_source_expire_nearest", 0);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("time_source_expire_after", 1);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("time_source_state_initial", 0);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("time_source_state_active", 1);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("time_source_state_paused", 2);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("time_source_state_stopped", 3);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("audio_bus_main", audio_bus_main);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("AudioEffectType", AudioEffectType);
    }
    catch (l__g)
    {
    }
    try
    {
        gml_const_add("AudioLFOType", AudioLFOType);
    }
    catch (l__g)
    {
    }
}

function live_preinit_init_arrays()
{
    gml_var_add("instance_count*", function(arg0, arg1)
    {
        return instance_count;
    });
    gml_var_add("room_speed", function(arg0, arg1)
    {
        if (arg0)
        {
            room_speed = arg1;
            return undefined;
        }
        else
        {
            return room_speed;
        }
    });
    gml_var_add("fps*", function(arg0, arg1)
    {
        return fps;
    });
    gml_var_add("fps_real*", function(arg0, arg1)
    {
        return fps_real;
    });
    gml_var_add("current_time*", function(arg0, arg1)
    {
        return current_time;
    });
    gml_var_add("current_year*", function(arg0, arg1)
    {
        return current_year;
    });
    gml_var_add("current_month*", function(arg0, arg1)
    {
        return current_month;
    });
    gml_var_add("current_day*", function(arg0, arg1)
    {
        return current_day;
    });
    gml_var_add("current_weekday*", function(arg0, arg1)
    {
        return current_weekday;
    });
    gml_var_add("current_hour*", function(arg0, arg1)
    {
        return current_hour;
    });
    gml_var_add("current_minute*", function(arg0, arg1)
    {
        return current_minute;
    });
    gml_var_add("current_second*", function(arg0, arg1)
    {
        return current_second;
    });
    gml_var_add("room", function(arg0, arg1)
    {
        if (arg0)
        {
            room = arg1;
            return undefined;
        }
        else
        {
            return room;
        }
    });
    gml_var_add("room_first*", function(arg0, arg1)
    {
        return room_first;
    });
    gml_var_add("room_last*", function(arg0, arg1)
    {
        return room_last;
    });
    gml_var_add("room_width*", function(arg0, arg1)
    {
        return room_width;
    });
    gml_var_add("room_height*", function(arg0, arg1)
    {
        return room_height;
    });
    gml_var_add("room_persistent", function(arg0, arg1)
    {
        if (arg0)
        {
            room_persistent = arg1;
            return undefined;
        }
        else
        {
            return room_persistent;
        }
    });
    gml_var_add("score", function(arg0, arg1)
    {
        if (arg0)
        {
            score = arg1;
            return undefined;
        }
        else
        {
            return score;
        }
    });
    gml_var_add("lives", function(arg0, arg1)
    {
        if (arg0)
        {
            lives = arg1;
            return undefined;
        }
        else
        {
            return lives;
        }
    });
    gml_var_add("health", function(arg0, arg1)
    {
        if (arg0)
        {
            health = arg1;
            return undefined;
        }
        else
        {
            return health;
        }
    });
    gml_var_add("event_type*", function(arg0, arg1)
    {
        return event_type;
    });
    gml_var_add("event_number*", function(arg0, arg1)
    {
        return event_number;
    });
    gml_var_add("event_object*", function(arg0, arg1)
    {
        return event_object;
    });
    gml_var_add("event_action*", function(arg0, arg1)
    {
        return event_action;
    });
    gml_var_add("application_surface*", function(arg0, arg1)
    {
        return application_surface;
    });
    gml_var_add("debug_mode*", function(arg0, arg1)
    {
        return debug_mode;
    });
    gml_var_add("font_texture_page_size", function(arg0, arg1)
    {
        if (arg0)
        {
            font_texture_page_size = arg1;
            return undefined;
        }
        else
        {
            return font_texture_page_size;
        }
    });
    gml_var_add("keyboard_key", function(arg0, arg1)
    {
        if (arg0)
        {
            keyboard_key = arg1;
            return undefined;
        }
        else
        {
            return keyboard_key;
        }
    });
    gml_var_add("keyboard_lastkey", function(arg0, arg1)
    {
        if (arg0)
        {
            keyboard_lastkey = arg1;
            return undefined;
        }
        else
        {
            return keyboard_lastkey;
        }
    });
    gml_var_add("keyboard_lastchar", function(arg0, arg1)
    {
        if (arg0)
        {
            keyboard_lastchar = arg1;
            return undefined;
        }
        else
        {
            return keyboard_lastchar;
        }
    });
    gml_var_add("keyboard_string", function(arg0, arg1)
    {
        if (arg0)
        {
            keyboard_string = arg1;
            return undefined;
        }
        else
        {
            return keyboard_string;
        }
    });
    gml_var_add("mouse_x*", function(arg0, arg1)
    {
        return mouse_x;
    });
    gml_var_add("mouse_y*", function(arg0, arg1)
    {
        return mouse_y;
    });
    gml_var_add("mouse_button", function(arg0, arg1)
    {
        if (arg0)
        {
            mouse_button = arg1;
            return undefined;
        }
        else
        {
            return mouse_button;
        }
    });
    gml_var_add("mouse_lastbutton", function(arg0, arg1)
    {
        if (arg0)
        {
            mouse_lastbutton = arg1;
            return undefined;
        }
        else
        {
            return mouse_lastbutton;
        }
    });
    gml_var_add("cursor_sprite", function(arg0, arg1)
    {
        if (arg0)
        {
            cursor_sprite = arg1;
            return undefined;
        }
        else
        {
            return cursor_sprite;
        }
    });
    gml_var_add("background_colour£", function(arg0, arg1)
    {
        if (arg0)
        {
            background_colour = arg1;
            return undefined;
        }
        else
        {
            return background_colour;
        }
    });
    gml_var_add("background_showcolour£", function(arg0, arg1)
    {
        if (arg0)
        {
            background_showcolour = arg1;
            return undefined;
        }
        else
        {
            return background_showcolour;
        }
    });
    gml_var_add("background_color$", function(arg0, arg1)
    {
        if (arg0)
        {
            background_color = arg1;
            return undefined;
        }
        else
        {
            return background_color;
        }
    });
    gml_var_add("background_showcolor$", function(arg0, arg1)
    {
        if (arg0)
        {
            background_showcolor = arg1;
            return undefined;
        }
        else
        {
            return background_showcolor;
        }
    });
    gml_var_add("view_enabled", function(arg0, arg1)
    {
        if (arg0)
        {
            view_enabled = arg1;
            return undefined;
        }
        else
        {
            return view_enabled;
        }
    });
    gml_var_add("view_current*", function(arg0, arg1)
    {
        return view_current;
    });
    gml_var_add("view_visible[]", function(arg0, arg1, arg2)
    {
        if (arg2 < 0 || arg2 > 7)
        {
            return gml_thread_error("Index (" + string(arg2) + ") is out of range [0..7]");
        }
        if (arg0)
        {
            view_visible[arg2] = arg1;
            return undefined;
        }
        else
        {
            return view_visible[arg2];
        }
    });
    gml_var_add("view_xport[]", function(arg0, arg1, arg2)
    {
        if (arg2 < 0 || arg2 > 7)
        {
            return gml_thread_error("Index (" + string(arg2) + ") is out of range [0..7]");
        }
        if (arg0)
        {
            view_xport[arg2] = arg1;
            return undefined;
        }
        else
        {
            return view_xport[arg2];
        }
    });
    gml_var_add("view_yport[]", function(arg0, arg1, arg2)
    {
        if (arg2 < 0 || arg2 > 7)
        {
            return gml_thread_error("Index (" + string(arg2) + ") is out of range [0..7]");
        }
        if (arg0)
        {
            view_yport[arg2] = arg1;
            return undefined;
        }
        else
        {
            return view_yport[arg2];
        }
    });
    gml_var_add("view_wport[]", function(arg0, arg1, arg2)
    {
        if (arg2 < 0 || arg2 > 7)
        {
            return gml_thread_error("Index (" + string(arg2) + ") is out of range [0..7]");
        }
        if (arg0)
        {
            view_wport[arg2] = arg1;
            return undefined;
        }
        else
        {
            return view_wport[arg2];
        }
    });
    gml_var_add("view_hport[]", function(arg0, arg1, arg2)
    {
        if (arg2 < 0 || arg2 > 7)
        {
            return gml_thread_error("Index (" + string(arg2) + ") is out of range [0..7]");
        }
        if (arg0)
        {
            view_hport[arg2] = arg1;
            return undefined;
        }
        else
        {
            return view_hport[arg2];
        }
    });
    gml_var_add("view_surface_id[]", function(arg0, arg1, arg2)
    {
        if (arg2 < 0 || arg2 > 7)
        {
            return gml_thread_error("Index (" + string(arg2) + ") is out of range [0..7]");
        }
        if (arg0)
        {
            view_surface_id[arg2] = arg1;
            return undefined;
        }
        else
        {
            return view_surface_id[arg2];
        }
    });
    gml_var_add("view_camera[]", function(arg0, arg1, arg2)
    {
        if (arg2 < 0 || arg2 > 7)
        {
            return gml_thread_error("Index (" + string(arg2) + ") is out of range [0..7]");
        }
        if (arg0)
        {
            view_camera[arg2] = arg1;
            return undefined;
        }
        else
        {
            return view_camera[arg2];
        }
    });
    gml_var_add("game_id*", function(arg0, arg1)
    {
        return game_id;
    });
    gml_var_add("game_display_name*", function(arg0, arg1)
    {
        return game_display_name;
    });
    gml_var_add("game_project_name*", function(arg0, arg1)
    {
        return game_project_name;
    });
    gml_var_add("game_save_id*", function(arg0, arg1)
    {
        return game_save_id;
    });
    gml_var_add("working_directory*", function(arg0, arg1)
    {
        return working_directory;
    });
    gml_var_add("temp_directory*", function(arg0, arg1)
    {
        return temp_directory;
    });
    gml_var_add("cache_directory*", function(arg0, arg1)
    {
        return cache_directory;
    });
    gml_var_add("program_directory*", function(arg0, arg1)
    {
        return program_directory;
    });
    gml_var_add("browser_width*", function(arg0, arg1)
    {
        return browser_width;
    });
    gml_var_add("browser_height*", function(arg0, arg1)
    {
        return browser_height;
    });
    gml_var_add("os_type*", function(arg0, arg1)
    {
        return 0;
    });
    gml_var_add("os_device*", function(arg0, arg1)
    {
        return os_device;
    });
    gml_var_add("os_browser*", function(arg0, arg1)
    {
        return -1;
    });
    gml_var_add("os_version*", function(arg0, arg1)
    {
        return os_version;
    });
    gml_var_add("display_aa*", function(arg0, arg1)
    {
        return display_aa;
    });
    gml_var_add("async_load*", function(arg0, arg1)
    {
        return async_load;
    });
    gml_var_add("delta_time*", function(arg0, arg1)
    {
        return delta_time;
    });
    gml_var_add("webgl_enabled*", function(arg0, arg1)
    {
        return webgl_enabled;
    });
    gml_var_add("event_data*", function(arg0, arg1)
    {
        return event_data;
    });
}

function live_preinit_api()
{
    live_preinit_init_funcs();
    live_preinit_init_consts();
    live_preinit_init_new_consts();
    live_preinit_init_arrays();
}
