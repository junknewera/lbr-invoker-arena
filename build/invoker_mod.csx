// Builds the Invoker Arena mod into the loaded LBR data (cwd must be ~/lbr-mod):
// creates o_invoker_arena, imports src/ and mod/ GML, and patches the LBR events that would fight the arena for input.
using System.IO;
using System.Linq;
using UndertaleModLib.Models;
using UndertaleModLib.Compiler;

EnsureDataLoaded();

string root = Directory.GetCurrentDirectory();

// The object must exist before scripts referring to it are compiled.
if (Data.GameObjects.ByName("o_invoker_arena") is null)
{
    Data.GameObjects.Add(new UndertaleGameObject()
    {
        Name = Data.Strings.MakeString("o_invoker_arena"),
        Visible = true,
        Persistent = false
    });
}

CodeImportGroup importGroup = new(Data) { AutoCreateAssets = true };
foreach (string dir in new[] { "src", "mod" })
{
    foreach (string file in Directory.GetFiles(Path.Combine(root, dir), "*.gml").OrderBy(f => f))
    {
        importGroup.QueueReplace("gml_GlobalScript_" + Path.GetFileNameWithoutExtension(file), File.ReadAllText(file));
    }
}
foreach (string file in Directory.GetFiles(Path.Combine(root, "mod", "objects"), "*.gml").OrderBy(f => f))
{
    importGroup.QueueReplace(Path.GetFileNameWithoutExtension(file), File.ReadAllText(file));
}

const string ExitInArena = "if (inv_arena_active())\n{\n    exit;\n}";
importGroup.QueuePrepend("gml_Object_o_game_Step_0", "inv_arena_check_toggle();");
importGroup.QueuePrepend("gml_Object_o_init_Draw_64", "inv_arena_autotest_title();");
importGroup.QueuePrepend("gml_Object_o_shop_KeyPress_1", ExitInArena);
importGroup.QueuePrepend("gml_Object_o_blower_Mouse_53", ExitInArena);
importGroup.QueuePrepend("gml_Object_o_blower_Mouse_54", ExitInArena);
importGroup.QueuePrepend("gml_Object_o_blower_Draw_0", ExitInArena);
importGroup.Import();
