# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.15

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/gismo/.local/share/JetBrains/Toolbox/apps/CLion/ch-0/192.6817.32/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /home/gismo/.local/share/JetBrains/Toolbox/apps/CLion/ch-0/192.6817.32/bin/cmake/linux/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/gismo/GitRepo/phasarTool

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/gismo/GitRepo/phasarTool/cmake-build-debug

# Utility rule file for NightlyCoverage.

# Include the progress variables for this target.
include external/json/CMakeFiles/NightlyCoverage.dir/progress.make

external/json/CMakeFiles/NightlyCoverage:
	cd /home/gismo/GitRepo/phasarTool/cmake-build-debug/external/json && /home/gismo/.local/share/JetBrains/Toolbox/apps/CLion/ch-0/192.6817.32/bin/cmake/linux/bin/ctest -D NightlyCoverage

NightlyCoverage: external/json/CMakeFiles/NightlyCoverage
NightlyCoverage: external/json/CMakeFiles/NightlyCoverage.dir/build.make

.PHONY : NightlyCoverage

# Rule to build all files generated by this target.
external/json/CMakeFiles/NightlyCoverage.dir/build: NightlyCoverage

.PHONY : external/json/CMakeFiles/NightlyCoverage.dir/build

external/json/CMakeFiles/NightlyCoverage.dir/clean:
	cd /home/gismo/GitRepo/phasarTool/cmake-build-debug/external/json && $(CMAKE_COMMAND) -P CMakeFiles/NightlyCoverage.dir/cmake_clean.cmake
.PHONY : external/json/CMakeFiles/NightlyCoverage.dir/clean

external/json/CMakeFiles/NightlyCoverage.dir/depend:
	cd /home/gismo/GitRepo/phasarTool/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/gismo/GitRepo/phasarTool /home/gismo/GitRepo/phasarTool/external/json /home/gismo/GitRepo/phasarTool/cmake-build-debug /home/gismo/GitRepo/phasarTool/cmake-build-debug/external/json /home/gismo/GitRepo/phasarTool/cmake-build-debug/external/json/CMakeFiles/NightlyCoverage.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : external/json/CMakeFiles/NightlyCoverage.dir/depend

