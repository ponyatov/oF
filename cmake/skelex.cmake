find_package(FLEX     REQUIRED)
find_package(BISON    REQUIRED)
find_package(READLINE         )

FLEX_TARGET(lexer
    ${CMAKE_SOURCE_DIR}/src/${APP}.lex
                 ${CMAKE_SOURCE_DIR}/tmp/${APP}.lexer.cpp
    DEFINES_FILE ${CMAKE_SOURCE_DIR}/tmp/${APP}.lexer.hpp)

BISON_TARGET(parser
    ${CMAKE_SOURCE_DIR}/src/${APP}.yacc
                 ${CMAKE_SOURCE_DIR}/tmp/${APP}.parser.cpp)

add_flex_bison_dependency(lexer parser)
