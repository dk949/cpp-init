#include "factorial.hpp"

#include <%%cpp_init_replace%%/fib.hpp>

#include <print>
#include <stdexcept>
#include <string>
#include <cstdlib>

int main(int argc, char *argv[]) {
    if (argc != 2) {
        std::println(stderr, "Wrong number of arguments, expected 1, got {}", argc - 1);
        return 1;
    }
    auto const num = [arg = argv[1]]() {
        try {
            return std::stoll(arg);
        } catch (std::logic_error const &e) {
            std::println(stderr, "Could not parse command line argument: {}", e.what());
            std::exit(1);  // NOLINT(concurrency-mt-unsafe)
        }
    }();

    std::println("{}! = {}", num, %%cpp_init_replace%%::factorial(num));
    std::println("fib({}) = {}", num, %%cpp_init_replace%%::fib(num));

    return 0;
}
