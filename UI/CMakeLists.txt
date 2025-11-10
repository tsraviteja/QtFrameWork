
# CMake Version & Project
cmake_minimum_required(VERSION 3.28)
project(UIResources VERSION 0.1)

# Set the Qt include directory using CMAKE_PREFIX_PATH
list(APPEND CMAKE_PREFIX_PATH "$ENV{HOME}/Qt/6.10.0/gcc_64/lib/cmake")

# Enable automatic MOC, RCC, and UIC for Qt
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

# Enforce C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Find Qt6 components
find_package(Qt6 6.2 COMPONENTS Quick Core REQUIRED)

qt_add_resources(UI_RESOURCES 
                 qml.qrc)

# Build library with resources
add_library(UIResources STATIC ${UI_RESOURCES})

target_include_directories(UIResources PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
