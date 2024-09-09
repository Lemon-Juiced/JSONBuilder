import std.file;
import std.stdio;
import std.string;
import dev.lemonjuice.JSONBuilder.ToolModelGenerator;

/** 
 * JSONBuilder in D
 *
 * This application takes user input and generates JSON files for Minecraft models and recipes.
 * It has a few presets that can be selected to generate several different kinds of JSON files for Minecraft models and recipes.
 * 
 * Authors: LemonJuice
 */
void main(){
    // Get user input
    write("Enter the namespace: ");
    string namespace = strip(readln());
    
    write("Enter the resource type (name): ");
    string resource = strip(readln());
    
    bool isItem;
    while (true){
        write("Is this an item or tag? (i/t): ");
        string itemType = strip(readln());
        if (itemType == "i"){
            isItem = true;
            break;
        } else if (itemType == "t"){
            isItem = false;
            break;
        } else {
            writeln("Invalid input. Please enter 'i' for item or 't' for tag.");
        }
    }

    bool generateTools;
    while (true){
        write("Generate tools? (y/n): ");
        string generate = strip(readln());
        if (generate == "y"){
            generateTools = true;
            break;
        } else if (generate == "n"){
            generateTools = false;
            break;
        } else {
            writeln("Invalid input. Please enter 'y' for yes or 'n' for no.");
        }
    }

    bool generateArmor;
    while (true){
        write("Generate armor? (y/n): ");
        string generate = strip(readln());
        if (generate == "y"){
            generateArmor = true;
            break;
        } else if (generate == "n"){
            generateArmor = false;
            break;
        } else {
            writeln("Invalid input. Please enter 'y' for yes or 'n' for no.");
        }
    }

    bool generateModels;
    while (true){
        write("Generate models? (y/n): ");
        string generate = strip(readln());
        if (generate == "y"){
            generateModels = true;
            break;
        } else if (generate == "n"){
            generateModels = false;
            break;
        } else {
            writeln("Invalid input. Please enter 'y' for yes or 'n' for no.");
        }
    }

    bool generateRecipes;
    while (true){
        write("Generate recipes? (y/n): ");
        string generate = strip(readln());
        if (generate == "y"){
            generateRecipes = true;
            break;
        } else if (generate == "n"){
            generateRecipes = false;
            break;
        } else {
            writeln("Invalid input. Please enter 'y' for yes or 'n' for no.");
        }
    }

    // Generate JSON files
    if (generateTools) generateToolsJSON(namespace, resource, isItem, generateModels, generateRecipes);
    //if (generateArmor) generateArmorJSON(namespace, resource, isItem, generateModels, generateRecipes);
}

/** 
 * Checks if a directory exists
 * 
 * Params: path - the path to the directory
 * Returns: true if the directory exists, false otherwise
 */
bool dirExists(string path) {
    return exists(path) && isDir(path);
}

/**
 * Generates JSON files for tools
 * 
 * Params: namespace - the namespace
 *         resource - the resource type (name)
 *         isItem - whether the resource is an item or tag
 *         generateModels - whether to generate models
 *         generateRecipes - whether to generate recipes
 */
void generateToolsJSON(string namespace, string resource, bool isItem, bool generateModels, bool generateRecipes){
    // Create the tools directory in the models/item folder
    string modelsToolsDir = "assets/" ~ namespace ~ "/models/item/tools";
    if (!dirExists(modelsToolsDir)) {
        mkdir(modelsToolsDir);
        generateSwordModel(namespace, resource, isItem, modelsToolsDir);
        generatePickaxeModel(namespace, resource, isItem, modelsToolsDir);
        generateAxeModel(namespace, resource, isItem, modelsToolsDir);
        generateShovelModel(namespace, resource, isItem, modelsToolsDir);
        generateHoeModel(namespace, resource, isItem, modelsToolsDir);
    }

    // Create the tools directory in the recipes/tools folder
    string recipesToolsDir = "assets/" ~ namespace ~ "/recipes/tools";
    if (!dirExists(recipesToolsDir)) {
        mkdir(recipesToolsDir);
    }
}