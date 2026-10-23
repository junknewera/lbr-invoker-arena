function check_spawn_comm_leaf()
{
    var ur = random(100);
    if (ur > 0.005 || !can_spawn_comm_leaf())
    {
        exit;
    }
    spawn_random_comm_leaf();
}
