include(CTest)

enable_testing()

set(TEST_HELP help)
add_test(
    NAME ${TEST_HELP}
    COMMAND $<TARGET_FILE:${BFCI_APP_TARGET}>
)

file(GLOB BF_PROGS "${CMAKE_SOURCE_DIR}/examples/*.bf")

foreach(BF_PROG IN LISTS BF_PROGS)
    get_filename_component(BF_PROG_NAME ${BF_PROG} NAME_WE)
    add_test(
        NAME ${BF_PROG_NAME}
        COMMAND $<TARGET_FILE:${BFCI_APP_TARGET}> ${BF_PROG}
    )
endforeach()

set_tests_properties(
    ${TEST_HELP}
    PROPERTIES
    WILL_FAIL TRUE
)
