function destroy_unit_instances(arg0 = false)
{
    instance_destroy(o_artifact);
    instance_destroy(o_autoblower);
    instance_destroy(o_blower);
    instance_destroy(o_borb);
    instance_destroy(o_enemy);
    instance_destroy(o_equipment_item);
    instance_destroy(o_fx_draw_controller);
    instance_destroy(o_fruit);
    instance_destroy(o_game_instance);
    instance_destroy(o_intro_text);
    instance_destroy(o_mouse);
    instance_destroy(o_npc);
    instance_destroy(o_pet);
    instance_destroy(o_seed);
    instance_destroy(o_shadows);
    instance_destroy(o_tooltip);
    instance_destroy(o_trees);
    if (arg0)
    {
        instance_destroy(o_collectable_item);
    }
    with (o_collectable_resource)
    {
        destroy(arg0);
    }
    instance_destroy(o_deco);
    instance_destroy(o_house_grid);
    instance_destroy(o_house_item);
    instance_destroy(o_house_item_build);
    destroy_leaves();
}
