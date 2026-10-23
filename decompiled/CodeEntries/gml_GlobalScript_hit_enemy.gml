function hit_enemy(arg0, arg1)
{
    with (arg0)
    {
        if (quark_shield > 0)
        {
            quark_shield -= enemy.get_final_quark_damage(arg1);
        }
        else
        {
            arg1 = enemy.get_final_damage(arg1);
            hp -= max(0, arg1);
            hp = max(0, hp);
            hit_fx = sec(0.1);
            enemy.update_hp(hp);
        }
    }
}
