if(CMAKE_SYSTEM_NAME STREQUAL "Windows")

    # remote run path (over http)
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/tmp)
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/tmp)
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/tmp)

    add_executable(${APP} WIN32 ${ALL_SOURCES})
    target_compile_definitions(${APP} PUBLIC "Windows")

    # static build
    target_link_libraries(${APP} -static)
    set(CMAKE_C_FLAGS   "${CMAKE_C_FLAGS}   -s")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -s")

endif()
