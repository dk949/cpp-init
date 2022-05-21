#include <fmt/format.h>
#include <iostream>
#include <project/config.hpp>

int main() {
    fmt::print(
        R"(Project name: {}
Project description: {}
Project URL: {}
Project version:
    Major: {}
    Minor: {}
    Patch: {}
Project source dir: {}
)",
        cpp_init::project::name,
        cpp_init::project::description,
        cpp_init::project::url,
        cpp_init::project::version::major,
        cpp_init::project::version::minor,
        cpp_init::project::version::patch,
        cpp_init::project::dirs::src);



    {
        using namespace cpp_init::project::version;
        return cpp_init::project::version::full == fmt::format("{}.{}.{}", major, minor, patch) ? 0 : 1;
    }
}
