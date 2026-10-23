function init_riddles()
{
    global.riddles_array = [
    {
        riddle_id: "1",
        text: __("There is this riddle I have been trying to solve my whole life long.\n\nThe riddle says: 11!!\n\nI have already tried to fold it but to no avail..."),
        digits_only: true,
        gems: 10,
        solution: global.texts.pub_lore_text_riddle,
        solution_text_add: __("It seems like you can also decipher some lore now."),
        
        solve_func: function()
        {
            o_game.data.stats.pub_lore_text_riddle_solved = true;
        }
    }, 
    {
        riddle_id: "2",
        text: __("I am full of holes; I can hold water. What am I?"),
        solution: "sponge"
    }, 
    {
        riddle_id: "3",
        text: __("Which word in the dictionary is always spelled incorrectly?"),
        solution: "incorrectly"
    }, 
    {
        riddle_id: "4",
        text: __s("Where do you first find %s?", global.resources.cosmic.name_plural),
        solution: "space"
    }, 
    {
        riddle_id: "5",
        text: __("I am an odd number. Take away a letter and I become even. What number am I?"),
        solution: ["seven", "7"]
    }, 
    {
        riddle_id: "6",
        text: __("You measure my life in hours, and I serve you by expiring. I'm quick when I'm thin and slow when I'm fat. The wind is my enemy."),
        solution: "candle"
    }, 
    {
        riddle_id: "7",
        text: __("I'm stuck in a corner but I can travel all around the world. What am I?"),
        solution: "stamp"
    }, 
    {
        riddle_id: "8",
        text: __("Some leaves like it hot, some like it cold. Which one likes it both?"),
        solution: "obsidian"
    }, 
    {
        riddle_id: "9",
        text: __("What has to be broken before you can use it?"),
        solution: "egg"
    }, 
    {
        riddle_id: "10",
        text: __("What goes up but never comes down?"),
        solution: "age"
    }, 
    {
        riddle_id: "11",
        text: __("I have branches, but no fruit, trunk or leaves. What am I?"),
        solution: "bank"
    }, 
    {
        riddle_id: "12",
        text: __("What can't talk but will reply when spoken to?"),
        solution: "echo"
    }, 
    {
        riddle_id: "13",
        text: __("What building has the most stories?"),
        solution: ["library", "libraries"]
    }, 
    {
        riddle_id: "14",
        text: __("If you throw a blue stone into the Red Sea, what will it become?"),
        solution: "wet"
    }, 
    {
        riddle_id: "15",
        text: __("What has a face and two hands but no arms or legs?"),
        solution: "clock"
    }, 
    {
        riddle_id: "16",
        text: __("What can fill a room but takes up no space?"),
        solution: "light"
    }];
}
