find_package(Qt5 REQUIRED COMPONENTS Core Widgets Gui)
set(CMAKE_AUTOMOC ON)
# qt_standard_project_setup() # qt6
target_link_libraries(${APP} PRIVATE Qt5::Core Qt5::Widgets Qt5::Gui)

file(GLOB R RELATIVE ${CMAKE_SOURCE_DIR} "inc/*.qrc")
set(CMAKE_AUTORCC ON)
