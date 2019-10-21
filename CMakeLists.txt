cmake_minimum_required(VERSION 3.15)
project(StatisticsAnalysis)
set(CMAKE_CXX_STANDARD 14)

# JSON library
option(JSON_BuildTests OFF)
add_subdirectory(external/json EXCLUDE_FROM_ALL)
include_directories(external/json/single_include/nlohmann)

# wise enum
add_subdirectory(external/wise_enum)
include_directories(external/wise_enum)

# Boost
find_package(Boost COMPONENTS filesystem graph system program_options log thread REQUIRED)
include_directories(${BOOST_INCLUDE_DIR})
add_definitions(-DBOOST_LOG_DYN_LINK)

# LLVM
find_package(LLVM REQUIRED CONFIG 8)
find_library(LLVM_LIBRARY NAMES llvm REQUIRED)
include_directories(${LLVM_INCLUDE_DIRS})
link_directories(${LLVM_LIB_PATH} ${LLVM_LIBRARY_DIRS})

llvm_map_components_to_libnames(llvm_libs
        coverage
        coroutines
        libdriver
        lto
        support
        analysis
        bitwriter
        core
        ipo
        irreader
        instcombine
        instrumentation
        linker
        objcarcopts
        scalaropts
        transformutils
        codegen
        vectorize
        )

add_executable(StatisticsAnalysis StatisticsAnalysis.cpp)

target_link_libraries(StatisticsAnalysis
        phasar_config
        phasar_controller
        phasar_db
        phasar_experimental
        phasar_clang
        phasar_controlflow
        phasar_ifdside
        phasar_mono
        phasar_passes
        ${PHASAR_PLUGINS_LIB}
        phasar_pointer
        phasar_phasarllvm_utils
        phasar_utils
        boost_program_options
        boost_filesystem
        boost_graph
        boost_system
        boost_log
        ${BOOST_THREAD}
        ${Boost_LIBRARIES}
        ${CMAKE_DL_LIBS}
        ${CMAKE_THREAD_LIBS_INIT}
        ${CLANG_LIBRARIES}
        ${llvm_libs}
        )