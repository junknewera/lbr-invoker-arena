log("test created");
skillNodeRadius = 20;
skillX = 200;
skillY = 100;
skillGapX = 150;
skillGapY = 100;
skillTree = ds_map_create();
ds_map_set(skillTree, "Skill1", ds_list_create());
ds_map_set(skillTree, "Skill2", ds_list_create());
ds_map_set(skillTree, "Skill3", ds_list_create());
ds_list_add(ds_map_find_value(skillTree, "Skill1"), "Skill2");
ds_list_add(ds_map_find_value(skillTree, "Skill1"), "Skill3");

draw_skill_node = function(arg0, arg1, arg2)
{
    draw_circle(arg0, arg1, skillNodeRadius, false);
    draw_text(arg0 - (string_width(arg2) / 2), arg1 - (string_height(arg2) / 2), arg2);
};

draw_skill_nodes = function(arg0, arg1, arg2)
{
    draw_skill_node(arg1, arg2, arg0);
    var connectedSkills = ds_map_find_value(skillTree, arg0);
    if (connectedSkills != undefined)
    {
        for (var i = 0; i < ds_list_size(connectedSkills); i++)
        {
            var connectedSkillName = ds_list_find_value(connectedSkills, i);
            var newX = arg1 + (skillGapX * (i - ((ds_list_size(connectedSkills) - 1) / 2)));
            var newY = arg2 + skillGapY;
            draw_skill_nodes(connectedSkillName, newX, newY);
            draw_line_width(arg1, arg2 + skillNodeRadius, newX, newY - skillNodeRadius, 2);
        }
    }
};
