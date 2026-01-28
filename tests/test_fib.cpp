#include "helper.hpp"

#include <catch.hpp>
#include <%%cpp_init_replace%%/fib.hpp>

TEST_CASE("fib", "[lib]") {
    REQUIRE(%%cpp_init_namespace%%::fib(0) == 1);
    REQUIRE(%%cpp_init_namespace%%::fib(1) == 1);
    REQUIRE(%%cpp_init_namespace%%::fib(10) == 55);
}

TEST_CASE("helper", "[lib]") {
    long long old = 20;
    REQUIRE(%%cpp_init_namespace%%::detail::myExchange(old, 27) == 20);
    REQUIRE(old == 27);
}
