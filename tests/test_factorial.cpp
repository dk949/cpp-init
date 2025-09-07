#include "factorial.hpp"

#include <catch.hpp>

TEST_CASE("Main test", "[factorial]") {

    REQUIRE(factorial(5) == 120);

    REQUIRE(factorial(10) == 3'628'800);
}

TEST_CASE("Edge cases", "[factorial]") {

    SECTION("0 case") {
        REQUIRE(factorial(0) == 1);
    }

    SECTION("1 case") {
        REQUIRE(factorial(1) == 1);
    }
}
