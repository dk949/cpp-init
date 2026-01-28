#[[
    Exactly the same as find_program, but if the program is not found uses nix
    run to obtain the program.

    If REQUIRED is used, the function will only fail if the nix executable cannot be found.

    NIX_NAME <name> argument can be used if the nixpkgs version of the program
    differs from the one specified by the regular name argument.
]]
function(%%cpp_init_replace%%_find_program_nix var name)
    cmake_parse_arguments(PARSE_ARGV 0 %%CPP_INIT_REPLACE%%_ARG "" "NIX_NAME" "")
    list(REMOVE_ITEM %%CPP_INIT_REPLACE%%_ARG_UNPARSED_ARGUMENTS "REQUIRED")
    find_program(${var} ${name} ${%%CPP_INIT_REPLACE%%_ARG_UNPARSED_ARGUMENTS})
    if (NOT ("${${var}}" STREQUAL "${var}-NOTFOUND"))
        return()
    endif ()
    if ("REQUIRED" IN_LIST "${%%CPP_INIT_REPLACE%%_ARGV}")
        find_program(_%%cpp_init_replace%%_nix_exe nix REQUIRED)
    else ()
        find_program(_%%cpp_init_replace%%_nix_exe nix)
        if (${_%%cpp_init_replace%%_nix_exe} STREQUAL "_%%cpp_init_replace%%_nix_exe-NOTFOUND")
            return()
        endif ()
    endif ()
    if (NOT %%CPP_INIT_REPLACE%%_ARG_NIX_NAME)
        set(%%CPP_INIT_REPLACE%%_ARG_NIX_NAME ${name})
    endif ()
    set(${var}
        "${_%%cpp_init_replace%%_nix_exe} run nixpkgs#${%%CPP_INIT_REPLACE%%_ARG_NIX_NAME} -- "
        CACHE STRING "nix wrapped ${name} executable" FORCE
    )
endfunction ()
