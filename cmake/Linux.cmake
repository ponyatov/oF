if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
    add_executable(${APP} ${ALL_SOURCES})
    target_compile_definitions(${APP} PUBLIC "Linux")
    # qt_add_executable(${APP} # qt6

    add_link_options("-Wl,-E") # dl
    target_link_libraries(${APP} PRIVATE dl)
    if(READLINE_FOUND)
    target_link_libraries(${APP} PRIVATE ${READLINE_LIBRARY})
    endif()
endif()
