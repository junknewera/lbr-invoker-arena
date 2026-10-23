// Imports src/*.gml and tests/*.gml as global scripts for the headless test run (cwd must be ~/lbr-mod).
using System.IO;
using System.Linq;
using UndertaleModLib.Compiler;

EnsureDataLoaded();

string root = Directory.GetCurrentDirectory();
CodeImportGroup importGroup = new(Data);
foreach (string dir in new[] { "src", "tests" })
{
    foreach (string file in Directory.GetFiles(Path.Combine(root, dir), "*.gml").OrderBy(f => f))
    {
        importGroup.QueueReplace("gml_GlobalScript_" + Path.GetFileNameWithoutExtension(file), File.ReadAllText(file));
    }
}
importGroup.Import();
