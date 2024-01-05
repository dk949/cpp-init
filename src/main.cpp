#include <fmt/format.h>
#include <project/config.hpp>

int main() {
    fmt::print(R"({}: {}

version v{}

Try editing the source code in ./src

Or adding a test in ./tests

Find more info at {}/wiki
)",
        project::name,
        project::description,
        project::version::full,
        project::url);
}
