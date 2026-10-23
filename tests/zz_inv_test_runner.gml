// Runs every registered test at startup and writes the results file; the harness kills the runner on "DONE".
// After that the build spins forever so LBR's own startup (which reads and writes the save folder) never runs:
// on Windows the test build shares the real save folder.
try
{
    inv_core_tests_register();
    inv_world_tests_register();
    inv_world_b_tests_register();
    inv_test_run_all("lbr_mod_test_results.txt");
}
catch (_e)
{
    inv_test_write_lines("lbr_mod_test_results.txt", ["CRASH " + inv_test_error_text(_e), "DONE passed=0 failed=1"]);
}

while (true)
{
}
