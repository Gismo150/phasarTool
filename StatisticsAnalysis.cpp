
#include <iostream>

#include <phasar/DB/ProjectIRDB.h>
#include <phasar/PhasarLLVM/Passes/GeneralStatisticsPass.h>
#include <phasar/Utils/Logger.h>
#include <boost/filesystem.hpp>



namespace bpo = boost::program_options;

using namespace std;
using namespace psr;
using json = nlohmann::json;

std::string getFileName (const std::string& str)
{
    std::size_t found = str.find_last_of("/");
    return str.substr(found+1);
}
/**
 * Collects the analysis results and stores them into the a Json object, that is then appended to the Results.json array.
 * @param GSP Reference to the anlyser.
 * @param outerJsonArray The Json array storing all the results.
 * @param module Reference to the LLVM module.
 */
void appendModuleResult(GeneralStatisticsPass *GSP, json &outerJsonArray, llvm::Module &module) {
    json o;
    o["Source Filename"] = module.getSourceFileName();
    o["Module Name"] = getFileName(module.getName().str());
    o["Allocated Types"] = GSP->getAllocatedTypes().size();
    o["Allocated Sites"] = GSP->getAllocationsites();
    o["Basic Blocks"] = GSP->getBasicBlocks();
    o["Call Sites"] = GSP->getFunctioncalls(); // Call sites = how often is a function called?
    o["Functions"] = GSP->getFunctions(); // functions = how many functions do we have?
    o["Globals"] = GSP->getGlobals();
    o["Global Pointer"] = GSP->getGlobalPointers();
    o["Instructions"] = GSP->getInstructions();
    o["Memory Intrinsics"] = GSP->getMemoryIntrinsics();
    o["Store Instructions"] = GSP->getStoreInstructions();

    std::cout << "ANALYSIS SUMMARY FOR MODULE:" <<  module.getName().str() << "\n";
    std::cout << o.dump(0) << std::endl;
    outerJsonArray.push_back(o);
}

/**
 * Checks if results.json file exists. If not return empty array. Otherwise read in the existing json array.
 * @param outerJsonArray
 * @return A Json Array.
 */
void readResultsJson(json &outerJsonArray, string path) {
    if ( !boost::filesystem::exists( path ) ) //check if file exists
    {
        outerJsonArray = json::array(); // if not, create empty json array
    } else {
        std::ifstream i(path); // else read existing file
        i >> outerJsonArray;
    }
}

/**
 * Writes the complete analysis result into the results.json array to the provieded path.
 * @param outerJsonArray
 */
void writeResultsJson(json &outerJsonArray, string path) {
    std::ofstream o(path);
    o << outerJsonArray;
}

int main(int argc, const char **argv) {

    initializeLogger(false);
    auto &lg = lg::get();
    if (argc < 3 || !bfs::exists(argv[1]) || bfs::is_directory(argv[1]) || !bfs::exists(argv[2])) {
        std::cerr << "usage: <prog><ir file><path to results.json file>\n";
        if(!bfs::exists(argv[1])) {
            std::cerr << argv[1] << " IS NOT AN EXISTING FILE\n";
        }
        if(!bfs::exists(argv[2])) {
            std::cerr << argv[2] << " IS NOT AN EXISTING DIR\n";
        }

        return 1;
    }

    //----------------INITIALIZATION---------------------//
    std::string path = argv[2];
    path += "/results.json";
    std::cout << "Writing results to: "<< path << "\n";

    GeneralStatisticsPass *GSP = new GeneralStatisticsPass();
    json outerJsonArray;
    readResultsJson(outerJsonArray, path);

    ProjectIRDB DB({argv[1]}, IRDBOptions::NONE);
    //----------------END INITIALIZATION---------------------//

    //DB.preprocessIR(); <- this function is causing a lot of memory consumption on runtime, possibly memory leak?
    std::set<llvm::Module *> moduleSet =  DB.getAllModules();

    //Run the analysis for each module found within the .ll file.
    std::cout << "IR File contains " << moduleSet.size() << " Module(s)\n";
    for(auto module: moduleSet){
        std::cout << "Starting to analyse module: " << module->getName().str() << "\n";
        GSP->runOnModule(*module);
        GSP->doFinalization(*module);

        appendModuleResult(GSP, outerJsonArray, *module);

    }
    writeResultsJson(outerJsonArray, path);
    std::cout << "Analysis finished.\n";
    return 0;
}
