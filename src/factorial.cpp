#include "factorial.hpp"

std::int64_t factorial(unsigned int i) {
    if (i == 0 || i == 1) return 1;
    return i * factorial(i - 1);
}
