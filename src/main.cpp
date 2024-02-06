#include <fmt/format.h>
#include <project/config.hpp>

int main() {
    fmt::print(R"({}: {}

version v{}

Compiling on {} {} with {} {} compiler (using {})

Try editing the source code in ./src

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
        cpp_init::url);
}
