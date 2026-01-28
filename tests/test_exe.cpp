#include "factorial.hpp"

#include <catch.hpp>

TEST_CASE("factorial", "[exe]") {
    REQUIRE(%%cpp_init_namespace%%::factorial(0) == 1);
    REQUIRE(%%cpp_init_namespace%%::factorial(1) == 1);
    REQUIRE(%%cpp_init_namespace%%::factorial(10) == 3'628'800);
}
