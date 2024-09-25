import std.file;
import std.stdio;
import std.string;

/** 
 * JSONBuilder is an application that takes a command line argument containg a namespace and name of a resource.
 * It then reads the reads the arguments and writes the data to several JSON files.
 * These JSON files are for Minecraft models, for a set of tools and armor.
 *
 * The command line arguments are as follows:
 * make
 * ./JSONBuilder(.exe) <namespace> <resource_name>
 * 
 * Authors: LemonJuice
 */
void main(string[] args) {
    if (args.length != 3) { 
        version(Windows) {
            writeln("Usage: ./JSONBuilder.exe <namespace> <resource_name>");
        } else {
            writeln("Usage: ./JSONBuilder <namespace> <resource_name>");
        }
        return;
    }

    string namespace = args[1];
    string resource = args[2];

    // Generate JSON files
    generateToolsJSON(namespace, resource);

    //if (generateArmor) generateArmorJSON(namespace, resource);
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
 */
void generateToolsJSON(string namespace, string resource){
    // Create an output directory: "models/item"
    string modelsToolsDir = "models/item";
    if (!dirExists(modelsToolsDir)) {
        mkdirRecurse(modelsToolsDir);
    }

    // Generate JSON files for tools
    generateToolModel(namespace, resource, "axe", modelsToolsDir);
    generateToolModel(namespace, resource, "hoe", modelsToolsDir);
    generateToolModel(namespace, resource, "pickaxe", modelsToolsDir);
    generateToolModel(namespace, resource, "shovel", modelsToolsDir);
    generateToolModel(namespace, resource, "sword", modelsToolsDir);

    // Generate JSON files for armor
}

/**
 * Generates a JSON model for a tool.
 *
 * Params: namespace - the namespace
 *         resource - the resource type (name)
 *         tool_type - the type of tool
 *         modelsToolsDir - the directory to store the models and tools
 */
void generateToolModel(string namespace, string resource, string tool_type, string modelsToolsDir){
    File swordModel = File(modelsToolsDir ~ "/" ~ resource ~ "_" ~ tool_type ~".json", "w");
    swordModel.writeln("{");
    swordModel.writeln("    \"parent\": \"item/handheld\",");
    swordModel.writeln("    \"textures\": {");
    swordModel.writeln("        \"layer0\": \"" ~ namespace ~ ":items/" ~ resource ~ "_" ~ tool_type ~"\"");
    swordModel.writeln("    }");
    swordModel.writeln("}");
    swordModel.close();
}