# Install script for directory: /home/gismo/GitRepo/phasarTool/external/wise_enum

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/wise_enum" TYPE FILE FILES
    "/home/gismo/GitRepo/phasarTool/external/wise_enum/compact_optional.h"
    "/home/gismo/GitRepo/phasarTool/external/wise_enum/optional.h"
    "/home/gismo/GitRepo/phasarTool/external/wise_enum/optional_common.h"
    "/home/gismo/GitRepo/phasarTool/external/wise_enum/wise_enum.h"
    "/home/gismo/GitRepo/phasarTool/external/wise_enum/wise_enum_detail.h"
    "/home/gismo/GitRepo/phasarTool/external/wise_enum/wise_enum_generated.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/WiseEnum" TYPE FILE FILES
    "/home/gismo/GitRepo/phasarTool/cmake-build-debug/external/wise_enum/generated/WiseEnumConfig.cmake"
    "/home/gismo/GitRepo/phasarTool/cmake-build-debug/external/wise_enum/generated/WiseEnumConfigVersion.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/gismo/GitRepo/phasarTool/cmake-build-debug/external/wise_enum/generated/WiseEnum.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/WiseEnum/WiseEnumTargets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/WiseEnum/WiseEnumTargets.cmake"
         "/home/gismo/GitRepo/phasarTool/cmake-build-debug/external/wise_enum/CMakeFiles/Export/lib/cmake/WiseEnum/WiseEnumTargets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/WiseEnum/WiseEnumTargets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/WiseEnum/WiseEnumTargets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/WiseEnum" TYPE FILE FILES "/home/gismo/GitRepo/phasarTool/cmake-build-debug/external/wise_enum/CMakeFiles/Export/lib/cmake/WiseEnum/WiseEnumTargets.cmake")
endif()

