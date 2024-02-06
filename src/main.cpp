#include <fmt/format.h>
#include <project/config.hpp>

int main() {
    fmt::print(R"({}: {}

version v{}

Try editing the source code in ./src

Or adding a test in ./tests

Find more info at {}/wiki
)",
        cpp_init::name,
        cpp_init::description,
        cpp_init::version::full,
        cpp_init::url);
}
