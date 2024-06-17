cmake_minimum_required(VERSION "3.30.0")
project(PHPC)

set(CMAKE_CXX_STANDARD 23)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")

set(SRC ${CMAKE_CURRENT_SOURCE_DIR}/src/main.cpp)
set(OUT ${CMAKE_CURRENT_SOURCE_DIR}/build/version/)
set(EXEC PHPC)

add_executable(${EXEC} ${SRC})

foreach(VERSION release snapshot test beta alpha)
    add_custom_target(${VERSION}
        COMMAND ${CMAKE_CXX_COMPILER} ${CMAKE_CXX_FLAGS} -O${OPT_LEVEL} -o ${OUT}/${EXEC}_${VERSION}.exe ${SRC}
        COMMAND ${CMAKE_CXX_COMPILER} ${CMAKE_CXX_FLAGS} -O${OPT_LEVEL} -o ${OUT}/${EXEC}_${VERSION}.sh ${SRC}
    )
endforeach()

add_custom_target(run-test
    COMMAND ${CMAKE_COMMAND} -E env "OS=$<PLATFORM_ID>" ${OUT}/${EXEC} test.php
)

add_custom_target(clean_project
    COMMAND ${CMAKE_COMMAND} -E remove -f ${OUT}/${EXEC}
)
