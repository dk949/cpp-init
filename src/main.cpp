#include "factorial.hpp"

#include <%%cpp_init_replace%%/config.hpp>
#include <%%cpp_init_replace%%/fib.hpp>

#include <cstdlib>
#if defined(%%CPP_INIT_REPLACE%%_COMPILER_GNU) && %%CPP_INIT_REPLACE%%_COMPILER_VERSION_MAJOR < 14
#    include <cstdio>
#    include <format>
#    define %%CPP_INIT_REPLACE%%_PRINTLN(fp, ...)                       \
        (void)std::fputs(std::format(__VA_ARGS__).c_str(), fp); \
        (void)std::fputc('\n', fp)
#else
#    include <print>
#    define %%CPP_INIT_REPLACE%%_PRINTLN(...) std::println(__VA_ARGS__)
#endif
#include <stdexcept>
#include <string>

int main(int argc, char *argv[]) {
    if (argc != 2) {
        %%CPP_INIT_REPLACE%%_PRINTLN(stderr, "Wrong number of arguments, expected 1, got {}", argc - 1);
        return 1;
    }
    auto const num = [arg = argv[1]]() {
        try {
            return std::stoll(arg);
        } catch (std::logic_error const &e) {
            %%CPP_INIT_REPLACE%%_PRINTLN(stderr, "Could not parse command line argument: {}", e.what());
            std::exit(1);  // NOLINT(concurrency-mt-unsafe)
        }
    }();

    %%CPP_INIT_REPLACE%%_PRINTLN(stdout, "{}! = {}", num, %%cpp_init_namespace%%::factorial(num));
    %%CPP_INIT_REPLACE%%_PRINTLN(stdout, "fib({}) = {}", num, %%cpp_init_namespace%%::fib(num));

    return 0;
}
