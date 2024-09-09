module dev.lemonjuice.JSONBuilder.ToolModelGenerator;

import std.stdio;

/**
 * Generates a JSON model for a sword.
 *
 * Params: namespace - the namespace
 *         resource - the resource type (name)
 *         isItem - whether the resource is an item or tag
 *         modelsToolsDir - the directory to store the models and tools
 */
void generateSwordModel(string namespace, string resource, bool isItem, string modelsToolsDir){
    File swordModel = File(modelsToolsDir ~ "/" ~ resource ~ "_sword.json", "w");
    swordModel.writeln("{");
    swordModel.writeln("    \"parent\": \"item/handheld\",");
    swordModel.writeln("    \"textures\": {");
    swordModel.writeln("        \"layer0\": \"" ~ namespace ~ ":items/" ~ resource ~ "_sword\"");
    swordModel.writeln("    }");
    swordModel.writeln("}");
    swordModel.close();
}

/**
 * Generates a JSON model for a pickaxe.
 *
 * Params: namespace - the namespace
 *         resource - the resource type (name)
 *         isItem - whether the resource is an item or tag
 *         modelsToolsDir - the directory to store the models and tools
 */
void generatePickaxeModel(string namespace, string resource, bool isItem, string modelsToolsDir){
    File pickaxeModel = File(modelsToolsDir ~ "/" ~ resource ~ "_pickaxe.json", "w");
    pickaxeModel.writeln("{");
    pickaxeModel.writeln("    \"parent\": \"item/handheld\",");
    pickaxeModel.writeln("    \"textures\": {");
    pickaxeModel.writeln("        \"layer0\": \"" ~ namespace ~ ":items/" ~ resource ~ "_pickaxe\"");
    pickaxeModel.writeln("    }");
    pickaxeModel.writeln("}");
    pickaxeModel.close();
}

/**
 * Generates a JSON model for an axe.
 *
 * Params: namespace - the namespace
 *         resource - the resource type (name)
 *         isItem - whether the resource is an item or tag
 *         modelsToolsDir - the directory to store the models and tools
 */
void generateAxeModel(string namespace, string resource, bool isItem, string modelsToolsDir){
    File pickaxeModel = File(modelsToolsDir ~ "/" ~ resource ~ "_axe.json", "w");
    pickaxeModel.writeln("{");
    pickaxeModel.writeln("    \"parent\": \"item/handheld\",");
    pickaxeModel.writeln("    \"textures\": {");
    pickaxeModel.writeln("        \"layer0\": \"" ~ namespace ~ ":items/" ~ resource ~ "_axe\"");
    pickaxeModel.writeln("    }");
    pickaxeModel.writeln("}");
    pickaxeModel.close();
}

/**
 * Generates a JSON model for a shovel.
 *
 * Params: namespace - the namespace
 *         resource - the resource type (name)
 *         isItem - whether the resource is an item or tag
 *         modelsToolsDir - the directory to store the models and tools
 */
void generateShovelModel(string namespace, string resource, bool isItem, string modelsToolsDir){
    File shovelModel = File(modelsToolsDir ~ "/" ~ resource ~ "_shovel.json", "w");
    shovelModel.writeln("{");
    shovelModel.writeln("    \"parent\": \"item/handheld\",");
    shovelModel.writeln("    \"textures\": {");
    shovelModel.writeln("        \"layer0\": \"" ~ namespace ~ ":items/" ~ resource ~ "_shovel\"");
    shovelModel.writeln("    }");
    shovelModel.writeln("}");
    shovelModel.close();
}

/**
 * Generates a JSON model for a hoe.
 *
 * Params: namespace - the namespace
 *         resource - the resource type (name)
 *         isItem - whether the resource is an item or tag
 *         modelsToolsDir - the directory to store the models and tools
 */
void generateHoeModel(string namespace, string resource, bool isItem, string modelsToolsDir){
    File hoeModel = File(modelsToolsDir ~ "/" ~ resource ~ "_hoe.json", "w");
    hoeModel.writeln("{");
    hoeModel.writeln("    \"parent\": \"item/handheld\",");
    hoeModel.writeln("    \"textures\": {");
    hoeModel.writeln("        \"layer0\": \"" ~ namespace ~ ":items/" ~ resource ~ "_hoe\"");
    hoeModel.writeln("    }");
    hoeModel.writeln("}");
    hoeModel.close();      
}