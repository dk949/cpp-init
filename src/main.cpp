#include <fmt/format.h>
#include <project/config.hpp>

int main() {
    fmt::print("{}: {} \n"
               "\n"
               "version v{}\n"
               "\n"
               "Try editing the source code in {}\n"
               "\n"
               "Find more info at {}/wiki\n"
               "\n",
        project::name,
        project::description,
        project::version::full,
        project::dirs::src,
        project::url);
}
