cmake_minimum_required(VERSION 3.16)
project(Notepad VERSION 0.1 LANGUAGES CXX)
set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

# Create executable
qt_add_executable(appNotepad
    main.cpp
    readfile.h
    readfile.cpp
)

# Add QML files and resources the traditional way
qt_add_resources(appNotepad "qml_files"
    PREFIX "/"
    FILES
        Main.qml
        ConstantType.qml
        FindAndReplacePopUp.qml
        NewTab.qml
        PopUpDialog.qml
        windowFunctions.js
)

# Add image resources
qt_add_resources(appNotepad "images"
    PREFIX "/"
    FILES
        Images.qrc cancel.png file.png leftarrow.png rightarrow.png
)

set_target_properties(appNotepad PROPERTIES
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appNotepad
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appNotepad
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
