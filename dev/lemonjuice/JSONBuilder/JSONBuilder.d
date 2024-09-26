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
    string modelsDir = "models/item";
    if (!dirExists(modelsDir)) {
        mkdirRecurse(modelsDir);
    }

    // Generate JSON files for tools
    generateToolModel(namespace, resource, "axe", modelsDir);
    generateToolModel(namespace, resource, "hoe", modelsDir);
    generateToolModel(namespace, resource, "pickaxe", modelsDir);
    generateToolModel(namespace, resource, "shovel", modelsDir);
    generateToolModel(namespace, resource, "sword", modelsDir);

    // Generate JSON files for armor
    generateArmorModels(namespace, resource, "boots", modelsDir);
    generateArmorModels(namespace, resource, "chestplate", modelsDir);
    generateArmorModels(namespace, resource, "helmet", modelsDir);
    generateArmorModels(namespace, resource, "leggings", modelsDir);
}

/**
 * Generates a JSON model for a tool.
 *
 * Params: namespace - the namespace
 *         resource - the resource type (name)
 *         tool_type - the type of tool
 *         modelsDir - the directory to store the models and tools
 */
void generateToolModel(string namespace, string resource, string tool_type, string modelsDir){
    File toolModel = File(modelsDir ~ "/" ~ resource ~ "_" ~ tool_type ~".json", "w");
    toolModel.writeln("{");
    toolModel.writeln("    \"parent\": \"minecraft:item/handheld\",");
    toolModel.writeln("    \"textures\": {");
    toolModel.writeln("        \"layer0\": \"" ~ namespace ~ ":items/" ~ resource ~ "_" ~ tool_type ~"\"");
    toolModel.writeln("    }");
    toolModel.writeln("}");
    toolModel.close();
}

/**
 * Generates a JSON model for armor.
 *
 * Params: namespace - the namespace
 *         resource - the resource type (name)
 *         armor_type - the type of armor
 *         modelsArmorDir - the directory to store the models and armor
 */
void generateArmorModels(string namespace, string resource, string armor_type, string modelsArmorDir){
    File armorModel = File(modelsArmorDir ~ "/" ~ resource ~ "_" ~ armor_type ~".json", "w");
    armorModel.writeln("{");
    armorModel.writeln("    \"parent\": \"minecraft:item/generated\",");
    armorModel.writeln("    \"overrides\": [");
    armorModel.writeln("        {");
    armorModel.writeln("            \"model\": \"" ~ namespace ~ ":item/" ~ resource ~ "_" ~ armor_type ~ "_quartz_trim\",");
    armorModel.writeln("            \"predicate\": {");
    armorModel.writeln("                \"trim_type\": 0.1");
    armorModel.writeln("            }");
    armorModel.writeln("        },");
    armorModel.writeln("        {");
    armorModel.writeln("            \"model\": \"" ~ namespace ~ ":item/" ~ resource ~ "_" ~ armor_type ~ "_iron_trim\",");
    armorModel.writeln("            \"predicate\": {");
    armorModel.writeln("                \"trim_type\": 0.2");
    armorModel.writeln("            }");
    armorModel.writeln("        },");
    armorModel.writeln("        {");
    armorModel.writeln("            \"model\": \"" ~ namespace ~ ":item/" ~ resource ~ "_" ~ armor_type ~ "_netherite_trim\",");
    armorModel.writeln("            \"predicate\": {");
    armorModel.writeln("                \"trim_type\": 0.3");
    armorModel.writeln("            }");
    armorModel.writeln("        },");
    armorModel.writeln("        {");
    armorModel.writeln("            \"model\": \"" ~ namespace ~ ":item/" ~ resource ~ "_" ~ armor_type ~ "_redstone_trim\",");
    armorModel.writeln("            \"predicate\": {");
    armorModel.writeln("                \"trim_type\": 0.4");
    armorModel.writeln("            }");
    armorModel.writeln("        },");
    armorModel.writeln("        {");
    armorModel.writeln("            \"model\": \"" ~ namespace ~ ":item/" ~ resource ~ "_" ~ armor_type ~ "_copper_trim\",");
    armorModel.writeln("            \"predicate\": {");
    armorModel.writeln("                \"trim_type\": 0.5");
    armorModel.writeln("            }");
    armorModel.writeln("        },");
    armorModel.writeln("        {");
    armorModel.writeln("            \"model\": \"" ~ namespace ~ ":item/" ~ resource ~ "_" ~ armor_type ~ "_gold_trim\",");
    armorModel.writeln("            \"predicate\": {");
    armorModel.writeln("                \"trim_type\": 0.6");
    armorModel.writeln("            }");
    armorModel.writeln("        },");
    armorModel.writeln("        {");
    armorModel.writeln("            \"model\": \"" ~ namespace ~ ":item/" ~ resource ~ "_" ~ armor_type ~ "_emerald_trim\",");
    armorModel.writeln("            \"predicate\": {");
    armorModel.writeln("                \"trim_type\": 0.7");
    armorModel.writeln("            }");
    armorModel.writeln("        },");
    armorModel.writeln("        {");
    armorModel.writeln("            \"model\": \"" ~ namespace ~ ":item/" ~ resource ~ "_" ~ armor_type ~ "_diamond_trim\",");
    armorModel.writeln("            \"predicate\": {");
    armorModel.writeln("                \"trim_type\": 0.8");
    armorModel.writeln("            }");
    armorModel.writeln("        },");
    armorModel.writeln("        {");
    armorModel.writeln("            \"model\": \"" ~ namespace ~ ":item/" ~ resource ~ "_" ~ armor_type ~ "_lapis_trim\",");
    armorModel.writeln("            \"predicate\": {");
    armorModel.writeln("                \"trim_type\": 0.9");
    armorModel.writeln("            }");
    armorModel.writeln("        },");
    armorModel.writeln("        {");
    armorModel.writeln("            \"model\": \"" ~ namespace ~ ":item/" ~ resource ~ "_" ~ armor_type ~ "_amethyst_trim\",");
    armorModel.writeln("            \"predicate\": {");
    armorModel.writeln("                \"trim_type\": 1.0");
    armorModel.writeln("            }");
    armorModel.writeln("        }");
    armorModel.writeln("    ],");
    armorModel.writeln("    \"textures\": {");
    armorModel.writeln("        \"layer0\": \"" ~ namespace ~ ":items/" ~ resource ~ "_" ~ armor_type ~"\"");
    armorModel.writeln("    }");
    armorModel.writeln("}");
    armorModel.close();

    string[] trims = ["amethyst", "copper", "diamond", "emerald", "gold", "iron", "lapis", "netherite", "quartz", "redstone"];
    for (int i = 0; i < trims.length; i++) {
        string trim = trims[i];
        File trimModel = File(modelsArmorDir ~ "/" ~ resource ~ "_" ~ armor_type ~ "_" ~ trim ~ "_trim.json", "w");
        trimModel.writeln("{");
        trimModel.writeln("    \"parent\": \"minecraft:item/generated\",");
        trimModel.writeln("    \"textures\": {");
        trimModel.writeln("        \"layer0\": \"" ~ namespace ~ ":items/" ~ resource ~ "_" ~ armor_type ~ "\",");
        trimModel.writeln("        \"layer1\": \"" ~ namespace ~ ":trims/items/" ~ armor_type ~ "_trim_" ~ trim ~ "\"");
        trimModel.writeln("    }");
        trimModel.writeln("}");
        trimModel.close();
    }
}