#include <fmt/format.h>
#include <project/config.hpp>
#if defined(CPP_INIT_COMPILER_Clang) && CPP_INIT_COMPILER_VERSION_MAJOR <= 14
#    include <experimental/source_location>
#    define CPP_INIT_STD_EXPERIMENTAL std::experimental
#else
#    include <source_location>
#    define CPP_INIT_STD_EXPERIMENTAL std
#endif

int main() {
    fmt::print(R"({}: {}

version v{}

Compiling on {} {} with {} {} compiler (using {})

Try editing the source code in ./{}

Or adding a test in ./tests

Find more info at {}/wiki
)",
        // NOTE: the `cpp_init` namespace will change to whatever you set the project name to in vcpkg.json
        cpp_init::name,
        cpp_init::description,
        cpp_init::version::full,
        cpp_init::sys::os_str,
        cpp_init::sys::version,
        cpp_init::compiler::vendor_str,
        cpp_init::compiler::version::full,
        cpp_init::lang::std_str,
        // Clang <= 14 supporrt
        CPP_INIT_STD_EXPERIMENTAL::source_location::current().file_name(),
        cpp_init::url);
}
