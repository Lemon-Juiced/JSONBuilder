import std.file;
import std.stdio;

/** 
 * JSONRecipeBuilder in D
 *
 * This application takes a directory of files composed of ingredients / specifications stored as plain text and converts it to directory of JSON files.
 * 
 * Authors: LemonJuice
 */
void main(){
    string directoryPath = "/test/text";
    int fileCount = dirEntries(directoryPath).length;
    writeln("Number of files in directory: ", fileCount);
}

/**
 * Creates a new writable file with the given path
 * 
 * Params: path - the path to the file
 * Returns: the file
 */
File createWFile(string path){
    return File(path, "w+");
}

/**
 * Closes the given file
 * 
 * Params: file - the file to close
 */
void fileCloser(File file){
    file.close();
}