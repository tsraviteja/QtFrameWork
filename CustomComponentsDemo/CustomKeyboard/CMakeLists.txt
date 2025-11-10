# CMake Version & Project
cmake_minimum_required(VERSION 3.28)
project(Keyboard VERSION 0.1)

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

# Include the UI module in the build
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../../UI ${CMAKE_BINARY_DIR}/UI)

# Define sources and headers
set(SOURCES
    src/main.cpp
)

# QML resources
qt_add_resources(QML_RESOURCES
    src/qml.qrc
)

# Create executable target
qt_add_executable(keyboard
    ${SOURCES}
    ${QML_RESOURCES}
)

# Link Qt libraries
target_link_libraries(keyboard PRIVATE Qt6::Core Qt6::Quick UIResources)
