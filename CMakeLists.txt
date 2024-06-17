cmake_minimum_required(VERSION "3.30.0")
project(Synergy)

set(CMAKE_CXX_STANDARD 23)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")

set(SRC ${CMAKE_CURRENT_SOURCE_DIR}/src/main.cpp)
set(OUT ${CMAKE_CURRENT_SOURCE_DIR}/build/version/)
set(EXEC Synergy)

add_executable(${EXEC} ${SRC})

foreach(DEVSTATE release snapshot test beta alpha)
    add_custom_target(${DEVSTATE}
        COMMAND ${CMAKE_CXX_COMPILER} ${CMAKE_CXX_FLAGS} -O${OPT_LEVEL} -o ${OUT}/${EXEC}-v1.0.0-${DEVSTATE}.exe ${SRC}
        COMMAND ${CMAKE_CXX_COMPILER} ${CMAKE_CXX_FLAGS} -O${OPT_LEVEL} -o ${OUT}/${EXEC}-v1.0.0-${DEVSTATE}.sh ${SRC}
    )
endforeach()

add_custom_target(run-test
    COMMAND ${CMAKE_COMMAND} -E env "OS=$<PLATFORM_ID>" ${OUT}/${EXEC} test.php
)

add_custom_target(clean_project
    COMMAND ${CMAKE_COMMAND} -E remove -f ${OUT}/${EXEC}
)
