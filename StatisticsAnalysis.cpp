
#include <iostream>

#include <phasar/DB/ProjectIRDB.h>
#include <phasar/PhasarLLVM/Passes/GeneralStatisticsPass.h>
#include <phasar/Utils/Logger.h>



namespace bpo = boost::program_options;

using namespace std;
using namespace psr;

int main(int argc, const char **argv) {
    initializeLogger(false);
    auto &lg = lg::get();
    if (argc < 2 || !bfs::exists(argv[1]) || bfs::is_directory(argv[1])) {
        std::cerr << "usage: <prog><ir file>\n";
        if(!bfs::is_directory(argv[1])) {
            std::cerr << "ARGUMENT IS NOT A DIR\n";
        }
        return 1;
    }

    initializeLogger(false);
    ProjectIRDB DB({argv[1]}, IRDBOptions::WPA);
    DB.preprocessIR();

    std::set<llvm::Module *> moduleSet =  DB.getAllModules();

    std::cout << "IR File contains " << moduleSet.size() << " Modules\n";

    for(auto module: moduleSet){
        std::cout << "Starting to analyse module: " << module->getName().str() << "\n";

        GeneralStatisticsPass().doInitialization(*module);
        GeneralStatisticsPass().doFinalization(*module);
    }

    std:cout << "Analysis finished.\n";
    return 0;
}
