#[[
    Exactly the same as find_program, but if the program is not found uses nix
    run to obtain the program.

    If REQUIRED is used, the function will only fail if the nix executable cannot be found.

    NIX_NAME <name> argument can be used if the nixpkgs version of the program
    differs from the one specified by the regular name argument.
]]
function(find_program_nix var name)
    cmake_parse_arguments(PARSE_ARGV 0 ARG "" "NIX_NAME" "")
    list(REMOVE_ITEM ARG_UNPARSED_ARGUMENTS "REQUIRED")
    find_program(${var} ${name} ${ARG_UNPARSED_ARGUMENTS})
    if (NOT ("${${var}}" STREQUAL "${var}-NOTFOUND"))
        return()
    endif()
    if("REQUIRED" IN_LIST "${ARGV}")
        find_program(NIX_EXE nix REQUIRED)
    else()
        find_program(NIX_EXE nix)
        if(NIX_EXE-NOTFOUND)
            return()
        endif()
    endif()
    if(NOT ARG_NIX_NAME)
        set(ARG_NIX_NAME ${name})
    endif()
    set(${var} "${NIX_EXE} run nixpkgs#${ARG_NIX_NAME} -- " CACHE STRING "nix wrapped ${name} executable" FORCE)
endfunction()
